Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7127E4AC141
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441169; cv=none; b=b9TQBtNpTwQnNMATS0WG35D7RLP66WKhIvebqDfOcQWsHlzxM3p81kUFnonjJc7d5ZZmc7g++sSmFaKAhfNYVQ2dSo/3uJZPDc6cMoefENii+OPHhTbLbs0Df8PHmQIvEWpByMn0OvflY1NMHCBfmmP/FpRCQnd5EeIu+xHHvgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441169; c=relaxed/simple;
	bh=6PpOaDvG7B4yvqN1w+kxiA04SVsuNsaPu4+LJMpskEw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lQBBHTbP1cnHDx1daIwAKjHoUMhGvGeFV6vbb8/Alv3dfwUBnR3iO/jWCS3GYn5/q7oejUwfPCkMu26pMr2/BRxaJsRhze7eXcO1td0KG0hDir4EQV3VMp7HMbFh/gyDMrgWGwLgmbJWq/19PyEwrQyvuqPCpkMvwAzg/WFZkGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8s9A9xv; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8s9A9xv"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e7391839cso2460418a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788441145; x=1789045945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=emV5n6JyzwHHJDAPrwbCGMimUu0hxMHFjSvszb+s2d8=;
        b=G8s9A9xviegaRJ1PT8In18usvKg6pbJd0MfCSZiMPT/2NnsJ1cEcxgXvuCeAS+NWcg
         fPsXczn9AEtPOeEHL6YzuMH/eftJHUcF+rNIgpoaow7D0VQ3ysf2sMDA7hug+lStG3Im
         x3pRq+/Mx74F05QU5RLW/iQyXQ+qnc62SfwbAcLsEKdzbR5Rv/xWbWkR3vZzer8P9Lg8
         jT3/beCzSwq62YNpsZzLhYKti/YOzW4v1klTMeiJfJtKBgp0SGq93hSLtIhJCHvQ2SSk
         M+baGQmiNXFEZh03+tiV5pUOnpVyeO+Uuo0UYaeKUlvgmvEmhGBgW0i+d+vDaOTGHzDW
         EvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788441145; x=1789045945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emV5n6JyzwHHJDAPrwbCGMimUu0hxMHFjSvszb+s2d8=;
        b=guSgxfEBbsYJkcXB82QH1d6AfYSGCDk2qaxccAjuYIxeSMp5l4h2omjM6D0hEYkyAg
         03NbN+F2G/qNhnj/bm7bBjwWmdDsb487xlOP2lXLUttces46JMvBtu98v5WGnTfobmC8
         o6WnhEMe7YXSBadDpIeNuNFAdfYPeUib5fsD1zanhzCKoRrFSApYVHiAZVQUQIv8SueU
         IEySCDk+phOWs6W9XPbevk8YM+GuKLJPT5n0EsHPiz0FA+gv7+OBMhIdYKH8yNcmIvSW
         Or/tbvZrncMfnrV19sxGctOFhD/c2jTIIQzHekjLEY7aCHlBIg3zrHJRFUSSGvU2b1xC
         i5xg==
X-Forwarded-Encrypted: i=1; AKwUvBxTX/innWOkx77zpzbwRj0sd3kCmYSXQZgJKMjuIZ8j5RPcwupTnaSMssTDe284jM3ofCK0l8KqQUHhZMY=@vger.kernel.org
X-Gm-Message-State: AFuF++k7NRqRhhafz+hVEyXFqzIisy1DVP+BcwvBNcz1lx0+n8wsb7oM
	9xtdAsjrH2z8PCp9LwNJnFknDJ7ukhdW46oTAouRLqwi3HE1tl23ERW9
X-Gm-Gg: AYBFou3CfI+cuALymG2qF1Chfe7hPAIzjYIJ7lS0ZjbetQ2YaIBc8zReBu5XY/TvcIJ
	ralirr5xXutquiCgXluUYZAEDisibDd3H21RslNiM9RuCZk2YS9UjkmhjB8GEuldMfBTXLPv6Qu
	2jgm/J9+rUWG3umIy+9iZbrK+MlunZH6z5wiE2rWWKHwtGh2PJSR0OPj5neE//tSBpN0f0GOU2x
	AfCSlQo4ls1KYz6rzPPGjzwomwq7SEpbCvoE6JOktfihbpmi0v+J33msg9oakJ9N7W0JyacXLnp
	qgDlCW5uwgEYXN3m/LFOeNnn10I8W/TOeMwo5ixn4WRAU0n+zAWgzreegZ8kJHANVVw9a6x1Qxa
	ZSlvQ3GWz0uNXgD605cYSsOQvscXY0XkFMe+Z0eqPI+JwXXhAF/QxEUCmDbbOR56JyvcH3qjtPG
	N2y3fsiwejPsiaBN+OtxjojW5Apy4cnCtqhwvThO6ayKWOp7RgTYyaSnMwIUTvmvbI1z6GBjkpt
	guB7QyL+G9BPTE=
X-Received: by 2002:a17:90b:2688:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39aee162e08mr21243652a91.16.1788441144840;
        Thu, 03 Sep 2026 06:12:24 -0700 (PDT)
