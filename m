Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA91277026
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792216831; cv=none; b=WCvkcVIQ2HrdU299FubnAld5AluYl0Xy7KWTAMBpl0TQcVbJ0qNYT7tJunnt891ndHJZ8Lk3zK5bXStppWk2q8rFxsdnlqiFU3MnU55/fuMV9VPaEBwbiPEk1SCfNDZNxzCtysz7+IpBlpG6VocqN8NWeEqwgoodvW7JKpGVCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792216831; c=relaxed/simple;
	bh=L5b0I/0+i5OjpPgAdiQ54velgnThBwe+zC6SmWduBPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxCtQ8MwK5HQiZXBIBKbkN3WfSGXigQB5+B+yfwmBgeA2DyhZ2T0VP+raP+B9+Yf26siX4//vHnka4/5tA0K9G8UMHBnOLFM9wZRYLe6LVF6YcTpMsGCGm1XeUR8qLDceP5o3wteQ9joq+TiV1JAYxSlK+fXI+kMejpthTDT9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+b2mrCt; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+b2mrCt"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so606862a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792216829; x=1792821629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=D+b2mrCtV3n7IuRk9Q+X4zps162jB59ZePAqgVPIx8ZET3CwcmNEEy0HaQs9EbOhrF
         eebFa6QYI56sexZZjbD9nY9lmA7T0WnLDTJMpVzLrtRMSf0gXceW4g4ubt2DilW/ErWn
         B6cKpODkajk1toYvM0uqf/Wklj+NemQSYVwMzTK+vSnY+idui4nvATFSUs+ABH+XV4dy
         6I38v2rfIKjXJnRawVffvtbXLWdsx9NbV/yi/PWQkNcrg+XG8BrHJqxi8AH2BgajmYTR
         5guxeJZIa8roGLREd8LFJDQZ82n0N7vnfcT+VI7GCU6/mPuustizw3idyCbFv+s41dWS
         mBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792216829; x=1792821629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=19m0/e8FX2eUFtv7+EiiM57WTWPPzhrT8sjPYuNZhYgUvTF4gPaUUw4XlBAK+p5rAR
         6lGLa0e26PQ0oMzDapB1PSskw5kfi7/4NWnAdtUJz6wIUvMYLaDqtDdns8PG9C0856ax
         RbBx6OnUMR8N0y3PS6zezuONbBvI1iIkh1eI1WH+Xn/Ae+0yIwPk0HgDuCiDT6WrOcub
         gd30H+HLSjy+NcDQg5LWMtv+ZbpCzU9zBXX2L6A0pHEvJHLZ2njMCcu/AnPK1RPnM8EI
         d9fzM3b/6m96RGhVrUfCCNQO6pXsttWlutpapmwQ0OEAXLyHx3QB7q9E22D6X3nQUwwx
         WGiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMYaySQQUsFTWysTnCvx/wy0uKyvwucZcCT3XHdVHxPPpIt1aaVN2a/WupFxKTrKoXeMjgIjqnonAyit8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlEgbgBdtJAD5LM2fVtFLgyfnz3Sfd9LLtg9rV25gxqWXn2ubt
	rH45/BWqjllOZ5PoVM/PKq9UwkDzORAWv41ILyH0tGnVndIJOOd/odL+
X-Gm-Gg: AYBFou2OifPy8rVbZOYCzR/Jgbvj7rP2CPZjHjl5gXjydsGJ13WwOr0mYa3m208iJ6a
	qeRK/01yJqFqqbeVg8QgoE2D60UlPIfvIKo2DhOSYHTaQs9Qq8OhJgc9aw2Pk1vp/OPAmu7KR6H
	iWkDWVFL8/6o5tFhwimf95TwEqC6T3wYCKuJFh2SQPdEfFEYBqp9wnF7IMB0SuXHPfERGOZcH/2
	xvNY9oI6BEPoPtna8sQsLwlK1VEM4ii9h8fTDRXC9/ArQntoOoWLNOpPp64VO7p0IzP6kBqeh2B
	zMgZdoEL5xILWyIpKOxjBL9koebE/vFCpd33kJKxf6Cg9BI+pa/mlUSqzCMDRqeyN5fKaK7HCWC
	84FFEntNxyfNhb8D6CVWaKmnZyhVObmNGNzh2ltnfJWg1hn/HUaosNpsWIJq09Ez1kHqjvkBSsA
	aS5CHiAqO9Bnjb9Ea2vbotop1OYPVDWakK/GSUDHWk3Dfpe5hzoTmZ2Fy5SSRvfc4n4jM5st4SK
	//9EuOsqppoPjfTJXPHIpLdYgCGcKxiwtJbLixkjVET6dPY3+phlSfg+yXEbTXzz5nOT/ra/F/N
	20tD6DD4pG7TxJxarmP7pTIOlw==
X-Received: by 2002:a17:90b:582f:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3acee27718amr1846889a91.7.1792216829054;
        Fri, 16 Oct 2026 23:00:29 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947d2706sm12106705a91.16.2026.10.16.23.00.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 23:00:28 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] ALSA: virtio: account staged capture reads before RX refill
Date: Sat, 17 Oct 2026 15:00:24 +0900
Message-ID: <rfc-virtio-snd-capture-followups-1.f2737c95c12e45b4@gmail.com>
In-Reply-To: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
References: <rfc-virtio-snd-capture-followups-0.f2737c95c12e45b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
