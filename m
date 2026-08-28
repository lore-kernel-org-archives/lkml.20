Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7334052B4
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911227; cv=none; b=B76Iwux08HSleVwliltWABh/2WNuV8aCugpyB3w8dvKsCle7T3PZR1R8brQS3XnabSN3dNbsp0KK0lVRdo/blS8r1VrnUE+FzIfsf152QLIcWMLynYLsRgAPAHYgrTw/R3NBUAZyQH/P98aPPuYorjAjxVtOFE/KEm7CuYEskZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911227; c=relaxed/simple;
	bh=TB+N2XUPAV4vKHUuumRNJtPT28PDXGSOLvjz7zicXW8=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Oz68cawVfjYAWFuiRF0H7bk+TLJY1FhZ4JT8x5cl07BEY8ODnICgeeZhTZsbUJi2wt9SHm8LEj8oDFZvwcEQso1ya+EwQULQi6If+pqfkO/dGJBUJ9m91jRaHTf+4v8hot7u25utwRadhOq+FtT9i7sm+ixjJBPqvCmcWjRj1bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=VnNnSOmc; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="VnNnSOmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787911213; bh=8ZNtzWGXaWxd2RLgEqxC83U4oZxYW6+oY8FYjGRcg1o=;
	h=From:To:Cc:Subject:Date;
	b=VnNnSOmcG7o/5jaX/ys3+Ne33JF9dmAGmB4a/ifHauH9dXgoRZOU1BmQyILWLUGGc
	 To9zcNgexdwpnjG/nh81x036byfGoUxiUdtlGOpmC55hOqcyDu9L5P58PWoDY/IcY+
	 87R+3gUYk/erbyGpwovEIPnPPRkkIyTg7s9R8xus=
Received: from p920-station ([240e:604:312:113e:27c4:e74a:cbb9:dcd7])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id B1320C; Fri, 28 Aug 2026 18:00:11 +0800
X-QQ-mid: xmsmtpt1787911211tjwjqry8c
Message-ID: <tencent_1CB189506DEFA4B38099D654FE6C2A2F2E07@qq.com>
X-QQ-XMAILINFO: NYtOCndYWoWXNm4kCiZr3KHKYmje8kAfugWTOYUKhEvSo52XqYOD7gJKdW6ei4
	 YlHbaEx98LUBW7vJ0Cjt7eWb+D0yejkiMyZ5TMHNlwHIJV0oqy/L8Gh5jmbjueeOv5eanzcn5t59
	 3SYmhZn+vwSWHq8zaf7+aghKCLiGTfDER9zA5y8dUxhppOJj7g3xTnIFjB14E+oXFtta2XFkxBlZ
	 hQiKdhMK5D94s2q+ANxeDrmgSJO9vA5k43J1+sLnToHlh0qS6aqHnfSMpDHsik5GHBU0q3owza9b
	 KLjDiPBXCvQHE/9JRo82XIKZsimNmdW0mkCXlraN/QHmq/YAWNEGvvy4f/JQdgbxkY+301+sgxe8
	 G8q0GZ1GhgVE0kVywUKfBTflPveD8liGfIf9c1WzvpcyMERbZTCXABsO4h4FSkwb2lQ5IZjtA5bn
	 Za40iF90X4fkkNzaHpop1HZ417NjkkiATuHmCQWOQ4WunDQg2Sh/Qx5BnYVuWgCV9oG0Tj6/3t/G
	 HHb4TVtvcZ5oJE+JAzHvQWFk/BJSHWsy2s1NrOBEx18EVtOvqbBTkdTP+AWc851zvdxp5R6IIPN2
	 yJMQFkBg9mB+c1nW5LZ5Qy9YE324E08E2Q0Vv5SfeD70QsXf6Wk8q6bF+9EcJfpqx68sb0FsYkWV
	 KAgMcOn6jr21nFdIu+C2P0y7HEcwHgFXOSSr/ZukQEtpp/x908mE6o78ycvY+Lv8jyBkWwzopbuv
	 PsHk5SfRx3yvadH2v3Aj9bZlpdMJLl8dyEYeBhehKih4upEa+B0fE/d8LLl1rcpooUzs93/XwOiR
	 U1hL3t/PiSU8Jfua/ZmGAF+0VNPbyJxtu/NON5eEeDj5FO0Db7RJ7GuPmlJLE5zvFEXgzLHNztoh
	 /qHstlVAmx3+ChztgFcb2uwV5+9yRQkUxTeJGcP2z3gxTTCIkPT+0NNnpGXShn2Z+p44OvnJWzy9
	 4KCxqDSvdmeK3TBmLSbgZxi0rl7/oZvU09F5Pfc32L94FY2MdCuxtn4S3qpK8B2/nkmwAI5siczS
	 oY0WszeAgv662ZBu5zLY3ZOV7xnvTAihSj7CGckH7SxMY1wcwSozzPMLn/Us7i3SDPqASrN+yVyq
	 /PUomuSS8s9K43d5l0LuvKT0G/zv6POM8XI7LvMx9VqQWmGh/BThjBQBfIYigBKbMxtqk1fq2LjS
	 BmixljsUjbenu7/bJqT8v2MAg1
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Yang Zi <2959243019@qq.com>
To: johan@kernel.org
Cc: elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	2959243019@qq.com
Subject: [PATCH v2] greybus: operation: Fix NULL pointer dereference in gb_operation_message_alloc()
Date: Fri, 28 Aug 2026 18:00:04 +0800
X-OQ-MSGID: <20260828100004.879411-1-2959243019@qq.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_connection_recv() accepts a received message whose advertised size is
smaller than struct gb_operation_msg_hdr.  In particular, a header with a
size of zero passes the incomplete-message check and reaches
gb_operation_create_incoming().

