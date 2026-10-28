Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156033;
	b=o3J7f2kUtvZXtBctP675M1L5Spyw+8Bw7nRWTQvVfW+/RUGMKVTtwc62XlNQMNKqBPO4
	 lHfKSXmy2C5FbS3Dh0CGl6Au20YIjdix1FXotavMgfuOtDqjvbDX/UxXEH0FgE4IK0cSI
	 /2w8T3yKknZDV/OF0Ah11sJIXWMxXZeZPsJ0MA63n0qv7NDlHbcnf2Gs/IV7zguUEn+B4
	 0Qk5ubPM1SrcOfl9HhZ5kC4rZ0G6qTOMpiUBufPuD+YXmn/7fB+o9lZlwDJlqBmYHyOCt
	 tHcKlrG4ceCULdSRRI+C00DX3dcs811d9nDPQB+CAftQ9vW3se1AdN1kjOWK4F0JnbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156033;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=WhCz/8BvrcZzPq1mdE0Vnu3IyQ1mySMZdK93oa5oEaQxQd5c+KGnnFkF+OadfSVdNnnI
	 5/GlopKHFjLaKOfjSne+C+bTygqIpKQFg+cfsoim+JhUjdjwYaq2JqiaR6dp3RJ1dQBZT
	 mAiK651PAp9JTl9x/lwegFv9MyZh9o+ntwi9hFyKn8TsGXZ7DAFs5+A1coBXQgoqCjcIR
	 HZh/DxtZmaha2Z6DxJv0pU9hsh5Zg5YkirIMLjL6Rqs/REBRsvp33mFZBi5kqhhGBCGDO
	 Xm1AGKlAZ40zKVvB73fM3u3Bp8XGNU4mrBN/Q20WY6lOriZLTr1MjKzwFiZmZnCAPSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPi8iLdR;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62CF60A2621
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62CF60A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DPi8iLdR
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a17a332ecso646312eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156032; x=1793760832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=DPi8iLdRyWSaczsEbkNC0GUVGXhSs0lm4GlgWnajxIkDH03GPk/RnsoCEN0RCCmQ4A
         Gutd4I+W7m/5C5xKezUBE3JXMLjZsg87O4cqBykkrgPwnJ2SvoYST38Cl/Tz9K4zUfUG
         baoR7N4XApxfEg93X1WvpYtiCemecJuxrXCQffYNfLWbtTwidrIiNvZ1/kQ2j7o3wv10
         kCH4XxtL4IhwuvAr1o8ao0JzyaVMYkYoOmRw9txMfl7+5S0UpEJtw+yYw9fy7hxmRAoW
         dSHOMyYKHe5IywS1qeneGj6Bs/4lvHmXQRufDsa8Gi1v7FoHOGUl5de12icaVJD7ICmx
         oFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156032; x=1793760832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=26zXrOOGl8BWGeyXOf6DX6N04H2t0nx5CrSVlp6LSlLLlvFvb/uKNRw26mM5YSU3sd
         86KxH890ngOcfse3ty3ytQtR/oavs3c2Q5uclpwFwMPUQiVdFlPI03Ld1gt0kwYMh3wH
         ub8hRH4SU4Ctweu1JNRFu7QeLjEuajg5lI/3YMXsoZNcB++CRgIPQB0WgYKZkBH/el7k
         xrgBpMrtCm0Q1vKfuDSfY/+I+umKHpMLakRC4rBLHFpGJ0QKdI9cUY/XfomI1MJw7XXZ
         Vqg2K87om+/LtV29PA1q5ZXMh5KET9lY4IfKCNjP/HJ6WGenwy9MSiPcCC67HiGb5K30
         2IPw==
X-Forwarded-Encrypted: i=1; AKwUvByi98yt7vvMpCbQR8QNX5bQHAheCrkGYZtFSty2+jjhCVDKPY3rYzrO+ZwittXAjvnEPoqC+QUfPLfNrcE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ6o2zbA6aj9vI2qCVJuTKqYfFTsxYCeKP/Y0ka9FlmusTvhfY
	+kib+2auOkdmHBXu2KSObLO6guR2vHNIkwAyGd40jw9DmiUzp49kqzD+
X-Gm-Gg: AYBFou0LMF4KANv15hy4G5e05rzKssKr4R7+rNNj9iQVcwZ2umj5ms+ga4Y6531IGb2
	S3akru28GW8Mkmbv1yy8Wkcv1pMUgKFYxmo+Yd3d+Gvy3U7ahuDx2unEXN5OQ6u8oL8IWy88KLI
	+fQXWIog9IpfObqWQPmUvOfOUwmyEH1u4/Wki1Ao3cSTAs91vqYbRE82qVKeCUMmd65LR3dtkXY
	6pCvT0E76lf84QqyvM0BbxjJB+G7IFWgfH4kE2mvg4QtT2/RsM/1CIYbcNMG0K7hWXyKKz9M+a1
	a1G5a6iiEFJ5TULjD0Kkeqi9hilMQlOlf0k5G9FRJZ0J7dLTmxs/LnXxoI0kMrxRqYVMHIssq80
	8aRiTQJ+oB3Q9sfXMe0S0YSBx9Xz3X2rndJYhPLFISUY56mLPyF0SnjEPeZ+j72ZmrRDWWnzbez
	D6yUDpz+FfWmbBiVr8NXGPcNfwFpuBJcE2P8bELpB06ZfMxBQyooyIBEPxdkk3/ZSMc3av0sUBJ
	rg8KDDR6G+xrwh3HjI9b/1QP9Y1B68Tr69nUawWz7a04Aw21PC783O3uQFXwIPlGtS5gW0DNHnQ
	op9QK5lOloU17ngw7a73GFu57K9UalQPantOPDbS7tSqwAKG7uxS7c6cRD2+ekUT9K1PUPeol7d
	/+gF7PkxkosCQ7V4N7Xc4uuyT3c9g+ON2I+QTvCB8opJabg4=
X-Received: by 2002:a05:7300:3a9d:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36a201eb246mr1662143eec.38.1793156031765;
        Tue, 27 Oct 2026 19:53:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:51 -0700 (PDT)
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
Subject: [PATCH v6 09/14] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 11:53:12 +0900
Message-ID: <20261028025317.92450-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
