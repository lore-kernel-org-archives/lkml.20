Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338040;
	b=ttL6NwPhHDxEEx+Qy9EPBDvzMKxucJC46mCCbvHFa1ZqWS6GZbJNDfv8Q3QzHD3LsHEU
	 +Hw6tXzVjaOL5b2FH3Uu4BOwifHXnJ7YzCfQWTI2/+22IX4ATDm3dHCdrHe047oSUA9Ct
	 1LOFJBC5fCEuocLz75L5ZdaT2BmXtp2ZXVgzI+qCKt2alGnmFOrTXbaq0TGk33M1fUXo5
	 zzDsWJmH3UYsjHdAQSHqtdim15Xi1bdjvYrniAEBc2hKKCOtbifz+wF17vI8jkSmv2KPB
	 vJTqmeV8MzG19nCJS5wfjUA9PyGmNNKtV4Q6Dl7smM8nfq+5K6Gq5wrc4quDB3rJVUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
	b=h+EP2yJLWJFhuDHZzvQx564PLTbGDdBe+4k8mKEZQ+TLGUXNJ/FFLF9KUWjYAfEumIRe
	 VwuBMCwx4DU91SrVEY+eb6vnevMgLhCXiH2oAcIhyIfOvML4dnPrqjN/Xd2hkf4OgdmSW
	 GDzyvoKGcnu2GHmVOIwIojdMuFHWyqpSUC5dGDNE1OCtdSrq85pIN2ZvzdPoXO0F+Etnl
	 e4D22pcc6PQq9O37qgT7PApLSkP1KQQshWFtEAGY+Xt0kaqohzybhjwnqeO0xz7iWdHPC
	 equ8exznwrpM3V0g0DYyY1K9k1mEcbUe/RSR7UNmiVfFxGaLrOcwt1E8t/6zVTfM07w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB8F60A2624
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB8F60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab41538192so276812a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338040; x=1793942840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=WmMymrXaoVSM0Qu0SrIO9bd78PLxmKqrPcXkQDKlfPvj8QdyKNPYYuveZ5L7r9Fmz0
         OZXf/T7ttY9ZO+UpXcQqicMeVtMcW9ATXU4DnkdgAX7AQ1Lsaz71fCyLkPsACJDBXiWA
         3sgxG9z3gRAOFSAYyZALkzH4jh/PaNPBLIwRLc5im7nNVBBsPKMIJAK/sUeCBu+ur0yf
         GkrOaHuiJ8wNhoIBybT2+oA2UDCGzZdHAsIR28s3VEQX9+9QTZ/GONOCZRSGHJU2k0I1
         7J2OYNKDAJDgiCrgDDeOa5h+S8W7TptspR5pyPBYL0p0/aIfKzFTiJK5Th/bB+Cx84j+
         u2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338040; x=1793942840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=DPOBuGA1ffazsM5eGgAstxr1Qkcp+W3qMIqR3pvIz4Ag9cTAEFTT1wGbdWZ/5X8qnF
         OJZTbL+H4Yre53Zah5NAfhos/MK/D9OxMkDeTRnPO4kkALku/ZMKDK9VOrKh9umbk3OZ
         rQqMApJ9ea500MdR5USIORoFd4aiBnxqPLBkl+odOdLbUBw5PL3tWW+sOVroqVFQhvN4
         Y7Cz2tVcP2Z4QCSNAdOtwwA+JX/xJP07JeeKK8SdTaPIp9Jv172agQdw8R904NJ/bpA/
         AdldCh50pIRxbgaX2L8T/YFWXWXQJWWXAKeFy3MvNmSHAMO0Wo6DvDafTO6eR1LOnPC6
         ui1g==
X-Forwarded-Encrypted: i=1; AKwUvBxSTV+WKLgV1cpUnJGrLFcAGTvdXQ6+qSyENCqxdbLeBGJtz0rRLz+T+C4r+YIXqK0tJtsbP5t0Y5NAv24=@vger.kernel.org
X-Gm-Message-State: AFq9FYLk5zYOVDReemwyfFF7rRGuG1SF77Fd4Cf3CPkgr1NAFlMEkL31
	12PomH3/P+Y1LUT1tN8Si0fYQs65rDUZrPC8Oho6fAFlq4B3wqkhVw2c
