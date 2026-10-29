Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252653;
	b=xxtq+tDDDteTVxOo826OtRFeeLLUUNq7Qe/fC+C6IDX8ZV3q2lb0i+bSR43JRWw2EVG1
	 6g2YMpk5CfDmN/3wklK4oLR0BQFl1Z7sjifOltI13p8uM9HgwWXKf8wPG7x9PC2b75nUa
	 d6TrIzmaT85eB5GhRfPAiu1IVsBWC82sUh2eDkaZgDT/HqQm17x6Fs8UuPrC32TyPVBiH
	 xn7BbnFvJYcwfV3cWVjednqYuDJ5eh9rQrjdawmV2/9YCpIVNTFtqHv6nbvbOTRQ5neEK
	 VFhPFjI5G+zMXmOWrN9Jm8HSZEZ3k1ecgDKrNKVFRV9Xim/+s1qWElx1aictXH5vopA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xRtWUAKfY9X5wkwggxxeGgNkudZjMtEOC55s1BIbowI=;
	b=ecrmAfuo9vI/NkNeNE5yNt6zrUaGvb+mBF/Es+8Arc3FuHkp0rVx0QXgXULKvsT2Q3Ku
	 COxAF4FG6tr+wSaOcQehTVXG0663fILfKa8XzkP7nF0ewxcD8/z3axzEOgyNBLjcawdf7
	 2ShF9wmQIpfO50JTWoFT+kkhmzyRiq6iKYE+sUND7aKAfMxPU9rht0ULdKQ1Xd1FhUrUc
	 XehnlUGE8AVhCZwIZZdGv3w3Ix4wlWB2xGnD/UHQEHs1zoHeiBtr/Aozd98QQK1WD7JAy
	 bikEs8ngWxCCEd3OLcyVpUV9dxMBJKD1P4l8i9wA7uSde4cvGLhMoeKQgPtNvmPVAww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iaB1OcmR;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D5606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iaB1OcmR
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so827475a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252652; x=1793857452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRtWUAKfY9X5wkwggxxeGgNkudZjMtEOC55s1BIbowI=;
        b=iaB1OcmRDp3E2y2mjz7C9GAx5dUUjesxtud9/ewffGOVqYj1lNZEeY49HwsTPJPEb4
         MSIo800Txcf468VDEOcvirCMvwjgdP1ONmTbKsjuPlw1vPdKXFJGVs/zpEa/noW+lW09
         J1NRXjqBZW5s94698kiC+0CWLcdlJW9p6fIZKanjhMQ1w1j/rKWesGcvfsuO+SWVQe7t
         vpm5HU8YaFwH/Ci+gUiJTAyJqo67iReZWaIm2fGwnuqmNCjTbJ7oO/Q+6EelBrZ9+l5x
         saFo05/lEXBRENng/wmk0G5QzgUt4wjYLi+Ng+6yMOOPsaP2A5yWX6+qJxdjI5n9yeHP
         efag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252652; x=1793857452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xRtWUAKfY9X5wkwggxxeGgNkudZjMtEOC55s1BIbowI=;
        b=IrZpPobsPnk6HWX8Z7MU59G9MsPCz6jerCH2EU+C48ZvJB1dU+5ZEZ4G7bcL0vwdtA
         UoLancJQvio6rwHzxP5rxJhEpFhvrzf3gxeyDv/BZL+5D70FE9bfJDa8y1z3Avok42Md
         0d3d8zIaCoTD7bnxK8MAJ6xRF7sUYRvveMQ1vNcWzzMGfNG33sl2DsIMWndTzS0H48V+
         6nrhSozNWrX2CR0yXkuk63b9nPw0XKSa739OBIjwgAZtgJyCvWIDv3ziwtaG224m+pip
         Px1VeZaRarUsnsPeCqS7BUIVfLJ04HLZQAc7zhPlHx9eF6SiWr6R4eD3yIJOQOIP73B2
         qH+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwWPXWgdEBGa9IXblKXbD5nbtCa+z3KZ0glBF5v0luVw0UeibB36mUYEXyus3fx/MOUkhFdCUY5g0Zo1eQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNc14HWqk+vHGZAvR6bL3stsxM0x8tlIIx+BYn3Q7PMd8g+bVj
	f8kAvFhLfMv+tJ3RKntAcGM9WnZWcPBh7cUqsDvH9TnvOD5EEaNDMAq2Wt7T5g==
