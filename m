Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809160;
	b=43dAlrFA04k1vkgI7fEdqeV6rArrhqZ5mwTvXSV6mc/8f7Ginbk6aaNyhn1cUrcAXdTV
	 ozXXcEiCyfX54UPs/jC+5yHnYM3lEifxiSudyp0JMMmKc44EwHTfgutuduK5QHBjIWHMB
	 +nxyLcbBTZ7qbbAVLZ44rYEJFaTrGp8Q2tSzrp7fiO7Fi6RR0L//PYT/v3Ay9S7IZRsN6
	 BLqNjxbQdcMfr82FPoWbj8Qq506MtLGfoTZjqPTCAQA5bTyWnJYh63Ip0DZz0snbjB+su
	 SZ8Yuq66Ihjyv0QPgQaJcRmgZXIy8q1uCu0miJvyMEsd2eBLqIRpTjUtBGfD/CBDLJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=fK/iJp3xT8KlZMS6jdwZabvE3yVfWgFdy4N4fTcwFXyYfF1pSdiUM2H1FobzCgSiM651
	 Nu1dl4X3eRxeiPfGS/tjkCrB0zCX7FlI9szfAv1l8K0sD6fn0qEapdy+MZPWINu0xpkb4
	 mWPVDcABCcDoZnzoGLuQ3Gr0K4RbChziovrljTBhzLGTt9Pnnp8NnRd+CzzW5khOuJTJH
	 eLMJDR1uFVqpd5LAIXoGJitGx6LIm12G/OOrfYSO/vEIooaPvRG8kVq6Prt6PFUmFRlRO
	 lTEMC2hrYVLWgrk7HH5LgRLetuzbmnp+JkzqDzVswUGWDdb6sotwMhQlU1oaiJBspUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOBAKPOU;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FAB606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26FAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOBAKPOU
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36681e85e87so3598934eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 19:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809159; x=1793413959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=MOBAKPOUyFR9UAchQLxxQI1Ry6/anuEBXVHh9DuCL8eUF7ElBaWpJUfam/l0zBXa/O
         W7rkNwdpm8p/yxMIMGdhtadJDRQ+hktGwYvF5THaPsxgtQhVmXX4UCDaIGOo/X9LoV3f
         HFfPLmbbB5k69gO2TP3WryxfgWw8GdyUgDbLSDZByo4tvNUwGOG0MgV+VYxx+aSutPNY
         f3ekxpVsOodAhyrUD3qT3NvIzW86+8i33+oFqbKzprks1i6tW6B6blmVHmuUTeNh8sWX
         LtC/KNNJ6XkHQ7yH1aKnVqfz2DnA6OxXUH/jRsMlI5++S1iyQM1qV9zZ5s2CgMkHIbev
         /cXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809159; x=1793413959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=nYioRCdOElZh/t6fKW+FhVnBm9dM1L6lMBMG7NeY7a7SyDo1yNOznQpzqaKULZtAE7
         NxpeUGQbkFx70xu4ZOmgB/dbDqL3QO/hqcY+56SMuH5kRzdaQAoYg0WNszO+mtmsA02a
         Nr2+75hknkVATJT8dGkfzu4OEnxBkEnZa3HnZHA4qhyZktJ3YUbkqhapCJiDM9BNOOmC
         vwUe/FpsCPo2ajp2puhPF6J0aHrgBHzoAk6cWXBhcjzmVtrSDALE4B6Ue5ofodAnzgDF
         w8+8rnMdLiBGN0NJCX70DmZlQjTW4IL19OkSJ+4ykXh5T8hfKFLk/GQ5yYdTT87fWGfp
         E+ZA==
X-Forwarded-Encrypted: i=1; AKwUvBzR1SIlTagnMgP61ZfGBQPLUgZFa/M/CbwkwzzY1nC21bN3q0309GJ2pnjNbr+mndhrYvBSny7k8z/Syl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9mWmJ91OwbAZVU1dzB9b0zeklV2BzJwteyi7xoTqfe3x/1Fdk
	aTtqFIhXmi6dxL1KSdYkfP+QJkxAj1io1FkXKozRzynhHEdRXe0VUvAh
X-Gm-Gg: AYBFou1I8qvOtY5yrWsqUAFRbiLpWT53GWZ64lU3uyYs54P3Jdue+AKd5jYVWBDJFBC
	u8vOpyBpdPsVUXiOcGOySOU/1sjAPBsRw07goJGVNmrj3ih4bpP0QCRzzvI8Zxou1c8pr60tzUf
	P+0eAilDwmpN977+Gk+3g6ejaLqTZdXNoiGZUPo0VYEHwiOe80jLlVfuGLnGIEqUPJwK2Ol7Tvl
	Y72EMW/Tewr499t+epNgM7ecQTkwl6QJRK/9MMpbGsZ+Mu2ng6QlmDDJt/KibgDz5IkmD0a6VQJ
	zXOliopBfJxcjlK/pmIu6v7ZwSm/ub9oJM3F+nfbyKDfQOrQ3FZxd018nfMfAVyLY/4PxN3i0Ik
	FDvXVhlga7fBS5Yiovl/j9bFQ2q1QAZ52cBeab48A8EGkCMwxsZQfBHNHe4/W9GrEt/CE35Q+sO
	MAHrEaBFyfLyfM6MP/F3csvDBzRTneJ/9FSwsH+WXytbejm8m2HnMCLfBU5OT/GKIi3i+Ut22nr
	1vV7SfhEE2w105RaPEzQDZ4ktY+wFTgjiKS+MuUUGHSLX06Wbwapo/H5mqzWwmZ++iQR4Ug7YeB
	YKqiH/sz9zCVAuVeT+epofPfg1IEEToU4EigoNg4AFZreBE7e6U2ESvigCCGQ5ccpF1RVchG
X-Received: by 2002:a05:7300:f0ce:b0:366:846a:e21d with SMTP id 5a478bee46e88-369e84d35c0mr1484016eec.33.1792809159135;
        Fri, 23 Oct 2026 19:32:39 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm3958542eec.23.2026.10.23.19.32.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 19:32:38 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH 1/2] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Sat, 24 Oct 2026 11:32:31 +0900
Message-ID: <20261024023232.84448-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024023232.84448-1-mynameisjune111@gmail.com>
References: <20261024023232.84448-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
