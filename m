Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184127;
	b=i7qDcwiTVBnzww4AJ24kjbhZEwi7E1cdfVMf0IXmnfMNkgR/k0G6C5dm+ZnJeoBc8XuT
	 0tYx2sXhiFYOoQhdkN6lRthnkS2hpXqpGcHiiadyfpQ4fdqTeyAIWMNXZIxrRC1pTktr6
	 B37PXn5SRdlFyV3T6577NORL/VH485d5o5KWqFwOwvj/5nIex2gfwyIeGHlPqL5yaAD62
	 h3E4D4xDkZM/2HfN2SEUiKKUDXjvuPCGcqNX1qADfrZV3koPErv3tr/1U8NrGRLgOPmg2
	 299ezClt6K5p5JAtNea53fgo2lht/IVxaheNlKimnKqr7A15ysI6Mx9IWYIZhtGWHNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
	b=cF+awJRJwnz8YSDloTrzZkjYAFkpDu4UefmXj+hT6KDwczb6mlCuV/+vSSoQ4QPhEHY9
	 nDhwUpR/EWLRor//6sAFFtH6aAHiSy5JLsRjUOSi/6JC14nrHgoye1wbXFMuoYRvM3xJq
	 ITIM/biRnZsxPfQ3V0bJgPeGEfD9DYsx5ZoOeAH91QdDId9YeQXoGBAl641K+dye2SmrZ
	 ipzTbxqcJj6OO4Wre1izFFlFeUAuUySNE1U5lWkmcUvJ/15FaQ4JDtFWcWaSxRfDkG+lt
	 fTTofaKkQfF/BoJhS/ZK+ASu+amil4PdUnmlQ1vs0Tr2Un9FX5Wk+D8w6zMAblw0ayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2xd5GBG;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35146606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35146606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2xd5GBG
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1738069eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793184126; x=1793788926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
        b=y2xd5GBGaAQZOvj58nlFiV+YrY95CvXgRL7TUKj38+mL01NoZyrawWQbxHdl+YAbEZ
         wTePaGxVqSqSGq621OCuWiNlaeUyHkPDVQk/L7VY1b+CnFrPCGYoZjwhkraYpm33wf+F
         YIqZZtHAC0GKcYdiTfQyfPdfeCYqX/VLYjF7wdI3u99g+3tbkVkQuS99WWmLV/yBFTn4
         7f3X7FUfLBmorzjdtLl7mp/9RrXcnOjLVJemj5zl6y/snTlWF2MY1y7UYFX2eNHybVwy
         Fi+jHHqEuSwDIdwKRGSTKObT8OEAIHu9svHZEEh3nPiXmqXaSdCX1b/Xl2tqY67cC1Pw
         VuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184126; x=1793788926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oBHGymr+ku8G9nuyW2BClMpb72u6ZaeN0XLosSPL7pM=;
        b=1tba/Pr2a4TCknZDOxcxUjWf8NwzD+x6A49+4t2Bd7mOxdSJmZNYaXbSTxR9g6AWaQ
         3ypk7quDqxWmMIc0G8iq6IczM+FJBCpdx/oBf42+CaAIvTJYkFevENFBftWnxabsUTcL
         GakTBPo5Rizt7Gq0ONSMeqtVFTj+Osb6fNWfZiAJ/j9wmcwTpEtYXKiTBSvXq9nadRBl
         EDCJcd0GtM77g1Q2qBegUrmLC/WolRlwvGeihlaLLKxLGrZLgBUdsKH963ZjHSr1qOLf
         BRBv3ZwHn8x5UriRAUN3sX953BrQ/mBFqyHWVvU9hczB+bR3dG53cpDx7aFcp4Nls/0q
         8BeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3IfD589gtHmuWeYYiCmCqWv56iOnychZQu5wd/Eyctp0llpB5vpMaozSqLJGpxR072xk8ef74IUFxFQU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIA09TMPlUcxYUhp0bbX3JwPmzk04JeG7sy78F7WWTKx3hRqOdL
	Y0UIanjCtqYPIv5cHwwZ7Bjd6vyi9pNF8seszMu0vbquCIUEvXqXv/aq
