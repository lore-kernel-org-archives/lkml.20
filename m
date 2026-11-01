Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553718;
	b=dU1P79lZ1iWDPtwVwLucC75Kt1U8WCtvf1nh+gyVTa7Wgm6rxwIMDw3ZH2TwkzAcaf7p
	 XUyKmzghKSfT5yvacowX2b9hNB3q0pZflFrwHv1XxE3cq5fXqmAhT7ylmqQ3mklVm6eSD
	 D4J0BrgjcIPGRCf0iMotcoQCx8FHRXbeGMVHS/RVuLvT8+3fVVGRDTRVTQ0jAmgog0cPF
	 jSacHaLTGewtzKw/oF87Fqjp6ryt1hcdIL37DhNlb1QvNdGc5h+oj4R5p/NRuywLPvlsB
	 tMlt9/BwX4yKzkWKtJJR3WEMiGkUU73Rh5If7tJSj86+Xv1sBq1c2k8ungS7QoNcDxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
	b=NXx7XWU+Crm6L3Pvs0Fc5zM283VKe94GaCTdW6xtKMYAZJLpbTr0l88wjh3dqVeq9i1L
	 /r4MNlaVIBWpz524MWYgs25mjHNlXfJjl0PmCEBDjDg/GlQGfPF8+AJzTsOHVHwE9oq2q
	 1yGALFahoyCmglXaCQsNQ83q6Wku6HPXOI92gynyLHevZf+IRf1Hd6PjLeOV8JnC3l+Ml
	 3RvkDi9/+4HjriA95gAi+BFBXEQNrE67rzueLNsdvd+IEg2YCfsn9C7J0B3NAKCtFiYex
	 96K3ObKVLskR0L0BDhob6hU/q0iOthCOksIZemHz9HqYh3isxgY0BfFB9fzmcDoFOOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dB9F4pMd;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38DF606A32C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dB9F4pMd
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0cf2c0785so17431587b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553716; x=1794158516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
        b=dB9F4pMd6Au4NpDgXLrOdMXuhYHWIgmuywaKglaRDzikSOqUGu/fOzrphcj8Gy4pSe
         iNlXOINeGQjo3gCyPEN4585GpDYPEAPZL4tTzy3MCKIT0l2EznJzYfjVAUr2HqbOSUdu
         Y54XlN5t8v+UmmOurbsLgaMoi9zfSq9JNyXi04CT/CCljR65OgB0SXONbzGUYI6s1UED
         cK267BK1JtssyyT+ErzXVD1n/2QmMXF/rcKXhG5zJ1WPnr2ajce+3sDLQtK3mNz11Tn+
         D/7G3IaKyYpSbo1iLLRS58x18yWC75kPZV05lWu7567r3vHDlAB1w1+dWiWbBnpRJQEV
         nfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553716; x=1794158516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
        b=L8Wf53aruL8J15IDYyVha20gcvxbJ6ZGRz09pycbrOmcfRnhPHW8NfeQ/L0t6lCsV0
         39rjC0RuzwPHBjhoObyi+IFTWMbnLAS/h9YCw62PoVxSIF2SQc55Q8x4Ct0APfW4yvG2
         i8u5F6s6QI6NSwdSRJ6Tr4TJOQ8xlsLWWzRmrF30BFiV3z7mgLQ84X1xj2Nl1SbS6dbQ
         S55B+33dvJ1RAtrzzMK/eL3/YpDryro87NtMm7e0B1kmL1mIIh35TXA5jGiQXmMF5/05
         WENP3v0WHjz/rsT/rez7L0bfyidn0srHSHBA/M7dWolgZWCGKAaq61DMyVvxIQHmy/ni
         LbRQ==
