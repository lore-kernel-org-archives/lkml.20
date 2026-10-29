Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252696;
	b=wo/K6C41dxByeZ1HXPPMUQzQvI2pJUflQhqRihm5zg9XL4krWlFshnyk5jBMFo/Mndjc
	 7QlrehYnbIrroj/KRm3PdON7ofKrFFS0eEiIfqV6sUsVf96iSjFncrlhl/l6uKB3LxopM
	 BKlp3u8Fimm9+ZklWxsh7JU1//TbRADaFcqZjXDeuWg0z4ap/XowblFugypzJ5Vw92ZOt
	 Sz9tnn0InErTzjbLc4FFTSX1roUfPjqJnW7SB4swoOOnaU2EmODj325IJfgsgQUbFxPoU
	 NK5Ib+5lYQXq87wttZsbxMNUROgMANMzvux1ZJxvl2hur4LcLTMeRG6IlDh+hd4ElYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
	b=eYwZbf0z/kUA8OD5prD30Xh2ahXOWmBv3TSps51YqMg7zJQKIEC1GrhpYHFCvOWXgeVk
	 ViB1O3TxHVdBVFykkdfxZ0v6DmW54PHNpjFM8xWnkWmj6zAyZ6RV/KoKgY1CXrKw75S9e
	 8CYPxE/bSdY4TezREnykX48ttshFaDK8wiHDRB022aHDfHzfVXr+VAK7eNB0XZNOwzCH3
	 FwZA65NpjcB/yyLnELfZ8B6eMlEBRMVxrSyomwIE5tXb5+LksH1/zxuIV/8fNIbOhH2T9
	 Qbv+1ARXYo9lYyoFY+FjMTYKbPT+LEAlVX8HEJ348PHEx1kptM4EZaGyg9VQ6zMgtIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bockavAG;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00337606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00337606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bockavAG
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8b20a899fso12009755ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252695; x=1793857495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
        b=bockavAGG9CgSPhXpT2YfENGrJDsH6ZRDQ1Okk+V9fpfIdPpMzr46n+ofdHYjOKzG5
         momK4e7xeAexQ9+yhizn/9RJiSWNRYlEKgrbXspga79C2QGhyArxLwkdyBZYjWY+rt1D
         MH0FPZB1e16Nsz0ToCPPvg3xA7WNYxUcdKc+6osULL05Swa8xqJ1vCH+WnWg724eaKyl
         F3S9NKhV7ggbTWRatF/c9dcjdrXkEAiKJ0iHclD9Tv4LqE1w1CGzSihZzUUM//prc+Q3
         HndU/GOkeu69XQIuvv9JjNWfpDekQDHlsPLX0UIXXLIehqo8p8SCVgDKjNigVfSBufSr
         p12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252695; x=1793857495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rn33wo8VGHhjpHEwoQH/m2TS1FP3dM6s2FcxZAOqUUo=;
        b=JJaWPo1mDkCPefT+D5spgA4UH4yzozsm1/SK2RXdwsr35QuE2Y6ks5FvAVeY1OXtjk
         HO6UvXMcldfG4ahf1IWFvatWY53NSA52e3npLwgxBamNxIZ//BKH982EPaJhl57x0wGd
         dbje4zRTgzfdJaTbp1weBsX3dxaUO+ZvfFx98oyh5VwEMjr+jnUnXc6ryXMwqgY+Gwvl
         fFM0OMzoG3pA50zjc95POE2WyEjcBc7ltI3unvswjdf9Mzf2Qu0rgKEi6WlRpyW4NXZx
         ZWCflgJG85/GXU7A3fxflrwvI8a07prFahPUW2vQ+hpiMhvQHPvatEbw/I66fgnP2RAR
         DkXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxse7w52kO1u9GKoj+QMU6cB8gr33AzWU9EskzZyqY/TiKdGEbpTxuu0gIzsBaD5jecOYM34iHqCA5pYKw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAxgGGyaE+D+SgU+p9OnK4079aBpe4XMkUP2GiC7x9KYvhj2U5
	ve5wYTnXqSEByWAC3OJwrgomV/fxS1u0jQSFpW5PDTkBqxXa5APltIQm
X-Gm-Gg: AYBFou2MpG+OrlOXHpVUb8lNvsn3ty2527fYullTjkA94/gFTxAbSWowxINmsfPz4qq
	IfX2BdYvNl4iKKWK/1c6kArC3CrOOKlsVuzNiIBf+/JZUWG26Kz0vangd1Glq7eTJdm00frpNER
	tlMfn0VhwOkCvCRka/H/tVk/SrkG3Bf1UWw9lHtiLnEFIdZhNhyXZ+6QL8LRbFatBxSCknR1YOl
	j6foEtwM0c9hSr9kZQA/5pMbwWlnGtLXfhfJaXEPhPCxYSVk3zG4mNRpM74Qp1+GIUituZX3GjJ
	7WaB0oCGKuBpUsPFDpe9I5EjdYhcuWOYh3ZoGySU1bYMHS8TNGS1i12G1tvgOX4pu7OWJE+BeFc
	kL/QdTBsYA9CZa4nfBHS6XGszaDBrZsIfirJjLHC0l0YRfnM4Rq5gf/Km16SAFsEz2J4e4nGBBB
	0CAcu4usKBtqJaA49w4Jp8zjpe4R1o07l1se+V7DiCINu8zcullsBWYuL/2khsF+OtTnVk0dYSR
	nvE0Lri/oc1r+XgD8+Zy3Y9OaY8PkW4AUnzTWoM96NnAybtomWbx5e6CvtTdJPmAW1MccN8/IA/
	LJkJS3fjYU7SfZSmdyMHMR/18FbDVbBpa8PRbDObhR/3XDjpqXmRE62FoqqNTItRYXB52G54ehY
	PO98SCyktmGUyqTA3RSJBuoXOqM0a2I+Zy0BORJo3sWearRU=
