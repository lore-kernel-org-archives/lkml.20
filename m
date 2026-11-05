Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862546;
	b=18frhhB9a1tzXK5k7cHnPkf3IPJ6JauhVuIOP9DAJ919NIAYHqojFcrd/vIZPWncIsza
	 xgW/5TrFYswcubBo5s1pY7Ey7cUKtK2yf9bMlOpwnYtjfZLjXaYGcp+vnHxMdVQysw7g8
	 tTmeMbSJPiqzLYOyZOmwFutVnou7kYVhS9mWOpnmmDVQZ0/dKg0mHK+Yy04dOgcm/UyFD
	 qevihX/6QW7OKPwtZDFNo/7w9KQC5wDLIFohDJTIZ/bNwuLpZVr6YLa8cCOJYxBITX3GK
	 8mVVbpQomL+Z6vkEYRs3qmvEqzmTMJ1xo+1fTTZdKdActsB1l4Iq1n2n0B6Qpw0YKnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=fdHLvCkyvIr08ZaPxIF9sA/+IDZIJMLVefQkaUR4z+UsPqwl+0+zZuacFhciCP7b67v/
	 NKDwJ1JaNcOLLXzxVCl76/sI8mFKK8RcH3AKci2K6V5qf8KL22PMScev7zXa+GT1PMlxn
	 srpOeUKoKQ/Yt6PWCK7vSghOuKqYySYcYggSZ2Dxuy+V8K1spwBV3uO53xOMPvoa9GptS
	 WXMJLfAHcuJeAFsfWW96n1XyjUc5YAV+pORyqxGbTryToaLDeChzz+eg0PD+Z9nQG05Gy
	 B40ggRO4FBPyKKRK/QxuPeIKK0iw99RMGxuRLkEbxKK7705HokNSXzpsC5ce4wBWdVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WNEjKjx/";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD9C606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FD9C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WNEjKjx/
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4145096eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862545; x=1794467345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=WNEjKjx/D0KEruV01tfudgZl0jC0X+LdK6/PHz35MItecs1Mb7iTEin5faVzaHj9Vu
         kXVSbyTXNGfjoJ2gM+cgLukgp44tccCL8KGDCUiEYtZFAgllBdcac7YHqiKNR0TsYANX
         kI2ORdRZUSawcQr2nc4NyGwH3ucrW41sJFrY+wVJtP+gMe7KknMZPmukoIGYg/MOKa+j
         lF3JWpNMkLcy8M7eHibzBe/imzwOcL40Ss0y23av37yHEbgDr/XwBbrUGNfQ1QoJaJUK
         yM7Yt2GvaUM29aopF+NAe1E9FwgciyA3GGuNLjNngUHXjBFpxahGV8pKMW8MpxF3Omab
         I2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862545; x=1794467345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=Xz9AzYJvXEolhd85BUrkDRDQdHtzzGpE9qfH++z+IieLsdv22uC0LrAkdr6RtBTi/W
         oI+7ToqMP3LkS2zTyRVw7mkf4ryJ+GQphmkujEKbPqC5l1HzFY7BdRaBkrVQ+payfqjq
         6ULL0Lw77ivhHsCQ+M8R19yCII/deOAqr6PvQvKlQNBviwsjzOFKtFndWRRQLOa79ljR
         /aODa4U2Cc3hznVCchsDSgFvvn3+1biLWc7KJ7hmnZbg3n8GbFrLf21miK5Gw4BoMaQX
         5hYOqOMf4mpycRpVADbHfykeSp1V31XpneJPlj14Dm87XDnGCydrD0rrf1nltZAjKEMU
         kDuA==
X-Forwarded-Encrypted: i=1; AKwUvBxipoOH9N/GvH3+YAq+F+yvPRNHmlb+UD1DXZjmKPlvfzCc7Z5kwIz4ib6Zte1V9nG6hZ1EidIUPEH+Suw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/avO5lNCaEmMcBcrxGIZs1mm5RxJWAqisf7hYzwIosbq+wlid1
	SlSrE0h74i2L3uyAiYdjC5XmM7xyHLnv0kz6aMxpUESExFNJajLI/r+i
X-Gm-Gg: AYBFou1UlIAgOr+JocKFR5dPpdcKKPU8rUlELLWoC50c6OIdQjl5F/T0ZKNwkC8hZp8
	hhfiYaE2HEo3VdniQMsARmFQj1SjbhdxS5HncSmuYApDrbSe22gpwLzwsDJmofqjf56W2k/Duxb
	FEplGsfn6fORnExi8I627f5DxGqpwNU1uK/kmj8qvcZj/QeY2jhr1rOLaYIIffmyebnejIolLc2
	6SewGT5uEzoqGY/Pey3iTXGfZdCjPqT0ZBFB9rLgVF92G+6etdIfzH5UgMCarKJb9JJN7DTTV55
	9fb1k3/mE4yQLEuNbZCS9ffLbBK6sK+VY9p4KS/NpvCvoOK4IJ9WfV8nK4J31baD7Gl+lI6Hcy7
	aWJup7J9k2Ep9Yj6CVYj7iMYySeuiN9+/x6/hH+8zDiAPSfUU8BiSPn2RiIMA23p6kzqv3Ikwei
	7p1eRBqkVcjUSHcnESmLMQ3U8PqLw3ngsroc+BSiH7DW+9Y0c6FCGxD5dtjuIaP3+l0mCFwm9OK
	lmnYRFwqHA5zldBU5cxJ3kN1TuLeLq+Y8hotL3nx84O3jQqtPBHX8zTcK1ngmhFN9ODHB6DTL24
	671eCuBGEkjjouVYq57VoTNY4PAauKmt4eFrKQtWF7Ooqx1H6GpeMGWx3ONROe6LuiqHLcTEDS4
	lNPFytUKmjIzK38Wik1+spZ9skOlcRCvHCvhEg4S8E0YdluE=
X-Received: by 2002:a05:7300:3f27:b0:36e:20ee:b288 with SMTP id 5a478bee46e88-36e20eec626mr1727307eec.12.1793862545090;
        Wed, 04 Nov 2026 23:09:05 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:04 -0800 (PST)
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
Subject: [PATCH v17 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu,  5 Nov 2026 16:08:36 +0900
Message-ID: <20261105070845.6449-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
 
