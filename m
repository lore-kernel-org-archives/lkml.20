Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338037;
	b=nY9EXVMqmhneEph/BM3q/MLn/LW3HfxEWXyN37zcbJllF6/ezs4PmhzwWYIrVF0a0zJc
	 HK1xfe3WPNEln20AT11O1JOqxfDHvcmFrRP0l6vhSv8I003GI43N8RLPkxSlYk//0gk9t
	 3FXrEJzTCwVXkqhmWTNJCHlpKY0+LCMfttIB6jX2XPagdhzu91ILFw06LBJcRXW13jTdP
	 gmDkdqqjDq5GH/XsWfmVy0RzU8kX5pRzBitOCHrStMz9Zbd9T/2D+UnBwR7T2P6SDNSzf
	 ZJ1lDrkYrYBumLQ7DfC4i3NF++qhRy+saq0SAV1/LIz+irKninvIPJlJORB9eGJoLvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
	b=YEt+Z3/PXU7Hsakr3BRoJCQNSWxvKU7dFuzwHsbTyEJNKztHzlRXbJjmOEnKFqTj0+C5
	 bI3QFJmt3hFlNEEVtDEoHQR664mQYh15M2lOnkULKzNpasev9y9G7U3Xjq78qkZ8BAUIx
	 OXyWfgrBrBca2ANVryUl6dMNW8m7Uvhk/LxA2jidXrZUXkuMAfOlFZ7jtJgmx2dUeo/vq
	 f3Jp9ZKqAOiqXryon6ZlR+89R9KiQopDhKR0f6HyBQB4yCLVBj11q6+J3/ySRf3O0+KH9
	 KfXB/l0fharaEEp5Sk2BhisCwmAnXaRqTKPo7ZTHiQ2DaMBv65UDeF9YYL8QDJbQdeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4XXy17i;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BE3606A335
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0BE3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=G4XXy17i
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so206590a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338036; x=1793942836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=G4XXy17iLDeT8iXazeGMX6Ue89ABKSpnkywlAhE7QtXmFUa/qVli+xLm+FX1Z0+r7l
         CswYYqRR6LQ/ATdLOULuaqQhousueAP7bUTsQIDEtYlA/Kosqg3tkQ8YP8czmbogxMXg
         1YuXxJZZcb2XaSixgZIOR1bGlkOpzWIQrfPn9n9JvJ2CmqNRFgVQ1tsAIoS1kcHub5hp
         V9oRBoi2+gbPFCFgkoXIO0BnQF1vtliJHzZLEHrL6G4vI+mG2+scECqrf9J6wjZO7Kqt
         ub+h90I5njC03+FwCZGTPlDFITkpFfbqW+NSaNkPFaXg78ITDKCQrIHLczTl0dmKn2jl
         KqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338036; x=1793942836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=FnaRfXcuL3Tkh4RBcvTZZhAVWp4mTY58V/rUUJSE2xIeU7d82wLyYIfZQoElKqpNQj
         BTEFw4alYnovqJ+lI1sJydr3OrCT7iU7yKhKLmLsWZ/9NEQuSyjMrXoHSQkDOj7hyp07
         o1tQ4MLE7uQcFAZ0wympoMORhGezBlFa/lDtrIMO+flOy9VCsSEu3PU3sm+PstUPtVa8
         tdIc/i0V5G77D8jPBK/xtWf9vykJuUnpQcrJ/djRZJz2v/FhHvJl5fV7hvQIrU9/DF6s
         +2BT8nX1aArUcbl2+WJPaGn81Zx6W7UWl5hiHaIsWHs7i50l8a0Gmc/COFpszQw2AOqv
         6vww==
X-Forwarded-Encrypted: i=1; AKwUvByIlx1UaGCVqZFxl0OEJ7NvUL3Z/5tiEYf04B2k3inuhFBFdKISR/uKck6zFkRjaZc3ChtFlCE+BYDQhl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4nXTPu5PY1BpbkBFmvjTomCHMVujK5WNgCTasc8xs6qd9O6ij
	bv2f3vMTDGoj9ahH9uKFcc/zR0SL4RUZI+ToNMqJ17BbYLyK65NetqMI
