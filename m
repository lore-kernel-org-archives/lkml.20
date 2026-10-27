Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144664;
	b=Cv9NFrrI70PgX0pdWE3Ueqp/utHp5FtwDgpNxueqRwcUZxEz+EiE3BaHkIMfM1EkPNLt
	 yMsWi3W0yc3EWmrvCLxO7oly/5/B5CIadnohCUHWUIZSYE08HRpANXL8DhC9eKqY26SPB
	 zvuOK56tCW92LqRv5vhNdEKQhWWxpezdJumcENz/JHYvImOihXOIZ7Gf0sQ/kIzezG/Q3
	 t+DXeTUMS39BlNoFRbzXIcukANUqxSJBfjfKtOR02Lq7TcVLrSU6Js+Jl52J2HlN1b1xJ
	 LLQ42gSoVwzY8q+FSksrfQ378ACcr7jWEmPg3EFYHLC+8rU675LqU8utAz0OhUy/SOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=bl0Mep3cJqLAT3cinh4in2FxqaBsVFmRw1gRR3WQ4zxNP1IegU4FQvTkJ8TizspRkh1b
	 OH6C8uOJgKfFfRN38cYQFvKXCPwz0aA6eiaI9dv0alW5KMDp3SbOWrHi936DhT0rhq3bP
	 /lhr4Bgly4xrEXYUrRTOxUwx4DEwBokLg46fcs5J5jG8QuofbB+WZpmwd2+ijhcDWrbbv
	 JzvSR/rT2ixt8IaopSAw004dGFSEASVMaDIIZRazfq+w/Jr0uHWlXmQxVWXC/lnjT3fS+
	 MYkwMdIvjJ30Z5GikYCmyyfsj5N1eyh8d99WQYrpYzxkMtYYtw5zWoBCSk9kVM6clkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/qeWaCK";
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EFE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0EFE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/qeWaCK
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06210b29fso216599b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793144663; x=1793749463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=p/qeWaCKPHeow0PAaCT8x5lC7TRe94coezk0yXoOPU2rid33CI4Q8eSgzpVYewTbRy
         Ji9LPTLgQa4jGCyi5FOdq0eXdQFfeU+bUeOeGw3BDq0CG/ldTAmOtlLA5O2Wv0xGex17
         qnMLVXX/1pisAaBb7ImFHdu8/51epCgByprT6t1NAovdwIYTpsKcMVFOE0ncIKmfuQP1
         /WvwF8NlJINRquT9n7houVxFgBt4V83cq4HsrVmpoNrAY+YtsCF4/DE95fKiYt8hPp7B
         VjUsW+grXywOOZfOioov+OAJTYxDYjpLHBcQILW8l1GlEE3lG5axNfwLHdFJkZhSU+WA
         S3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144663; x=1793749463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=WZlgKZoWgT1rk8hfI1ITx1Mpoy2fdLtRhYsgwjgvQvNY92s9m6+cPpcTajW19lJpK4
         5V0L9DZtPzk3jTJlwrGN2NrHrowoegQi6XojOjpLNA5xQ+LiUTDkuYLsIjdwBTnGFIvI
         53BizNqO3TPPfJ6Ml1GveMu7yuK6bEWhPissYGTeeYB0Romvku0dKxnb5xxCa0ZKAyo7
         oJaSMXt91n8/bM3Xnm/83vgYW/JdW8KglLpbLbsGM5ZK+lRq+facoG1p9gDBm4tevIYU
         xDx0IHZeV1rNPEagk6ok4VtYe8mZuiA1XUbZsUH1XRg8VmIzHNmRO3jCk1V7iIGdif0F
         0N+g==
X-Forwarded-Encrypted: i=1; AKwUvBwh88G6IrSOWZt2huyDyH5nkwGcdSLDopGwcWDqCqNWuQpnEDPTJnY90H3gN7EYwV94+uo9wbzBAEzWXMo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo9B0xFgNYfqxAe8ZHbKRQ+5k5xmCsdkIyzr4+2L0NLffjbqth
	fWIKldYtgJ/Siz0wJzN3Rq/XVpXqQBJ5NPPBC7El1crUPGXnWhQ0tX5YsL/M6g==
X-Gm-Gg: AYBFou1oTpg9ZZ6evsUG5GlDjOqyThp80Xuf0sdzdFLZS7Vdf1aa++0/Zrwerfugcr4
	VYZGV1/ed8828HaYvMlssOLwZhILsVu8BeY5XZ4gHAg06Y8vDHXl/90Inumr6ZOPXKdaIBUxEPc
	0qB497Vn3WhS+oHO/HTk+NCDUtiwdSU5IBcWt1Uum8qsWC1uOyJB01+yD7XcHMqMcp9PBx/K788
	t5j93RTFvVqbJynT0uyCqhNIJEgNEM3arOk2tSI0uffBJO+pIeM7UpxHRVz3R30FzvADkFPFPdO
	qzx9/g7RhQx/N3i4Cb/lI48Ehl2MnWRGFzZx49O0bKZzE1vXA011el6p3W2IbSNkquSf6JOFMQj
	eMcS1rTpqrD9DzqcCBVKhBrCSkuLX8JRDpNkruVfxNJOUCm0/MjGxcC/9jWVS9GJrkauDNUi97K
	bQbRRg4nEnMy97SrD7NkoN73dQKSlmnxkJ86JKNGXYfl2Td18p/wVTBPQyZYGvgVJ+xt+KZWI00
	Z/zpvaNxWI1L51hmmns9HWtUbb47TVnvkUn34MLxSgPU7VMxdQol0WyGWk4XcOU2RL13t8kOvfR
	65P6pYxgdb55661cYTm3c2S6QiK22kMiO1QO/snAr84+8wfyAJFWHX4HsobeLP7fuMxnSSIRdZu
	4x4bpPM9w9H2Wda3lnuc=
X-Received: by 2002:a05:6a00:2302:b0:8a0:72e8:732e with SMTP id d2e1a72fcca58-8a6e6ff2f26mr515420b3a.29.1793144663102;
        Tue, 27 Oct 2026 16:44:23 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662b9f5sm542507b3a.21.2026.10.27.16.44.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 16:44:20 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v5 08/11] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 08:43:31 +0900
Message-ID: <20261027234334.32551-9-mynameisjune111@gmail.com>
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
