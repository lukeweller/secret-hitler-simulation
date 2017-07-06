% fascistClass.m
% A class that creates a player character

classdef fascistPlayer < handle
    properties
        strategy = '';
        playerNumber = 0; 
        % strategy and playerNumber defined when function "obj" is called
        
        suspicion = zeros(1,5); % Suspicion of each player being fascist
           killPlayer = 0;
           nomPlayer = 0;% Who they are nominating 
    end
    
    methods
        
        % Function to define player object
        function obj = fascistPlayer(playerNum, strat)
            obj.strategy = strat;           % Define strategy
            obj.playerNumber = playerNum;   % Define player number
            
            obj.killPlayer = randi([1,5]);
            while obj.killPlayer == obj.playerNumber
                obj.killPlayer = randi([1,5]);
            end
            
            obj.nomPlayer = randi([1,5]);
            while obj.nomPlayer == obj.playerNumber
                obj.nomPlayer = randi([1,5]);
            end
            
        end
        
        % Function update suspicion that a player, obj, has of another
        % player, playerNum.
       
        
        % Function players vote ja(yes) or no based on suspicion levels
        function playerVote = vote(obj, playerNum,numLib,numFac,presCounter)
            switch obj.strategy
                case '1'
                    if playerNum > 3
                        playerVote = true;
                    else
                        playerVote = false;
                    end
                case '2'
                    if playerNum > 3
                        playerVote = true;
                    else
                        if numLib <3
                            playerVote = true;
                        else
                            
                            playerVote = false;
                        end
                        if presCounter > 3
                            playervote = true;
                        end
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
                    
                        playerNom = 5;
                case '2'
                    if numLib < 3
                        playerNom = randi(5);
                         if playerNom == obj.playerNumber
                           while playerNom == obj.playerNumber || playerNom == nomChance ...
                                  || playerNom == deadPlayer || playerNom == deadPlayer2
                            playerNom = randi(5);
                           end
                         end
                    else
                        playerNom = 5;
                    end
                case '3'
                    playerNom = randi(5);
                    while playerNom == obj.playerNumber
                        playerNom = randi(5);
                    end
            end
        end
        
        function playerKill = kill(obj, deadPlayer)
            switch obj.strategy
                case '1'
                    
                    playerKill = randi(3);
                    while playerKill == deadPlayer
                        playerKill = randi(3);
                    end
                    
                case '2'
                    playerKill = randi(3);
                    while playerKill == deadPlayer
                        playerKill = randi(3);
                    end
                case '3'
                    playerKill = randi(5);
            end
        end
        function [infoArray1] = passCards(obj,cards,nomChance)
            sortedCards = sort(cards);
            
            switch obj.strategy
                case '1'
                    twoCards = sortedCards(1:2);
                    if sortedCards(1:2) == [0,0]
                        claimCards = [0,0,0];
                    else
                        claimCards = sortedCards;
                    end
                    infoArray1 = {twoCards,claimCards};
                case '2'
                    if sortedCards(2) == 0;
                    twoCards = sortedCards(1:2);
                    claimCards = [0,0,0];
                    else
                        twoCards = sortedCards(2:3); %change later when played array is added
                        claimCards = sortedCards;
                        
                    end
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
                    playCard = sortedCards(1);
                    claimCard = sortedCards;
                    infoArray2 = {playCard,claimCard};

                case '2'
                    playCard = sortedCards(1);
                    claimCard = [0,0];
                    infoArray2 = {playCard,claimCard};
                case '3'
                    playCard = sortedCards(randi(2));
                    claimCard = [randi(2)-1,randi(2)-1];
                    infoArray2 = {playCard, claimCard};  
            end
            
        end


    end
end