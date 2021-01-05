clc; 

seed = 28; %initialized seed as 28 as it is last 2 digits
Simulation = 1; %now the simulation is one
while Simulation <101 %need to loop the simulation 100 times so <101
    payoff_player = zeros(1,100); %preallocating memory to calculate payoff for player
    payoff_opponent = zeros(1,100); %preallocating memory to calculate payoff for opponent
Generation = 1; %now generation is 1
generation_payoff = zeros(20,100); %preallocaating memory to keep track of payoff over 100 generations
generation_average = zeros (20,100);%preallocaating memory to keep track of payoff average over 100 generations
matrixpayoff = zeros(20,20); %keeping track of players playing with 19 opponents 100 times
rng(seed,'Twister'); %generating the seed and setting up the geerator
LT = randi(2,20,5)-1; %randomly initializing strategies two 20 players
LT(:,5)=0; %making the last column zero so that i can put the total score here and
           %find the best 10 players

%as we have in total 8 strategies just assigning it a number so that later i can analyze the player/opponents move           
for row=1:20 
if LT(row,2)==0 && LT(row,3)==0 && LT(row,4)==0
    LT(row,1)=1;
elseif LT(row,2)==0 && LT(row,3)==0 && LT(row,4)==1
    LT(row,1)=2;
elseif LT(row,2)==0 && LT(row,3)==1 && LT(row,4)==0
    LT(row,1)=3;
elseif LT(row,2)==0 && LT(row,3)==1 && LT(row,4)==1
    LT(row,1)=4;
elseif LT(row,2)==1 && LT(row,3)==0 && LT(row,4)==0
    LT(row,1)=5;
elseif LT(row,2)==1 && LT(row,3)==0 && LT(row,4)==1
    LT(row,1)=6;
elseif LT(row,2)==1 && LT(row,3)==1 && LT(row,4)==0
    LT(row,1)=7;
else
    LT(row,1)=8;
end
end
%starting the loop for 100 generations
while Generation < 101
ply = 1; %first player
while (ply < 21) %loop for 20 players
opp = 1;   %first opponent 
while (opp < 21) %loop for 20 opponents
i = 1; %First round
player_move=zeros(1,100); %to keep track of players move
opponent_move=zeros(1,100); %to keep track of opponents move
total_payoff_player = 0; %to keep track of total payoff of players
total_payoff_opponent = 0; %to keep track of total payoff of opponents
while i < 101 %loop for 100 rounds
%using switch case to see which strategy is the player 1 choosing    
player = LT(ply,1); 
switch (player)
    case 1%like if it is 1st strategy that is 000 means all defect if it is the initial round
          %playerwill choose 0 and if it is round 2-100 then players move
          %will be depending on opponents previous move like what he choose
          %in this strategy if he chooses defect or cooperate doesn't
          %matter because it is all defect strategy same is for all the
          %other cases. according to the strategy analyzing players move.
      if i == 1 %if initial round
        player_move(i)=0;  
      else 
          if opponent_move(i-1)== 0 || opponent_move(i-1)==1%checking opponents previous move
              player_move(i) = 0;
          end
      end
%----------Que 2 part 1----------%

% I used a = randi(4,1) to introduce 25% noise
% I used a = randi(20,1) to introduce 5% noise
% I used a = randi(10,1) to introduce 10% noise
% I used a = randi(100,1) to introduce 1% noise
% I used a = randi(2,1) to introduce 50% noise
      
%       a = randi(100,1);%introducing 50%noise like there is a 50% chance that if player
%                      %is choosing to defect he will cooperate and if he is
%                      %choosing to cooperate he will defect 
%       if a == 1
%         player_move(i)= not(player_move(i));%fliping the choice
%       end
    case 2
       if i == 1
        player_move(i)=0; 
       else 
           if opponent_move(i-1)== 0
               player_move(i) = 0;
           else 
               player_move(i) = 1;  
           end
       end
%         a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
    case 3
        if i == 1
        player_move(i)=0;  
        else 
           if opponent_move(i-1)== 1
              player_move(i) = 1;
           else 
              player_move(i) = 0;  
           end
        end
%           a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
    case 4
        if i == 1
        player_move(i)=0;  
        else
            if opponent_move(i-1)== 0
                player_move(i) = 1;
            else 
                player_move(i) = 1;  
            end
        end
%          a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
    case 5
        if i == 1
        player_move(i)=1;  
        else
            if opponent_move(i-1)== 0
                player_move(i) = 0;
            else 
                player_move(i) = 0;  
            end
        end
%          a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
    case 6
        if i == 1
        player_move(i)=1;  
        else
            if opponent_move(i-1)== 0
                player_move(i) = 0;
            else 
                player_move(i) = 1; 
            end
        end
%          a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
    case 7
        if i == 1
          player_move(i)=1;  
        else
           if opponent_move(i-1)== 1
              player_move(i) = 1;
           else 
              player_move(i) = 0; 
           end
        end
%          a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
%           
     case 8
        if i == 1
          player_move(i)=1;  
        else 
           if opponent_move(i-1)== 0 || opponent_move(i-1)==1
               player_move(i) = 1;
           end
        end
%          a = randi(100,1);
%       if a == 1
%         player_move(i)= not(player_move(i));
%       end
end

opponent = LT(opp,1); %sitch case to check opponents strategy so that we can analyze 
                      %what is the opponents move
switch (opponent)
   case 1
      if i == 1
        opponent_move(i)=0;  
      else 
          if player_move(i-1)== 0 || player_move(i-1)==1
              opponent_move(i) = 0;
          end
      end
