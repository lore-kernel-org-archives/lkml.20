Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D035F43F4C3;
	Fri, 28 Aug 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916874; cv=none; b=UhjgRGYiKvOk94td0Jk0aGf+gTow//EhjmPXFREZ0hWGOgEvZHsACjP6Tn6erMWcLHsl5dtreyjpNOcqzbSWk/aXcm60k69UJhFTYHPa+rjrIDWM1XmNDHO4eny4lif4mD2RiGpEAxkN/jZnuk8o2UY/pYy822cC3stqMalQ4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916874; c=relaxed/simple;
	bh=d4n/yYteAErq9YAEU2qFIQtZQUQdKX/WJV51CBQSRag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkII4o72vwJPIuq8IXa2ZbVcJ855qdnonyHZ8ffieQXsSan5G8xtm3NmqFG8c3QzQtVO5W6Id8yxU1I8O5cHySi9CfhqnylqjS4LCMFpzBBEWaIFtZ+a91k8BKMtTYblyBPuit5oMNKQosj7SdxdIjxmIW/FWBbdgJ/SPLbVed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S16;
	Fri, 28 Aug 2026 19:34:21 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/20] ASoC: wm8904: Unwind resources on cache replay failure
Date: Fri, 28 Aug 2026 19:34:09 +0800
Message-ID: <20260828113416.47061-15-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S16
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar4xGF1xury8KFW3Xr4xJFb_yoW8GrWUpr
	WfJFZ5trW8Xw4kCFZ0yry8Xa4rKryUtFy3Gwn8Kw1xur98A3WI9r1ftr18ZF9rXrZ8GFsx
	ZrW7J3yUCF15GaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUaZX7U
	UUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wm8904_set_bias_level() enables supplies and MCLK, makes the regmap live
and then ignores regcache_sync() during OFF-to-STANDBY.

Return the error after restoring cache-only and dirty state and
disabling MCLK and supplies in reverse acquisition order.

The issue was identified via static analysis and manually reviewed.

Fixes: c133421800d9 ("ASoC: Add support for BIAS_OFF when idle to WM8904")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8904.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 9e5782e50f47..609f10f00c6b 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -1973,7 +1973,15 @@ static int wm8904_set_bias_level(struct snd_soc_component *component,
 			}
 
 			regcache_cache_only(wm8904->regmap, false);
-			regcache_sync(wm8904->regmap);
+			ret = regcache_sync(wm8904->regmap);
+			if (ret) {
+				regcache_cache_only(wm8904->regmap, true);
+				regcache_mark_dirty(wm8904->regmap);
+				clk_disable_unprepare(wm8904->mclk);
+				regulator_bulk_disable(ARRAY_SIZE(wm8904->supplies),
+						       wm8904->supplies);
+				return ret;
+			}
 
 			/* Enable bias */
 			snd_soc_component_update_bits(component, WM8904_BIAS_CONTROL_0,
-- 
2.43.0

