Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964627;
	b=p0W9YJE8tOBIWwsSjYZuY7vQAmeXcGLS71N2CyfWzeryxVliCN00dzH3VHkAJyxU6dFZ
	 IhWNubwixeI20EaNN/JigT4a6E/lXBNBXFTQeUem7mRxVyvtbvGTix9D9Uop7DIxlHWRs
	 +NJKXK7Q0Ix73WMpG9pvzCmHK3UU0lH9Xy1wzNX7b5LI+7BnxAcSfF+il5GYEfqeJGgc6
	 8O+3xD0ht4zq+d5NYR82mTT2tXLaICibR3U6yrGucvEATrYNtso5ViRFiMoAAxjxXoRLK
	 xiyC6QcVGBCrRr/w8fCA52TYUN3W36QDIsZh/53BnGbrXRBJBrYK0jNiDp4L3s2KdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
	b=eYGAYGeUxzPIRHS9FDKO0lVfN/dvUw9X4YSzR6rW0tiZR+ztn3O+YPv0TSH5+mO/9ie3
	 0lmF33l3V4j/LeKCWp9pjw/9pgqBeT2QNtXqvXrda0VXWgfokPJhTWgC3hHjVeaikalVz
	 QwGk4uTOR0CulNJPGWN4Ictqb04vJ5nYo8ySeEmjF08lfrk3yGGCjm4zPWrvuZknnZe0B
	 1yc86xErCdfSOXSqOAFBLMJaYgpzI498nwHBdHInmNnGbr7jjXDNvL6xYeaKIQslTO172
	 8hvTC5Jh66BnyL/pYnkw0528Pb76uB/JWRl2t7lZAnQYWiRFaucI3VJpuLWBpLt02gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCCiasZ8;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEFA606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEFA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XCCiasZ8
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso310815a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964627; x=1794569427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
        b=XCCiasZ8V5IN48xWbXsGsvzmZJMqJ6u+ZnTtkUiJ0BdC7B38ji/vczBreoPeOg8LMZ
         cHNyOUzRBSwwRgFKuitMUb+nWbSC+xjO3FCHqYtMAfMB4VJMpGR+uHyvOqkSMuHWB4Nz
         /zRw8FVXk6kR0OG3JKGHzEFPQek+igQsCZ7SfxNP/VZEKbTPyqtxILXekbrbWkEmFlRo
         6CqbxPHihh2tpwLshy39wRfRs5ua+qjmiczpeSbi4IhhceBpMLFv+qacU+04A46QqxFU
         au0QPG9N+Z8BwM888L/QJ7gLC9DIENvfOrpbhoEmnfMf385knZTDcIWQBslXNCaZ6ThF
         N37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964627; x=1794569427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJV/UUfKOJWZ3kfekY4y8FQrXVFTAnfNUP2ocF8McY4=;
        b=2zOblyphJgDGD9ZvUJNQ7hlCtGV+u3F/5UOeXUt3TubNF96wkc16UnkuLdyoST2oSs
         MaS6Cto7yZKejnaC53eZxWtKx5oRZT1BrpBNbvIDsYmzxlKpYyMpOxEoR5jnJact4rWC
         AtyXSIuc3V+u4+5vFQZTxQlBl/d9sjcJO9IiPiOcxHTcZe2KFQcZ7Rrc3bcES5D/vN9I
         COUjfwYMRNNoa4ApYV2eZKK95kmsn7dsWg0K4vJ8USJxA/b/KRMdX9nD0L7QBsP0yzT3
         UavM3MlXiKoSvUGaySaMXfFx4jonxZFaVA+9MXte/zdCXEabI8Cz94vhBMdKTp9bBYyU
         l+Kw==
X-Forwarded-Encrypted: i=1; AL+hErEs4X53F2h7DnpEMMuHNpF903d3KEQsXoTM2ScXLBJbOZ/4cjMk3NbY+enyupj0w5gD7Czb3XLTGAgqrd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+U5+vuKLLNZ7weLR3ADRubAS0oEkH8mjyLjQ1YvELD0JbJPbYv
	ZV57E25e+UEywWwTQaZ7EdSskGnWR07q2eCezv2OfPSYic7R5GfGDF6B
X-Gm-Gg: AYBFou1JL5/fISCNrUYHBSMKGa94mk9oM/LmztFWcPFypsFXqclyZzVKlEoQSw8hf71
	kwGcVRxXv7WsCkLgsfw/4MYvv30RspdmCfIJh4g8/F52ehDtoQW1rveU137lSIXsSbVZCYxpk1O
	xzhMxYss54l0WSj41HgRV3csHSQyzmVnUH6VpQ4P/P5hGdc3sFmFHd0fKsNx5OcTDoZwY1z433L
	4GDcbNldXZXPXM4zOTUv3JTX0KOB3CnwEI8+LTdrL0l87c+5n5TEp1xFKYOdwSmTM7RMtIwlY4P
	W+wWMhrmWQ/ByfxAGPf9ThB6afaRRqFLkFxTcg9D7vNJBRk6IL1lCWNP0YsYD9O5sWNAb8GJ+Y4
	BWrSgzGbi5iaw7B4U9A+fL/nRDhVlZfutaIWnJ7yLNEFLXsf8bokNY1I9C7sBaHFtjRTwAVktSL
	1JG1GgNCxT2mm/PY85RKr3R12LoXPKiM4L+QQtMLXSYwxsPZKpvAyVIDMZR7EE6qX82c25JP78l
	E06IXuJ8A2EhMj6kekpqpMBLHI/com0EonlfXdoR3bkSfs35Qjn2/XT+uEKvhWFBRYVKgNyJRNo
	RQzaW9CCJ5aK6fNyBNSLcPLmbmDJELh+O+/wbyvhhAWB+kkf5JZE0ydtLj4kmb+TEqho6NGJSou
	kjz1BXrQv6mx7AF3WB0pUnbiJtsqm5/CVQZRR4EReWGkv
X-Received: by 2002:a17:90a:c2c7:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3b0db6f8012mr2028668a91.52.1793964626622;
        Fri, 06 Nov 2026 03:30:26 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:26 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/5] ASoC: dwc: Fix error handling in dw_i2s_set_fmt()
Date: Fri,  6 Nov 2026 18:29:37 +0700
Message-ID: <20261106112940.53550-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
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
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 9007ba1157ac..6dc84c55db0f 100644
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
@@ -427,11 +417,11 @@ static int dw_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 		dev->frame_offset = 0;
 		break;
 	default:
-		dev_err(dev->dev, "DAI format unsupported");
+		dev_err(dev->dev, "DAI format unsupported\n");
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask,
-- 
2.43.0

