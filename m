Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32064B339D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444966; cv=none; b=TJiZzJ5Woegeud71W9xeU3e+saylIqtdxDWh0/QMEpZRYDfUdZNGGjhfMjPurwgtW6040WWrBz1LWZXBAEodDV6b0pd4DU4iBfy7/m9m2A7vQIILItw8v6scfu0rzZ1kVM0HeCXw4EdWkqKnDWCoXOsMtVDmw45yKxuBt7VKEaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444966; c=relaxed/simple;
	bh=UUoCs3OS1DpEKPOf4QHK0Gnr950LiLZG3z9kQysx8iA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JMjDaIKM7HJLeKf48x/UHxh7raYKGvxDPVs0/QlqZrdxPqxHYF8QMicOFPCRgQr2fmMtWiPwmPdwn4eoLrqFjBKInfNZFKgI1RxGovXWoL2l8vQ6Nlkazt5a+ILK6GZVndQvGadlzLleO0Fk7ZDMuTgV7L5Y9ptAELeMb+SnKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cqqz5c/4; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cqqz5c/4"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so2195624a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788444953; x=1789049753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTI3IpCba426eFljnzXJ2cqFQiHThODtSzi4pevtE/Q=;
        b=Cqqz5c/44snunzLcV09QO2GkN8HQHyV27leGmNheGUk7hu0GeScRFj+k7lBzulgcoP
         ptTrE6WUEDMyrCAmXSZyivs3MrgHZ2yIxKgAAq8baGpXNTlrClEPDM9EfQSATTW0n+bO
         3VzhfsN04Fm4Pq2RNTFB41LuwbqvbT7zqh1P856F/FC8wWOHCEE0FYVqzdZjHiUd/FUF
         F04dBva+GG24/yFuhDItlcyS7+5kPODQRxA731o4eSnxfUxsp4Z5PqZc02RImivOtb/I
         9j9P6wQ6D9/5v6kj6fZCIPYGj8/nQJLRjdxjQUKSaJ5wGMhMGiUoCn+rqb2ooji63md1
         onbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444953; x=1789049753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTI3IpCba426eFljnzXJ2cqFQiHThODtSzi4pevtE/Q=;
        b=PPPHTQ6GsKNlFo603Yf7Sr6mUUzF23zFzL9iO68t/Grt5asHOZklCWgIZexdVZGLrd
         aql8khjUGz8hysrG65JnE2JekZ0A7qpDvb4q9/J6K6J1o/23Jsyp6n2sPJlkm6PYCQnP
         k7VTwIHyC4a55e2RDw7olmVhK3Bdv6PMkVX9FgPDve0q7P2jEhc1ZxuXNqWigubLuUI/
         rhb5c7w6PeggtvzI4mIAUZLRPyaIlalD5eYy29yZzki6f4fhWmXpzlXWIcwWEYiuSl6T
         D8+qYdyxCD/YV9KDOTszM9RUySVHGQaOGxpSwxa+eqSW+0iSpiy52XiDWFYszpEhG/Ov
         OfmA==
X-Forwarded-Encrypted: i=1; AKwUvBy70XJJL856cZK6ffaE02B8RWhmuSlYO+CYRYck59XagpezK/nXsSCvAaGGSdIcdoExplGI6WjW8OVSSW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mlmEBh759tqj38vn1aivJgGBqCIgJzLtH7eiNUXwleHf1QjlKD
	LrfwHB+FZIooiG55iIWfh97m9FEfVYLXIuN5GVgQEgWQnwKdgETobo5c
X-Gm-Gg: AYBFou29m/+I3cMQ8aVHkTB4MeKZFPULQPYnUuIrd2KSlVHZExvl8AEAGjGVe/Y0Ht8
	P4xLUVt2fqo8M5/lloJdil21ISG5MDJIBZ91piTCcBSE71vfPTBBW9/q92uxP92aJyYvArLFGeb
	mepStl7DYIsUv/aS5hWG9FcNcEfkD38ZGmb4sHjrUsQtd5KLnIiHfqbgiDQcWdwtGPOjIS7VIQd
	xb061yR6mgBrM/j8ti/rz1t1qEW5gXtLUtlB/ERGkx+awjzZtjt44vpJXGNooqg+dlRY/r14lWh
	z+aIUU9vhvNwluh9OcOB+uirK3EzS0m+9uyQ6Wqd+PQUwWjPN8p0E0rI3iSiPYB8oeU3RiQtFP/
	ooAr57aaQlhqXy5WMusyWTpAe5jq+MU3jHIqlRuUU8mwaDayzkGZTxWJxFT2Hl6t6ALMAiATJQ6
	fksWE5miCWSoeCWA6xW5g12nb55ndvHTCEaEN6nnsENOtYFfTVgreA1LGLoF9sy6Vb0WwLf79zs
	g0Kkf7dlSTrxd1rKbiqz3XuIQ==
X-Received: by 2002:a17:90b:3c89:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-39aee066dd0mr21177322a91.13.1788444953135;
        Thu, 03 Sep 2026 07:15:53 -0700 (PDT)
Received: from XP-PC-huhb1.xiaopeng.local ([98.98.122.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832b85bsm5793909a91.4.2026.09.03.07.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:15:45 -0700 (PDT)
From: Hongbing Hu <huhb04@gmail.com>
X-Google-Original-From: Hongbing Hu <huhb1@xiaopeng.com>
To: laurent.pinchart@ideasonboard.com,
	hansg@kernel.org
Cc: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongbing Hu <huhb04@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: uvcvideo: defer cancelled buffer completion until copies finish
Date: Thu,  3 Sep 2026 22:15:32 +0800
Message-Id: <20260903141532.6693-1-huhb1@xiaopeng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903131141.6368-1-huhb1@xiaopeng.com>
References: <20260903131141.6368-1-huhb1@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongbing Hu <huhb04@gmail.com>

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
Signed-off-by: Hongbing Hu <huhb04@gmail.com>
---
v2: corrected author real name in From/SOB per maintainer feedback

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

