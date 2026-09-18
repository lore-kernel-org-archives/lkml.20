Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E0E5172CC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738859; cv=none; b=Vk6oruwgxp7dPYrBVcS9t4lsc+bQDVA9p2PP3OAK79eIrK0qgLpVSuacr889fu57+anZ3Ql9zQ0XrS2zS3L4pOj/+Ew3JsCap8vY/24QdbppHn0Gy4h+jxSuCfNT6hufi8EtagjT3HVRGZQ0DktbcOn71cmX1Tpm1YSW6QdC0L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738859; c=relaxed/simple;
	bh=GNGNIrC4ZR1bsnFxd4Y9nTX3VMaDT+bQeH8lbriz1X0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r3CxSZGpXtp9jQTkFIY2lr3x46EWx9DtVsR+kDonbFCDAeJdmRrUACk5MVdkYi01p+cnYihmSmjbRs0mlRQxGszuuiJL8EwQmh/boBYVvu9tv2vdwM2LZLf0ItmlAgY4Dpg70lS69NBVR8lKJVX0yWui0uy/F2uvCkVjWFS7xM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMxuhM+A; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMxuhM+A"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398cb5615deso828664a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738855; x=1790343655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=;
        b=EMxuhM+AoTnleJ/82eqgpYNNiDm8vJsTHeYx6YVZEc7aFYDSxOzp2s5QTc2CIzIMtt
         iAAksvs8EQ+WMYtUiewclSzLmAZ1EB74dh/bgwM4u+xocDrpaSOKAVFvUnlrbam91qS/
         OTnnmvj+tx/GJYG2iAt/IEpp8tE/LC9lnzteC6LujUL3O4kSY1lDexnxq0GOextiBqgo
         Xh8huYpmzkq2BoPJKb9Vhq5FLXNOB1qE2ZkGFIzTGwQqGze5hCIf1iCAITCePScb2/wT
         NaA8J8L+zm8A1N1xmcqKJceiZKMBsiGk59qZvTqsROoeKEv/58utYjPrINbX5S8CiXcs
         7DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738855; x=1790343655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LClDxrITmybPw/RDvdGi/ZCnnnT6FM/8jbV0TZBMMY=;
        b=m1XN4mvTJgzCmlmuo5Wo9V1FJGb9YpZo61uFBT2gw2QnM4nK6P55VDmJzcvI2K31pJ
         NkEuOg2ivoiEzL0NxfZIN7MaxjKqFZwLIM8YgWb6N76nq8zU0c+bkX6y27mq0PvitYxs
         wzmHtH147e0Z015bCXBN7fftsafPbHg9QRXCNBFrGInmj2p4bifH7dlqz9+iZD4TkXDY
         4H0e9ScLvOZr4M9UTmmXJ0TqaxrdaPO4DXK/y3fVAVvfAWR9CPDMusyygodHNygzBsQw
         QtgIko9lTIJ/pqsZAh5fwUl/tFOeZXJewwhH3BKFn9hFPDrpXMR6qUME6iL5OSdvU76G
         aZcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuxhLd+yYpIoyRRBxoWyt57VHYFzv8eVu3KeEsnU0+eE7DQn3QvtUw+gJtevz9SaM3C886wG8Aq9gL0Ss=@vger.kernel.org
X-Gm-Message-State: AFuF++luZ5vl8D3r1J/qYMEoIw3RbaBKSccYfwhUdW/+x6JWL5kAHMuc
	SSY8ssGeqTvuRndj722qVEFLLlCRQFwOQBBRLb5rR3q6wz8ao7iZoYlf
