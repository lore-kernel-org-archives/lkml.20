Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AD243A7F7;
	Fri, 28 Aug 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916872; cv=none; b=PAykgQnEVaYu1nM+3grrCv2ZsqCZBvR1k5+JTrh+MdFwkfJx/AOSLl5LyfMbzEn0GiLbV7iAD9VYKtcc9vhl//5aejmr5jIUn0bKc7zf16IzGuQ1AcgyjwPEBVWPQqjo1w1qIA/bfojebCofGoC85B4eEsyamHDdchI2OR+F5L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916872; c=relaxed/simple;
	bh=/wPgCA0ngA1fKJIQULnZ6uRjK44kJRj3ooBLwkH4ETM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOtXT4Y9FQXW2cxqkBanp0CyeqENRRKg37XQuYlW8T2TEJxypYLB9fRe6Xvp2zr9GnUKLOlBKl39dWAY5Cq5M9SAjVsX092gNbSU+GVaXt5aVvfapNnUnXSjVW2WrSe2SNX1th36sJA8PObmTVKZP1pY1nJZTPf7LGOOXTpGX3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S10;
	Fri, 28 Aug 2026 19:34:20 +0800 (CST)
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
Subject: [PATCH 08/20] ASoC: ssm2518: Unwind failed power restoration
Date: Fri, 28 Aug 2026 19:34:03 +0800
Message-ID: <20260828113416.47061-9-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S10
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy7ZrWUtrWrGw1UGF15Jwb_yoW8Wryxpr
	ZxGFZ5KrZ7X34I9FsIvr45Wa95KFWxAan0kw47K3s5Zw1kZFWxurs3uw1xZFyUKrW8tF43
	Ar43GFy5CFnxGr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUP014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUtV
	W8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
	CI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjMmhDUU
	UUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ssm2518_set_power() enables the external GPIO and live regmap before
clearing software power-down and replaying the cache.  The cache result
is ignored, and the first register failure also leaves the partial
enable state in place.

Send both failures through one path that restores cache-only and dirty
state and deasserts the enable GPIO before returning to the DAPM bias
caller.

The issue was identified via static analysis and manually reviewed.

Fixes: b6b5e76bb8bb ("ASoC: Add ssm2518 support")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/ssm2518.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 5192569ba6a8..ae28b0cae58c 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -490,10 +490,23 @@ static int ssm2518_set_power(struct ssm2518 *ssm2518, bool enable)
 	if (enable) {
 		ret = regmap_update_bits(ssm2518->regmap, SSM2518_REG_POWER1,
 			SSM2518_POWER1_SPWDN | SSM2518_POWER1_RESET, 0x00);
-		regcache_sync(ssm2518->regmap);
+		if (ret)
+			goto err_power_off;
+
+		ret = regcache_sync(ssm2518->regmap);
+		if (ret)
+			goto err_power_off;
 	}
 
 	return ret;
+
+err_power_off:
+	regcache_cache_only(ssm2518->regmap, true);
+	regcache_mark_dirty(ssm2518->regmap);
+	if (ssm2518->enable_gpio)
+		gpiod_set_value_cansleep(ssm2518->enable_gpio, 0);
+
+	return ret;
 }
 
 static int ssm2518_set_bias_level(struct snd_soc_component *component,
-- 
2.43.0

