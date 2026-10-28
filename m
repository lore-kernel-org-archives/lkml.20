Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156046;
	b=QnPvyxbfv4L76xaE61ptNfp2YHOQRe3H1UJe5S11O5x+q85/PmqTAkrpZo02D08nau0R
	 ySAujH7q73dtJGYrWFZ26MQZ+lXvb6liWbyXtvn0JOaAewWzIjHhwafH8nbM3AL/AjwD9
	 mh4UiiLz7a40PstiVRkEExlh5QhqPwRl6BIkMm+iyz6/NTT5t/R1k3SSmoWsiY8UgV4GF
	 36Ybi1W4ON6WWqsAY000Pe5O4JhINnl6YV+J6MIrQ0gewhCb7ojriWaGkQ5BDucPfSl+W
	 b1vnTNHdznIVCdOZmdSloSuhlwU/CMxm/u9v3U1dvXE0QO4L3jm4nCBbKxujKo5+E0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4XywAoxeaZzuOeDhhvc4sxnHZ3aBk4zO8y4jW5OboPk=;
	b=t3GEs9l/l+t1bQbTAV+zMY9W4O6v1jtCK6zeZTUmJKxEl6zFUD/gsbFIsR1crjxoUGjw
	 lHC+oCuMhIBxem99ZOngV3JighJBicB2DFtb9ssk45tvGWKmu2HGXGrsvcORqkOc+BMou
	 DEdD1uK5KLJja6dC3X+ALrjMWCbpRipyypDE45+g0JRU3vVYmNFUdPbtPaaKz7froovp3
	 MtasZk2qUVeKbdVa8yWpL5dC/HVlqWRwJcayO7CWV+rAo4LCY2YUbeWv37vwrxkpIDfhd
	 s+oqm15BRb9QfS2gIdvcVKHKz0VM/98i7V44COU9OWhOsEzcZtg+lk4/GIWjQFTOcCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="a/CLPs6S";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E543606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E543606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a/CLPs6S
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso895580eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156045; x=1793760845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4XywAoxeaZzuOeDhhvc4sxnHZ3aBk4zO8y4jW5OboPk=;
        b=a/CLPs6SKLseQRbZzkyTHraboWujER2DPf4MSbMsMLLmkgaL2N2TJAOjpy/FXghYwY
         pr4eYBBqi8q/TPf0uGrnKeGhCBVacRtYrKdwZkLpIrxh4byVuMZiHx+Ic5oSVOfDCCXi
         UP5YB0hYNMHWOeZCy621obuwFkMFTJI6Fy4yOvPwVIq2V7qS8sKzK8OKxNP1oBzV72Eu
         V0yavOxF7nF9k4hj8t3RdRc8iEiCtVHEQWsOeOElEmG0ftqDGvq5ry14JU3o5IUQETCJ
         JethVJJ+uED/wSTKoP2WwNrGkt7+M2y9lurXUb08jkBlf9NBd6eO3GytC5vvW+e+QejO
         QLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156045; x=1793760845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4XywAoxeaZzuOeDhhvc4sxnHZ3aBk4zO8y4jW5OboPk=;
        b=UKZd/bgZIBCOuUR2rNWqyyTBBLjcO6WAA2yqC1KH+0zYIwqmGMPDb9ksd21Tjmxc3M
         ggKByFyjFEcdzjZfGHgUIHnRfKrhBI+SgSRnwk3gZUH33XKj1rEdefPTLex7QfNDv6rc
         lFH1lj+ptvy4QOndVTolqDNDelq0kXIr20IX8ppg9YsikXI6zA8FIxt62fQx+lVK0qd0
         y+rSZbo3LV8DkO3DytbyI9aK/PHoQ8aEwJ6cxcTPR4iiO7edJyaUTPdgZGTQV5WjMGXs
         c0UtC4Fj10MpxKwrnVMMsJKHU7dXR7sQ+g0UWZLgi33kGlx1e9eAZXGAAtE0KRyqnFPH
         9yNw==
