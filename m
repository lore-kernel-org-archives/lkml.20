Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364121;
	b=o/Kqg8cp4rP6LmRydT/4QMdrMeVUz1YqPGyjMhIyOw5Olggv5F+Xh0KyedGMnwftCRJs
	 bmdPuY3pHtMHXxvum/ihlmoZfzPEASBmyk+u0ESJhDPc0TxN7KCF5TSDuB6BB57k5/B2/
	 Eo2zSv5oHFhVjc/cWT0mYhJFQpApknTi0GFC04aDEgZso9S6Mb2cysuf5GKgqnI/sgULy
	 LKi1iW2L7gpqqCc7vJzBHFC8bA1wOZ3bTf1gRKzZsYzZlStU2qZwaXLZsIxeHhYy9UgjW
	 QVJ1nKlRUKp/xdhryglyew2OUNL9eiPEKy5CXGMaMW+h744cvmssEbL5kda+pFsZ24w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
	b=1iMOpZKzf8dbmNg8y/PbLE+GzEmnFp/2l8BZXB+w7GeKI79fI8MlErvELaFsTylAd4Mq
	 /CE1Cv4wqUVTOBLht9FG4HqKCUDxt8VPhJawH/8MsVkAx7opP0pYgZ9VuE1uGcRlTQV0P
	 09WbFQcQQKkO5B0f7kaU2ihq3G/po0G6WEjYuXvvalviw5I+CSiA5Fq/H0wvb7FwnTzUZ
	 owv6AiXSn8IxP20oj3lrhRApW/9LcHXj5NeBeU6Yoo8uyZ1z8DcrapH6uosDstsi04WNn
	 FX/2rj6SE9xwSavmNCi0YST+LDtG64bfnEEzAgXlY+GnQFb5Qx2oCgD8mmzzAN55u6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzhvCc6c;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC33F606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC33F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzhvCc6c
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2702782c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364120; x=1794968920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
        b=AzhvCc6clxW9pb1IJ/kr8Wwbh6mehd11/IwXOI2FxbEdV3wU7y68gg0VINI7hLYMF3
         DDNAXSjJqvc8TiNh7j9yZqpO9Sgbf74qE7eRRpvfLUP0Y9Bkcb9C2XTfT8n7AGCfKORE
         T11ZmgCQZvOQskXe1EjCPCqjDZ5A7i2u6Xia1jYVQ14urtNonL1wiweDYn0aO8BkHVln
         HjZ7I2fkbrkp5cim5flWbtJYKitkhzjEN8SPq57vVs3UiWUUY2W7NbGGaxfaV7lNW8uk
         /+zQL5zshSI2VEm+C4luzl0IgUMtpPyhC/2+mzuPW0ccpIbaBDL88zg+ofKD6KLdB2qq
         9X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364120; x=1794968920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
        b=ZhSbNud8bJW+AILk802QygWqQXTkffaUATITA2HAH87YNlFd68mzAcF3mHtWM4vgja
         Lm6LyNUPiZkwNyMfhjh6fIDWXtBUeawAaiyBEMgXFiYajDJrT/YeTzpPeqo8jyGSzc8x
         DiU1MGiT+Y3edtDhzWdhiQgaqJGimcpXa5L3K7AsoK0RpOFe8GkC3135p4f/Q5//kw9S
         CEc8qyxkfOa6dMZRbP6ggJwn+zsekeqnMbwl5AUqak4vGBtNJ4F/5xaRAGyxp0cVx6pk
         7UUnwcYklCkua8qEwJ/SNHv3QZLIF1xcbGhB+r2ECvg1Y7gmUQxq2LCv3uXWJDKH6i3b
         UL8A==
X-Forwarded-Encrypted: i=1; AL+hErHTB+eTlj2Y4oOdQlLlIX4o1p3KzElcUAw7OD+QiJC7H5PB4nrJtxfjTUbWtgU8sT2+/xX0oJYJ9gx3RWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hmgvShnyFCOS3PqdXPyoKI1in6OgdpXFEkuaY22554YEtoN5c
	PK+jR2TanGAPaAQ+rhCYKrWjzm7ot0Hovtl3MRleiIUHKM7D2/YDKfxI
