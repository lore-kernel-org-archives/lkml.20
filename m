Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180534;
	b=F9ePGyWYZ9/PirRSY/L6S69FQ7ZsX5ypI19HBFgCnTLW/tweCEGjrTvsp3+e7UR8Lq9C
	 ezKVZO8EEEZpkOgQpcHmRcKPn1LvukBnwqwzqVRLebXlANskILmicFJhBw3Yy0ReWufgl
	 IZhvhzY/iOQ2VlyI8yDuz19X7CEU3B+gf8K2FyAM32eRvK9dKx9S+wH2OUGtjf/7jUe+M
	 0XO018/YK5aHHOrRDcivnw1JFPMJKIxpqOKfNl7mVwlp7tqWZlDYX6JId3YWjttsZxzEF
	 B7sWOu2+T06XhnXVurPqcvVjmzdgs9y5gJ2g23cMmBOk7i8oaqRKU8V01JP5M/fbeZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180534;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=a3+GhXxBcM4G6Y8IqN7PL+cMTmSl9a0JP0QOVvLF27Sv6PBfCpzKaJUBTS1ubXtAu+mB
	 R3EMuQWG3eLAyjdDNq8CnypjKJrgIoLGrQm7OiZn5Kf38fhpTMyTmP0FFd2jgxLQEbtbR
	 HrtYk+TifJSZfshO/FTTTRT/NADO0F+SsGDeKgSgYZAIQCb9Jifff3f4mGO1JXIBO2LVB
	 fZ9lQhkXcexBOlBNW+Q1CpZv1DItzgjMoc9ZyBm0oJT2ebQ27E1SaNx5bX9wDGipDky20
	 MmO4M42zdqYY7e8e41w6UIjvlLxcU7dvpHZ0XarVYA03dRTf1cDK8/YzC7hNByp7VIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9406460A2611
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9406460A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so490801a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180533; x=1793785333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=Lv8nc96Vj638jhK+Nu0b890PYUx8A4roeDUJaIw+7/dWn2paKf8254dLSO7qth9hYy
         Qt708dstJAezYa6e75WIk+MG7H5dOv0+bBs1KIEHTMPjCMiF+ekATn9Xg8GPTo12sb0I
         EUepLJb1cf9uFNmYjZzFFci21dgAVVPJKV5rlidxenpP8kbC4/LRySq6Sco4K582fpdO
         7IoYb9b8BUG3jQGk/V/o7tfI+n3ZtCe1jSqzhYqa7ifwHetoa+HFDTMXnZEvaFOyy6o/
         WWb5Cd+lQlUxC+VehMEh3DuyytJEsqqaNsF0kg1H1sAZPoTjcnEqvnr5IfdP/y/KxVHt
         yrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180533; x=1793785333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=sxry33WnScovED8CyIoNhdsziken1wTxuO8HIAJfcSQtm37XIyMaPbsV9Urio7eMcy
         8FZhgeJu7klio6NhGJVE8YZaRm5OU1KSbBzIxhOizdaEMsHUA+A8gdeeAud6/yVxxUOr
         kxC4hvRjDY9C6bFlddWUYCQT0GskWY+K13uTthUHbr9HiKkoZaHqasO47mSE2M3pTiFW
         PCjuK3vMuH/Bk9yPosSRs5HxTln1wgKI9IiMB72v7RNcr1C+lf6nUYJceSy715Pq1av7
         uNgZWW9lOVlcJ8/XVOexx26ePbWtG8vDG3/pouLYvgTzDIkkbq6MUDW14+sPCw/2Cb0b
         +h7g==
X-Forwarded-Encrypted: i=1; AKwUvBxzfBG8s5ybX0r6YIZc89226sQmCq/fX7K4Lyp3l+zLFCayf0zA+k2rqNjvUjHJuw3Y+y7jsfAQBErHUxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg9oSjGk9mthgWAckAkr1BP9hRXO+pere2esVRoBMjOvgJ3sps
	oV5hKrkV+Pn1dJCaA+NrYWX9qjo+5a+KwDaYqejgX/OoUnCdqDFsEab+
X-Gm-Gg: AYBFou0LTirbUS3+K8mLDUQ7IueCoeGU21bTC5NaXl5OV0SV6YXmRfV05OVSMXrFzRU
	BQTeqMiWrceZM3/cDUGPracc+OMjkRKdPQRQryKpsU57ac4zJ0Ewif13j2/P+Gmf6kTgu5+WtiH
	BAiZZvECFRI+eqByWO08tBB3LoiYhm+zRC6Uw/wGo2kWOtUEhxROuDa6NDv5LZHCLqaHcevX8cV
	W2nNeXyMOH+rWe4alOLJNAmcD2g3tPX9GaaU70t95ZGJQNhxIoeKQt2ILd1O94N7McaG/GQt1Sx
	aQooGTxK7Qz1GcskaWCXJplPYv0S7H9BYUmLABPm6kyluOVZSbm37SQFG+6SDUlV1yowT/chmAL
	2yZFBlYAlNFZS0S/59uVroQSQOR0eK+9OZogz/Q96hUxItkQ5GOnn9SNGRDoYbvADA9Bc4KjiYn
	zUxUaxotIjzpxvoXqZg0s90X6VbFasbK9SvQWR0/J2iSF1l9q+6zeg+STeZZ8uOTgD2qyc1dJ6l
	+zfWqClWLm0a1pHuZmb7nMSW+H2amS7YjgR7NmtVsd6LuRHK7POaDaL2ON6pPe+wL+xnGgh8+uu
	7luMt6ejpwiezljZWSNl/LDf1qYhK7/Wq9kj2geV16AfX72S2BJgHi8jZSy5uGZN/uM8WzYtnC8
	tI+SatTtXfQrTGaOKeNWn4hctcVVGHxk/BR1W09dXE6r0q/I=
X-Received: by 2002:a17:90b:2705:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae58319466mr1220106a91.63.1793180532909;
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
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
Subject: [PATCH v7 09/16] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 18:41:25 +0900
Message-ID: <20261028094132.20364-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
