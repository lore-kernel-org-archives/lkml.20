Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412581;
	b=srLXuAgN+HZYvRhSpGDI1SCimb6P6ONRo14N1al+dUZN0SWlpefVIs9j75Z7tO7JNSK+
	 6KAow3oGkDghg/FapmhBBhYlP+WgWddhxIIU8nnIbxZLCzHaiSGx3/imyjIXaX9hKAGEd
	 U9+JtOMssswJXnjKsXjEU4aQJ9fwlOOBGUSRfU4+TtCyxUUY/0XX3IzlB6nZ3lmDV1cL5
	 ySl9nmY/HkL8mD59AOEdduK0hy5TzTz2xHVwzCEqagWKGPE1+w4IUbFmD7bMohHK1lQZV
	 yfM7QuC5kgRzuBPAYN0+tYzxz7rBcFWzAgOJiH3yT8Z7Wz2TBz60v2S8b1GPqxnx+KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
	b=ICB4YyUHvtFTte/umn5yLP4PABR/ULOk3jp0j8mW0cY06WGeWbhjdVZqfZBQXd4emLlZ
	 SJc2fZRAsVzhj6+Stzjjy6LSGwZ2Mg7Un9r2aFfB8/4zSsIxjM1+tNxHM4oYj4Jg1rUEH
	 CIi6sD9jvRgk42hloieD2WX0Pjd8mhjOSSxnHLsYTfaQJWGZG49GnGwru6E+b/x6yJCgN
	 9AqkUaK2gqEfq2tIOFR8/dG7qqnzzkX3ghEKpO5vveiwL0r8vMGQ/FtknLCsDUwGbQ3/7
	 fp1sLCYjE9cvS2qEBJjplGF3qSxWLn4+hgfani+DFKjvMWm+4YehRpD3XXwTgrKsZ1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxHznL4+;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813E0606A333
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813E0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxHznL4+
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-353804b591eso2077153eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412581; x=1794017381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
        b=YxHznL4+CQ7T4IB8HqRCNk75YaeuOEr3YNpuKxQF/0QAR9uFN80NdijMt5RiPn8VZV
         K6RhZizjkhfrWegwudzHA1UjWlRghIZx3Tdznjo6nObzYxHX49YARfoOKVr6lmN9NWOm
         zYJY7ZnaOHkkxoDmSMPS7V3Ekq4eti0ISNuoYXG2UjnPxI2GJusCx4g+h/tzKSPf7aWn
         zR+KRGdZlznmNqwnesjkZCyBfKWUnSc+2vdhXJklG6dBOWUbFDT2w/+yTqPcJtz9O58y
         VKnSxedeQe7TDFYVSqS8OM1dEjDGlITTVc+bk/PP7LezKoszOKIb5PPTGVkX0hMTLh45
         9Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412581; x=1794017381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYTuX92aRtCeYi/y6rrhsUUqGJaj+xMsdosIKAjJqSI=;
        b=E0QaWZdmiBXxcs1UXHb9MaL9KMTzQTPdLt7XY+2cDN0VaSWhtTo+WeEOSDn2Mn8He3
         4qEy6clIRtTItTObmlKc9o+3N5t/rWvFTj5m7BG4wAaeIXGMXg8u2yFC/4G+lnQWYPRY
         QNs6TzlktYBf5WwPlABUyFnkPR/FEbei86oWuDesx+OIDXAxuwJC1mLMzUMDrt0OxJmC
         2vQW0vOyVi7oKiq/u8ys519sb280PUJ91x42amF6D+azjvliVWV7eXVfD2VEZlTx5uG8
         9HkkxtJ4/a53x25iMzlcVE28LPt5yzGpL7dOQBAHO118GBiL1UlmOGQsu9avVlChVc5E
         ZGjw==
X-Forwarded-Encrypted: i=1; AKwUvBzLS48QR/+JyvnCNJ/hNCQTGloRiZuN1MUxbDrHoLuNMbcynsHaamc0Y3Kq9FdQCfUM9c+mjWq4szlN4C4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJB+1czReU73d/9vHNcn+cr+K41t/pG7+2yrsphKI9AiIVp0XTh
	NNvN6OzA4CMTaKyia/I84R+MFHGfz9o+FFwd5IDIouP+BR9+WItSEtbV
X-Gm-Gg: AYBFou03F6FtwrepcO4IlUwkKpkuM2YBi4QBcUC+NiW2vt3RJrVo6jcpQF3pOnARMs4
	HNhyxUnqDiVMVYw2GTYz5VBoeFRQOSb8X5HGrs1Q1QfkyAcEOBtWbK6xcs4r2ll501+3MDaLpTL
	Aij0tKmjSlRMw90L+vU06QdR7TPAoj0kKkb7EcNSQWZGfeZSS/NCxgMMVICQgaz9i4gZOfkL1yj
	yy1EFv74IxWbqwPZ8z25EPkVTWo9rd0s5hu9Z9bIZGhzaygVOb/QNoePkC+aDFHi0SnMZe3x7Y6
	v/FO1y0dC1JDetbJsPgRVlkJKBgkZP4saD1iLw5XckjViwVyPzuCdGz89qNqXSPq/G7e+miPsHK
	R8vywq894S7LlG8ldDkz1tsZXwbzG2sNO5j2/ygnxRjDCQlHRyuwGIfkI3fiqVhBBcabfJ4tNbA
	rRuy6ny5Yr/aERAWneGXIfyZffXYBzYhKx+gj/4hWWPBM5GEUoqsIf2hzbvrFJZ9hmw/skekqs+
	cgjBZkK/oydU0xAAO2yNqNfdcaoQ7V8wHaY18Iz6r1Vn5fGkXots4CbysVnQmdovSvsgWqVZ+k0
	q2qVvPOBA1DzoopYYqxSCspUp4kkHN/FGryqyV6ejr+kyZY8l9g/n41Y6sd4kIyGtiT+u/Ba/AV
	zR64LcInTdoIyRYa/0O2Nv1p7NuwWFKoCRvCxyJrBPi6xgF1AaeySNoZEKTqhhAmxnHE=
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr9338075eec.16.1793412580547;
        Fri, 30 Oct 2026 19:09:40 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:40 -0700 (PDT)
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
Subject: [PATCH v11 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Sat, 31 Oct 2026 11:08:54 +0900
Message-ID: <20261031020855.2402-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
@@ -1754,6 +1759,61 @@
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
@@ -1783,3 +1843,18 @@
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
