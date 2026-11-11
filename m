Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355614;
	b=g9L9Z4EiKMgg4XqbP47Jml08u2WpiNlI5SBFw8TwuTj8lFCWAPG1L3Ioi9iJumyiJVnq
	 zqjeS9pHew22IQt6SiVOJ1SjDfOKijmeRmiFEexAWt13Q/aFfLCVe3pDk4OGZIzZUS4qt
	 VBttGmxI5QCieUFfi0LMdYhktvYSowSpqGiKFqJJb7Ky4RX5jA5NOEL0ZzzTxjNzwMQUY
	 mTKHqZviKslJut373UhgyY3bfjpMVVXHziG3pA8TEzmzbuIntdqdBaXQVBEKVJpMAL7JU
	 qtS1WP8Rq7wvvBLmCoM3ZqMZNgjHXRV/R5LHFMkDeXujfpfAjZFHmgy8cBMvCdoMV+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
	b=lwRGVUXz2JSTCL5GlDBXimBgNodZTj3dhVzqA3Prf7xB/lc7pXoG+Ya7DhfUB1LVYqeZ
	 RG+eTuUMScR//5aCsz8bs2857hfu17E0J6BGvNaS2u32vquUu7Oc3f4XsG+6hiMEybFda
	 ntB5P97Wn00610OdrK16D+O/y48S7MgautYdzwFMiFniF1Hc+0TVVVnfmDP360L+My5AP
	 auoQN6+3Iwkvhh5uydRLveU3FM/7HHNcCn1sh3Ybutpdo2SvgXkBTgh9sU1ydVrSKdWS9
	 f87mHsySXJVlxDYAe4u6E6tiLP40+oHIdlajSgnc0rPICdzbyTvAdvjSsQREBSg4uhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2ptl3vI;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372A9607000C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 372A9607000C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2ptl3vI
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1459111a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355614; x=1794960414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
        b=x2ptl3vIvr/jyR8QI04l8BZwOg25KzZ2lRqx8JNCzaQ3zu4lRIUwsORsEMnup6Yjcu
         iU4PdTTRIt+QR4pvsvJ50VyagxRY2r1knJWGckdJD6uVTTmq7P46ZEjneBhKYRRg67Lk
         DiCVeNtdB5zCyA9MidZmvfOKSD4s/rGs7GtFbioCZeIZ8mx3Gb3F7qM2fGmHYbYf852y
         RhcDTCpoe3VS6dJo9ISlMFdBU9y22Zc2Ozs8YDylQg47suRMR5d2zsLaJU2ow0oChWuC
         RBTeYr/Ajv34ddbE6jIDmyEsBezyPlR9HPcxUg/Qcy+REYXYleQI5tPe+Pqjzm8gy387
         2MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355614; x=1794960414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
        b=Wb9qMGE5emTN+QxigHke8kZaQRfzvcqV96NnltoKAjPBJKVSBqaslUdplkIzvvw+GA
         K8tLthEbx9Ax/zxC+pWcHCOyX5HChI18429j1heE0Fj3QUARrCtJZz1ZGSDYNJ1qlfI3
         PXyLs4GIm3h6bXJhrZ5JTyRWlEIXQRYbJqaNdroU106p9pJymojCpMwv0WqB9fe0+yMR
         eVXTxYgenwcFyUiIjDieowCkSFuOkvrGSM00on4DMDHz23APoUYG9kBum/la7s19dlQm
         tXkYvpx0q+drnNiykVth6uLeB1aN9ZnaNxdoXQOnHhvKIdX4Zju2qTwqsweEBK+nQjh9
         vufg==
X-Forwarded-Encrypted: i=1; AL+hErHZPUbwgYsptQ72RBXBYHFiQuqKev+AcZUq995EHwO4Dck6Qhpq6R1DH+qJcWkzZXxDYhG4OClcwNe5+9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6kgOwqb+o9pwUJAz7iWmlh5ZT1VA3L69aZ4Ez50eln9q01xZj
	wXfoEpnywyewiaDKIrAmOWx23/4B7Wz8GhhEZl1DIQ+KOVZLnAjk9+tN
X-Gm-Gg: AYBFou2aVUkrU2OamF/+h0dN4IrTQ4C6MgB5F6eqXbdk+aQR54ghOAM+xjonMiyLxA2
	AAD9ELe2T+sectaExj9xcA6FADTIrXsU67gUOOfHVGOXaOPdVTe2Gx+DcuKiT+pP/0NiZXqq8w/
	nvsN72A3JG0NahacW32T0a0D+qLx66rl9AN6vqiUADza+8vOPifEEd8KFZ2jvCE7wHiwv1gBut5
	GVDrUotSyhXdZEcxBP6XCqnFbX2dZHDcb3nJJT/pCBlRQxx4lTW/T4FrXv9Nl4XMcvhxGof1K3R
	VJRxA4Fcr3iPF64qILi11Igb7Qphi4gfuZunHdrrr40kK1AX62JehuxE3mwhZV4/dg027MXWsg+
	VOraTdBCeDmxBwMy0gHQhD2A+FvprLMon5HrYuw2wLGf6RiM5E8n1pc5rnXQ/YS8DMtszMi501V
	9uEiyyXZNic9EPDLhxerTe68sqZeJByW2+63tIkf2EuRcsr4wg1+RlNI2DNKPlp+9v0O84eALCX
	4RB8/gEfqUjFiERJTlfYxKWTxezvEDpoSebsJzPteNrAsKDFTRcmmUbLrdhzkxneFl3hGJN3tc8
	jVsC1En1T+oCqU3Np9XvT8oRkgwzyINXukLgdnjugMlWRLUpLdrQERMpLUKfheOd+3RU3TDwydC
	QbWlWm+CyrcZSg4O6+Dn9ml4+36H03tjdGetNUvLp+XbnYw8=
