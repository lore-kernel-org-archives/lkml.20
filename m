Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664260;
	b=H1m586w1MUpkwWkaQ7xWImX5TNLu55fQ954EARhe8nslVJSnO71y53QpoypcHKb2xaVI
	 LSdCdc/EYiNiLxOMYv0/iBGE3AytzBT14VuDf9tP5MX+hHBFbpr7ad29WOK9wy5WJRkTK
	 irvDByENaag8k7X8BBdhxlU6Va8qatbwa+vd3YUb4mzAs0SplQ/RQBUw0ewyC2IXwsDc0
	 FMUZiNLiLa5ydaItQUJDULYdRs8IjJAFdiyOGNIFpa7w/vosnEVAxeea17JVUMGsGAFyI
	 JpKYohZJ1Yhec/ehFVwfL73yUwWYnhUHxbZr4he6rHhPzD12zPF5AbINLaaN3VmG1cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jX5Hr9a1YgN6sFSMNQNakejxbLQYKa9FFruwyL5x1dg=;
	b=sC3CYRt1eQtbb6Z+/2RP3bos375yn89as5EayxNGBcq7yhiO4ERfkWjqEEgDQE7dR6Cp
	 n2XrvZRbUJ7pA/9eC5xGS5jrXQpZk1CRQv12atVhYTo7B1BG9vC5f+KW09VyyMRAmy7GS
	 hCK8SFYHlLAoMfPJMSY2jv0pOsqX0y49l3eUWvojA7qULFsz69Cmfbs8Lvp6lQjnvFE6R
	 6Q5IdUwQfmXX9EzpM+MZvJw7N8QgUtSqenUTGtWNuEA1RYbEecfipDns1j9HIZ2SNVIdg
	 dRBdi2rzbEcEK0KrRrnPDUdWvWCUgaY17xchXVaAe7HGsAEUJB9whMySo4OUqhsmTQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSV1iikp;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FE3606D802
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FE3606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uSV1iikp
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1503852a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664259; x=1794269059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jX5Hr9a1YgN6sFSMNQNakejxbLQYKa9FFruwyL5x1dg=;
        b=uSV1iikpU2lrMsNFyynI7Y9iB0PHs5QV+V0J52fOhJDwV9/UGGF64w5TKCsmh6wZvp
         yrNzGHmL2sZPRvSA881adfxIhcl8rRoazZ96f3NcE0BrWsZrId8z0uYHG0fJ9/8Bz7uI
         h5s70nea8CNcqcuXSu0+l7Ohy5E2pUj2N3qs8dlnycXd/NywPUVhmcLHYnF1/W8woWbX
         3kFjUxSGjkh5Pv7hBZpwaeABvA8WuJ1+tU1SyA+bTtkvtOnX5oeWZbt9I92JBp6LwX7f
         IQQ50/5gbPclIpiT5gaC1FVA+BRONkDV1L5o2QD8LPt6TdSbTndek+D6UxlDkSAKL4Wv
         EvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664259; x=1794269059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jX5Hr9a1YgN6sFSMNQNakejxbLQYKa9FFruwyL5x1dg=;
        b=pj8pdO4qBj0GLz+9ThxMqXrfJkGihW8Uq1VCXTTwO/FEL4RMXbksYrWHkccbV8YVyV
         Gd3eaTFHz7mBrqvDrFzlD0esT0pw1ehVvZXM96BexryD8qIIe+Ta9p1FOa7DjE8LdMsC
         C48wBg+bVlmAULRWvktcwNOHtHOIbBaxXqS5+h4q2LGtTCc5BoXn72PglBjYST/1CVC4
         8I6GeWRZB/76GSyIjd+63pdK41YhNfNTBIJLsitQgJ/AxKOch6ae5oH6bXrurCvRF/r1
         HT6vnQhTuG0MO9PWzgZ4Gs1lCSylz32X83+xncGXs9aASXsyMsW1Dq0WHNNRxO6Kt4Jt
         ydwg==
