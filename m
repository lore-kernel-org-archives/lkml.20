Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693319;
	b=OP68MgThYHR09yzKSbfMgIQd5VA07c4EYrf6FK0vXAVGlQFhCdVJj/DLv3oaSBzHGAbC
	 3Kj03W077N+RYJ07rRxFr7KBZeM6ZRX6S0AbFL/j6EBf2JMOkbCWs/hI5b4shFDyNZoeC
	 dPGwzNfJPbNw8Ym14A2UngBiTOK9bOj9FKX3G4/Atw+pr9ha0W4SuPAm4+H/O2IdywAFd
	 wnXPO23v24NI3800cQaRStcX9kYdjMsm7vOqv90ExoUHtL9wlA+KF5Ej07xSxaPiexrng
	 Pzm3AuMAV8Pdita8UCejMcuCi3E5xZmPlkc/CaQIYMcG4b9lLA+CyO4yZkB68I5kC5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8FS/9iZGrVVaBGfJfMnDbXg2jfeJ3Wh4omoFJlZ8l24=;
	b=b4yax55xiYjLl3/O//gGIjtk3e/me2isI5sxPhGyVKIXAeMFVxCGOup7MO7gJ7uq9a/P
	 C088uDOD0sekxnIBwljve3dyRGeoehRGCzmgQz1U8D3nQ8F4memv5wAOs64jDcgTis0nb
	 5jMq9KdNpnUs7+0/yLZ39aWQCR5xNVvwj1h55WD8TTrX1ExYv6DusjenjuZGcSzms95FT
	 Vy0D9tO4gRoUJ9aNb/zkcVQ5ncx8FeC4UZbiEC81NrhsUqcXaE4D+VzwNlFtEDIzqvf5U
	 hYKk7OJ/S2QCGeIMmYVYcFzddm+VJlbQa8Ae32+7Y9nsdEhdnyHL1twI3X4n2T1yS7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DznI5Sjm;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90400606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90400606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DznI5Sjm
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36a1947498bso3683778eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693318; x=1794298118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FS/9iZGrVVaBGfJfMnDbXg2jfeJ3Wh4omoFJlZ8l24=;
        b=DznI5SjmM136CCIC9Y2QE8Y55yfiUSSmp1043KemoMVDFK9pfdv30MzF7Yhtz/4uan
         FVGR/VOlNk8A8IRwL8TQ5ypUX8pXG5YaWXvD/MgRrdDuWoCSvOo7rTsi8s0fJiX6WuxI
         ZFdvRaZAWx6+isjBoc8OPr7dhEAEEGrlFi174toTrIhCVe3YriEm6lfIVVccG3Ff+45c
         sKmn9/VvNWey9DZNHPVW+w1N8UWosA/csZBwAaDonDFIeWd7V0vc0mb5VD3bHYe3aQnn
         aeozBQ4X/YWx9bcoDvKIufraZbHRNfv5Xc4OHhHHeG+aEb0EghTTI5ZLTl6Va/BOXknQ
         Qc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693318; x=1794298118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FS/9iZGrVVaBGfJfMnDbXg2jfeJ3Wh4omoFJlZ8l24=;
        b=aO4TjOxvNsHPNWm2D3yldpV4h2WKu7Nk6WD+2SPkOkW0QS1wo9fo8f4f4+cRJodrxl
         69AAwpGLFNrtt+PljeP4EB21xYCQuUDQzz+yxW5kJTWf4ZG2RU/+gFTJYAFpbnL3A0JN
         9jjckUAnieMJamp4nHVNFNwiieQe74VUb6ViKYQvY6DO0h9cePCNPe/+qSVrj4zKPdZq
         08YYPkSo9L/qtdL4LxWDZiecvj/t5xq0O1/bunNKT0UtBRDSmlX6x9SX09EE2v5o8KXc
         +pvgg4y+p4JTpLF8JFvyKBj9BdRzWvV61ao8a2Z/eDBlpqakSJu/Q4uXndfzi0h7EAFB
         xlgg==
X-Forwarded-Encrypted: i=1; AKwUvBwdyWd8NkRLyPWRsFzt4LhCFALUF9k7qMKEjBhdS2Imf6ZSvHRqk81DBHL77ZSKCma2apSNKkmchzCkvyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sqttpwm0HGEzEbaIjvNMHfbMIVRBmD3NdTSRE0oHM0oIe41R5
	WG9kbdHtgX6zyLmEgfl7AUCU9hMtvxTR9uXNmgk37k+BcZkw3OEpVXIV
X-Gm-Gg: AYBFou0Jj/DdGcWpSbozrrizAUALKw2T7nn/nboLiqP/I7hU1vpgCqYIz12cqUQjSGT
	nEL7Bu9QFhIa10BWovA7IXdMhd2mKjUlI4ycZRb1CgCW7SL4mHfs2Isg94n4e52cqzxaOA8u1eB
	DKI/hHVGD6p4xhmhQk7SXsVFBH+65XyfYHZ1E40nvKXs6LRPpCSesLCfuT54W7S1JqMJDOuc7fM
	qwjmF7qR8GyugmqPZQGBCTe2WLozk9MAps/ZLW8VnPJjUm3q89PHlrSe0uHdcY/9gT5VKVUkGwo
	Oe8Z+LlZrQkKq5CGFAVGHNr1O87NDszhvq/MHjqAs6Np400mrYdoBDhpZcWgQUJi3PVo5K9HBwm
	v6j07oTsb+CIbN8cwFmsveDZVNtzVG/RTPa3o3IJaTrQxqvIfPkZUkTtrtT03T1IWBbR44zyrvK
	DAn3NnF99PwxFsxCoNGFSm3U+pnryYCaNNmcWeeEbUqykjQFEbr0/gPRbjaTtQRLdiFZgEoFVyB
	Q58Q4njYU1JruizNj+gfsc69zArQ9qcJvxtq2ZR2I+ybNEsDpmgRK79t1Zo1lOcKU6IANpXCTxJ
	FsGolAkCz4/185B6BfJ9mSuPyIPDAgX7xLPXbes+x2P4iGJXbFZiGUFlMKIbKddFN2FF0pkfJ12
	MR9yj8hjapKbD8yeO2s3vnRNtrvJD4G+rMoMlSsZXuw+6jTw=
