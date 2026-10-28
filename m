Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156029;
	b=0LR5JuN/W7FSgNU/aKCA/r80uUYqpvw4xkgTLQIk385xf/1DzCPHJwKh5AhkfzH9p8Kv
	 SJ8P8pNld0ZPlV8S5I3hRNC3rUTy/gsTWdozXJdJDKhoMiNvp71lKJZKnGm2vzJ21M0FE
	 3x2OGhP3tYivWm1NvtzxV+yDA7E34or92Nb7v2Y/q0Em5PGETVmRP9i0GLu25UDlvVXKn
	 9FzbwjrYdrlTuylBLfne2ZN8Kkt1OGxbD6cxN559FMb4xihN+IKzxdWDQW6opOBKETcuo
	 HaK1naeEsEQjG9nPpmrpZJQoBDErJNKuqwiHUxh3RsKkrwIIOVHFHq4yW9XMzjIUabw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=VEWSW7Uz+SW0uEDpSdkw0wWqPutxGnSm7KWXtzWEw1rjv2u7pWcURYSf9hg09JTpZAIr
	 yvqnEZLUkZE3l099ZQ++m/XVyIHGFbU0YQFokEUBOJe2weItzwlplY2SsjY4k6miJ0kHv
	 ayEw4/suTfzixgSRSDpKwoy0hzmabFWRHYQuH2utAaIvCzGN5yq27nz77hwnwQPElwv3Q
	 fPuXkoa1nu7rOBHl23EJF1Vk8X2VhTudq/5oG7DIgTIiPMXREBkiatKF2Xt08LSh1tQsS
	 FPqab9G/3mFRVY81yUqMyw8FrpqcGr9IiMojmToBhxkTOCvCJmxz+iQipwb4CjVaP4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcCUvZYN;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838F860A2630
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 838F860A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcCUvZYN
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3535a54bed9so730209eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156029; x=1793760829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=GcCUvZYNuJplwZi105tiG31GEPMJAoLyuLpDupceTwBiWXRE38SQtq7x2jqFOolTi3
         5XfBja0nz0WdYLJPFlgcCHhjMKxHgrYOKbQiFSn5HtTvRCTwAwtQ5XfmPyN04VydQdbV
         zEjEblrsw23FvdM1R+dbw7gBipF1L7gptzV6eV3fZXAKA5LjZI9EGEZdqHXJ/VjPUQ4i
         m6wcdIAFYWzfFiTxWp8IYwX6pq102T4I2zf48bbFJMMOwzesyB38SiRloWbnh3YyGiRT
         zNhzPe+KxH0BH1KXx21QILSyyu3UOb6lvq4iePG299Jc3aH5xZhIO6nF6fi1u0pe1noI
         la9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156029; x=1793760829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=frfLX0NLmC/9pjAQmiDDQCytbysbrXpULNL8u74ssWoCpR8DyXhOjNw2xe88tkGjQu
         JIfqMkLJcRP7Ejw+5ishRx7h884+LozZIHXvAOHjlEEkXMe1iuT7TuRwo9RqB0FZHd8o
         VRigxV2DzMjz+ZdkREC5o65le602xprB/5Hlj/4qF+pNrwqFzYHqa5csU697W+w9NLDK
         Q8u+dAd35joWn24LZ19nzg2t4QmV+qBV2NupPaXN/TWYA4hJV+H02iM0ZS6B643INmhy
         7hurzwei9N2WWklccFDb+hAnc9eoxMEt134o3XmGnqP8oiAc3MrbdChKoGwFVYOgbNqb
         mBZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKa1WX+wxiIa8bDKmnqZR1qO9oAk3hG7KGLDXlyjvBqAGbpA3gfzjrbKw/1cZkHEe6CUGEvPwzq+bAHps=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbWXFvOVQUGscEQtBjxMgs+eTsISnCBLg3Pep59jf9K2BRwKOr
	PqJ7+oAQjs1f48csDTFeTjsOmvH7XhCDydYyNgyi5ZJD1P1MvyIkX64o
X-Gm-Gg: AYBFou32WYgnZ+YvX9Yc5OYJu8yMYuix7HyOAi5DRbSZuYMd0XjJ7MK7yzr3VOqWvuI
	UQ1plDM6szqWA0bVmwpLeLoyAqTZldd6vezXUAQrQpuSclHTNzm6IXzigu18AtLSwSyEBvvzvhs
	44ZDPWpN8dZBFs7ROuk1bmKx8uVVUiaiisauwPw29IVKfE9TX5u6tSxIgdW8VytejvZUCO0iXMI
	L+EQ05Yhro2IhWUzwc/xu9grTdYVMXfVosV2IHTl+QX0RBTF+Q5OFSOL00yJhIWJnKIaNtzDpvr
	5+QMavDIRDNgLDvYFMW1UppARZyFsexkfJn2zgsMBNZrB2GnfA5ieeIyHjyRxeWswQ/NV8GT2gL
	J9Rtj3OMZV+XLwOZX65H9W90TPOBVMJU0TS4qma9ylZLZQvwYNQ/+K/gSi9IxCdiY3naL6TMCFt
	wQdzUtabaH1qt4vgdNHDvbvU0v2tIWOV013RscaEzSUPyfory031px2mXC6egmdec+h/xqJXo7j
	+WnkUrELlRcSgV8EfdSOOAgUmC0b6PrMybB2hHAf0htNJunvx7D2MvHjfLJu6Zi6gqHTq5fxlf1
	EIxrRQOngEe2qW2fNpse9AB2kQ6i4x6MaExHP79m06I8Zm3brivg3TORc1vQ62siXA9S1VymB0y
	K9qU6VJHh+RkIbL7kwB5ihnBALpPKNKqP3v2ll/P/TdhJ6Gg=
X-Received: by 2002:a05:693c:401a:b0:36a:1b95:fc75 with SMTP id 5a478bee46e88-36a2040717fmr2212392eec.35.1793156028554;
        Tue, 27 Oct 2026 19:53:48 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:47 -0700 (PDT)
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
Subject: [PATCH v6 08/14] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 11:53:11 +0900
Message-ID: <20261028025317.92450-9-mynameisjune111@gmail.com>
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
