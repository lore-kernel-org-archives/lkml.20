Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201397;
	b=tgIDA3gQP/naz0Di03i/lVFuQSj092F8mNDDqSB0p72GDj/cn5W3Uccl1wcNxEfwiA/g
	 uPBQfU0V/n4BWzllzbZHNcs9wCSIHieNzg0nsH+hkhoH3RtcDxavg53zlq5M4BvV3MbfO
	 ynd4WifwHRyFikfSJayx0GwH+xJATLkq6Ca1T0aSs75Ncy6x3E6OhG1FSG0+wvLiyr6uK
	 XysEsU+p7B780OYV2xvnYlA07R1H+RVxyC3WMtYH8WWoFSjKee3GQDS+e7tBxraQgr5K9
	 Ofvo3ytG1bcn9yEH8E6KPO6RNWSYk71OJ49asi1ud5glX0W/qmiZ/y24dYdvOraJ0xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
	b=TJSt4aDpQTJdTCogdDGZtSfuztO6TuFjFbLOPD8BRtri9DnVbG/6m6YqC9/sBByb5BMx
	 XkgxM+GAHKHlectI82qG90wqCK5hIysJR1HK2Nvh6HGohu1021XYrtTY0gb3mdkZhObif
	 EVllzO2MSEapuksmEsRbVFUb43UXC59Fnha5Oeqk5Hp1BbJlAtc641aNjMFdQarVSgqFH
	 HOU2GCbp4ZAiwcNsdH/pv+5UBVoChkiysMuPtbk5ZLuzKmvT27Pw82O0mq5hBJCn+ao4k
	 34LajSav3uwDRf6pV99FGKvm6z4fLtRZ9heKel/uNeE8CJ3aHKSiMSPDyrW5EaD0GwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I+4VSi/D";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2A7606D80A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2A7606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+4VSi/D
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a2761c69fbso1228786c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 21:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201397; x=1794806197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
        b=I+4VSi/Dc1F1LaHviZKB4IJ6G481y/JkZ0Poohc6Us9ClxvxUAsLAnOW84So4xfS4L
         W7d/JdM8w3j6wpcjkQcg/51Ym2yx0zHeZBzt51OtCWAq9Zd5fs2m5hnBYZfeAfeBiMmv
         fI0qOoE0C09o0duEpkK2GGyfXflp1YfOFsh74Vlar8o+m1hqQ3ISMxJ9g4b5t4c0wjTo
         uLxGWf2o3znChyGSdL6TBmRV21eDCkXcCSwI3A5dOQqh3bYx5uhPbbg+r6Q48QXT+rpn
         SN/N37247MlEsMWG1vk/yHV3ScVdzycaQl7m1mdL5I+RniFIpxj0Sm1CrS4vudHygm02
         KtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201397; x=1794806197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
        b=m1hj/vXL34Qgm4qNcTwlggKL8Y9jM0xXbZWqn74BR3qYH0maCkAT/+u2hGOp35IFuZ
         CVcr8E74B7RIpHdLwp8OPc+zG7oNyMYt9OsAJLF4BEusUl52EQcorSJ9ZEd9k/CQZXuw
         wroiwJyJmhCc8prduHTxXPoz0w5wC1qQzJ0381MSDFop2lrKLEicUSZND4WUbS5wE3yE
         PK3hl+8MFGINqZICChK/nKg0yPwHS2MpcXjlSn/8xfuLung5/OOUjDhjlQJNNOsOZ0Qp
         qhVda42oHwGKkSwDZettARrdtRl7nXdXgjNNmCG6ZCZUlWUlg71t4e5oBdoQemQsICIx
         JLKg==
X-Forwarded-Encrypted: i=1; AL+hErGaJ/iSykjOR17T3DDL0ulJLx0CBAEiVadgCL1zr4/ARWP/r4vH4+2uC4sfqkengv5H9OyVecPejnXZQNw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CDJP0Aosfl66PUg/DYofW35ZArIXOAtHLXtEljjtsn4q/C4w0
	xv7yfLMRahgod9EplHiftRTqYWzbWiKuopudmElFE0PPCZkHS2Oxh41q
X-Gm-Gg: AYBFou2hRuawVM9dXm5sIPXprBrorLVqXOdjzm6sJws0/ArKb1MdVNFX1e/FMdqhuHZ
	6HpVLxtkXBL7PZTwyeXBX9Ipd12e3EPKBUuA6S+7m5uTkUtqMbZmcRw7r22o/N0+9+fGduuHc7I
	ONRjcx1xMrDE3M++gBp5SmlAYumvfUGOFANQHEk/bqQIye1pynsu2g50tIY/CVZcyHmmLp7I3fA
	mwjxYxlPsgRPDt9eIZ49Nytd+I9g/kuWuc2f1tB7UaROxwKY5hP7q2o/wzRVG6nolRwucGq4KS6
	Mp91RJeMP+3hTbpusBslrmdxhoQlN31VZMi1pqZhFsp4+NYs9UUgT95leHQkUUZbJGfJpV2obAk
	tz5VJ7FRVdelFzFnsRhZPCwQWXIwPQrBGkMvexETvGF2y3yZsZnE0n/27K4OVhATqDShAOYPMjM
	sWvQjseZkJON/3mRQY7WRCcFtOGdBk/pnvKbHv3ebdexJSB0Gjs9wQ8xIrCyNe+llQ0xOzEdW6T
	4+9MMlFOaxG81Zng33wkTKGYAnDq8EGai86qz8G7LTLTCOcfBJ9TYuIjm7iytrWBqMGofwK0ate
	k5R5Fj7tFBupBE56qkT37qzRlOsLkKdEthje9afF1MFTIjHSKbGfXJEkBaamNLkYdkQrnuN7oJ5
	iFkIs69SooUUWDhEkNOmQBWbxYbGUcRIfrBAC447CjIERgFI=
