Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461704;
	b=kTXaxN0XVCFlQWjaIUBWJtQmhIOZh0+nhuifUwYnEaNToG/mSsHz1FxlyKMsDzDCXpST
	 DCb2STvlxufCLVI5j1lkM8TyAKHSxS+01sWtnwLmstr8AIviEFBFkBtFK6DLk7v61bF1I
	 KtAXV9Cp/hn2S651BKu6CebfsiRMIDb+mJYbhKchiN5/08qVGu3HICOzDxfwddRV3Ye86
	 6lqOah8rr0/rCiW5mbu7cPpsLQghYcgl/nozMyvEvuFzTfVuss+62SQClOSGoBDtCoScc
	 iRVHx9EiOT2WGguuwSy9jOsg2oTT0fEnpNZnMZ2S442LBcSRK3its6Qowr9NRSH39/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=ijCtAdIeJ3bKSuU0nYBRP2V8CwUYoDOY2ORJlWIh1aeeOEsGdB+vNbWO+YYHKtULqSDX
	 Kcz4GgywO6ocFfpD4ezB+vwbRcHMzeN1oO81I9wFJPLUUsVh0geov682ZHSPzT04jfdTi
	 DrmUO8U+/LLsJ2X7sWTDoMPBx6F9+7dWNzwSUE//1mpenYBQTbj+i1bPyLJJOwuwc+f0F
	 k/Hdj3Eaj25sNcUMoKldVxj3rM8J6gwM7zMLxImUTPTWrLLk5oehMAc8zdhQCNfWBDYu8
	 NUHQmd2jR9Dwq4zubCIbrTqh8Y5YxEeDurv/NLJqeHuoQKQGoG0VM4tsIf19CiNRdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjJLRKCC;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAB606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADAB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjJLRKCC
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so6079189c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461703; x=1795066503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=BjJLRKCCWjp9mFsF1KQyu1y/+m0/pyahyYNYGRqICrjijkuQ3dFl8/rr3Z/zvI8D4P
         7th97yecwptP2iYeUMlOj1spbmXo7bfHmKmzdaosFiLPcptMH/tMvxvZVVDp7dka7XZ+
         4v6x5qZSV9cXjdpB0v9Ip4+zfRLiZk52djfMfDH2jrP1K0OEf5jSQeTylLUr6T+5Mzcq
         9jxWhR9aMYBx3/eujgA1td1O5tFuDmgyHn6Em3x0YhJTNO6do1ImfzeBSEuW/GMAB/rn
         tgEKy2m4dqLu4+gw5T64z29dxdyWio2U/oycpd0LLETkHKBTAiMmqCm/QaUFzSf4PbfU
         vV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461703; x=1795066503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=nH636qCdwaERFtSU6h8xnK1x8NlswebyuIKd2qS85nXvRHL+jAQenDVwbOOHnLTqU0
         JFvxdhtiI9cvbgpjvlR3xM+zWD6ZJI/5bmX6yNlP0kLysf4jpoTzWRC61qMZ4rUBi+y+
         pgSYiGt8vhAOmNhjb3F/AG5nrJu8r4LToeiEjl1xSsaRluAQkondoG2her8p1geOUNXI
         VqJGwwvT9GZMm0dVfqznoc/RBI0LjC5F2qg3vSa82Rhalfr1ZDU14j2zPu1nU1UWc1zj
         4k8t8xpICy2Ry2v+Rz2LVbZ6D0viskZn1+lR6ulRy3REYYxtvWCNFPEDQu/oTsgujJLh
         OVSg==
X-Forwarded-Encrypted: i=1; AL+hErGoOVtw5obUBXxPBH9lQACZfBxyckDxXyYEVfeCuzrRMy5C0H9U2b5wgmfYAGOcmihesVGwlirCMsUKl2o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bgZ2hOUN/QjBw2UGwAHyFTOMPldseuzwNYbg8n/D6uJMx8yWg
	bYKGOOABFKN28I8DcyvIwpS4E4VoIYIR/x7TbF1s8Omg4mfOqy/qyoaO
X-Gm-Gg: AYBFou0SEZ3PA+xbyftQHRSCknleKSjEziXyyejbxyx4FpMYgqo/D+2abuvyY5ekrmv
	HoQkAg5c1/1zE3JyVB4bFxwiVfIAR6VFitMEb0bArNiVv94XiCpu16ZjhOSGxa6K1gI1oByp8+L
	3e396PfTO2iOw9jhBQn2AOEF/Ri7xDGTiBLzysPJs1sD85qGOBTsGqjsJ6JytWl/5XlamnQMYsd
	i2xViYrK99UYekUAFPzPW4Fbei3f4RYG3a8i4KZV/omUXrc3453uNWnHNJp6/PNmFMwA4FU5o71
	pbF3Uy64nC0VkeRNDP3x9WU3P4hDN/V4FH3Pdy5Mb5+NqRfOUXt1WCV9elc6Jx37gIm4SAO5tS2
	uR3YVZc7vIK5jHp2pzEkrZxVZlLAWHmrjDqUu2Cnj/4tul0cjVGdU+waMDOE5HpWOcax7vl68nO
	wKuxlnfGbwlHjL2Vq2F1KzEOukpIb1/Dd4FtMn6Ml0sMtl4QKALn3xxEM+SBf0TpxpwWsAWNC+Y
	Y9hZ1BkeyjHfEytMCVAUuvlGP6C8Yczh/bs2U07up+YtHbhBtzchqZ3pZW3qDWEoovxmvMNfA/E
	wHkqELoWtFGbX/0jRlII5/cyDwI6hSqOjI3EaMXGm+E8WC6tKDpJFwd59cQ1E0XY1X40AZOunma
	UvS4xQW0GCLupFfEa7ha4XMpM2G75VNsJ2/ynDB4i6L5qXwi5mY3BmVqaqKXa5MVtjOxq
X-Received: by 2002:a05:701b:4554:20b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b3c0325732mr4560857c88.29.1794461702806;
        Wed, 11 Nov 2026 21:35:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:02 -0800 (PST)
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
Subject: [PATCH v29 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 14:34:32 +0900
Message-ID: <20261112053446.73504-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
 
