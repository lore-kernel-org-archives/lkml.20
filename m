Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144669;
	b=wAajcYTgdu2uWthoxaql4Vk0ZDOWKLkLv5KZhep0RGBGqIwN0d0XUi2QEhwVY2XGeTlI
	 4TObcY/658fQDF/ZWYOkfwrRDeyRgrxrcKSvG+mBZUQ+inmPA4TydBHppZHhrPK2p45Za
	 +mcXUGyV13NsPHKxIsxGM0q9nNhK6bgZi5BysqQ2eRT/tZV5WKwU6KDsoNGuosse5vCVv
	 QW+n7sFCzslfOOJCMwQl1QJAW+BoUgIIBOnHLUh5oTvSUl5Y7o0vAG34fCNj5FzLc0ChI
	 8x/Yhr8+kiVbnSYFstZbG79nVTzfkHu5td+/GLcP6Dk7Be+7o5o1v41rSWrSptFe2cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=3XcdBYslkJCCnen5M8RjZb9tIJCVttk35YQEbFLTbpLkY4jM+9NHp6kWz8eCu3XIc/Bn
	 kkxp5AaHVFpt10knFZkmeIw7X4QtNfFsasrtJiWxpRJEhA0PZoDXm7bWnAlnq/UdUwk05
	 RPaG5QbeCbqgcMCj+6ibSqUf6sEuehstEqzSUWLdfb7IXie/aXNm5ylJnM6kS8JAtOrYd
	 F1fZ06GQfWr0YhRV5KGJMvObpyjQFawPp14d8rR++b5Rnw+kQ14wF/5210IuEdv7t4NPE
	 IxLp45rh9R1UjVv+onLtOz0w6vuA2BNNrp8DsfpoIq3nYLPcRZgU/dRYGGBUdocJXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zca7YJzR;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E64C606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E64C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zca7YJzR
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so199896b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144668; x=1793749468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=Zca7YJzRFL3swpiR++mKfCAz5lFZB8b1pablwhtKYsojejXNE5avDhih2zW+I0c09H
         kBpkJIYoyGWKSdmTlA6bjldQdQvIkqyWOo37tXMS+dEZ4cnsI8hWbzuRrBVfwDia6hyu
         pSRQPIANxlYKANrcumFD0yr/DwMY5KPPVVMDwF8SWTdHIzlSz0xY1khoEdO/TVeo3yMd
         FTDhEEAZutjOBHZ0jkoVYcwwDFZm6gu6QtBbUvIE+PEPqhQ1AdTLzMfqVojAlIVGBku5
         p1J3syOi/ajAarqsJMWlmfrZsd/je+F9rYe19nUSjydH2K35AhQxmuXN3qWhZicOczDv
         t38w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144668; x=1793749468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=yoT1ft5BweDmdXu+jmId3khIxstTntIO2aQv5TP+mJ6KfEDPUZxNNaGq2CByjXx+Tj
         ZfKwIvcTGIBmxPqhbzA9SODwy0vRXWvGVIqaanCqyageWlD7cQBz1QLUmfUazg9eIbmR
         goRtNBGITdfqXPzsHs+VfXKFowb41OE3QzBvowvVI9up745wGcRLnKXNJpfgzXK91fkL
         A5QaJ4ALmdXsfhg6L+2cfbmUa9Mgu7WWbf20hz/6W4z8FCY2ymsEtl56ENbrrXa3vB8p
         /JWZFzslHWz973gTTLI2ap4gm3zgBAA9XiQe7s2VSaxOkBZBvjbkmt8jC++bl0rfc4tj
         lWJA==
X-Forwarded-Encrypted: i=1; AKwUvBzUrOOqFW8BWutuqch1h454LOth55hEE5kRcrUEZv95WMy9Eq1GlP4yBeoWSfyIlIrcLyPIj5P4MFBLy78=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2frH9Sp6swIc/EM/Vvvj1lxBEX3tIiIwhXnYUXFz5Y3SqAVvD
	ISBaeTIusXyYnYsM8Pk+U7QZwigYaTV7QGNYIpv7zxQQ1F7ZFMw+jC+sXBIZjg==
X-Gm-Gg: AYBFou33gM2rAJu8FAHGhUUIiCf6y/ehQVEdncdT5hdke9i2MoM8IBxSYNqf12UJoYv
	D7zxXQej3ymfuydZxsGJk7tHMCcnIR60BoB/8ePYZWVwkVc9y0yuH0+J1UydtQbn9CESkiLNnYs
	FrQ4A24HROQTaRgcZ3Nm/TnNeHEq9KP8MOdnQEb0Qsa9pOQHRT5H+Myr7DIqi12+XxHSXJr/IEo
	pepjrXQSib5+5Ew6jrp/zOs3bG2kcM6Vixv7oaZuL5XI3z4+666NpQnseuB3ztpFodcZ9W/bv3i
	JPbL1/cBHLMMhWncSNeu+NAuVJ+3T467GTsVTEMvNtaTbRhTwKd5tX9A5Y58JO/HDjqSK8IGQlL
	Z6tHdYtqeSbnbiaEwYglw57BMpcJJnkpF416JixoNyP7aQEBDKdVSez4yLvXC5mSYitg5SqQkxB
	50NYuI2f6Wzqku5RnVjRHzUB+f7uTrQmPUKu4ilAO58wZPOQaQHAeIOSCwIP92NX/EORt3MsWYY
	K+SqSpYHIaKBV0vHIdWE32FPADEGHzbWV4FgVegbLM1hZuCdn9QimuiK6RohVi+4NWllg5QC/lj
	6A5kHRakDgOZF9dloZtRmOohYLKkN5XPZzou7w0JsHERaTgksVe3JHWetOYBh2bzAvgMAxhYnw=
	=