X-Forwarded-Encrypted: i=1; AKwUvBza/YRKACFVGy9TlKZ4ayegWrADd0cxhPOF+INspiv5MoKRyrfZ896KdT288dj+1D4+pNuYAUJZhbq4LHI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+PvZcKHXbIKTuXyu7+qa2iLImDrgbSjekntdyeh0I6fynLkqr9
	qCq8YptPkHdtjzQ1W9EfFWhJ5RWxcwH0Xk+qhSNp6pk7QKGFErp0cokW
X-Gm-Gg: AYBFou1T93S9cUW5E034dAoi34zBW7fRUylTgMBmjfsODIFeeLpKJzji7+gwNfeqTD1
	E5zLC9raaMRFadobfvTL7ONu2xh115BQYcX9h178+sDFm+RsC2XSuBPEkTupvWP2XEkH8S2T2Kt
	q/xl+0gAzZmzHxDDcTSwOytDzNJL95uIsjWpFE2A2OWwGOS15Ft/zjj6u/3RzZgFB9aycw61guP
	abBT9V857dLAzamUOQEIrusvcm7VQgY2qdrMM0bvc+WTVKi4lgr9H6X8yOltkQyb3DbNwSR8c3u
	kUaauCmS5EESlX/5SdiARV6H/2wmbxuapIDRTTmHthWI3BBZPM/BlOFtqo7AuDlI7p1olQpz1SC
	+6sI6312jWUu6OAwMC16hwW8Y8fj8zgnKEkrEuQ0uMZBxdJXAazcGPlaTv5OOtf/fEH7WVXwvF9
	z+FZfelzCm4Fch8O/+FNGiUpjqAyTEZ2OUrVnjclteDhgWKG266CLMVT0KQQ98t22ghODeRWvEf
	tK7N9PGr+grqItyG1mxIeeyNBrDiYnAx7wWGopEJSKkos6yAYnmndLm+GcVi8+ypbp8f5yQ0YcQ
	7aXlwoIMp2fDV2nhwU/I6l+vVPegiCU5iYRaS/hhrRsdLfVQ5x1y8tCjVl+4w/eY50qZUPhZ2ap
	I4mZGqyKd8kiIpvr5NlpQ7v4YVuRBKsw9h0GkaXtA30MGj44=
X-Received: by 2002:a17:90b:380c:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae8982068emr8994232a91.38.1793664259214;
        Mon, 02 Nov 2026 16:04:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:18 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v12 03/12] ALSA: virtio: Retain queued messages through device reset
Date: Tue,  3 Nov 2026 09:03:54 +0900
Message-ID: <20261103000403.67106-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the control queue available through snd_card_free() so close-time
STOP and RELEASE commands can still be submitted. Block new control
requests and mark pending messages canceled before reset, then release
their queue references only after reset and queue deletion.

For PCM queues, detach each remaining virtqueue buffer after the device
has stopped DMA and retire its message without reporting a normal
completion. Detach all queues before deleting them so outstanding DMA
mappings are unmapped and no token remains for a late device completion.

Clear each queue wrapper inside the same critical section that detaches
its buffers. Check the callback's queue identity under the wrapper lock
for PCM, control and event queues. This makes queue retirement explicit
through teardown and restore. A forced callback test passed on both
versions; the proposed detached-ring IRQ failure was not reproduced on
the tested PCI transport.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -87,6 +87,8 @@
 	u32 length;
 
 	guard(spinlock_irqsave)(&queue->lock);
