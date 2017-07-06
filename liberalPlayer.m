% liberalClass.m
% A class that creates a player character

classdef liberalPlayer < handle
    properties
        strategy = '';
        playerNumber = 0;
        suspicion = zeros(1,5);
        % suspicion(playerNumber) = 0; % should this be in properties ?\_(?)_/? 
        killPlayer = 0;
         
    end
    
    methods
        function obj = liberalPlayer(playerNum, strat)
            obj.strategy = strat;
            obj.playerNumber = playerNum;
        end
        
        function updateArray(obj, voteArray) % update suspicion levels after voting
            
            switch obj.strategy
                case '1' % trusting liberal
                   for iCnt = 1:5
                       if iCnt == obj.playerNumber
                       else
                    if voteArray(obj.playerNumber) == voteArray(iCnt) 
                        
                        if obj.suspicion(iCnt) >= 1
                            
                            obj.suspicion(iCnt) = obj.suspicion(iCnt) - 1;
                        end
                    else
                        obj.suspicion(iCnt) = obj.suspicion(iCnt) + 2;
                    end
                       end
                   end
                case '2' % suspicious liberal
                    for iCnt = 1:5
                        if iCnt == obj.playerNumber
                        else
                    if voteArray(obj.playerNumber) == voteArray(iCnt) 
                        
                        if obj.suspicion(iCnt) >= 1
                            
                            obj.suspicion(iCnt) = obj.suspicion(iCnt) - 1;
                        end
                    else
                        obj.suspicion(iCnt) = obj.suspicion(iCnt) + 1;
                    end
                        end
                    end
                case '3' % randomly assign suspicion values, skipping self
                    for iCnt = 1:5
                        if iCnt ~= obj.playerNumber % skip self
                            randNum = randi(2);
                            if(randNum == 1)
                                obj.suspicion(iCnt) = obj.suspicion(iCnt)-1;
                            else
                                obj.suspicion(iCnt) = obj.suspicion(iCnt)+1;
                            end
                        end
                    end
            end
        end
        
        function updateArray2(obj, presNum, chanceNum, cardsClaimed, cardPlayed)   % updates after cards played
           switch obj.strategy
               case '1' % not suspicious (lying matters)
                  if obj.playerNumber == chanceNum
                  else
                       if cardPlayed == 1 && obj.suspicion(chanceNum) >= 0 %% Liberal played
                           obj.suspicion(chanceNum) = obj.suspicion(chanceNum)-1;
                       else %% Fascist played
                           if cardsClaimed(1) == 1 || cardsClaimed(2) == 1 || cardsClaimed(3) == 1
                               obj.suspicion(chanceNum) = obj.suspicion(chanceNum)+7;
                           end
                       end
                  end
                   
               case '2' % moderately suspicious (lying doesn't matter)
                   if obj.playerNumber == chanceNum 
                   else
                       if cardPlayed == 1 && obj.suspicion(chanceNum) >= 0 %% Liberal played
                           obj.suspicion(chanceNum) = obj.suspicion(chanceNum)-1;
                       else
                           
                           obj.suspicion(chanceNum) = obj.suspicion(chanceNum)+1;
                           if obj.playerNumber == presNum
                           else
                           obj.suspicion(presNum) = obj.suspicion(presNum)+7;
                           end
                       end
                   end
                
               case '3' % random
                   if chanceNum == obj.playerNumber
                   else
                       n = randi(2);
                       if n == 1 && obj.suspicion(chanceNum) >= 0
                           obj.suspicion(chanceNum) = obj.suspicion(chanceNum)-1;
                       else
                           obj.suspicion(chanceNum) = obj.suspicion(chanceNum)+7;
                       end
                   end
                   
           end
        end

            
        
        function playerVote = vote(obj, playerNum,numLib,numFac,presCounter)
            switch obj.strategy
                case '1'
                    if(obj.suspicion(playerNum) < 3)
                        playerVote = true;
                    else
                        playerVote = false;
                    end
                case '2'
                    if(obj.suspicion(playerNum) < 2)
                        playerVote = true;
                    else
                        playerVote = false;
                    end
                case '3'
                    if(obj.suspicion(playerNum) < 9)
                        playerVote = true;
                    else
                        playerVote = false;
                    end
            end
        end
        
        function playerNom = nomChance(obj,numLib,numFac,nomChance,deadPlayer,deadPlayer2)
            switch obj.strategy
               case '1'
                    %Set threshold value that defines when to avoid
                    %nominating someone
                    suspicionThreshold = 3;
                    
                case '2'
                    suspicionThreshold = 2;
                case '3'
                    %Set to 100 so that nobody ever reaches it, so the
                    %funciton will always randomly choose who to nominate
                    %(see the if statement after the for loop below)
                    suspicionThreshold = 100;
            end
            nomArray = [0];
            element = 1;
            for iCnt = 1:5
               if iCnt == obj.playerNumber || iCnt == nomChance ...
                       || iCnt == deadPlayer || iCnt == deadPlayer2
                   
               else
                if obj.suspicion(iCnt) < suspicionThreshold
                    nomArray(element) = iCnt;
                    element = element+1;
                end
               end
            end
            if nomArray ~= [0]
                playerNom = nomArray(randi([1,length(nomArray)]));
            else
                minSuspicionValue = min(obj.suspicion);
                for iPos = 1:5
                    if obj.suspicion(iPos) == minSuspicionValue
                       playerNom = iPos;
                       if playerNom == obj.playerNumber
                           while playerNom == obj.playerNumber
                            playerNom = randi(5);
                           end
                       end
                    end
                end
            end
        end
        
      function playerKill = kill(obj,deadPlayer)
            switch obj.strategy
                case '1'
                    maxSuspicionValue = max(obj.suspicion);
                    for iPos = 1:5
                        if iPos == obj.playerNumber
                            
                        else
                            
                            if obj.suspicion(iPos) == maxSuspicionValue
                                playerKill= iPos;
                                
                            end
                            
                        end
                    end
                    
                    
                case '2'
                    sortSusp = sort(obj.suspicion);
                    for iCnt = 1:5
                        if iCnt == deadPlayer
                            if obj.suspicion(iCnt) == sortSusp(4)
                                for iCnt =  1:5
                                    if obj.suspicion(iCnt) == max(sortSusp)
                                        playerKill = iCnt;
                                    end
                                end
                            end
                        else
                            
                            if obj.suspicion(iCnt) == sortSusp(4)
                                playerKill = iCnt;
                            end
                        end
                    end
                    
                case '3'
                    playerKill = randi(5);
            end
        end

        
        function [infoArray1]= passCards(obj,cards,nomChance)
            sortedCards = sort(cards);
            
            switch obj.strategy
                case '1'
                    if sortedCards(1) == 1
                        twoCards = sortedCards(2:3);
                    else
                        twoCards = [sortedCards(1),sortedCards(3)];
                    end
                    claimCards = sortedCards;
                    infoArray1 = {twoCards,claimCards};
                case '2'
                    if sortedCards(1) == 1
                        twoCards = sortedCards(2:3);
                    else
                        twoCards = [sortedCards(2),sortedCards(3)];
                    end
                    claimCards = sortedCards;
                    infoArray1 = {twoCards,claimCards};
                case '3'
                    n = randi(3); % first random card
                    x = 1;
                    while x ~= n
                        x = randi(3); % second random card
                    end
                    twoCards = [sortedCards(n),sortedCards(x)];
                    claimCards = [randi(2)-1,randi(2)-1,randi(2)-1]; % claim random cards
                    infoArray1 = {twoCards,claimCards};
            end
            
            
        end


        function [infoArray2] = playCard(obj,twoCards,numLib)
            sortedCards = sort(twoCards);
            
            switch obj.strategy
                case '1'
                    playCard = sortedCards(2);
                    claimCard = sortedCards;
                    infoArray2 = {playCard,claimCard};

                case '2'
                    playCard = sortedCards(2);
                    claimCard = sortedCards;
                    infoArray2 = {playCard,claimCard};
                case '3'
                    playCard = sortedCards(randi(2));
                    claimCard = [randi(2)-1,randi(2)-1];
                    infoArray2 = {playCard, claimCard};
            end
            
        end


        
    end
end