Received: from XP-PC-huhb1.xiaopeng.local ([98.98.122.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae902354asm2692820a91.2.2026.09.03.06.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:12:24 -0700 (PDT)
From: huhb1 <huhb04@gmail.com>
X-Google-Original-From: huhb1 <huhb1@xiaopeng.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	huhb04 <huhb04@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: uvcvideo: defer cancelled buffer completion until copies finish
Date: Thu,  3 Sep 2026 21:11:41 +0800
Message-Id: <20260903131141.6368-1-huhb1@xiaopeng.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: huhb04 <huhb04@gmail.com>

uvc_queue_cancel() returns queued buffers to videobuf2 directly via
vb2_buffer_done(). This is unsafe because asynchronous memcpy workers may
still hold a reference on the same uvc_buffer. Once vb2_buffer_done() has
run, userspace can dequeue and requeue the buffer while the old worker is
still running, leading to the same list_head being inserted into irqqueue
twice and corrupting the list.

The crash manifests in two ways depending on the drop-corrupted-frames
module parameter:

1. With the drop corrupted frames enabled, the old worker's
   final kref_put reaches uvc_queue_buffer_complete(), sees buf->error set,
   and calls uvc_queue_buffer_requeue(). This performs list_add_tail() on
   buf->queue even though userspace has already QBUF'd the same buffer and
   added it to irqqueue.

2. With nodrop=1, uvc_queue_buffer_complete() calls vb2_buffer_done() a
   second time. If userspace has already dequeued and requeued the buffer,
   the second completion exposes it to userspace again, and the next
   DQBUF/QBUF inserts the still-linked list_head into irqqueue a second
   time.

Both cases produce the kind of list_del corruption seen here:

    list_del corruption. next->prev should be ..., but was ...
    kernel BUG at lib/list_debug.c:64!

Fix the cancel path to remove buffers from irqqueue and drop the queue's
reference through uvc_queue_buffer_release() (i.e. kref_put()). The final
VB2 completion then only happens from uvc_queue_buffer_complete() once the
last async reference is released, so userspace cannot reuse the buffer
while an old worker still accesses it.

A buffer whose state is already UVC_BUF_STATE_ERROR is forced to complete
as an error and must not be requeued by the corrupted-frame policy. Normal
malformed frames are still requeued/dropped as before.

Fixes: 01e90464e42e ("media: uvcvideo: queue: Support asynchronous buffer handling")
Cc: stable@vger.kernel.org
Signed-off-by: huhb04 <huhb04@gmail.com>
---
 drivers/media/usb/uvc/uvc_queue.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_queue.c b/drivers/media/usb/uvc/uvc_queue.c
index 3c002c8f44..9206e0a355 100644
--- a/drivers/media/usb/uvc/uvc_queue.c
+++ b/drivers/media/usb/uvc/uvc_queue.c
@@ -289,10 +289,19 @@ int uvc_queue_init(struct uvc_streaming *stream, struct uvc_video_queue *queue,
  */
 void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 {
+	struct uvc_buffer *buf, *next;
+	struct list_head local_list;
 	unsigned long flags;
 
+	INIT_LIST_HEAD(&local_list);
+
 	spin_lock_irqsave(&queue->irqlock, flags);
-	__uvc_queue_return_buffers(queue, UVC_BUF_STATE_ERROR);
+	while (!list_empty(&queue->irqqueue)) {
+		buf = list_first_entry(&queue->irqqueue, struct uvc_buffer, queue);
+		list_del(&buf->queue);
+		buf->state = UVC_BUF_STATE_ERROR;
+		list_add_tail(&buf->queue, &local_list);
+	}
 	/*
 	 * This must be protected by the irqlock spinlock to avoid race
 	 * conditions between uvc_buffer_queue and the disconnection event that
@@ -303,6 +312,17 @@ void uvc_queue_cancel(struct uvc_video_queue *queue, int disconnect)
 	if (disconnect)
 		queue->flags |= UVC_QUEUE_DISCONNECTED;
 	spin_unlock_irqrestore(&queue->irqlock, flags);
+
+	/*
+	 * Release the queue-owned kref outside the irqlock. The final VB2
+	 * completion only happens from uvc_queue_buffer_complete() once all
+	 * asynchronous copy references have been released, preventing userspace
+	 * from reusing the buffer while an old worker still accesses it.
+	 */
+	list_for_each_entry_safe(buf, next, &local_list, queue) {
+		list_del(&buf->queue);
+		uvc_queue_buffer_release(buf);
+	}
 }
 
 /*
@@ -356,7 +376,13 @@ static void uvc_queue_buffer_complete(struct kref *ref)
 	struct vb2_buffer *vb = &buf->buf.vb2_buf;
 	struct uvc_video_queue *queue = vb2_get_drv_priv(vb->vb2_queue);
 
-	if (buf->error && !uvc_no_drop_param) {
+	/*
+	 * Buffers cancelled from uvc_queue_cancel() are forced to complete as
+	 * errors. They must not be requeued by the corrupted-frame policy even
+	 * when buf->error is set.
+	 */
+	if (buf->state != UVC_BUF_STATE_ERROR &&
+	    buf->error && !uvc_no_drop_param) {
 		uvc_queue_buffer_requeue(queue, buf);
 		return;
 	}
-- 
2.34.1

