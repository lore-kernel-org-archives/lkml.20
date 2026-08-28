Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37479440644;
	Fri, 28 Aug 2026 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916871; cv=none; b=roxZa3bEAQwXHN+UebsQjrB9mHvH2NvdbVLCEdfCibHXv1GXwe2a3eqPEDdn/UwLVPsxjY6L3m4uQ8yA31edz0HVtOwAEykC4CwwV4wd4uT7FGf1q+dGSkxrrvAUYQsdpcYUub7R99Xie4gnk7pws9DprFMy3oBnmP9VHvFkANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916871; c=relaxed/simple;
	bh=UunJtaMHIX9uWsv0nfYW4ZFgwih8x28pNhUUlY18bbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ehddyR5uEaUf8B9oK/DavJo2SkoEAD7rtM8gc0/khuvHXtsjLm6D8/OsHSeuUiHwsDECgX1U3uNcBCBOabxaLFJEcWzC2cgsfo+NbV8EP4Y/rjwgtt3go5vV2ihPTczcwj3cb24Q+3uaTWfIDtilCgS4klyf4913tJJifDP3zIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACnfPA6cpFqpPm9Bg--.43118S5;
	Fri, 28 Aug 2026 19:34:19 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/20] ASoC: cs35l56: Propagate register restore errors from runtime resume
Date: Fri, 28 Aug 2026 19:33:58 +0800
Message-ID: <20260828113416.47061-4-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowACnfPA6cpFqpPm9Bg--.43118S5
X-Coremail-Antispam: 1UD129KBjvJXoW7uw47Ar15AF43AFW8Wr13XFb_yoW8Wr48pw
	s8Ca93KrW8Xw47CFnYqF15Xa40g3ySyF15uw1jy3s3Zr15Aa40qw45JF4SqFW5XrW8CFsr
	JF47A3yfCrZ8JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
	Ja73UjIFyTuYvjfU55rcDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

cs35l56_runtime_resume_common() checks firmware wake and mailbox errors
but ignores the BOOT_DONE read and register-cache replay.  A failed read
also leaves val undefined before the BOOT_DONE test.

Send both failures through the existing hibernate error path so
cache-only state is restored and the device is returned to hibernate
when supported.

The issue was identified via static analysis and manually reviewed.

Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/cs35l56-shared.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 7b3e37d462d6..3778c5c2d910 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -827,13 +827,18 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 		goto err;
 
 	/* BOOT_DONE will be 1 if the amp reset */
-	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, &val);
+	ret = regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_EINT_4, &val);
+	if (ret)
+		goto err;
+
 	if (val & CS35L56_OTP_BOOT_DONE_MASK) {
 		dev_dbg(cs35l56_base->dev, "Registers reset in suspend\n");
 		regcache_mark_dirty(cs35l56_base->regmap);
 	}
 
-	regcache_sync(cs35l56_base->regmap);
+	ret = regcache_sync(cs35l56_base->regmap);
+	if (ret)
+		goto err;
 
 	dev_dbg(cs35l56_base->dev, "Resumed");
 
-- 
2.43.0

