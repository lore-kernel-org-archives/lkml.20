Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600C43F08D;
	Fri, 28 Aug 2026 11:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917217; cv=none; b=LdDlb4DgEIt7yEI3YDmgat2D8iUrJYaq0vyRYcEdDk5DEEXhrEezXUrECq0cVfmnNUwtvLHVxFdf2k+wOe/Rg3nkFiVnwpxVCF6XHEbLOqmc1FwlO8XbM+Yw4j0hP3/q3dnOJoVDVpQIGkT+/IlLLfDKmwebUpdoWcM9Z178TC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917217; c=relaxed/simple;
	bh=V3JosSjIlcx2rclEYF1Mg9DEYWeN0sKlLa9leJswnQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ujt4oBE3frx7sq/K/yCe4QdJ+VBQ9R5Fo3+PhEQ+iWmEG5zupzZUp3rJicGFji8nHrqFWDHnhV5zSJV8lyXZBeeeo1TIJltSFyb09PY+TUL+q+nTlM+ikDbP5t2xWHjnQ7561c1tR4gQAuOr3DylYCScni3RIrloDpSmHmRnt9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S14;
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
Subject: [PATCH 12/20] ASoC: wm8770: Unwind supplies on cache replay failure
Date: Fri, 28 Aug 2026 19:34:07 +0800
Message-ID: <20260828113416.47061-13-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S14
X-Coremail-Antispam: 1UD129KBjvdXoWruw1xAF47CryrCrWDtF43KFg_yoWkZrc_Wa
	y0g3s8XrZ09rWIv39rJrW2vFWkZFWrCFyj9r1vg3Z3Jr97tan5J3yDXFn3u34Uu348Ca43
	uFnagr1xAry0kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
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

wm8770_set_bias_level() enables supplies and then ignores
regcache_sync() during the OFF-to-STANDBY transition.  It continues with
global power-up after an incomplete restore.

Return the cache error and disable the supplies acquired for the failed
transition.

The issue was identified via static analysis and manually reviewed.

Fixes: c046fd4dd613 ("ASoC: WM8770: Initial driver")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/wm8770.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index b8b4d1e823e6..5bcad0729ece 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -517,7 +517,12 @@ static int wm8770_set_bias_level(struct snd_soc_component *component,
 				return ret;
 			}
 
-			regcache_sync(wm8770->regmap);
+			ret = regcache_sync(wm8770->regmap);
+			if (ret) {
+				regulator_bulk_disable(ARRAY_SIZE(wm8770->supplies),
+						       wm8770->supplies);
+				return ret;
+			}
 
 			/* global powerup */
 			snd_soc_component_write(component, WM8770_PWDNCTRL, 0);
-- 
2.43.0

