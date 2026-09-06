Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D33B4EAA;
	Sun,  6 Sep 2026 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666176; cv=none; b=WtmUV/RZmFPhMNPHNEEjF7ITLCc27ZBWIKJjvPQ4Mk0elcpnqIiPtgf1iHB3zLfmfjhm7EEkz48KgV9Vh9CPfmCOKjhXleSDySQi24xxUkWklMHFs0lAa0JmGSU8NKB/W0CSHAH0YZiTwcKrxaiGZOW+2ZdXGGVbnSUpoIzIFDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666176; c=relaxed/simple;
	bh=DOeWyJMzXyG6jGHRHcecb59OxDE7TJ8NjPd92F3WIJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UCxLADFDdPPUuUpuQx+cuLcvcZBEr+kZm5yEId95eNPy2XB9LMNpgjf/YJQLlYGhNyRHZfMPHPhYJg1YOv69OrkLz0k+ysnAHbZoWNwX0dWv8BZG6EBEYGz8jl/96+X4kCl6t4rBcF3KVboRUqts6vRK+70VjpD7059Xd8ybSHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=XezBuUIG; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="XezBuUIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=IT
	x7EHEWhUrrcEy2ObQkx0w/GoQw9+AOi/0OWQZeUdo=; b=XezBuUIGvLSe6cQ7cw
	PPxAKFvfYZV6yEyi/00e7brnsiTCNTUmeqaxBbHyGnXBroDtcSF3lxq4UVnSb9+A
	YjYN1U2ALZDj0fMI7ALAzVhEgUh17ixZp4wNF3v3K91ZyDSlRlxrPV25TCKZrHWI
	+MfDIinbXYDG8nEndZAlIxNEc=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXHxcb4Zxq8PnERA--.33810S3;
	Sun, 06 Sep 2026 11:42:21 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	David Yang <yangxiaohua@everest-semi.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: es8326: report resume restore errors
Date: Sun,  6 Sep 2026 11:42:14 +0800
Message-ID: <20260906034217.85696-2-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXHxcb4Zxq8PnERA--.33810S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW8tw4Utry7ZF4UZw1xAFb_yoW8CFWxpF
	WayFW5tr10qr4fAayYyay8AFn5Jr93tF13Aa4UZ392vr15Jr1fG3Z8GFZ0vF98ZryfWFsr
	AFWUJ348uF18JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UN4SwUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R1BCmqc4R2v3QAA3D

es8326_resume() ignores the status-register read, the direct clock-state
write and the register-cache replay. A read failure can also leave reg
uninitialized before it selects the reset path, and a cache failure is
followed by jack IRQ processing.

Return these errors before later resume work. The ASoC component wrapper
reports the callback failure while retaining its best-effort resume
contract.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 5c439937775d ("ASoC: codecs: add support for ES8326")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/es8326.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index c5460589a88b..ab0280b06e5c 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1118,18 +1118,28 @@ static int es8326_resume(struct snd_soc_component *component)
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 	unsigned int reg;
+	int ret;
 
 	regcache_cache_only(es8326->regmap, false);
 	regcache_cache_bypass(es8326->regmap, true);
-	regmap_read(es8326->regmap, ES8326_CLK_RESAMPLE, &reg);
+	ret = regmap_read(es8326->regmap, ES8326_CLK_RESAMPLE, &reg);
 	regcache_cache_bypass(es8326->regmap, false);
+	if (ret)
+		return ret;
+
 	/* reset internal clock state */
-	if (reg == 0x05)
-		regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_ON);
-	else
+	if (reg == 0x05) {
+		ret = regmap_write(es8326->regmap, ES8326_CLK_CTL,
+				   ES8326_CLK_ON);
+		if (ret)
+			return ret;
+	} else {
 		es8326_init(component);
+	}
 
-	regcache_sync(es8326->regmap);
+	ret = regcache_sync(es8326->regmap);
+	if (ret)
+		return ret;
 
 	es8326_irq(es8326->irq, es8326);
 	return 0;
-- 
2.50.1 (Apple Git-155)