X-Gm-Gg: AYBFou2dZDxIXyesBj7qPE3Kq8yt01SmFwI7s7KqGTmh1eZGlXgsyCpI40jCt5+tLRj
	+c4SGqD3iZZKDhO/6Jm3pb4OeMoUAc+AtvvYPI+0vO4vpHlTYf6XOCe3AuPRqK93DKvzjbh19vd
	naIcgIWMLuUiCI8bpkm+qio8n0SLbowjsXab0WFREx1jBnpIe9gLE7qthAT+u1Ntv2mz6a65nkn
	UsM0PkOfpp9rOJPsMN3l0Sd7xMVWfzcuIyLA6J38mwXsMn89AOm0s62Vm001mht1ms+Ef7Xhzvw
	9zrwSYPlOrBmX3RD+ltupV7wYKlzTdlxWWyhlzAr5pA/pqYn9XMTWFywVh7bc+AxgE8l7WDmnn4
	1o+09uKcaZbEZpvuXTP+pr5VIx1FUG/8KnqWgklbC8X2sEfxiZfr43ytF5dK3YIJYXB9ZDnd8K7
	0w+noo++J8Xu7dwu35IyEW1jO8xzI6adD4u4JgvjJWSUcGw1xDREEYLc4bRHjslA0Lfle90txNZ
	eg2Fv2u6C8b3UeXmk6ZmIdDcLpmY0Ep+AzXmczVmtTtS90FgS44eszJUh/NjcJ6THsspPF/TP11
	tda4ztiMaDjbS6tUtACtXeGk/k+zJrw0ot+T8FyLdMouMDs4k7XMUzCqbkJopM/NN4R0gXEgEkJ
	hL1SPRRp6Z3GcP8SfUWWtKcjvFeoctra8FQhNGb3I5pGenzR6s9Nh1p3I2M7jZc2lcorV
X-Received: by 2002:a17:90b:5830:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ae89749ccfmr988542a91.26.1793338039474;
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
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
Subject: [PATCH v10 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Fri, 30 Oct 2026 14:26:28 +0900
Message-ID: <20261030052629.27742-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

Use the locked PCM reset operation for staged capture. Reclaim RX space
at the same locked pointer observation used by the common reset and keep
completions arriving after that observation. Rebase the notified-period
counter there to avoid replaying old period notifications.

After common pointer mutation, finish the matching core rebase even if
refill fails. Latch XRUN and schedule notification. RESET can return zero
before the asynchronous error is visible; userspace still needs ordinary
XRUN recovery. A nonblocking read can initially return -EAGAIN and later
-EPIPE. This avoids leaving core and driver positions partly rebased.

A forced 90 ms RX interval reproduced -EPIPE with the earlier accounting.
The corrected sequence matched the next 48,000 deterministic frames and
passed reopen. Linked RESET and prepare partial-failure fixtures also
passed with atomic and nonatomic stream locking.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -9,6 +9,7 @@
 
 #include "virtio_card.h"
 
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -392,6 +393,10 @@
 		}
 	}
 
+	/* Keep RESET operation selection fixed for the opened runtime. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1731,6 +1736,61 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The core holds the stream lock through the matching appl_ptr reset. */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	size_t position;
+	size_t period;
+	int rc;
+
+	/* Reclaim RX space atomically with the pointer observation. */
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = true;
+	rc = snd_pcm_lib_reset(substream);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = false;
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return 0;
+	/* The common reset has already handled a pointer-reported XRUN. */
+	if (vss->xfer_xrun)
+		return 0;
+	if (snd_pcm_running(substream)) {
+		/* Keep completions arriving after the core's pointer observation. */
+		vss->capture_acked_total = vss->capture_pointer_seen_total;
+		vss->capture_ready = vss->capture_free_running ? 0 :
+			vss->capture_copied_total - vss->capture_acked_total;
+	} else {
+		position = frames_to_bytes(runtime, runtime->status->hw_ptr);
+		vss->hw_ptr = position;
+		period = snd_pcm_lib_period_bytes(substream);
+		vss->capture_copied_total = position;
+		vss->capture_acked_total = position;
+		vss->capture_pointer_seen_total = position;
+		vss->capture_ready = 0;
+		vss->capture_notified_periods = period ? position / period : 0;
+	}
+	vss->capture_callback_snapshot = 0;
+	vss->capture_callback_snapshot_active = false;
+	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
+	if (snd_pcm_running(substream) && vss->xfer_enabled && vss->prepared) {
+		rc = virtsnd_pcm_capture_send(vss);
+		if (rc) {
+			vss->xfer_xrun = true;
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		}
+	}
+	/* Complete the matching core pointer rebase before reporting XRUN. */
+	return 0;
 }
 
 /* PCM substream operators map. */
@@ -1760,3 +1820,18 @@
 		.ack = virtsnd_pcm_cp_ack,
 	},
 };
+
+/* Selected at open; the staging policy remains fixed for that runtime. */
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
