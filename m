Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFC63CBE69;
	Wed, 14 Oct 2026 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948334; cv=none; b=hYxp+JZZbQktGYh7SbZb+qBtxWPowPmY2juLVrtVSDRfoqkqUlAX5eM2xGe8/bRwgTRK1k2FlIK8EAkdwFKIHpKdSPAZRJst8UMl3Ku0FHzhWpqwy4VTK5Jwd0OtMmhlhLx1i/7ZG3/GraBhKuF9YQY/qdjkaI+CK7hXuWVyBZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948334; c=relaxed/simple;
	bh=ii4rs8V31yagis8aH+QIQYzb0cVHUCcUYXX5IVB2pFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rhOXSH7dMcmZZwPsN3+O7qE0h+iW8ySsnzgEHj1vhB+Hn3eGVYDZLNCXohExL2arjHLS/wK/8Fggzid1FYZnO9pXognz9pXmD30xK113YPaXVA/T212DLlF7oxSwcsm797Fnvaakg4l2ei1+anwbkUDZWoV3e93BpzUwVc+vBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OsbbQWXI; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OsbbQWXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Bf
	ux+4l8p40RchJYJaFqlL8xY7IaMkk15hiYRud+k+I=; b=OsbbQWXIqtHJrD8X9m
	or819rl6n944zDuugnJ7QZ/h4D4ZYVacx5M6EMypuoDA2m2x/gcodj8sXYgHMOUi
	HCUhHJznxeJGj97jBKb9opxyPes4OH8ExCOQkNKus9kMZJKNklviIxnbTA7zids5
	FZWiTm1IPUpzRZ1w8Vl0Mh708=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S3;
	Wed, 14 Oct 2026 11:24:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Seven Lee <wtli@nuvoton.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 1/9] ASoC: nau8821: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:44 +0800
Message-ID: <20261014032452.13456-2-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261014032452.13456-1-hppiscas@163.com>
References: <20261014032452.13456-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw45ZFy8tr48KFWrGrg_yoW5ZF13pr
	ZagrWvq3yIqa1avryFyr18XFnYkrWfKF45A39xK3y7Aw15CryrurykJr17ZF4UtrW8GF9r
	Xr42q3y8GFy5Ja7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pi5EfwUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7ggO1mrO9gi51gAA3L

nau8821_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Leave jack-detection IRQs disabled after a failed replay.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: aab1ad11d69f ("ASoC: nau8821: new driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/nau8821.c |   16 +++++++++++++---
 sound/soc/codecs/nau8821.h |    1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ecadbaee103798466755e2fbc2f3843f6ad2c05e..41c4cf947999020246e6431cf24c8527c7f6319a 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1620,8 +1620,10 @@ static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
 {
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
 
-	if (nau8821->irq)
+	if (nau8821->irq && !nau8821->suspend_irq_disabled) {
 		disable_irq(nau8821->irq);
+		nau8821->suspend_irq_disabled = true;
+	}
 
 	if (nau8821->jdet_active)
 		cancel_delayed_work_sync(&nau8821->jdet_work);
@@ -1639,11 +1641,19 @@ static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
 static int __maybe_unused nau8821_resume(struct snd_soc_component *component)
 {
 	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(nau8821->regmap, false);
-	regcache_sync(nau8821->regmap);
-	if (nau8821->irq)
+	ret = regcache_sync(nau8821->regmap);
+	if (ret) {
+		regcache_cache_only(nau8821->regmap, true);
+		regcache_mark_dirty(nau8821->regmap);
+		return ret;
+	}
+	if (nau8821->suspend_irq_disabled) {
+		nau8821->suspend_irq_disabled = false;
 		enable_irq(nau8821->irq);
+	}
 
 	return 0;
 }
diff --git a/sound/soc/codecs/nau8821.h b/sound/soc/codecs/nau8821.h
index f9d7cd8cbd2116be93cf8692f1acb9022aeabaed..def3942f8785ece82a2eafd0e18dce51c7db72cc 100644
--- a/sound/soc/codecs/nau8821.h
+++ b/sound/soc/codecs/nau8821.h
@@ -563,6 +563,7 @@ struct nau8821 {
 	struct snd_soc_jack *jack;
 	struct delayed_work jdet_work;
 	bool jdet_active;
+	bool suspend_irq_disabled;
 	int irq;
 	int clk_id;
 	int micbias_voltage;

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