X-Forwarded-Encrypted: i=1; AKwUvBxfg2GcvMrk0zNn9RPqqpcc+k443vLgCxtYFOa2z4punLhv8v7QpWI44p7tLtWhxzYCvREI0PqXGEtUXN0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMT5vcNRuS5b1Bq9HQvy89VKcwWRqLPdK5XvQdQ3Bd1DEOCShM
	UCYQ+umEKwhusKuptFjSSLP/Bs59YEuc6LJ9fsB4Kc/fdwFM/Fc2i+7Z
X-Gm-Gg: AYBFou0uAUqx5nQfingP1wXZVClMGn83KLlOnBcJJ6XsVf8klzO6GxZqp2tKt2kZvQr
	9jZg/pYKWLjYKYiMP3Fo0/jzr4vL6nh16iAL9ldT2uZeHKUEWk8FRgmXUv0vP0Y6ZK1Koo4g+BV
	KMSTYNu4ovBtnhNpzrwBTLbA++lRB8k6olA969VJ3ifoXV+mLJS2Kx88Zr5uJof1Vybsv5SIUtP
	EITh+jbP2jbgAYQoEGKkedTZGnn+zBlm/TlJJ3lt/i5v2oNBfbTvwzIDz9l7bicml+gZ9gf9v3J
	pw1aET+w8OPAni4y9qKqUalf/TRk3f4wbXv/e6Pq+XUFUoQphlVmVRjkHCWfLAvJyarxqMfX2ZQ
	iD2qQGyNT+/49UFfTPNGwt75VfVLoNtQkOUkYZ4/Fe705i1fsoHH70qPRwKVL6dzmqGfacyWD3D
	6cHrtzt0TL4xnYvaJVZUBnQg2ghR/WTz2HeBdzACBnys4BJeXld7SMjzBxbIVpWkD/Q9XbA+s+q
	Q3jNrYkRDBPwgNyMXZvWOx1pbeAUP0MZsQNwvr5OH08Cmxsy/IOXCI/rDjbZFkr4W9ypLYfrP3P
	2tWltp82/CN5NQB41MpNsybsrrnzEWeeSnnaPKythbNZ6SiEDSe1qgvcx2KSgyyaDtkZuiGVqkf
	wJB5A0k47GI0zzAsTyx+fPJcCsqLhKW522tj4YBN4CHGD0pM=
X-Received: by 2002:a05:7300:c7c3:b0:369:9af5:7bc9 with SMTP id 5a478bee46e88-36a2017929amr1448976eec.23.1793156044817;
        Tue, 27 Oct 2026 19:54:04 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.54.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:54:04 -0700 (PDT)
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
Subject: [PATCH v6 13/14] ALSA: virtio: fence staged capture state and recovery
Date: Wed, 28 Oct 2026 11:53:16 +0900
Message-ID: <20261028025317.92450-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

A failed PREPARE can leave subsequent START or ACK paths able to queue
requests. Device reset can also leave stale queue and pause-restart state,
and a failed open can leave period work referring to a released runtime.

Track successful device preparation under the substream lock. Require that
state and a live virtqueue before queueing transfers. Clear preparation
before reconfiguration and reset, stop transfers before resetting the
device, detach outstanding buffers, clear queue pointers under their locks,
and cancel period work before completing state cleanup. Mark all streams
suspended so prepare re-establishes device parameters after restore.

Keep prepared capture buffers eligible for NOMMU bounce copies during
native pause. Suppress new notifications from an inactive failed-open
path, cancel pending period work on open failure, and guard the worker
against an absent runtime.

Use the control-submission result to preserve the previous pause state on
a definitive failure. Keep RESET_REQUIRED when a submitted request times
out or is cancelled. A RELEASE_SENT pause retry waits for RX drain and
preserves an existing XRUN so prepare performs recovery.