X-Received: by 2002:a17:90a:e7cd:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b182f2b5ebmr413417a91.26.1794355613529;
        Tue, 10 Nov 2026 16:06:53 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:51 -0800 (PST)
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
Subject: [PATCH v24 16/16] ALSA: virtio: preserve playback progress across pause
Date: Wed, 11 Nov 2026 09:05:43 +0900
Message-ID: <20261111000543.28550-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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

TX completions can arrive after PAUSE closes transfer admission.
Preserve that progress and schedule catch-up when the stream resumes or
a rejected pause restores RUNNING. Cache device latency in stream-owned
state so a late completion does not need to dereference the ALSA
runtime. Clear the cache on prepare and RESET.

Use the existing indirect hw_queue_size to keep outstanding TX below one
physical ring: buffer_bytes - period_bytes. Equal modulo cursors then
mean no unobserved completion, and a non-interrupt HWSYNC cannot consume
a hidden full-ring wrap before deferred period work. Continue using the
ordinary ALSA pointer update for silence, drain, stop-threshold and
wakeup policy.

This also reduces queued buffering by one period. With two periods, only
one period can be queued. The minimum geometry and pause/reopen cases
pass in QEMU, but worst-case scheduling tolerance has not been
qualified.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    2 ++
 sound/virtio/virtio_pcm_msg.c |    8 +++-----
 sound/virtio/virtio_pcm_ops.c |   25 ++++++++++++++++++++++---
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -53,6 +53,7 @@
  *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
+ * @playback_latency_bytes: Device delay cached independently of the ALSA runtime.
  * @capture_ready: Managed-mode bytes copied but not yet acknowledged by ALSA;
  *                 always zero in free-running mode.
  * @capture_boundary: ALSA boundary captured for this prepared epoch.
@@ -113,6 +114,7 @@
 	bool resetting;
 	size_t buffer_bytes;
 	size_t hw_ptr;
+	u32 playback_latency_bytes;
 	size_t capture_ready;
 	snd_pcm_uframes_t capture_boundary;
 	u64 capture_copied_total;
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1002,12 +1002,10 @@
 	/* Keep latched errors until prepare establishes a fresh epoch. */
 	vss->msg_count--;
 
-	if (vss->xfer_enabled) {
-		struct snd_pcm_runtime *runtime = vss->substream->runtime;
-
-		runtime->delay = bytes_to_frames(runtime, latency_bytes);
+	/* A queued request can outlive the ALSA runtime after hw_free. */
+	vss->playback_latency_bytes = latency_bytes;
+	if (vss->prepared && !vss->preparing)
 		virtsnd_pcm_schedule_period_elapsed(vss);
-	}
 	if (!vss->msg_count)
 		wake_up_all(&vss->msg_empty);
 }
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -770,6 +770,12 @@
 		memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
 		vss->pcm_indirect.sw_buffer_size = vss->buffer_bytes;
 		vss->pcm_indirect.hw_buffer_size = vss->buffer_bytes;
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* Keep unobserved completions below one physical ring. */
+			vss->pcm_indirect.hw_queue_size = vss->buffer_bytes -
+				snd_pcm_lib_period_bytes(substream);
+			vss->playback_latency_bytes = 0;
+		}
 		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
 			vss->capture_boundary = substream->runtime->boundary;
 			rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
@@ -1143,6 +1149,14 @@
 	return rc;
 }
 
+/* The queue capacity keeps equal cursors unambiguous for playback. */
+static bool
+virtsnd_pcm_playback_progress_pending(struct virtio_pcm_substream *vss)
+{
+	guard(spinlock_irqsave)(&vss->lock);
+	return vss->xfer_xrun || vss->hw_ptr != vss->pcm_indirect.hw_io;
+}
+
 /**
  * virtsnd_pcm_trigger_inner() - Process command for the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -1197,7 +1211,8 @@
 		}
 
 		if (running) {
-			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss))
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			return 0;
 		}
@@ -1219,7 +1234,8 @@
 				return -ECANCELED;
 			vss->device_running = true;
 		}
-		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE))
+		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss)))
 			virtsnd_pcm_schedule_period_elapsed(vss);
 		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -1260,7 +1276,8 @@
 				virtsnd_pcm_trigger_failed(vss, epoch);
 			} else if (virtsnd_pcm_start_queue(vss, epoch)) {
 				virtsnd_pcm_trigger_failed(vss, epoch);
-			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
+			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+				   virtsnd_pcm_playback_progress_pending(vss)) {
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
@@ -1610,6 +1627,7 @@
 		}
 		if (!paused_pointer)
 			hw_ptr = vss->hw_ptr;
+		runtime->delay = bytes_to_frames(runtime, vss->playback_latency_bytes);
 	}
 	if (paused_pointer) {
 		if (defer_work)
@@ -2226,6 +2244,7 @@
 	vss->pcm_indirect.hw_data = position;
 	vss->pcm_indirect.sw_io = position;
 	vss->pcm_indirect.sw_data = position;
+	vss->playback_latency_bytes = 0;
 	vss->pcm_indirect.hw_ready = 0;
 	vss->pcm_indirect.sw_ready = 0;
 	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
