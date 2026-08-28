Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B93440629;
	Fri, 28 Aug 2026 11:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916872; cv=none; b=uKwO3Q/fM9VaVfzeeEr8io5L1cD/QESwOwEJ+igAmt9MyR6VdWciZmeEUvUAzgbxL+feWPJS+ztMXqUmQDpzLd8EnYfE6yyTm6RYLsshE9wPoz6hlGC1Vn5MWbNzzjmP+aSWd9SSiZxRxnuMZjw/f79QWoRkC3c0stelEV5WPUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916872; c=relaxed/simple;
	bh=ci3wEtvF1NT20ObYpFu0FbJKBIvdsTG0KeZW1CVnYsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iYrFP0dBG4F4p+/4XimqoaE4KudwywxLtC8P0M66O87rWmXNLkakuk2GpPNA5S4GLaSTLQ0O+PXJwJ7nQA0lHpvuS6I1h7vxnJRZY5RlMDyQUz2/187J9NG2ewlSCju6ghqi/gvJhB6UaDjJ2oMpIBaFbmUfCzNn1U3qX9n9s3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S20;
	Fri, 28 Aug 2026 19:34:22 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/20] ASoC: wm8996: Unwind supplies on cache replay failure
Date: Fri, 28 Aug 2026 19:34:13 +0800
Message-ID: <20260828113416.47061-19-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S20
X-Coremail-Antispam: 1UD129KBjvJXoW7Cw1kXFy7Jr13XF18trWUArb_yoW8Gr45pr
	Z3CFZ0vrWkXw4fCFyayF45Xa4rWr98AF13Cw1DKw40vFn8C3W2gr1rAr1xZFykWrWUGFsx
	ZFy3Aay8GF15Gr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

wm8996_set_bias_level() enables supplies and optional LDO state, makes
the regmap live and ignores regcache_sync() before MICBIAS programming.

Return the cache error after restoring cache-only and dirty state,
deasserting the LDO GPIO, and disabling supplies.

The issue was identified via static analysis and manually reviewed.

Fixes: c93993aca45a ("ASoC: Add WM8915 CODEC driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8996.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index dface555f928..0676a1710fd5 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -1604,7 +1604,16 @@ static int wm8996_set_bias_level(struct snd_soc_component *component,
 			}
 
 			regcache_cache_only(wm8996->regmap, false);
-			regcache_sync(wm8996->regmap);
+			ret = regcache_sync(wm8996->regmap);
+			if (ret) {
+				regcache_cache_only(wm8996->regmap, true);
+				regcache_mark_dirty(wm8996->regmap);
+				if (wm8996->ldo_ena)
+					gpiod_set_value_cansleep(wm8996->ldo_ena, 0);
+				regulator_bulk_disable(ARRAY_SIZE(wm8996->supplies),
+						       wm8996->supplies);
+				return ret;
+			}
 		}
 
 		/* Bypass the MICBIASes for lowest power */
-- 
2.43.0

