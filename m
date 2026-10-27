Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144632;
	b=fembWneN82dVbA74S2zt0SrBvNycrI8eec/wZhah5Z1MEiEPnXbh+A4ZlAuEyQvDxnYN
	 F6phIVbozX01Wi98vDA3FhGy7Xv8GXlLTDa6toGy7tvUUQRSLjWgxYRMopmJCqyvBfTKj
	 Joc0jrbUTNE3A1LsG0p6QBY9uYcybrBeU54PmC/sxsnPKF0z0+6zE/s1oUJUX2KxqB6sN
	 ujZjYb3FwadpB6orLli6dKeVYGr3dKc/zy1jRYclWu5h/VkJnZ6F51gSy0qVT0OEs9A2E
	 ziubcMXGcsAwOnSHtCDHX6NyfA1167KVsnXyEo8AoM1VmPIHq9JRd4Oao/JcTWRJkkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
	b=RvNWDQFJe42lr1GSDxniHowqw4SXskb921iBHO349R+D5sZeW1uz9qcA3Dm3vP1DKXkT
	 9njK6+OClvdda2ZaAlnr4vLow1OFYUXAlGvqHC7DA5GwC64WlMrXwkPKQKcsPkqBDt+N0
	 qD9OkXtHCCSbOxBZoiPbPIZLYz45U0V5c1sKyMwDg4G3YHUft4PqnmlkY4L9k9/UvWJq+
	 TPe+vIBGnY4ZpTAuiebUrtW03491aDChb7lB1F373q2GPEfqchiK5W/Jb9usV7bAUKeh+
	 hI6/m94NM/uyIFrc9rf4jPBFvidSxhh0wzyoLFebV5rG+qi7qXdILEy5oQEYKQSlL1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJLPFGrS;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261F606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6261F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJLPFGrS
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-89f639ba307so166920b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144632; x=1793749432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=zJLPFGrSqbtJWU1hvmiEjFrjd/fkHppyCgk5q/JJsjAp+s/rRf++blFLTnNpMK8gAy
         pOWj7QnsGy9WH6MHIHDkzw/3kovDXUsb0dRAfgt2ck72c85YoX6rVZz5ShdwT3wreMOo
         Qj3P4BhhfwbjXDEWAQIrfCCWBlhN6AzcT07BK3+OSB6bXp+o4vEcCAQnMfp6gCvlLzps
         soRTf3qNEA6qEE/f2e7Qkq0yvodRbpaQSswpUsH+ADxWXGDskUemBUcwRhyx3+5IkwUF
         vBvCGAgz91WIeH+XhdHApP2X0Ybp+aXnUmdjkIBM6FS5BV7fQd5//NjfUnGwF5AP6nOX
         8PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144632; x=1793749432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=mQRI48LZ9DpiA3N8GuA0nMreCRejuj9/SgMkCZUislaf9k9PT0NitFoj/z2vqvZbVK
         OUibUkwWfF5byPiJBUSaSVuGMZnQ0D4cV+C4jqDmztega5H+V95o661nhxbY1xu8BNYu
         bcWCRtoQF+moFy4rJWyixayeAuL4acV1KBL8EwV8HjYWGidi5RpG1wkxMYHqMVVq9odd
         039RvqHmCs5lv7R2pyl+mxvbhBorHmkuE0EQRGUHWjjtKpxtCilLa8OwP9tVFSCNKsRf
         L8v4827zB1X6km/vmTryeeGLrqTRYl87+ydrMz/PwaWN0bEtnQj0unHiSnOwXJQEEDWC
         2MTg==
X-Forwarded-Encrypted: i=1; AKwUvBwUjxSFuBLx2aBfwlvQkke/EaR0VgDypNlwknkjQF/AHoR/Ey9hGzaQiDPd/HxRwHocbCuZoopTo/rZFW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvIJ7alJwpkspcX+mqHmeagcZDolpWVWpDLrs81NNzHib3V6x0
	css8WxsYg5XUeD2zTQTA/RAB9fJAfMpYw2TeRxxBPPiT9pkS5q3HxBD/
X-Gm-Gg: AYBFou242MRvXOCX5eGT7m01YiQKnnmRx3KyiVa+hl16/rEV28UWj1XZ5l8D/vAFjuf
	GaQLtIGhxsl48skplcmJiEMPUnoxrOIqzgDjPiUc9IQytNPOB7l30kJbfFqxpnmL11x0P+Xjctf
	8oreEbtnoQ5QXaE1KVsg4vQpmLRUjWSVSRd/EUCD7XDKEAiiAgnMzDUiieUXoOt8lt4eY1N7WrF
	yGcgVhMYpgSO5sA16kNyDVp/cBqixFo471s6+sHat0GyzkfuiVMUhExZMPSAJix5CzldRcORq/Y
	8cVHp71/xK6vsYBnYFUOcBw5R4eaAqR/0TnmmHDvCZaA8YWz4nfRH+cTnBUt0MQtT08/GsIGanI
	B1pH1S0g0oNo6Fo/Z6COszqmaPVkE9dY6fmQ9BfV1jDUinU3tpSe6gv5mMEbEguffvMKfMhYHcd
	aiw37DK3X8r3Voy7ul/lf64z7Lbfc7XS3aQFuwdJfOoYJv8aYMvChhQEev3oFZ7DIBOvKmaG0JY
	90qC0RRek7Xbw05EPVqXdOOhZCuEWCJINQ3XOMZ2BpShVdl8J03DFv+slhOdkus1DciEpkfm46z
	yLJ1uKVdmCVDGTgRsgNBokzTDDc5KhNGf9ZlSCYVNT7Kg1co5XgROzK1hnT50CQjisaHthkW7w=
	=
X-Received: by 2002:a05:6a21:4cc3:b0:3e2:8f64:e500 with SMTP id adf61e73a8af0-3e90241ef3cmr553702637.62.1793144631817;
        Tue, 27 Oct 2026 16:43:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.43.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:43:50 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 02/11] ALSA: virtio: Recover PCM state after a failed start
Date: Wed, 28 Oct 2026 08:43:25 +0900
Message-ID: <20261027234334.32551-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027234334.32551-1-mynameisjune111@gmail.com>
References: <20261027234334.32551-1-mynameisjune111@gmail.com>
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

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v3:
- Protect all stopped accesses with vss->lock. Keep the RELEASE
  decision and stopped transition in the same critical section.

 sound/virtio/virtio_pcm.h     |  4 +-
 sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 16 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8837dfc12828..8048b14e6c80 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@ struct virtio_pcm_msg;
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
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index a40ea394bf17..970499fe419b 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /**
  * virtsnd_pcm_open() - Open the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -115,7 +124,8 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,13 +227,25 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
 		return -EBADFD;
 	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -273,6 +295,16 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -338,31 +370,40 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
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
 		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -393,21 +434,31 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
 					GFP_KERNEL);
-	if (!msg)
+	if (!msg) {
+		substream->runtime->stop_operating = true;
 		return -ENOMEM;
+	}
 
 	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
+	if (rc) {
+		substream->runtime->stop_operating = true;
 		return rc;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +472,13 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)