X-Gm-Gg: AYBFou1iD2ycWM11dzHXqO4+eU/tOhrjcfTS1lJasojGj7xat6lFr49WRcYegFc7/5n
	JEsDz3ry+qenHTf9sgjxk9BxIZp8isX3/eYCJ7kZTe77epb0GIjrtImBlz6xr2vkDdYMDy9jEet
	PfaZ/5knDTP8Q+AhBQk4iEG6fwDpeOf17UaPZsQGNCLgmcvKSJi5JIFSy/7KM+oLKR+Mi0Yp2eg
	JDR997g++9X1o+CebkWCVnHds57LQSI02a+lc8EcTnQVGElNF5QUHej89P4qJr+2iIMyxkfhJrs
	rUqzN5sLuK3S2Qt+IKcWkL8s54IBXhGtCEJsJftzI0AvwDF/wQC5wyTigd1cFer6O3tUrXCbq9F
	k9mZDH9fualg3ke5wsAhGj+h1raZR0sujFFgSHvgzgJvGysXbp8LAuzLGlg4YcMplMvHrZYlBUz
	T8++b7GhJB9CdQI5LzwozJCu00YtXjtKXKZYnX8ZmlpHj7E6uWp1OaqYwbUWSWfgezwag2+3qRy
	mZB3aTG9pP4waGzK7F7AQ3L3Pjm2jqCgQj+dLFcl+qnae8ZV0TtVJ8mKHzON4OvWRcxhrxbluNz
	yk3fVWmFksR+G/L7YiaV+RBGIE6L4KhAfMuCPB31xysYlIbDccwOARqes8Z0airMVrtlXO3lKwP
	hpT4LwDfl3ZWTBjoDH/XsDnlYmhucp7iDcjgqjoDvydGwyTYrLjg2zer3fQb29CXILQ==
X-Received: by 2002:a05:7300:fe42:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-36a20407151mr2435793eec.13.1793184126011;
        Wed, 28 Oct 2026 03:42:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm7521881eec.8.2026.10.28.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:42:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yingkun Meng <mengyingkun@loongson.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/3] ASoC: loongson: Use FIELD_PREP() for register fields
Date: Wed, 28 Oct 2026 17:41:37 +0700
Message-ID: <20261028104138.26973-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028104138.26973-1-phucduc.bui@gmail.com>
References: <20261028104138.26973-1-phucduc.bui@gmail.com>
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

Use FIELD_PREP() to set the bit fields in the I2S configuration
registers instead of open-coded shifts.

This makes the register field assignments clearer and consistent
between revision 0 and revision 1.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/loongson/loongson_i2s.c | 11 ++++++-----
 sound/soc/loongson/loongson_i2s.h |  5 +++++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index aebea177e7e0..0d5278203024 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -80,10 +80,10 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		mclk_ratio = DIV_ROUND_CLOSEST(clk_rate, (sysclk * 2)) - 1;
 
 		/* According to 2k1000LA user manual, set bits == depth */
-		val |= (bits << 24);
-		val |= (bits << 16);
-		val |= (bclk_ratio << 8);
-		val |= mclk_ratio;
+		val = FIELD_PREP(LS_I2S_CFG_LR_LEN_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_TX_RES_DEPTH_MASK, bits) |
+		      FIELD_PREP(LS_I2S_CFG_BCLK_RATIO_MASK, bclk_ratio) |
+		      FIELD_PREP(LS_I2S_CFG_MCLK_RATIO_MASK, mclk_ratio);
 		regmap_write(i2s->regmap, LS_I2S_CFG, val);
 
 		break;
@@ -106,7 +106,8 @@ static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
 		}
 		regmap_update_bits(i2s->regmap, LS_I2S_CFG, mask, val);
 
-		val = (mclk_ratio_frac << 16) | mclk_ratio;
+		val = FIELD_PREP(LS_I2S_CFG1_MCLK_RATIO_FRAC_MASK, mclk_ratio_frac) |
+		      FIELD_PREP(LS_I2S_CFG1_MCLK_RATIO_MASK, mclk_ratio);
 		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
 
 		break;
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
index 457d90e3d5b6..0c280e9b7505 100644
--- a/sound/soc/loongson/loongson_i2s.h
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -45,6 +45,11 @@
 #define LS_I2S_CFG_TX_RES_DEPTH_MASK	GENMASK(23, 16)
 #define LS_I2S_CFG_BCLK_RATIO_MASK	GENMASK(15, 8)
 #define LS_I2S_CFG_RX_RES_DEPTH_MASK	GENMASK(7, 0)		/* rev 1 */
+#define LS_I2S_CFG_MCLK_RATIO_MASK	GENMASK(7, 0)		/* rev 0 */
+
+/* Loongson I2S Config 1 Register (rev 1) */
+#define LS_I2S_CFG1_MCLK_RATIO_FRAC_MASK	GENMASK(31, 16)
+#define LS_I2S_CFG1_MCLK_RATIO_MASK		GENMASK(15, 0)
 
 #define LS_I2S_DRVNAME		"loongson-i2s"
 
-- 
2.43.0

