Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43B379C42
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216839; cv=none; b=b14/ai6EmZYdrApEsMv/spC6iLKDjjfi3C09Dd+8n0Ss+eKAhnsZlgR+pDqOkgbAyocgIltGIuCAkTqIJigD85NUyy0dvkrypsJrzEV6Jgsy6kFBZO7QUBRE02gXA6ugZwqPTGrZcK4uZqz06BPIuuEAh8GSInIaBnTz5BTVae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216839; c=relaxed/simple;
	bh=h6xZJRHrGResOFjtr1iSFAq4gf5CGK90ztYrN1KAtZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrxju7r6AYo+cPFSPDh0wyNL21duvR4YtotWeSDLiKLkgjZEtpo8hIjm8+xcH7++TrnvXubyI+5W/a0zc3625NI5XOUNa0JRCa9nRHZuoKZGWk7jG9npNjyMBKwBc22F1J39NwoZHfKwVYvtg7utB+v/hXmuAkAIT4ASaB/XoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIAu7Ruc; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIAu7Ruc"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso410790a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216836; x=1792821636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=cIAu7RucrFQ6SlVsB8zErWgL3VIhW+ZC2rkqlXzJHxqjihyQ4/tqV3nDy+HUFqMEx3
         ViT9eq54HsVHf5DABr42gzsM4Yapqq0nbh7o7XV4xqyaKCFE8RUK8tR9y+C49FMqHeb0
         +S6OP0X4Bs043rW87dFkQN9mgPVianlOoZxYsdCSVhFMppQ2toL8SyLbybA334eusH/6
         JWrS/nSo+030DgUjNX/tB4tlaRwOLl3Fp6ESjOQ08316EBb41Us5yv/IQwtPrhbxQJAB
         bmP8s0IxzOubcfjlXX8Lomy55gauAscw7A0LFuWzvsLp76blzHCB7JJrAIMf7eW2XIx+
         QYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216836; x=1792821636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=TeYinBJFOLh/Fn3t5r5tsm1KBzdB2Hml+0UrH0NXELpy/MWFyNZVh2jb8Et5Ivu1tB
         +rqjLr8CRyoXL3x/MM40mKi6gFF5pHMwscudRPZrO1+DzIC5g/jDrhA++rCjcHANh7Cq
         JEtIflIYrL1uNiV/6sZYPciucrREhuwqg2elXOIjex9rih3opLQVjxLNaJfmUX6SHYTi
         PuvNqU8ffwRVVcHQ3mliA8gR/GL77GBMisplSs+BKrDlVdwgIX6YOJvZ5KR4zmmEWXmW
         oIC+fsRc1W8JrbogN+9/MXQwLy79yafsmdKTEHhfm3yAlVCv69Q/Wq2xQt2E3f7/Oa+v
         8/GA==
X-Forwarded-Encrypted: i=1; AKwUvByLwOvcfYpYeMYXV24huHjYKbUjs8OR1XjbJvtFBTEWANU62c1PkYC+Sk0wVS4HNNYC0x0JzYSaH017QQo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwRfXHtmL1iuiO4fDD8uux7Zw44cVjx0+2fEvZXtz+HiHYUaJc
	MkEmx5riJ2+IfAE0uyC5xm+atxdX0l4IKMZPXsRAkjedV+5iuEAMr5YK
X-Gm-Gg: AYBFou1Ed5P9vnNOygGahrkhDGZwTydYSTt1zUv45tCRajL7jTIeoGVK7bo0WWABYeL
	Y8hcBb8Kqa0UVvsSJn3gnSgNMBF6iCFh9thG/A47vjhybT3xPDay0CdLIEX3IvRVAuY15ieKf4O
	pcIg/dEvgP+t+8R7AfqJo/WAPOhIruP3QaD7F0ZT39+KvUKiaWavUopwaujQ3wBxKLepCnGX0hA
	cUGb0Nom4vFh99mK6fNM/BpmB3duxRgBcDxhRjnBXKMrxiBtPBR29lG+39cy0AiJ9gVGCtIYKoq
	99t0lao0Xd3r/tnBTnBp8zOncQOJqTYo4gJwI2eds2ea+QZ47NManaW4TeK1n/XEBl/ZGXCPRjt
	ta1oDL0jvr1sNANf+Ngh8zHLsRsxlbU1hFDVTnibPYSMG4tiKBP0paDrgZ7OxUENpplkD+nm0mF
	IW2j39yT7JNqMgQyMBAMICMuJL5W3xpaHWAUcjEXprrlZJOENCQxD20m1EzpjWHjK3j91RyVoWP
	USUvAw80vYrHqcyKXTFU+FN9HWgykY/bPkO0aF9AQwrbn4wJ2VhVg7+SDJ+vmecMkz+Xva+vK3v
	xJ+hDHkPvo8v0z1AhhRw+dOH
X-Received: by 2002:a17:90b:5745:b0:3ac:c03a:38b0 with SMTP id 98e67ed59e1d1-3acee27798dmr1860446a91.8.1792216835447;
        Fri, 16 Oct 2026 23:00:35 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ace34c8d9asm3638033a91.5.2026.10.16.23.00.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 23:00:34 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] ALSA: virtio: prioritize staged capture period work
Date: Sat, 17 Oct 2026 15:00:30 +0900
Message-ID: <rfc-virtio-snd-capture-followups-2.f2737c95c12e45b4@gmail.com>
In-Reply-To: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
References: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
