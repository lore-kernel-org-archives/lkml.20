Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845916;
	b=GznPwc01I06LU6LfAMqU03E/3Ch1+se80foncmkCe28Ykl+qkfcV88qRrZUcFX3oUvf6
	 rxcHuVBbBmS5bFA3cIBxXPvptL2I5L94vN9yM6VrgT64kxDQLV1gVrIUFLeYMO+iqhQeL
	 YM1TI3VctrSDSpF7BE7b0z0DanprRs919xg5xH3IiQoZZ7By78p509Tzecs9LRjRNDjNj
	 Go5Wr6IsjqWqDQUCM+FLznnWCmRK5yJtworZFYRwpeEDfo1Rl6zFkF1+733uA7h+iSRTA
	 CQ+hE37P+E5WhSNQ89Nq8Veqntot/MU5uvu2N7tNRYzhLVKJOtZ4huVX39Uzzh8kXQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8Unix0qGxH+DyR8DqZn4KwW8PFLSBTwhIEWxnFX5DnY=;
	b=Kbb2Oj44aOjOSrSiSHpr6gzXdLBU7KIbHZQbIYWkaQD5kOd3FCcj7ypmg0ytNSsfKq+j
	 aYfZKQXjvNvY0bpUPROVs1WLHQWBrIbGw5S29M05gf20Cjjg5z8xiwvASxR6RERogTr5D
	 /Pah+ARzzW3DAqeBblwgtLnIzyrA04Z/67ua7lFoZrpHyh/GvyPA86DBjpu8PxTesbXQl
	 PpKOoJ8fxe3WQ0aiUCPCDps4uKyGiH7wFX++AfjeRSXioDRLpQ28ZlA2aap1CL5pZcyAC
	 yS0vES9eepGW+xVirgo5U2CqJ4XhBdnK9C7Bq6gs/t74vaUUUzYvQxga6vlkL1L11+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R/SGdesM";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A0606D803
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 02:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5A0606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R/SGdesM
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so255979a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 18:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845915; x=1794450715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Unix0qGxH+DyR8DqZn4KwW8PFLSBTwhIEWxnFX5DnY=;
        b=R/SGdesM3DebQzW9+cGzkYGOuzqdbT6BM7x3Dac20tzZzrZosVSoKhj3erZhF+SxuJ
         pPAw3Svh/hLPDP0B51trfTcMtnJN8FI+KD1QWIPVxZfdLP8FKuxqsR7IN3iiKyP1QXs4
         C6OSzfD4L2H/uBLPeyMrZGtqWgl606GnIclDHPQypb97D6rJrRW1dBhaXxx9+4/0ccyC
         2iyZzsle+aPmYov33LhU6nIEUF+jZNO0bisFHmFWM8/1/hN8/cOo4t95a3k+5EA5KJx0
         L0kpu8dab+ssIZujCwF0QKWSay/yIbvpCRzNo/F+mVTpWTTJF1770iw60esrS+JQxRRh
         bNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845915; x=1794450715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Unix0qGxH+DyR8DqZn4KwW8PFLSBTwhIEWxnFX5DnY=;
        b=lxxMVRbOaQEuO5v1PLQqZBiNjFjDQPNAslysWF5jpm4q5lyBz7Mo4Ob5NNXwnfHJSo
         RjIQmaqjVivzX37duq523Sfk/yoqpMXg3CaUI3QRSMexQaqhaxj76R2IyjsyogOT0OBb
         EQUyGE7YNe6YoxZ5OBkmtOKzjoggLqFkDdnWvAgTqooUkrvnWT4avN8My3e/aDyUEsSe
         gqiaghhQeB98ieKmT2ZhRzUmoP+WFiTNxGvCMOOzUNbaeWZ2QOoLnqzSsJWoyOue23xe
         RhIpeaF7mByLjimLEFUE8GsJ1ufeQD/fdf7R4oKyVAYSLozCSeSqweerfo1C2gINsgio
         LNyA==
X-Forwarded-Encrypted: i=1; AKwUvByuY4huKcMxEbTcKiDNNFUQn8/p5ZDUchXUY8sj8xWD5RDhi1V+P9U+Z2NEGkKxYd4bjIuLIFG5O3fNv5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MozBmQkbZh5bILHQjShrRTUKnwJ+Yt68WxHBo5QZCOzIVrSDl
	sWA+b2RlWndE/NpmZhIhpunuy2KCdi+UAE4+n1s+gODiwVKXsVk0sgeHKUACrw==
X-Gm-Gg: AYBFou0UZvjF/r742rB77Kkm3EgvOi8n5deU9RA/WQI/RhOtUtCMit9iy29twI1goCq
	RZ50BM5/N4lI+5ui4OE23dO5QKZ/zUrydJHFEUeXodesU8/r37CN60zufhQZeXHBmwJk9BU7XAy
	tzGnbo0FXQT+UUrocQ8fFyrG+5yU7JMd9O8lou/ApPMGNkW76PeNi+/ndRFiSzWMx1wJM4n2aVW
	jUFctosp0dlmkWJQlsXVPwww7C2TXFP+6RwBQ9YMK/6SrQD4KCitdHp22QvrDplyUywmZB/OBJf
	H+kRny0UT0iyROQmzD/KdPbnxhod17AkeenQ63S991qdq+PDpINeI9FGZ1DrMvhYOV4uzW1aE+2
	d7i+HTjnkzvf3GOVBI47yf12HxDbvpQADq2PzO2Qx3AtqlqZkyYvOuArdGegmpdLwNLU5cn2yqV
	3j0sz5rszhaXBE70qvSJaOlrcnPwZK1qevDODLodJtfzRLxrljYyJvFEVqGf1r8mtrmy30OSLUA
	bnlJwnyW1dJjZXyUXCL5Hyabbli1qMJuID/bQ8R+eOIJdek7mG+mwdCJwFTfhu1CfCaBmo0PGB/
	Z3vYpId9lnYCu9U1ib/auISGsKqIQU/ypci6se25R1TWSYv5SNetejly7WRYbqXn9BmMEIBDxHX
	0xNkDoKGSGEE7gLCmy3tCA02hlUxQYOQHCSl0MXOZL075bVM=
X-Received: by 2002:a17:90b:1e47:b0:3b0:a651:a7c3 with SMTP id 98e67ed59e1d1-3b0a651a96emr2175878a91.43.1793845914479;
        Wed, 04 Nov 2026 18:31:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:53 -0800 (PST)
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
Subject: [PATCH v16 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 11:31:30 +0900
Message-ID: <20261105023140.18373-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames
and reported four available frames after delayed partial progress
without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
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
