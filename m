Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2E349AE0;
	Wed,  2 Sep 2026 01:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312792; cv=none; b=VJod+jU+6g/gEW6QWm4b/wc/jPzrnWc35n2XN6HT40nQb0pDEbZzSNJPUTenV6WUj4GlAXzEVuzlSD9RTKBGYFkcfqFNrm4OTE6I/SPO9v7i6uHEhDcaYqcFXE+etmWJX0eAU6iEQLuY8uHLaI61tWOFoXlqemU5v/TsZFKj6jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312792; c=relaxed/simple;
	bh=kvPZNuOpv631M+fPSTvWLj4WTUWSXKE6LvwJmRMUeWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ggp3dgXhr+qr+HevDVh1pFYMqEdPP6G3HKGVcGLD4oE05Mxi72ja4zO1MbLEuoj/NSgt3N+iz0NHrIVfuWjmAsqWDsQvDh5I4CJrhZ238uPx6imaFnY6OnsFepw5dXmDms7UjpwDhxhG9tAWZGKI8dloywjgfId2jaetWzvF04Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADnvvLKfJdq8VoHBw--.39350S5;
	Wed, 02 Sep 2026 09:33:01 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhu Ning <zhuning0077@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/14] ASoC: es8316: return cache sync errors from resume
Date: Wed,  2 Sep 2026 09:32:39 +0800
Message-ID: <20260902013256.93072-4-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260902013256.93072-1-pengpeng@iscas.ac.cn>
References: <20260902013256.93072-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADnvvLKfJdq8VoHBw--.39350S5
X-Coremail-Antispam: 1UD129KBjvJXoW7KFy3tF4UCFyrtFWUGF1kGrg_yoW8Gw1DpF
	sakFZ5Jr4Iva1Iva90yF40q3WrCFWSyF43J34UK3s2kr15Wry8uF1rtryjvFs5Wr1xuwnx
	ZF42v3yUZF15JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWUAV
	WUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU9J5rUUUUU
	=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

es8316_resume() restores cached registers during component resume but
discards the regcache_sync() result and returns success. A failed replay
can therefore leave the hardware register state stale without reaching
the component error reporting path.

Return the cache synchronization result. The ASoC component wrapper
reports a negative callback result and retains the established
best-effort resume state, so this adds observability without introducing
rollback or retry semantics.

The successful resume path is unchanged.

The issue was found by a tool we developed.

Fixes: 4bac47a7b2f9 ("ASoC: codecs: add suspend and resume for ES8316")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/codecs/es8316.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 24ec8b211cdb..4c33a243c1e1 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -810,9 +810,7 @@ static int es8316_resume(struct snd_soc_component *component)
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 
 	regcache_cache_only(es8316->regmap, false);
-	regcache_sync(es8316->regmap);
-
-	return 0;
+	return regcache_sync(es8316->regmap);
 }
 
 static int es8316_suspend(struct snd_soc_component *component)
-- 
2.50.1 (Apple Git-155)

