Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252692;
	b=o4ZpzwtlWKOCBviH40D0KpRaZEkMm4YkZ1ZHkbxb/7DP059ifOqEvFNhi6BRzDxpfb8K
	 RqYK/QRkhnTr4wB7C3Bzeu1kGmdi3QVruSeSpo5juvACUMCliZ6ni1V1exo62mzEJvH3Z
	 er6QoCBOxflrgqF0Nm6hXfnO5Tk02A8+lm/LJUG9jE8Wu6cO77hqkeEpSdPrc09VXTzUs
	 UC4GzDwSEbEaXVXJKCo9nroQdxSKr3wcA5cYVSMxJKSxkCFolgs7zWKNmipihyEwFU076
	 NsLEYgW2E2QDmRQKgCjV8L6ilXf+yHnCDjDlwemn3Ssf4kIQHjZ92q5qpPg2dMs4g7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
	b=0gpZLVMB4wnAM7U1WG4Eo20f9LMAytj8UUx7R/hk4nDgm8LFrlQspD2KUY4k2u9wqVqy
	 6wV53lb7KsYZeP+9SRqPt09WpI12lfg3tM7xqr2YD6ocDECh5+8GOHgqhuLQpXzPV+9cX
	 7XOqKXwO5gEJiPNcgdqYrpPlnDMR+Qyl7nf27MPSslqqXwmzwlj6WqC0yDbXmhRR0DrOH
	 h9vSJJW4f4Q+hWhnNbA0jvT+dM/LM7K6D2XpZ6hR/2jMoOTyhyDh01KIz9ja2QsZeP3kk
	 hfd99VKYX56fLNeDfmKMEUdHlEeKgiz/ZetzMLI0U2WVV+4aMppAnYGrP+6TmsHVt/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPyag5FX;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA73606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA73606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LPyag5FX
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso10546805ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252692; x=1793857492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
        b=LPyag5FXfsJXD7Pr3YwWSeFXBaO4vo5BGXYim41xQTRUTv3MGTNhcKh0M9ws/mMwUC
         V95zS85DqADTkxTYw3Une4Tqw/WJ5uwfc+B4IqAQgrS0sFiF1qrOPs1JkJkT46+2wmIh
         8oA4pYZCMRMGGxUuUN0GUAE5mLb856aXVtjGUvnjgvXOmGkxnVs49C4H/8vgUI3mnfox
         RPjSNittzqgP74TxGoNy4OmGAvi88DUPTg9CamUAQhdk1k/2lfMaOdFf9IMp4IPovfkj
         JZaJ798Rg17+LVTU3QyxELpDKlAfzYvE4lE1UEPnNsZ8gviVZRda+a96z9VxfPRSxOfZ
         flig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252692; x=1793857492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H28URnKyaN7/kOHJ43ygrA1xfHZ+j0XXEmbGM+MQsbE=;
        b=Tf7n+zuL7JZdyuHGX4jijfy4Z3sEgDy1nPiuPT+Hpt14u/gUchpJCgq7eCmv1/9tH+
         2szK/JxGktP4ywsumZeA+9/gKrftRxomGRvcW7/2rIdcbRFvWVQjTzdIFQ9y5T19X0Nq
         e9uR0ChLYYG2hNkRgCxJARm4SCpf3DoPcflEhM8G59GCPufCWZhwMC/GIgp0X5M3251/
         2xscnxVACySS94yXHW2ZJbJFDB7q4qRcTxJnECGbcxY5RpyjcNwLOHpgq1WEpkam/OUw
         Zsh+GkKI6GsyI8lkXmlKWlyafJjIJfS2IyXBZkhhYfiBmjHPl5R1tGMxtqLkEe7Mu537
         X8cA==
X-Forwarded-Encrypted: i=1; AKwUvBxi/MAuSmd5JcXLvCCsRGq1k5sk1z55NxMGG5P9pjcGDdMly1d5p13LnCCKSo/cgr/21QdBgTKG0R9D+jQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJS5axM+wujVJ4A2FQkwKqS43L7UrLGaf2k80n4EkikF4Wza3en
	rO5iNvGKmQbcSwWMjNzMoi+QC3eQHBvsgtoB+aQ1HOFB2EqvwIzctrkw
