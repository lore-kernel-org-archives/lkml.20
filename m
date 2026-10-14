Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E465540AD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991488; cv=none; b=p0urgaup5tOeHuYXc7yZH8vdb4SyRHZ2dxXRRtm/6N2EnXHaVa8H3WF/WyQUwwlisep4Qf3JnCoyK6EPihJn7bM7fZwkXrbWyB3ICpXYW2zOqPnlg3TYXbnVcKuw+IKAMKd20l0I41aEfN34l6zOQ2Hwc0HL+SKVVlYYoBx063I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991488; c=relaxed/simple;
	bh=BBI0XcpPkSK55EQflgt1Amfesy8fbmHDO9s7ArZKsO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqW5qZGFnU4Ct1uVGLLG6w6NPNRF0Ja+m0AVjOKpVguUgLalY2+zMsB1nB3OKUZP0aFAd4BrRTzXM8pphUshpwJY710HFSoYoPrr203/FOBSdnFSH2Z0dn/jjTegTRC+xVcLMyYwLR8LoazK010J2jdY4JXoBp2zxgWgMT1qXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2EUGsof; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2EUGsof"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so1752331a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791991485; x=1792596285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmGqVNpq2PdWl+heL73MWMPJF6Ks87RHIfNcYC7eCSU=;
        b=V2EUGsofJlOKUuCaBTZZVQ6pMFFXY+ESh0ItzMX4oDsSGwamS9yKKTcv5/02/aNNYL
         kBTj7lWLr76YsPE209DQ63AhJYTWvyCSA3YJ3vWLlySoXqUgK5jRH8qMxIZRDgxopPSe
         jMh9KIcf7801SMuqEmzox6fjxuGGQSTENm3FsyzOwTFqbJsYgF5DDqMJTnvsRBcTOxqp
         VRCeMEHLed3koNrnt0Dk9XS8186rZY1wXHYi9Y3DNtK/AIX8Jt2ACCM3VPLImf/sDiWj
         2gl9TsG0ulZIkRv38UycVF1YzwrjV9iJB5ds+32jovYaih8c6Q3kqMjYJp6a3BQd7Etw
         2OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991485; x=1792596285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmGqVNpq2PdWl+heL73MWMPJF6Ks87RHIfNcYC7eCSU=;
        b=vlaNWnhmzElyNOIrtVMBocaRCN+R0wupjQiiRskt9/dfp6XTPIG7Xktt/DYooXJf3I
         44pEIzZnDWUJudxGzLQGQXv888RrSPgRAhEcZHyg8KcQ4ue1t4i3xyHr9gZvuUTPvxAH
         8UzfUokWz23BiSAtcNkGTnGQceJVMXaA8K5rAcqjVLAIO2uGKR6CbIZh+1iDqdK7gGkd
         hj/6m0a14itNcYudQYtOJ9XgKMMV4LkJbZSvebfQbHNKGIvJyTeu3G1ZFq/8anUvyWAr
         0a2REKcRRQbLopX8hKvk7/A3ueyS+4tXHkMDn4U5TL7auw15oKtCd2Kj00eNCn6A94Ks
         eVXw==
X-Forwarded-Encrypted: i=1; AKwUvBygNEEguwrjtJ4SMb8nod3KaLsxdZ0MJDWcO2oTdEf15GuLsCRVgwkxStpPmAQ+odXPbuMuvpYtCqg3TTo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXNVNFH0Ld1YK4Z/iXCjAdzvmrjWOT4ZttPMbx1+A/3hi3P6fa
	2bOIrUWSt96Q/DGntsU0/utqDDHBlyQW/R7hN0U9YHiYRpHr9z+ngPfI
