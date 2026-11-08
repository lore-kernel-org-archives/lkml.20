Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182121;
	b=Fg1xC2jjzfgh1NZ4H74TG4Zf8m9r/mAl2XiIRuDtbnHChdE6tHfn4xl83n0Z1f1gI/X6
	 Pab3ilwCjvjlTWDaHUxxpADbuq8Gat0jSZqHUkKxhFNgc0gROa5zJZSRvxFQFeu1V0d3y
	 SjWN3X7TcIdPX4biwXcEAHDTHSKPpGQuUasX3VkFO8hDJnHiS35/X0iDvYt0nKhsrGGI0
	 V+CrkpY2/0qPpvlAejkxhBjOwLQND+Aaze9iVgeGukoY56e7uwvdDZCekVQbpWTTU0yF3
	 r5VoNYrIW6+Xnkkb3YtVYWmak/OlmvTieIh4Px1fEoZ6MXRv43IE68aSPLoosm2352w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=qzW0omPsrTgXUiFpoBIA09oA+LvxFtbSdAZde6xzorgllsx6BhC6vdazXGw/5OPiFPV9
	 zHY9Tk5PeCfbTfC9ETpNwE7w4dfBCB8vZP/hK+uQbBKLrmsoEFsJ3zN58djhckR13XlT4
	 0BX55TZ9o0RY4j8JavlCdZKrTbFp23tx+DYl4gFnOj9FHgdTQCYplbAr2eh0AtymU03B3
	 WA/0kB8nli6K14mwIunB1nK+PSh80S36DSZlOi8H5l4h1IHFoBvOt/rDnvHFdwIrTuD6Q
	 XL7eQDv+VaNpOprWyccWj1kdEqKRVNcUp1c9BlYcH9lQ5yHNBFsROvdz3qf3CDXB2Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7o4rQvt;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51262606A337
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51262606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7o4rQvt
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ea7190aea1so835205ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182121; x=1794786921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=l7o4rQvtP5dSqN8z5Z5LGC30BIIPLW4wx/qoUvDRRwbOVgEfekKGEpMwc9QmWD61NU
         VbSImC7sZAJ+u5u3cDkXhIVq8THYZFU1710DINQchYQj4gyYdQztEHbMDgFYc/OVq0V8
         5/ov26cQMFXFhgRw2ZLRCOzuTHd4xsXloNN1DOG3j72GyoiqabiDtbC7PqQ4wuqhv4FZ
         jL6fgE4369CzMI1zIK/cZfw5E9vcoHds2PXRjqnTHnhYXm9waOuUF7AEFFDMtNwfos2p
         +UIlU13WBFlOmwYvbwgbogAXKaXKEhO7sN9DKU0kwBnoUZuI0GojkCcI+IWUFykceZrb
         tJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182121; x=1794786921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=Z22UWPiTBjxp9W0Y519fMpUuDXEuknOfNNnJ2pwryFtDYzqlaqVc9oOBZdMET4DI3b
         oP+YelzIxJWV/JBYIqii5sz6DgmcXLHH1YfldCoNmUeimUCaTcU2nUehx0fnXwXdGbl0
         kJQKnN+C69rykIPT7Y+Q0rp1O/cv2cOR7niIfOnmD9bcAVfjIChQZu4LC5wevsqc7zRv
         hHqQNHYls36JSCxHynrJUNgb/7LuGMtsdZ5j/c6JUEPrWi2ecdH7735MvYU2MlP77k9T
         Sgs/4i4VVDS9EXWcG4q/lJbMwlZ/sa0xN158AoXqiCPqpf//2wbb9Mi+VHneGz2QZuCs
         AS8w==
X-Forwarded-Encrypted: i=1; AL+hErGFgKtEYD+Xphh1SuqroQeV1fVC8cfIKXLZH+e2izV48/UeRmjGfCnvdQIKNLvU+KAVpxyEqHPxcAqbxhM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9TXiEncI8kMb3Nu7OWUWQ0HdjU3Yiuv8TW1x+4h53TRXpAJZ05
	f67Dk/QK4JZY2alT7UdYGmcIIsiEXHn9Y2meX25MYs8OeQNEY0pzRhRU7/+mJA==
X-Gm-Gg: AYBFou1Aq1FrzU13Wh7Ka+uqTd2IMTTBv6xFXdY6i7zi1mldkRHjoSnvgbdWCc4C0l+
	o0c+wrfJFb56jmfzTpHhmA+m5+fqRsS77h88PZId/rshj+sDbWpBfft8/GQu5Sqaia7PwF/WE90
	k8hqNt9d9CyhWyu12bju54mQ+5DXqr93Nf67WHrPef2b81YeeAOHt6hDmsG9NUUZoOp+48WFe/t
	eNwtfzxviRnfVgB8Dw2j4+b+VJYm504Yl7PbB/irgZf1N/SEjzp8Qdy5YmsriF2b5KaXRwnqM0s
	63IH9xiX6E35m1fl8c3pWC5MncyDA02FN3aegWUUifSVvWakh5bq50NAth8bIvsDCmT6eGB9q3Z
	mbaPinyaqfUpXXt9AD8H7Fm63teIil0FRIC248Li+ypxJCs9clNnu6EfJbyMWR8WXsfEwvICksC
	GT4B94XtgsDDh+UY4JDZ9f45kgm1yCK/IVEwJmo7B6taj5Lw1wENk06vPo7n00sxBmonw+zrQjn
	Ox/pE+L6/cx0XLQe/mb8c1JXA9msAN9YJEYNdnXtAg+zOULQKKHHWMtWeqnYL+ihxaYKw+y3Qus
	gLMPM5KtFJPDeZn4MSVGYnVcSQREgmSJkUaqFq9k52wbzCBaOR2BRs6ovXexU6UJRwO/uz2Uwi8
	+AxxEtY0nL85vjtYWOqGKRjgiCHG+wU6oPitZD/U6Fsu9a/A=
X-Received: by 2002:a17:903:19cf:b0:2e9:3c10:c5f8 with SMTP id d9443c01a7336-2ed83c13b3fmr20414215ad.65.1794182120546;
        Sun, 08 Nov 2026 15:55:20 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:18 -0800 (PST)
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
Subject: [PATCH v21 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Mon,  9 Nov 2026 08:54:48 +0900
Message-ID: <20261108235457.12688-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
 
