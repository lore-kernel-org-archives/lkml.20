Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355562;
	b=ktLQM72GbbbpCNwVMFHRRF0ovMl4AMn1wjSEPwPLNPn5HdskCOLphSMkeAvKmsstv8O3
	 y7K5NSXASoqQwHCHtqAIKuKY0l1Co6mzCScYcVh+w3siS0NmMq2X+laSb9nD+b7ADqya5
	 u/510A0KXRWXXFNnHyMWPF0Okar40kJF0d9WCp001LNxEEew7Wj50UZkaKswnyW787IAC
	 TZsFxfYMFqtGWBxRZPTmgzyuS56YYztYQwg8Vz2arXqBpWmzbP2WH+rmW/8fsacatd5Ym
	 aiNrjIxgdTSd8Pgl3kwMVIsKioNHwpfC45LN4GTzN4V+KDnrJfAQ6IR21B7AacUl2vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
	b=cWFKMCBIgZi+22gqwH1VWRo1NlSYCyWuQYmVfOJco+wmiCyaSuFIM/faN/gUkYb43Ibf
	 UYQWifisgB+ZVTLStPnnhVG7fsTHDWyFvdhAdqNDtL6SMhwWeTh4rube3C5yzTArkfWHA
	 A8Fap0oTya3TSDvUliWlGdxVQkitAvpUoeIxRtOaqPgPkXlNKHm4ZjabVl2IeNpFgBLnO
	 SHL2y9XCq7LXdlGRj7XrNn/6HeWzVLUV61fap6JSQ10YaR5YI8mWdSIS4A/yBRYi5w9K4
	 VpfKFn3m8d9XE0NSvOOwPxa8P0BnhKZqRu0bW1phN6gxYsIZZiNIDTbqZaN4xsmVAFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y7BhEPU/";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB4606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78CB4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7BhEPU/
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1492792a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355562; x=1794960362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=Y7BhEPU/OA7Bz6dRJNWlw4rXx4TQ1ky3CwhKzSnDB3BNUP2/OP0Cexmm/tgPyn1I0n
         IHZQPU0aYYG22YUIMuFnD4UzeFKhmrpkQz+O/zgMscPmojhmw9qKSVTkcNspswG4Pmfp
         iPKVLCxE5j1N6vkyYCzwQfQCo+GMbCi87ZU13pXnJmwT76OseQIQg+5+c4PRxbpSXl/L
         uoYiHpktyBb25wJdbQq/p2iFMdVlEtySkdxjBgCLX0NvCO/3ZeMjarOqSyxqj0/JTNPv
         eq2CwHRrrgevroM7AgNj9zb4ociYziUis/9wrJu6Ofq7NlBETUZHl1UhWtpasreEs+AV
         kGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355562; x=1794960362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=yrCftWbdA49jgY3e2MFtk6crCM0D5uIl2OGcoSjgNZPHbTcwKAD/tD8rJ2R4tsAS7X
         raAI23eMl7/OLjsVsEKSDjP1A5xJPokRxnvgWfblZgXwqglG+jNKMdaqt5CfWIUiArSi
         Np4b3MmuMOh3mhhnUHiMjgWGCNMfANfS2ZCKh/+3QBqmT5489OJWJjY53TBdU/jBPr7W
         U8uyHsSzOWjdTOOX3DGi3q+X3AuL0Eh0lKOz0/U7eTyZlaLZkH1meviLG0sQJZjveSAU
         /wOM5FJytsk8yHzIT+b5Ae3Cya3En6i/sTnTW/ReN0wGuM7SCAFrLQMeoJj7/OXLHMtp
         kVSw==
X-Forwarded-Encrypted: i=1; AL+hErF3J0hEkI29Tto3Ug5chJwYw4jKVp8W5D3QFCaZeaTAS6gRuhEQ5K16ImJ/d4HNpzicxI2SN1cxOJDJ+Ys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zgTP5+/DBTckuJEwfWhSAB3C5fR9banRhbLmrBN5F5VvXLN1u
	bwF/axeXgQq1CL60yNjosaLTx0ebw4dWkTKe8ZODBFiS7/Li4/T7RM65
X-Gm-Gg: AYBFou00u1S5MDgZ345hcF29f13EvwSQDdJ1b3uMANb9YiSJGrCXsYHlwC05O71d6yg
	fc0Sjd1lIEdzWSnVlFk6s5FisBkoMJFsL8hYyjlTAk/eYi5rgt5rCcRibBRuU/DVDcZtQ+CA2qp
	S60kh+yUycj8FwWLI/BWtutxH3nncVFIKja7VV6gFyTK86zBWRVdrosjRFd7QBnqAttaTbrJQ3m
	TYxofyObAnLCS69E49RzCPwi5vaQZN6iqhIrhK5zdVHduYRY414DBHDEw+X1Ofg3FuMUHkTwFjr
	4zxoq40o6aeXLsI0zsBrq3l1aesXmnlxJaau9Kb8+MAE+m54idM8WBtc/OynbYkfJ1EONRzWJ4U
	7T3OJ3eNBFE1bpQwlVIg8E4xtRiq9SkrS8VcLP7ja3z3TD80PzKi0ALGBZGx3DS+lktDUzDSi++
	yjgSDFtUtNcRi3PpEel76u9mFkkiaU4D/JJFB65hViPm0Q+QQ8/1wAfJMKDs9C0NzbynqWAFRpy
	LH0ghkTB4UWfG6nCI95A4IzwJNGiU3qNUrOStUeH4Un8Lx+2JSeBNznFByZfCHVRbaQc197w9ur
	l/U12rFVfgdClJJLeX8Fpqb+zPKFlCM260o1mAfGfOF5J5YIRQsqlUy7rcTKC3AYK1zIR12zOoU
	tUPHkyNjiDnE0+oWbHqEtMUdx+9MsAixCiH7uVP6oqDVAPDw=
X-Received: by 2002:a17:90a:e185:b0:3b0:9e2f:cfc7 with SMTP id 98e67ed59e1d1-3b182f6a71cmr602868a91.44.1794355561646;
        Tue, 10 Nov 2026 16:06:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:00 -0800 (PST)
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
Subject: [PATCH v24 03/16] ALSA: pcm: add an optional reset operation under the stream lock
Date: Wed, 11 Nov 2026 09:05:30 +0900
Message-ID: <20261111000543.28550-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 
