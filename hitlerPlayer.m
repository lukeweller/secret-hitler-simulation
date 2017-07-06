% hitlerPlayer.m
% A class that creates a player character

classdef hitlerPlayer<handle
    properties
        strategy = '';
        playerNumber = 5;
        suspicion = zeros(1,5);
        %        suspicion(1,playerNumber) = 0; % should this be in properties
         killPlayer = 0;
%         nomPlayer = 0;
        
    end
    
    
    methods
        function obj = hitlerPlayer(playerNum, strat)
            obj.strategy = strat;
            obj.playerNumber = playerNum;
            %             obj.killPlayer = randi([1,5]);
            %
            %             I think this is early code
            %             that needs to be deleted
            %
            %               obj.nomPlayer = randi([1,5]);
            %             while obj.killPlayer == obj.playerNumber
            %                 obj.killPlayer = randi([1,5]);
            %             end
            %             while obj.nomPlayer == obj.playerNumber
            %                 obj.nomPlayer = randi([1,5]);
            %             end
                     end
            
         
            
            function playerKill = kill(obj,deadPlayer)
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
                        while playerKill == deadPlayer
                            playerKill = randi(5);
                        end
                end
            end
            
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
                            if numLib == 4
                                playerVote = false;
                                
                            else
                                playerVote = true;
                                
                            end
                        end
                        if presCounter > 3
                            playerVote = true;
                        end
                    case '3'
                        n = randi(2);
                        if n == 1
                            playerVote = true;
                        else
                            playerVote = false;
                        end
                end
            end
            function playerNom = nomChance(obj,numLib,numFac,nomChance,deadPlayer,deadPlayer2)
                switch obj.strategy
                    case '1'
                        
                        playerNom = 4;
                        while playerNom == nomChance || playerNom == deadPlayer...
                                || playerNom == deadPlayer2
                            playerNom = randi(4);
                        end
                        
                    case '2'
                        if numLib > 2
                            
                            playerNom = 4;
                            if nomChance == 4
                                playerNom = randi(3);
                                while playerNom == deadPlayer || playerNom == deadPlayer2
                                    playerNom = randi(4);
                                end
                            end
                        else
                            playerNom = randi(4);
                            while playerNom == nomChance
                                playerNom = randi(4);
                            end
                        end
                    case '3'
                        playerNom = randi(4);
                        while playerNom == nomChance
                            playerNom = randi(4);
                        end
                end
            end
            function infoArray1 = passCards(obj,cards,nomChance)
                sortedCards = sort(cards);
                
                switch obj.strategy
                    case '1'
                        twoCards = sortedCards(1:2);
                        if sortedCards(2) == 1
                            claimCards = sortedCards;
                        else
                            claimCards = [0,0,0];
                        end
                        infoArray1 = {twoCards,claimCards};
                        
                    case '2'
                        if nomChance == 4
                            twoCards = sortedCards(1:2);
                            if sortedCards(2) == 1
                                claimCards = [0,0,1];
                            else
                                claimCards = [0,0,0];
                            end
                        else
                            twoCards = sortedCards(2:3);
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
            
            
            function infoArray2 = playCard(obj,twoCards,numLib)
                sortedCards = sort(twoCards);
                
                switch obj.strategy
                    case '1'
                        playCard = sortedCards(1);
                        claimCard = [0,0];
                        infoArray2 = {playCard,claimCard};
                        
                    case '2'
                        if numLib == 4
                            playCard = sortedCards(1);
                            claimCard = [0,0];
                        else
                            playCard = sortedCards(2);
                            claimCard = sortedCards;
                            
                        end
                        infoArray2 = {playCard,claimCard};
                    case '3'
                        playCard = sortedCards(randi(2));
                        claimCard = [randi(2)-1,randi(2)-1];
                        infoArray2 = {playCard, claimCard};
                end
                
                
            end
            
            
        end
    end