X-Gm-Gg: AYBFou25KVIPYj6qPXatuRdaTKXxo3qNNkanzFmMMZjsSLdFVtgU3jjoa+raQo57XVw
	k4cnWYRAkDBVL7EZuFJFRA7J+GPqTfqL8eUriHVF6Mtvm/5fXGdIbNtbZlXz7BsWm5oQ523NIK6
	H+e1xojPyfhDgv2jE+MozsXPQ7kjQx9GwRXz97rf4GGmt4HcJ1D+QcR8k9+88D2XOA5uMGKNBRD
	CIgT0DgnwXPx2tBET6mOqWPIQqoVmn9WZl5D1+w6yTTxEI/c8A0XWlrXMKf4b0+gRLN/Jr9/Xcx
	9hs+Yx+L0MjBPAZWsLHgBvzVDsLbYkvmUjgyx9p0BQ6o3sXIttUE+kZ3IWx2WwQX0UV82kwrbMo
	5upIaevbpFzcpVJAlFUH+Hva8OR8zwTlBsw2SwWL96+tu3uEjsHnmp/1IhX2/LzN8UMsFAqJqe9
	LNOKme2vk7uXf/oQnl8kuUwmLlh47QPHDwSXv0YBN29UexzQXepNkZbyFZ3/pDNl8mPMR0He7/L
	yDc1pQqtRrywZe/yCjn21ej+6IeLkgtNS1c2b3Wxw6dqgOFIsAcLXEuOt14uXXhUUEB+LP4tqtF
	PxAw22rEPbFxt5E=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr14082334a91.41.1791991484697;
        Wed, 14 Oct 2026 08:24:44 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f27d573sm5151816a91.11.2026.10.14.08.24.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Oct 2026 08:24:42 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [RFC PATCH v3 2/2] ALSA: pcm: refresh capture pointers in the drain action
Date: Thu, 15 Oct 2026 00:24:39 +0900
Message-ID: <rfc-v3-core-capture-drain-2.cf2e307fcac34b6a@gmail.com>
In-Reply-To: <rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com>
References: <rfc-core-capture-drain-0.112c40f0e9284eaa@gmail.com> <rfc-core-capture-drain-2.112c40f0e9284eaa@gmail.com> <8733u8g0kh.wl-tiwai@suse.de> <87y0c0el29.wl-tiwai@suse.de> <core-drain-linked-lock-reply.cf2e307fcac34b6a@gmail.com> <rfc-v3-core-capture-drain-0.cf2e307fcac34b6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Capture drain decides whether to retain unread data from the cached
hardware pointer. A final subperiod can be omitted if the driver has
advanced without a period notification or another pointer query.

Refresh each running capture pointer in snd_pcm_do_drain_init(), with
the normal drain action holding the stream and linked-group locks.
Allow pointer accounting to return an error without issuing a nested
XRUN or drain-complete action. Guard both the driver XRUN sentinel and
the stop-threshold path; otherwise a linked drain can recursively enter
the group stop action while its member locks are held.

Let drain init own the stop: an update error ends that member in SETUP,
while a successful update retains available capture frames in DRAINING.
Ordinary pointer queries and period notifications retain their existing
XRUN and drain-completion actions.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/all/8733u8g0kh.wl-tiwai@suse.de/
Link: https://lore.kernel.org/all/87y0c0el29.wl-tiwai@suse.de/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/core/pcm_lib.c    | 34 ++++++++++++++++++++++++----------
 sound/core/pcm_local.h  |  2 ++
 sound/core/pcm_native.c | 10 ++++++++--
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index de952f639d3b..2bb24d7dd2a1 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -206,8 +206,9 @@ void __snd_pcm_xrun(struct snd_pcm_substream *substream)
 
 #endif
 
