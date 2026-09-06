Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBBE3B4EBB;
	Sun,  6 Sep 2026 03:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666243; cv=none; b=KHUfkKt8Ldqk3NrMaZpdm+PdP8vNdTyADcoBUj0a3tTje0lvb17N0OoGTc0i+dC0NUPX+XqE0OdWpY9TP+KwbSwKXRG8d2CMB8BcHCGVCAWKnGLmz2zracUPWqDb7D2fyjloZpaD8wu23UWLl976AhHWFOrjUHxmwfzxAoOPans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666243; c=relaxed/simple;
	bh=Sqc5Nt5Y6mdZpLtWzeAEFjoiaZRC7aS+kmfBU7h+ZeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kdysgNhDKPWx2WyB7luhMWQMtRnB4rS3N+XIdxTEJik69cbk/TT2ICn8JFW4AeYj47uiHPoIYgLPRSdSJShqoPkM2OX0Wn/ir0tRHxkoymyegx8gMSx/zVj48tOuMv21ll4ZoMqa4vOCKiHy3sCH65yUapK7j4F57ivQxKhfrWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=cO1Hft9K; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="cO1Hft9K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/K
	QCh4hRoRCWFoROBQhGfLL82E7ChMkoG8GGlYKbyZU=; b=cO1Hft9KOm8pxSNcOy
	WUFFBuiI8xPE6VNgO44BkG6jB9b4jiFsvn7/++67MOHJDAunZudS/FE7N7Ms57O3
	EzkAaKedipyB9+uJ/BKRWhiJryQThqgCNmVi4NLufY125mWQ8Ar0e+oh9MswV/3l
	y4mSlth07BAL3qvms3jdPiXNs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S9;
	Sun, 06 Sep 2026 11:43:29 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] ASoC: wm8978: stop resume after register restore errors
Date: Sun,  6 Sep 2026 11:43:19 +0800
Message-ID: <20260906034321.86080-8-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S9
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw4rCFWDZF4xuF1xKF1DGFg_yoW8Cw1fpF
	Zakrs5Kr1kXw4fZFyayw48ZFWSkFWfCFW5Aay7K348Ar17CF1fur18tF12vFyDJFs8Grn7
	Zr4jva4jk3WrZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlAp5UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgJSG2qc4WLUXQAA3x

wm8978_resume() ignores failures from cache replay, bias restoration and
PLL re-enable. It can therefore continue publishing later resume steps
after the codec restore transaction has already failed.

Return the first negative result from those ordered operations. Treat
the positive "register changed" result from
snd_soc_component_update_bits() as success, as required by the component
resume callback contract. The ASoC wrapper reports failures and retains
best-effort card resume.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0d34e91596ef ("ASoC: add a WM8978 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/wm8978.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index ad8064bbaaac..241d17d81ecb 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -940,15 +940,25 @@ static int wm8978_resume(struct snd_soc_component *component)
 {
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret;
 
 	/* Sync reg_cache with the hardware */
-	regcache_sync(wm8978->regmap);
+	ret = regcache_sync(wm8978->regmap);
+	if (ret)
+		return ret;
 
-	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
+	ret = snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
+	if (ret)
+		return ret;
 
-	if (wm8978->f_pllout)
+	if (wm8978->f_pllout) {
 		/* Switch PLL on */
-		snd_soc_component_update_bits(component, WM8978_POWER_MANAGEMENT_1, 0x20, 0x20);
+		ret = snd_soc_component_update_bits(component,
+						    WM8978_POWER_MANAGEMENT_1,
+						    0x20, 0x20);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.50.1 (Apple Git-155)

