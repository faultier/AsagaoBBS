<% extends 'base' %>

<% block content => sub { %>
<form method="POST" action="/comment">
    <table>
        <tr>
            <th>名前</th>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <th>タイトル</th>
            <td><input type="text" name="title"></td>
        </tr>
        <tr>
            <th>内容</th>
            <td><textarea name="message" cols="60" rows="8"></textarea></td>
        </tr>
        <tr>
            <th></th>
            <td><input type="submit"></td>
        </tr>
    </table>
</form>
<% foreach my $comment (@$comments) { %>
<div class="comment">
    <h2><%= $comment->title %></h2>
    <div class="info">
        <span class="name">by <%= $comment->name %></span>
        <span class="date">(<%= $comment->date %>)</span>
    </div>
    <div class="message">
        <%
            my $message = Text::MicroTemplate::escape_html($comment->message);
            $message =~ s/\n/<br>/g;
            $message = Text::MicroTemplate::encoded_string($message);
        %>
        <%= $message %>
    </div>
</div>
<% } %>
<% } %>
