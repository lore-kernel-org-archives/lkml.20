Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180530;
	b=RQ6lbg4R92aaHnMHOvOojwXLUmAMEx2G9pUD9+j62rdidtufZ+fX3VAWkWSLFK6I8uCq
	 m765OlCMFK/Z80xKmDr6AjX1qJ+SmlbL2YTKBvgTtM8vQ66petSaEGRWhetRX+f09wBoF
	 vMBuUW4KVqwOleQM7YnznKUEMRQNqvcP4mOMiTPh+Iu8HtFHgi4liogJlYPxDV/GhSZTO
	 pX+jenk0vkbbTIQDmmyYws1RzQ9FZXJkTT/VGFCeLhfMSlfPMxajmBqPBEaks4J+cSHzr
	 vMpotHveJi4DEESejOmMqkHcqU869JqyjwPHCA1+q1rIFi8QVX1kVAwHvorFaNvg0bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=GDT8jogzpJUdYzGgtSwZg/nfyCOWxvVsD1QqWq/YDwNrvMp9g/cOxw4fyElPjwDoLMG8
	 3AJBGEbPDk3v4WbRtAf/8gl/KvD+BgGoOZ5kfeeqwqfl6Wdq+YWHWDBziqoeV1QKrGgJo
	 vu9mSRM69SofCAbgnP7KAE50uGFc6QY9BO3ipZXeQpjtHkQqeUtuFI/6s1LZmBOpNzeeF
	 FbHljyb56CGc7nJIw6We8KELlXqtsmHqVcF257uHHVA7MWD7oCMSOYCh3IhB453cgNK9f
	 hzxamXr+w3238rmknRRNUkaxtsUR0b9+8CkbqXYdidnKKXEq4eRxmB5SLNARmctp1Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB75660A262D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB75660A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3acc96a256dso545048a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180529; x=1793785329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=kkmygWZ3Bd1ORBZYN123uCbvxb2lbmlJfyOq5n1XCDNyvAVl8PfrvtOK9IsldIsm33
         keEpELDr9sHVvf2T9x/SZvEFLyouN8knmMIIRgRui1FGu30lH2+hjXxR6SaEXauRF0CJ
         78m5Qbkwow9edI6vZieGSLDbQ4yhvP0+kQ1+voQX8Hoa0oq2HelH7pCKcS7TJilthrH1
         0lRQxJNb+bQXMPB0GabTVdSIBB8sr68w/JiziR57BDQgkQKwSTYJK9IBA9m7REmNzH/0
         4EOQnPC9hKzOCG+d/g/vh9ky7qbzzEcVnZ8lTP3ZldQ9TYoZU7rpmVCPg4Mk3N7qJGTm
         r2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180529; x=1793785329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=Ji6y1Q2ahIRLlqCmRSXgEFEgdX+xkgQxqnTm+8UWBAmjtRn3rL0EPgMD7/iFEIiqwa
         ModWOb51Ns7bq6XdUuZxjJtAUjxLdGueNACUP1hBGhA7nU92u0f5uexzborWwuQ61Qd1
         OwrMs2+vXfODg6HStKLwz3foNZeey7ubE2n1ZNf0+ITptdclxoJIFa29AFdlxPCBx9Zp
         TzWXa35+YWPQYXrGHKslGDlV4lIm561rWIZDayleueDA/DLddn7yz3qnbchPayztfcCh
         p40rgAdlNxCbDFpXXFbcuL3fC1hXq2nHlnLhKrOTrwvNgCYr+nTS0UodqV/HDBEy0LvZ
         AX8w==
X-Forwarded-Encrypted: i=1; AKwUvBw4ShIzLFzwgHbHq13KAIpsp22WDD11zBp+Yjtez1xnWTVqunHtxpH5CMa2LstnJMGTSgwmrrV/UsG+nWo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyilS4nPgeEJ4Jo8A+B37V9yIy2I/JmegFCOfmkb0L6tIWzcMp
	Gysuzi4e/pkS3nlSqmy3oWMIn87O8jdJMe2ko4AiD0gEiDfEi2oXj6PX
X-Gm-Gg: AYBFou15gDkN0AFdag8cWB1+7pvmW5Ui4pmpseuaZ73abWnx0PZPb48Fm3d/QPC4RyG
	4sgswzI5Em2xsc/LYXY+ru2wLxC/R8skGDqcwCSdGTIBfec74rvo48MF0tZjGde3mEY5fz3KdI4
	0gp8yrITyCrfDd4/+kJ5hbmofbJR9AFZj8MO1CEk1bWTPexfs28M1KNQIs2oJgYei7c7r/mN8Ic
	CKuS+7zV896cgr6WauJLyP5NcE2b8cLPedkfc41YUxkgpCwoH+WKbHnm/AuzejK5tCOykR/LAAX
	a0ZJrc4LMjrdLqWs9EbViIfvlS/DP2q9E0/fGIE0vXIUVitTqhrvsZJKKAy34iNn+6q72rfusRe
	xej62xznrSM6q2Rna/N/GPP+3Oy4GYs1JzN40O+BrJEa7m3XVBB1wpF0va95R2FSmp0vapl98Ih
	BhQKY35jQzE5JhXzXjqtzLDRkSmt0uQ+aunptDUK9o04oeZIHpbMNsbjA2KmzA4dKoL2/GH9BGn
	wO3Zu16jwSR63Wy5ah5gJveG9Jk1FKP88ZWot4cRHfvNsLlOl82ui3nGZTCrYD/pfzVSRTDxxOM
	xr/JM2lzWJIsNkCcnr7f1Cq8yk/4JjKr/RV7T/wOBEg3M8WnZ3YE7xrs2VTbNhXkPU9SLYQgs9v
	inDBDZkjN2e1lurQ5a2WS7Ijkv1SWhKWJCrkP6jb1q8wN52b8
