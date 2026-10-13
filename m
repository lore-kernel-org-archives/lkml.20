Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAB0352017
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791869444; cv=none; b=sBM2OnS6LYf72GI0CW88LQeX85r0vJX22XwzvDHhLmNUs+FJQ0JPkeQkC3Et9Aq5Gf1twTNuuV7RpC5fCpRgC6xuNmmM9wTEph37DWtk/kAGQx2vby8LThjfl85cP8J5XX7v73/oWFhPvXrIn7fOXyalsY+/m4QKTAmaN6knzm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791869444; c=relaxed/simple;
	bh=KcFlavboTGzQdx+SFgUh+a4o6emzU3fjZ0ClZo866qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ackYy/uMHzy/y/kFTjUzsJ6n/KfYmWDXJr0fJn2WqTWWDnxqL0uKBiNJRqDpBwf/IxS32MC8uGn+8aTzW7IVZ911u90WNeGt/52auzpYw/2SsdNpFjo6S2qttEiIvwaWVrtiI5CzIBsHUNnYZcbD2oXpm6NaPYiKrBZkONdLyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjMo0DlM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjMo0DlM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e7006bbf77so13884325ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791869443; x=1792474243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sFTdq2AdFaWp+a8LZGReJeGWYdMQaatHWPNuzNn9a44=;
        b=fjMo0DlMOPNcGBHdV4q31gzLAiLQ+A6kk4OuC3tZ6/91AJXwlRji4nH6t7bH42Js/b
         xQ12h6N/lT1nZNF5q+GdgYttBa140I9lCqnm8JU+8ekgACpsq1vKBPQ0/trxlUdg4btG
         rjPT6PEf9+oVw7+B0LfSh2xsE+WMKSydNS6DAiqUerYv9w7Of17zkLJ9IMO/XAYPG6Wf
         B+LHSQqA4zBFT82QRakq1j6vEVIVwUpIMYrkWxoyWABrBgPcOV4W9ACjx7Zj/t4dz3hq
         4zHdoTWzy9rGUgjph5lJUVHwk4/PK+RHFcjhpj6m7Bz++Qy9/myophBu4Wbbf1xojmap
         LWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791869443; x=1792474243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sFTdq2AdFaWp+a8LZGReJeGWYdMQaatHWPNuzNn9a44=;
        b=dV60SfjmRyHk4Muy4IGlYGHODe9+GtiDEpiU6Df9sX66ZTfNtQtKMr9iLHYONnNx1m
         w3z3y/8n80YfMwWNq/q85KIuaO1Q9H6SM9eedezCJK8t0I3Awl5FRBVDMPc2RROLtpSM
         MXXtj4L8GSdYPnl4WZwniCzNS8fROA9Zd3zS8PF5ykpSFVYRdjB4NTsp3sEghxe0zQv9
         LwxwFxvKHhhE0wqT3hwp6yr6qhAFmLsRB8vbVNOTliAUKuV4dbMC4exkMvkK9BVysRbR
         bICxKiHTL6NGxW7Y7bVpnI/rMrvaTV7IxZLexcf1IwcOOGMZnMrawpcXozbYp2Xe6BWy
         aSqw==
X-Forwarded-Encrypted: i=1; AKwUvByeJqsMVXmzwfwpTdcV/zHy0f2RXlUhU4v0r7Tf0i8vRW0hcVaPV1YBTkcDcEKCUXQIbcnsrvXXe1sag/M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxHWWdHiBjHf9NupHxSjSFV3gwsXrxuLU4rdw9qRhlmpNbGse7
	3ljtDIVw47O/j1tN6yYCcFIZqvg9ONIE/NPRFNCjkm4kt8H075aGzUj5