-int snd_pcm_update_state(struct snd_pcm_substream *substream,
-			 struct snd_pcm_runtime *runtime)
+static int do_pcm_update_state(struct snd_pcm_substream *substream,
+			       struct snd_pcm_runtime *runtime,
+			       bool notify)
 {
 	snd_pcm_uframes_t avail;
 
@@ -216,12 +217,14 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
 		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+			if (notify)
+				snd_pcm_drain_done(substream);
 			return -EPIPE;
 		}
 	} else {
 		if (avail >= runtime->stop_threshold) {
-			__snd_pcm_xrun(substream);
+			if (notify)
+				__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	}
@@ -233,6 +236,12 @@ int snd_pcm_update_state(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+int snd_pcm_update_state(struct snd_pcm_substream *substream,
+			 struct snd_pcm_runtime *runtime)
+{
+	return do_pcm_update_state(substream, runtime, true);
+}
+
 static void update_audio_tstamp(struct snd_pcm_substream *substream,
 				struct timespec64 *curr_tstamp,
 				struct timespec64 *audio_tstamp)
@@ -283,8 +292,12 @@ static void update_audio_tstamp(struct snd_pcm_substream *substream,
 	runtime->driver_tstamp = driver_tstamp;
 }
 
-static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
-				  unsigned int in_interrupt)
+/*
+ * Call with the stream lock held.  With notify=false the caller handles
+ * stopping the stream, so pointer errors must not start a nested action.
+ */
+int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
+			   bool in_interrupt, bool notify)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	snd_pcm_uframes_t pos;
@@ -322,7 +335,8 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 	}
 
 	if (pos == SNDRV_PCM_POS_XRUN) {
-		__snd_pcm_xrun(substream);
+		if (notify)
+			__snd_pcm_xrun(substream);
 		return -EPIPE;
 	}
 	if (pos >= runtime->buffer_size) {
@@ -490,13 +504,13 @@ static int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
 
 	update_audio_tstamp(substream, &curr_tstamp, &audio_tstamp);
 
-	return snd_pcm_update_state(substream, runtime);
+	return do_pcm_update_state(substream, runtime, notify);
 }
 
 /* CAUTION: call it with irq disabled */
 int snd_pcm_update_hw_ptr(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_update_hw_ptr0(substream, 0);
+	return snd_pcm_update_hw_ptr0(substream, false, true);
 }
 
 /**
@@ -1906,7 +1920,7 @@ void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substrea
 	runtime = substream->runtime;
 
 	if (!snd_pcm_running(substream) ||
-	    snd_pcm_update_hw_ptr0(substream, 1) < 0)
+	    snd_pcm_update_hw_ptr0(substream, true, true) < 0)
 		goto _end;
 
 #ifdef CONFIG_SND_PCM_TIMER
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index ecb21697ae3a..12bb6e75329a 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -28,6 +28,8 @@ int pcm_lib_apply_appl_ptr(struct snd_pcm_substream *substream,
 int snd_pcm_update_state(struct snd_pcm_substream *substream,
 			 struct snd_pcm_runtime *runtime);
 int snd_pcm_update_hw_ptr(struct snd_pcm_substream *substream);
+int snd_pcm_update_hw_ptr0(struct snd_pcm_substream *substream,
+			   bool in_interrupt, bool notify);
 
 void snd_pcm_playback_silence(struct snd_pcm_substream *substream,
 			      snd_pcm_uframes_t new_hw_ptr);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index defbb2977efe..91ae46de3521 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2094,6 +2094,8 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	int err;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		switch (runtime->state) {
 		case SNDRV_PCM_STATE_PREPARED:
@@ -2119,8 +2121,12 @@ static int snd_pcm_do_drain_init(struct snd_pcm_substream *substream,
 		if (runtime->state == SNDRV_PCM_STATE_RUNNING) {
 			snd_pcm_state_t new_state;
 
-			new_state = snd_pcm_capture_avail(runtime) > 0 ?
-				SNDRV_PCM_STATE_DRAINING : SNDRV_PCM_STATE_SETUP;
+			err = snd_pcm_update_hw_ptr0(substream, false, false);
+			if (err < 0)
+				new_state = SNDRV_PCM_STATE_SETUP;
+			else
+				new_state = snd_pcm_capture_avail(runtime) > 0 ?
+					SNDRV_PCM_STATE_DRAINING : SNDRV_PCM_STATE_SETUP;
 			snd_pcm_do_stop(substream, new_state);
 			snd_pcm_post_stop(substream, new_state);
 		}
-- 
2.54.0 (Apple Git-157)