X-Received: by 2002:a05:6a00:1caa:b0:8a0:5be1:7625 with SMTP id d2e1a72fcca58-8a5a616d3c6mr2160010b3a.19.1793144667992;
        Tue, 27 Oct 2026 16:44:27 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:26 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 09/11] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 08:43:32 +0900
Message-ID: <20261027234334.32551-10-mynameisjune111@gmail.com>
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

CPU contention can delay staged capture period notifications while RX
completions continue filling the unread ring. In a two-vCPU VZ guest with
16 nice-0 CPU workers, the ACK-fixed baseline stopped with ring_capacity
and EPIPE in three runs, after 11.74, 30.77 and 30.33 seconds of audio.

Route staged capture period work through system_highpri_wq with a common
helper at all ten producers, including ACK errors and self-requeue. Keep
playback and non-staged streams on the normal workqueue. Initialization,
cancellation, buffer geometry and capture accounting remain unchanged.

With the same kernel, input, geometry and userspace priority, the candidate
completed three 70-second captures and immediate reopens. Its maximum
matched queue-to-start delay was 20.366 ms, versus 108.112 ms in the first
baseline failure. The other baseline failures had pending work without
matching execution, so matched-only statistics do not bound that delay.

Reader scheduling delays were also present. Both arms passed a separate
nice -10 reader control, and host load varied between runs. These results
support the change for the tested workload without isolating a kernel-only
cause or guaranteeing lossless capture under arbitrary CPU load.
KASAN/lockdep QEMU regressions passed with the unchanged candidate source.

This follows the staged ACK fix and pending VZ capture support. The
introducing staged-capture patch has no upstream Fixes commit ID yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm.c     |  4 ++--
 sound/virtio/virtio_pcm.h     | 12 ++++++++++++
 sound/virtio/virtio_pcm_msg.c |  6 +++---
 sound/virtio/virtio_pcm_ops.c | 10 +++++-----
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index a3478fc8848db..d8515b2144a14 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -397,7 +397,7 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
 	}
 
 	if (requeue)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 }
 
 /**
@@ -606,7 +606,7 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
 			if (vss->xfer_enabled) {
 				vss->xfer_xrun = true;
 				if (vss->capture_staging)
-					schedule_work(&vss->elapsed_period);
+					virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 		break;
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index e143a15592f05..5d1d88f2823b2 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -8,6 +8,7 @@
 
 #include <linux/atomic.h>
 #include <linux/virtio_config.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
 #include <sound/pcm-indirect.h>
 
@@ -114,6 +115,17 @@ struct virtio_pcm_substream {
 	wait_queue_head_t msg_empty;
 };
 
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
+static inline bool
+virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
+{
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
+	return schedule_work(&vss->elapsed_period);
+}
+
 /*
  * ALSA may observe a subperiod tail before its period callback. Keep actual
  * unread occupancy separate from pointer observations and notification state.
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 795e52e09564b..663f7695b5be8 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -627,7 +627,7 @@ static void virtsnd_pcm_capture_xrun_locked(struct virtio_pcm_substream *vss)
 {
 	if (!vss->xfer_xrun) {
 		vss->xfer_xrun = true;
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	}
 }
 
@@ -720,7 +720,7 @@ static void virtsnd_pcm_capture_complete(struct virtio_pcm_msg *msg,
 			virtsnd_pcm_capture_xrun_locked(vss);
 		}
 		if (got_audio && !vss->xfer_xrun)
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
@@ -858,7 +858,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 		runtime->delay =
 			bytes_to_frames(runtime,
 					le32_to_cpu(msg->status.latency_bytes));
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 85e7576903d56..d50924b792f65 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -232,7 +232,7 @@ virtsnd_pcm_pause_restart_fail(struct virtio_pcm_substream *vss,
 				VIRTSND_PCM_PAUSE_RESTART_RESET_REQUIRED;
 	}
 	if (notify_xrun)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	vss->substream->runtime->stop_operating = true;
 }
 
@@ -1253,7 +1253,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			return -EPIPE;
 		if (!virtsnd_pcm_capture_counters_valid(vss)) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1264,7 +1264,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 		if (diff < 0 ||
 		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1275,7 +1275,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 				       &next_acked_total) ||
 		    next_acked_total > vss->capture_copied_total) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1292,7 +1292,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			rc = virtsnd_pcm_capture_send(vss);
 			if (rc) {
 				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
+				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 	}