X-Gm-Gg: AYBFou04ZrZhkFDIL189ppNTtHlP46iRtt3FkF1ikBOA1ZTMH98B1SJvDF4tE7YM9bB
	q5v1Wbabpnwln1bJmKEi/994oiHyA63nGrp/BvoZmd85FXFJPwMosX5d3iFMRDIMhOeobX2Pxcq
	KmER7Qo+RKiqPqE7UEvq1cNI6/xTkhZeHqY/v1D4k/0rmpp7kKLIiOVCAsqAtWA/zLZ9TBn6GPx
	I7VhASoDCnZCF+X0yXNeS3ASeE7pqUpBziu3HNAKFoG6f/eW581AJ23VVZg/QR4aqfwvf+AmBx9
	6Nlq5LRMJrVbwZWktIDgTYDKXX5X4sVZJ2OdmWGbOSo4GxKKxza8Y/qbj7rmYCEx6IM7mWxbUzo
	0EQXIH7qGd828D5zAjR4TY4pigqciY5/WjeX2X6Petj43fZ2Q9HEZsLdqXGTITFhWpUFEh9dRCG
	6QkcCeZuRVHqGCdfZsQE5qIIFLVXeCiaI7/wjJo58IzssdD3z13hi3zNg3+FD8jgySFTyP/pW9R
	5BrZ5cfs2oPT0x5RwSYcNyMeuj9cJk2Gqs1+alLXmaGDshL97axzg5yJ/DLzKa7EOGgzV/7GeAs
	HKND1ssH9t3SbQaykm+kv/JnIbpuDEaD7/lB0e9z+WDneUW8SdgF2gogZQdakyLHkrURaBZlbvE
	IEwhcJLoCb+q89PxINAa8C13ExtD6SLAWuuZ9MgQVctiGDbY=
X-Received: by 2002:a17:90b:3c05:b0:3ad:8963:344a with SMTP id 98e67ed59e1d1-3ae897ef7abmr909898a91.66.1793338036177;
        Thu, 29 Oct 2026 22:27:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:15 -0700 (PDT)
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
Subject: [PATCH v10 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Fri, 30 Oct 2026 14:26:27 +0900
Message-ID: <20261030052629.27742-13-mynameisjune111@gmail.com>
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

A driver may need to synchronize private capture accounting with the
common RESET pointer observation and the core's position rebase.

Add an optional reset operation called under the member's stream lock.
Expose snd_pcm_lib_reset() so the callback can retain common pointer and
time handling. On zero return the core completes that member's rebase
before unlocking it. Drivers without the callback retain the ioctl path.
The operation is also used after a successful prepare.

Zero permits the position rebase; it does not promise XRUN recovery.
A negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,26 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional RESET operation, also used after a successful prepare.
+	 * Called with this substream's PCM lock held; atomic streams must not
+	 * sleep. Do not reacquire the PCM lock through snd_pcm_lib_ioctl().
+	 * snd_pcm_lib_reset() provides the common pointer update under this
+	 * lock. The core completes the position and appl_ptr rebase before
+	 * unlocking a successful member.
+	 *
+	 * Return zero to let the core complete the position rebase. As with
+	 * the legacy RESET ioctl, zero does not guarantee recovery from XRUN;
+	 * callers must still handle the stream state and subsequent I/O errors.
+	 * On a negative return the core does not finish the rebase, so the
+	 * callback must leave coherent pointer state even after partial work.
+	 *
+	 * Linked RESET/prepare
+	 * stops at the first error without rollback. Earlier callback members
+	 * retain their completed reset; legacy members retain the existing
+	 * post_action policy. An error does not guarantee unchanged state.
+	 */
+	int (*reset)(struct snd_pcm_substream *substream);
 };
 
 /*
@@ -1179,6 +1199,7 @@
 {
 	substream->runtime->std_sync_id = true;
 }
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1760,20 +1760,39 @@
 }
 EXPORT_SYMBOL(snd_pcm_hw_params_bits);
 
-static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
-				   void *arg)
+/**
+ * snd_pcm_lib_reset - Reset the pointer while holding the PCM stream lock
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held. The caller must not hold driver locks
+ * acquired by the pointer or XRUN callbacks.
+ *
+ * Update a running stream through the ordinary pointer path. Other states
+ * start at zero. Pointer errors keep the existing RESET return semantics;
+ * a zero return does not imply recovery from XRUN.
+ * This helper does not update appl_ptr or acquire the stream lock.
+ *
+ * Return: zero.
+ */
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	guard(pcm_stream_lock_irqsave)(substream);
-	if (snd_pcm_running(substream) &&
-	    snd_pcm_update_hw_ptr(substream) >= 0)
+	if (snd_pcm_running(substream) && snd_pcm_update_hw_ptr(substream) >= 0)
 		runtime->status->hw_ptr %= runtime->buffer_size;
 	else {
 		runtime->status->hw_ptr = 0;
 		runtime->hw_ptr_wrap = 0;
 	}
 	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_lib_reset);
+
+static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
+				   void *arg)
+{
+	guard(pcm_stream_lock_irqsave)(substream);
+	return snd_pcm_lib_reset(substream);
 }
 
 static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1988,7 +1988,31 @@
 			    snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
+	int err;
+
+	if (substream->ops->reset) {
+		/*
+		 * Complete this member before releasing its PCM lock. A later
+		 * linked member may fail; RESET has no group rollback operation.
+		 */
+		guard(pcm_stream_lock_irq)(substream);
+
+		err = substream->ops->reset(substream);
+		if (err < 0)
+			return err;
+		runtime->hw_ptr_base = 0;
+		runtime->hw_ptr_interrupt = runtime->status->hw_ptr -
+			runtime->status->hw_ptr % runtime->period_size;
+		runtime->silence_start = runtime->status->hw_ptr;
+		runtime->silence_filled = 0;
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2004,6 +2028,9 @@
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
