Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4306440642;
	Fri, 28 Aug 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916872; cv=none; b=eKa7FzFPVfxzbsWgOsHJMWevn1lw9GWDXuENsCO8x9gPis8/n6OU8wdN1PhKVCYGYuB1CRG+2IE1rPPqYwSgNJUNScTPWEtmZQ9Cdd6EtpHLLnsH2981CwI4ctnJdX8QUgkSFnPgI6OogEu9tlkyCGOpmNRTfCFbb8eFjWOREgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916872; c=relaxed/simple;
	bh=UUW6bww6rhtw9EBYC7SQbJVkA0q8p/iRiOGWgsGXVIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrtuCZSGNtCn3J3BNvPOMMi2lB2KiFjCga6GH3scjU+6ewRuGcvjT01RDlT2n240G3VvXvTXzrqOSmvaAFJ+RA2t4GtEEZksBtrNfgXiEJN1a8fG0AuSYeCHzTeeNh1XJ4qA8YXy+gkDKMH29ppI4xGkDv1DFxANSk8t3UbJWXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S3;
	Fri, 28 Aug 2026 19:34:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/20] ASoC: adau1372: Unwind failed power restoration
Date: Fri, 28 Aug 2026 19:33:56 +0800
Message-ID: <20260828113416.47061-2-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
References: <20260828113416.47061-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZr13Cr1UAFW8ZryxtryftFb_yoW5CF4rpr
	yftr9xtws2qrn7WFZ0qr4kJFWSkr4xKrW3XwsrGw1xZrW5AryDKrWagF9avFyDKrZ3Jr43
	Gr1UJFWj9r17WF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q6r43Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUD-BiUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

adau1372_set_power() enables MCLK and optional PLL state before
restoring the clock-control register and register cache.  The final two
operations are unchecked, so the DAPM bias callback can report STANDBY
while hardware restoration is incomplete.

Check the clock-control update and cache replay.  Reuse one failure path
for PLL, register and cache errors that powers the device back down,
restores cache-only and dirty state, and disables MCLK.

The issue was identified via static analysis and manually reviewed.

Fixes: 6cd4c6459e47 ("ASoC: Add ADAU1372 audio CODEC support")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/adau1372.c | 44 +++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index cc174ec3a1f8..6a4decd66d93 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -787,12 +787,13 @@ static int adau1372_enable_pll(struct adau1372 *adau1372)
 
 static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 {
+	int ret;
+
 	if (adau1372->enabled == enable)
 		return 0;
 
 	if (enable) {
 		unsigned int clk_ctrl = ADAU1372_CLK_CTRL_MCLK_EN;
-		int ret;
 
 		ret = clk_prepare_enable(adau1372->mclk);
 		if (ret)
@@ -811,24 +812,21 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 		 */
 		if (adau1372->use_pll) {
 			ret = adau1372_enable_pll(adau1372);
-			if (ret) {
-				if (!adau1372->pd_gpio)
-					regmap_update_bits(adau1372->regmap,
-							   ADAU1372_REG_CLK_CTRL,
-							   ADAU1372_CLK_CTRL_PLL_EN,
-							   0);
-				regcache_cache_only(adau1372->regmap, true);
-				if (adau1372->pd_gpio)
-					gpiod_set_value(adau1372->pd_gpio, 1);
-				clk_disable_unprepare(adau1372->mclk);
-				return ret;
-			}
+			if (ret)
+				goto err_power_down;
 			clk_ctrl |= ADAU1372_CLK_CTRL_CLKSRC;
 		}
 
-		regmap_update_bits(adau1372->regmap, ADAU1372_REG_CLK_CTRL,
-				   ADAU1372_CLK_CTRL_MCLK_EN | ADAU1372_CLK_CTRL_CLKSRC, clk_ctrl);
-		regcache_sync(adau1372->regmap);
+		ret = regmap_update_bits(adau1372->regmap, ADAU1372_REG_CLK_CTRL,
+					 ADAU1372_CLK_CTRL_MCLK_EN |
+					 ADAU1372_CLK_CTRL_CLKSRC,
+					 clk_ctrl);
+		if (ret)
+			goto err_power_down;
+
+		ret = regcache_sync(adau1372->regmap);
+		if (ret)
+			goto err_power_down;
 	} else {
 		if (adau1372->pd_gpio) {
 			/*
@@ -849,6 +847,20 @@ static int adau1372_set_power(struct adau1372 *adau1372, bool enable)
 	adau1372->enabled = enable;
 
 	return 0;
+
+err_power_down:
+	if (!adau1372->pd_gpio)
+		regmap_update_bits(adau1372->regmap, ADAU1372_REG_CLK_CTRL,
+				   ADAU1372_CLK_CTRL_MCLK_EN |
+				   ADAU1372_CLK_CTRL_PLL_EN, 0);
+
+	regcache_cache_only(adau1372->regmap, true);
+	regcache_mark_dirty(adau1372->regmap);
+	if (adau1372->pd_gpio)
+		gpiod_set_value(adau1372->pd_gpio, 1);
+	clk_disable_unprepare(adau1372->mclk);
+
+	return ret;
 }
 
 static int adau1372_set_bias_level(struct snd_soc_component *component,
-- 
2.43.0

