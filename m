Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458130;
	b=giEoMgb9HaL6Qix3KLRFVNZJOQFNi/qIAfOnoQthVwPDOnNarX+jrzOBx/1qDGjOhOfD
	 //zwc/1XOJ/ax5DcITOmnJp8QNTbdFCWnK4nY8YGH/zaS6Vq1P0Kdrbb5fPR0HCAOCp4u
	 HwgkyQ+mg650SgGnByJq47osqKYjM9GGDSZ+XOh5JOtfhNbWtB4J8BrlO/CyjK7BeXKcV
	 a77yM7Q2di6ee0Tz4ErXp9ZXTUINqPNT3xeqUVO5f8pabaqovR8ZBlhmmVkZ+ItNEEqfV
	 V3B0FWm7J+/CHwixSKyEf4TOykPpQdF5YKREzmbw9acEy63W2B3wGMYh0NqmJykg0Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=LBUxJTkPMPMkLJH3NBzEwE/oOThdk0ILx4qeekKpkxhPhhO51Xk3rgUwf5ijFPbGpLuL
	 mJ9NFqKot7f6eAfVg1P01BYdsBkH1bU0VTHbcoXFhTGUi0HV9IwtMaFUGCWd1/9g77xwC
	 dOUN95P55+a9uXlEqxcaGs5LLj1Kfiu7WvDyWCn/NeqrgCDN1IlSsbRgeOTtlFnL7jRuw
	 QQNDo1XrGYKeMo9QwC5O3W/5nATNKNMVKfPa3wL8Mp+chLor/+5CaP1Qdu0s2bEDBNyiV
	 KIblUkqy7+M+/lQeZJ5DUoy901MIeDRy21LQ2W2Nmuo6sAvXlUn7bKi4urayqtwUV9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4699D606A895
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4699D606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1869649a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458129; x=1795062929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=EcCF1K6Izk8f6rPi48OSrMcAcUtq69C6Kzv2CQNZ0IJYlg38DiZa47nP0T1LJxkJYp
         w6H+q9e1kU6u8fvgkHXD1PeSdHxEeB9VeqGe4q/7K5h84CN6WMOWTbPA2pxzZ4qdFeOB
         1UTYRyljJo1tyvkQ3Aw36IFYDGh1wsJV2q8UkVu9hVNzK8rBVEz1MSfEd1CvjuE7VR03
         SVdoXwL1ddr1UcCyBKXwgdGU5jlRyRTLJNrjwVO8548KI+HOfQnihLNFhn5bxyp6ui7X
         Es/IAJzxY28bDRomKXa5K9mWAXNkxtLNfwFqK2RLdzD22clRJTjLbUmymvvwHxczaWYb
         Ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458129; x=1795062929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=VqvBH0HnGKbfAgOfvs4xgHCLNgh6LsKYuIRDri9u3rdtbBCll8pNGViFgkdj/48ylv
         cUE1vYTm/RFkZMziuWnV4DR+wD5FxUstcmRJs0i5yq21KnZFqs+hHmgmlAi0hRMCfqSI
         UQif0NLLbyoO6VQqIMw3YoVHlSo/t8BJUNehnf2dKUN5YQ5JhqS5YFTZGiTMk3FWz/O/
         Y/HFg0OB9eYWMM3c6Nypxg9pmVa5eLy86J7eq/3o1JVSRDPKRPnXrpeEHkOubIxAi3gZ
         7GSvrzaOSyUWXvzixvgT6JUBEDsQ+xBC1diXljmal/313GoJUJrZDbV0M7JK3mj+deIZ
         X4TQ==
X-Forwarded-Encrypted: i=1; AL+hErEkMtQOIZIYVOttpXrU6rw2egSPiiTnN+JG5ErYCan6z3rsQQphGIxgCe1wjnJEEO0ne5YvUvp9PL304mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2AG3JxnX4A8LCYxsP8ZFVL0niyFJfyHVlYwQXf7R+0GvZiIda
	DMvojKst86f9YYDKoqn+TLplTWRXEU8UKAxVTgNPlYlL+rgfQJHw8DQC
X-Gm-Gg: AYBFou3G2Lw8P4w3czXNLD8qJdlhbZbhEcca1UrqhxdFhvZJGexFiJ0dfWF5jNTN7H2
	+NzK3Hmz+/VxYKKnA/sCBwyzbOlk7/7+q/RaWj0mWSl/H0r1FZEA3/cWkAvossY/yoeoA+JIINu
	Lk1Aqbk7FM5w/9eNHl4T/BdpVGfcfECdt1/an9tlfTUqK+D70Ypj/Wvdmz9aJKzg4p4mzZWdTgE
	PCnZ/Au7WGqcV19mEx2idqOUbNthNHVKVbiC09epyMTGYJZKVGHA1MAuZ4oZOtX7lHm8MyHXqtp
	F6xIIvjBMLyKG6rmG0I/wI8DgkamL+ES1zFO/buMNdrTsVR+ejtKjF8HFhXAnu4SCQuGqVnttyU
	EoBJJ1j776rP4lv7hkNOQTGB4QhgatGUi+YM4PbbSU5otVmeGg7vXRe93OJ5EyqI7XbsXYy8sDC
	TgUe6aYu32FLU0l9gYKUZheCW49yE59XFnN0dFK91bDrmqLrOS7moqJhuc8Oe9QLPPpx2tg5F1b
	WMdq4sTAYADaZl+9hhAaeWAK/N1kIzRQXQlO9DBLqT6by2RKchoil97jqh1rDZLmRlzDMSP/5sp
	j4wrYlq2/Riqf9iFh7wemVJgUyMgfVkI51VGIvTJGNyP/0ASnvhVOHBi2aQJyrQgRtNr6yUWJnG
	ByLHhrXh+H7hqh8HwNqGZP7dFhddR/2pTlPkjf2AU9og1plmR
X-Received: by 2002:a17:90b:3901:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b182f6384bmr3693962a91.46.1794458128581;
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
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
Subject: [PATCH v28 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 13:35:01 +0900
Message-ID: <20261112043516.37010-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
