Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263850;
	b=tUBKA8DdbPbEk905DDKM6NTiqFj/zJrwGObpFA3kNC6et3XhBRRIf6ALgdyHJSBuz/EW
	 ZPgOW6tPX2kCTJcjqL7+KThABwsdt01njJk1VPW2e4ASHoYcPn1imASDJjs5R+meS8Zjb
	 v6dMh+QyhKA+QjcKd1iX/X7CvbP94jlayzwpFZrOrptmwDas+h2JP30Rdr4cfF/vPXxW+
	 ySPttCXgU8MM5cxmRV2Muq6cwf97GhfVqTchKF6xSybOpdfdajX0OUEF8tfwTPOA8p4bB
	 GSgykY1Ds4entpXTc0zKwmlufB1gbHsRGf9hmTx1IFKkWw8TeHIifl7SH4LGBQ6fGvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
	b=W0L3XJKlGT1DZLpnBn65vUGxXG3X+lttP+EjjBwBOe+z/a/z2I5AMT3gOep5R45aI4rZ
	 l+scOyLx6z3D7q4SvYUY1UMC9ryVdOtJONW5I/mY6UR+gqbAVftYZnjJ0y7RMZ5kHe2jG
	 PBArus4+YGiXR92wOQIqN0vfRAQlqQSocSH9S9W+OnRByaRU1Y2hD8UX1GMy0c8zqjh7g
	 C4kqejq/dUxworlIXckv/hU3aSyvMeR7px4d1V+HkRCX/PxxZpiHo/2JexEURYEWLCUrP
	 ulezYTVCQrDujuBfaVO+KftjRjJ13aVrFVap/vJVQd6kZqOuB1yEL+oJTVQYoYsjcPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTvDL5oh;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93925606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93925606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sTvDL5oh
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9995ce866so16824265ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263849; x=1793868649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=sTvDL5ohlFoIshfVNUoV4RB57tZoQvBWjfTHGqnBOheJZpyjhEQLPGcR2sqYhjXh1j
         OapNZ/N7oXo7zP3QkGeV3W6IUwkYIxeQXhZiO7dTfMBknta53tJHbEzKqCIj3SXJgXYA
         g8ag0/GMK/LhlCA6DkOapQvX2fqE35rHZkLLWp2a8x0ZiAEVPHE6R68h59VlcuRUgIQy
         94NNLAlh5D4hzLS4bhBg2mGWvli48rmy9vBbw0bgRdWb5xRzMJ8EXgAft4zIFVPaUFO/
         1cdJsV3QFEnCRWsjtnDZ4DcMprLEX1Tj7u380M/YhgK3/C1SpADNxCjFYkdmYDNdxTBY
         1vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263849; x=1793868649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=L5Uf5lHc6wJAcZBr8jWcmfkJtU+u4B9lwsD0KXxRMcKxeSR2KkAG0xtaqM2JXvEGzU
         PxHXelyn2z2h+RypTTYqtqlD2Rg3KKDuADbUbLNcUE971VAmaD2mL5XLzDfXHifWMXjH
         2UepvluGTkZ1dWam/OqM992pLntmyw0bxQ7HvWTwZZZ/q+Lh5RQ9CMWvayprG0CgOUBL
         rkL8z568KXDtR0Zgi09dSjow6KqzPlkkYCzXd4dj+RR+ydri5kQTzUss+poH/xCrnczG
         Bi19qMJaABRtYmdVA9P+5DoLZa4k6L6zA545lgdXnAvuslx8xhMO+IAucr1oZ/tk+yRd
         B6iw==
X-Forwarded-Encrypted: i=1; AKwUvBz3CwJn/UCFRmlkjyxR2aA8Kii9dtpTfRlHdUbzvCvrQJUfPSeC5CCVTWeXoBcwVJ0mnLb+DgyY67nnVq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPar4GFDXWPniq0LONAqGY5tQDvLZUJVeT/1DvSqPQs8rdmh85
	19LnTXh/eHSnsjB2w4PbWhXmekVa6+Wz19xnBNhrhiZzX4twWldcBN/w
X-Gm-Gg: AYBFou16jOp17CVPe0QxFA2qRhgy4jO5kfJGJDHrPyjxgYa21funnROKCvNkbEnOlZ0
	I5Z/Oh3MrpA3/fL/DaE7NxSnMMdTJ+hUSqvrlroHPhN1A7qglsYkZz24G2+GEVzMPRyd46Xjm9g
	YQB5UW8eColAbqe5/NK+pVAkUGQrCZ7WMgBAHHPl+LQm3CljMp/uToh3QpgHpAfj0J0S9Ustgqk
	DTL+Io2xdVLxXXW221/ZGVzeEeJYR2ZD9sjJnZPxAvAA8pQ+RBjgSlOVvsNR/+MDB2bCknWTlFc
	csIIjzixgEyIlMvCqNJmVxv4x5GLnp4nVqwld+y96BSbqXi3IoLQ9ILo+vxa+tHle/VX0YGsFIg
	29aNqc2plg8FMM1c2OajyxrEjfr2WqT1alNYK5BiABkVAyIrDpP7Zc+mJ0BWXok+StmurAhU6vX
	50T7/Nrop+UuIKzilDjthbSwxfe6qIrHbvCYSQ4eMNE+9fVFhzAA2K9w5V5BvR5GeAJ+TPztYdo
	7HdccGWSnpU5G7rV9N/Z+e42/6oxoqQV//5FfX8P3oWLMIUmGg7NKX+x5Ho5nPXZzSpvdtxFjeJ
	4qODkWQ7IW81jBuDJH7dqM6eFL6YWLYK1fkuPzcmW71xm89a/m7+8S703jBeqHYHroAwYclpMkq
	qtDU25GkjtAv5SHeKY1HbuaO1maBmAGa8G62/+SY4IQ==
X-Received: by 2002:a17:902:d2c4:b0:2e9:6333:fbb7 with SMTP id d9443c01a7336-2eb004cf0e0mr48238865ad.51.1793263848855;
        Thu, 29 Oct 2026 01:50:48 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:48 -0700 (PDT)
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
Subject: [PATCH v9 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 29 Oct 2026 17:50:20 +0900
Message-ID: <20261029085032.70689-3-mynameisjune111@gmail.com>
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
