Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263853;
	b=GLDMPHINMxh/ZnuApSH91WLV5zvTfT58a6kgkh19B5CqujnujKxAwYtDLoJte+WDrCDH
	 c5jw8r1QzVE3HY6dwLiUPvDoFNpWnj9jqTzZRSf7k8MTe31rY2akrxADTesj8Crr8ClQd
	 sP+iuzTNOhV/3z31ecQnQ2mmjyyjudBtsUhE+zPUtMgQ6nnmDLMFPiQdjYx7xfCLW8bTd
	 iDpfloFn2H7yQfMbwnFWzhn3whBXxYBbokVDwvWufz89GUB9jiiYlIJVk7kwKFKWmWwgO
	 omt37VwA/a7jNwddQeQqXwT2vaIZBrAUwDhiYLp2i+vjve7ZRymb2ZMuKRXY8KO4jKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
	b=R+fMIQK/IERX+xddlsB7mKwJqGa+yQlZLDuedBj3iBszSbDAA1Zv9t7WUx8c/Tz9lnti
	 D7wgv0kGOu4W64D9Yp0KsVCU41pQLKF9zTgv9nR+qbX+B36p/HEKPD0mGoFPl/tC3gJfK
	 /v1+EglpQH+qMsHgGneHN/13kKkc4yVRB75ZW7+MpyFkQiV3MdCSzA92fADMav2DTKvUV
	 6Je5t9NJ3RWOWTQ5C4sWb86NL1SUmMJc47fyJ6LHzgjI93Bw1ytyPKZLAp/F+mn0BsFZC
	 vJV/suxza06MliDXfSFvbR5WLZv5Ak3KCujsaGlPSYzQy2OO5mTVirdgYWbepjs66qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjqIG9uL;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89667606A327
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89667606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LjqIG9uL
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9d1114320so14190605ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263853; x=1793868653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
        b=LjqIG9uLXeCnxj9BzHM40Th7+Fy1wrts5LCn7kOw4loFaCctcXRYzn8xXHPflR38uj
         FvKJhZqKkNWANl4J1HLmaK7vxY/oqnFpAhk8FAPGS+tXoyr0K1L9hJkGMsdqAWv0BIWR
         jk0LASbTyU5Q6u4utwKnRhmDEeqTw26KpoYAlo+st4IexA8Ts1FmUtYCAq8n27OZpIpC
         RZCu6u2oWdjr8FL/UnEu+vnII0T/8Od6aKr6yNwmPDV1m8dWxPk7SXnVdPtpZXh9pXk9
         R+I/d5szUVHHJ+FNLRt5rqQk83W2oibI75np3G123dMjP5pKRJ7BXReDi+3wup1vSYPp
         8skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263853; x=1793868653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Yqirqt/HeucM8EnnGRAHQ9IMf+mOQa0R11j5LmsThA=;
        b=sKhFX79skx/gudObYRNpZJ3E0hTtE6uS/GeymWlyq15djDi4BaoyWKGqAVrpfm+0CL
         7CJuVx8XAcppmoIIqWb4rCptlNEN4wjwXdAmSvsHkSgeZCQbEdJwMkKZCVpal+QuSiEt
         FOzp71fvqORqX6e5nQKThddFsu+D7/qGHY7ojfst9+K1zyMHYMQfOReP0U6IEmZMk6tF
         3DK8n/HX6Cn4R8/egxYIAd04vehEO9L/qKwCEqStWeYKMidFcMMOuZRg4ftvJ7ek1TjD
         zpH0f7UkQa/oiEgcGlr0h0EdTIFnYTxTqbxHD0NiF41RWuif8AxLgg9mi+he3GVJqPYS
         BNBw==
X-Forwarded-Encrypted: i=1; AKwUvBy8DxATdx2xh9Hv5jcXZ/j0fNL8jXbYZVtd/4XxUTlQfCYRtU4e65kKGP0DWgX4V464cqslY7o1IiNJER4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwm2JDiqp0gGDcLLE+3rMFiQZiPWvKZtZ95+HiksLSrGfZCUxJ
	+1Nq7kMvDp9c4vioIM7MADNgbzwMVdnxS1XL2drIZbuP7IaYwP3rWMdR
X-Gm-Gg: AYBFou1cV5V/0AGv76SWxR5QXicWE3qR6pBk8L5U5ehSjxAs/d3CI2eqdiP0v9/2KK2
	hRmPp+c/b5ki0B78nEerTeG6DeRjE13jrv18rgXgkvQ5AC3Lzwz19I/yuFBMPof8HgXmmm+IMp4
	FDupMhRDacFi4R6Pbf+qlETwbJlJQNtxwApfFa01mpBj6G91ucB0W4P4P2kOqcj4uh9zTL7UJfo
	AI3WPeSxtOVujdZfqVmXGFeU8rjliKMn3WoMwRrX/7597/wpIznvTTk0b5M0H2BwldrUzi12MtL
	KtzyPgfmFXqeMdWq19BdeU/zXsOGRi/ebWM8iZmQjApHBDwmLJQv13v9a+fHb4Ge4N1zY4Wgsib
	o+GmfezvvBWPxjOh1G9ULCijtfqms07CgYKKZJz/c+qtRdMnWaokBSwFbqVAwuV1DfuW1ALyIhj
	wW9yyOWCbnKpU7jSi9he5Y63dGY3rH4q+p8mbUErzTundcmegR8/JCQU9mDDly1IvJ5nQa58g4V
	mPaRpR8cPCupomccuWEQzypnEFIo52FYj5gqc6t2on2joAJx7wtDl4ShXVn689Q+pPfBKsGwsL3
	mipPD2UNxzrZuabVBY2v9YBlhezHWbdnJhoF+rOruyhlwk3yqnhsyHNdSdyAzZdCUXpIDZS/PQM
	AxzGEpNhWgA98CKZUPm0+bTcRC3RRei1bjw5pMNeoUA==
X-Received: by 2002:a17:902:e846:b0:2e2:c3a2:9b15 with SMTP id d9443c01a7336-2eb00085eb0mr50502945ad.6.1793263852882;
        Thu, 29 Oct 2026 01:50:52 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:52 -0700 (PDT)
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
Subject: [PATCH v9 03/14] ALSA: virtio: Retain queued messages through device reset
Date: Thu, 29 Oct 2026 17:50:21 +0900
Message-ID: <20261029085032.70689-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
