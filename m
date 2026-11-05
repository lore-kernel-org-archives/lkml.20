Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845931;
	b=0eO5afmweUlmhw9WHOkciWAuy8A/7/jI69QoYdJBuCvXornPXUmhEjorbb+0Ca7grkWj
	 zYgoUodiqdbIr265neiNKFP+6Wm7RT76Od7X2O9reb96m0+R6X65FE9l8L3al1+PO0CcG
	 4x/6F+8EOFUbzT4OQfRN0Lds1INeVnHOWM3f5I/yDXHqOjL92lZfnvdsVoDS2eYz5FMf9
	 oPwRykXPTkGZpKDHLgwQB1mAkr6avDgKf6z8MGtCp+kPGynESgdba1cyD+R0nQPrZMPan
	 4O+Ht5OENNtT6HZiWWlvpc2YV51PgTfQM65k0Y2/4cc4Uw/YTjdEP33Ji1XY1aUDJcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1jlMIlqruFJ1uritPSLSHJBp9A2j8r7yMkm4OaCEFzg=;
	b=SF5d5asB8SzHkkYRRtZgN26Mwwl9UoQmt58S5JBD9iOygpyF9/UskjpHCfjJDindP5CR
	 NPcYEwo6dQcy4IRaJ5pWr/2316qj8zzDyBzPYUC0ChFDM6Z+k7nJSH+8QhcK26nYgJ/nw
	 Kfj8H2SnwyuFiGCM+iZOetw4byAcPoqXBYgRYgO0Gwrt1et4bt8y+Y9S7MwgpnClnaOWu
	 IIBh5dGEXmN/snYeMySgcR1aJgxBbZU/9RjlWHAA+7AiIjh1EBjKCk8msCXRGFUBEH8vF
	 DUH2GczX6i1boOyzXPOP2E5ZY6JCuL8qu4c+ofKVavrhZ2eEod3eO/ltWZ3u2LUKCHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmfgJrlW;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1635D606D821
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1635D606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NmfgJrlW
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso726610a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845929; x=1794450729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jlMIlqruFJ1uritPSLSHJBp9A2j8r7yMkm4OaCEFzg=;
        b=NmfgJrlWOsPSgUQDjsExsNnwciyEJTbAmZMOWLFDV+ljtqNMn2IWe9dJ/znPmyissK
         rTfp+qLTIQUQmxZ9XbkZD4Gq3DuHWUtWvLnEh0A3o5aNDvcQsifYnWaPUYicAspYO5d5
         yPw1jrMOsGmSjMigG+wZiPBah2zs9EWOBcOePJAkZnxGfuNMWpc46POPGkfPilxzQzYR
         +ntUFJz3SBOvWkwGeX58m1OqnEz/BBEKGcK691jIUWxxzPbYGMFERUuUedPUrkVioWtC
         3E6PAB1lotbKZUqPMCze/6scC6SP9KFr+ioTA0z8qQ5bDUzUMk89cPxRAeql0Etn0JJj
         a2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845929; x=1794450729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jlMIlqruFJ1uritPSLSHJBp9A2j8r7yMkm4OaCEFzg=;
        b=NU1QBIZT6cYTTdPcZy81rDeFkoZ+0y49n5addwHISykQ6/fTEClin6KFyV3T8Ic987
         UWo66BY/YO8eKHJgigVW3kcvfNi8/R+lvejPoR9zy2xuQooGtmkUVPp7bzjGEp1XNAtg
         OoqhbcdtNjWORfdR5Dkg4WpXOM7yaIxATOJ4smkgRndntHoKMuLMXIfXFUm8NKDvew5g
         DV6PIlvu+nJ6HCiAAZlUdu7anIpYm+Da1sNwsa1EXBsQM04Dj4zbd81CchrZQvDRkBke
         7fxW4CiBw2p/NQ2x4U1/uZTaz37wKln8Nrj3DU7g9njT44u0d0VSs/+sYD4qTSMnwaQ7
         5PYA==
X-Forwarded-Encrypted: i=1; AKwUvBxAOm20p30/ohdxTfUrOTCGDYBuCNQ/7EVWMxLQlVj9IP/9z4kJ2aFhkvr1Nse1XBZmArCArDy+GW1/8Mw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mo1YOFwfRTb0ycswN8Wrhlkr45YVamJY6OCfcmD/TBCg0Capx
	b10G6ZfTHwo8e3yOhLwzU29gF0Ymt3I5t1tsZ6tShUxs5G0wu4GQVl04
