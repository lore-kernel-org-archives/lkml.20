Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263900;
	b=kn8E/stkwfSRY/PspFXIGVFpcSCxJ1MSGnkMaswFxDMeQA4n7AtuhsG8p+Lv4mjWnPyo
	 nA/iUZEIn4Tswp7np6peH0yyidgKIptAm2eZDY7QaNRI9wrhw6lPyzWi3vyDWKEfOd1mY
	 hGRg779+Ag47HiTwkCqKDe6ZYYEWkSdTaVGkNc+c+cuwaOgr0i/QQQwnfxt8aIiz3u4TD
	 xFFSk1+zCtjbM7smQx3pDpXAWU4YzmL/GkmIiuAXPVB75rYu5mgutZC2vbmwf/opr0xij
	 3dcX0/ro6rBUp64ciddZSonRrJRSYmnWGAUhAYDyPrlqDAYQRF56Ig/F3xipHlHUMkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
	b=x/SeQLyXLqsD/sYig+B7LwGctmM0Uy73QIACNE5N+v70Wnwu+9E7eGND+tyR3MeQcKtE
	 /7b4DG9KCePJEJlKzi+6aLxCbLP4do+ysJl1Za8DrxrutI53rfxexC6bU6NOcCNBcUcEU
	 QQptcWYTKKSKP8LvahUz7dhrv72/ZnP4NEFIhkx7L15oz8rEXtAoE6fYkxovErSWGcU8p
	 Uv230BnOr5QmS2ElQYXi+kO0sLi8DiaCzkV48BkYz1RjmPUHx/v9O4o0ZbifWmNgrF/lL
	 2tsc9vzy7awTGDp68X8brmZ7R9H4p576jtnhgKQ23Ryk+fMoDgJIgekuRpWysPfdC1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F8606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D9F8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8246b13cbso15951765ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263899; x=1793868699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=eT4oPxLqJt0vehLbTNIH2mhmtt+2Mwa7maTZ2MZYEysHOZHfx5anz0cPd570qdx5RX
         LBh4uwduRem7viRFsTbi3VkcCj72ljudHtTDE8gNgBaQx2PcsnUmEJvVxn4EXXt0WyrI
         Jn3r1xMk1ZFIrwoGQ45oHBbhzS8QDnOVAvpojZgd+pFC/8HB19cXvK1grSkKr+buLQKQ
         1IQx68g+3oQzixPWGOAk7RAXjYfjATfxBjRMgAM/APOI/CM/yilqLy6QebXX6yY8D776
         CmQAOyIVDc1JnFszVerhjlXIePvlntBiEk0uLSeJo+RY0BBD9oCYiH7Fl176DY3YUES1
         OqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263899; x=1793868699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=iClXO+9e/schYWKBf6kO1TKHq0b1ZmA/5IKhMlrI3ITeq5FdfptxXq8bQRGzF+bEva
         s9DT8I3KB+5WcGdyGExTZ517EKkjKqjbPy9vhKUc/zkN1hzPPTEHT6iHlvIGyukHNcQg
         JdruA4wYtqa2L8BwWyaTqoYEfouFIb64tVVWVmjVpCgM3PeXyquNvFHuyhYvVWhiwN6R
         +7zXryS1M5H5vEhjgd9cR6sH4qCk1s1VMNC4thz/aNnbeE0FyT75EkPzTIKviSMTB9nJ
         BXD/Hz4qJM6Bj3Mt8ADUWSILnqVKkBxjJxAdy470CQWMa3Lu9KmAuJ+jsUOKXwXfjORn
         Nk2w==
X-Forwarded-Encrypted: i=1; AKwUvBwY5dLw8mvdCgx57kUf/PYaw0iAkGXwO4eyjd3FLjsG90hYDf9hQ4QfCNOkSNKDXv04RYd6zP7oisbtA00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwQeL8eyjU7yratsMWUkLmBegKjVCsOMlJ+JaFOsvq/mfcaOBk
	niwQaMyTz/SFq3KXug7J3Xd01/TeCnVP/Be3gzs1lnsG+uwvUXXO/ZGQ
X-Gm-Gg: AYBFou3CpWsQdcCdCuTCPMfriQPLHNIYZnuqxG+o/3cp1VwcUtq8eYFJPMym8N+7n/Y
	qblUMfJsg23CNhCQEa13A9lKuGtsdwS5WVY3i4bQO3Fdyis6hhuWUvyNVn56DxnSg3z/mu45zk/
	c63Jw7zOsMGlqyx7DCUTAi3JyZG2bK8jdaE8jRu+sfyH7QFSOvn51/mtyL3+n2cpPEhtOMdpRPO
	NU1XGU2laTHQ2cdPYEL3gZoaryoWmfIQobWqyEQD7TitZLCjG06B/HGyfnNfJ1J5P3+7LjQY4fJ
	+lvM/ysdNlUto8x/Nh5juUWPaHoRaNuWjjWMurCbCR8Ag7pMyW9PO4VmcXqNtLRU9iY1Vn9c6Bw
	6LF0ZlaDmPCG+GT5So7gixT1MTThYoQiWD2STTjSu8YGPrb3NmgOrtGM6pPQDznrnOftokZ4HpI
	+A6LbKdYlAaq/yprc2wrCP6dwrL+BYFkchK0hq4SmNTvV8eJsghsn7dz3N8wvycVVX/Qz7OH3om
	5ByNroxaUtu/CH993btV4+nSdW5AaHlhe7U6Iswtk1Qh/tLKYMcOqKUM/NptvihNOqZ0pGbf3o3
	yjN4UYG70oiDWbEPFXVFXMgKq/VYdbf/enhJoRjsRIGQmJyExYoVfMGxCUOhkZbc4WKNby481YS
	mvd599BxOc1a2Or9U1QQX8DfUkmXPhAMoy5FletLcKg==
X-Received: by 2002:a17:902:e80b:b0:2e9:5829:9b41 with SMTP id d9443c01a7336-2eb0041f925mr46273925ad.37.1793263899253;
        Thu, 29 Oct 2026 01:51:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:37 -0700 (PDT)
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
Subject: [PATCH v9 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Thu, 29 Oct 2026 17:50:31 +0900
Message-ID: <20261029085032.70689-14-mynameisjune111@gmail.com>
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
@@ -1686,6 +1691,61 @@
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
@@ -1715,3 +1775,18 @@
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
