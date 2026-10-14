Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EBD3A0E86;
	Wed, 14 Oct 2026 03:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948330; cv=none; b=LNNmeNRV0cVN4Kl2L+qN2DJtcVI1jDazY/WxkXET68K39kdwqLL7hf4iaLfs8w0c48qyoV0vvSD/gDEq/Lep4pGKt5roagm2+x4RT3aLXttrRDIJ2FRNFSbAWK5vFDFnCgHS6wqYqHA1G3N0NTJWxUs1R+EvjfRwYt/g2Y3OGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948330; c=relaxed/simple;
	bh=SVyjVHAMbYnhX6CQYSaH9KFh2KjLKhN2Ue8FRgH+b60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rv1VVIxIRLoK3lVZ7uxYTimqNDNOSIxfKrV+d9s+g6nOAaYXhLYfcpylIzQkIAKSd2WLPX7ayzPsw8ZFKNVq+XDU2jPQpbYvteoEIvQuBCDiilYkId8E+zxIOijGOflaiuHXHdU1Ww97GAtfDWy6pIVdhsQnY+oUl65wm8S9GXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pzyZ4c8O; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pzyZ4c8O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=QE
	PSUS0RnCaIOeM02caBuDz3DEL5Un3QuljGJ3QU6oY=; b=pzyZ4c8OKKdJIMbnG+
	153tOp2oJ8cgJPxUvliwgGA0+buSlFN5+q7A7oq6Gf95yjMLIc1fre2dyMZpenCT
	Ajes3CNx6F+4PHq481JEj3Vp1soaybegjTS5kgG/oOnxrh6Vao1S8nAV07w9CQtf
	CHKJVvngmLK1bit/rI78Tpvbk=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S5;
	Wed, 14 Oct 2026 11:24:57 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Fang, Yang A" <yang.a.fang@intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 3/9] ASoC: nau8825: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:46 +0800
Message-ID: <20261014032452.13456-4-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw4xCF45GF43Xr1DZFb_yoW5uryxpr
	Z3GrZYq3yfXF48CFyFyr48XFnYkrWfKF47AwnxK3yDX3W5Cry8WFn5Jr1UZFWDtryUKF9r
	XF47J3yxGr15C3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRbB_UUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QkO1mrO9gnDDQAA3p

nau8825_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Do not start crosstalk protection or enable its IRQ after a failed
replay.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 4454a8378be5 ("ASoC: nau8825: add pm function")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/nau8825.c |   17 ++++++++++++++---
 sound/soc/codecs/nau8825.h |    1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 63d927f3140902e179bd491f757f4c47e8c314b1..11c548b99ea6d758ba3843090ee65b3d9f8f8245 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2683,7 +2683,10 @@ static int __maybe_unused nau8825_suspend(struct snd_soc_component *component)
 {
 	struct nau8825 *nau8825 = snd_soc_component_get_drvdata(component);
 
-	disable_irq(nau8825->irq);
+	if (!nau8825->suspend_irq_disabled) {
+		disable_irq(nau8825->irq);
+		nau8825->suspend_irq_disabled = true;
+	}
 	snd_soc_dapm_force_bias_level(nau8825->dapm, SND_SOC_BIAS_OFF);
 	/* Power down codec power; don't suppoet button wakeup */
 	snd_soc_dapm_disable_pin(nau8825->dapm, "SAR");
@@ -2701,12 +2704,20 @@ static int __maybe_unused nau8825_resume(struct snd_soc_component *component)
 	int ret;
 
 	regcache_cache_only(nau8825->regmap, false);
-	regcache_sync(nau8825->regmap);
+	ret = regcache_sync(nau8825->regmap);
+	if (ret) {
+		regcache_cache_only(nau8825->regmap, true);
+		regcache_mark_dirty(nau8825->regmap);
+		return ret;
+	}
 	nau8825->xtalk_protect = true;
 	ret = nau8825_sema_acquire(nau8825, 0);
 	if (ret)
 		nau8825->xtalk_protect = false;
-	enable_irq(nau8825->irq);
+	if (nau8825->suspend_irq_disabled) {
+		nau8825->suspend_irq_disabled = false;
+		enable_irq(nau8825->irq);
+	}
 
 	return 0;
 }
diff --git a/sound/soc/codecs/nau8825.h b/sound/soc/codecs/nau8825.h
index 2abfbb5184da80f3637f06d57a7564fbf1c7574c..8238570ed48c2b147a4a1a0d7061603f8b9b4835 100644
--- a/sound/soc/codecs/nau8825.h
+++ b/sound/soc/codecs/nau8825.h
@@ -502,6 +502,7 @@ struct nau8825 {
 	struct semaphore xtalk_sem;
 	int sw_id;
 	int irq;
+	bool suspend_irq_disabled;
 	int mclk_freq; /* 0 - mclk is disabled */
 	int button_pressed;
 	int micbias_voltage;

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

