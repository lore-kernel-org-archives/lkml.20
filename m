Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1693D6CCF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370944; cv=none; b=Jopam+6/afg7PWLonSHVcw+UjsBejNcWpbyNfR06aUk5/KkZLHcpA4wPPRV+RXvAyvCoMAlRxj/xsUevm68LFHAq8fs8rUTA2Hx66o/wmlDaxV8fJWn/XAVD/vz1VA4Vmp9tyBpF5E3v2SoxiZF01OxGJzKAem1nANFdjkzqkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370944; c=relaxed/simple;
	bh=EVDRcKmTVQAmuHJWES9U2hQGWq/76vGUhS5zLMa3z4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnx3kzrtZcTjK5X6p0KRV69DEL8HqlgmEYvI/JfxuNr3FRdcSpC9+t2Wu8ANlj1n0tEdgJTmjZowtP1esxmNHKtv8yQIus9JL4VQwpXxffZFIPAPqpqGliGxNZvsan6Q5q2DENKUx6PKiXQWQduue0hmNRRPEMqLZKQjjl1Ulac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=glkL16Fj; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="glkL16Fj"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so2020941a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370942; x=1789975742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=glkL16Fjjl8jE8SF7ZjkTrR0qvvkyqAXJpJ3f/3UO5lBg+Bxlh0mW3Dqn3IFDMfBiA
         qdrR2AQjeltCxxeV85L7D5MK0bu8UNy3rohbr7puz/L9WkMrvheITj8LZafG2cIRn6Td
         wQWXcbsfszgVYAgoIKgFhwdl3snW9+dHk+hoS/ZCge0Qv9451DikfiKddZ/ueQQ+weJC
         CMSxKZzsWqw2oeflGbyLiVcIKpdQSPUHXPXp1VxxeVF/d3TsEzHiNywOrFQyQ3eeAxer
         DNppwrXcxfCTK5AgyDrTga99iWw+2WUU8bvFUHG6NwpAtmHnvab36TLVSnBYOM8p3dmV
         b0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370942; x=1789975742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=P+8bH+oVKCEYgCsvBJUmCln4rETP4sX6BVNwYcvC07zixxSpc7GFPL21a+kB82yTgt
         N4LTfzfR1dxKf/h766oTPDebJoStS6FngeBpq95vs7ag7fDSjNcrHWQ0FGkxbSA8+N09
         f50xTXIhAou9E7t++M2xDzfubIWqXnMMBAv7651gtELv0OOGG+IOpP2cqk5/9DjPdpxJ
         fs2Zdkk9ntQK5HF8/HdpfYCH2EqAGZol8lc1W/1eP8ZTecNigAxAHNmjd4iPEyKSnTQA
         71qCFP13ih9sGxQOBKI3QNyOrOLyxCwBgRyv1drAhbg/nQ3QJK+VobmubtdQA9dX0FMV
         ZjNA==
X-Forwarded-Encrypted: i=1; AKwUvByeaoSr2JJ2B0/9hqdJkSXF8wSmbr0edW0Z6UK43TZKRjw1EYYIVkPrNSlR6fAehaQiyywbBbNoNdDFFms=@vger.kernel.org
X-Gm-Message-State: AFuF++n7llg22i3eB+y3P7/npe4K09n6sCCv5ymxhduBGe11ITXlsj98
	xAN0M6ItDqxTmIIwGxPC4KitfzQBVj8IIbtm7G2LX1q/8Q7qfUeaLsMR
X-Gm-Gg: AYBFou3iKdFTiKr1UZB5kwaefOyTepQMWe49rroMNDMe4nKXLhvajF1PjwlE+qPnGWP
	HnMXugAHuSzi7eG7/DqqrxfaA2KLpt+NttpWyMf08kHm6n56i1m9o9DozasrVCWEKMcaTNbPk+K
	+86AdE+JWMHN6PKzZynXLHsJNrAJZkXs4la6COc9P/hwZ4KGNvNiDWeb8JnrABoF6JZkhP7RYos
	6URIrOVD+OVhAZp85FH0yHoB/hHlBG9E3nMTsqPGDKye92dyj3yz4D+0IzswlMsgVPY0vsNCYK8
	DiQaHsgQPh6GZi3oTCFpX9Z2RxjANnbqKkM0CIkM/UdiNz9OgQlo495m6OYkQdrN8ljjRBNg3rw
	yD+e0YYOVjYo/yGtgIkpTICHf4Ocm8rPh9QtNE7XUlemypv/lAIrZ35QL/EgYv7NcuQOui/hOQB
	ZaxYX2Je+/zsxBaIwngAt2xH9l0ChC47db/rcPmL8AIL7wJAyOk3Xft5zXNIxlYFnbfW+JJBlHm
	qDgzyRHKg12Q5uF0KaxC7LWjrnrApJK+/pCfUkZwltsr2tUToC6NsKVAuVKclxGQyvNCeBlsM9t
	plUH08aMV4Bmp+0EJr8FlbnAeA==
X-Received: by 2002:a17:90b:582e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39dec08daf1mr3030942a91.16.1789370941989;
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:01 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Mon, 14 Sep 2026 14:28:30 +0700
Message-ID: <20260914072842.24420-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0

