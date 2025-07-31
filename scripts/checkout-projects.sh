mkdir -p ~/projects
cd ~/projects

if [[ ! -d budgeting ]]; then
    git clone https://github.com/Grim-Jokes/budgeting
fi

if [[ ! -d meal-planner ]]; then
    git clone git@github.com:Grim-Jokes/meal-planner.git
fi

if [[ ! -d gantt-chart ]]; then
    git clone git@github.com:Grim-Jokes/gantt-chart.git
fi 