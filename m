Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100C853A89F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059198; cv=none; b=d92g2X8CVl6dBdMt0MypjGlyzR7+r8snzNeXy+gOIi9NUoxBPHx46loVQePMyJ4C6eLGEAmCsIw6wWwu5NQ9FibzVR0KbTyWpjZ3OMzowSWCFYJAdspJqWikfj1smmaUJWCXDRP6MIZzaikSOQoia3QgbJ7j++HEZvdfVrajyZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059198; c=relaxed/simple;
	bh=wqcq+a1rbMjwFIMLC4EQzXyafBuwkfuAZlwtlu33Leg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPRkMgp20E26hnjdOdex7u/9sRXuyaPZemFjlm027tKOFyz7Tgw1HtD0ZtW5UevlGI9NSziX8gsFDJMDbGx+5ow3EqfPX2Vlk58+rTqGjJURlAfDF06+q4xHZjyGficaUaJCh+66+SDPaDa17HfQ8jvOaE7QzpenJmcZ0Q3zQcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1Pss/qx; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1Pss/qx"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-86927f9ba4dso1573120b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059192; x=1789663992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=H1Pss/qxh2pLx08eL9IkTeoTtMVY5qWfL2bS+Qr6CPDwDsVcCIjca5qSQrCIP2GOW4
         AeYLw4zsOzyxHlthZr6UPtV+H0xcRkRyskGXTokEtKLjVfCXXcF7249gl4f/FPsx/kUt
         fvNXcWTW03JeVIArlnRcCZauaQFKYskrAezUjuNtoKkXYvnhoTsdARvKxG9BXXwqFoWN
         kh2IXq1N3/9v5kBsVLszT/BhzGM/WtEic8b1PM9fY/+eHkSeWLRFvVklMMGG2orl0EBn
         UC68Z+KZmW7UZKYh5gVB1ApLNqSUt6/uXVOtK1f6sFpQjcbfPwnL8kfv8KuTXQ8nIl9E
         W6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059192; x=1789663992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/vbQHAhPT31Mmibdc9NJTWNHdvmxIIchs3BB/8irg8=;
        b=GIdcpVw+bdSIMczBB04HwAmGYYeRmXyLAOfMopRtBH++dDOoZZ/90smWWp//e+BGH/
         9e4c6tkTRGybHtPbRo2rrHHOS2EBORyEJBrvT0HipESzSWnUTNliSD58SDe4VE9PaE+I
         GEAh0ogq4Rev0EQdeplQK+pY63sdAY7B2/G4cbqnQpCxFezmcPBMbHMuYUf+Bl1GFyOH
         ubLdik9NWGb6Su+l+/ydg1emNoum2N1ErxLPKcTkxQkTGI/7ITuoupkIN+rCIpomiOn8
         KLZe9Mambb7UqImXAtgMdkOPxymHNwtW4l3xjm6kBxfwSHeeghBsCVK/WxsM5Fyp2H1e
         tcyA==
X-Forwarded-Encrypted: i=1; AKwUvBzyw7NtACM500FYR+53aEhC9D3I0xKzN158w9mLlAbyFWWBc+Ytfa4sTMi/CbyK4r7fXIwblcYtq6iA18s=@vger.kernel.org
X-Gm-Message-State: AFuF++lCFM/l2HaxuzuExUPF/qOPbXBsU+jfIYffWWjNSLqihBDpPAFN
	msHLUPMcHp2fHPFZlcOQa+yr9D7qGaq7RUJjKII0N1dt6m7YvDzPr8mm
X-Gm-Gg: AYBFou0bPOmWEQcNAWyUzzKHrNiqXz7h6XOQcs0H8AXqCAI8DFfuudnwzFPrZcpY4oE
	dIZqEoDWzB0OI6Sn9mIa94JBhuXMMblYsqnWGKiVu//GCLXpnu8/800uUusLDqaQTt00lZohvlt
	CSCzaKOVo3hYPmKJJf2ZrQWp8sX/xqmTpUbbp+JO7RNLgEEY+hZpYIe4YxWJ6Ng8Hvr7atfZmJ1
	xol+Ebtj1Tfa5FpS6lCXjQI5AeogIuCABIcDM8cYuJE023xfpZS3FT84Y/v3Dhxn7dki1co2K6S
	XB7M2SijYkeaqZFTzSxrObIlG4dHbPvv5uvKnjUhgwUSzqimgDicDu/rD7ZSBgAlAO/N8xjocTE
	EHKQln4Jw5lJiPa1R6xKvV+ijdC+6q54Se/P+NSP0iycD2LNJKAsKHhW7cQZrOFCiHzgbG7rTrl
	RW3ScDvyCszQE0UCnRc+CXbUG0D1OiRY9FC+ejmr1qh1hg7nadkoi0F1J5LsEutNfxDJBxdiWkY
	84M6dZKPUOU6R14e/efdibS9NNE
X-Received: by 2002:a05:6a00:6d43:b0:869:201b:7386 with SMTP id d2e1a72fcca58-869201b7831mr9536931b3a.1.1789059191831;
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac21sm8425743b3a.55.2026.09.10.09.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:53:11 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: james.lo@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 RESEND] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM comments
Date: Fri, 11 Sep 2026 01:52:53 +0900
Message-ID: <20260910165253.378212-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the obsolete "/* NEED CONFIRM */" comments from the MT8195
configuration. These values were previously confirmed during review,
but the placeholder comments were accidentally left behind.

Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Link to
v1: https://lore.kernel.org/all/20260522134522.368073-1-akkun11.open@gmail.com/
v2: https://lore.kernel.org/all/20260525092437.29313-1-akkun11.open@gmail.com/
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd8582637550..87bcbfa2d5f122 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static const struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
