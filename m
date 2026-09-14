Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F373E3D86
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370979; cv=none; b=eZOi1gYLXK2JRyhzZg6t5glq0CobnKixBUuSi8sWKLdsEWCs7AenEeqkSBHY4F1MEPuHagK6RSuTzcL7P3G1vBuMRdNnYC9QuEhN25m19mfJERtkDXui2lrlBGzTyDMDs1cHXPneFzPorUYowYyE+bOEDAVBEwNRbHym0xeJ32E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370979; c=relaxed/simple;
	bh=Wfj7ayzlWfEu+I8dT6gg9Qx37En8fvuHsBJbQGPJEIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjUwf69AtyMvix+D7PhkDes/ReSkMwLJlir2XAVTEqGVN7K7XvQefnLcbhlBqRJ6R2tsXVgMYNT79sLQ79mcqsG6Z9A6begvsnKauPcl0J4tXKPLIHo8H8XCuI2Je5JV2PvJqZ6HJ+Ghw5a01TdNcK6Yy6+KysvBNyUAxkMuKo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJixNnUh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJixNnUh"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747ed9866so19433535ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370977; x=1789975777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=bJixNnUhQU9qsiIhlXMyzCCSczuXh/iQR+x6t6UZBagv7+bb00k6CCCVnk6mO7vuXL
         Da83jzK57wTJGycD1PYr07WeqY/LHSIPujGEDZK9meZYNNbYAeWjbK5IayCRoUiIs4c5
         P6gA26Bpp8Y82cNoJ4hqf9Xybi1dpc0zE5baur3fs3mLEBoxoKqpMwkjWjDwSdEVhj12
         Y5eu0NO6agQ4lBjgBJ3G3tFpItUQQkPvAAVODG500p2AgQxnZoA6hyqvhI2umOUj1p3s
         StiFWq2wvy3nGAI80xwh3rnaSfUx6e42H9/9nTDDRyLt/KTuRKuI1l9ER/a3doIqjU1Z
         3TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370977; x=1789975777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=CjhsIZuawqDx11LRqpwyJBxAUWJD7q+ll8QeGoFhpOaEgAZLWXTDR+8MqLN14to7TQ
         NElPlrxWczB+orj9aud29LSuciD3JEvv76x0NExMHS3U78Jrz1JDpHNooHP/qbXKNo+B
         XLNo2CblFbF5kTWayen4049NGUvbLEvuZBMo2KsPWIPM6cfzrTEUcr074q3ihJTPCN2A
         wd1nLxNv633Bq0X1wekOFLhK+oAE9xyjhgk3YzJz4araARdpcfaGh4yYu0kHLYdcD79v
         k6oaeI1iaMyG709SKvCgV4g8HoHdd8dQl+PGiF94sKvskB46ffQOY9JQnmfuiL4khbbn
         6MQg==
X-Forwarded-Encrypted: i=1; AKwUvBz0672szWiLtYlAo9WJ9BiXptLHvvBKJ2wRWJ3KVRJQOU+CbIYmPRuWKTEjMNmSEuhqAYGMkyVgG1kdFEM=@vger.kernel.org
X-Gm-Message-State: AFuF++m9Ik+qwoaKeD7E5tCBCPf+Ao4QXe2pgv2gQwAZrki26YcrBFC5
	d4YAj0Emr7mFrFCf56COoX4I3qxZBoS++0np11uSnzaGq3J8tcK4NckR
X-Gm-Gg: AYBFou2/Y7Xby437e/p5Cu0I/v1C8GpIWQ+bIA4ivjQLQWv8QG7qrdnCXTv2ej0jYj4
	msp8p8vq/xNkoA1KRrxZxRSB1CQawWkqvoho3DNqNGDvzvdK1pUA898zkvX9rPQREwvYKyxfQ4L
	vAFpc9f8ET60rKsJ5pdJ8rn9oKSgd1bnoPFom9ioCDCMVsH1/j+30ZZ4sk4asu4l2Pi5HSB+igO
	dIgnByNg7xokjeg95E8teNgZM4Z3B0CcJfg1b7uOgW0vcKYRdcK1Gr8R+jXYxIBXnPiSedNnU5I
	LkHaKWmu4IhOn7yVLmeemYimHDxbQk110oyXxm6uIENwTaZOwdXGoIm/MZpw6hyTf39JdJYpcp4
	k6O5VFzqhYSlI022+QkYh2FuLdttRBak2UVvHfvzaq8bFlFijsTapJEVfijbpj21J9imSV+TjIn
	GfuUTjXPmz6Z5rlXGjrNfKXhb09PIprY4nnZoz+2w6iSOfOlV0DXm1WZvQXJNpuw4dj3mKw+YaV
	qTNpYDv2tgdmOHzhcMp9BbfIKzofyocPeMa6chq4ALaO2TeGbFa7qBM/Cdp4yfeVpIMCm6sGzBE
	BE4TyaemFUxFc/8=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3027132a91.12.1789370976645;
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
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
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Mon, 14 Sep 2026 14:28:38 +0700
Message-ID: <20260914072842.24420-10-phucduc.bui@gmail.com>
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

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0

