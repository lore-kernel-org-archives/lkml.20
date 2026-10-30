Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338007;
	b=2HGRB8pnSBqPCl1zCOssn+rAiuU1dbLYMsMnNuB23dAknqsz4FM7nXU0Qt3Ir4QilohX
	 iy1zPLgS8wtl/zteuVntOUqvRqflioPxHmEpPgjgwjPqxj1erlAekjT9raPJdS7qysDiX
	 RYcWEERszUEO/wV5TtpJgS8sTh8jjHIKC7sWt7ofBMfHfT3iiUoJvWQD3FkOSIvsM3EHh
	 k3544fjtD1HYMg6o92bZ/k3y7ibq8AMWl6adqli+5r1esrRN+Hh04eAY7DprA609o+sty
	 8gNvz3K6OXbC2n8wyMx6gnBzwlz1OvUZ+GaF+upZnwq1OOtOxfzcU9Uap4DT3YZNBBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
	b=wcdO3Xhenh8gZa6RQvTjXVF/u1ubWsR6PWfDpXqLzNBu5Tzo74l2upK4udbEZYlvyXSD
	 rpQiRRunCCYPzmI5kHXYs4RJYLHcOyagNVW3d+hAc3xSg1uZ9QdRQtdGA9SGm6KBuTEON
	 5iHOEbnur/Bd4p5JT41to9CFrDVzZP1IAERpsJT3vGt7ZrnpR3KHBZC42nVlFJSkzyisG
	 gh1R/Z8wkorQ1uJgRyZqbb88KkCTtkTHc49fcLUrFSHnujResPClXEzQtN6xYtkhe4olH
	 TBLHwMoMTTCW2UrGr6ADdKsiOoLdQbbERoNgjVa8esXiCBQJUZu3aTkmqrar29+N7lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yU1s3SQa;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E10606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65E10606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yU1s3SQa
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ad2b3b1c02so173554a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338006; x=1793942806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
        b=yU1s3SQaz52+hV0Gy7WVngwOaWoYTYJKQ/0oGvDPUXBwZxkEf7o6MBpQxGLm9M2HPp
         HDqkk+rdWHof++++XVO/0YUhb/Ju0out6amP6rFggx8Hj3qsJJGA5T7htaDDuMAKV9uf
         +dvteGtnFVv73IrRD777QBUwqMYWK5H/w4zyUbNSOaUDRYak8mFpsEESPe2G2BVL/ICK
         CQaGkMzR31/7RZCQeQwunF1ihBRLCT/fIdPyUSCkVSepBlINGyzf6fXKTxT1SxDNfQKX
         SLleAahprdFLPOGJ6qW075rVQIl4G+qWlPYNce46FNAvX6uE9KhoR39pYcnjU3z/DwAf
         h3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338006; x=1793942806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
        b=X19c2mJIPl04N5E43TR+RNee8UmJ6ynaq2Vg51oHwwY25jT4wzQJkPkfO3IwhNxwbO
         haG4O1BZzt4gMO4WYF1dw83gUsppMb9V8kvQ+hpJXXAykbWrqKAFhZpbW1Vd2v0rsjpY
         sIXSEzm6Gp+KvtrsyzjBsKOBoGitX33S04eAIyimqBbCJpjorQAnVLifs+QcvF1CxSXq
         C1iPUB0fVlhpg9QYc/HK9PZCzx0UDa+w0nCj2+nORm6yGlK+njtoH1yweSjmzSMJG5N4
         bTv6tJ1O0ap3lGUmsk4JfMTlt7Vmzr5cLhd1YWENeBgbZfaC4P4UiqQHtUjv1GtG+n1J
         pshA==
X-Forwarded-Encrypted: i=1; AKwUvBwGWuxnmAds03pqaeYc6kZHYTxKZlNg6DulVCU+5w7pbQlyi20v2sP9lQeBdsuGBSl7+v5tsbv+p3YxBKM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+xg/uDvk9ZXAlnsJ/4DGSnq5eGbzQLSKtCo8t74I2mEtJOqep
	zmutu66dHP+fB6eNB/OrtOyDqIdQojl9TyXgrmi6NkNJPZJAgZaQiIAG
X-Gm-Gg: AYBFou27kIxZwJhhXjKwmY6Yr9FPFyv7zltE7lFOOs0Zzj6EktNHCPHsTUwWaklkJuh
	6XLvv+Is6rsMo4DchsRvsdnoyNT4pX9hXf2Rg1pZ1xcNP6c9UtehNg60r8BEOSC8ofVIGcr3RnX
	kUaquP34yXmhJOA6Pe3oacnPpzrHA5U/HJBt0AQdV8xquczvIMaGFopPF5HgnXyklXggSPHe1FF
	ur1mk+LN6c4oPBwmxyTTYJfbwZxwjqTOSS97hjWrSKmpNzWw7Aby02a7Ar+N8/hXFoq+SGmV4Mw
	8SQRLe5qfIgNrRWwwVurDJ6OsZqGuLRWcc73aybgSwMtJuuWHEPr10DMtEhThC/XIfCbkPrkktr
	tm3JtaGrItV7RQrf0hpDN035k0riv3xhzLB/DUOvIjWXe3PKLVXxrkYiVOEgFG9ZVPJ1RelkNio
	6qsc1XQEHLBa9Rk6ua8Sjk/PkahuIHe5Zlb5f+GpWImZFZcDt2AwjTXoxLdq59sudSfJNLFqe0m
	RuxFU844WD8YB6K83bMoCiuHV9fHUShIJU4tKcmR7/nfNskNMbPJTrfxBqBGZ3ogryBFjVJ3OOw
	4YqcUJy7OpWRwVdTg+NmJfABl1RdiEUb9sQuUO+WiSa4pa4UgurAaC5Z+9gcSSKmRDKeSr72KoW
	ZOxKBGqfJvh/1t0o7pz/QloVm7I6T+eyZb2uHHU215pnpMkM=
X-Received: by 2002:a17:90b:3b4f:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ae8957a24dmr980925a91.6.1793338005619;
        Thu, 29 Oct 2026 22:26:45 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:45 -0700 (PDT)
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
Subject: [PATCH v10 03/14] ALSA: virtio: Retain queued messages through device reset
Date: Fri, 30 Oct 2026 14:26:18 +0900
Message-ID: <20261030052629.27742-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -338,6 +338,38 @@
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
+		spin_unlock_irqrestore(&queue->lock, flags);
+	}
+
+	vdev->config->del_vqs(vdev);
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
+		snd->queues[i].vqueue = NULL;
+}
+
+/**
  * virtsnd_remove() - Remove VirtIO and ALSA devices.
  * @vdev: VirtIO parent device.
  *
@@ -349,13 +381,14 @@
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
@@ -383,8 +416,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +445,7 @@
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
 
@@ -241,6 +275,20 @@
 
 		virtsnd_ctl_msg_complete(msg);
 	}
+}
+
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
 }
 
 /**
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
