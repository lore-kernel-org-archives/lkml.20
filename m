Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981935;
	b=IPLn3HPaTxxsrl9Knb1NVWjSxLUGRxwy1FewAbO1FmQZksDdvsnqXEqVp8YAM8ZhWAgW
	 S1auKB0QGIoQPhWZMuUviZmFRwDK1nt/n/Ym/acRoY+MSkqOwHHKiBak4ff1ZOIO58xpi
	 OUMypghV8TCCZv058Q1RjOj8ObJ1gz+bjlM3COto0Z3Rfol4IWiihKKYzrIR0X9Wa2YgH
	 99U3eUs//0jL3izPsL2no7R3BMW6Sy8THDd0E0Qh0zH/EWD30+w5PdF15RBkYWVkEb+OT
	 KUp3bQ0QEyheB2WXFD2XMPi2au7hRhVrxh06gxKc92JbhfMPWm56L0vbsvcucmmB4YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=acs3BU6vKfJr+xi4Mch9Op/fgb2dlkiItk21rjlr4+kKHHX8MIZp1EVqtEmOeFq6jmME
	 oooWHGHfiOaKAC2Cl5/xrurD7yvwUghrLKnObHLJjYXViTYTfXw623S+mONEVo7O4fVSD
	 jmq4P+Z9GI1BFz+8g0s1iIkdwp0BeK0ufBTh+tVutVCAxySy/vjPvfnuqzwNRKfAekjjs
	 +rfwUO67VTaFBKZIpv4HbIz0H2Q2okx6IZ6GKDGx3FqxRNI3UJY6hTagd7gXBNYQNtmHn
	 /cEX4y0vwCSpod8ZNm81bWqeiGK9c0Hy2m3z8Bh28qXIGV7sY05HE6vMtJKud9BwzNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cU8HJhjt;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFA606EE89
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0BFA606EE89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cU8HJhjt
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso1897871c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981934; x=1794586734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=cU8HJhjtqlhIs2maRf1EiCoJCyiSaHUxjkgBTLdtxojCEEVuWphGIsr50Jia9xX6M3
         gjRJU/GHm4aBY0wyZlYMU4xDOGJGmccHn3A56czCcin6aDl9cjZ6jvNUcvNKY3r5dUKJ
         ex4go3V2wMexgFrOfc/aUxZEHH6g8B/vPIV+O2EMF/CFPoAczxx7Mud7Ljy0AEbxpnSw
         VbpLa75GrXQLSfBSzwcy8VzqiIxFDviOyPVcNwSyyvM4XZ4hgz+yD5n7ZLwk6yBr3hs4
         oCL3bui9cQU05tk0zOeEe92veM66bUBU8P+Qt3j6D86iFnY9cpR5jCIcwx+yUo7mrtUF
         i71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981934; x=1794586734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=pv9D+iNovqmQvwHfPPa2x+nza4KJt+qk5i5ihvG2A6+4QFIGG+derpymCQsn22LvXI
         IY1UNCXIFrnR0hyZ7tWY0caXu0x1n5ckQtPL4VBON65GV+L/zMg+F+sNgupvcE29FFzW
         hQGeG46xY+xLQz0xF0JHajZbLH63vGpdazAI1KOGOf3fAL2QL9CSsW9qVL2/nwWXG1v0
         ERtiIvHS8Nlq0RAWOtUZJg6FR0oMyAdCSYRuNFPhguLnXtJ3UBw0sirG8qQMj6r+oBt8
         +J81feovYuLZ87pGMYXJYIJHZQKvMuxfT03WdY8oOwcf1sh9cxn8nysOAElgbJTcVack
         JjmA==
X-Forwarded-Encrypted: i=1; AKwUvBwjrqnyhjQGxsITyrg15rIa9ttE9dTEuwFaHWCoCXQx/Ua1X2mbuaPSV0VRixazrA0mFgGpQHHPTvUDQGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z++8I17fHVVfD4h1irVDkjJZ6DEN3R3xgE8LZBVYPDCILbBLEL6
	kHMwhWrVmcLSQhjSUZDtRoQ7MkrZcz6EKDQlOPDiFFbpgi9qGBRgsaXr
X-Gm-Gg: AYBFou2i3/fKRJUWDurgrUJsr3PQNYqg6+dS2KhwNa1M8DSHTZUPuDmDdFHOURh78j2
	66wTHY+4dwmjRR0KIsdF/4dWN2/oICOemakmJYJ9FxbDq9l7TZFlmIOkcVe5COyc0LMt7UAjTi4
	BMoTcj2pkEreqd8iEpsGqkNg0ZGBB6pjvgIsPT1zcAUqf35RcCQCZbRimWfGAjmtHtqcIwRpDPN
	MtPey7gcXuRrR6PvBANzkcs8ZHt6N85yb/3EBoxUkiWsrs9HTmHOdjwZ9JdOa2LoSp1qRdJQ9H8
	trJs2TXpU111WuglQzmFOjXkHiyvGa5oXx6AuhBlpmuWErXtW1AVJ0Fod1pXIMxjcneFg95LcH4
	17Vy5VACMTurVy3vqCmlqcCXC3GNbhlj2CUQ8XjdEjD0BLAob7uKae+XYO3oQP18O+e5xbtTn7e
	PgJHhBuYMz2IxVBcbbdfCjx0yFd6s8sbH7s74Qs8OFIrcliQQ0/B9fDkTDKfhum+PQTh5YliNyn
	v4wucY9ozriuBF/V5SKOo0oa4wXxeXoNHPmYipyb9NODl9WB2rCHkhRqBvtXg/KNyJkXtZxzbXu
	jcc90xgowy50dXVTPCsJJ1VAfzatMD5XXBYfT9f+lU84FeoqAL+K3Ad8CcwbrGs2lXJAiFye8Hu
	nAEmcHEmoVsDOviQAxEOaQwCoIGxHs9HrC7BzuaK5gcWAFaMomEmvzUdZCvHYSCE85dQ=
X-Received: by 2002:a05:701b:2916:b0:17a:e684:b497 with SMTP id a92af1059eb24-1b25d293b87mr3742048c88.5.1793981933956;
        Fri, 06 Nov 2026 08:18:53 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.18.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:18:53 -0800 (PST)
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
Subject: [PATCH v19 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Sat,  7 Nov 2026 01:18:29 +0900
Message-ID: <20261106161838.94308-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
 