This issue was found using a locally modified syzkaller.  The
analysis and fix were assisted by GPT-5.6.

The subtraction used to derive the request payload size then underflows.
When gb_operation_message_alloc() adds the header size, the result wraps
to zero, bypassing the maximum-buffer-size check.  kzalloc(0) returns
ZERO_SIZE_PTR and gb_operation_message_init() subsequently dereferences
it.

Reject advertised sizes smaller than the message header.  Also check the
payload size before adding the header size, so that the size calculation
cannot wrap and bypass the buffer-size limit.

Fixes: 87d208feb74f ("greybus: embed message buffer into message structure")
Assisted-by: Codex:gpt-5.6
Signed-off-by: Yang Zi <2959243019@qq.com>
---
v2:
- Add the syzkaller provenance and Assisted-by trailer.
- Regenerate the patch for git-send-email.
- Verify the received patch with git am and checkpatch.

 drivers/greybus/operation.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 7e12ffb2dd60..c3d51176c373 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -364,14 +364,21 @@ gb_operation_message_alloc(struct gb_host_device *hd, u8 type,
 {
 	struct gb_message *message;
 	struct gb_operation_msg_hdr *header;
-	size_t message_size = payload_size + sizeof(*header);
+	size_t message_size;
 
-	if (message_size > hd->buffer_size_max) {
+	/*
+	 * Reject a payload size that would make the total message size
+	 * overflow, before it wraps around and bypasses the maximum
+	 * buffer size check.
+	 */
+	if (payload_size > hd->buffer_size_max - sizeof(*header)) {
 		dev_warn(&hd->dev, "requested message size too big (%zu > %zu)\n",
-			 message_size, hd->buffer_size_max);
+			 payload_size, hd->buffer_size_max - sizeof(*header));
 		return NULL;
 	}
 
+	message_size = payload_size + sizeof(*header);
+
 	/* Allocate the message structure and buffer. */
 	message = kmem_cache_zalloc(gb_message_cache, gfp_flags);
 	if (!message)
@@ -1047,6 +1054,11 @@ void gb_connection_recv(struct gb_connection *connection,
 	/* Use memcpy as data may be unaligned */
 	memcpy(&header, data, sizeof(header));
 	msg_size = le16_to_cpu(header.size);
+	if (msg_size < sizeof(header)) {
+		dev_err_ratelimited(dev, "%s: short message received (%zu < %zu)\n",
+				    connection->name, msg_size, sizeof(header));
+		return;
+	}
 	if (size < msg_size) {
 		dev_err_ratelimited(dev,
 				    "%s: incomplete message 0x%04x of type 0x%02x received (%zu < %zu)\n",
-- 
2.50.1

