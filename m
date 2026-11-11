Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364113;
	b=dWghqCk6DdlFMvNmdlXABxGBkvfJgFyWeIOp+T3oNBtlWxMIdoxYIdJuDzs5hLt9r7iI
	 V4K2FEoNdz1ZgbNcEOX7TBPbOOjyYbbDLyP95HyTSD1OMPD0gqIkJ456a9onK7HeIzSbD
	 lIol7XXXcfSYpaORez290IhNSQ4hnwCZ1IELT5HpRx1WGSoV8NzeKut7NnI3MF7mBHOnt
	 0/UodL32FV4U2oEAd368oR8XjLYrQBkEdFWpJ7mw+uNdksIKzIX7T6JNqPHY6HpYzbMHg
	 Jwm+DIkFj5y7GAlVuS3y6/F59vdHmldkMKOjfqmI7kxeSZheDwZDzgJvghHjjoOiljw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
	b=F2t6M23DdPa8ssh9tWiTv99r0Ms3zI6hfZ1M2Zh/1d6us4b0/dQy9rJ/r3AkGJwfahN/
	 XwIrhtDeYKSAQCTjhAOkkYFXvypoKhULlkQzYq+oSOvsGKbLa15nR/DN1Qmy+g00OFYi/
	 r75aKD+SzE3d3OgKNJqWBWJnn+kgQEggqSxeCe3xE9vP6ub0B2mEve5/HxRAlzYUw93ZH
	 JBLpZxvsVk+FZgyd5Drg0Pp+73FB73yoKNV0ct2ZS+0YZN3alQ3agCYs5/6Hm3a1JXGWD
	 6a0404WHFBMEMBRQZlNN6QdSNSFUKUahGBX1lAlr6JUxAc75HE2stnFTNsWVUYL1KbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFdZw2R;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55B606A337
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD55B606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezFdZw2R
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37628596783so1405128eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364112; x=1794968912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=ezFdZw2RSPAmzmPNeR1F9zIDZXtLt4tHEcVpLczDHaVpCtI8dxw3cmRJMZLFBMJuAE
         GEr8XaFWUGOpA6sXUghJ8GrjJIC2E7A60yyfhO4QVqjk8q5oUTyjAYW28sbMMNClSMLE
         9qnhF4ntkUW4a8Ua8aik3vrqZoh7hniIuzVWryp9V54S2FWJdWJYKe/AbKidQxcqfjFr
         TobAKGczCE2vusYV8ZcE04uW+pPNRncJJr5PAKD1hKheXknJ+3jWSuzRcILhdNy5EsqW
         aUMVvUjCLEFH7bFETYzcwZjQYGcZCk37xZoyFZRKv8zUumGJg8Cw1lqK1b8dSLrk593B
         2oDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364112; x=1794968912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjnOMEA3v51kaSR8Z91KF0TI4KPRyGyGQgxSggzifdo=;
        b=Srmx6RIjNTHM58dmnFYEr76p7YMZrNA1+Jw6fVg69Uyn2JmZxfDdp+lF9N5HCqKkZm
         vQQZQFPpe9iRQh/40tnHqAe6qieqc4hfvniDSja2ug2e88w27vBX9FofmBR19nm9nlI5
         JOEkGGUkdJP9yoO4ews7LjRVUkNfap4i4veOY2e5S4TH6ZQiw99Fcflv3Ym9iy/4/enj
         WrayIhu6VTvlHObcJj9bA7BfV6n8N1fqR7xECpx3FJ2Df4BJry15Ck/02GVerkW/3zNx
         yD6YAJW4yxOSI9vps0CNE4bywlU0SPAYJOcfU1Vnvr/3rJcL4W/tQr6MipW9d3xFkE5P
         AZ/Q==
X-Forwarded-Encrypted: i=1; AL+hErHGbxETcoT5LIyDA74ONQ/Sz+bFPxGpasa+tG2UT+yj7gKKqDcTXxY9hTa/r/k6+Qu1ps/L8uPpUDVaFw4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+29y2Z2NXvd8IwTEn6wZ34RxCbVHFq9ACgvUqR+CZvuXG7dxJL
	8+8FLxqSgNutJEHR9pQ6M64ZOHyc3aFkfaeAzOdEsW5w14cWWLBTTNHw
X-Gm-Gg: AYBFou1NDFpA7gVPOSchvkfdhZE9ggQY2ZHJ/8nCOBHhbYEDbZzyhUjWbWXky61rbh9
	mQ9RewwxTbJKWuBgBcW3OwBAofe7uj4x+4o2RSKeSjt5wrpoELpqEHK7NpgUES72W6TrLM1w8BY
	Uun9NN2rdnhhahg+ZbZgmudX0pt2jdtRomMLVHUNmnnfzbpHuxM+/d+h7tEReFH7dmuIqXNjuO6
	NHQFTwWjVfEo/a70gS0Qq0Re9M3A2+E9k8QhONymmVB330b1N7xQ2quIBvOY0UhTCVh0l5GRNxl
	AscrMBJfqAZN2H0v/g3HJ1sG92B/f6D5tR4CC0b2WQNjBJ4JiXem5nZSi/XuXeJ20UJ+9ob/W8R
	TEubSG4g3c99pPZZS1FX+BZDvLh/Ate29eS26Qn1UXrBgD6ZSiV13cUGW+qqf7/6zx61BX8+Dd9
	WMFQTSNuzGwnAtT6YIb58lCpij1hO/t2u78coyx3ESNAJMnHssnMyk34v9tDk+DCdxuyrShViR1
	RzsqdoPA5K9TM7+CYTbRV74gSSxXeMFKOSfgH8rC2RonBGK3ql70pj3hFPDCSzA4TNx7FIDc7Ec
	78peu1B3/ZVeCS4M0919HN8wuxFmbFCTGqC8C/OR9Acr9ghpCs1BOf7uI6PmSzTDYa4u/6eIGQX
	Uxg3yCIEHOY1snsiKm+GO4zzMEcCMyNcfncmYMufk7gGY
X-Received: by 2002:a05:701b:4301:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b3c0362b3cmr1033702c88.39.1794364111707;
        Tue, 10 Nov 2026 18:28:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:31 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 2/6] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Wed, 11 Nov 2026 09:27:27 +0700
Message-ID: <20261111022731.8243-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

Return early when an unsupported clock provider format is
encountered, preventing the function from updating frame_offset
before returning an error.

Fixes: 221acc16aee1 ("ASoC: dwc: Add TDM mode support")
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Move the typo fixes into a separate commit.
 - Add Maxim Kochetkov's Reviewed-by tag.

 sound/soc/dwc/dwc-i2s.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f4d06a82333..6a25d2a69ea7 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -390,29 +390,19 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(cpu_dai);
-	int ret = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
 	case SND_SOC_DAIFMT_BC_FC:
-		if (dev->capability & DW_I2S_SLAVE)
-			ret = 0;
-		else
-			ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_SLAVE))
+			return -EINVAL;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
-		if (dev->capability & DW_I2S_MASTER)
-			ret = 0;
-		else
-			ret = -EINVAL;
-		break;
-	case SND_SOC_DAIFMT_BC_FP:
-	case SND_SOC_DAIFMT_BP_FC:
-		ret = -EINVAL;
+		if (!(dev->capability & DW_I2S_MASTER))
+			return -EINVAL;
 		break;
 	default:
 		dev_dbg(dev->dev, "dwc : Invalid clock provider format\n");
-		ret = -EINVAL;
-		break;
+		return -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -431,7 +421,7 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