Reset pointers, indirect state and capture counters in one locked section.
Bound staged ACK by the position observed by ALSA. A successful partial
read while paused can still cross ALSA's stop threshold; arm synchronous
cleanup for that path as well as an ACK error. Remove the unused
start_failed argument and protect suspended state updates with the lock.

The partial paused-read reproducer failed its first prepare with -EBADFD
on v5. Both pause modes recover and capture 48000 frames with these
changes. Queue-failure, failed-open and virtio bus freeze/restore tests
also completed under ARM64 QEMU with KASAN and lockdep.

This addresses the remaining Sashiko state and lifetime findings in
patches 2-4, 7-9 and 11. The controlled XRUN comparison found the same
client-deadline failures on v5 and the corrected kernel; it does not
justify relaxing the capture overflow checks.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_card.c    |  25 +++++++++-
 sound/virtio/virtio_pcm.c     |   2 +
 sound/virtio/virtio_pcm.h     |   2 +
 sound/virtio/virtio_pcm_msg.c |  14 ++++--
 sound/virtio/virtio_pcm_ops.c | 110 ++++++++++++++++++++++++++----------------
 5 files changed, 106 insertions(+), 47 deletions(-)

diff --git a/sound/virtio/virtio_card.c b/sound/virtio/virtio_card.c
index df7091b..852cc27 100644
--- a/sound/virtio/virtio_card.c
+++ b/sound/virtio/virtio_card.c
@@ -348,6 +348,16 @@ static void virtsnd_reset_vqs(struct virtio_snd *snd)
 	struct virtio_device *vdev = snd->vdev;
 	unsigned int i;
 
+	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+		struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+
+		guard(spinlock_irqsave)(&queue->lock);
+		guard(spinlock)(&vss->lock);
+		vss->prepared = false;
+		vss->xfer_enabled = false;
+		vss->suspended = true;
+	}
 	virtio_reset_device(vdev);
 
 	/* Deleting a virtqueue does not unmap its outstanding descriptors. */
@@ -364,9 +374,20 @@ static void virtsnd_reset_vqs(struct virtio_snd *snd)
 		spin_unlock_irqrestore(&queue->lock, flags);
 	}
 
-	vdev->config->del_vqs(vdev);
-	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i)
+	for (i = 0; i < VIRTIO_SND_VQ_MAX; ++i) {
+		guard(spinlock_irqsave)(&snd->queues[i].lock);
 		snd->queues[i].vqueue = NULL;
+	}
+	vdev->config->del_vqs(vdev);
+	for (i = 0; snd->substreams && i < snd->nsubstreams; ++i) {
+		struct virtio_pcm_substream *vss = &snd->substreams[i];
+
+		cancel_work_sync(&vss->elapsed_period);
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->stopped = false;
+		vss->xfer_xrun = false;
+		vss->pause_restart_state = VIRTSND_PCM_PAUSE_RESTART_NONE;
+	}
 }
 
 /**
diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index 8a578a5..b62c181 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -332,6 +332,8 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
 
 	/* Serialize the pointer snapshot with ALSA's pointer and ACK callbacks. */
 	guard(pcm_stream_lock_irqsave)(substream);
