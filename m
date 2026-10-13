Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8123A545E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791877447; cv=none; b=FP0EUQEW2so8GC6Bqh6Xm16y4Se9yy+uiZdtL+uaQfEruJf7jpjwoKTpUEAcDrdEt3Am3dFlZx+y35cKslV5zmbR448nHaVAITIkQ3JCfyNvb5sXjSq9XKdoYQvUzNjQwFz+pePaPso6ipfxq1xSMNqP7G/MnJ3lcvcpP3aNtkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791877447; c=relaxed/simple;
	bh=Mvwm0oGZx5Wkcn15/Jtqt0fBIpKcqb+DnxaMP4V8Xb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lXU/raoFZ3dJ9k7v1MH23AzNyL76r8ssXJAwfsKnlJmtF/mEswUVQK2m1qryI9tv370cn7vfzpHhu+mIwyANrsK3UQG863Dx/4dWp4kC8us+rxp7Qt/gapBsOWmIale+ijTaR2QXdNWssiub+Aos/aGG5E3N1FqysZ0avYLxu8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmDrsbo2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmDrsbo2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1592907a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877444; x=1792482244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xMI7teFV6AvKehNWXFxNARmcpOXzUAAEZvmyqbw/+Go=;
        b=jmDrsbo2YK/CKrO+cJOlw39HH6NYPP6mhOGFWnzhk0qkcS12OfgMX6HD0LYOQ+EPUl
         Dd/9vkxstA+LDgh2lfHMKuVLEJyQWtZYm2wkze7n4o5cFYX4MUkzGcMfZw12AUVJhMLY
         +zNA7ijwZRpUZt+WwQV/H7SStzGXm2j4wgr8on5ysMgsbqH10nevifA037rbyQXEmEQ6
         lmEv+SF7JTZ6jWEjnNXaBuzPj6RTEkTlzxIHE/iQOfnoUI6FgLiEmVTuc8or4+xd2gng
         QOGc1jWqPjjcYqpienIZtpUbXiCpZ8hToAkb5b6ivgvjKgYnEZa9+hcminH3r16rA9eF
         MPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877444; x=1792482244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xMI7teFV6AvKehNWXFxNARmcpOXzUAAEZvmyqbw/+Go=;
        b=bOo3TnHN8l4fBsfSkK691H1EMitiVxrY5mWaTWZVoPT5iQMyZtkhbfb5+UiTJUISvx
         Q0QiqQVWv4Vg1ttmpyicQbDsv9wyF6H+K5SszZihK2tMfbo/AyBvTk4zQzwcz8FXjaGx
         INSq40MkcMFy6Gmt9Ed4kARDuZ+O+775SON8kvewqCV3XLcpwXETTZawuMxOEtu5wGwL
         DFfr2skHnYBK19DBLbIO+sC3AgXL9NEBzpcW9eCjjrVHqLUCdGyW4EhZM9bxNwAUHTcn
         qZ3Bq1GXShdv19Z8+QZNuwJd47TPQ8Ji8vHU6cFPOyqT8RKmif84i5ptZP6fFaoaVNKx
         uNAg==
X-Forwarded-Encrypted: i=1; AKwUvBzBwmYec0t70HkydjZxCwjAA1OOV9ylYDmiP4D5tKPFNqzqU/4bbsnt+5iE39rR3pgVmK66hQ3cQa3F0cU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQYSCqBFPJLT4YXKi8nWkxqeAHl6Dnw0FwkCpLlBdNjmV4dGEZ
	XSFbmzYAL1hwwfIRwlNZJio5012wfdZ0o314wpQiT5dAWhnM8SG8zkmq
X-Gm-Gg: AYBFou0PXqDOBSVIhezUbHc1EB/EBbJcK1LgEBJ/Ffb2emY875Gi5JN8HX3DPuS8fcz
	VjbWHF7lZJBlHt0BiJTstIRkgT5Vkd6fD23w9qz05RXM44Wr90kUKVVAThImL7rPd40mXdxR8p7
	ANkpRi3uozsToldezOM0crjIyVyzAap0zd7069CWwrbPaANeL49UxMBV7da3bcOVs1t+mAJ1i+G
	4zMWSOL27U3PHSDFtOoGhaXKOa7N8RnQaC0cmDdyaaxBHZbfWx12ycCK6dpPNEDaM9Qgg/ZWFg4
	8yC/oGnFa6OEc33gozofa/vqKmqv6SW4pDeeiNcP4Wo9ttEq9FG3k2nJ8AEJRwfP6/r5G1DhS5b
	WzdP8cmu0oIrgRkkYuoTZ7rfkaFM7QfCeoFu77X6FbGFf8BIoC2qvttpdRAJjPoJAHgWPxleqCM
	hNJ0gPFXQwROphraZ6GZnJidp3Zn8SOkn/sP4cB/KtaRfVScIM4S0UGM7ebSrczLA8JgeHV2ET0
	Gc2z5gVpkls3yeO+Zeew7vnRDUz2u6io3w9Df4b/i0JAVA9MHqL6ZitUMVLJboo/kvPx5ChMXCA
	Z33r49kln0JGpeOF
X-Received: by 2002:a17:90a:d44d:b0:39b:5622:d645 with SMTP id 98e67ed59e1d1-3ab3a09d2e0mr7403573a91.0.1791877443959;
        Tue, 13 Oct 2026 00:44:03 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm20552825a91.4.2026.10.13.00.43.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Oct 2026 00:44:03 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	Jaroslav Kysela <perex@perex.cz>,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Subject: [PATCH v2 2/5] ALSA: virtio: Recover PCM state after a failed start
Date: Tue, 13 Oct 2026 16:43:47 +0900
Message-ID: <9b9b0698d28e1d2b6d3a94f62cfbd97a7e308854.1791877396.git.mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1791877396.git.mynameisjune111@gmail.com>
References: <cover.1791877396.git.mynameisjune111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Capture trigger queues I/O messages before sending PCM_START. If
allocation of the START control message fails, trigger returns an
error with capture I/O messages potentially pending, but without
marking the stream stopped or arming sync_stop. If sending START
fails, trigger also leaves transfers enabled. ALSA does not run the
action undo callback after this trigger failure, so the normal STOP
path cannot be relied on to drain those requests. Retrying START can
then submit the same capture messages again.

Disable transfers and mark the stream stopped after a failed start,
and arm runtime->stop_operating so ALSA invokes sync_stop. Make
sync_stop send RELEASE when the stream is stopped or has pending
I/O, and keep the stream stopped when RELEASE or queue draining
fails. Reject prepare, hw_params, and START retries until a later
sync_stop resolves the outstanding state.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
Changes in v2:
- No code or commit-message changes.

 sound/virtio/virtio_pcm_ops.c | 63 +++++++++++++++++++++++++++++------
 1 file changed, 53 insertions(+), 10 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index a40ea394bf17..fe8e0dc3eafc 100644
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
@@ -115,7 +124,7 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	vss->stopped |= !!virtsnd_pcm_msg_pending_num(vss);
 	vss->suspended = false;
 
 	/*
@@ -224,6 +233,12 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
 			vss->sid);
 		return -EBADFD;
 	}
+	if (vss->stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -274,6 +289,13 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
 
+	if (vss->stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
+
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
 			dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
@@ -338,23 +360,32 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
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
@@ -393,21 +424,32 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = true;
+
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
@@ -421,6 +463,7 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
-- 
2.54.0 (Apple Git-157)