X-Received: by 2002:a05:7301:707:b0:36a:eee:bb41 with SMTP id 5a478bee46e88-36a422039b1mr18495261eec.1.1793693317482;
        Tue, 03 Nov 2026 00:08:37 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:36 -0800 (PST)
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
Subject: [PATCH v13 03/12] ALSA: virtio: Retain queued messages through device reset
Date: Tue,  3 Nov 2026 17:08:12 +0900
Message-ID: <20261103080821.16983-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
Protect event callback admission with the event queue lock. Disabling
events waits for an active dispatch, and later callbacks see a closed
gate before ALSA objects are freed. Enable and pending-event draining
share the same lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_card.c    |   93 ++++++++++++++++++++++++++++++++---------
 sound/virtio/virtio_card.h    |    4 ++
 sound/virtio/virtio_ctl_msg.c |   64 +++++++++++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    4 ++
 sound/virtio/virtio_pcm.h     |    2 +
 sound/virtio/virtio_pcm_msg.c |   42 +++++++++++++++++--
 6 files changed, 177 insertions(+), 32 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -70,23 +70,13 @@
 	}
 }
 
-/**
- * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
- * @vqueue: Underlying event virtqueue.
- *
- * This callback function is called upon a vring interrupt request from the
- * device.
- *
- * Context: Interrupt context.
- */
-static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
-{
-	struct virtio_snd *snd = vqueue->vdev->priv;
-	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+static void virtsnd_event_drain_locked(struct virtio_snd *snd,
+				       struct virtqueue *vqueue)
+{
 	struct virtio_snd_event *event;
 	u32 length;
 
-	guard(spinlock_irqsave)(&queue->lock);
+	lockdep_assert_held(&virtsnd_event_queue(snd)->lock);
 	do {
 		virtqueue_disable_cb(vqueue);
 		while ((event = virtqueue_get_buf(vqueue, &length))) {
@@ -94,6 +84,26 @@
 			virtsnd_event_send(vqueue, event, true, GFP_ATOMIC);
 		}
 	} while (!virtqueue_enable_cb(vqueue));
+}
+
+/**
+ * virtsnd_event_notify_cb() - Dispatch all reported events from the event queue.
+ * @vqueue: Underlying event virtqueue.
+ *
+ * This callback function is called upon a vring interrupt request from the
+ * device.
+ *
+ * Context: Interrupt context.
+ */
+static void virtsnd_event_notify_cb(struct virtqueue *vqueue)
+{
+	struct virtio_snd *snd = vqueue->vdev->priv;
+	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
+
+	guard(spinlock_irqsave)(&queue->lock);
+	if (queue->vqueue != vqueue || !snd->event_vq_enabled)
+		return;
+	virtsnd_event_drain_locked(snd, vqueue);
 }
 
 /**
@@ -158,8 +168,12 @@
 {
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 
+	guard(spinlock_irqsave)(&queue->lock);
+	if (!queue->vqueue)
+		return;
+	snd->event_vq_enabled = true;
 	if (!virtqueue_enable_cb(queue->vqueue))
-		virtsnd_event_notify_cb(queue->vqueue);
+		virtsnd_event_drain_locked(snd, queue->vqueue);
 }
 
 /**
@@ -174,8 +188,9 @@
 	struct virtio_snd_event *event;
 	u32 length;
 
+	guard(spinlock_irqsave)(&queue->lock);
+	snd->event_vq_enabled = false;
 	if (queue->vqueue) {
-		guard(spinlock_irqsave)(&queue->lock);
 		virtqueue_disable_cb(queue->vqueue);
 		while ((event = virtqueue_get_buf(queue->vqueue, &length)))
 			virtsnd_event_dispatch(snd, event);
@@ -338,6 +353,40 @@
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
+		if (i == VIRTIO_SND_VQ_EVENT)
+			snd->event_vq_enabled = false;
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
@@ -349,13 +398,14 @@
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
@@ -383,8 +433,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +462,7 @@
 		return rc;
 
 	virtio_device_ready(vdev);
+	virtsnd_ctl_msg_enable(snd);
 
 	virtsnd_enable_event_vq(snd);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -47,6 +47,8 @@
  * @queues: Virtqueue wrappers.
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
+ * @ctl_msgs_blocked: Control requests are blocked during teardown or suspend.
+ * @event_vq_enabled: Event callbacks may dispatch, protected by the event queue lock.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
  * @jacks: VirtIO jacks.
@@ -64,6 +66,8 @@
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
 	struct snd_card *card;
 	struct list_head ctl_msgs;
+	bool ctl_msgs_blocked;
+	bool event_vq_enabled;
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