X-Received: by 2002:a17:90a:e7d2:b0:3ad:fb12:9bf5 with SMTP id 98e67ed59e1d1-3ae583152ffmr3612053a91.62.1793252695309;
        Wed, 28 Oct 2026 22:44:55 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:54 -0700 (PDT)
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
Subject: [PATCH v8 14/14] ALSA: virtio: synchronize indirect capture positions on reset
Date: Thu, 29 Oct 2026 14:43:54 +0900
Message-ID: <20261029054354.2931-15-mynameisjune111@gmail.com>
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

RESET rebases the PCM application position without updating the indirect
capture accounting. The next ACK can interpret that change as a backward
application move and return -EPIPE. In a QEMU reproduction, the PCM
application position changed from 24000 to 2880 frames while the private
position stayed at 24000. Both running and paused capture failed with
free-running and buffer-sized stop thresholds.

Use a separate reset operation for indirect capture. The PCM stream lock
covers the common pointer reset, private accounting and core completion.
Discard the observed unread data and return its buffer space to RX. Keep
the hardware and software ring offsets so in-flight completions continue
at their existing DMA positions. Set the private application position to
the position core will publish on completion.

A paused device retains its fixed DMA positions. Keep the observed
software ring position as the reset position in this state, instead of
making userspace read from offset zero while the device continues at a
different offset. Completions after the observation are retained.

If returning RX space fails, stop further transfers and return the
error. The caller must drop and prepare or reopen the stream after this
partial failure. The existing staged reset operation and playback are
unchanged.

This patch depends on the proposed PCM reset operation and helper in
patch 1. The series diff applies after patch 2 because both touch the
operation tables. The indirect reset implementation also applies on top
of patch 1 alone; an alternate local diff is supplied for that order.
The reproduction uses the pending virtio-snd stack with local follow-up
corrections described in the cover letter.

The earlier RW capture tests covered running and paused RESET, both stop
thresholds, a 240 ms read backlog, refill-error recovery and reopen. The
core-only plus indirect variant also passed the four RW reset cases.

Additional direct MMAP_INTERLEAVED tests used 48 kHz mono S16_LE in
ARM64 QEMU. The pre-fix running and paused cases failed after RESET with
ACK -EPIPE. All 13 fixed runs passed, including two 1-vCPU 70-second
captures, refill -ENOSPC injection, managed overrun recovery and reopen.
All 9,072,000 captured frames matched the deterministic source at their
expected positions. RESET discards observed unread data; verification
starts at the resulting position. Recovery and reopen checks start at
the device's new START position.

KASAN and lockdep reported no errors. These MMAP runs used the combined
local stack with staging disabled. Physical VZ/MOTU, other MMAP layouts,
multi-channel input and concurrent RESET between mmap_begin and
mmap_commit remain untested for this candidate.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -10,6 +10,7 @@
 #include "virtio_card.h"
 
 static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -389,10 +390,13 @@
 		}
 	}
 
-	/* Keep the legacy RESET completion policy outside staged capture. */
+	/* Keep RESET operation selection fixed for the opened runtime. */
 	substream->ops = vss->capture_staging ?
 		&virtsnd_pcm_capture_staged_ops :
 		&virtsnd_pcm_ops[substream->stream];
+
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE && !vss->capture_staging)
+		substream->ops = &virtsnd_pcm_capture_indirect_ops;
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1596,6 +1600,54 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The PCM lock covers both indirect accounting and core completion. */
+static int virtsnd_pcm_indirect_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = snd_pcm_lib_reset(substream);
+	if (rc)
+		return rc;
+	if (!snd_pcm_running(substream) &&
+	    runtime->state != SNDRV_PCM_STATE_PAUSED)
+		return 0;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return -ECANCELED;
+	if (!vss->prepared || vss->stopped)
+		return -EBADFD;
+
+	/* Pausing does not move the device's fixed DMA buffer positions. */
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+		runtime->status->hw_ptr =
+			bytes_to_frames(runtime, vss->pcm_indirect.sw_io);
+
+	transfer.indirect = vss->pcm_indirect;
+	transfer.indirect.sw_ready = 0;
+	/* Consume no application delta while returning discarded RX space. */
+	transfer.indirect.appl_ptr = runtime->control->appl_ptr;
+	rc = snd_pcm_indirect_capture_transfer(substream, &transfer.indirect,
+					       virtsnd_pcm_trans_copy);
+	if (!rc)
+		rc = transfer.error;
+	if (rc) {
+		virtsnd_pcm_transfer_failed(vss);
+		return rc;
+	}
+
+	/* RESET discards all samples through the observed software pointer. */
+	transfer.indirect.sw_ready = 0;
+	transfer.indirect.appl_ptr = runtime->status->hw_ptr;
+	vss->pcm_indirect = transfer.indirect;
+	return 0;
 }
 
 /* The core holds the stream lock through the matching appl_ptr reset. */
@@ -1691,3 +1743,17 @@
 	.pointer = virtsnd_pcm_cp_pointer,
 	.ack = virtsnd_pcm_cp_ack,
 };
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_indirect_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
