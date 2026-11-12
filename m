Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444438;
	b=HHktkPKaCtONJGKh5jvyhWoNk3BO2YpZ/Q0Y2MF2i0HypjapRcJKZ8ohcLRWQyon8bes
	 gith7hHGr6JfZyAzTgnWL8RZ9PgoRdLRlAXIBQsuhkn5KJw8dOBc6wRcMjeT8AFEGlSjW
	 aArQ3qTdckzRFRa24hy8KxTb6dftdthh2RyoNoP/Wxj7rJdsp6ddF032/IbHrX83hgBG4
	 tBTAEmEBlpQ80WEhibZMAqsVgGm0CGwaFsXv+2g2fyyCWxnwoVWA27yGCuFckEzEMiZ99
	 4i/6Rh6Qf9GP8t6WVurIolaZPUQIUuwh53qQ7qE1vDTCVDk46RIUZWdF03/orEor9AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=fSnzMvZeh+8imuDdZ9AW2Ouhux0SrWu7xHiGWL8yiw/aRH/PTkH3l7t3FtrDioq4O9kb
	 gT49H5ToPb+AL1ot7cXaa9RwznDe0T+YXht2nyWuwxVPhZzeqJGAwVPZ4hlnT+tIIazsm
	 DPzaG9Pp6/Xwf3lrZEFRCClzZQSpmmNwiZtDGFPcrinE53uJpGQawSWYSFhiWKA4in1kA
	 DT5CLS0TBr8zoM8BfEmqkPtprZINqLdp6/o1KR3yxA2ADefk1knaUT6+I2iCxz+MGfhV+
	 9DLn3UgHvkexp4F+n9QxdsJvHTvz+pGiiUJl4+0Q/RYCmOl7XMqdlbCaQF4cSqS0CFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB1apxmH;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9364160A2625
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9364160A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB1apxmH
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1438d9363fbso236659c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444438; x=1795049238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=lB1apxmHrCwZhrXRpvyCFFprBuPkJUYIjF3kQrWodGCRO0GGAFRlbAayxtEOAgq9LM
         jQof953RhrkIlj3IwETil55etre8bbHSUYLnoa+Cbh2smMifUW+S/qYGo7Tm5XsqThfm
         VGQSvDFo29ymda0ZF8Qjm/YvZJbu9ixf6guktXT0VzPtc1oANMvxfC86q6HCnE/H8swo
         vvyZGc8ApzdrSmYNfgPNld1+08xozxqjeM5S9HlJM0sihYmeaPAbc/uzQnsbF2Genadj
         o1UryQY3saJaAeyVGyRQcWPJoi7UZsUMypEchMt3wQ9cRK1B0zaL7aKIaRCRtpqfQohs
         Os1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444438; x=1795049238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=aTnkP16UH1CuLJeha0gHIekHmyz51s23/aDWB9lCYQ3EqZS3UNFMwRmpTekH5O7FrV
         bBsTs49/wxjk2T+Tdj640dYPMp+2C6bgrOVQP2R2jlDk5unaTf89KA8QP9vrcZH5kGx8
         YMa5jdCb26+OpPtd1a0vRQzZgbcZIx5iMbBFnF72EIUxUHDJrM+Y8ei1qvVYtWgIRGvS
         geaiSn/sYKF+Cc6vDSA5S7SB5iy5RHocDA3UPZjCQEzt/MT/HnchTnKvupIbvhjqscNG
         MnczZGmbaM5fwRnQ1iaQO0dc+n+0XGtGMHluPLI6x2sErvKya6uPE2E3XLRXKH6SAUCI
         5+gg==
X-Forwarded-Encrypted: i=1; AL+hErHHaI3TbFxGB3QMBvNpnv+bjeztC4vyE9K53qxjox8xMMiW3PnIrtyUboodSS8kj1eTA61AAKMM1R6u31M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3hgwR+AI0hBDKwKgOzCh/16Gv99zszShDbbSUXzBFiZx9b7xT
	1gGwCwXFKpY3rVZMJm5ioyMowVB4xKZKMhxpGB8V/bkwbZ4cZ0BW/tpI
X-Gm-Gg: AYBFou0AGmlHkqx/ab0XpfiO9nZ2grMBqclFK2TyQuBSQkCCLn9+mWSEDmnzrwRif26
	ksEZY+oE8Ay+t76swOdiFY6WWtG8ZLOciUVI6WndxKp8QU/PG/KqYl2/dt/XHBYwMgMdIo7rIU7
	l0t/pMBCptLCnohJo85PXMwlVjBDsCdFCBx5INi5mgFrrY8l7NfxzopXZderJGDoufDCVyg5Yla
	/DaOchNQhQxwkmuW7b2ziAoqBdnqdn5EW7lIeH85f6OrKIS1COXocAXXDOyQVATuu6sRlwoMhVi
	WGpyol8bwVMKjktEVflINKSXEUqp5pS7xIVOzxkVayR/LSm0ulDXA3ZCw9XKyLEdNqukVIBnSK9
	4YH5I1tABP3iD495LzndfS1ahmd7EMB1m/mNzI36JxzVIN4iPv64eLpkS7+032SSeMItPqeFEEq
	hZ1zr6JjkeqLROUBq+AuhiHq2N9v9A6faui6CYfyBe5lqVKLxn2Nqr8ktMCUU7N/q31KmWJpkKg
	xAFzdshGFGehcCmTLUaBwAK1YnHhVGYZDoxPafpeXMsYsO8GViNbqqXNyAzdrJyxUdzv9wHpmlY
	B0RJYkJMgG+dueDDei80Tq8ucpUXHu3/sPMz4a9ZOVeVACVTlJpgjPikzjYV2LMNsa7B4iBrJGq
	wqQ6t009FtckC8ktdizRjtm1piAAUH/aw2tIa6+nl1QKpGH0BCxUr/w53xDTECrTYJYed
X-Received: by 2002:a05:701b:42c5:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b4f5eb2338mr989131c88.16.1794444437591;
        Wed, 11 Nov 2026 16:47:17 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:17 -0800 (PST)
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
Subject: [PATCH v27 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 09:46:49 +0900
Message-ID: <20261112004704.49758-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
