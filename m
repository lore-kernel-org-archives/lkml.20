Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AC74A8FD7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366312; cv=none; b=ZabEABCtO+eFsPb+RcELVJ347iXxY7b+byfd3zu19Dt6lo85bNmHqjv+xp2N2Wvyyg4XKuXgAlfjTrBF8TRCwyboOhuujjifcb/WKgGxB4ng16zzaGZBAvwYN9i9PL0bn13hEuT/F5UVVKSx5rwLQ+bvsfuRhwZwpkK4RWwfc9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366312; c=relaxed/simple;
	bh=4UNriAhWDuhDAQW/1mZEubEniEm8ODyjqLC9FNbc4cI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R+wZr2tgeiariLBDAtr8vXSPIddZJYMHx8iY6Af38LvaVowp8AtChn0PCGlEU4LKEuBNbkSLGSzP0cPp0a8mP9csEPB4qkawVzGxoeJiYqhxIkwJZ9sxi1If25isGixDbsbZtUXVa+GhgBVO/i36m6kNKZWwWALQmvmFpeHAtRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ad778bacbeso1654670b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:25:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366310; x=1788971110;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U87nkd347QSLGeItHXGLweuZJ+vsbb3H25a7voypVNU=;
        b=LR8vJM2T+ZYcEEwVG4W8V+VfxrJQNvVcW76LQQ3YAfTp4GrOXTKYZe09kYXuUitwv1
         L42uwrNK1eC9jrVya3qeUK9POeFq3t7i/OwDA1oLEpA7NhW0XJPa1H9ejzshigdpxClx
         085W20DjnFAfE4LQstUsGBaGhqdHO4ZM+TNZocY2cj5zy1FuLxVGUU5rVfunI4SZI7S/
         FiHdd+AYuQWFCXjZhedMx9NIdiUDkq+K0XmAgeIKsoaR/Q2JIhA+EYf7fIHOFNxMLVNe
         uZGD3VU4MrJgSr+H9mRTSq06Bux4EajGTKJ4oVTLoC27qg10CLr9YJKLm9LGx6H2KXTw
         480g==
X-Gm-Message-State: AFuF++nr1cPzVl/xUpjmTgR0TRMh4rgueIHbmvQQaVksDFTTzlI4skJ6
	ijcNdz0+kRGgtq8pVZb2+tY2e6yOHWFctYLjEcrB0iQuOJpq+NULte+DIJZ5G7erZmmw6IKfYUo
	LXniETP/4j4KpyNumMjuR/ua+rv5bCrZVGwRQkL69zo0r93uMKapgMkVItlk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:988:b0:6b1:b68e:5109 with SMTP id
 006d021491bc7-6b47f204dedmr4515002eaf.33.1788366310163; Wed, 02 Sep 2026
 09:25:10 -0700 (PDT)
Date: Wed, 02 Sep 2026 09:25:10 -0700
In-Reply-To: <6a908733.1d9ded08.62e62.00d8.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a984de6.27a413cd.1e878c.0009.GAE@google.com>
Subject: Forwarded: [PATCH] greybus: operation: fix out-of-bounds write in
 message allocation
From: syzbot <syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] greybus: operation: fix out-of-bounds write in message allocation
Author: adrianox@gmail.com

#syz test

The incoming message size from the device header (header.size) is
trusted without checking that it is at least the size of the message
header itself, but a value smaller than sizeof(struct gb_operation_msg_hdr)
underflows request_size in gb_operation_create_incoming(), wraps around
in gb_operation_message_alloc(), and results in a tiny buffer that is
then written past its end in gb_operation_message_init().

Reject undersized messages before parsing the message header.

Fixes: 87d208feb74f ("greybus: embed message buffer into message structure")
Reported-by: syzbot+2fd6aefc361af86911d5@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
Cc: stable@vger.kernel.org
Assisted-by: opencode:deepseek v4 pro
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/greybus/operation.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd..df6daee4fb 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1047,6 +1047,14 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev,
+				    "%s: malformed message 0x%04x of type 0x%02x received (%zu < %zu)\n",
+				    connection->name,
+				    le16_to_cpu(header.operation_id),
+				    header.type, msg_size, sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.51.0

