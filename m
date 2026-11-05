Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837374;
	b=L2gsvTZpscATX/NVBY3eyI6+N541knDyHKJQ0YVe5RomhnthOVSn31NtsJEyVDafEZ1g
	 zBo4n689wmC/RsfOul6sLNaVbYakgs0fNzMVv3u/S54WWkt7cgzzNVZ5RrnkVGXJW0ETY
	 DnXKpXmFBRqa+rWCqZc3Ca98ESH8jw7o4zllNGqnuufGZN3S4Kutj32BO2EOQijUpmTCg
	 HjAXkCnzadmvDnT7mF6q/S09ZbOkq7auiMJKN2HQV83syX0q4FVzjcbIQhlkeHBN0DDdR
	 q4LkkmR/PQviNBo39T3gmcfoVTWDn5zPiZIlO0dZ06p3YM3rEsT9oeKSMqaWieNayeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
	b=iF89hmwToGnFTIg2GU3HjK5bMM7e+YDKLadyksCadEZQZHwyQ4WD7C4dFpIiotg34AGe
	 NIvDlbxIMN5d+Q1oZzmvURyKoJOmuLhHPm93zLnxKrw/2A2QPx/dl5V7hhDFIskU6bbMu
	 tHalCmZzZ5/nUzKebOplm/BKai3mpp4vBaEEjT+bV+vF0s8vhYhpeKyiMiJwTW5phgwKB
	 fqZuytCE9qqWuldf7dab44EH2u6IaPWkrTlOw4U4swt3GbhSz85dMgWeht8/1mG8pC0F1
	 vd7YNwMVw09J23XIBATGYcgFxqBbqtUm2uRprEvS7y5K4vTxWcuf4elIBjZVNmOwEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYM4fthh;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2667606EE8B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2667606EE8B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYM4fthh
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so577410a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837373; x=1794442173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=yYM4fthhWrzVUiOgBjbO4eghqwqXN2JOvpQmExdIKkWJs7H8nKY2Uh+AcvkK6hB0/+
         DGuSyntDd+A1HJbTtPjRc7V3ReIQiD7Vecwj6S+kkaeAievC+O09Zw0UfNBO841KPUky
         LP6pfpcJLnhHqyWtZGPzbDc6Uc0D63GuGeFFe/hAOxQM9fRdqMVICuYwZW6BhYY4QXV+
         l3GYa07zxwaXQNukLKz+mJay/L7Xv8E4M9wBumFWR1LUHdPew3eF+U1PZVaszowWaL6e
         v74s9Zh/kRulhT6lan1fyhJ2QI6s8Bt318NMnPIIgKOClbpuepbwxmhasGIScmOqvZFH
         8Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837373; x=1794442173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHKQF6GlsIfczjgrvixXpXdQCWhSz0d2+kn+Pm1nr8U=;
        b=vfzZylWk2Z7s2aCWWIBHt2/K570h4H0Kf0Zj9yz4gl2L4gmI8BLeznaYE1LlZOUM6i
         ceYlQe5fyoxuuYXRdbT5GuVujrY9TUqA/lPqchst6NcqGXf4INi/koQfBeZqJ8zmBDwL
         Nw/KlEf34G23r/+txvW8tR454VG9/NL/BQrbrJ4G7mik47/X1oQE1a1mTlL8/uUUyu9E
         jynx9LBM527zbzMelF0vhHxdvxJCRY8C3TENWaVPJaQ9L9LK7cP7w3EYav5hxCzzARdb
         1LfvAf5HgNYENyzua7AtVPvhdS4jtmJ6YMO3RWxV/DMa4VREALEdnZFlGZcxrfmQPGDv
         LHAg==
X-Forwarded-Encrypted: i=1; AKwUvBxDLA4ouJqm4MtfFsJeuZL2QnGf50+z/5S1y7iqxxXaszIKy4PdNLAn3/bdfyOA9x3X9AYUdogRuPUj/W0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IBfFsMM2HGQODk+zWiVcXlcDxRov37dGPq3mKAyqGJaXvGW5d
	kDYqWxwclPyEiPhB5E6T/1BVEu7V1id4iHZdVQN/dxGgsQ6psfAa09mk
X-Gm-Gg: AYBFou2n+MQVo70Peu87rZmXrnPQkCUIjPErTSOciTT8ZJYK/tJh9M0hIEPl3UuNizE
	/qrtDplWUFPcGFA/QPE9rA8LYFoLjOVawVTVVmN940k/g8pA5FF6ak14BoUAK8fPI+6fmcEwy9+
	wlHkQoZDKybwYnZnTWsXBhfuh7OBgw4TIv1EJqjJKnQIqLT1R8exNQu2jK7gZIPFYMp+JeLJz5g
	qaGAB40533Hy0Q/KOeZEm90PrGXFyJrfCbiWHqKoebJYvGugTouk6utB1Z5efgkz2QJuZN/RTej
	QDnHSxauJ7tlfsRZ78unb67CtDqjzgnMG2oduUL6XlzH2+gvhAXxHp7sz3a5wzTfL/uYaFKaTtp
	OpQLUu5qqVTrbxlwEN1WxiFDxXMfy0xr9vV4t1jvp03PjZ0gi5OwEF8YZP5JbwbexPvBZNXURfB
	tk7FRHFeiwfD7LnIIhzHxvaje6KbZDPfqUPJNngweZTOqlBJ/LXC2jLO4Z10CbRz3CP6L9uGg4q
	rGV7Fvc1BFt8ULzReYUwsICfaH2awFZ97AAgV9KetXh5nWvUqBgX1Y6t4u5JAPxh1fOqUuTfOMH
	jDKGJ+E66Ch+DIIFFRXlQmNeaXNnx1MXJ0aP9o+/yNCA5w5zuHjLP9/PRamoqG6urNo2pIuKR4i
	K5QiYeMcDrY1j8NvyWTI8aYZNN+aL+c9RqtTJHITLaxebmyc=
X-Received: by 2002:a17:90b:440d:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3ae89829890mr14773097a91.60.1793837373127;
        Wed, 04 Nov 2026 16:09:33 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:32 -0800 (PST)
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
Subject: [PATCH v15 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu,  5 Nov 2026 09:09:06 +0900
Message-ID: <20261105000915.15177-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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
 