X-Received: by 2002:a17:90b:4ec8:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ae582c0671mr1363142a91.56.1793180529080;
        Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:08 -0700 (PDT)
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
Subject: [PATCH v7 08/16] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 18:41:24 +0900
Message-ID: <20261028094132.20364-9-mynameisjune111@gmail.com>
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

The RX callback holds the queue lock across a batch of completions. A
reader that has copied samples can wait for that lock in ACK before its
consumed bytes are removed from capture_ready. A later completion in the
same batch can then reject data using stale ring occupancy.

Account the staged read under the substream lock before acquiring the RX
queue lock. Release that lock before taking the queue and substream locks
in their established order to refill requests.

Once accounting is committed, latch refill errors as XRUN and return
success from ACK. A negative return would make ALSA restore appl_ptr while
the driver retained the consumed-byte accounting. Keep pre-commit errors,
ring-capacity checks, and normal period-work scheduling unchanged.

Source-extracted host and kernel fixtures reproduce the stale-capacity
race and post-commit ALSA pointer rollback. The candidate preserves wrapped
data and pointer accounting. KASAN/lockdep QEMU lifecycle checks passed.
The fixtures substitute selected backend helpers and do not independently
establish physical-device acceptance.

This follows pending staged capture support, whose introducing patch has
no upstream commit ID for a Fixes tag yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm_ops.c | 128 ++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 51 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 003832d112551..85e7576903d56 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -1229,70 +1229,96 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
+					  struct snd_pcm_runtime *runtime)
 {
-	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct virtsnd_pcm_transfer transfer = {};
-	int rc;
+	int rc = 0;
+
+	/*
+	 * The RX callback holds the queue lock while draining completions.
+	 * Account ALSA's read under the substream lock alone so completions later
+	 * in that drain observe the newly released ring space.
+	 */
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		snd_pcm_uframes_t appl_ptr;
+		snd_pcm_sframes_t diff;
+		size_t bytes;
+		u64 next_acked_total;
+
+		if (!vss->runtime_active || !runtime || !runtime->control ||
+		    !runtime->dma_area)
+			return -EBADFD;
+		if (vss->xfer_xrun)
+			return -EPIPE;
+		if (!virtsnd_pcm_capture_counters_valid(vss)) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
 
+		appl_ptr = runtime->control->appl_ptr;
+		diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
+			diff += runtime->boundary;
+		if (diff < 0 ||
+		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		/* ACK includes any subperiod tail already copied to the ring. */
+		bytes = frames_to_bytes(runtime, diff);
+		if (bytes > vss->capture_ready ||
+		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
+				       &next_acked_total) ||
+		    next_acked_total > vss->capture_copied_total) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		vss->capture_acked_total = next_acked_total;
+		vss->capture_ready -= bytes;
+		vss->pcm_indirect.appl_ptr = appl_ptr;
+	}
+
+	/* Preserve the queue -> substream lock order while refilling requests. */
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
-		if (vss->capture_staging) {
-			snd_pcm_uframes_t appl_ptr;
-			snd_pcm_sframes_t diff;
-			size_t bytes;
-			u64 next_acked_total;
-
-			if (!vss->runtime_active || !runtime || !runtime->control ||
-			    !runtime->dma_area)
-				return -EBADFD;
-			if (vss->xfer_xrun)
-				return -EPIPE;
-			if (!virtsnd_pcm_capture_counters_valid(vss)) {
+		if (vss->runtime_active && vss->xfer_enabled &&
+		    !vss->xfer_xrun) {
+			rc = virtsnd_pcm_capture_send(vss);
+			if (rc) {
 				vss->xfer_xrun = true;
 				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
 			}
-			appl_ptr = runtime->control->appl_ptr;
-			diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		}
+	}
 
-			if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
-				diff += runtime->boundary;
-			if (diff < 0 ||
-			    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	if (rc)
+		dev_warn_ratelimited(&vss->snd->vdev->dev,
+				     "SID %u: failed to refill capture queue after ACK: %d\n",
+				     vss->sid, rc);
 
-			/* ACK includes any subperiod tail already copied to the ring. */
-			bytes = frames_to_bytes(runtime, diff);
-			if (bytes > vss->capture_ready ||
-			    check_add_overflow(vss->capture_acked_total, (u64)bytes,
-					       &next_acked_total) ||
-			    next_acked_total > vss->capture_copied_total) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	/* The ACK is committed; a refill failure is reported by the next XRUN. */
+	return 0;
+}
 
-			vss->capture_acked_total = next_acked_total;
-			vss->capture_ready -= bytes;
-			vss->pcm_indirect.appl_ptr = appl_ptr;
-			if (vss->xfer_enabled) {
-				rc = virtsnd_pcm_capture_send(vss);
-				if (rc) {
-					vss->xfer_xrun = true;
-					schedule_work(&vss->elapsed_period);
-				}
-				return rc;
-			}
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-			return 0;
-		}
+	if (vss->capture_staging)
+		return virtsnd_pcm_capture_staged_ack(vss, runtime);
 
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped) {
 			rc = -EPIPE;
