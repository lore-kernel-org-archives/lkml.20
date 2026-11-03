Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693316;
	b=GvlueId17PlNoHbZQqIylvJO4uQh+J/k/0lBGd5TV7jURj08lfu7gDSA6K2n6G6RBIwX
	 Vj4h42Zw9A3WlHKNqviUtEJ60qIhHDAtHoLLX5PuRLPBKTPUCTwj1d/FhnpbLwZSJls71
	 jNYD4TGaSZnM+74ImQNb8iZxRqQqmh5HpS3L92jBBhPNIw3DOu6LNsaRsHmFU3x34bETN
	 Lq3k9qaqwHi6T1TMGMWA3orGXmtbQJjJvTa5cXbxfi8MfEYqsWJ2EuqWg0RLrgsV4vJaZ
	 Q8DEzGL1AvEBhEieDnpNeTsGesuV/YTVSo28P9ly/PW63xIXWV+6PikqZ1ih84a5v+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
	b=1zwVle75EWjopt/k4Omhbj01Jwe6VgsIYyzxas4Yd0oJFLcM/Or4fIpYhPlF0v64x9wv
	 bUxanrn0OccwdOwqzYv5H+kj9VmHy/zxiIvLdQsbdOHJchsBVs9ANCH3GQ7urLApsfMBO
	 buDk1pnBNa7W8XjpFoFqqVYr+RRlVr6VXvoxkH6zhInqZq/nVcf/8eRSje7L7/CqMIaXO
	 c2D1O0xXADqiSjV3R/gJSdyelN90ezxAHkRIqoA9qNyEhQSwrm9xlExX4cF5e8s4FSWXI
	 Vb5C3kjLXqPwFY9p9j/kMYn0gxGPCUMD38jCuwO/rdq7S/ouSyO+Ko0JOiBgv8UXSWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01080606A33E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01080606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a17a332ecso5941950eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693314; x=1794298114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=niiyvIXN4PAwhNlzK/S6Yn9Bzy5e563tSmRBMUFSntSGgtzgz/5AfCYP1mR3H92V+L
         nDa0RLgNNdOgtV9GRnFogq1evhiEzlIfdmUqP0IGJYtVDl0ntlkw/nqmsPWOA5eccx1R
         QRBZalrpfvhXZTogLFnWDT7YQKfI0+DaPleVel6kWzriZ7vve8i5nT/+SRK91j/xbEBn
         jFwdZ3ldfwmD0WKTeRu8praIrDM5r0RzqvZ5KqujTSDN1F4fs6z9rcdWKWgfSXmEFTVQ
         Rk+f2H+iHHOB9oMWHIVwjzvmoZfblHEXzcMQ5qhRhIwbQlI81b4QSfjhWrrOBAQEjVKs
         HCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693314; x=1794298114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=OW/zw+Qcdm9mMVihxBfsEiTrRhB3Cll+pbUKaiTdUOT/FgrqD9j7xFZabhdHLkOF9A
         kNb1UnOlvQboNsur48cCrNV5L1VCUH7RVzXSe2Z6AsMFV+1PljWmblTEQ6+Sg7vpxwHA
         YpOJMWnjm4kj39ojddgma36qn2mEcADK66/ysV2DryryYMv2rKi1sRhdVT0tV+E+2plf
         0BFdJgYWBFufTT5uYUboPPURGiLpgmAmRtoief5SCD7Puz+P52Vpp3wQS0fepGAMRvFA
         ThTISmhTXSZ7DnuYvkM3E2pu/wITEc/Kc6n2Gwf7Y1ztd/Yu4yjmaUbYLjGXorESglPB
         w+yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9/qEEJQ/yzNVWPBOsX9ErYC3NyDXZ3OUFWoJVeR0iATbaCBpbJiPfJH11SiKhRq5NsK3rX4ZAlwtlmnE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dgkunIqlC4O/5CJxVV3F9jHlfGphWe//i8k0hMaSaeKTon6Cn
	tKskp/vMwbS3euitZTbZeA0OuoXN6tQMC9T856o/avag32Ul+kiI5dNj
X-Gm-Gg: AYBFou1BjS4+lwK8L0GXmGbHJJKTTEMyfta46x2jDUOxC86VMag2DYuta++rfk5hfEB
	sddM2WO8JIB0EP75zUMnA5+0e73pGfml1nmUWJ5KvCCKiCrohuo4c+zhuWdIUNo8+cmmsVWjH06
	NDwD9+tachDZqVO3GGHis8rH27rF44svsIyA47mcJdIKeaytNeuu2EmxyzXoVw8g7XsSekRBDHR
	yKCJORE6Vx3tZ/6d4HbJu22tLsJdn9gRPDJzvvutlW+NF0+bQdVp/ETHdtBomt9pT2/zyRrmXVW
	Ix/tJIYROM7PVTWUaK/0Cir9qv47L09Z2Qm1Ya45x2char+q5gTHCYdZz0GRR/mfImptbfExv9Q
	i+pznAjWISEnvQZCuXKIk/Q9D4Rm4Ekh/N4pop94aBEkFvzWl29UEsy1+R+ON77oYJw3TipH1ZP
	ASlZAZBa5oU/aRB/D5LOli8SkU9Yr2iiP6hs1duWw5Vp1Iw62es79sQbGeFqGXr6Y1eipFlFVFO
	N66zcLN2lnINdUiadkD9FhGiRr53/spoUgpJQGvQBqisxDFfp2Suby5W5P9meft9RUReV2pFpvO
	Fg5LST5R2w/3sScUolZIGiQKz8439awgV8FiUKJxQF+t3pLFABAUid6RGvbzB4bcEkJEEiAD7D9
	D6kVo3LgRlku61ZEuiv/CSGOntPtanEU4TPGZE99q5HJMveg=
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr18011806eec.19.1793693314004;
        Tue, 03 Nov 2026 00:08:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:33 -0800 (PST)
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
Subject: [PATCH v13 02/12] ALSA: virtio: Recover PCM state after a failed start
Date: Tue,  3 Nov 2026 17:08:11 +0900
Message-ID: <20261103080821.16983-3-mynameisjune111@gmail.com>
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
 sound/virtio/virtio_pcm_ops.c |  106 ++++++++++++++++++++++++++++++++---------
 2 files changed, 88 insertions(+), 24 deletions(-)

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
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
@@ -56,6 +56,8 @@
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@
 
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
@@ -115,7 +124,8 @@
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,11 +227,23 @@
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
+		return -EBADFD;
+	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -273,6 +295,17 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
+	int rc;
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
@@ -311,7 +344,12 @@
 	if (!msg)
 		return -ENOMEM;
 
-	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	if (!rc) {
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->release_required = true;
+	}
+	return rc;
 }
 
 /**
@@ -338,31 +376,40 @@
 
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
 
@@ -393,21 +440,34 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	if (!vss->stopped)
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
+			substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +481,13 @@
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