+	if (queue->vqueue != vqueue)
+		return;
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((event = virtqueue_get_buf(vqueue, &length))) {
@@ -338,6 +340,38 @@
 }
 
 /**
+ * virtsnd_reset_vqs() - Stop device access and unmap outstanding buffers.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context that permits to sleep.
+ */
+static void virtsnd_reset_vqs(struct virtio_snd *snd)
+{
+	struct virtio_device *vdev = snd->vdev;
+	unsigned int i;
+
+	virtio_reset_device(vdev);
+
+	/* Deleting a virtqueue does not unmap its outstanding descriptors. */
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
+		struct virtio_snd_queue *queue = &snd->queues[i];
+		unsigned long flags;
+		void *msg;
+
+		spin_lock_irqsave(&queue->lock, flags);
+		if (queue->vqueue)
+			while ((msg = virtqueue_detach_unused_buf(queue->vqueue)))
+				if (i == VIRTIO_SND_VQ_TX || i == VIRTIO_SND_VQ_RX)
+					virtsnd_pcm_msg_cancel(msg);
+		/* IRQ callbacks must never see a detached ring as live. */
+		queue->vqueue = NULL;
+		spin_unlock_irqrestore(&queue->lock, flags);
+	}
+
+	vdev->config->del_vqs(vdev);
+}
+
+/**
  * virtsnd_remove() - Remove VirtIO and ALSA devices.
  * @vdev: VirtIO parent device.
  *
@@ -349,13 +383,14 @@
 	unsigned int i;
 
 	virtsnd_disable_event_vq(snd);
-	virtsnd_ctl_msg_cancel_all(snd);
 
 	if (snd->card)
 		snd_card_free(snd->card);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_ctl_msg_cancel_all(snd);
+
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
@@ -383,8 +418,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +447,7 @@
 		return rc;
 
 	virtio_device_ready(vdev);
+	virtsnd_ctl_msg_enable(snd);
 
 	virtsnd_enable_event_vq(snd);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -47,6 +47,7 @@
  * @queues: Virtqueue wrappers.
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
+ * @ctl_msgs_blocked: Control requests are blocked during teardown or suspend.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
  * @jacks: VirtIO jacks.
@@ -64,6 +65,7 @@
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
 	struct snd_card *card;
 	struct list_head ctl_msgs;
+	bool ctl_msgs_blocked;
 	struct virtio_snd_event *event_msgs;
 	struct list_head pcm_list;
 	struct virtio_jack *jacks;
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -15,6 +15,7 @@
  * @list: Pending message list entry.
  * @notify: Request completed notification.
  * @ref_count: Reference count used to manage a message lifetime.
+ * @cancelled: Request canceled during device teardown.
  */
 struct virtio_snd_msg {
 	struct scatterlist sg_request;
@@ -22,6 +23,7 @@
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
+	bool cancelled;
 };
 
 /**
@@ -100,7 +102,7 @@
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
-	/* This reference is dropped in virtsnd_ctl_msg_complete(). */
+	/* The caller owns this reference; send adds a queue reference. */
 	refcount_set(&msg->ref_count, 1);
 
 	return msg;
@@ -134,6 +136,7 @@
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
+	/* This reference stays with the queue until completion or teardown. */
 
 	/* Set the default status in case the message was canceled. */
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
@@ -147,12 +150,17 @@
 		psgs[nouts + nins++] = in_sgs;
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
-		rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins, msg,
-				       GFP_ATOMIC);
+		if (snd->ctl_msgs_blocked)
+			rc = -ENODEV;
+		else
+			rc = virtqueue_add_sgs(queue->vqueue, psgs, nouts, nins,
+					       msg, GFP_ATOMIC);
 		if (!rc) {
 			notify = virtqueue_kick_prepare(queue->vqueue);
 
 			list_add_tail(&msg->list, &snd->ctl_msgs);
+			if (notify)
+				virtqueue_notify(queue->vqueue);
 		}
 	}
 
@@ -168,9 +176,6 @@
 
 		goto on_exit;
 	}
-
-	if (notify)
-		virtqueue_notify(queue->vqueue);
 
 	if (nowait)
 		goto on_exit;
@@ -184,6 +189,11 @@
 			rc = -ETIMEDOUT;
 		}
 
+		goto on_exit;
+	}
+
+	if (READ_ONCE(msg->cancelled)) {
+		rc = -ENODEV;
 		goto on_exit;
 	}
 
@@ -227,9 +237,33 @@
  * virtsnd_ctl_msg_cancel_all() - Cancel all pending control messages.
  * @snd: VirtIO sound device.
  *
