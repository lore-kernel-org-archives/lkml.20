Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263894;
	b=zS1dAmv9+dN6Q+yEqv40jZLHzkcvCDLHCjY1yFHnBD2+RqZyClMMjHRFFBnt/4oTrX2x
	 3MEfWf0boKMDjPIiDKPcNKh5VDZq16/onPctg+ry1QcWV0pIDUzi+0uiE2gPtus851wt0
	 El+ZkxSpcUE1dhzqHog/SJz34qwNvxNNXb74pFfm5kYaruT6qGB3jEqiiaxSdeQwR74b8
	 DqpdgEPcWZusLEDoBnA7sEfiqOs3ZaTtbccbAvRTtl4e55UnZM9DM+pN8vabEts3rm4Zs
	 JC301MflE7E//9LCi2Z5b6kPUZjZW9HwSO0iU/yHObEQfu/3xubteKZTph22QGO32iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
	b=bjRYPcih8ASj9vQSxHH9pRv+QlOFGjt1IDdaOtdNDvp10gaW/cO43oVqJ6vM2nW4TCLj
	 gzSQyKnAt1eXjxhznvjR6n6ooVbRUEDt/PwL+85KTa4Q3xqIF2OJLVHfVNZkqolmBJpAe
	 EvtzKYfA244CmInYdkI/ECdVv8ZRM1WO/Vi6eP17GW699gdFoTW0thLZxKzYaeakNE5ng
	 5xAdxFQ/YakETlUVSLQYqAjDdlnvl6ZHeiws0v9W+3RumAM4evBzlbBU8eAsSUx3JtqDy
	 MmpZ4D1Cer+3fDkg6z0DE9RYKla0E9uY4FXv0I5Q244ykmZSBJRT4RUXdkLqqkQNqSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvJ1VIma;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283D760A2624
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283D760A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bvJ1VIma
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e977109392so11204675ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263893; x=1793868693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=bvJ1VIma1OiTv5lG1edzSyTUoKeiO/HTSrjF4O9r4Gk0k9oKrUoIVDghi+I82FSo7l
         26l0DhKi2nwdH4FZ07YXMfnWywP4jLqK3VMe8kXpL7w9jkvfG4UD16MhTEtlLtj2l3h6
         ksgSv1Hqm4yIJXZXG4AQRnNO+38NAEjDGDsNQhBW5/zbhL2YWfNjCoT3xefLJHGK7TQ8
         XT0ZvEejdzK6aE8jnAmzFu+MlbNNpBXQnxLY8SRGPlVWktPooUpw10zqETYnC/VinpN/
         o4qvybIfaryAC9w5mHL2nNMet+O0AWQQPaQYEQOGVkUHdlvI1BAkyEJQEK7t8yk1PREp
         MV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263893; x=1793868693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=Z+2n6T9IRBBw5gBwgITEyRRDdwXgcHWeXiRrE2Kx4de827P1nOGjPx/GhTMJ9mtaWp
         QBXiwdxa4/JMMr4UIzYxEbu6g7O+dRG4/Ei2hnEeetwzIfAkPX4eHtqv2hgOZy7ApyAG
         rmpviI38Vc2sXxlOTsTs/abOjKTvS6ygXk0zW+Ii2r80+F1BAgBOtLlYCFHVyfHyyd0b
         Q7sOIAeIcyZjTcagdgn7ylmvfJ57rsbN9cANfBJj9k0MYsKeglE7aUx+xaFs/mWjcRv9
         Do1bBXgEGJtkASUURcmWwWr1E7E9JiB9xUgfOgK1jm2z3PsSgxLerkb27CkrkpWdH1kv
         Iqqw==
X-Forwarded-Encrypted: i=1; AKwUvByvxnR2NTI+oU1/EzsTwkahPzYA5ohFTCltyMz4GF81wwZvYqAbbuUz4flbjKPpKDEf/V+wCCyF2frJ9+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbXWv1uDbBL6hjgg7jTug4TAmXzePQlXHABamUscZXJSBsRP9G
	ZVO/fuis/OedAK4heWleTyFKo1AkHbrh5PsrQgQPnPBVpeKLRdgYUkrL
X-Gm-Gg: AYBFou3iyblA9jwroS1/+Fom0DCFx9HJVSeb2paVY22pzMqeCKPHjbuP5/pOy8197dJ
	kZ4b3s7wi2P99s2EFO5N0VxGo7SBWY7VaqsBihe66/fQmHtSOS163ux1nVBpYG6rQ1TS8ieddMO
	aiTryUl3N/jeGN2zAJ2S5X1KwNygwUsVA3L6tlCRcIjhYCMSDrk1QghC5BbIMyMvIPK2nOs8pdb
	FHWy9APxf4Vd4eu9l1RZd782ow3SZBlrxG039ytM7Zc58LHPIsQiJEXtS1G0HigfadreRBLYzz9
	E/udjB5OOfSZZ3wZqCb2UHKkg4QzSxqFM6ahqG9Dm2cJTdQeo5ISBf3iHEa5LxvXmBc+QCWJOJw
	hjEa8IsstDT9PscDc9IS1y5FdbjKwbc1Q/OwUhZ5runTUtgwLIwBzENDPHGQB0HiJnzo+/d21bL
	njoj9jSNOubaQTHsoz309wNxrO+PrFitzyys3XCU2JJw+CsMekIQM1yf6YSkYmHbznER7yIXne4
	RCsbf1MCgpVx7UbLzk7wIJygocs4kTnVbxAPQwrxT/3bGHA5t4lp/JD3P1i/KvE8Hybbk3HznBY
	4v3F+tfHLus1B+K+E8iuyrqG5S64JFT353EzqS3PP2ID6QtmTSUBh1G0+W4txVhybPV01ltdfRH
	Rhkciflkp7JnBfxgpce1PmuH2S+yShhjWErGDg9PjpA==
X-Received: by 2002:a17:902:c40a:b0:2e2:d02d:a173 with SMTP id d9443c01a7336-2eb00542986mr43647935ad.49.1793263893503;
        Thu, 29 Oct 2026 01:51:33 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:33 -0700 (PDT)
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
Subject: [PATCH v9 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 29 Oct 2026 17:50:30 +0900
Message-ID: <20261029085032.70689-13-mynameisjune111@gmail.com>
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
