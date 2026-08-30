Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168D370808
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788123074; cv=none; b=tyG7SFxm8ucZlc+mZLOSgZz6xDZuy4qv4rsG+SrO3b8GkNX5hoP3i6Jmh6dHYnafBeUSeOczAEwy1xwHEIiI/7YqnymZT+W5s3qF7UQSh4EKOiUVd8S4qvS/Mnqobv0tA018+dTXpT0rjaFMCR9+Oqp1Hsti1iAfQWTQCbpk0u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788123074; c=relaxed/simple;
	bh=GkRg0kWNXK2utdZSpLyFvG7AOXLg08RsNEeYS6GWOis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASAmEAm2HkM+tVhTTBGsIExgT/J5LWbCkz2ZsKgwXFnCBOojgLMUPIgkLdBHHMfLvq0k6TE4F4/p0u8KjXdy3cJMN2sd4ukb1Z316z9lwemjUMMeVmpWWZAVogYP097FgZvtxtzY64S5UxgeeX7tmmcTuHUBuDAlEgLAg5tzOIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTRltCpW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTRltCpW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49954b88fffso19146545e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788123071; x=1788727871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LoZfYCgqZbEQ0teo+NtTssPLrP4Kgxaj7h/3WUn4gBg=;
        b=NTRltCpWoOMAvVkIOaFi+Vbb/s0t9wZi6yaYIv0Vm4Pwwsv5B8zqoKlc3Srv0AguyS
         0S14MOPsSTco4/Tula8xvU/BTrHorAoOIrJHcgPl3paojcJkpYbKJ+guhgmBLfhWUbCf
         HLkasyLuAfLiwZTq+p2rDXs8ZO4YXHabR3SyWNjvIG0W2Px2e8E0rzChRfkAwXgasb5B
         IZpccasiqhCAUBIVD1QTIpbEctdfbvGkwY5IbgsD76a/OBf52WXdtpc96na1XnLq3dNB
         XNiIdp7e9FAIuVQCWM6CU8KkGffD82S8HbHbjuu95fFhzn/aoVjL2b8ORD3/JX9mOACP
         SxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788123071; x=1788727871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LoZfYCgqZbEQ0teo+NtTssPLrP4Kgxaj7h/3WUn4gBg=;
        b=X1rtbYHY1kCF5ndSVHV9OBxZON7UoOzye3LhxhZfhRJF3SAe0GUE86SHH6UUZpiPaY
         Pu+Gqm/IWcEOTB61b2hrvc4ttJuM9tpoS22W4le9gWBxVDlsqw+EwevHFbovbZAfuolJ
         Ydy98SMIubjNUJdVecFp+ci+u9SOvVdiS8qrc6hoaZaUP1evDsiSNs+AX8v8J2C7WLru
         fmHndrL7h+17Y7WRPaw9KYeq8iK5Z1rPP59+oaKpUHeySMZ4gMXbjzK00kQTy3L4iy9K
         5Etl5vEcrXXhj9oQMnX26I/Qo2XplrROER4eJQPw52LZuSWfKm9O7zS2rTuWEQteJH2m
         e/gQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp9eDqVh4EzVETobw5rEBsurKGrddNluxUA5hEI7eDQf1IWi2FQZxdU9lqgUMjnt3TTXZt5scU9Y1RmboU=@vger.kernel.org
X-Gm-Message-State: AFuF++ncYA3Ffs/2TSbFu3xU6n0dq4OcifEo6uK0SR5/WnLIJWF9zsp5
	RwfaMHvRgkQGGYlHy02mlti3SIvePkqjH+czH6YmD/gWsaKsufqVPqNu
X-Gm-Gg: AR+sD13uLksWYtejabyKpKaFJPw7eMd5DuA1dAkAokmC3JHGt9GPC3NLk0RyX5dPfua
	oZODYsmExzR0mBdWkL/4pJXOasP7pVcbgiS/iymFclLwsw+d4Yr93rA4J9thGJx4Nb43/BXotCu
	qUN2u6/u9jh3JciL8TZeIvl+0/97rE56VKqajThY8o2mGgCCpg6a6Kiftom8RMEMfnDmzdCEvCb
	I2XxVmcG5/ZCFSxidTDpmsR5e5pIyZPsFyIYba9w0wMMMtszCQcTEKwW1w+jjyhwTdffjop/pl1
	R339kGerq3oTBm8n4lzTFTnGtY/RpoCD4ewlbxX+0WoyJwW2JUigDE078/+TCI7u4jcyjqFyPeO
	T5aezzfvpaulnscaq/Yif4Cawc33TYMxotlEvq3/Ohws21RcQzd1B0B2wCDUtTvIY5zuJbv1u8R
	94DnuE3PfGBSnc4F32uOCoswfCIBH3ptn5TEI0tGGjq4Ac3gf8/oeVLK/jnpqyabx3us0VTc3Mg
	WaxLxcXMLLB1cc4FCJuCBTOAoNNTcLjxvGTOTCSJvYl6aBQ8JYo5gs/ZKLLs9W3Ow/P61TiYgef
	ZjayjiA0FrT8nWn4buMVeK1Xu/FLBfyyskpR1OiDxrUfZ7d8m8u7Y5181uApYS8o5y/ImLAA3p2
	HFBQpEw==
X-Received: by 2002:a05:600c:c4ac:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-49b91c20e36mr320052515e9.6.1788123070924;
        Sun, 30 Aug 2026 13:51:10 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dd2517sm233634495e9.7.2026.08.30.13.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 13:51:10 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chancel Liu <chancel.liu@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH v2] ASoC: fsl_micfil: balance mclk enable/disable
Date: Sun, 30 Aug 2026 23:51:06 +0300
Message-ID: <20260830205106.11267-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260822115959.74496-1-stefanghetu9@gmail.com>
References: <20260822115959.74496-1-stefanghetu9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hw_params() enables mclk unconditionally and hw_free() disables it
unconditionally, but the PCM core does not guarantee 1:1 pairing:
hw_free() can run without hw_params(), and hw_params() can be called
multiple times from the SETUP state. This triggers an "already
disabled" WARN() in the first case and leaks an enable reference in
the second, leaving the clock ungateable.

Guard both sides with the existing mclk_flag, as fsl_sai.c does with
mclk_streams.

Fixes: b47024dc624b ("ASoC: fsl_micfil: Add mclk enable flag")
Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 60ac8eabab9da..5d8f0f76ab46f 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -953,12 +953,17 @@ static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int s
 	/* Get root clock */
 	clk = micfil->mclk;
 
-	/* Disable clock first, for it was enabled by pm_runtime */
+	/* Reparent root clock to the PLL matching this sample rate */
 	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
 				     micfil->pll11k_clk, ratio);
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
+
+	/* Enable only once; hw_params can be called multiple times */
+	if (!micfil->mclk_flag) {
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+		micfil->mclk_flag = true;
+	}
 
 	return 0;
 }
@@ -991,8 +996,6 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	micfil->mclk_flag = true;
-
 	/* floor(K * CLKDIV) */
 	switch (micfil->quality) {
 	case QUALITY_HIGH:
@@ -1068,8 +1071,10 @@ static int fsl_micfil_hw_free(struct snd_pcm_substream *substream,
 {
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
 
-	clk_disable_unprepare(micfil->mclk);
-	micfil->mclk_flag = false;
+	if (micfil->mclk_flag) {
+		clk_disable_unprepare(micfil->mclk);
+		micfil->mclk_flag = false;
+	}
 
 	return 0;
 }
-- 
2.53.0