X-Gm-Gg: AYBFou1B3hkyeC+xSSvG8+9apNZNkbTFFTBzN7awAav/6LSehOwzPxBV73SwVLSzhfg
	ewjhEbs6bffiSP4NR6Qq3BolKH2DidcRVtGOgDn7uXWQjAfXXRhXBfajKV7fS1D2g3SFT3Y5PKI
	rGGiIf0URF8UFwVv2lyGKnhixkjFpEBBy1OnvjJluOg2Dimpds2dMAPMHnhquQcRXuL7fFbrZPr
	frOJ60mxXPiJKT7lYT8b12ivv+bTEylzAVYjbgpQbIh4m1gCAviM6J0dNn/Ot3fg0+FjwgdywOC
	YaMP96W2l/0b+xXlNMAgEHXPfLTfJaQ/XCuttBYc7xm5yxsPDrMIDhZCCb/5iUwss3dheOa2VTJ
	ah/bMU1WT6+x0Uj71MUqIshJ/vYS4jlNx5HRMdYpahAskj25t4o1qqOgHryS3HFY/3qHZ4ef9q6
	HSt2eUemkzkeNoHEfKGDm9ONoUwxs1brYAxiSyugz9R7+peqKXmARkOohVOiBK0uVTqJ79cinEm
	fJNGnE9WSFcQ2P6x126TxjZegRgQh+bvkyUy1vscm0nTfS8R5kicc6yw08m/umjBshk9hGj4l9y
	d5sK6uzphXy7N3lilZmoQxbUpgK8PK9krJmmfP+HHThnGoOvGPXpAoqHMQc4XKs+WF04uG+Z6E/
	D6o8diVP90jCPCfp5+/WwISw1LqCU+JDQylXu3Fqh5BMnYxs=
X-Received: by 2002:a17:90b:1c8b:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae5817e0a6mr3172712a91.45.1793252652422;
        Wed, 28 Oct 2026 22:44:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:11 -0700 (PDT)
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
Subject: [PATCH v8 03/14] ALSA: virtio: Retain queued messages through device reset
Date: Thu, 29 Oct 2026 14:43:43 +0900
Message-ID: <20261029054354.2931-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 6f35276416fe..df7091b74a52 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -337,6 +337,38 @@ static int virtsnd_probe(struct virtio_device *vdev)
 	return rc;
 }
 
