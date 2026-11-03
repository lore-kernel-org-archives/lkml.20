Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693332;
	b=ARA46Dmgl1AY7b1aNSXDPmsgINwczDzaKoP/b4/NSfZz4EYFw2N1kWBPbzeyCez0WJRf
	 S+3EOd/Aqc9pRpD9S6A0w2wdNzOd+Dkhq1oRyz2uIIkq4XiTeepZVUsl9J2NJ5hQRhIHG
	 NLMLNI7wiavcQr6e9huDhtZryP8iXMSGezhmuQZ78mmwkh5vsCuwZMU90JE0rs4DMMQa2
	 +fvZr9cWFdzsY3iSjK5Hztf0P4alrraZuZG2zcAjH5hycM4gSIpgESQaF2HcBa5eZMA5I
	 KfozqJwpKLy8ILLCzytUM1FXFKG6g9lnIngSc04z30wUezeZbnx73e6YdUn2ZeVQLJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
	b=eq4JD+mkLsrQInJJb0uJwYgOq/xI/sAl3sb1tvbr5GlommhsBZkGsAZKGVGBRT52lrd2
	 iyuXSXPaB9RuBadSoHxtdFmkcFDAWVQlgclGQoVR67o5HawI5wPmh20bqqxR+K2VtIKzo
	 6tH3jO9Sd54LOe3r1zzkpj7+RRcpUf9TbEDJsAkG58qY88HqfWchgBCZ6zk5ZD5jlvhBO
	 WKF7geMtrivrW8lYzpt7jBLnDnY/ZHRZTR9Udt1egAUq54om+3Z2TrP26A4N2SsMIjyn5
	 68RQVsGDbzJ179JtPAdLchyzPHfiymt7tU0Q+G5LK3r62En1tx4XRUWWPmILah1g/nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8BD606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC8BD606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso5377925eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693331; x=1794298131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=fEZPp85kJlvBbh0IJ2NzN+HSKzk2HejEAGocdGhx/Od5ZxC8dP0Dvp5hXSD4y6R6ku
         Hi/DQPgs/7xYUIaXnJ/e5yUoDSnFou+M1zWVqGdLxCVdCwQuUa6QjcZtW18zjpynz4rU
         Fv3/+3s4BYDx0bzbGROcu5syr00OBdnrX7Bjy6YbCRx7RxlkTkwwOm9pRO2r/aDPtB7y
         5+vGUWRF8DKKj+4TbY+c5BexZNKNY2w+j2qkQKF8Iw0vgWWC1UMeSgilJN0DH5RQRdIz
         l/sRsRUKElhxyAx3P49AIvN8/MRhmCsshNL++5p1h6drg851LOgerUalNLnyEfRUIfVI
         SB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693331; x=1794298131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=FhDjxIwnGpsLLUk2vmkJltmDCnBqren7sO3hfGrnoBI2W0hTcd/KQ8KpKmWUCuXrey
         bDDf+YlaiYk+LofyYl8x+PBYAcKkk3w/FAhDXqfrYpX/UB+etcwqco5RX2JemH5AJovn
         2KRPlTu766+29J/ZoWDiWNGSb7uhUhw0nIm/4I40MJ9kIU7sze2x5s43Og7WgUVI3N1R
         /I4/3dKC2TBorUYpKd6BdfmfS3ZCmIBwBuqM66Nk3p54+3/SBtV2qcGtb+kKg7AbxBGV
         WHu6kaoSzbSWOaS8JpNRBB6eSvjfCgI4CjSU9l3sBc4sI4+fWNcIaCJjV9tYeWXH3P/V
         AIcA==
X-Forwarded-Encrypted: i=1; AKwUvBxV8/O8S3q25YIL0yOltCeUpR6jijC8PTknVpkq9Sjc8ROZ2aqwSg3tNB3JXaZrHhaiy/VHXl2nrb/QdLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ELj34j2rO14vqzXEcHUcyPYbI8eSO8yAd8LrgbbChFL/2yJeY
	Q0/lVWqqt+Zn+xYYL8VEQIw2jYawkWBEAQDPvxZIaSEHWZKglAclAelD
X-Gm-Gg: AYBFou1wUzVx2Quu69eOMNUSof349NZ/mg+zG9vnG4vKW4t04r49KIUrc6R4ADdxWVD
	UlhuIwHngTdfJRYczFm7+RSdsI16amPAasEQ2K6nju4Q5wQ2tBH65QhGAUU+PJ+opmVsquS/pQG
	1CqqWgrOfoibTjGKTIn7y+fr3z38w3PrgGJrdQ/YGOPsb0/HfbT72t33dQOjQBLeDweU1roYTDB
	An8ILaHcn5uYyAdnxAf+4t0iKzu0FwpF8BgG6L7APRlMD2ZK808z7a0EM4RrnacVTa9jU2z0wTE
	qA0tAT1vQAVWUnDarsR7gi9AiplvutHm2x1ijYkHmuON1uBD5KKuBJhQeKtNn/JLeVunR9MGW/R
	e+t9CxLTl3Zyng3bnKeS2/E7bSSCt9cLfLrm5K1O/YgzOs0pt8q2UdHEbtsB3yO6vloSNwVGkx4
	Sr7y96DxWlI/KoSDgGLAHtK5R3hkzlGHR2efETns7WEpCx9zGBbx2drrvFYT3j36uw7KD/SPubY
	SviuWhyNIeqqS5T/YbjdoaI6KyAdpoC+VRG2PeW+A+EMf51nyEM4E/ifHvB9opsSXfbcdZFybFr
	khKESOWuYTZyphqEVlfDo3737llLpUxvMxHUlca56WRHxQFchIWZBkkB45fy7F35itRNArEFshX
	dK68ZmIaqjcyP68B5+qsqf0mIn6242InzgYhMz/11YpNd2bZXTWGlv1RNrh0Y5bpDstY5
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr17468985eec.39.1793693330692;
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v13 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 17:08:16 +0900
Message-ID: <20261103080821.16983-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in patch 9.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

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