X-Gm-Gg: AYBFou3P0TUxgPanSl7ugtuzcnOVm/YIzfAx+f2DPdIYkBDAliF/nG4bl3okrqwxHSt
	mxX/28c97tx0ZHTi9nB7IvNmnnxhmYQCEFQ9qACbUka6uoZF3bklLFjKFofXJTV2gEhzP4RnYzQ
	F5MtNyEl9mh9SNwaTlrhxD+BsicKubZh1ws93AJNRzCIE9SZhpQsoOl8rkTUCN7CMsEw9XEb5JW
	edpbJxelH6bmTxQWsuEJzRd9VbQkLDKsrZuLmm8/sGR8yYUB82zx9BwXyZ9mBhkIHn+IahgCDCy
	KsTPJ6Mh7UJErYHa1ay8LQ9Oepm6w0bSMqUZ+LXevM7Hx9PcKH8J/94RozIDVATcJSGoG8CbmSE
	Opn4BsRPF89pkECQeYOzjLiRw35OwNT7bBmpcU3dBZKcxRdEoEmH+yzB/x/7RjswyDwmewT/nbo
	2yKiDm2/st/mOk3eNDqu/461JcN4otO28MtEkCOmUY5vsuB1oynAcejDn0fq03LmIfdxA1nwcI5
	5ZY2sKAdpTdGThmwSbIZiWK6IrY00mu0Lk+r+uv7+SkqNdg2FUIuOv86GOCPesUcFBeX16pO0EI
	OJ5nj6oud+KVsiWQqgJgG7dmcezQgDf8AqN/09/4dCsJuzEnwZtHSK/t8L/goHJA07KCJT03XGX
	loYIDh4nIpdhHXCK8TKRebxEEH6VNRpxGlV+Yctvq1dg+TJE=
X-Received: by 2002:a17:90b:28c7:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae58140220mr3556932a91.52.1793252691492;
        Wed, 28 Oct 2026 22:44:51 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:51 -0700 (PDT)
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
Subject: [PATCH v8 13/14] ALSA: virtio: synchronize staged capture reset with PCM positions
Date: Thu, 29 Oct 2026 14:43:53 +0900
Message-ID: <20261029054354.2931-14-mynameisjune111@gmail.com>
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

Staged capture maintains private copied and acknowledged byte totals.
Its ioctl RESET handler cannot keep the PCM lock held until core has
rebased appl_ptr. It also rebases the copied total, which loses the
relationship to completions arriving after the pointer observation.

Select the optional PCM reset operation when opening staged capture. At
this step, ordinary capture and playback keep the legacy RESET
completion policy, including when a later linked member fails. Call the
common snd_pcm_lib_reset() before acquiring the queue and substream
locks. For a running stream, retain copied_total and advance acked_total
only to pointer_seen_total. Completions after that observation remain
readable. For other states, align the private counters with the common
reset position. The operation table stays fixed for the opened runtime.

Complete the core rebase even if refilling RX fails, then report XRUN
through the period worker. A successful RESET return therefore does not
promise a usable running stream. A device-generation cancellation can
return -ECANCELED after common pointer processing; recovery still needs
the normal prepare path.

This patch depends on the core reset operation in patch 1 and the
pending staged capture and lifecycle work described in the cover letter.

Earlier narrow-candidate ARM64 QEMU tests forced RX progress between the
pointer observation and accounting, covering two capture policies and
10, 20 and 40 ms gaps. Two 1-vCPU runs crossed the ring boundary and
matched all 3,360,000 samples over the following 70 seconds, then
reopened successfully. Intentional-loss controls were detected. KASAN
and lockdep were quiet. The current narrow candidate has not been tested
with VZ and MOTU.

The ordinary capture RESET failure remains reproducible at this step.
Patch 3 handles its indirect accounting in a separate operation.
Playback continues to use the existing ioctl RESET completion path.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -8,6 +8,8 @@
 #include <sound/pcm_params.h>
 
 #include "virtio_card.h"
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -387,6 +389,11 @@
 		}
 	}
 
+	/* Keep the legacy RESET completion policy outside staged capture. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
+
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -1591,6 +1598,58 @@
 	return virtsnd_pcm_sync_stop_locked(substream);
 }
 
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
+	/* Keep ALSA's pointer validation, time accounting and XRUN processing. */
+	rc = snd_pcm_lib_reset(substream);
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return -ECANCELED;
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
+}
+
+/* PCM substream operators map. */
 const struct snd_pcm_ops virtsnd_pcm_ops[] = {
 	{
 		.open = virtsnd_pcm_open,
@@ -1617,3 +1676,18 @@
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
