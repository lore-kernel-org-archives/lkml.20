Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464701;
	b=NKLU6CPPEUQ1Vm9EIUI7jXeyWV/Knnu03eFnnDsQGtcMDl5lhRHHAzNIEz4CmphivW6f
	 lIS4qZTEsGuAiAEcPKCHAkeh2qP0mTtkQJqJFRJQHc3i/7wqGVQFzAge233Mc2BFbx+64
	 X6oiLDQDE42T3gc4ggCCCxrDpFBDv2awezV4+6JeddnKoLawD12h7TGLQl5t1HxZTfWN2
	 qksXMOcaUe4K13B0cpc9PkaQxwrIW67ZNqq+Y0QwX+ghhANvYwM2c2/Ep4VI6XImjIqpF
	 KquyGeJDp3J/YgDEHiIc1xhtcW7UIjnDTgdeROSr3RDeByzcnikSSelUguK0GW4Z0Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=LUXov1o2/m6oBWpVWfOgiSbVrI+EPkfPetjuxyc/VcZO6y8xeQiK5zxjEk93U0nydibG
	 NKkDwgtGWYg+g9D8HoZ/Pa0XoYXvNql67VTSKqnubMaNnHNv82sLhIdNp/zigO99jcS3x
	 Ey7dxeWx+bhmOTkR+Udz/6Dh6x9ukhkbaqi8eu+JWYvr1zuapqU/2WrhxRdY/DxfhhkYa
	 nzZeeDxKp+5fDuUgsnCmwttlfsbQHOP73fbtkCfsOMLgjZjosYjJ82ZAuZtiisEOj68MX
	 3NprtovaGWfSvgPxjCMJs+4WLOk+KTUNlLVuDZc9jQdK9qLxvLV45uc6tirUxYTObmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67279606A886
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67279606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e96502e447so32228925ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464700; x=1795069500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=wAnRLJiMuzISvsspdYm6JW4tFfMNYWIHHCHGj22cXlZ+E0VxYAhyZ6To4OETqtuW2q
         vqt9T2SWrnuyXJCUmBS0ocllLBk6fegbW5sl3EPpr/CbAgzC0JP7ssqaoP/YuB1PF5Bd
         InE8Y5rbg1gUeBCHkdvxQ1v4d3dz4tITw4YMLHdjy4VkyiWkJ6xwfMxhjZsUmtmaqppq
         ETEXJPPcZ0/ClcVAZaCX9T76MRAkSvdtHkn0T53u9tT6kqv58KJvND6DH6fYx4aFl3Yr
         rVvEAyJcUTiG/HmRrg9OT7DJPRTNpbJIuEegWK1ooJ2TJwgDjKwjEA0twrcI1z9kcg1s
         UyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464700; x=1795069500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=et1RHX+JofuwbqORc5Xj6pL56pz8rJtNEfNbzBLzs5nSkzn9WAkEMXd6RgHhukjwaC
         hjPXHrYVW8hqu0dpGaUiFQTVZqVlQ7onZ4dOhXNa8CkZ9V+KkNMCYDXNO0xzTQCtsPTs
         bueT2XXv5lfoW3aWeCUicwC5DSwQPUV3Wi1O6uK6ySTBHp3fT70lLMndJlBzGUk8acT2
         Z8D2A6iQKSpk3PngBX+Wxtl/LBVL6glBDu6GUl07NPSFENXdylPi/+y/AWItV6IwhHO7
         KxZOF+J8iw3fEFpsNAhIkyJU96I58F+ChnrEQ3LNMpPNe5pcL0ZviCFBkEj9AkMXiY0d
         aQqg==
X-Forwarded-Encrypted: i=1; AL+hErGsA1/W2jSd6sM4aMgc4MntFx83boLUTh869KV8tpjRxANURCgeRg8WNLSCqLW00SbOTtI8SyVhiS7arbY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Jr9bFck4f6tVDQhGc1lwgPrRUuCF656OJ+YcqCcF+2PphoPgn
	9yR4TF9jVXemWkw8MGhZt75wTbgzBC4kyIa0avBSrYzLMOkMJF8uNzo9
X-Gm-Gg: AYBFou1+HHLY0bhjQ3aMWONJhtMaLnKaDlFtFtwEUJLRg9p9vsez04xmEvgBexyWKrM
	GHfIPepPNFjg7IfBjB5S1dHrGFGZ/cA0UsHsIT1rDsLfG0rKvOn/Tf9w+oVfTwZzNKHnYdMrSS8
	MRrRLcOcnKmCbKeUgPC1vDgE1UFVUt7b7RQN+hk4B81MKmpRRDugtEN2VO0FJTrtwsnVCXOePO6
	oH3ICD0kWInaDvwpb2Vcwv7p/OIUdjcbZJfduhRpAEHGq9B+gmUA5unrrk/KAWAcaxhAiVnCkok
	cfn3eEgdYEQFm8ySsGqcQi4ASkIkXExdtYZA4Aq5mPUb5Mb4Cu1dd68SdJlJUbhRfv1w7tJ4+/d
	ee1dn2usn65P6Vt33+bYxaLsXUIB4+EoKYKePB8Qa5DOYJqnyJhMwVndCHSJzLmm3IQih4j/WJq
	XXq9ea+Lowa1iquekHk1e/shyvE+DQS2LCmViAv53mkeyTeQbJASGQRgqyskTIlF8HlkGzletLr
	2jYz4LuyTDgcs3OforS598yv34dV6BgJENcwPlEMbjBC/mEQkz8nrRqlRuCrf3B5ueJosbJg9EH
	a+Ekkehbe+D4gd6+7zL0DsqulVcHcDGZY+hlNpwmQebFE34/dZ8M4iDHSPMU2hyX10FLpmivx88
	RXq6+RKoB20mHcqjrvVMjxHvysgO/QUAV5/JoN6M8r2Ls1FxX
X-Received: by 2002:a17:902:f54e:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2edd76d66f3mr54934855ad.14.1794464699653;
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
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
Subject: [PATCH v30 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:24:31 +0900
Message-ID: <20261112062446.159-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
