Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A352440646;
	Fri, 28 Aug 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916872; cv=none; b=FrbHriVviaoyzhch38ZhakTp/upzZxAaL4+QeGBU7c6WIUAUtGREIIXOdINNBANGfvMzGnOMv5PpIQ0tx8F6EFinvDOx2g8+HrjBe0Qal/YkznezJIqcJYJxTzqd0YqbuELKMk1lBx1QgFNvW0KmYAyk3pRZLVqzUcMdJ3x9HAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916872; c=relaxed/simple;
	bh=iNan82HEr2Zes0rNnV4jhGug+YWTCPC8QHQTavWc8KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rqa0Xt/dGmQ+GAI1NmJNTq8uxgzsJpi/PfG0bsCdZpNEGT4ZNF0GUgm9h3yYxCyq3UIAGxuc6925tm/a9Tu520NoWgg1OM1CVOc9+Rji5Ph+g2i6z+MN5o+Zz0xbEJBE+LaUPF0lsahpBJaQtnoHWtB3TAE+LUEs5GVxTADaWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S4;
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
Subject: [PATCH 02/20] ASoC: adau1701: Propagate register cache replay errors
Date: Fri, 28 Aug 2026 19:33:57 +0800
Message-ID: <20260828113416.47061-3-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S4
X-Coremail-Antispam: 1UD129KBjvJXoWrKFy5Cr43CF15trW5CF1xXwb_yoW8Jr4fpr
	Z3CFZrGw4jq3yFya98tr45Xa4fKrWSkFy3Aw4jg3saywnxJr4I9r43tF4UZFykKr42gFsx
	Xr17A3y5AF15AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
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
	C2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU66wtUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

adau1701_reset() marks the cache dirty after firmware and reset setup
but ignores regcache_sync().  The hw_params and component probe callers
return the helper status, so they can currently accept reset completion
while cached register state was not restored.

Return the cache replay error so those effective callers stop the
transition.

The issue was identified via static analysis and manually reviewed.

Fixes: 45405d58924f ("ASoC: adau1701: switch to direct regmap API usage")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/adau1701.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 329ab01b62c0..a5c2d095a0ab 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -355,7 +355,9 @@ static int adau1701_reset(struct snd_soc_component *component, unsigned int clkd
 	regmap_write(adau1701->regmap, ADAU1701_DSPCTRL, ADAU1701_DSPCTRL_CR);
 
 	regcache_mark_dirty(adau1701->regmap);
-	regcache_sync(adau1701->regmap);
+	ret = regcache_sync(adau1701->regmap);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

