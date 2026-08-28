Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70A440652;
	Fri, 28 Aug 2026 11:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916872; cv=none; b=TyCciD8386TDJTYdNNVfJIwPpiuDQRAw9DSWU2t7LGsDcz82fKTRDmIX5im5gNPUIgow93YdO0haPgy/WvUHKoN8+fcz1J4p30dl8PXmVq327MbipM9xseRZVIIwKHm8myKYi6UcZ8hdQPSQWAU1jzvDZag4HlBrKhKMxXkBLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916872; c=relaxed/simple;
	bh=QzKTHqplW7pC30WFuzeAllxJ7QxWMRAErFB8/KsMuKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NT3bLVLprRE3qyyWOD7H+EUGQS2vo83TBdgJGV7+JArkI6igZUiWYe6C3Um8nD7usfGmFNaB91EAe2mmh82Axtzcz4ka5+4nzEFDCFCI1f+WK2oU+wRo7gh5ZM3RjdUCxK+OGCpFXNKYIjTfnBOQSxWOqacOrEn9wcgdtfiLe9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S13;
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
Subject: [PATCH 11/20] ASoC: wm8731: Unwind supplies on cache replay failure
Date: Fri, 28 Aug 2026 19:34:06 +0800
Message-ID: <20260828113416.47061-12-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S13
X-Coremail-Antispam: 1UD129KBjvdXoWruw1xAF47CF1DXry3GF1UGFg_yoWkurg_Wa
	y0g3srXrn8KrWxZ34DurWjvFWkXa18CFy0qrnrtF4ftFy2yFn5Jr4DXFn3u3sruw48C3W3
	uF18Kr1xGry7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

wm8731_set_bias_level() enables supplies and then ignores
regcache_sync() during the OFF-to-STANDBY transition.  It continues with
power-register programming after an incomplete restore.

Return the cache error and disable the supplies acquired for the failed
transition.

The issue was identified via static analysis and manually reviewed.

Fixes: 9bf311fe17f1 ("ASoC: wm8731: Convert to snd_soc_cache_sync")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8731.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index ce87280d590d..93d37279b6de 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -483,7 +483,12 @@ static int wm8731_set_bias_level(struct snd_soc_component *component,
 			if (ret != 0)
 				return ret;
 
-			regcache_sync(wm8731->regmap);
+			ret = regcache_sync(wm8731->regmap);
+			if (ret) {
+				regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies),
+						       wm8731->supplies);
+				return ret;
+			}
 		}
 
 		/* Clear PWROFF, gate CLKOUT, everything else as-is */
-- 
2.43.0

