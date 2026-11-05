Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837380;
	b=C2Y+XKU17no2cC+vbUYXiWZH4q7Q6FMJk6vrTnft2wRkzYdYxZDX2twlscNFqapGpbJQ
	 si2wjehUpWpGTq9DU3HV3oEVraFW04lyNdlDv65lpt3LcJIz/r3/2YRiTDQSARKqUza1o
	 m6L2T5Qvz5qTbTSiiXHq5LyemOdy94D2ERB2hN6nQEmf4n4S0fQGbznW78p799mlta6T6
	 pDgCrPArJQYnrCGO9NkPYMwW3KcBzSLm2wtV89Bz/2UhcdGXSR5zLg4ruffllcsdqC8TK
	 mmGHKRpXCLE+01MvbY9S+CMiadOAX0DF7FG4v7HHNfHLN5MnIpBQipJxcFyQr/JVnBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
	b=VWuG4BRPKnGUVnXnj24L27GoijRUsre5Z826ZRuy/eXAyFhI7BPVRcBV5hZmX27ynnti
	 lGXJ/GNwLwH1DFuWJvQVmB1U8N/hd39DeFWVxj1TXa4FYKU3q2HadsDsuT6Lz/6B9m6F8
	 rb8SDFL3+zNi70JgGypVftICO5S+lvEkkihl6B3nySKn6qwKfARDM81s0rbxa/w+B6DaF
	 RLyHHDAv8CDiNwbM8SWm912UrCN7aysqiq6dmRRpswxZRHet2cfNRXXZTKNMYqR2q88cC
	 gBgsHrb7SDJNbKS2e1XybQtOWUoNTn3KgGNwaxDA/H9uF7iQcA4E+TsxrBGH2TQ5cRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKGOLNsO;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA13606EEAE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA13606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKGOLNsO
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso622420a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837380; x=1794442180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=OKGOLNsOdZGs3aFVWOlkhdKPQxaGGelKpNSQ1l5zSUKP+JL99Srfm/or4dauJcOgbD
         UCyeKUWlvZRfeKlAwJyP6scpbHsOq2uAaaXDGITLs1Wff0Xolat8KYUGkaQcW5WHMudr
         zJRYnD8qCnYFaI7sQfCXunKaS4QQ1iP++s8dPgV0dIfBlJvgO9wf63RMWZfWLX8xmnDq
         ckMz+JxulRy8caLuqFs67ySyF+90rpKxLleox1/2kNT5djthxBy/5hZA7uTIOAvJrjpF
         m1sQ4bN6v66x+KBVCnalgPmScUWlyph0WNOhhmAvayPhc9VyBeOjkKl0PIJ0IKvnUj8N
         ilbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837380; x=1794442180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=jqAPpTm6/0zE7kY/5oJM66TCHUze0hTVbWbdfL7alHQnHPOb7i0zj22Fu5k9qJWawg
         3FpzOpiRZEfzfKeSaPHL3rxxtiPWg3CDGnGeESOdqQtsjqywbJCRjDwLYE9c5x0FeVyn
         DpBua37ZFLTYA1Jp+zMLY29yFd87HLlrQ/iSTymoG0NwaMTHhMdzivap8RdByhhhkrAE
         e0yANWDznC3PFZbW3v1TDSjgps26k6iwTCjBpUC4OgDcqQLEK0IcyDI4rIt4RSCLsa0E
         5NHMRlftWZ3u1eFBcIIUzMPS+dKKOQ0jQvT4zHNso+Ta59YSH2zg9X/u39hxpNYkxdSF
         sa+A==
X-Forwarded-Encrypted: i=1; AKwUvByLSft7pytbsdaeuy9FctPZYwoABzC10BBCQ3VS9OEzxXc69oOgCZ0S4DsPJDwTOKN1vOLYkuIt14O9AgM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9pcjkzeS0V++8lD2dxdr8V7/li+Qd4La99dVvrphJZ5NpHvgm
	7+xUxlUf5RYipP/DAMWdgorgz+UXLAKw2VZ2RdMX0vpdARB4KRqGbMkk