X-Received: by 2002:a05:701b:2504:b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b39febe7c0mr4786250c88.31.1794201396615;
        Sun, 08 Nov 2026 21:16:36 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:36 -0800 (PST)
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
Subject: [PATCH v22 04/13] ALSA: pcm: notify drivers after linked prepare completes
Date: Mon,  9 Nov 2026 14:16:09 +0900
Message-ID: <20261109051618.22506-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

A linked prepare action can run the driver callback and pointer reset
for one stream before the other members finish. A driver that closes ACK
admission during prepare must not reopen it from that per-stream reset
callback.

Add an optional prepare completion callback after all linked prepare
actions and post actions finish. On an action failure, notify each
member whose action ran, including the failing member, after moving
opted-in members back to SETUP. Pre-action failures and standalone RESET
do not call this hook. The callback runs under the PCM stream lock and
must not sleep.

Drivers without the callback keep the existing prepare failure behavior.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   10 ++++++++++
 sound/core/pcm_native.c |   46 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,16 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional prepare completion notification. Called with the PCM stream
+	 * lock held after prepare and optional reset succeed for every linked
+	 * member. On failure, called for members whose prepare action ran,
+	 * including the failing member; the core first changes their state to
+	 * SETUP. Members not reached and pre-action failures receive no callback.
+	 * Standalone RESET does not call this callback. It must not sleep.
+	 */
+	void (*prepare_complete)(struct snd_pcm_substream *substream,
+				 bool success);
 	/*
 	 * Optional RESET operation, also used after a successful prepare.
 	 * Called with this substream's PCM lock held; atomic streams must not
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1310,6 +1310,8 @@
 			    snd_pcm_state_t state);
 	void (*post_action)(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state);
+	void (*complete_action)(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state, bool success);
 };
 
 /*
@@ -1350,12 +1352,23 @@
 					ops->undo_action(s1, state);
 				}
 			}
+			if (ops->complete_action) {
+				snd_pcm_group_for_each_entry(s1, substream) {
+					ops->complete_action(s1, state, false);
+					if (s1 == s)
+						break;
+				}
+			}
 			s = NULL; /* unlock all */
 			goto _unlock;
 		}
 	}
 	snd_pcm_group_for_each_entry(s, substream) {
 		ops->post_action(s, state);
+	}
+	if (ops->complete_action) {
+		snd_pcm_group_for_each_entry(s, substream)
+			ops->complete_action(s, state, true);
 	}
  _unlock:
 	/* unlock streams */
@@ -1387,10 +1400,16 @@
 	if (res < 0)
 		return res;
 	res = ops->do_action(substream, state);
-	if (res == 0)
+	if (res == 0) {
 		ops->post_action(substream, state);
-	else if (ops->undo_action)
-		ops->undo_action(substream, state);
+		if (ops->complete_action)
+			ops->complete_action(substream, state, true);
+	} else {
+		if (ops->undo_action)
+			ops->undo_action(substream, state);
+		if (ops->complete_action)
+			ops->complete_action(substream, state, false);
+	}
 	return res;
 }
 
@@ -2099,10 +2118,29 @@
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }
 
+static void snd_pcm_complete_prepare(struct snd_pcm_substream *substream,
+				     snd_pcm_state_t state, bool success)
+{
+	if (!substream->ops->prepare_complete)
+		return;
+
+	guard(pcm_stream_lock_irq)(substream);
+	if (!success && substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED) {
+		if (substream->runtime->state != SNDRV_PCM_STATE_SETUP) {
+			__snd_pcm_set_state(substream->runtime, SNDRV_PCM_STATE_SETUP);
+			snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTOP);
+		}
+		wake_up(&substream->runtime->sleep);
+		wake_up(&substream->runtime->tsleep);
+	}
+	substream->ops->prepare_complete(substream, success);
+}
+
 static const struct action_ops snd_pcm_action_prepare = {
 	.pre_action = snd_pcm_pre_prepare,
 	.do_action = snd_pcm_do_prepare,
-	.post_action = snd_pcm_post_prepare
+	.post_action = snd_pcm_post_prepare,
+	.complete_action = snd_pcm_complete_prepare
 };
 
 /**
