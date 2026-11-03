Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664280;
	b=aETFflXhhRjGPEfBhOQLvHTaWDkaAIP0HdKQ7ZupA4xDzV9uBG8EtPaAe4b3/s//qeuF
	 3KsNwAfvbsfCk+QbqCuz/n5fviqFqZpA/gR5LPB+9cmbS2oAQEznxM+AYZwLZfcxcPjd8
	 BOUqe1LZCW7EBEzZS//0XL9G2JBuMz+c3DDKPHnkFo0i8JGlnvnO988FDu1NZoLIIE1dz
	 PDxT9xmWBueH1gxG/8wl7y9POIvgIa2vKZ8LwtDd6ipEmnzoB+yczsv9ru835l+Oey82C
	 iSfdV90RUO3kOoXtsAtfYxXS2NmhRLBO7J3dvMzKv9NVONQZTzJ4P/Vw1EAk/EYWwhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
	b=P/kksYgVz/a51KZs7cGiKAI9fPHgji8aPYPkShBjUYnMHlnbgiXP3xBxWf27UfBFtlo2
	 3g+pI0tAaVjIia8ue4uXtxwhBf7rWSGvjHRTJxTdgmHOSrKWlYvNW3tJECWGJ3n/Znmkz
	 naE57twr8MZP6GTAur6nRZKrGo+YNJKUWoV8Z/6xm7OH9sjvzbAVY6vuRcuCTVe49bGY/
	 hSR3QDFOUoCqtkXSaiRrzfQnPbMalJ2g6f6nwsrJXLHPbaWQh+M4ekTAE3OjEcvFSglOR
	 jBLiOhBRtnWNvXDOgd7Q5gGWJFELO2IE/Ec0f/Y5cyA9BYQ2KeljnLPisAtCIXcMaXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlNXwnYe;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF0606EEB1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFF0606EEB1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlNXwnYe
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2797484a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664279; x=1794269079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=LlNXwnYecxwPmEInl9yrw60YPHwwc84rUX2iKxT3QB7AIRiY2yTOgozpOCqoR8x72h
         2Tsoa3wUQOV5PX8v63I1pyT1xhUa9vV9UJLUEh50+uLJFzbnkvB+Q4nc3xvaIdkQZvxW
         /9JqbTriSpRPkxr4h3n+flOpEaC4F+BbazcAw/0n3Lmt8xGIorOuFJc0EMmRz5zmcd4X
         P7l14OO2yrQs/rX7hJunoEOiKAObqSyFiZJSTeq2APssNCXohcNV9a10V69O3QcEu8TO
         UG/xtX23IZTYOZAjoeq0yu+lVXsW+ClQVBVWsfxF7GZYCopHRLNIN+KUvRU7s6kyQD2Q
         +zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664279; x=1794269079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=fNhHTkn5KPrSQG5y3hsFHcKqZk/Ik8NrDYdfhIuXceLpcINiTpds6hhFWN4qTd9rKw
         3kb/1F/C+auiyrgCZrz+btU0A7P9h8h6s9Gb+FkLqUX/ZCcqwAEEhDjIC5B8ST1Ewqk/
         ni1U19UYJPxmQ9D/lpTTfxFkqHaisvAtaW7dZwg7x6YY1h9xrmgGZp+kOViPhSdoCjYL
         Nr4X0fJiMF0QlpUGw61bZPeVKYql9URm+Gw6kAyYcuxgZxsNvWuvL79tKxQQATsO+KhM
         pB/e9GGZtUDWsxTiAmxGvVFJU6q5evu4UJtEoSnXszeQ5rZdQY+z0kNr9eAQBqO1EQcn
         Rfcw==
X-Forwarded-Encrypted: i=1; AKwUvBx7IZzZX5oBDZXXdfG8nXDh4Ig817vI9KoJ8V5jH3waGI2ucNeX0+ZpdatGhVktHnPEEHq1gN6cf+5XYqw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c6QzqroW5PITwTkX6UpRiv7mnJd3rcjCTRNVsnhsJiFe56v++
	hrKkOgTCzhAsFXuEYCkGPuGgMtJmMLMG7vz1vwmX9endJV4xUc+X4hNR
X-Gm-Gg: AYBFou0LCXArFU6xeV+ibdQhiPba48IlLOOgSfMHV2JqLN56MxpkW+XuY/Yi2tPsltq
	14c8OctxmB2Gp8WiGmrKQ8l3jRtnkNN1uNCkBNzug3ySLG5ndeSKqW2jpmnVNYsQmAm8IsXcKsh
	TPoFSrpukLk6udBN3z9tvmDGlxgpqQ+eX9igzVWn9QRS4PL2YRs2dEXMPzGekCJew/btqiUqpTZ
	fjTaVW4sHMlj/4pcEiHFVVqvutNpAP6O9sbkv8wrxcKnkm8pEFrFg1aY0hgGPpo3jEGszf6+ylr
	RYOfleYJ5kNmqcy6loKMT2MnXkfqNEZrv97XsnONJuKJDtXXc9Z5lIF72YUxMyHYaGfoBJ/UlMN
	9yPavsR50hziCq8y6G2aYpcm4C1ieLfa/fI8O9SgsGSr7VceUO97vok32pr8x2Blt17GkFxVcZw
	BoIew5Q5VPgBBne6UuXJmYRAjQ/Vi/v7cvfAhHlLSUO2XMERPm7YbYSdp9dwKjO1ryfWzUBDxEV
	yXmDyb5XI6fsmzVXtz4TjhLilFslDYYdJcWcX36RnSGNUp3GmrqnTWDYgHTztyow0hOPZCSp9Ep
	mLWUT+wvqUAJu2hzisXWQ2eOHq2+BLnmAPbCmW61N8xmiYP/0PRbH42csKMPor5Q0Sif8n1WGhx
	1mSzLUxZxXKDGbyNy44Ldo3BYEhcaobMi8u+/jwKUTYbJB1c=
X-Received: by 2002:a17:90b:3c90:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ae8918adcbmr9133017a91.0.1793664279142;
        Mon, 02 Nov 2026 16:04:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:38 -0800 (PST)
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
Subject: [PATCH v12 09/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Tue,  3 Nov 2026 09:04:00 +0900
Message-ID: <20261103000403.67106-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR;
a subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.

Atomic and nonatomic synthetic-driver tests exercised both callback and
legacy members, mixed linked groups and later-member failures. The
callback retained an acknowledged appl_ptr of 64, and finite-silence
playback kept the written prefix while clearing the rewound tail.

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
@@ -1984,11 +1984,35 @@
 	}
 }
 
-static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
-			    snd_pcm_state_t state)
+static int snd_pcm_reset_substream(struct snd_pcm_substream *substream,
+				   bool for_prepare)
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
+		if (!for_prepare && substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2000,10 +2024,19 @@
 	return 0;
 }
 
+static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
+{
+	return snd_pcm_reset_substream(substream, false);
+}
+
 static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -2053,14 +2086,16 @@
 	if (err < 0)
 		return err;
 	pcm_qos_req_update(substream, period_to_usecs(substream->runtime));
-	return snd_pcm_do_reset(substream, state);
+	return snd_pcm_reset_substream(substream, true);
 }
 
 static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
 				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	runtime->control->appl_ptr = runtime->status->hw_ptr;
+	/* The reset callback path already completed this rebase under the lock. */
+	if (!substream->ops->reset)
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }
 