%        a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 2
       if i == 1
        opponent_move(i)=0;  
       else 
           if player_move(i-1)== 0
               opponent_move(i) = 0;
           else 
               opponent_move(i) = 1;  
           end
       end
%         a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 3
        if i == 1
        opponent_move(i)=0;  
        else 
           if player_move(i-1)== 1
              opponent_move(i) = 1;
           else 
              opponent_move(i) = 0;  
           end
        end
%           a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 4
        if i == 1
        opponent_move(i)=0;  
        else
            if player_move(i-1)== 0
                opponent_move(i) = 1;
            else 
                opponent_move(i) = 1;  
            end
        end
%          a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 5
        if i == 1
        opponent_move(i)=1;  
        else
            if player_move(i-1)== 0
                opponent_move(i) = 0;
            else 
                opponent_move(i) = 0;  
            end
        end
%          a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 6
        if i == 1
        opponent_move(i)=1;  
        else
            if player_move(i-1)== 0
                opponent_move(i) = 0;
            else 
                opponent_move(i) = 1; 
            end
        end
%          a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
    case 7
        if i == 1
          opponent_move(i)=1;  
        else
           if player_move(i-1)== 1
              opponent_move(i) = 1;
           else 
              opponent_move(i) = 0; 
           end
        end
%          a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
          
     case 8
        if i == 1
          opponent_move(i)=1;  
        else 
           if player_move(i-1)== 0 || player_move(i-1)==1
               opponent_move(i) = 1;
           end
        end
%          a = randi(100,1);
%       if a == 1
%         opponent_move(i)= not(opponent_move(i));
%       end
end
%calculating payoffs according to the moves they choose
    if player_move(i) == 0 && opponent_move(i) == 0
        payoff_player(i) = 1;
        payoff_opponent(i) = 1;
    elseif player_move(i) == 0 && opponent_move(i) == 1
        
 %----------Que 2 part 2-------------%
 
        payoff_player(i) = 2;    %changing payoff of T to -1,-0.5,+1,+0.5 to R 
        payoff_opponent(i) = 0;  % if we change payoff to 2 or 2.5 no longer one 
                                 %one condtion is satisfied while if we use
                                 %3.5 or 4 still both conditions satisfies.
    elseif player_move(i) == 1 && opponent_move(i) == 0
        payoff_player(i) = 0;
        payoff_opponent(i) = 2;%changing payoff of T to -1,-0.5,+1,+0.5 to R 
    else
        payoff_player(i) = 3;
        payoff_opponent(i) = 3;
    end
    total_payoff_player = total_payoff_player + payoff_player(i);%calculating total for player
    total_payoff_opponent = total_payoff_opponent + payoff_opponent(i);%calculating total for opponent
    i = i +1; %incrementing round
    matrixpayoff(ply,opp) = total_payoff_player; %keeping track of players score
    matrixpayoff(opp,ply) = total_payoff_opponent;%keeping track of opponents score
    matrixpayoff(1:1+size(matrixpayoff,1):end) = 0;%making the diagonal zero to make sure player is not playing with itself
end
opp = opp + 1; %increment opponent
end
ply = ply + 1;   %increment player
end


total_payoff= sum(matrixpayoff,2); %calculating total payoff
LT(:,5)=total_payoff; %putting in lookup table

%finding the best 10 for that we will sort the array in descending order
%based on the 10 highest scores
LT = sortrows(LT,5,'descend');

%keeping track of scores for each gneration
generation_payoff(:,Generation)=LT(:,5);

%keeping track of average for each generation
generation_average(:,Generation)=LT(:,5)/1900;

%calculating highest average
highest_avg = max(generation_average);


% to replace the 11-20 rows with first best 10
LT(11:20,:) = LT(1:10,:);



%mutation
if Generation > 1 && Generation < 101 %as first generation won't mutate
a = randi(100,1); % 1% chance for mutation
if a == 1

for row = 1:20 %applying mutation to the strategies so that it has one percent chance to change 
LT(row,5)=0;
LT(row,2)=not(LT(row,2)); %changing strategies if it is cooperate then defect 
                          %if it is defect then cooperate so using not
                          %operator
LT(row,3)=not(LT(row,3));
LT(row,4)=not(LT(row,4));

%assigning numbers
if LT(row,2)==0 && LT(row,3)==0 && LT(row,4)==0
    LT(row,1)=1;
elseif LT(row,2)==0 && LT(row,3)==0 && LT(row,4)==1
    LT(row,1)=2;
elseif LT(row,2)==0 && LT(row,3)==1 && LT(row,4)==0
    LT(row,1)=3;
elseif LT(row,2)==0 && LT(row,3)==1 && LT(row,4)==1
    LT(row,1)=4;
elseif LT(row,2)==1 && LT(row,3)==0 && LT(row,4)==0
    LT(row,1)=5;
elseif LT(row,2)==1 && LT(row,3)==0 && LT(row,4)==1
    LT(row,1)=6;
elseif LT(row,2)==1 && LT(row,3)==1 && LT(row,4)==0
    LT(row,1)=7;
else
    LT(row,1)=8;
end
end    
end
end
Generation = Generation +1; %incrementing generation
end
plot(highest_avg); %plotting highest average payoff
xlim ([0 100]);
ylim([0 5]);
title('Best generational Strategy average payoff');
xlabel('Generation'); 
ylabel('highest Average Payoffs');
hold on
seed = seed + 1; %incrementing seed as we have to use diff seed number for each trial
Simulation = Simulation + 1; %incrementing number of simulation
end 

