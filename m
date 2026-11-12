Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461700;
	b=IFFpeS6tStDqbuFv3qFEnR2JuQWnoK45EZVnqXwLEBp9D4kOxxQDq3TYb0R2mQ0kJdXA
	 //7kJYFKje89vYCR3LLSM7L63wf5GoA9iMdnHbs+A5D2Yevs9j+J5sasw0l4bGKJzF6dz
	 QJbWwhTj22qWj4bh5RQ/tTgVDIDfQFFJyP7dG16bHIRZqu4cMQ2EEUL6GPriPvSI8+yJO
	 +k46dtACZ0ghj9Th/beZOlptgHXy66eipnDgNUIaWs/vgVSvi/jQX7mT5o4EZeIIcqkWV
	 WN24A9S2fR44swcYsBAba4pO57/Pd0tdlWvOVAqcxpWx4Xw3zijcA5sC6DheMR4V9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=H2m+Nqp1dcEbQ2DylDVUKyxxemTO/ATsvuuFwbC7KUxepbJ3ukZRWZGTEoJIw9dDHzlW
	 tCOd5nUjbRr33j+Fu/rpGRaSljq8JHmgPbnBQi9njQVFiB0MTx2IIPCIvhki2WRMKQifx
	 V0ei/NIgJ86sSjYCIPo7esNhIaK/JIKOilyaHkpI1BZzrrWpnI/UlNPS46xahLwRhaYv0
	 CKkGbOS5tZib9XjLqCrJFhHO6hD+9Y0XXT4rTaoRGENd+wiwjGHwveS1H8IRK9lHgykit
	 2jK/nhmnQEir+kWbvCuzUHLEyMqj5SP0U6S8+zbjwdCbyN+6WeW5p9v9e7msawA4onQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCCB606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CCCB606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3acec6677so5790417c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461699; x=1795066499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=Qa3kF2USmKyC/5Q3KK94fMaTXqGaTb3o04XoFeLwdpLzRw04MN3/VxM9g7nzqJApa3
         CwwK0ypdlI4ebXM2B2Jx6JnOSw+viS6jGFZMSimiCrcmauAZkBGQvsmXhRgeaAdxVyAi
         e4wtz5kLsy1bzqHFAoVlAOzDzqSVemP+cH0dLYJAoFWLzB86s7U9F3v+QhdYB8rJ+yFB
         mlTtuANbDb5Yi0OWqJxGGLFfXiVTqMv4lrGQwt3VeKqvO+dfoUn7yXJrsuUkqEfPopgQ
         pabKv613uDAat5NHEAHPbZe1sMJUXpBaRQtonnDD92HX4NcgwFn5GaGwi0FrB7rygki/
         RDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461699; x=1795066499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=Nb5VBUXONliUXq2YUeKug694Luv1SJ8XJT9HRj/VYtgViuLMPYPNQZEw3+yoWvuZ1g
         /mrh6Am3XLFCe3OMJeAEUlg1su7VsSyIiPOqiJINHL0e4RcU0tOqs40OT/RaADhugYAQ
         hTpyY/Uy/xi2M6lpv7vv9/TCN4REeAfarRGTRpW7SWMMEQq5ee418RALK2TCFzO0kypB
         WZ1eKI7z1SziESqMfMyvxS4uWloY8HRZ2nouAcX6RRwwL+87b8mbA9mMAsiyCTWchmEp
         YBt5AXiTHR8A75jlczsRdMc8X2AuGPYclftMKekZuAHPW1AaaNeCn0w/cbvEbTunRE8W
         pc3g==
X-Forwarded-Encrypted: i=1; AL+hErGo8hpvF3NUja/jK3v2ElrQ62rX8a/s0x/yzncoSdNlliI/plrYco0QY9KhcNpwvcZiIAQGolzQS8E0JC8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uDoOR0Ct5SQ+YKsK8i1q4rjIfH/PM5MWsRC2OSP04oW/TJc3q
	i52y4/rd7RGpXKfqhtYC4wh8YWi5mbhI7M3aTwjm7USOHoi5P2W7u72D
X-Gm-Gg: AYBFou0QpUhws/RGO5ZQpghXVQ+w7QGLmOyrC3qRAuKrMeBpoSGKopYpXQSuQuwiatQ
	ApkQkr/JRaARLxwQk2q//6/sV/iJQ4C+JQwBOq937OsAU10esGJNaw6Ppqc6g8eSKSMONcgUMbY
	YflzP+CEQ5VmVljwslj26we+iCT1WBq72Qbio5zZEe5CaZNY19P7AI+9bTLXMw8+/H+ZryRH0+x
	jpb3o1QBKb2sQ0aIk6SsDMj17mEKeXKGNoduQsUFefSIzjQJMcBIAkj0Gs0RVzDdoNuAJagvYFy
	B2FuMI18COHvSNnCBMwnMudaijQWP4WN5w6tX5Z6vdMLX29s4Es8RTfiQXvcgOeEmZRJYda9Xan
	T8WCX8Sz5ttfK4sQgt/CFAX+uxx+ZOVaUtvTY4sYOTyOUQBLx1cFHG+OY/q5CYn/WGRHNZfHEyY
	JWIbMYjDu5cfMii2FBvPjZBDE8iv+gi+7W3M9m3PlWW/eeW/l9scIJz3QhAKRsS23foeExlAOmd
	VZYY/aGvT9h+3FnEVjFRlgPvNQ3Rbxf/x9/BldeEOwdxtgoZOGG06wtaFwiNrhWB0EBnD6TOv8L
	IyXGIfmLtxn9FUrzAjO0hUVxoKzy+nHVKx6FBVESBtPp7Ug5qv3aQiCVCGrNLv4xYZlcPP6Bzso
	/cojrDk+OjX0rsd2JtAOXRB53EHhUWM8j/5j/S+0q8nSa2Wl/
X-Received: by 2002:a05:7022:e804:b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b3c03527f7mr4578437c88.40.1794461699106;
        Wed, 11 Nov 2026 21:34:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:58 -0800 (PST)
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
Subject: [PATCH v29 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 14:34:31 +0900
Message-ID: <20261112053446.73504-3-mynameisjune111@gmail.com>
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