+	if (!substream->runtime)
+		return;
 	if (!snd_pcm_running(substream)) {
 		scoped_guard(spinlock_irqsave, &vss->lock) {
 			runtime = substream->runtime;
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 7962308..1da8f09 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -65,6 +65,7 @@ enum virtio_pcm_pause_restart_state {
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
  *           side; protected by @lock.
+ * @prepared: Device PREPARE succeeded; protected by @lock.
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @pause_restart_state: Device-side state for opt-in pause compatibility.
@@ -106,6 +107,7 @@ struct virtio_pcm_substream {
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	bool prepared;
 	bool suspended;
 	enum virtio_pcm_pause_restart_state pause_restart_state;
 	struct virtio_pcm_msg **msgs;
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index e7258bc..5e0a3a5 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -369,13 +369,13 @@ void virtsnd_pcm_msg_free(struct virtio_pcm_substream *vss)
  * substream was stopped are never sent to the device, so their length must be
  * cleared before the substream is started again.
  *
- * Context: Any context. Takes and releases the VirtIO substream spinlock.
+ * Context: Caller holds the VirtIO substream spinlock.
  */
 void virtsnd_pcm_msg_reset(struct virtio_pcm_substream *vss)
 {
 	unsigned int i;
 
-	guard(spinlock_irqsave)(&vss->lock);
+	lockdep_assert_held(&vss->lock);
 	for (i = 0; vss->msgs && i < vss->nmsgs; ++i)
 		vss->msgs[i]->length = 0;
 	vss->capture_ready = 0;
@@ -418,6 +418,10 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 	bool notify = false;
 	int rc;
 
+	if (!vqueue || !vss->prepared || vss->suspended)
+		return -EBADFD;
+	if (!bytes)
+		return 0;
 	start = offset / period_bytes;
 	end = (offset + bytes - 1) / period_bytes;
 
@@ -562,7 +566,8 @@ static int virtsnd_pcm_capture_enqueue(struct virtio_pcm_substream *vss,
 	unsigned int i;
 	bool added = false;
 
-	if (!vss->capture_staging || !vss->runtime_active)
+	if (!vqueue || !vss->prepared || vss->suspended ||
+	    !vss->capture_staging || !vss->runtime_active)
 		return -EBADFD;
 
 	period_bytes = snd_pcm_lib_period_bytes(vss->substream);
@@ -871,7 +876,8 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 	guard(spinlock)(&vss->lock);
 #ifndef CONFIG_MMU
 	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
-	    vss->xfer_enabled && written_bytes > sizeof(msg->status)) {
+	    vss->prepared && !vss->stopped &&
+	    written_bytes > sizeof(msg->status)) {
 		struct snd_pcm_runtime *runtime =
 			vss->substream ? vss->substream->runtime : NULL;
 		size_t reported_bytes = written_bytes - sizeof(msg->status);
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index c7e85b1..0685a00 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -128,15 +128,13 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 };
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
+static int virtsnd_pcm_pause_restart_sync_stop(struct snd_pcm_substream *substream);
 
-static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss,
-				     bool pause_restart)
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
 {
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_enabled = false;
 		vss->stopped = true;
-		if (pause_restart)
-			vss->xfer_xrun = true;
 	}
 	vss->substream->runtime->stop_operating = true;
 }
@@ -170,6 +168,7 @@ virtsnd_pcm_pause_restart_send(struct virtio_pcm_substream *vss,
 			       enum virtio_pcm_pause_restart_state success_state)
 {
 	enum virtio_pcm_pause_restart_state state;
+	bool uncertain;
 	int rc;
 
 	if (!virtsnd_pcm_pause_restart_enabled(vss))
@@ -196,19 +195,24 @@ virtsnd_pcm_pause_restart_send(struct virtio_pcm_substream *vss,
 		return rc;
 	}
 
+	virtsnd_ctl_msg_ref(msg);
 	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	uncertain = virtsnd_ctl_msg_uncertain(msg, rc);
+	virtsnd_ctl_msg_unref(msg);
 	scoped_guard(spinlock_irqsave, &vss->lock) {
-		if (rc || vss->pause_restart_state != submitted_state) {
+		if ((rc && uncertain) || vss->pause_restart_state != submitted_state) {
 			vss->pause_restart_state =
 				VIRTSND_PCM_PAUSE_RESTART_RESET_REQUIRED;
 			if (!rc)
 				rc = -EIO;
+		} else if (rc) {
+			vss->pause_restart_state = state;
 		} else {
 			vss->pause_restart_state = success_state;
 		}
 	}
 
-	if (rc)
+	if (rc && uncertain)
 		dev_err(&vss->snd->vdev->dev,
 			"SID %u: PCM control state is unknown; device reprobe required\n",
 			vss->sid);
@@ -223,7 +227,8 @@ virtsnd_pcm_pause_restart_fail(struct virtio_pcm_substream *vss,
 	bool notify_xrun;
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
-		notify_xrun = !vss->xfer_xrun;
+		notify_xrun = vss->runtime_active && vss->xfer_enabled &&
+			      !vss->xfer_xrun;
 		vss->xfer_enabled = false;
 		vss->stopped = true;
 		vss->xfer_xrun = true;
@@ -330,6 +335,7 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	struct virtio_pcm *vpcm = snd_pcm_substream_chip(substream);
 	struct virtio_pcm_stream *vs = &vpcm->streams[substream->stream];
 	struct virtio_pcm_substream *vss = vs->substreams[substream->number];
+	int rc;
 
 	substream->runtime->hw = vss->hw;
 	substream->private_data = vss;
@@ -354,7 +360,10 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	 * an invalid state. Just in case, we do a check and try to return the
 	 * queue to its original state, if necessary.
 	 */
-	return virtsnd_pcm_sync_stop(substream);
+	rc = virtsnd_pcm_sync_stop(substream);
+	if (rc)
+		cancel_work_sync(&vss->elapsed_period);
+	return rc;
 }
 
 /**
@@ -469,6 +478,9 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 	bool stopped;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->prepared = false;
+
 	if (vss->capture_staging) {
 		scoped_guard(spinlock_irqsave, &vss->lock) {
 			vss->runtime_active = false;
@@ -528,6 +540,9 @@ static int virtsnd_pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->prepared = false;
+
 	if (vss->capture_staging) {
 		scoped_guard(spinlock_irqsave, &vss->lock) {
 			vss->runtime_active = false;
@@ -599,8 +614,6 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 			return -EBADFD;
 		}
 
-		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-		vss->hw_ptr = 0;
 	} else {
 		struct snd_pcm_runtime *runtime = substream->runtime;
 		unsigned int buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
@@ -616,31 +629,30 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 		}
 	}
 
-	/* ALSA prepare resets its pointers even after a suspended stream. */
-	if (vss->capture_staging)
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->prepared = false;
+		vss->buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
 		vss->hw_ptr = 0;
-
-	if (!pause_restart)
-		vss->xfer_xrun = false;
-	vss->suspended = false;
-	vss->msg_count = 0;
-	virtsnd_pcm_msg_reset(vss);
-	if (vss->capture_staging) {
-		scoped_guard(spinlock_irqsave, &vss->lock) {
+		if (!pause_restart)
+			vss->xfer_xrun = false;
+		vss->suspended = false;
+		vss->msg_count = 0;
+		virtsnd_pcm_msg_reset(vss);
+		memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
+		vss->pcm_indirect.sw_buffer_size = vss->buffer_bytes;
+		vss->pcm_indirect.hw_buffer_size = vss->buffer_bytes;
+		if (vss->capture_staging) {
 			vss->capture_boundary = substream->runtime->boundary;
 			rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
-								     &free_running);
+							     &free_running);
+			if (rc)
+				return rc;
 		}
-		if (rc)
-			return rc;
 	}
 
-	memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
-	vss->pcm_indirect.sw_buffer_size =
-		vss->pcm_indirect.hw_buffer_size =
-		snd_pcm_lib_buffer_bytes(substream);
-
 	rc = virtsnd_pcm_dev_prepare(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->prepared = !rc;
 	if (pause_restart) {
 		if (rc) {
 			virtsnd_pcm_pause_restart_fail(vss, false);
@@ -759,13 +771,23 @@ static int virtsnd_pcm_pause_restart_pause(struct virtio_pcm_substream *vss)
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		state = vss->pause_restart_state;
-		if (state == VIRTSND_PCM_PAUSE_RESTART_RELEASE_SENT ||
-		    state == VIRTSND_PCM_PAUSE_RESTART_RELEASED)
-			return 0;
+		if (state == VIRTSND_PCM_PAUSE_RESTART_RELEASED)
+			return vss->xfer_xrun ? -EPIPE : 0;
 		vss->xfer_enabled = false;
 		vss->stopped = true;
 	}
 
+	if (state == VIRTSND_PCM_PAUSE_RESTART_RELEASE_SENT) {
+		rc = virtsnd_pcm_pause_restart_sync_stop(vss->substream);
+		if (!rc) {
+			guard(spinlock_irqsave)(&vss->lock);
+			vss->stopped = true;
+			if (vss->xfer_xrun)
+				rc = -EPIPE;
+		}
+		return rc;
+	}
+
 	if (state == VIRTSND_PCM_PAUSE_RESTART_RESET_REQUIRED ||
 	    virtsnd_pcm_pause_restart_transitioning(state)) {
 		virtsnd_pcm_pause_restart_fail(vss, true);
@@ -813,10 +835,9 @@ static int virtsnd_pcm_pause_restart_stop(struct virtio_pcm_substream *vss,
 	enum virtio_pcm_pause_restart_state state;
 	int rc;
 
-	if (suspend)
-		vss->suspended = true;
-
 	scoped_guard(spinlock_irqsave, &vss->lock) {
+		if (suspend)
+			vss->suspended = true;
 		vss->xfer_enabled = false;
 		vss->stopped = true;
 		state = vss->pause_restart_state;
@@ -887,7 +908,7 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
-			if (vss->stopped) {
+			if (vss->stopped || !vss->prepared) {
 				substream->runtime->stop_operating = true;
 				return -EBADFD;
 			}
@@ -920,17 +941,18 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			virtsnd_pcm_start_failed(vss, false);
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
 		rc = virtsnd_ctl_msg_send_sync(snd, msg);
 		if (rc)
-			virtsnd_pcm_start_failed(vss, false);
+			virtsnd_pcm_start_failed(vss);
 
 		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		vss->suspended = true;
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -1230,6 +1252,8 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
+		if (!vss->prepared)
+			return -EBADFD;
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped) {
 			rc = -EPIPE;
@@ -1275,7 +1299,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 		u64 next_acked_total;
 		bool free_running;
 
-		if (!vss->runtime_active || !runtime || !runtime->control ||
+		if (!vss->prepared || !vss->runtime_active || !runtime || !runtime->control ||
 		    !runtime->dma_area)
 			return -EBADFD;
 		if (vss->xfer_xrun)
@@ -1308,7 +1332,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 		     (bytes > vss->buffer_bytes || bytes > outstanding)) ||
 		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
 				       &next_acked_total) ||
-		    next_acked_total > vss->capture_copied_total) {
+		    next_acked_total > vss->capture_pointer_seen_total) {
 			vss->xfer_xrun = true;
 			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
@@ -1352,7 +1376,9 @@ static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 
 	if (vss->capture_staging) {
 		rc = virtsnd_pcm_capture_staged_ack(vss, runtime);
-		if (rc == -EPIPE) {
+		if (rc == -EPIPE ||
+		    (!rc && runtime->state == SNDRV_PCM_STATE_PAUSED &&
+		     snd_pcm_capture_avail(runtime) >= runtime->stop_threshold)) {
 			guard(spinlock_irqsave)(&vss->lock);
 			virtsnd_pcm_capture_arm_paused_stop(vss);
 		}
@@ -1361,6 +1387,8 @@ static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
+		if (!vss->prepared)
+			return -EBADFD;
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped && runtime->state != SNDRV_PCM_STATE_DRAINING) {
 			rc = -EPIPE;
