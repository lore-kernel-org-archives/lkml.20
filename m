Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875407;
	b=iUxSkZJkpjOAIV/Qw+5zlCf2WnP/LQrgaWjfQYRwTHX1o0hVruRNVexiVNofoDZN4SiL
	 jpuFd1m/Sn7+W3n2pAFHnjbbrmn+15Epewinwz9WwNJdfTQ+HixXKdFvwcW+2DCDLC0mq
	 1rmshz8htbiNZ/ehiFlq4UBCFiAExNVJqrLhtTVTWvKYeL5SQygbuXD4ZqARbFMXDPVcX
	 tCHbzpNVQI7lRHt7qXOOFNj7rqB7ruE25qyyf6XJBqdhG/AgsNt1Buk867z6GZImgaNvb
	 th1XWO09Gv4mlfubIp/xyUjiKOckgu6+seqV54y20+ctMXNcE8o/DR15/Rv/fMn2ubA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
	b=GILj486xj4KXUa+4MihKxV3Aphtt7Tdl6Z+ordKafgtc+QPAZkeWHip6G1zWH8EjSCeO
	 Q2E0K3MhPLPcjlQ3miLNYfNmqF6bPcbWltEr4u3OfNvOrRGAVnKUF9tlvjOEYsmxK7+9U
	 ZrmSUll1OpFtKqCc/z17eH4pxE/zd+nIb1o9BWEzDLUmsNrL5oLIAR8NVcCO60alMsifL
	 nRDKGIaDuQjdGPpZYoG6YNFvX0bWnlfVpp5rsWwapMk2+T1vG68xLqBp8k2B0k89RVp9z
	 B5iHq1UVrP58+AJok0QBjcCB/nOFV9Gv4ILC5Y3TGXvGJW4szjzWRyH8QEKe7K/FbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Iu66ek;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2BB606D816
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF2BB606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+Iu66ek
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so2403148c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793875406; x=1794480206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=C+Iu66ek3VinbT8/MPOhlRsbKMqQ3FAWq/TZ3wYPG/y0/SnDe/RSB7aM20rwagl5Vz
         n4KlcP2tFcJ2RehOI3On/jvgvISbdMDvBM0BFFt3nDa6CAJjIrPfKDtTS65G/ukRLZOd
         N3thR+4g9zWBB2Fy8pmQt8nFnb9AQpOfSefVfU4HLhpPQCl198hFdlgDTjGFfj6gRpQb
         3qpinC6FunicPqO+4fgIl2ZthVFxgkd3vM25zj1sgtaJN4FWJJyMXyP4bjA44BM5n+LF
         oDK+DtTiacBEQEvsOlEOK6V2vTX4shCQeCqi6OoidlDQg20yUjYx0M+K1fOMDuT27JnW
         ovPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875406; x=1794480206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggzT8mm/DyquJidfZW7gt7MxdM7xQZcIv/Px9dQuRS4=;
        b=hJnGfd1KZhHRL42pdXn+08b1/y0ypumuxGuLYdI1bBBZutt/DZUJxJbKSn224c7fUl
         sB9LZTllzLUH32c5oMUSM2b/me6L+hrbSMtTWP/d0FnWi40rr5tgiK2TApcZS16tKYDr
         76eo00Z7zQDIFZDFWdn/TdT9z6P7QNof4ExstG1uTpC85fbc1qPUwQH/8KqwIy71zZ4+
         XUnRKeQMj3xgjyWPWksyqo/QSPVvQlk9e2wi6BJypeaJtnTJ//WI5NzN154OeQbik3Bc
         j0absWYYpWun0mVj2jPhM5dJvUkRNzszuMbr0J9w9wuLamS1zK4fx9CAkrYSitzOu1wf
         mZAg==
X-Forwarded-Encrypted: i=1; AKwUvByqXL7oCXBUKHw8hGIWHuZguwqLyqGfw6lpM694BFHWEHH7YIXsiNgu+9kexd3QkMscYpoviKyYVwhD74U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RdMQE3HX8UBtsFR77ahDrDXQiwPqQPeqseesnmP+85p33FAqW
	M+fpscNiMVZ/hJ/am8iMbMP9QvXTKNcRFcHn4lH7V5i3rido79ZOngVX
X-Gm-Gg: AYBFou2g+IFUwcY400l9a3z7h4oYQBHksfo5KBvwgTCYE89Kmqok6nQ91AH5lX0szQU
	nqsULHNgXpvMDnSDngXT1iLhlvHubIlvvl5BSrqFVGTCLDreJJu4Arxf8+EKPbV9mKJFWweekDL
	x7AaRbRbegKnTyA6NHsMAfdDsrMYLY9kYPT0DEY8x7pILu/YE+GIWrCzs/I0BKTVyMbyTtuesc1
	M/T9/YMPAhjkxm9bwbs1DJle8L4/c2ItXcPg3pvaVi/TMU/OBJx6VSVo4/EkjTDbYNvLfEDZXED
	qQWWBT1oVTICdHDGh2kvxxX0rpnE5Ra8z++bTWNstK5mLwh901iFFGvFP6qVF0DetnTQSIODJxM
	2Hxh3Wz9By4DHclEX3MFsk6+tbrvkpMBQYljItMO1ztWpcDLHbCsI9XqM8tpstgSLMVc48I/7IC
	D546kPlAjh7PWepPvg6tiMNW5/XPJGivmAluJUl6BJqGWwutgL1P0tiMKfLcVuKH8vNzhaH0dq6
	oF8ge8Ww+c544DrA+en8tHLL80czYMDTIklGCRtjEs5mv1HWRyPzcGp8mbkZqC0Z4CcBJNB76hM
	C38CkrFoN/LsNkVw2miGUpydeddc+Fa2VRZOAr0nUbFxM8fCzn4m+/KedfE1eF2neDY2GwDRumR
	3UwN1lZhiCfqr3Lxv+DMCgv8cG1cQ2qZAaxQB1NZgz+aZ
X-Received: by 2002:a05:701b:2310:b0:1b2:4e79:bfb0 with SMTP id a92af1059eb24-1b24e79cc85mr3514890c88.23.1793875405837;
        Thu, 05 Nov 2026 02:43:25 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm15595215c88.8.2026.11.05.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:43:25 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 03/10] ASoC: fsl_sai: Remove redundant error messages
Date: Thu,  5 Nov 2026 17:42:30 +0700
Message-ID: <20261105104237.38542-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105104237.38542-1-phucduc.bui@gmail.com>
References: <20261105104237.38542-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

The errors are either reported directly by these functions
or already reported deeper in the call chain, so additional
dev_err() and dev_warn() calls are unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 44a34f48a0cf..5532fab80be0 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1615,10 +1615,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* read dataline mask for rx and tx*/
 	ret = fsl_sai_read_dlcfg(sai);
-	if (ret < 0) {
-		dev_err(dev, "failed to read dlcfg %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -1698,9 +1696,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
-	ret = fsl_sai_reset_hw(dev);
-	if (ret < 0)
-		dev_warn(dev, "Failed to reset hardware: %d\n", ret);
+	fsl_sai_reset_hw(dev);
 
 	/* Select MCLK direction */
 	if (sai->mclk_direction_output &&
@@ -1715,10 +1711,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
-	if (ret) {
-		dev_err(dev, "failed to claim irq %u\n", irq);
+	if (ret)
 		goto err_pm_get_sync;
-	}
 
 	if (of_device_is_compatible(np, "fsl,imx952-sai") &&
 	    !of_property_read_string(np, "fsl,sai-amix-mode", &str)) {
-- 
2.43.0