X-Gm-Gg: AYBFou20OrmEkOVdNGZyYPuSjK9gdtYFd/urdqkitXsC8+UkTzqxjFiFQUZ74Hns4vD
	UMErKrh/FdGhsgJbVI/Hr6k7mqNpiCLGgLp5OFTvM2Rz0STBFbZQQuSBss5QynotIUFBLwfr/u1
	k46jkZRcQVhlEh3sa1Bgb5izKWsVi3BlG3DQXv3sTZ+RbKQZPa4Qt6k+PXUA9/+iVLa/KMslgsl
	o4sOnNNCyhikc6930wmUgodv0vyzhkjlM+tGQAu6QEmJqxdM05zsNaT8KUj1Qm0v10ZS/pdelTA
	rFPYKid/ETeZ6grWMkGtMlJUbhcnP7bhsX6UJIdjeQQ19vBm4NI/ff5VBuYkjsBDUg4UCOIyaEV
	Xi1EN+BojXePoukGdVv+aC1U1dPqcBvZ/4GS+n8ej83+Eq26A3gkvXZU9LUAr/hzRqWXzFp3IcX
	VjvdHZzSP896aHM25xThPIVEFoH1dmP/G5Qgz6x3h6tGgs6gQFke48nHyXs8AE8oFsk4julZ7Ii
	WKQl5JGp3caLUfVAeAk2yIhX05rA0v62xY60qdGxogWuSOYw/zy3JbhuExDuC7gOIdc50ZObcQx
	mX4eeGQ36zaxyMAo5dGheisDYAhICHUicNiN/y5OXwUT9pGHGMNRowbFraXslGD7FZR/8JdQdX7
	EyllFRqqsJ2ZtuhGGdpW058MtF7PxxzvcosCCaI3HBAy+Hww=
X-Received: by 2002:a17:90b:3f84:b0:3ab:b39f:41da with SMTP id 98e67ed59e1d1-3ae89776af6mr15049951a91.11.1793845929206;
        Wed, 04 Nov 2026 18:32:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.32.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:32:08 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v16 06/12] ALSA: virtio: Retain queued messages through device reset
Date: Thu,  5 Nov 2026 11:31:34 +0900
Message-ID: <20261105023140.18373-7-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Protect event callback admission with the event queue lock. Disabling
events waits for an active dispatch, and later callbacks see a closed
gate before ALSA objects are freed. Enable and pending-event draining
share the same lock.

Reclaim pending event buffers after a failed probe without dispatching
notifications into ALSA objects that have not been constructed. Record
the queue's prior enabled state under its lock before closing admission.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_card.c    |  102 ++++++++++++++++++++++++++++++++---------
 sound/virtio/virtio_card.h    |    4 ++
 sound/virtio/virtio_ctl_msg.c |   64 +++++++++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    4 ++
 sound/virtio/virtio_pcm.h     |    2 +
 sound/virtio/virtio_pcm_msg.c |   42 +++++++++++++++--
 6 files changed, 184 insertions(+), 34 deletions(-)

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
@@ -172,13 +186,19 @@
 {
 	struct virtio_snd_queue *queue = virtsnd_event_queue(snd);
 	struct virtio_snd_event *event;
+	bool dispatch_events;
 	u32 length;
 
+	guard(spinlock_irqsave)(&queue->lock);
+	dispatch_events = snd->event_vq_enabled;
+	snd->event_vq_enabled = false;
 	if (queue->vqueue) {
-		guard(spinlock_irqsave)(&queue->lock);
 		virtqueue_disable_cb(queue->vqueue);
-		while ((event = virtqueue_get_buf(queue->vqueue, &length)))
-			virtsnd_event_dispatch(snd, event);
+		while ((event = virtqueue_get_buf(queue->vqueue, &length))) {
+			/* Reclaim used buffers even when failed probe cannot dispatch. */
+			if (dispatch_events)
+				virtsnd_event_dispatch(snd, event);
+		}
 	}
 }
 
@@ -338,6 +358,40 @@
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
@@ -349,13 +403,14 @@
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
@@ -383,8 +438,8 @@
 	virtsnd_disable_event_vq(snd);
 	virtsnd_ctl_msg_cancel_all(snd);
 
-	virtio_reset_device(vdev);
-	vdev->config->del_vqs(vdev);
+	virtsnd_reset_vqs(snd);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +467,7 @@
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
@@ -128,6 +128,8 @@
 
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
