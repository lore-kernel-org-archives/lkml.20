Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF43890EC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412357; cv=none; b=EPWhAaGYgr+O95DHyhNf+Xww6SAVRCCFcQvBPy+KEA/M8E7fJcCwRGhfxTJV1Wo68i/0GDkLRt3CvZYV4ARTnOXR4KCoCyA4U64wOF7K+3nhafpJevicfUHzxh+x+T47kP8PfdNc1AHjf3EYxiR8I3Z/8sok4w2vlOVAJ//cNww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412357; c=relaxed/simple;
	bh=57WzuTndarJ7qPiYwu6aU9mNYVkBNYV5ZI02Raa7014=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGvACQoYlOwSO4I3yQWN8FF92wvnN5xjZFkaCnRTe/Icw2A4WxJgUcR+wph9/BucUzk+Z+cw0H7NakWHa/G6IYQ+cSHJgV0WM7AJwQLZZRk5MavG5rdBdcBZfrTOeljs9pckBwr64YOQ7T9N4Of1OyMzwfLjp1d3aELb/3CNroA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fjkbw8WG; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fjkbw8WG"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so1766941a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412355; x=1789017155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=Fjkbw8WGsNJ5twUSwmsaP8oJ1iZ3S20DFcaBFTd+eDYNAQ3BpG2jQaKxKS4DmxUd82
         fuHQ1dwHnaaiyVhC5Z0VqTI5g6KQyCoJbH5oFd6l/ZD6GSE3YSZirBh3f54uu4o20/CK
         3QnA8PSCbx0LMoO8TLx2WYzs+IZzCv8eMsnXssId+Xrg5hTD3BX5Jc2tBl2daYilDdo+
         nUW/NtWzzbbUG/HjRF6GTJvU6Z7wNXN3iZ/dvJC6Tx9S+WJnU0jw8KMWB1/iuEbCuLn1
         l2NaxhXc/LjzrDJCmS8eqWZ1YUu/3Lzouzqi9gX9Cn3xgHvG9sX1gSBZA4Y9RwLsqcHX
         PPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412355; x=1789017155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dEPYMs3oUZAAKTHc6QxaYvJkApkADKiVPKec4AR+Oag=;
        b=CRoNgB/CPiXIp3ier8z7l5IGJIpWjnHRJKV2djxnImpo9jVR3PzNXFJDAFvPZEIogt
         RHMklBPql8Ee24EuA5wzeWtAYJdCUyTJM+O31rf4+pg9x2O8wuXMhY3O82DEFf0Vpbpl
         TKv6/qUmkvfrctZVJmpIVaglK98+h8XgHYnBDNLzBWW9mxBIaFBj0g501VZEQqdGydNc
         M4Ic3j0X4wrB2pAaYi/Sna293QpW56J/gSpjkpVcoX+9YhQMvaPT6hj6jrgX6UcWyx+x
         BIL/HtRuuxclBxHSsDD1fwSQBJiqpH1JkF28lzxrt0hDfpsin5QvPGnqk0cZoscK/g/V
         BK2w==
X-Forwarded-Encrypted: i=1; AKwUvBzyTqHNxKB5dJX9YXbnEYhN3jbkxmg69tuT3/7m4yudHyrVgWvsLVwQ4Lm0VJNcAixHJaA0iK61aVUepfE=@vger.kernel.org
X-Gm-Message-State: AFuF++lrWhnQzuK1w2gzqMEoMVPpfhqeFXeogrC1mu27wjeFW77xOVAi
	6jodYfE0EICWIQuiUZVOU8ZQAkV4S+lZSgREvJOGrB7uSQ+ggIsLzWtOgHzndQ==
X-Gm-Gg: AYBFou0u1SrWdY1f8OyO9NKyGwo8dGq+ntjEmRHDVEUp3s406wwo1tM7ivbTIipC7mT
	1s68/HpUSaOtH0TzagxInPc4sM4UPLW8XGJ4SMotsm91Fc5BCUjDktI2lN0b96YOqWZbSER/pPY
	5X5guDWTJdkSWIdxt8rImRN0e5e5UQ97k5SP51fNY7DV7BFNH2PYw5viogFDI50l9rETbahu7IV
	pxifQ3EfBSsvu4Mm/Zc/9mDSD31l01S8xiFuDjtK4wM127lKWi7u6JoOVYoYntRtgdpFYeoQJbX
	3tJ6/Fu9V2Ju3r5n/VTrXM1zmku03t4UUfi50yEpwolGgHFL5jyRYYiCUjWqyLcfj7vVavfbT8z
	AFR9Mhi7AywnrAGCwhQID6GhBZRatiUR3acBL4e91MLdQnMpLP4KKZGxpIJK3/f5HgxSadVUL0G
	JLCmxLIqNvlKodLKOFkwVMJ4/hkTRbxdSDYx/IKkZZBlJM9rs2gf701Oo8PniaEG2vbNF+IlAoY
	ZCKRiENoUXfM5N4OX5QJWk3M9LNA7Wy1MCIhsV0dspLSBYtdEltuzwWrOCGusly3n/to3St8ZbZ
	jTKu
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr14551384a91.3.1788412355201;
        Wed, 02 Sep 2026 22:12:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 6/8] ASoC: mediatek: mt8186: Fix gpio rollback on adda dl/ul partial failure
Date: Thu,  3 Sep 2026 12:11:48 +0700
Message-ID: <20260903051150.178057-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

If the second mt8186_afe_gpio_select() call in adda_dl()/adda_ul() fails,
the first one's state is left applied, leaving CLK/DAT in an inconsistent
state. Roll back the first select on failure.

Also fix a copy-pasted "CLK ON" debug message that should say "CLK OFF"
in the _dl disable path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index aced8e7e920c..1cff2a63ef37 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -143,6 +143,7 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MOSI DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 			return ret;
 		}
 	} else {
@@ -154,7 +155,8 @@ static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
 
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
 		if (ret) {
-			dev_dbg(dev, "%s(), MOSI CLK ON select fail!\n", __func__);
+			dev_dbg(dev, "%s(), MOSI CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
 			return ret;
 		}
 	}
@@ -176,6 +178,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO DAT ON select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 			return ret;
 		}
 	} else {
@@ -188,6 +191,7 @@ static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
 		ret = mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
 		if (ret) {
 			dev_dbg(dev, "%s(), MISO CLK OFF select fail!\n", __func__);
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
 			return ret;
 		}
 	}
-- 
2.43.0

