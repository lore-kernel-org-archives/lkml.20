Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C91118B0A;
	Wed, 14 Oct 2026 03:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948329; cv=none; b=hwZ8bRhEpnZqy2NQd9gYuc/XftZk0MlrjAAqNUMuM33ChnvHFFNFqcJ3cbRqxfz/GAzyrKl8Vg5KUA50xRkYagYFdYHA1HJ0xrqtOLsMvuUyk7AW0pkLdqwbtqL/+QQAtuGLD8MNo1PuP2gIKQEnRLPH8pEczGVTRYHDXe4t4gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948329; c=relaxed/simple;
	bh=OFR4Pjp8WUygRoKjfEgyt8Ifoodf4tE7tdqWqLUuPwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhMHytmifXwIVYw4/X5rYPyVG3Mg///Lk0MnkFzheu+M6Ns5w2tsJng/qJ8ZCEtoJLMfyxqmn2a72zpIvjpzvBt+HKEjcx2ApodOXIEQOR/0Ek5XhL//gmsZK3spgbmrEGeRC7u7gg/eZQB8ok9gBqhxFhluJwiBFhooN7FmMvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=YIjTK9B2; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="YIjTK9B2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Nc
	LWlGI/FjqHPvUv/HcE6GWKC4EhGB+rMDPm3ATOLOc=; b=YIjTK9B20le2zoka2X
	UaWQ0NYhbfMsDQ38oI8lodN/uzvyv5YHfByfOPhXqVkH/0+HsUGgajOBwMlW70Ps
	zioBsHyaWS//54Z/W5ELlfaZEUrUl1+5DlVOiepeeDhD2LZ6aQTFkxHcGmRVzaQA
	AyFdCx3r90tw4WT4JZo9yIW94=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S9;
	Wed, 14 Oct 2026 11:24:59 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 7/9] ASoC: wm8978: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:50 +0800
Message-ID: <20261014032452.13456-8-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261014032452.13456-1-hppiscas@163.com>
References: <20261014032452.13456-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxXryxAr4fKF45Cr1fJr4rGrg_yoW5tr4xpF
	ZakFs8Kr4vqr4SvFyayw48ZFWFkFZ3tF4rAasrK34xAw15Arn29r1rKFyjvFWDWFs5Grn7
	Zr1jv34jkFyDZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirMaOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gsO1mrO9gu6ngAA3A

wm8978_resume() ignores cache replay, bias restoration and PLL update
results, allowing subsequent resume steps to run after a failed operation.

Stop at the first failure and request SND_SOC_BIAS_OFF on the error path.
Bias OFF intentionally preserves PLL power, so also clear the power
register as system suspend does. Keep the original failure if rollback
reports another error. Restore cache-only mode and mark the cache dirty
so later accesses do not write through a partially restored device.
Re-enable write-through before a later replay attempt. A positive
update_bits() result means that
bits changed, not an error.

The bias callback currently does not propagate every register write error;
the rollback is therefore best-effort, not a claim of verified hardware
power-down. The ASoC wrapper continues its established best-effort resume.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0d34e91596ef ("ASoC: add a WM8978 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- restore bias OFF on the error path, as Charles requested
- also turn off PLL power, matching system suspend rather than bias OFF alone
- preserve positive update_bits() success
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/wm8978.c |   31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 258bc9f88f520e4de034393d39317e07e731d1ad..f5d3f26cc21790a8dfc4bf909a5fc5d56ba8f577 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -952,17 +952,40 @@ static int wm8978_resume(struct snd_soc_component *component)
 {
 	struct wm8978_priv *wm8978 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
+	int ret, err;
 
 	/* Sync reg_cache with the hardware */
-	regcache_sync(wm8978->regmap);
+	regcache_cache_only(wm8978->regmap, false);
+	ret = regcache_sync(wm8978->regmap);
+	if (ret)
+		goto restore_off;
 
-	snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
+	ret = snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_STANDBY);
+	if (ret)
+		goto restore_off;
 
-	if (wm8978->f_pllout)
+	if (wm8978->f_pllout) {
 		/* Switch PLL on */
-		snd_soc_component_update_bits(component, WM8978_POWER_MANAGEMENT_1, 0x20, 0x20);
+		ret = snd_soc_component_update_bits(component,
+						    WM8978_POWER_MANAGEMENT_1,
+						    0x20, 0x20);
+		if (ret < 0)
+			goto restore_off;
+	}
 
 	return 0;
+
+restore_off:
+	err = snd_soc_dapm_force_bias_level(dapm, SND_SOC_BIAS_OFF);
+	if (err)
+		dev_err(component->dev, "Failed to restore bias OFF: %d\n", err);
+	/* Bias OFF preserves PLL; system suspend turns it off as well. */
+	err = snd_soc_component_write(component, WM8978_POWER_MANAGEMENT_1, 0);
+	if (err)
+		dev_err(component->dev, "Failed to disable PLL: %d\n", err);
+	regcache_cache_only(wm8978->regmap, true);
+	regcache_mark_dirty(wm8978->regmap);
+	return ret;
 }
 
 /*

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

