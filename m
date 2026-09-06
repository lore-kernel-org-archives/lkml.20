Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469132874E6;
	Sun,  6 Sep 2026 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666238; cv=none; b=BvbQI9JTY8v5al7lPifWdzd1AW/tIXOx6Lm/hXPE78066R+j08LZRfE3dCppC+NwGfuH/I43+z9ub/7+dbjR98y8VQAiJ4PUVviOtLJBkb3bxdIfPE1pWckpWrB+Dh1JEc+NmuqDN9iYxROYKXqtv07+P5iYeXLYqJHmbfBqzf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666238; c=relaxed/simple;
	bh=SZIwG3pwVvu70hO6dL1GFKW3b2UG7DVVv2UnVQaV4TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=szvHxWp9hObgLTbn9CMm2b91fmdj9Mj0AfrJzOPWyVwlmZ1BlNh3hwUmB9veKil9GPpWdwKdHyKoTK0cFetbPwTTqALDidjBDopXhS7S83XZIkAniLFoiocCq8niKwrchlQSe1UYzchjHvmtzm3JOv0LH442ITuMo7iSqfLiE3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=iSt5kGoy; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="iSt5kGoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=P3
	8Pf+wVjvhzylQUexvUGPye4FR0vPo8hgBzlxVFOoY=; b=iSt5kGoyHVUZcZllLF
	F4Zci7FZKau9HYM+Clk8DO/JZYTtPyaFMa7qpCWtlNpPi21BHWn994xjc7Heo4uh
	BEyhcvF9pEIZceAXeu5vOaDlPPoR9nbJmMIzFatg4rSRknLwWSQyc6KCz51OLHtP
	yZrjgD/1LTrpQmzlvSG0EwAqg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S3;
	Sun, 06 Sep 2026 11:43:25 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Seven Lee <wtli@nuvoton.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/9] ASoC: nau8821: stop resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:13 +0800
Message-ID: <20260906034321.86080-2-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3ArW3ArW5Ww4xXr4fKrg_yoW8XryUpF
	s3Grs5XrZ7Xw43AFWFyr18XFnYy393CF45A39Fg39rZr15CryxuryktF1jvF4DJrW8Gr9r
	Ar47t3y5GFWrGa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEYLPUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7h5RGmqc4V6wTQAA3P

nau8821_resume() restores cached registers during component resume but
ignores a regcache_sync() failure and continues with IRQ enablement.
Those operations assume that the codec register state has already been
restored.

Stop the local resume sequence when cache replay fails and return the
error to the ASoC component wrapper. The wrapper reports the failure
while retaining best-effort card resume, so no rollback or retry
semantics are introduced.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: aab1ad11d69f ("ASoC: nau8821: new driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/nau8821.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index c45c5b864ea4..c79be1c07f66 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1628,9 +1628,13 @@ static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
 static int __maybe_unused nau8821_resume(struct snd_soc_component *component)
 {
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(nau8821->regmap, false);
-	regcache_sync(nau8821->regmap);
+	ret = regcache_sync(nau8821->regmap);
+	if (ret)
+		return ret;
+
 	if (nau8821->irq)
 		enable_irq(nau8821->irq);
 
-- 
2.50.1 (Apple Git-155)

