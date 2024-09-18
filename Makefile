NAME = minishell

CC = clang

CFLAGS = -Wall -Wextra -Werror -I inc/ -I libft/inc/

LIBFT = -L libft -lft

HEADER = minishell.h

BUILTINS = cd echo env exit export pwd unset

ENV = env get_env sort_env shlvl

EXEC = bin builtin exec

MAIN = minishell redir singal

PARSING = line tokens expansions

TOOLS = fd free token expansions parsing

SRC =

OBJ = $(SRC:c=o)

all: $(NAME)

$(NAME): $(OBJ)
		@echo "\n"
		@make -C libft/
		@echo "\033[0;32mCompiling minishell..."
		@$(CC) $(CFLAGS) -o $(NAME) $(OBJ) $(LIBFT)
        @echo "\n\033[0mDone !"

%.o: %.c
	@printf "\033[0;33mGeneraring minishell objects... %-33.33s\r" $@
	@${CFLAGS} -c $< -o $@

clean:
	@echo "\033[0;31mCleaning libft..."
	@make clean -C libft/
	@echo "\nRemoving binaries..."
	@rm -f $(OBJ)
	@echo "\033[0m"

fclean:
	@echo "\033[0;31mCleaning libft..."
	@make fclean -C libft/
	@echo "\nDeleting objects..."
	@rm -f $(OBJ)
	@echo "\nDeleting executable..."
	@rm -f $(NAME)
	@echo "\033[0m"

re: fclean all

test: all
		./minishell
norm:
		norminette $(SRC) includes/$(HEADER)

.PHONY: clean fclean re test norm