X-Gm-Gg: AYBFou3e2hX7b+eOt99rXMJy0yfEsf7tqciProp69D80rSGuXVA/ed9O163ndxrS5wX
	KMeM3gL0WWLqZ90/NcGyUYY+mMNiUbDU+S+N4fu1SUgXUyhTW3SYwHB76RvIr/wQgyZ2YSaEEs9
	wqDd1tcde3Ky2rsuLhPO6WJ5liAVi/q8k+CuC3octZAnrGBYNEa0GdY+1uUUOuvYKR1+r6+fqZZ
	c/wzR24ghc/89P1gRjmnc1rRGfApqHP+tAdb0Vx1uRHsnA4UBp/BFZROZ9dYqLjtFk1w7QZCTqA
	bIwLHFAqk9D0zaD96Ha3jN2uWbvChRHpvfqL216h3miHvIaJCWQGzca50Yxz149flCOwooNqub9
	QQUjGc2z3bv/Hxp75qpoeSM3wif6kNU0s/5ad8v1X+C7Vr2Lf/dqLcQRAq0zpBZXzFz77x/tyuP
	JPP49YJFexmJN0cPTpafmW2mlgRfxAKomXxCw9m7fB9SxsMAL1EzjrKW/y4j2T8jbo7N/ryirZn
	VQm1OyD3LmEVr4qcjxm5IhdNH2DoPy2cYGPqT5o0Aqno7H2f+A4hpnFMlW8iM6bk80Tb/vDep2k
	uxVea6+3tS+4UQ==
X-Received: by 2002:a17:90b:53c4:b0:39e:d2a:e2dc with SMTP id 98e67ed59e1d1-39e54d1ea4dmr6218148a91.12.1789738855077;
        Fri, 18 Sep 2026 06:40:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 15/15] ASoC: mediatek: mt8192-mt6359: Fix error handling in MTKAIF calibration
Date: Fri, 18 Sep 2026 20:39:11 +0700
Message-ID: <20260918133912.133799-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8192_mt6359_mtkaif_calibration() ignored the return values of
pm_runtime_get_sync() and mt8192_afe_gpio_request(), which could
leave PM runtime references or GPIO state unbalanced on failure.

Switch to pm_runtime_resume_and_get(), check each GPIO request,
and unwind on error.

Fixes: 18b13ff23fab ("ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 37 +++++++++++++------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index c86348691641..b010726e9b57 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -163,12 +163,23 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	int chosen_phase_1, chosen_phase_2, chosen_phase_3;
 	int counter;
 	int mtkaif_calib_ok;
+	int ret = 0;
 
-	pm_runtime_get_sync(afe->dev);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 1);
-	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 0);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret < 0)
+		return ret;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
+	if (ret)
+		goto err_pm_put;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
+	if (ret)
+		goto err_disable_adda_1;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 1);
+	if (ret)
+		goto err_disable_adda_0;
+	ret = mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34, 0);
+	if (ret)
+		goto err_disable_adda_ch34_1;
 
 	mt6359_mtkaif_calibration_enable(cmpnt_codec);
 
@@ -289,10 +300,14 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 
 	mt6359_mtkaif_calibration_disable(cmpnt_codec);
 
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
-	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 1);
 	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 0);
+err_disable_adda_ch34_1:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 1);
+err_disable_adda_0:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 0);
+err_disable_adda_1:
+	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA, 1);
+err_pm_put:
 	pm_runtime_put(afe->dev);
 
 	dev_dbg(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
@@ -301,7 +316,7 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 		afe_priv->mtkaif_chosen_phase[1],
 		afe_priv->mtkaif_chosen_phase[2]);
 
-	return 0;
+	return ret;
 }
 
 static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
@@ -319,9 +334,7 @@ static int mt8192_mt6359_init(struct snd_soc_pcm_runtime *rtd)
 	afe_priv->mtkaif_protocol = MTKAIF_PROTOCOL_2_CLK_P2;
 
 	/* mtkaif calibration */
-	mt8192_mt6359_mtkaif_calibration(rtd);
-
-	return 0;
+	return mt8192_mt6359_mtkaif_calibration(rtd);
 }
 
 static int mt8192_rt5682_init(struct snd_soc_pcm_runtime *rtd)
-- 
2.43.0

