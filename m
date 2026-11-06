Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964636;
	b=0tt32lNl99sjKx3+fwrjE5fQRxF00kKr2EgCzCGgVd+ddytvFXv0vxNFzWBh86w7+UXm
	 O8xsGyUrTpQBZ1wyEnOqu7rkFzU4e5n3+6wKvZ0Z0hAWGV9LbXpO54iuQaFkgZbHrOr4O
	 HxAzyM06AoXdH6F9qiZ53bIG/tK7Hz8X+LIG6VszgxlJwj+M5vGBKd3c+qcvodT0naImi
	 goAXFrf+BU7p5Z72Gi4/iZ8i055QHR+PnXWB2aRwmia8ffVpU4KvgvWlLyPsy6ueldJzg
	 R58fSZdmZ1iPPuJxUqFt3Vbl1VxmQRpoJvtC5yQlBCsbFTxnSgyRr9NP6lxMUXQADoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
	b=LO2DSDOSU93wFwxI+oUneHz9SfUdbWlRyRasK4HVge9i6Kl+BHt/t/oYFjNPToSchRN5
	 eKwJG6k+gyeLYU78N/O9NXCgT+jjonqBU9pItaK40loVsdJtpLDJ+q9jsncHzkeDEk+GY
	 Upr+fHlxTcHhvjmRf7AFq2Cdhz+WVz+qO+pQk5DyrVPUSG8qH/9l5FGNxrPJTJd545zoK
	 OuDMZOon6hpHwMMKHZjOB1DX1W6WanIVCX9nNNOYZnMQub2KSI2nku+d9nri9TZ/zid+t
	 iY3zHTJEiD49AUqDi50gBO6I2pPwmikcf7Q2N4VvFyPd53vGDTLi/jN+Sf3zqF4asEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/6NoteO";
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0CE6082BDB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD0CE6082BDB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/6NoteO
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8a089dfee18so942546b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964635; x=1794569435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
        b=E/6NoteO9iLfm/5PXHp2QQxvMql2vgayNbxfbO2AiKpDOIPQaWhANkFbiWMKDuAg2y
         6lssST8pwp7ubLMzxG93KATVMwNlh0mYwyCGanpdZAQ5w/mC64fV79M0xp7eYptjWg6J
         cXozeiezUgYDJ5iDnoKmAV9dkwolEcpKmH18KjXGM2jJn0ttX30ZojaqunASOJa/EZpi
         9YVX6hnHfyED/ViGVPw9v7VeM9vWm7glnu71MXmRVizzDZiLbgPrRP8ByzKiJikNpHq9
         EG359J5AHs77Ar5agp1AyB3lFxN29NpjSkJdIeEDsHoCSow8D58rlucjBX2ZvBrHH5aI
         FPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964635; x=1794569435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
        b=LAFt+lvsZ93C3lurtMSJaaEXgkJsVMGYqrfgXPXMXv29V0C6wgAR+rCe4Q2qTgHAzh
         1azwEnpgwrNPYBtDDZ0YFteGj4TzwHrX677gQOAJHSTN98HIjPsYbNNh4T32kO49kMnT
         MtPKCziGmKNrhZZu9G0q/Ko77k+hzgrZzJTfYoLYVoMA+l5TrfFBUC/8idM/QdGZHRtr
         ssQ3mhUYiS1Hm/NHAEPszSPBr2u83b9uFV55U0Fh6sG1pV+WUTQSO+xtvlZDkiW+VZQm
         yx+B+sSWWyvhK52fR+m4lTpBJaWYrNmnuxH1tUkzWgA2O5mUV8V0VPxve08QoWOzdrvJ
         Ngsw==
X-Forwarded-Encrypted: i=1; AKwUvByLzmUfVpZ1oNRemkZcr+3Wh93dZqiEyWfEAfpt3P5r5EqftKGYq8oTUZxaHu9WAI7j8i/U71AzTrhnop8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/XRPZD8s7zuDJS6SaHJJFmzkOM+0U+b4v2GW2RZqZpuhREnNt
	LFYP3tkBGTkgWxAGzE4ecUjI9DQHsaKPy5CsACtySrNE69O3Ey57Xl79
X-Gm-Gg: AYBFou0uQI+bRQ9pZg5iTvrzWNEAxGETviwJoYidP8OgxMo5u+A5VkxJbsnQ3Tv8XeI
	1z0pk5Yh9h7UZFuWj3kc7DABQyyeuuyarPSXOKRemRZkrFJukqZ6aEJJ1P4JU49QfqbK2a+JdF4
	cnQF+3LHCxJtGRPJLhD6OVGg2B8iKm+bTNv4GVJAj04i5x2TICk93C0FxJGO19izIa9tdzQga0l
	nHdbCA1YDsFfJ56Jx2LZ1+VUWb9Ufyca5zSLt4TzXrkwFahnNnjewhrtYvhxpAQKsXTYzmSfL0P
	splEzJH10+tVO3AL6fqNxdawPUhc7je7AX6/RxKIi6u6BENNESGWWGHAaqV7r9FBM+7wZNV3Khi
	y0RcFN9cOInTvZl252nFPrK+KbacMzuI7hAnBdUX7lLTkOn6EMzuWqg/X3NWOFvbzvDV2UCG+Ng
	PWxxLFImBfkskHVSngxfvmcOBR8RfhPi4YPW/p5ggVBXWYnmG8OcHeLtDvZE2fccfneWwI828VW
	opIk1DHPyFjRkyk9/DXuGY25tvDl3rTyO4sh6Nj3q7tZL/xkqtXJPuu3WuZul2pu++UECQEL4B2
	o5F44DjJ5c8INHl6ruBmu0p6RJKEE0rz2YLBvoh9IE5DQYNwf6uiPerjhVevFBR8XxMYD2AjjWQ
	5e9l+STrg3VYGx1YtBjn9Yy5yuwWCQC0FNpYTwUtpiUrk
X-Received: by 2002:a05:6a20:430c:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3eb985175f6mr4148228637.22.1793964635163;
        Fri, 06 Nov 2026 03:30:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:34 -0800 (PST)
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
Subject: [PATCH 4/5] ASoC: dwc: Fix DMA fifo_size calculation
Date: Fri,  6 Nov 2026 18:29:39 +0700
Message-ID: <20261106112940.53550-5-phucduc.bui@gmail.com>
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

fifo_size should be the FIFO size in bytes (depth * width / 8), but
the code shifts by 8 instead of 3. For capture the parentheses also
make it always 0.

Use depth * width / 8 for both directions.

Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 0de7bcb2d0c5..1ff5b6f8864d 100644
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

