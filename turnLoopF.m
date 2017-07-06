function [gameCnt, fascistwin, hitCount, hitDead] = turnLoopF(handles)
numGames = str2double(handles.numGamesText.String);
flipsCount = 0;
hitDead = 0;
fascistwin = 0;
hitCount = 0;


for gameCnt = 1:numGames
    
    turnCounter = 0;
    flipHappen = 0;
    totalFlipCount = 0;
    
    %% First Turn
    
    if turnCounter == 0
        numLib = 0;
        numFac = 0;
        shuffDeck = makeDeckF(numLib,numFac); % shuffle cards
        deckCount = 1;
        hitNom = 0;
        hitLive = 1;
        presCounter = randi([0,4],1);
        playerArray = {liberalPlayer(1,num2str(handles.p1pop.Value)),...
            liberalPlayer(2,num2str(handles.p2pop.Value)),...
            liberalPlayer(3,num2str(handles.p3pop.Value)),...
            fascistPlayer(4,num2str(handles.p4pop.Value)),...
            hitlerPlayer(5,num2str(handles.p5pop.Value))};
        nomChance = 0;
        % input strategies from gui
        govCounter = 0;
        killCount = 0;
        deadPlayer = 0;
        deadPlayer2 = 0;
        rng('shuffle');
    end
    
    %% Normal Turn
    
    while numLib < 5 && numFac < 6  && hitLive == 1 && hitNom == 0; % win conditions
        turnCounter = turnCounter + 1;
        
        presCounter = presCounter + 1;
        
        if presCounter > 5
            presCounter = presCounter - 5;
        end
        
        while presCounter == deadPlayer || presCounter == deadPlayer2;
            presCounter = presCounter + 1;
            
            if presCounter > 5
                presCounter = presCounter - 5;
            end
        end
        
        pres = playerArray(presCounter); % player becomes president
        
        nomChance = playerArray{presCounter}.nomChance(numLib,numFac,nomChance,...
            deadPlayer,deadPlayer2); % pres nominates chancellor
        
        % players vote
        jaCount = 0;
        for iCnt = 1:5
            if iCnt == deadPlayer || iCnt == deadPlayer2
            else
                if vote(playerArray{iCnt},nomChance,numLib,numFac,presCounter)
                    
                    jaCount = jaCount+1;
                    voteArray(iCnt) = 1;
                else
                    voteArray(iCnt) = 0;
                end
            end
        end
        totCount = length(voteArray);
        if jaCount > totCount/2 %Checks to see if governement passes
            govPass = 1;
        else
            govPass = 0;
        end
        for iCnt = 1:3
            if iCnt == deadPlayer || iCnt == deadPlayer2
            else
            updateArray(playerArray{iCnt},voteArray) %update liberal suspicion levels
            end
        end
        
        if govPass == 1;
            if govCounter > 0
                govCounter = govCounter - 1;
            end
            if numFac > 3 && nomChance == 5; % Checks for Hitler chancellorship after 3 fascists
                hitNom = 1;
            end
            if hitNom == 1;
                
            else
                drawArray = shuffDeck(1:3); % president draws 3
                deckCount = deckCount*3;
                shuffDeck = shuffDeck(4:length(shuffDeck)+ 3 - deckCount); % removes drawn cards from the deck
                if length(shuffDeck) < 3
                    shuffDeck = makeDeckF(numLib,numFac); % reshuffles with discarded cards
                    deckCount = 1;
                    
                else
                    deckCount = deckCount/3 +1;
                end
                
                infoArray1 = playerArray{presCounter}.passCards(drawArray,nomChance);% discards one, passes two
                infoArray2 = playerArray{nomChance}.playCard(infoArray1{1},numLib);% chancellor discards one, plays the other
                
                if infoArray2{1}
                    
                    numLib = numLib +1;
                else
                    numFac = numFac +1;
                    if numFac == 4 && killCount == 0;
                        
                        deadPlayer = playerArray{presCounter}.kill(deadPlayer); % kill
                        killCount = killCount + 1;
                    elseif numFac == 5 && killCount == 1;
                        deadPlayer2 = playerArray{presCounter}.kill(deadPlayer); % kill
                        killCount = killCount + 1;
                    end
                    if deadPlayer == 5 || deadPlayer2 == 5
                        
                        hitLive = 0;
                    end
                    
                    for iCnt = 1:3
                        if iCnt == deadPlayer || iCnt == deadPlayer2
                        else
                        playerArray{iCnt}.updateArray2(presCounter,nomChance,infoArray1{2},infoArray2{1});
                        end
                    end
                end
                
            end
        else
            govCounter = govCounter + 1; % If government fails, increases counter
        end
        
        if govCounter == 3 % After 3 consecutive fails, the top card is played
            if shuffDeck(1) == 1
                
                numLib = numLib +1;
            else
                numFac = numFac +1;
            end
            shuffDeck = shuffDeck(2:length(shuffDeck));
            
            if length(shuffDeck) < 3
                shuffDeck = makeDeckF(numLib,numFac); % reshuffles with discarded cards
                deckCount = 1;
            else
            end
            
            
            govCounter =0;
            flipsCount = flipsCount + 1;
            fliphappen = 1;
        else
        end
        
        % update arrays
        
        if numFac == 6
            fascistwin = fascistwin +1;
            
        end
        if hitNom ==1
            hitCount = hitCount +1;
            fascistwin = fascistwin +1;
        end
        if hitLive == 0;
            hitDead = hitDead + 1;
        end
        
    end
     if flipHappen == 1;
        totalFlipCount = totalFlipCount + 1;
    end
end
% if(handles.graphPopup.Value == 1)
%     pie(handles.gameGraph,[numGames-fascistwin fascistwin])
%     title('Win Percentage');
%     colormap([0 0 1; 1 0 0]);
% end
% if(handles.graphPopup.Value == 2)
%     labels = {'Hitler Elected', 'Hitler Killed', 'Card Fascist Win', 'Card Liberal Win'};
%     pie(handles.gameGraph, [hitCount, hitDead, fascistwin-hitCount, gameCnt-fascistwin-hitDead],labels); 
% end



