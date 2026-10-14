Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D203CEBBD;
	Wed, 14 Oct 2026 03:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948336; cv=none; b=OlGCsWbvhqPfek1vJW6B8YrwAazg+C1VoT6IPaiSGvjyGC0dO1xGdgcKzi4jusou9+9xgZKES+KcDwC5seYsQ7H4yxQ9e0F66dVvw65Fq0pfeyNOJoIEBJdNNxFQ0rxoQjnSabwE+YiChdL+7SY+JRvSK6ZwTfOUngb+Z06CvBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948336; c=relaxed/simple;
	bh=n45sEnyp+HliuCGNjGdUmXl+7KakqiBs7XChqE5nxtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T4kR/zMENhbnlIAuJICpuVTPJKPh02yMugAxdDBW705thtv2dBP7erTISpHMcugn55xW7vHKoVTcNpByLjiejAsrRzdU3+mPzIsmmrzA+BJmjQMwdmd7cR55kKM3xvJ3vDDR/b/Agvztnyddz4SXyBhAVkBTBdCS5EXllr2un5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DBw2OjEB; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DBw2OjEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=X/
	hzWCxcEgnJSb6lrXfSt4NpdY/QiHlMOM4iodoLE/k=; b=DBw2OjEB/9/oxhNV39
	zoouDTXDLJk2bWe8JuGPx0WNiyBLUqCt39uB3Cy1RQ8VdyLY/pdcVtrAeg016Sz4
	65YTCS9yeDeFVpNzjGTw4TyjHNnAmzpTGhevLfzHjTn20h4R1F7CN84tGkzp+pYO
	qA4TR9lgdlexzuQoEP+VqQTbE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S10;
	Wed, 14 Oct 2026 11:25:00 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	Stephen Warren <swarren@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 8/9] ASoC: rt5640: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:51 +0800
Message-ID: <20261014032452.13456-9-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S10
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF17XF45Aw4DGry5urW8Crg_yoW7Aw4fpr
	ZxG398try8XayxuFy5t3y0gF1kJrWI9F43A3y7Kayxtr15Arn3Wrn5JF13Z3Z2qrWkAFnr
	ZrWUX3y8XF48X3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pircTQUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QwP12rO9gzDtAAA3Q

rt5640_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Both the codec IRQ and the optional GPIO jack IRQ can queue jack work.
Quiesce both before cancelling that work, retain their disable
references on replay failure, and clear each reference if jack teardown
frees that IRQ. Restore the optional LDO GPIO on failure and reject new
jack setup until a later replay succeeds; teardown remains allowed.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 997b05203b0a ("ASoC: add RT5640 CODEC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- cover both IRQ producers and jack teardown/re-registration after failure
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/rt5640.c |   37 ++++++++++++++++++++++++++++++++++---
 sound/soc/codecs/rt5640.h |    3 +++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index d6068bb5cb4c841ebbc3892b5f6271fca246701d..8b592370d1294ae70d38cb40998f813b6eddc2ad 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2433,11 +2433,13 @@ static void rt5640_disable_irq_and_cancel_work(void *data)
 	if (rt5640->jd_gpio_irq_requested) {
 		free_irq(rt5640->jd_gpio_irq, rt5640);
 		rt5640->jd_gpio_irq_requested = false;
+		rt5640->suspend_jd_gpio_irq_disabled = false;
 	}
 
 	if (rt5640->irq_requested) {
 		free_irq(rt5640->irq, rt5640);
 		rt5640->irq_requested = false;
+		rt5640->suspend_irq_disabled = false;
 	}
 
 	cancel_delayed_work_sync(&rt5640->jack_work);
@@ -2646,6 +2648,10 @@ static int rt5640_set_jack(struct snd_soc_component *component,
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
 
+	/* Do not publish fresh IRQs while the register cache is unrestored. */
+	if (jack && rt5640->resume_failed)
+		return -EIO;
+
 	if (jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
 			rt5640_enable_hda_jack_detect(component, jack);
@@ -2803,7 +2809,15 @@ static int rt5640_suspend(struct snd_soc_component *component)
 
 	if (rt5640->jack) {
 		/* disable jack interrupts during system suspend */
-		disable_irq(rt5640->irq);
+		if (rt5640->irq_requested && !rt5640->suspend_irq_disabled) {
+			disable_irq(rt5640->irq);
+			rt5640->suspend_irq_disabled = true;
+		}
+		if (rt5640->jd_gpio_irq_requested &&
+		    !rt5640->suspend_jd_gpio_irq_disabled) {
+			disable_irq(rt5640->jd_gpio_irq);
+			rt5640->suspend_jd_gpio_irq_disabled = true;
+		}
 		cancel_delayed_work_sync(&rt5640->jack_work);
 		cancel_delayed_work_sync(&rt5640->bp_work);
 	}
@@ -2821,6 +2835,7 @@ static int rt5640_suspend(struct snd_soc_component *component)
 static int rt5640_resume(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	if (rt5640->ldo1_en) {
 		gpiod_set_value_cansleep(rt5640->ldo1_en, 1);
@@ -2828,7 +2843,16 @@ static int rt5640_resume(struct snd_soc_component *component)
 	}
 
 	regcache_cache_only(rt5640->regmap, false);
-	regcache_sync(rt5640->regmap);
+	ret = regcache_sync(rt5640->regmap);
+	if (ret) {
+		rt5640->resume_failed = true;
+		regcache_cache_only(rt5640->regmap, true);
+		regcache_mark_dirty(rt5640->regmap);
+		if (rt5640->ldo1_en)
+			gpiod_set_value_cansleep(rt5640->ldo1_en, 0);
+		return ret;
+	}
+	rt5640->resume_failed = false;
 
 	if (rt5640->jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
@@ -2857,7 +2881,14 @@ static int rt5640_resume(struct snd_soc_component *component)
 			}
 		}
 
-		enable_irq(rt5640->irq);
+		if (rt5640->suspend_irq_disabled) {
+			rt5640->suspend_irq_disabled = false;
+			enable_irq(rt5640->irq);
+		}
+		if (rt5640->suspend_jd_gpio_irq_disabled) {
+			rt5640->suspend_jd_gpio_irq_disabled = false;
+			enable_irq(rt5640->jd_gpio_irq);
+		}
 		queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 	}
 
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 8a12cee76bdc65b73c3a1c4b6ef53e0dc3bdb8b9..eceff517d44eb1b0d881c5a07c825cf4be7d714b 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -2154,7 +2154,10 @@ struct rt5640_priv {
 	bool hp_mute;
 	bool asrc_en;
 	bool irq_requested;
+	bool suspend_irq_disabled;
 	bool jd_gpio_irq_requested;
+	bool suspend_jd_gpio_irq_disabled;
+	bool resume_failed;
 
 	/* Jack and button detect data */
 	bool ovcd_irq_enabled;

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