X-Gm-Gg: AYBFou3s8Ldkj1aWzUsEqOdEWp6KMxruyZGzVHyXaXle/e8n5j45XQqoc9Epd5AjG8y
	tSqtm49Yquhnk3VN8LrisHv5MuuGPUkMtYfmO/JWwLQKLUIB4D3sE+GvpDvbYibJHWV1BtSVgA1
	SzCL6/DlGPv6C1ToiiOzMu1DVQm+o5mwCPg5kwKygJ9O63D74Rekq+HvPVImjblWBDnmoLnKwwv
	S+FgG9yNTZ3YyUVzWDYzq6XoKPn6iLi9MGgG9VqjzGG8w6xUgsBZOjiaP3yaV3LKKlfu5n84CV7
	px9GxFejBOA67f9PpnLjMcAcSJxxeXP75rTuAgoANaeELOYKFafVhkVSbufpxzlz6EvKuoBkLmm
	+aMJClKtCCtsn9trUTatErcxZ4SzyX+u2F+IFw/Kf9afibbbv8CcET9GSTZ7o0ExUAo3LD4+YZK
	vX7aq5swY+s0G/wnCKQheRvQbexpiX7IAai9to7VPCDlY59SlElRk63rXFMGSXRgqcbNPcDP8tJ
	UTQO5k721OGoal3Sh5w3jgZYVwF/xXxE/jrRD1AI9wN8+yihZb81Zi6Wb9qy+ztyEXTKlro8WRd
	V9+k3JNKlgFD5D2agTSpgjSf2BC+bWouLfVTofr7Uw3AWZGlriNEI0iHCiUUNg7NF6kRg5T+MEF
	udl4BoSJ7zO6aGTBsSnvQrgfKkgMDwg+nZPl5yMq8kRK7bM4=
X-Received: by 2002:a17:90b:2246:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3ae8974bf64mr15546718a91.34.1793837379581;
        Wed, 04 Nov 2026 16:09:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:39 -0800 (PST)
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
Subject: [PATCH v15 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Thu,  5 Nov 2026 09:09:08 +0900
Message-ID: <20261105000915.15177-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 ++
 sound/virtio/virtio_pcm_ops.c |  107 +++++++++++++++++++++++++++++++----------
 2 files changed, 85 insertions(+), 28 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
- *        substream operators.
+ *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
- *           side.
+ *           side; protected by @lock.
  * @prepared: True after device PREPARE and the core pointer reset succeed;
  *            protected by @lock.
  * @preparing: ACK gate through teardown and prepare's core reset;
@@ -62,6 +62,8 @@
 	bool stopped;
 	bool prepared;
 	bool preparing;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -116,6 +116,15 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +157,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +259,26 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
 	virtsnd_pcm_close_ack(substream, false);
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
+		return -EBADFD;
+	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -310,7 +332,18 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
 	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -353,6 +386,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -395,33 +429,40 @@
 			guard(spinlock)(&vss->lock);
 			if (vss->preparing || !vss->prepared)
 				return -EBADFD;
+			if (vss->stopped) {
+				substream->runtime->stop_operating = true;
+				return -EBADFD;
+			}
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-			if (rc)
+			if (rc) {
+				vss->stopped = true;
+				substream->runtime->stop_operating = true;
 				return rc;
+			}
 			vss->xfer_enabled = true;
 		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			guard(spinlock_irqsave)(&vss->lock);
-			vss->xfer_enabled = false;
-
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
-		return virtsnd_ctl_msg_send_sync(snd, msg);
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc)
+			virtsnd_pcm_start_failed(vss);
+
+		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->suspended = true;
+		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -452,26 +493,38 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
-	bool stopped;
+	bool need_release;
 	int rc;
 
 	virtsnd_pcm_block_ack(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	scoped_guard(spinlock_irqsave, &vss->lock)
-		stopped = vss->stopped;
-	if (!stopped)
-		return 0;
-
-	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
-					GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
-		return rc;
+	if (need_release) {
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
+						GFP_KERNEL);
+		if (!msg) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -485,6 +538,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
