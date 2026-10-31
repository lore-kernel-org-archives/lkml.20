Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412579;
	b=X6jvnFjvuqRuqXsv1aBzM3YAaIGBdGQ2QkUnBFLiQlyl0cnfUOMpx4w7SY48Zx72xqrZ
	 KveFxis7tND0F/VEJ5YIdPEuOMn35TSYz/mbBkzFXO0YFJR57Ig3428MnSOzdDsU1+14/
	 uFBYeWTxxTuADVf+Ec9BzrsEEojCWdm4KZ7piSeVochAM/Ej6F/YWzYoHqxOwYNWMjd8q
	 cGTdUMM3xZjC03GWuD8R5A4cBJfU+WCNo1OT/5LA8eTm+jBiAMZxDJQ9be9m7ih+H3aAA
	 F9JaNSRb5v1jIR4uPddPHPy0NCWr97gFhEKy991fMbRSjSttgSMN9vhT9fQPgMphkrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
	b=HKvpNUtgjCZ8Dz5SjYGSWosb6AFzmmMWDSqpG/erMtZipd+qgHYlayBq2+lMoVXnSl+6
	 SUv6F/3t62H9tVX5kwbNa9CQXnjmzoN+rHH1jTGeTGktn+B8V1o6R/j7+LCSubXtOEE5/
	 YlNjiA8A/n3OXZCXE7xLVozogsRd2tXkDqO7n1mGLfJVqadsDOmVVYyVekudLgFsLY6UN
	 d0Cg1d9a6vucBdu0g596y7BwJ2to5J+dgqmBIYwSZeF9O/GHMjORTDt/Fge8pi+dF+e4B
	 4uyJEUcVogzwehz0/VrxEtB/V1OX76PIGeQaYd82TfFZbFULOm+rKskyI1cskZq0rZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JamYfxBp;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77425606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77425606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JamYfxBp
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-353804b591eso2077102eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412578; x=1794017378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=JamYfxBpZcyE9h8sTj5ZqvvKtL0O2KahOMIfNzXUty0mzYptsXJMc8Gu1/b/KDFI64
         s+fRR+lOwxH4hl/EFz0hm7I7CY6+qaXDnUOXxfemUlb2wY2YMbStUW1+RZ1q0pYz3OXV
         gE8RJ2GbQ7OEmY5t/4fxZDmN7L8iw8IeOVIKawUC2c5XKTBEIt+a+7q5lv+BiHz9rqH5
         Sj5/9z3QVAmEqepWaSAWtOW7d9vYyNbu1Jicne8X976Q3qYAS64Acmq2F6DyuY3AOSES
         XIUSUsi5keSBhDgvnQsYUeXBa3PJYhNmmZn85EFLzRyacRIk4f+jVKrTqNygBVcifAv7
         zp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412578; x=1794017378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=YyqMuu3Lf8jrUnDP2kHtfmy49VQSww1I5m5VzZpwThSPu2mTMl08cDkrFc5/hgBO+t
         IwlY7KvzUM+4bEgXuCAa3njZz/MxyDW1btzldyZvfFhFBa1ztE+GfdG3bNsS6ot26qcl
         VGQEslcLvZ7cknbj04lfo94T9uHnpJxE4uK5kdnBofgTziJLAUwdLmhlEmuEuoP59/dW
         qOLoOvgeKK2wiDgAAAGg1bNKW1vxCefJlSes7+7jJvaAGzRSUnajoUpNIQIsrAdugKKs
         pTY7TR2I8fQjhljsZjbrG26ThO/aZDvdQDvNGO4d+8soTrqqSDT+Nsz4KQ0To8se/3AX
         9M2g==
X-Forwarded-Encrypted: i=1; AKwUvBzJgHYlsOSPLN7kJmwahLcuKgFHRWNzzSI6Lr3JWKDnVJW65E4M2P1lgdYFZrprmAsRg3VpRqVXlNTMqtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjKnGl1WXOOAAndRexvoPTK7pzXPUyjW/zlzuE7st+0KKADamH
	c5IEoAm5B9RrPvXTVRjMgqAi4jtiXhQv/5Bkqd2P/qfLHegoagJyRCF+
X-Gm-Gg: AYBFou0d+1qXZQi3WAXEjRuvakD35GFC8qAsUs6bTieOutESdp2/CpZvIRSc2iXTLJo
	c3UBqw8mkUKWfrdbeZB+tgGb8u08V8mDbi38ZwXNxxJMJIeDuGL7EaWC/Bx5psSbLL7J2xKMKiA
	XmX8wgtM62dRSXqVbyBxguoebCnaJy/47L+M4nOLYuBIsCQ/kV74Kc4AmNcSwlTkMbH3y2joKk8
	4VfwhPx/N8EcoB2Vj4xKL14jbouxww/UTWjP4Lmcl208lD4BUAH8fS2hD+akujKvIaEk65zXRx4
	ivv39PISu5Rfi4WsehKZexb10rCSwfuplXh83XigZF5nYawNx/me8oBrZ0tK5FEpNqfu9kBdK40
	XWlVV+xs1+/FPskN5R6ntLaM+klyqsIOMRenXa81Bacw3+37hyhJZHOTd9aICwUHGIrMwirDu1/
	ndM5jxjqjvZPkdbn/i9mRLB8N1jEGvDPhPqfrj2HmIPg+74pEwMgUcAOF3rnO2x3G2+4Za2bwxe
	G7lFnv2AP6qWmWExEtSaM1Lhtya8CAbqpoeTuTd4fDvEAVKO3wLh0XXG7gPKKEPq6IdjAWbKSNW
	LjCNhYwFrMYvwAiG03WMaL9wkKFlijw22Bx/l1IaN32GSDxRcRBiRprwWQxbCtrb56tLtx8sSaE
	CXE9LsCNkTZeMAF/v2kH86GbM0hlVR13MtXh58TG9JgWNdw==
X-Received: by 2002:a05:7300:c00f:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-36a4ea91fd1mr2670326eec.9.1793412577544;
        Fri, 30 Oct 2026 19:09:37 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:37 -0700 (PDT)
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
Subject: [PATCH v11 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Sat, 31 Oct 2026 11:08:53 +0900
Message-ID: <20261031020855.2402-13-mynameisjune111@gmail.com>
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
 
