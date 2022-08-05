SRCS = main.c parsing.c fdf_cleanup.c fdf_draw.c fdf_init.c	\
		fdf_input.c fdf_map.c fdf_utils.c parsing_utils.c

OBJS = $(SRCS:.c=.o)

CC = gcc
CFLAGS = -Wextra -Wall -Werror -Ilibft -Imlx_macos -I/usr/include

NAME = fdf
INCLUDES = ./libft

%o: %c
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJS)
	$(MAKE) -C ./libft
	$(MAKE) -C ./mlx_macos
	$(CC) $(OBJS) -Llibft -lft -Lmlx_macos -lmlx -L/usr/lib -lm -framework OpenGL -framework AppKit -o $(NAME)
#$(CC) $(OBJS) -lm -Llibft -lft -Lminilibx-linux -lmlx -L/usr/lib -Iminilibx-linux -lXext -lX11 -lm -lz -o $(NAME) -Ilibft

clean:
	$(MAKE) clean -C ./libft
	$(MAKE) clean -C ./mlx_macos
	rm -rf *.o

fclean: clean
	$(MAKE) fclean -C ./libft
	rm -rf $(NAME)

re: fclean all
