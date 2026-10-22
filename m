Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792658474;
	b=KDyqUgI3JG8omuom8guNVbGrQhetwd4uwR5I2CJDDO5Fp8lpezkXQMRDzc7RGQBCPTAu
	 MqbxiribVgrl3gMXusn5TEitvKNlTdlJy+NvkMFA7D4RV84Sf2xYPTTmxOJnZe6WjW8db
	 QmnQWWEVhknWLcMgPAHb9titv1cU7dUaCaYlOBjnoBIktZQ3jn2qFilptPbkZqhfWc1kg
	 sWUtu1ZeiDGRJ9hn76SIcOdjZLTnMnBD2+sJ9uIb5EUfzcpdeGadnsr5EsBZvZvsOqCZd
	 dw3CDP2yzMp+OtS2zI0UX1SEtIl3rIo/Ryjuw4v8KNc6+2zWtJAs8MWlJGbDRqueHQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792658474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
	b=eP/I4pMfj7lF6BnLDFoD/CHyVykYwK4yf5esNSsKY0VahrDO/gQ7KDfH9Gc7lFKCPynm
	 iZP2ChY6wNP6WrkwQMjaeCZScypVm/hwiwSR4VxhoUeMdtFNfvP/w0OX7R3EpZplu1XWb
	 RXrqE3ydXBsekTitNkjW7b4rHkXB1uJSIS+0IDJY7ObvO5F4prQzoPJIaz6/R5ibrJir2
	 7USfLn66UxELsgBOE9TRKlsA+JUGFFAHFFe1VxyN9J2UKIlagQAi9gDmhDeebZReOx9wp
	 qKNFmwDKdkeu2GmBVoOMWG30lKhIC5LHU8XXnCouG93jK6iijB9xxZe1zg5/Z0nnOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+6T5aX1;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50798606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50798606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N+6T5aX1
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1376023a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792658474; x=1793263274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
        b=N+6T5aX1PZWcOEirFLBCnUdMk9n7dXk/tySBMjcZA+LdXebMm6TYHg83BlSiBmuOA7
         hE1RQuBihUwi02JJ01p9pZK54s7BBo4HX1xfZ1ezM1VUczkk4MqYbdO4fnn+KFn002Sf
         fAfObTp8CqkrV5+uk3s3W1wML0YyD1ZPuvulq+xtaR79m8V+kkALoW/22jzXkWeWrt47
         vHckyDjpH+qmwBiLkz6ag+h+t7gp4Zvynp1n6IkjSdhrSIeNQhBoiZ/dxrW8mWzXkFPn
         OxHzpRuf33prZVyBYevtKcWnzgm0ZxfH3XogRlynVvMJ5TJSsGdRucMS4dZ5CvpEOD/z
         G0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792658474; x=1793263274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTr8FXKlHcoYFqF0DOsIryqifBUb590r2UXrxxN/HB8=;
        b=NJeduUzcajUHi9t94VpDa2lzYw9O6xWFcjm7krXga6jWLnEj0AT4IqRkVenXfQQml2
         0+87AJJAUIZD8RbBgkmm81g5On1SRufZqSLN4lSAAjcT3CLYASf3bq/NTP9j/txizStJ
         s6S4uQP+r/AumIZdLDC0ZxtilD8s+2OEBMy04LvguzbWP5J6of74mWnS9ctbkU9YZW+q
         LfU7d8tJH5Zf+Qq+HN8hHFf5Bj4xJIi2X+ER/U38rL/Xb9CPq4sTHaT8wMW//2RiWRGv
         Zg9mZOa1aTEWCUVmExjMonVrZl8VTBJsI4OjWE+3iLwxPy2yDuLVcjD6IhaqdMQ+eDPR
         MgEw==
X-Forwarded-Encrypted: i=1; AKwUvByF2DAiBHcTDmNcB+uMYhUtr8d8KbKqV83Wo3I0Q7CWqiNktUw3GuJvZSBljQRpNDH9LZAgI+3RaAEp6g4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8zwMfx4J9nbONw0qJQ+E8x3b7r51ZmGeM5g6MtnKsIdoRNcxf
	de4EelsxSt6TpCupkOd3yiCiCfGksOhrpjj4SVVoPHVQEV8QyqmFXJ5+
X-Gm-Gg: AYBFou2jF74lMLuxnZmK6H/CEzS+Cfz5TCp3Yx8wkUMNin0YPZEWnWJvd43zTSDefkm
	EgX8P+Oc65Gj66b7TX948YI7/Ko49DCflMw/+MR/EWpOHT+Xj29v5teGnt3ndYKuJPhkivBQsbA
	G2UHCH5Pj0nD0LxMFvE34FgEKc7k6QnckBoGDi5IUW+lep+Xy+MXxzMCJ7/zz58sl5fbonikB33
	bIpJWTcIkZsVa5hvv46hgP4Pq/lu4b+fYeXVUqCGr+wRLiGLxgJT4xr350o+w7x2MGQ5+yqAGHS
	+ZazEZDcYkUAl/tw8Pf2C2A75ge3EdnjhVONkhbFE3m9M64NY69Yf9nR3rI6A/SHVWXI5CPoF8c
	YPTBjmxahF35BIL+cwtL53njtWPc4EaByqin49vIAi/mRrkM9A4R7+9nie3AYX+DyKTgHus3WIp
	u6iOLB8ORruH1JMQ546kDEb/tcD1A+yHL7/gj5srkEX4fujHfqQLkw/pceo673gHc2cn19aGszX
	RpQzELRmAtddBxWV6pX4DbTdQHJ91W7BMtiFcu8lu5gXKfJwQ4IWSgyXPXu44S+P07AdNr9DId1
	RNxL6X6h4Lassklj3SRjzHzxQAfoOntwMPoAhl4m13Q441r3GG4wVsDVfPtayP1TR1GyGGE=
X-Received: by 2002:a17:90b:50cb:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3ad86f650acmr3855130a91.52.1792658473545;
        Thu, 22 Oct 2026 01:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48a573fsm3340992a91.10.2026.10.22.01.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:41:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [RFC PATCH 2/2] ASoC: loongson: Handle clock enable errors in set_fmt
Date: Thu, 22 Oct 2026 15:40:40 +0700
Message-ID: <20261022084040.31181-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022084040.31181-1-phucduc.bui@gmail.com>
References: <20261022084040.31181-1-phucduc.bui@gmail.com>
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

loongson_i2s_set_fmt() treats all clock enable errors as timeouts,
warns, and returns success. This hides errors other than -ETIMEDOUT.

Preserve the existing behaviour for -ETIMEDOUT, but propagate other
errors. Also clear MASTER, MCLK_EN and MSB on the error path to
clean up the controller state, including when the clock provider
format is invalid.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index 109cb61c6ddf..4823b89cab8a 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -185,34 +185,50 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BC_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	case SND_SOC_DAIFMT_BP_FP:
 		/* Enable MCLK */
 		ret = loongson_i2s_enable_mclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait MCLK ready timeout\n");
+		else if (ret)
+			goto err;
 
 		/* Enable master mode */
 		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
 				   I2S_CTRL_MASTER);
 
 		ret = loongson_i2s_enable_bclk(i2s);
-		if (ret < 0)
+		if (ret == -ETIMEDOUT)
 			dev_warn(dai->dev, "wait BCLK ready timeout\n");
+		else if (ret)
+			goto err;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	return 0;
+
+err:
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MCLK_EN, 0);
+	regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MSB, 0);
+
+	return ret;
 }
 
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
-- 
2.43.0

