function  [shuffDeck] =  makeDeckF(numLib,numFac)

vectorDeck = [1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0];
vectorDeck = vectorDeck(numLib+1:16-numFac);
% rng('shuffle');

shuffIndex = randperm(length(vectorDeck));

shuffDeck = [];

%% Shuffle
% while length(vectorDeck)>= 3
%     
for iCnt = 1:length(vectorDeck)
    
    shuffDeck(iCnt) = vectorDeck(shuffIndex(iCnt));
end 

