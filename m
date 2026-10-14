Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6236838F656;
	Wed, 14 Oct 2026 03:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948327; cv=none; b=pn8dR2YhBRTMhwN1lng/oJr/QbsEjFHinNJMuH9NNvWEAMCvX4ZEHDrNiHdwCq9fpwRad4VM0Mgm5Z5YJkBq04Bmiu7uPgA6TfKWMrt09/rDWa03xDylh2H2H8IsdSVLj4KH7O/zhKtydsamvPosp3WU0ocn9p2dYjoOjzra4wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948327; c=relaxed/simple;
	bh=sptjsdJwVpiWKiXUZ48pm0Kd3dSMq8uSuChvkQlaagE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yhkj0bv05T4wFtGR5CeGnUYKb1EfiOdpW4GN1JUOtnxRSFc+ypLYuURl8WGFauMeqNbZYG79z6O28wzj89eh5oxa6fnkXZUT0wfr4J2R7KVyiy2BJsMFq1tATBDUgGFKXyLcpF9w7/ePUeiClvdeOzBzLwfgAa8JwaORnzHzEHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JWAtiyLf; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JWAtiyLf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UF
	ESNTwvo4wROsWoeRhohjb6E220HnrU0WFL5toQarc=; b=JWAtiyLfboXFoRi1R/
	rKQndU7jNK8zDK56U9EEj5YH18G3LkSLytXSyXkkrpnAISHis2YcTzX4+k/qYm45
	iEOI6fdqnON9nS5Tn9hvpVN5VzF04Hh/VkUdGwnZTxAbmLYdKrEMvh3RVpaFM89B
	Ba0aMLgr6oyKcGlWbHLS4QzOw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S4;
	Wed, 14 Oct 2026 11:24:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Hsu <supercraig0719@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 2/9] ASoC: nau8824: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:45 +0800
Message-ID: <20261014032452.13456-3-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw4xCry3tr47tr1fJFb_yoW5tr1fpr
	Z3KrZYq3yxXrWxuryFyr1kXFnYy3yfKF45AwnxK3y7Aw15CFyxurn5JF1UZFW7tFyDGanx
	Xr47t3y8GF15J3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pMCJBXUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7ggO1mrO9gi58gAA3v

nau8824_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Do not acquire the jack-detection semaphore or enable its IRQ after a
failed replay.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: dfeabded0496 ("ASoC: nau8824: new driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/nau8824.c |   17 ++++++++++++++---
 sound/soc/codecs/nau8824.h |    1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 853eb9472af92df981b4668c6b0d0dd573c6c30c..522f8951b0598da3bf1def9119ec27a086427fde 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1531,7 +1531,10 @@ static int __maybe_unused nau8824_suspend(struct snd_soc_component *component)
 	struct nau8824 *nau8824 = snd_soc_component_get_drvdata(component);
 
 	if (nau8824->irq) {
-		disable_irq(nau8824->irq);
+		if (!nau8824->suspend_irq_disabled) {
+			disable_irq(nau8824->irq);
+			nau8824->suspend_irq_disabled = true;
+		}
 		snd_soc_dapm_force_bias_level(nau8824->dapm, SND_SOC_BIAS_OFF);
 	}
 	regcache_cache_only(nau8824->regmap, true);
@@ -1546,7 +1549,12 @@ static int __maybe_unused nau8824_resume(struct snd_soc_component *component)
 	int ret;
 
 	regcache_cache_only(nau8824->regmap, false);
-	regcache_sync(nau8824->regmap);
+	ret = regcache_sync(nau8824->regmap);
+	if (ret) {
+		regcache_cache_only(nau8824->regmap, true);
+		regcache_mark_dirty(nau8824->regmap);
+		return ret;
+	}
 	if (nau8824->irq) {
 		/* Hold semaphore to postpone playback happening
 		 * until jack detection done.
@@ -1555,7 +1563,10 @@ static int __maybe_unused nau8824_resume(struct snd_soc_component *component)
 		ret = nau8824_sema_acquire(nau8824, 0);
 		if (ret)
 			nau8824->resume_lock = false;
-		enable_irq(nau8824->irq);
+		if (nau8824->suspend_irq_disabled) {
+			nau8824->suspend_irq_disabled = false;
+			enable_irq(nau8824->irq);
+		}
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/nau8824.h b/sound/soc/codecs/nau8824.h
index d8e19515133c803c20dfcb167f073515daa6f39a..f44fc39836d634e8f0b98ac9292dabe8069612b2 100644
--- a/sound/soc/codecs/nau8824.h
+++ b/sound/soc/codecs/nau8824.h
@@ -437,6 +437,7 @@ struct nau8824 {
 	struct clk *mclk;
 	int fs;
 	int irq;
+	bool suspend_irq_disabled;
 	int resume_lock;
 	int micbias_voltage;
 	int vref_impedance;

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

