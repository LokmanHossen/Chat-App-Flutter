import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble.first({
    super.key,
    this.userImage,
    this.username,
    required this.message,
    required this.isMe,
  }) : isFirstInbSequence = true;

  const MessageBubble.next({
    super.key,
    required this.message,
    required this.isMe,
  })  : isFirstInbSequence = false,
        userImage = null,
        username = null;

  final bool isFirstInbSequence;
  final String? userImage;
  final String? username;
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        if (userImage != null)
          Positioned(
            top: 15,
            right: isMe ? 0 : null,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                userImage!,
              ),
              backgroundColor: theme.colorScheme.primary.withAlpha(180),
            ),
          ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 46),
          child: Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (isFirstInbSequence) const SizedBox(height: 18),
              if (username != null)
                Padding(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 13,
                  ),
                  child: Text(
                    username!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              //spech box surround the message
              Container(
                decoration: BoxDecoration(
                  color: isMe
                      ? Colors.grey[300]
                      : theme.colorScheme.secondary.withAlpha(200),
                  borderRadius: BorderRadius.only(
                    topLeft: !isMe && isFirstInbSequence
                        ? Radius.zero
                        : const Radius.circular(12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: const Radius.circular(12),
                  ),
                ),
                constraints: const BoxConstraints(maxWidth: 200),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 14,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 14,
                ),
                child: Text(
                  message,
                  style: TextStyle(
                    height: 1.3,
                    color:
                        isMe ? Colors.black87 : theme.colorScheme.onSecondary,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
