Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F163DDAE1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370996; cv=none; b=kuQexmoERlP6jLHCDLn33gxUvjP4RP/SyXjRUggDGqeMb/qIvagF27GH/PCrfdcPGvxkDlK/3tSzHp5BntrUtiKB63KgmHw8fZ5wyMB0YnwYJTI4/U6nU7xt399WeE79RfRzD5+6bgAef/9W16Tv6GGk5QvwLh3Ti97moeETrDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370996; c=relaxed/simple;
	bh=HNQ3yAaTj8Lox9L4v2OsrFX6RIoSfJ6hArRWObXN3VU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha/lojyw9amqnbjwsok/YfjZ14WcwHnwkIdF3YfosNeGNltYL/Tq+B5XRxYMphPZoTrVYavdKSx0GQw/xdtGGN7fIDYqHXrEZV/0YXtcrZfQXug7SbtIcTGJIC/jSfiOZ1ffXPKIDeIbzu+zsA689/n36D3cHfpMK/StNE0bAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYfsZik/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYfsZik/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3964e480f76so4091341a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370995; x=1789975795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=lYfsZik/twvSM+UqaiMIjAwr1/XNFn0i3kN/SlgWyse7tgP7VHMBXaogaFrEDWLPFD
         R8Dy8jj0BbC3s5++wkvab2bE4DfdkMu/wn97ivBH/Ovxg8a0kWIYWebmG9mp2U/jm44N
         1wussQPKOClO9yPEJlBUkv5/Rnk3WwSeKMotQ6FVNm0VBuna73i9ggJOx7C2JuMUF5V0
         YGN2Zs1NBebCsz0jZ0JNBJsWdAWSvsIu6k7X4gkcqCmUpIypjrz5xW5rLN+IDZXQKFD0
         eQJXuL5FwxizT7s93O0M7yZr5ZcXvGpLXQJpWRCIHRB/di/ZSqfsZXh+4Y48kX8Uy/ge
         1S7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370995; x=1789975795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlX7uEp+xJt+DRWD58MvDXb25/Cat7Ywclf9fNm7ioc=;
        b=U+efKQEm2iIEot9Wt1ZqM2ovJviOp2sKdohhogzU0dDO2+ZsYGrKK97nMojUddwH52
         ZudbO3mEG2oMSpOIWVwpWuHVpx5jcw1TnbeVUVZvOZ0qCQTQVb4TDEiF8E7OgSpLgSd0
         GBmHfVtLwcP/pSQHs98gRw7rH5DChk1ehipaTed8j0cJl9y03KrliKxiHpCzt0DKhVQT
         eZliM36fwyjM0APBmosjiEh3sRaS6L1CHlDpNF+PoFvXJoX12U6p2hwM4T0zLO12IwYj
         BVS+EdZzxD7YgAe2j/wtcxvLcNAvBbQmHeBH9TAQB6+IGFWrYUuffEnzA9tAHgh0qpZS
         r9vA==
X-Forwarded-Encrypted: i=1; AKwUvBxQxsh7fC3xQ36KRiBZAc55olcSEcOIbXl0PZx/8a0u7xhVtKJHthTCtie/M1NF6tXa2LLx/t0XDKEROcw=@vger.kernel.org
X-Gm-Message-State: AFuF++nbPwd3N+IusREE87Z6Pi76EpETDUKMWa+vBNwqXpZkIoxCsK3G
	0thcSAWK89bBPg9XsMtk8goBIkMfOPQIA4mHIgkjUdXlTd/idbrxCIREmIxtbQ==
X-Gm-Gg: AYBFou1w1Ln4wwuAGNpFNnI/nBMX7rw7/BIjLZi3XfkYQxrAlG7IFZ9+lIZMXo8MJ83
	np1hPPqiElzwMSpGFbpUA62xilT24zNe1PdV3G5ijBhxjJq9AMQatSIhLjT3QmYK6RpptJE5jPi
	r1qIZZnAeYV6LQtLcK19xbIczlgmkEGYZUU1oueElOGT56LKEsNX1PhUEDaaKNwfr10fmJ+8jbT
	hNV25XoI1ngsQ9Kv0b+5UgEf1cIwq2W7YiBLIGCnKNtLcECB+7G8QGDVxrEYh7lx0tX1Y3D2TGC
	BPEmYVq25Qxw03FTb8Om2FO8PG9kK7tmKH+mA6eiEF269TEozBlKTHj8FSgmDAiqHzWGTgWgokK
	VD/xr5E8m1tm8NowA3R8PQ4mfYlF3NQyh8snEHleDuzwh4rtnsmSn5uuh3W14DxR9qe8x0E6M9w
	90D7kaMCwqx7Xco/YcYSqW6PWAsxy+x+f13pURHsiiivLZurutEAC2rXicxRc5g3XCtHqpMw/2n
	S6XLl8atkyDYS4tkPuOV3nPq9AHGPRSjO3/PRTJox7SciRgdRJ5LvYZdjMm6zdOQFacNcfpsxb3
	CStiHOdyyO94N1jr3g/ivR26Ow==
X-Received: by 2002:a17:90b:3884:b0:396:6344:3b63 with SMTP id 98e67ed59e1d1-39debf6ce65mr3151063a91.2.1789370994682;
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:54 -0700 (PDT)
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
Subject: [PATCH v2 13/13] ASoC: mediatek: mt8189: Validate TDM MCLK frequency
Date: Mon, 14 Sep 2026 14:28:42 +0700
Message-ID: <20260914072842.24420-14-phucduc.bui@gmail.com>
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

mtk_dai_tdm_cal_mclk() accepts zero or negative frequencies.
Reject invalid frequencies before configuring the TDM clock.

Fixes: 9f202872ba04 ("ASoC: mediatek: mt8189: support TDM in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-tdm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
index 1b51027c6cf4..7748b4ff2c72 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-tdm.c
@@ -381,6 +381,9 @@ static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
 	int apll;
 	int apll_rate;
 
+	if (freq <= 0)
+		return -EINVAL;
+
 	apll = mt8189_get_apll_by_rate(afe, freq);
 	apll_rate = mt8189_get_apll_rate(afe, apll);
 
-- 
2.43.0