X-Gm-Gg: AYBFou0JL8/z3Tr7KSpJ4YUVQa5RRpovcqZUjqTtYOmyGquAEqC5c6toh8x0nDsWbTI
	5wuV0dXkGbnXAEZF993kIFgo5mS/jMPr7MgnIMG+6ZL2/C2fx+baO1853bhfdP3kSMvPG1ZFRRx
	fae5s9ih/BVK+fRgICKPL02fFLIdIzdl/rbu/KF9Tt3WF54d6d68f275LD4X0CiJmflhDmB98hj
	hwY2cLjMDUk0C2jNHw6BqFK765oyVpX8rkHS7Z2Z7tGYo7nWMng9e0RnChK+eMiqLZ/bJzfZSDg
	j3bC6NWo7NU3yfbm/8C5CMTuMS/YMOin3wSFY6tEZVC4ZGswCNJk0M7QL2WKq0hqabEZyINQsUc
	6sNqSEHgNDLxGPMOaxwkVqZFUWU0d/eLki89/U1TfxzVP2ZayuTA1FGTHrxLGFFoTwj7kXcms+U
	5fHAmyDMo8h37VmSkXuQZ8WokvB0Tvk6H8hJv+RI7wrkhPfsS7btrq0pr/4pVxXQ3/0bd6fkEU9
	t7EvdwKsy85/A8EtvGZdEmn2+lggT0ROZ8B09HjuZuvipJfbmVHA86V7nR1PvQ9evaNwYFWY0Rw
	gVHd7f3AfiiP8yvD
X-Received: by 2002:a17:902:d50a:b0:2e6:943:39df with SMTP id d9443c01a7336-2e842bc7e0bmr94618825ad.25.1791869442718;
        Mon, 12 Oct 2026 22:30:42 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cb6sm50820915ad.60.2026.10.12.22.30.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 22:30:42 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Joonho Lee <mynameisjune111@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] ALSA: virtio: Retain control requests through device reset
Date: Tue, 13 Oct 2026 14:30:24 +0900
Message-ID: <9d5a0ff360e66bc4ddd28aa790d617edc875e20b.1791867377.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791867377.git.mynameisjune111@gmail.com>
References: <cover.1791867377.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtsnd_ctl_msg_cancel_all() currently completes and releases
pending messages before the device is reset. A sender can then free
a message while the virtqueue still holds its token, allowing a late
completion to access freed memory. Sending also notifies the device
after releasing the queue lock, so teardown can reset and delete the
queue between enqueue and notify.

Gate new requests and mark pending messages canceled under the queue
lock. Notify the device while still holding that lock, and retain
each queue reference until normal completion or post-reset cleanup.
Normal completion wakes a canceled sender after the device returns
ownership; cleanup wakes remaining senders only after reset and
virtqueue deletion.

Keep the control queue available through snd_card_free() so close-
time STOP and RELEASE commands can still be submitted.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Dependency: apply with patch 5 for control payload lifetime protection.
This patch retains the message and its headers; caller-owned payloads
are addressed by patch 5.

Validation: ARM64 W=1 build and source-extracted ASan/UBSan teardown,
late-completion and cancellation tests. The final QEMU/KASAN reset test
covers the complete series, not this commit in isolation.

 sound/virtio/virtio_card.c    |  6 +++-
 sound/virtio/virtio_card.h    |  2 ++
 sound/virtio/virtio_ctl_msg.c | 61 +++++++++++++++++++++++++++++++----
 sound/virtio/virtio_ctl_msg.h |  4 +++
 4 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index 6f35276416fe..ed884327bb0e 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -349,13 +349,15 @@ static void virtsnd_remove(struct virtio_device *vdev)
 	unsigned int i;
 
 	virtsnd_disable_event_vq(snd);
-	virtsnd_ctl_msg_cancel_all(snd);
 
 	if (snd->card)
 		snd_card_free(snd->card);
 
+	virtsnd_ctl_msg_cancel_all(snd);
+
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
 		struct virtio_pcm_substream *vss = &snd->substreams[i];
@@ -385,6 +387,7 @@ static int virtsnd_freeze(struct virtio_device *vdev)
 
 	virtio_reset_device(vdev);
 	vdev->config->del_vqs(vdev);
+	virtsnd_ctl_msg_cleanup(snd);
 
 	for (i = 0; i < snd->nsubstreams; ++i)
 		cancel_work_sync(&snd->substreams[i].elapsed_period);
@@ -412,6 +415,7 @@ static int virtsnd_restore(struct virtio_device *vdev)
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
index 6433c870f271..3ad1e1e1b205 100644
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
@@ -227,9 +237,32 @@ void virtsnd_ctl_msg_complete(struct virtio_snd_msg *msg)
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
+ * This must be called after virtio_reset_device() and del_vqs(), when no queue
+ * callback can still access a message.
+ *
+ * Context: Any context.
+ */
+void virtsnd_ctl_msg_cleanup(struct virtio_snd *snd)
 {
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
 
@@ -243,6 +276,20 @@ void virtsnd_ctl_msg_cancel_all(struct virtio_snd *snd)
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
-- 
2.54.0 (Apple Git-157)