- * Context: Any context.
+ * Context: Any context. Blocks new senders and marks pending requests canceled.
+ *          Existing senders are woken when their request completes or after
+ *          the device has been reset.
  */
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+	struct virtio_snd_msg *msg;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	snd->ctl_msgs_blocked = true;
+	list_for_each_entry(msg, &snd->ctl_msgs, list) {
+		WRITE_ONCE(msg->cancelled, true);
+	}
+}
+
+/**
+ * virtsnd_ctl_msg_cleanup() - Release messages left after queue teardown.
+ * @snd: VirtIO sound device.
+ *
+ * This must be called after device reset, buffer detachment, and del_vqs(),
+ * when no queue callback or DMA access can still reach a message. The queue
+ * object and its lock must remain alive until this function returns.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd)
 {
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
 
@@ -244,6 +278,20 @@
 }
 
 /**
+ * virtsnd_ctl_msg_enable() - Allow control requests after queue restoration.
+ * @snd: VirtIO sound device.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_enable(struct virtio_snd *snd)
+{
+	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
+
+	guard(spinlock_irqsave)(&queue->lock);
+	snd->ctl_msgs_blocked = false;
+}
+
+/**
  * virtsnd_ctl_query_info() - Query the item configuration from the device.
  * @snd: VirtIO sound device.
  * @command: Control request code (VIRTIO_SND_R_XXX_INFO).
@@ -295,6 +343,8 @@
 	u32 length;
 
 	guard(spinlock_irqsave)(&queue->lock);
+	if (queue->vqueue != vqueue)
+		return;
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((msg = virtqueue_get_buf(vqueue, &length)))
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -68,6 +68,10 @@
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
 
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd);
+
+void virtsnd_ctl_msg_enable(struct virtio_snd *snd);
+
 void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -122,6 +122,8 @@
 
 void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss);
 
+void virtsnd_pcm_msg_cancel(struct virtio_pcm_msg *msg);
+
 int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			 unsigned long bytes);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -305,6 +305,35 @@
 {
 	guard(spinlock_irqsave)(&vss->lock);
 	return vss->msg_count;
+}
+
+/**
+ * virtsnd_pcm_msg_cancel() - Cancel a message detached during device reset.
+ * @msg: Message returned by virtqueue_detach_unused_buf().
+ *
+ * Reset cancellation retires the queue token without treating it as a device
+ * completion. In particular, it does not advance the PCM hardware pointer or
+ * schedule period work.
+ *
+ * Context: Process context with the PCM queue lock held.
+ */
+void virtsnd_pcm_msg_cancel(struct virtio_pcm_msg *msg)
+{
+	struct virtio_pcm_substream *vss = msg->substream;
+	bool wake;
+
+	{
+		guard(spinlock)(&vss->lock);
+		msg->length = 0;
+		vss->xfer_enabled = false;
+		if (WARN_ON_ONCE(!vss->msg_count))
+			return;
+		vss->msg_count--;
+		wake = !vss->msg_count;
+	}
+
+	if (wake)
+		wake_up_all(&vss->msg_empty);
 }
 
 /**
@@ -367,16 +396,21 @@
 
 /**
  * virtsnd_pcm_notify_cb() - Process all completed I/O messages.
- * @queue: Underlying tx/rx virtqueue.
+ * @queue: Underlying tx/rx queue wrapper.
+ * @vqueue: Queue that raised this callback.
  *
  * Context: Interrupt context. Takes and releases the tx/rx queue spinlock.
  */
-static inline void virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue)
+static inline void
+virtsnd_pcm_notify_cb(struct virtio_snd_queue *queue, struct virtqueue *vqueue)
 {
 	struct virtio_pcm_msg *msg;
 	u32 written_bytes;
 
 	guard(spinlock_irqsave)(&queue->lock);
+	/* Reset can detach the queue before the transport drains its IRQs. */
+	if (queue->vqueue != vqueue)
+		return;
 	do {
 		virtqueue_disable_cb(queue->vqueue);
 		while ((msg = virtqueue_get_buf(queue->vqueue, &written_bytes)))
@@ -394,7 +428,7 @@
 {
 	struct virtio_snd *snd = vqueue->vdev->priv;
 
-	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd));
+	virtsnd_pcm_notify_cb(virtsnd_tx_queue(snd), vqueue);
 }
 
 /**
@@ -407,7 +441,7 @@
 {
 	struct virtio_snd *snd = vqueue->vdev->priv;
 
-	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd));
+	virtsnd_pcm_notify_cb(virtsnd_rx_queue(snd), vqueue);
 }
 
 /**
