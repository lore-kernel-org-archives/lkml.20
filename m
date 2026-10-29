Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252649;
	b=CYEs48nd7h3s9E5GtyhU4vpJmfLLUORigBXSc4ib/pE0L7DI/2IBVlwqTuOySVvU+e5E
	 Vdr36Q1lmYuveCwDSrOholgHv34U3/vs/ovas/d941M+0hfeBaitB9o1UlnAn1vd9Als8
	 Tpl3g2T5hbzFhl9CtID1pTIP9Ce9kJ/SgabGr/FSpRKbVtj52ikiFTgIvRNVhLybLZCNA
	 xTqgIjNReHQUFtptpJizQW61SCPpqJXUxPHvd9ScJYvxpUXSpkShQcZYtkd7W7BcrEX12
	 mjMQugt/duPvAXXNKo2k4/xozGW1148MWp49GQi335WlrOpjSd7/uilf+KXKMAZGNuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
	b=EvGkJwYckFduKi9yQt6RvFiH+SRJn7hPFOmyanGdQe5S/yEjMvr8UHbuYlEGYPSketSn
	 vnui98BfpifY631NUbXOX4JpskuPb7V2Z9DLxkLD0vcwIombB2DUGpOoest2jRJsjvrU8
	 kaoH6ahV0WWxBB+bZmb5NxiuQqVW+Zwwv5FK7YR5h/tpXhOY2k9InIql25q9HYnoOMBIN
	 aRnP3UdohUzR06Bz11vW2ZNBCIqisVuGInkjNm22Kkeq3Y+n5DYfDSLdMqVPkDFOOsf4x
	 qezMdX+zM2LEXhjGdwqQxlGwrApZD4DjFREVXWIEaqPDWMDioyZfOLy9GtJakovZuYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0B8606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C0B8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so794850a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252649; x=1793857449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=bDIX1sMw/e3SOcdgcRnYG+dm99kKmvygroicWzCI1pbXHrNQYgAl/pTll67dDIF2Hb
         dxyzdFy6t3rlLRF4DX2yDnX4tT87mAgFvrfO1CiCqlT5gNfRpGDgD+N1vFK2Dv2XGvTU
         YhQXgB2Ybmj6M/U4uIyFa6U5gw7L4j2+OHc7azEyCFA4rhcy/V+wQO+T7tor/3ZB13ML
         u3zPZbFe7dlsQUntDd+C7Uwo7UKeosg7fO0rKRhj+ZH9EL11CGRZLmdPq9qGbRnPFmCG
         vHoUG3/QLyR6hvMUUCgPXM80D893/4cLudOMV8IjMacFVPFJJspxuCu/cA7aBzJZi4Mc
         ScKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252649; x=1793857449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=mCxR2Uqp22IGz6eJkBzPEKbFFzJyOUXoQjCKwJCIbrY9CGK8Fn5hP7ceHweQAucIE7
         ZM/aJonG8bmeqtb9kSdc4mQCRIoT15b1EMn2cRCf5Qdl/z9AdaFmwnDzEyiki72AAqYx
         eMkmLpyjBplmjxUG1S00zIVlJMmROAq3D74IJpDdxZuKmeYib2eKUoirENzp9ueclooU
         Elr7ZZiksGW+h4DlpKArNOEs0XqO+iyEZYFUQCeCXFCL7jKs9up+NaEXATVQzEEEbeVO
         QKzZGz4PdR5u+fXnVQftew/A4BIPspS5zmiCIMDUVDtatb4P3BW6dCvDCy5CtYciDlAf
         uGlw==
X-Forwarded-Encrypted: i=1; AKwUvBxuQbnW7PNoKez4skhj0M6D1Ddj5lfV8Y+xK6NB5aLYvuvF9qF72Z4rxCf9LUCGQ1gM6UtqXtkP8JesyS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXjG9qP9FFOyIpkbKDNC/po23Rd/FbpMgH4SSgXS84VgYsW1ge
	sqrHoFEynTpWl9CM3auM9wLV4W2iMzV0CBJaKtG0mWFU6K2cKzuSUfbSb5waOA==
X-Gm-Gg: AYBFou0LgJHtBKmUAh9c3MVDABjEugX5732SLqH9wnRcaOx2Xc1/Z0AMgF9Ns20UNS/
	v11dt2wVLr30s/ZGo0JUNISTz2LECnorlrhe2AU4Lojo08cOSeoapaiMmxpUKif06bz/bjsF4L9
	MWhX5Hr1dn/mECxhRZKJsLWvMeZOE6zb7+Aq5koBnM4wSeKq5Wc7rXwtYLs2FWikKeoV8Hzc9xp
	qEmd7QgcH38s3U1cMstYddikxGhZzOlL0x+1pAVGF5aWgUYkLqprTfHpxrzRG9e2MW3mqr1GRNU
	L2bO6ALjhXvcbVdGMTgHwR6td+ScKt8dksEmDiZ3XnCqc8jNHOcWN6jVJ7QKFdw3Yv7md6pX0TG
	lhCFI2FStx1XpEDF/4DlLQrHnqQ4uupcabA1YcxkBWtYsYhWHRqk1zbOUTTu30/bZP9/spg1jzB
	es+tYpFl76gJlbqWqH3xEl2z64c4NnOBPCyAhE64gAQBL/IRXWHg8U1CzSS4zTYnAq9GhJepn0U
	dGqrl3xFH3+0r73o1kQFeePcNW7wSw/MLDKsmfVxrWkPJKAL62mpwQDQH7DxoY7hTFli5MtDSCr
	SoSDtXgFBWHbDHT09dJKoXWf7eGpVdkJStyOGpvKKDzFEfDT9nJTz/QqMa3y+JJqnfZSRGqzruE
	HtGLcfWvXSyPCCjLod3kY22Wn3Qi3WrgPz633cgDDmlGDCcs=
X-Received: by 2002:a17:90b:6d0:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae58169cf5mr3260196a91.10.1793252648579;
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
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
Subject: [PATCH v8 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 29 Oct 2026 14:43:42 +0900
Message-ID: <20261029054354.2931-3-mynameisjune111@gmail.com>
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
