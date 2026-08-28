Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4096644781B;
	Fri, 28 Aug 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917214; cv=none; b=Ys5oM8zBDIu2QtYEMAiCKR0KXp+gMwDqtU7Zx9Ng3nQxesMMDGnWPijw2NLN+8+0PQicMSSW0dZHluB1NlIrMmzrxsDKOaHOZi1GUnA0nspvVPluYAWFzlNCAF9xMHDkJ3K1Im3EoIef62FWKhQQbNggiTz5pv/K1tgOXkgZmLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917214; c=relaxed/simple;
	bh=3vZ7s2UOMmcLaRz+xko0cLJuJ5A+wEuYWrp1KA9LtkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F/7zTusLNrFaS3ic6L4EU9XqKW7TCxAfr2jT/ZRd6i/W0eJQenXnuI94nMoJp++b5bUq+bLwbx7QcSHeH+vbYU1lv4Sl476EB1UssoDMGvdqLe51kOTShOhZpH2RXshRjct36sxSqAzfshjNQLXnZBz3jqCdLGSGKG0YYGrG5UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S17;
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
Subject: [PATCH 15/20] ASoC: wm8985: Unwind supplies on cache replay failure
Date: Fri, 28 Aug 2026 19:34:10 +0800
Message-ID: <20260828113416.47061-16-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S17
X-Coremail-Antispam: 1UD129KBjvdXoWrZrykXr48tryfKw4xGw17ZFb_yoWkAFg_W3
	y0g3WDJryYgrWIvasru3yjvrW0grn7AayIyrn2q34ftry7t3WrAr45Xrsxuw4UW348Ca43
	XF12gr17Ary7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUAVCq3wA2048vs2
	IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28E
	F7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr
	1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r126r
	1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJw
	CI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUjBTYUUU
	UUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

wm8985_set_bias_level() enables supplies and ignores regcache_sync(),
then performs the anti-pop and bias power-up sequence.

Return the cache error and disable the supplies acquired for the failed
OFF-to-STANDBY transition.

The issue was identified via static analysis and manually reviewed.

Fixes: 6d6f8b832705 ("ASoC: WM8985: Initial driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8985.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index 2a64d5a851da..10658d9a42d0 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -971,7 +971,12 @@ static int wm8985_set_bias_level(struct snd_soc_component *component,
 				return ret;
 			}
 
-			regcache_sync(wm8985->regmap);
+			ret = regcache_sync(wm8985->regmap);
+			if (ret) {
+				regulator_bulk_disable(ARRAY_SIZE(wm8985->supplies),
+						       wm8985->supplies);
+				return ret;
+			}
 
 			/* enable anti-pop features */
 			snd_soc_component_update_bits(component, WM8985_OUT4_TO_ADC,
-- 
2.43.0

