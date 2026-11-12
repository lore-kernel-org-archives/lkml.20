Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466187;
	b=A0azb0cicLGFunffkGO1UXhv+piK/1D7I5TXEp485LMoszBZOlqDjXBE3WJ34lLW4e2V
	 tQ/jgCq9dhqY9hVTrAZToVkLrbUeQscbSa819vbXDdlAOJx/ru97bn0Z9KcFQEm/AhBuE
	 P5Oj+Z/KKjnHb17csbN3nbPAEjSDSd3fKWQKENRYnjoL2hkT8TLURuI1Xzf3ovFt/L42L
	 B8r22B9YYQKXiSyvqMSzj2TexGhmUNReQrbqmSuIfN1+pPhxNFCuhqiKG564lutRCxUsO
	 erDtb/fIB9eXOrjsmVGYzJRU5BjZO52GTLsBeWa1SuCVMr0sKe6njj2R6FtTQ2TP3kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=Jmhw6bFaMbGLsIQ1Cg8VbYkgNjUXnJXBh+wYgCFRgFB4BfwlmN9UEvm7K1Y+d13Hvdj7
	 l48TDpLazJgMGaykTZHnl/9WaJQgrW+jbKhi6I4ZON8+DFDPw4Tpd3Xb2t4VekCBDOasF
	 9H/jo/ZY/5gkKKFUcw9bSrwY4KhLLcA/H7VyAMWHlODkfvKeTBO+d4cLA0vzUieMVM0Lp
	 MzvccNpd9hwNqzJn4KKqGmCbDm9bhIbdofb1CcGiwLGVqD4tOWDPNMJqZCatSU5WQugeQ
	 8DbPTvaqdWiNgd71yeYM0fQjUPe5Jb823Ja8knIMmfzO6piexvwldurwru9RlA1oMNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7iNYNvk;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7E2606A89F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7E2606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7iNYNvk
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3204889b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466187; x=1795070987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=x7iNYNvkMvr7r56qZuMTo0hXQ41yxZX5b1b3+vfssiP/V7eMpNVWdSteWbz9qRrV7/
         GaXWxXEI+Q142rhZ1LJMRxHhSuteog0HQh4zc2fEFXLRSizcnQWMPvOuASAhAG7PoUTv
         DPGk9YeMnac9vVzngogroAr66DaTssrEKohMUFrH0+MOjspUb9yb5dXe1rXuJYzpvbx2
         bLqKI4D61qLAzdoxdhU/6tn22htyAmYEAGz1jw/Vg+pq4uvT/At+7TD95D3ER0bP1Gso
         FwQ7k7iXCPKSiGx6kcCvQRHDkm6fKJewKOlY8mgQI+Eb4S+fVp542NrKqwx8CSy1BsVo
         5FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466187; x=1795070987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=CwYL1mcz6twAjQqpjzKLxDs1KbdxO6I6MHB+9ZQRD5y3HPBiFf8xZtuGR2vJPkKNBN
         JMgGxo3D0bqF3bYoySHo9qrNMwrMUoSSiZNmEIgqzk/cpfsR381lgBeysXCdLzVo/gIw
         NDkROeh1mNN/mXOe6FYTbISwnyJsLzpI5aPP7GIuuyEaVh3WFVKXPTdU8RZrxef35M4r
         wl1P2TMgc5QC4wUBOXKxTyWI0SMaSctPqlkeSBs3CiMkEtrWYRS5lkF0ANrmSpfp1g46
         fDMo2KI9qunJC7+lRcKRYI45fjyLboasBqfK766S6KLYdDhEBvE4lhyNOu6JYVMGSpME
         DzMg==
X-Forwarded-Encrypted: i=1; AL+hErF8xu1+pnw8Hg7z+fr+rVIZSQKUqqtw6XmDtjReLv1e1yT3j7Shg30Zynm7cI+zKQGPgMKOmAEghjzPwFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TCQpkLvjugS9M6O+sYUaqIEIx+P4k/kHQXYJMPRuhHjRnpWYK
	Py1r6JV7EWf7fRHYeG0CuW9RNyPTsO6+vus5OBHBUzgn077+ffJn52Ts
X-Gm-Gg: AYBFou0spFbVZ1aWqvKMJzd2tL4eyP/Db8Ne32bK+sfKAZFC4RByYNVlby9zEG6fxLl
	ag5GuRbQwys+tYYSoKnpPOBN503QUoKRRJsxICc6Tt7L4T5HBbURa/c3mhardxquxT7/NjG+43w
	b9mGIP6Jw8GGHPJhb6cLABesidWZ3nmBa28LnbRa32CCACW5cNct8CIcsK6lry/dZyJbTRkrgME
	Nt/gD/sXaftUwsZKqjUIwfoWFI3o0cWSmoRX8EcE0oTiGapGHVpN0jhx2RIGVjNWY2PyofXDmsL
	a/DvyMMkZo2hjcHkakeQ/YwGFFYe0gsmrQ2OUxIA7S6uw+lWLgxc0EMF0+dNZOnEfkdCghP/RlK
	RkuTxhQiJnhyWj3UV+kCcxzyRs+puvyoYQ1xMnXYxWUvxpqQA7nU6+hxm7T7IXvNff4bFcGaQc8
	86OMkwY3Mx07YSmYuBjieD5bLvAxD/oA/ovq7vHm4uGD88XYsmxfJoHOKf/+Ws9fuB9mvzc4atL
	rywuWr/j0HP6AgSIbM6BdbwhM/N9qjHLsMVnYAvgbGYXE53XR3Uy7jlQzTHr9iMhkrW/TXfV4bf
	8TjgqkpuxBboYzQJoHCu7RvZhxzbzJEk5xkMjiyL4tHpeYtXwL4JUoqOiJYt8pNTxxsFdtuxRq5
	Cqxj6pIgA001a8bjWxEnGhIVjXbbiZHZ2APLS9R9XhZCLNN0=
X-Received: by 2002:a05:6a00:84a:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8bc1bcd3153mr4592079b3a.26.1794466186637;
        Wed, 11 Nov 2026 22:49:46 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:46 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v31 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 15:49:15 +0900
Message-ID: <20261112064929.11211-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

Zero permits the position rebase; it does not promise XRUN recovery. A
negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR; a
subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   21 +++++++++++++++++++++
 sound/core/pcm_lib.c    |   29 ++++++++++++++++++++++++-----
 sound/core/pcm_native.c |   45 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 85 insertions(+), 10 deletions(-)

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
@@ -1766,20 +1766,39 @@
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
 