+/**
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
+		spin_unlock_irqrestore(&queue->lock, flags);
+	}
+
+	vdev->config->del_vqs(vdev);
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
+		snd->queues[i].vqueue = NULL;
+}
+
 /**
  * virtsnd_remove() - Remove VirtIO and ALSA devices.
  * @vdev: VirtIO parent device.
@@ -349,13 +381,14 @@ static void virtsnd_remove(struct virtio_device *vdev)
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
@@ -383,8 +416,8 @@ static int virtsnd_freeze(struct virtio_device *vdev)
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +445,7 @@ static int virtsnd_restore(struct virtio_device *vdev)
 		return rc;
 
 	virtio_device_ready(vdev);
+	virtsnd_ctl_msg_enable(snd);
 
 	virtsnd_enable_event_vq(snd);
 
diff --git a/sound/virtio/virtio_card.h b/sound/virtio/virtio_card.h
index 3ceee4e416fc..bd065bd00d25 100644
--- a/sound/virtio/virtio_card.h
+++ b/sound/virtio/virtio_card.h
@@ -47,6 +47,7 @@ struct virtio_kctl {
  * @queues: Virtqueue wrappers.
  * @card: ALSA sound card.
  * @ctl_msgs: Pending control request list.
+ * @ctl_msgs_blocked: Control requests are blocked during teardown or suspend.
  * @event_msgs: Device events.
  * @pcm_list: VirtIO PCM device list.
  * @jacks: VirtIO jacks.
@@ -64,6 +65,7 @@ struct virtio_snd {
 	struct virtio_snd_queue queues[VIRTIO_SND_VQ_MAX];
 	struct snd_card *card;
 	struct list_head ctl_msgs;
+	bool ctl_msgs_blocked;
 	struct virtio_snd_event *event_msgs;
 	struct list_head pcm_list;
 	struct virtio_jack *jacks;
diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
index 6433c870f271..7114bea4033a 100644
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
@@ -22,6 +23,7 @@ struct virtio_snd_msg {
 	struct list_head list;
 	struct completion notify;
 	refcount_t ref_count;
+	bool cancelled;
 };
 
 /**
@@ -100,7 +102,7 @@ struct virtio_snd_msg *virtsnd_ctl_msg_alloc(size_t request_size,
 
 	INIT_LIST_HEAD(&msg->list);
 	init_completion(&msg->notify);
-	/* This reference is dropped in virtsnd_ctl_msg_complete(). */
+	/* The caller owns this reference; send adds a queue reference. */
 	refcount_set(&msg->ref_count, 1);
 
 	return msg;
@@ -134,6 +136,7 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 	int rc;
 
 	virtsnd_ctl_msg_ref(msg);
+	/* This reference stays with the queue until completion or teardown. */
 
 	/* Set the default status in case the message was canceled. */
 	response->code = cpu_to_le32(VIRTIO_SND_S_IO_ERR);
@@ -147,12 +150,17 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
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
 
@@ -169,9 +177,6 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		goto on_exit;
 	}
 
-	if (notify)
-		virtqueue_notify(queue->vqueue);
-
 	if (nowait)
 		goto on_exit;
 
@@ -187,6 +192,11 @@ int virtsnd_ctl_msg_send(struct virtio_snd *snd, struct virtio_snd_msg *msg,
 		goto on_exit;
 	}
 
+	if (READ_ONCE(msg->cancelled)) {
+		rc = -ENODEV;
+		goto on_exit;
+	}
+
 	switch (le32_to_cpu(response->code)) {
 	case VIRTIO_SND_S_OK:
 		rc = 0;
@@ -227,9 +237,33 @@ void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg)
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
 
@@ -243,6 +277,20 @@ void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
 	}
 }
 
+/**
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
 /**
  * virtsnd_ctl_query_info() - Query the item configuration from the device.
  * @snd: VirtIO sound device.
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
index 7f4db044f28e..d917435409d0 100644
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -68,6 +68,10 @@ static inline int virtsnd_ctl_msg_send_async(struct virtio_snd *snd,
 
 void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd);
 
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd);
+
+void virtsnd_ctl_msg_enable(struct virtio_snd *snd);
+
 void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg);
 
 int virtsnd_ctl_query_info(struct virtio_snd *snd, int command, int start_id,
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8048b14e6c80..e31f090a0124 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -120,6 +120,8 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss);
 
 void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss);
 
+void virtsnd_pcm_msg_cancel(struct virtio_pcm_msg *msg);
+
 int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 			 unsigned long bytes);
 
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 5371f4985fd0..762480363b86 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -307,6 +307,35 @@ unsigned int virtsnd_pcm_msg_pending_num(struct virtio_pcm_substream *vss)
 	return vss->msg_count;
 }
 
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
+}
+
 /**
  * virtsnd_pcm_msg_complete() - Complete an I/O message.
  * @msg: I/O message.
