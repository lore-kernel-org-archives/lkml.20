Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180511;
	b=EvIQgA4JPzndKfJSTUzJNth60r424SF8zsk6ZGmfGrMFMhcCaUNO+74OPsujeQQIfy90
	 pLeEFbds3YXS5nW03gRfXy+vPMk2Ose3O6u2evaBkU91OybfQjyU/D10pL8AFzg4Rj60y
	 PHHCXSbVS8R6T3v2AJLozQpojp1ZZFk00bwlVzwLULXHLuVw7iPdxr25uJFlVXtVy6a9n
	 xnDGdicUYJExFFVMuUNn0ciUfl8k51NJge5OlnkNWpKbTf05xGoWbZkrHm55MoCt7J2l5
	 6/oNlXDExFa9Kg5F1sBP11n3TBXmYM42duGvIAEV4ocYzIunafiWWvXesFMc1SI9GKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JhpmC/Uc/PbS3eydMZOwQvVnE3o7hoZ+spCQpzSOEEE=;
	b=kSl1m3lriei+zAkumQ5ZbQ691HDIhBnKWAMXsC2+yEWkZqdGYmmUXA1hoG0MPi5DUQUo
	 xcHXQ0C/6O4kdBPc47IVfPI624SXPfvpdMYnHfiye5uLH+4YYQ+dxl1MGtHy0h9NxzNCK
	 iYCQP3aD4I7pFWnXL3TRCInXO6YCY9Z8i/nThvUHdAwlakwvZkSTV/CsoZU9l4rdC0+0g
	 TiKLY4ibqm3MPFjssGrBMVqsF0sriMgHdJXTDy5YdmwapUw1x6rk4l2MjTj4Gjeg3Hycj
	 0qAP6b1T79jHR/H7QFTzXFIshzEr7OKTAIuuMW55UgZtpMkvVJ8EB2qQ1vKm+63D+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCgIcVsj;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29191606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29191606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NCgIcVsj
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so281854a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180510; x=1793785310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhpmC/Uc/PbS3eydMZOwQvVnE3o7hoZ+spCQpzSOEEE=;
        b=NCgIcVsj6XJbn1qb9HdCFpYwByMR4qEaH6If4cqPD9OnLbaBxMrKHuevo4AomR1pUS
         qm5J1+KkJva3dtPArnPac/lkxPGptvSNru8mUXRFVTF6Gr+R++/arZ0P5DFgrt+Tsg5f
         FrgatqQHmBsJp/eWrW+7VyI6aDp9v+/qETk59gekIEaUxG+REI7JvC8j1ckUdgGdcuVX
         sP/uQEs3WaDhLLQ0gii5oiL84LMMFtbPYCxj3x/XyBrbP0wfr69y4VbZaDorLD6wUaW+
         QWIz62M7/1+cgWa+vUkclxDBsycb7sbtW9xxAFnfR8iDuPWCsiZrqsFx57E1vjd02H9Z
         BRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180510; x=1793785310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JhpmC/Uc/PbS3eydMZOwQvVnE3o7hoZ+spCQpzSOEEE=;
        b=U34OXUjavVEIAJeSAO+hjJo2g7hl5O0RxVjHl/HM0AE0lQri3sNxi54Sc5Aj9Z/+h6
         Lrz4iRNmyyEz58+THPwOqXm86oUvqw1bvTXLaM63MEKrm86etybZ8zHQkG+KYzUResRs
         iea8BLpRdv6mBI8XrdD4TF8V9jdX0OZ6y9QM+aVNm6uU8qKCs591UpKDdCDMGKuguKm4
         gsOzJ8s+U1H2OeE1JxF1AqhocmIxHv+901vwIVH5xd2BOvBRYv8kDwLDhYnHlOvPqWrI
         52WBnZnTeh7er1uYC/ukdKxLZu2WVfH0eJ4x9vZVekoz/Xh911OWk9Ry6I+KAkkAMfyx
         0nIg==
X-Forwarded-Encrypted: i=1; AKwUvBxEmXFhjxQp9jsnSlKwPwSPu0wxmzg4/ub2GMv6CP0l+n8/HMfbEFQMQLibJsQKGw1hyseLsGzgzRRvmWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUACEuWyFdQSup6HPZgOl5Utl9gHkOb4XEnYyuqCQT2eLBGdKJ
	sDtZ0NPfaxkw9W9muvBBpnDVs72/0TNhQ3P8cHt7WFW+kre9YkYOvA1YSxdDug==
X-Gm-Gg: AYBFou1hleH6bWmeHRIAQVRnTyvDn93loELEoVRi6P2NhIaR+y0kbrFJuQqqfJBljsa
	Q/3666tWQrt6/PXoDNewoyGzWE54kcXBNYxorc5aRRe62VRwBPcI3av2vyeSFKnrOszTsysBKEC
	/El0oywtP0Sm6K1wmDdrCfatQrUh6jAVubAgLuflFN5Hf7Fj0lWvfPGzk7sWjBXbv2d3+LBoo/k
	KElIZs3JjIKfv+5yhlYu4Nzu5rIaoe5Sa3U7aCj8jTSnDCM+YiNO+vl52ME48NriiTsFNRBWvrq
	p1Do19BFoQUOND1N1TnnhSBBhyXngXb5g11C4+s7x+D9wRABgEa97F8SKszDOsYqVLbJMjb7Zkw
	vibemhdWi7lxOF1sUkuOEGKG0dZKSUw56x1WqY6HLvDaY1IV6APmFpcXODmf9m8VVrZ8+B/9B1B
	uXi6bRPX9gEO0oWtODjlbBv0c9XzqJSnP6Cu4QRfRsgv1fKJdiExOCPNIeMe1w8WS1/PBPl9vdL
	ch+d8kWyeFrXt/JC8c5POoCTOynt4Ewsr0TsEL5KhXD1b0xj3wE3dHwMsorFKdRjwlzljXgdWQ5
	f0EjwL16SDyrFw8DDRL4YWpmWJtCqRuIcKuAY/I8Pculcp8O1ml8Wui5Teb+didRocElc/4Hgel
	XgOuZd7ZiQ0FK9U5v40uYD8y/oJEF6nrX9uXPs/aatqXTpuw=
X-Received: by 2002:a17:90b:4f84:b0:3ae:2961:14d5 with SMTP id 98e67ed59e1d1-3ae5824a0d5mr1388250a91.42.1793180510416;
        Wed, 28 Oct 2026 02:41:50 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:49 -0700 (PDT)
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
Subject: [PATCH v7 03/16] ALSA: virtio: Retain queued messages through device reset
Date: Wed, 28 Oct 2026 18:41:19 +0900
Message-ID: <20261028094132.20364-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
Changes in v3:
- No code or commit-message changes from v2.

 sound/virtio/virtio_card.c    | 44 ++++++++++++++++++++++---
 sound/virtio/virtio_card.h    |  2 ++
 sound/virtio/virtio_ctl_msg.c | 62 +++++++++++++++++++++++++++++++----
 sound/virtio/virtio_ctl_msg.h |  4 +++
 sound/virtio/virtio_pcm.h     |  2 ++
 sound/virtio/virtio_pcm_msg.c | 29 ++++++++++++++++
 6 files changed, 131 insertions(+), 12 deletions(-)

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
-- 
2.54.0 (Apple Git-157)

