Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F263DE457;
	Fri, 28 Aug 2026 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917228; cv=none; b=AsSVjj5XIa1ILOEyj6UR/xvqjIcqKrEBYQIgfkZ89ZPwtBdeA9EraCA/2hfEjDx57svOJD4X8NhPrTf+0mNfsFiEzuonmMBj0Zc2fFdH9nZ8LNzCT6aZB98X4a9vp3xRnWoYlqDIeBDVUKq385QD5Q8DgsOfH56E0qMNto61TlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917228; c=relaxed/simple;
	bh=bc1aYia6d8j5bYAVlMp2zGJbeu5EN59Hi1NoDKaMaMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5JT5b013KS22E7jsRc7pGoBjKmnokEFv2KWEqk9Wm37pQtnvgBD1fhk4yaXVX1TKt2d/7Gd0Bs5t6+Di//k11zXSxSKpDavjDzbOm/GymVxspDIWDnR74lPirOAveLEfpw6IfhCTs1IaJ3T+XmvGWfTGogJ5OaYYDJvXxCXOgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S15;
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
Subject: [PATCH 13/20] ASoC: wm8804: Propagate cache replay errors from runtime resume
Date: Fri, 28 Aug 2026 19:34:08 +0800
Message-ID: <20260828113416.47061-14-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S15
X-Coremail-Antispam: 1UD129KBjvdXoWrZF4DtFWrXw13XF4kurW5Awb_yoWkJwc_Wa
	y8WwsrWFZ8Kr4I93srAr1Yv3ykWry7Z3W2qr1DKF43t342yFn5JFWUJrsxuw4DWw18Ca43
	X3Wjgry7Gry5KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

wm8804_runtime_resume() enables supplies and ignores regcache_sync(),
then powers up OSCCLK and reports runtime-PM success.

Return the cache error and disable the supplies acquired by resume
before OSCCLK is enabled.

The issue was identified via static analysis and manually reviewed.

Fixes: 1a60667fc81f ("ASoC: wm8804: Enable runtime PM")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8804.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 94aa3c8de0ab..0935e2e3c2d4 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -692,7 +692,11 @@ static int wm8804_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	regcache_sync(wm8804->regmap);
+	ret = regcache_sync(wm8804->regmap);
+	if (ret) {
+		regulator_bulk_disable(ARRAY_SIZE(wm8804->supplies), wm8804->supplies);
+		return ret;
+	}
 
 	/* Power up OSCCLK */
 	regmap_update_bits(wm8804->regmap, WM8804_PWRDN, 0x8, 0x0);
-- 
2.43.0