X-Forwarded-Encrypted: i=1; AKwUvBygNjBwyH2xeqTl7/znCToUt+Sq35M7ai9LgYXG5j0MlJn+vswW0JYUgC3XtEESWTxrR6uBZzY1ow9J+Ew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FKcGSZAZIVAoyJ+4liZBC9IsuFRfAL12EH+IXNNebdkf8RSRR
	5xx72HcPPcarZzGReQL4rYbw7riQskoxCvj6YnpgKkma7zabQVQn/C6/lZTou9rv3g==
X-Gm-Gg: AYBFou0su9H+S+C0Or4kLvdAgSFNVesdxfsHXhNyFaroEV6yPhpWVElcJOX2qpcOYeA
	EFk53QW+KgptqT+hHu5jfkAxHUk45nsKpYlQ10MgF9mS0fJPEvDwRvP+F9OpL2VXClOh0suWXih
	K8PqELVDNQb1xIBRpPT3jcamro/a+hbBnING3zZ6fHqu2ZxqSpt9ORdcl0OqxwloiCYyTmPPh6u
	9EOKi/BqeG6KzEdFN3wKmbGuEVykCPCgmqObt6KGvPKU1UZaNNwcg1jfKC0e5DPZy3G1vOYstUe
	wSzRjMpQbO21KQ664VsNOr2R08MnfEuM29v45RLwFxsac6HpSlmw8sr6de0a7hrd9RqUVRNrygH
	BswUpRjuuw7iwQi7KHGVAx9DS+RFG4WV3qJxuX8Yj1h2IXzJgmJO2+4+ZIsHEiZhd3hkCJE5wVQ
	YQYM2xYGYgQfe4KzUaPKIW7jY+vMj+GMZnuEj+2sjhnw8wudkix9g8DPBAXhq5s/nEpGyOTGccE
	18qHOCqu152AIQeJZfmobPTnS8+2O1vNhmAekqLkOIp+oBBrU3mKBrgEejG/u12fc6V0yc=
X-Received: by 2002:a05:690c:8007:10b0:8b0:8e22:d937 with SMTP id 00721157ae682-8b2b66c7923mr29268157b3.33.1793553716082;
        Sun, 01 Nov 2026 09:21:56 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:55 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 5/5] ALSA: ali5451: Make snd_ali_reset_5451() return void
Date: Mon,  2 Nov 2026 02:21:34 +0900
Message-Id: <20261101172134.3451066-6-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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

snd_ali_reset_5451() always returns 0, as a reset timeout is treated as
non-fatal, so the error check in snd_ali_chip_init() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/pci/ali5451/ali5451.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 8295eee9b977f..b86b921296427 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -414,7 +414,7 @@ static unsigned short snd_ali_codec_read(struct snd_ac97 *ac97,
  *	AC97 Reset
  */
 
-static int snd_ali_reset_5451(struct snd_ali *codec)
+static void snd_ali_reset_5451(struct snd_ali *codec)
 {
 	struct pci_dev *pci_dev;
 	unsigned short wCount, wReg;
@@ -442,13 +442,12 @@ static int snd_ali_reset_5451(struct snd_ali *codec)
 	while(wCount--) {
 		wReg = snd_ali_codec_peek(codec, 0, AC97_POWERDOWN);
 		if ((wReg & 0x000f) == 0x000f)
-			return 0;
+			return;
 		mdelay(5);
 	}
 
 	/* non-fatal if you have a non PM capable codec */
 	/* dev_warn(codec->card->dev, "ali5451: reset time out\n"); */
-	return 0;
 }
 
 /*
@@ -1901,10 +1900,7 @@ static int snd_ali_chip_init(struct snd_ali *codec)
 
 	dev_dbg(codec->card->dev, "chip initializing ...\n");
 
-	if (snd_ali_reset_5451(codec)) {
-		dev_err(codec->card->dev, "ali_chip_init: reset 5451 error.\n");
-		return -1;
-	}
+	snd_ali_reset_5451(codec);
 
 	if (codec->revision == ALI_5451_V02) {
         	pci_dev = codec->pci_m1533;
-- 
2.34.1