X-Gm-Gg: AYBFou2hPW4yBdZPJkyklho7emoEd+e794Qo7jxjGeQ04uqM2sp/9iXlq6UIg82LMba
	zcOX1X/c1TIK045ZSRizWMoPcBEk6/l/5NelloYZNtIwB817WgpUj3rxDFfrL6daP16dCKqbc+p
	AFnU9FBR437rlAVHCFQUGQcEpOmEAcLhe1hSVYUjIxeqXLBk41kevwwgAUVxAGjJKSUFh00VtDY
	2mI61uO2u3tYitfM9vEuu07Ma/qD6/ucUtjSSUlFutkl3wogdkImwku21T+38HnlIqnJMk+UQLx
	FPeFeatAxBFMSAq074HqADV8+wlaRlLuHKZzhcpVzy2BHmIPxhv0sLThJ8dsdIFKeTe/a1FRRg/
	BfKGbaK6214wl2EbycYQzfGZO8lC3pdgHhuqDavFp58UQaGLLQPnxmZfL988TA39QMKyA9EGZO9
	bzmmoeyDSdTzislXRulIe1GUWh9o1MPdgL7z9x5KqIlTIAeaWJV3IhbCUNOilzUGUYqygkZmWUS
	u932TzIX55LmwfjJW+HmxIjDBOagLoc4DaHy52Yom+WK0k6Nm/5yPyciCbWDZtBbo5qVzXlV7EW
	KgBiHSAZ/pnjxvaF2Q1T+MDOwp+VTi5MpghSqcXwETKkR13jf5lZdLvjvgnsSWMbR5FQTxr2QJh
	g4O/n8IcFZ0QEBSnKtOm3Y5iXWk4S62rOKNqyDku9CmmT
X-Received: by 2002:a05:701b:4508:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b3c02fdb39mr1062793c88.11.1794364119815;
        Tue, 10 Nov 2026 18:28:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:39 -0800 (PST)
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
Subject: [PATCH v3 4/6] ASoC: dwc: Fix DMA fifo_size calculation
Date: Wed, 11 Nov 2026 09:27:29 +0700
Message-ID: <20261111022731.8243-5-phucduc.bui@gmail.com>
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

fifo_size should be the FIFO size in bytes (depth * width / 8), but
the code shifts by 8 instead of 3. For capture the parentheses also
make it always 0.

Use depth * width / 8 for both directions.

Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2S")
Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Fixes tag, as suggested by Sashiko.

 sound/soc/dwc/dwc-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index c5773f191db7..b0d3413c27d2 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -664,14 +664,14 @@ static int dw_configure_dai_by_pd(struct dw_i2s_dev *dev,
 			idx2 = COMP1_TX_WORDSIZE_0(comp1);
 			dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 			dev->play_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2]) >> 8;
+							  fifo_width[idx2] / 8;
 			dev->play_dma_data.dt.maxburst = 16;
 		}
 		if (COMP1_RX_ENABLED(comp1)) {
 			idx2 = COMP2_RX_WORDSIZE_0(comp2);
 			dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 			dev->capture_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2] >> 8);
+							     fifo_width[idx2] / 8;
 			dev->capture_dma_data.dt.maxburst = 16;
 		}
 	} else {
@@ -711,7 +711,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_PLAY;
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2]) >> 8;
+						  fifo_width[idx2] / 8;
 		dev->play_dma_data.dt.maxburst = 16;
 	}
 	if (COMP1_RX_ENABLED(comp1)) {
@@ -720,7 +720,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_RECORD;
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2] >> 8);
+						     fifo_width[idx2] / 8;
 		dev->capture_dma_data.dt.maxburst = 16;
 	}
 
-- 
2.43.0

