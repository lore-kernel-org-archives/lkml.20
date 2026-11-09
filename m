Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267666;
	b=z6CPFcZdLV7L/To07/bFp6ch/kkUQkgH3hOnzhLLbnSymJuPCcVC9aKZ8yX6BP8Nczca
	 rfcvBPnhTIGlXyigAx1a6dwxFnNAr3KlgkAIRBotEBSl0gKfoghfnZyGxYVZRoh2WVZnp
	 qBVy+5TBq6QGrokl05oAGr8qBYeX5DpSh8+MvGC070i3QiVcrHcRSbG5jWfJKAIdabhEG
	 sj8pa4fkKukG1WwIHWovxU9rRX6n7+56q6PXdz7jSN9mvycJOiraBgcomiBiRaMHxJMQz
	 f25z10EQRhWMUykoCVL6qBC1V6l4tjvAKpxOnrxNVdeYIuXaHwx7Cq/iSzz8s6LSn6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
	b=uBxI3mWWTDH6Ss8MHC2RcciXxwWNeX0xvNrMHLjOQT9c/6XM6nETYaKh2GgxPNn7Y8Du
	 o9LdaQm2VS7vo5SeVbq9YbEOkg0meSXvNqto6/0fHU/2Qex0ghSFy63Naik8QAX+P+CZe
	 BBB0whpREobCWxeWz0d61vucnGg21G72bkPN9t3k2mHC3ycgQmsymw6ofyd7MXMYTe5/A
	 nxVkMuHAMKWfjBqPkPkG18Or/NHYszGwJ6rg0UtlcPlONYbq5jyZoN1rcfQCkIRzVbZWe
	 oF0wpMQ3/fP9mDHdGS8LJl+wRwoqQNEr1P13tIs/3UyrGO8QModFzeFnd2Wd1zH8PRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuqS1GRm;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC64606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AC64606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuqS1GRm
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2251612eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267665; x=1794872465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=SuqS1GRmmdja8rIPttUkgAujzv9XwqgOislAl/A2LaqDh8gbYESfV9DNbEpTPQpTXs
         R0I8i2SFaatEJEuB8a+umJzRr/sGtWulT5R4kJq4+iZIz43sOn0xlKeNTm5a8Q8jy++q
         UOdkqeki6V393kpAMlzoxpLpnqcz4+A6mmE56jW986I5lMd7fusrYhIHGJiiSDqdgwY/
         FKo1271+jfZCvXLQrNlP5a2/la7BL5f+/x7vnYFTta4vBwPWinOxbq38Zmua50ujSHuO
         QWzDqyNjqsDVfv8avd/ZTw8wI7BZX6/b4a8hK4KQ6aE9nWt4s+k5wFwXj+2/LhmpJsUB
         do7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267665; x=1794872465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=a8Vam19hbDIAHHR+fAqdnRO5xWog+k8mK5HpdFCmJgcoJmI6c0VnmmaFUitLGz7GzZ
         kMQPLwzFpLS0zKcegH+R565/gI+MozOyGKQUgzwFA902qHOOlgfKEwSC7IEwssWc4SdG
         b9kgsqQDETT1VUuj12SPFdwzOPAhks5B4guYHBXd4Qav6w2k2kSQG7TJAvN3x21/7hy2
         +fDFfCueXZtOHtfrJWVnahAnb/ywWmXdXeYded3tJR+wXeilJPu3tHvfo1nEJO9Ju60I
         lQ3Ot8xCYFaMvk//Zdncg+zhcOJ0NBbfztDn3SyfLgha5I9Ouf+hZ4FAPntgYoXPTYoZ
         W5qw==
X-Forwarded-Encrypted: i=1; AL+hErHuHJj2nJQ7+RqDzJJq5J5tFBSc537v3tsmino1oYKLSCXq8725xTbiXAKIFV4jochIKBw7VS3TTr9NAXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pkdJeaONai0qMbdi6OUP105KTiwwe9Md37Pg6WtjjpG5cM5xh
	TGDyTnYlTifGnPozrhL7ULlM4fj6Ct1np1Kiy9ODX0CGgjqFxw/5QpHX
X-Gm-Gg: AYBFou2+VfQSzoIhxqV4fmYv4S7izesQiat6i2xQdrg9fXLX1y29Lzaxt/f4nJayZWZ
	X+kRn5RV2y81gOIikEsKRX4dUwa8ZlENcE3/e7F5pp/3GnVGDL5iqY5wjCG/7Ip6xxqMd9A6G3R
	2GDV4rzC+0ob0BwPGGarfj2l9xNtQbMB0Ev67SenjWeMBtMGX2Kq07pxkBLgg9px4YAC56B3Of5
	GRHLhIKS7tj/08tn79pG8pUGgbWPy85bCg1b6cjS/HRdPN9i0qIVHKmfWful8fl3W5f1+1DBjy+
	GDPU39UZ0nyQA3orABNJE78LHT0XBa9Hf3rJ7Y/77AVGr0DtTmH6m+0E19HKl1I5sT2HFbmnUAG
	3S5uyHhwShd1iZ3KJHWhAJEqLtnVfirx6oz1IdjvhgYp/bDubjca/LLhsLnHJkTuY3/wg6mRM1Q
	iKudAObY6rFYx9MwXzAm+A907xqYKl1Tp+I1/dwLlOW2gLbqHWKvvoNB/1NGWUomVnCAbh5frwx
	58Og+F2G2jFeI3PofH2cpV3E6DEBXNmWFQKdUn1ITliJwjiqtRAgyDfyTlJnU/Ldk1mWrRKShg2
	ajEJajKqsBLGLREruZ5pe+bgAry1d0vUGp4EzuUTtcWIxs/svDZdOV00Zv6YMQ+vw3vk5q2fn5X
	+bhcPQAbJG/CK13/8JghJILE8EF8gxplEizWFPiEtu/toebA=
X-Received: by 2002:a05:693c:41d7:10b0:36c:c483:7077 with SMTP id 5a478bee46e88-37520217b57mr1041091eec.14.1794267665005;
        Mon, 09 Nov 2026 15:41:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:04 -0800 (PST)
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
Subject: [PATCH v23 03/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Tue, 10 Nov 2026 08:40:38 +0900
Message-ID: <20261109234049.79534-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
 
