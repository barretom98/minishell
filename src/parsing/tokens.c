/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tokens.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: amiguel- <amiguel-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/12 11:15:42 by amiguel-          #+#    #+#             */
/*   Updated: 2024/09/18 12:18:21 by amiguel-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

void    type_arg(t_token *token, int separator)
{
    if (ft_strcmp(token->str, "") == 0)
        token->type = EMPTY;
    else if (ft_strcmp(token->str, ">") == 0 && separator == 0)
        token->type = TRUNC;
    else if (ft_strcmp(token->str, ">>") == 0 && separator == 0)
        token->type = APPEND;
    else if (ft_strcmp(token->str, "<") == 0 && separator == 0)
        token->type = INPUT;
    else if (ft_strcmp(token->str, "|") == 0 && separator == 0)
        token->type = PIPE;
    else if (ft_strcmp(token->str, ";") == 0 && separator == 0)
        token->type = END;
    else if (token->prev == NULL || token->prev->type >= TRUNC)
        token->type = CMD;
    else
        token->type = ARG;
}

void    squish_args(t_mini *mini)
{
    t_token *token;

}