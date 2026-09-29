Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56D23FCB3A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662318; cv=none; b=fUmilg4GQc56N3/KvGJounq9oMvmmkEiMDNWhfKBdkNOVY8bou0hTpwGu062ID/zLJFbhZ7zJRLT/kjZL0VR29yFHRqzO3Y9IuJ2Sm4DgetIEBuyqsrDuJ7K2Sx9coJY6lgo2vWUJmkOGg8Jf4ePkFSAF7aI6mVlkqzHxOSRL1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662318; c=relaxed/simple;
	bh=jUullrU4N9AggHAvqMkl01+RfK+cE86lECTdKH7+y4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q9NXWG3JhXM0+r1A1liS/ydEHzE+gFCpTxZQsny8QFQQx5pm0PnIzgh9JxbfzJTVfJA8/eCIE8CPLFKJ0S+3YwI3EHl/91zHPgGGqlT7IPEzjg9717IH4QhDO59f4lsDVqaBCDpRqCi4MJvlBm9eFq+SybXdeCzkrmr1rC3pZR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qw+Ar6sT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qw+Ar6sT"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2083157a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662317; x=1791267117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=qw+Ar6sTlR6kiFuRdNxAPB3cyUmJ1UObEElYaf45xbDjJgBCPw7hM9E79+q67HB+BF
         iGbgNTu6kVE+PbZKQvDO38Xa5Ezzkki9RCb63JpkwBV3OYtzxkMeYlHNEKnTFtc4wTNW
         SZQFEsQYu0d7LXDtWwIZIfT3j3Imu8zjxm8CKzxtoOf+knO0NnDMeaUQa2WDXckTmvNe
         V6laKp6oUKd44d2iC1cDL7pib+sQ9SmCGvzQTlUHbPjl2Kv1LOea6nCDSuIhnKETVOuQ
         UEfcbSVO1BL8phm7sCZzDHdHH3SQ7vvhwLCpfVC4vV97bLsDtYBXcQIiMJZZhFcPfAHf
         BCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662317; x=1791267117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iCVvBPbKtk3VcJreNW7SRJiAXgmB7FAeWV2dOTbxzuc=;
        b=c43WXnBnIwWzIOhyqgDU2sDQ06bh3gYr885Zr4r3edhtBcQ2cItJBWMWLbCjBe1fuK
         zpHOk2vxdYI4TB8glQ85TXVY8gLxD6CrrgeDnT7TOGFJ0J/L8IvRqcd7VvnM5pTJYjnL
         zWprj2d1e36O3iRD+e8dkvRkamxKYyV55ewA6XT8Fa/prxf0ZKv4/1bMXe/5dSguawHt
         39Wp2LXC7avdrd8DpzBjaeScTuBIdWedfsK2WM3aSRECSTajzaTrC9RovklUHwToLUxt
         DrwWriQ6poXa/yq412hbezc5GmWnDYfONkdtmqvgHjzuEZFuz9QvM+ezt1V/lOkIlTei
         gcuw==
X-Forwarded-Encrypted: i=1; AKwUvBw/NjNOGX3JVlyNdwNSx40bDt4Qfn43aRUg+1Dkbt80xbzJgkV3yQzwNg+ik7Xl5tiLQLXlWJTyc2EqVEA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoOL3Def2EB/1Jkjaza5Ywa6+Q4aZnpCXfF8A3da50gVJQ22FG
	a44Wl55dhoVDhEqRbKo4IAnAtnu0wR4aMcrtz9dkUP3vTwtLqu1i71z+
X-Gm-Gg: AYBFou1wgHfChNfrRGuynCpDU3AOaAi7tJb0rUdjFmo1tDOvXPG6uFZ4ZVWBWVzHVRH
	VkEjjlYIMcSicduZfoCCCQDn145ceRowL9tcPDFd7OKFtpZ0N99bsFPxh64vTG8h98s5XUXzB/H
	3GYd51YloMyyzovPLYUKvveDur6Gx/QS3j6QVJSzInZlzidkZ5z2Yal2JdumP1q/R+TZ3s/8mxQ
	p6z3X/STfwTEHGXNbTZ6p9nuzhJrhrwM03IQRIOOmcEzkdvdL7484x92uLyLVSwHpFvRp2GddPz
	ey2H6pvPQI000XKpTSz59IX7M0n0dAOyg/ifo0lw+m9LTnxsr2w1YILCbWDjAr9jO/SHcsWmgl0
	EfxA2S/Slk30L+jWHGce8GobNmTOnR2MvXR+c71khChNipgSkznmEjDPeiRFUTfacSeWK81DSvI
	cgkD1vyXqN6bt7cqrMMIcVqn0Iio4rPwmsTi0M3VKVEIWWrNpTECJYc63AL9XXyrWBKA/Ebtpux
	LtEnd6RyEo/QxYRHRQES4C9tSCehK8NE4KTiakcKJOL5nQdQy/zEUQhF/rrMIZN/jX4AvbnjFOr
	wMNOd9pvvNMyV9bzubGfKdw3
X-Received: by 2002:a17:90b:3a4d:b0:3a4:9ba1:94fb with SMTP id 98e67ed59e1d1-3a49ba1ad2emr1589587a91.52.1790662316829;
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:11:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/10] ASoC: mediatek: mt8196: fix APLL mux error handling
Date: Tue, 29 Sep 2026 13:11:12 +0700
Message-ID: <20260929061121.124001-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from clock operations in the enable path and clean up
previously enabled clocks when a later operation fails.

For the disable path, continue disabling all clocks even if a clock
operation fails. Do not propagate the errors so that the disable path
can perform as much cleanup as possible.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 56 +++++++++++++---------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 286e39f53ae0..91ae44024949 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -220,33 +220,39 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
 					      MT8196_AUD_ENG1_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng1;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng1;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng1:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+				MT8196_AFE_26M);
+err_disable_eng1:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -268,33 +274,39 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
 					      MT8196_AUD_ENG2_CLK);
 		if (ret)
-			return ret;
+			goto err_disable_eng2;
 
 		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 		if (ret)
-			return ret;
+			goto err_restore_eng2;
 
 		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
 					      apll_rate);
 		if (ret)
-			return ret;
+			goto err_disable_audio_h;
 	} else {
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
 
-		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
-					      MT8196_AFE_26M);
-		if (ret)
-			return ret;
+		mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					MT8196_AFE_26M);
 
 		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
 	}
 
 	return 0;
+
+err_disable_audio_h:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+err_restore_eng2:
+	mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+				MT8196_AFE_26M);
+err_disable_eng2:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+	return ret;
 }
 
 int mt8196_apll1_enable(struct mtk_base_afe *afe)
-- 
2.43.0

