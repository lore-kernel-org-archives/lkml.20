Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0833D75B5;
	Wed, 14 Oct 2026 03:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948337; cv=none; b=EIIcRnGT1zYcCdFiPZw+mMHF8+6ZUy699A4JaOTUBohdckrkxW/j6zqrz5T9PCPvW/U3+IslZTozJpagPpoWW2dRbB5sN9Xtw1QwoumcCM29Lft+AKidIifcdVNLfhFvB/zy9a1MnRP/v40ymda2zxRaPy0zBBLN8ouZozgRjpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948337; c=relaxed/simple;
	bh=MIPP6UyFbJzNO1mzdaz+kOAf4ca5maaBEaNrOfJVG7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI4zwepJR7Y+4YuK02Hrc6MxFoqgh9YuspPuYDIn+9ZrSXGd5Yu3gjT0EUES3hX8KPXnGKcMhFqcvf61x2+Oaz1I4NSpfY1+RMvEGQN7m7UBu1rylrsa4JrSpBezoUD3BqsM7At/efTCuW0kOlF7HYlO5EerDxy2IqzOWwhru0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TUiAQJZl; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TUiAQJZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=eN
	sFNNOwDwb8EflnzlijVBz2T10n6ZBRyLtGhrLNqNg=; b=TUiAQJZlFJupU7N1VQ
	TejB+ZvkyIy0iV4lQsXa05bs2VkQ5KhUnIybkmtENlKnRkkgMN/B5UHhgINIZST6
	JJeIQjwlK4T1o7rYGAdcM93QGB+zmOzoko9/kOSzTYaljS+JWa2V0cGMDFE4lfla
	Cz8RF4NjCyj5pzfCbzANX8+m4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S7;
	Wed, 14 Oct 2026 11:24:58 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Derek Fang <derek.fang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 5/9] ASoC: rt5682s: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:48 +0800
Message-ID: <20261014032452.13456-6-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S7
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw4xCF45Jw4rtr4ruFg_yoW5uFyxpr
	ZIgrZ5try7Xr4IvF90yr48XF1vkrWkKF4UAa4xKw1ay345Ar1fur1xJr12vFyDtrWrKFnr
	Wr42q3yUuF45C3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirMaOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7goO1mrO9gq6TQAA3T

rt5682s_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Do not schedule jack-detection work or enable its IRQ after a failed
replay.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/rt5682s.c |   16 +++++++++++++---
 sound/soc/codecs/rt5682s.h |    1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 49ed7793d3a205cd0544ea8b50dd80cbba74b9da..0c669833df7c1565de6d4428fea47af597c7294d 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2884,8 +2884,10 @@ static int rt5682s_suspend(struct snd_soc_component *component)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	if (rt5682s->irq)
+	if (rt5682s->irq && !rt5682s->suspend_irq_disabled) {
 		disable_irq(rt5682s->irq);
+		rt5682s->suspend_irq_disabled = true;
+	}
 
 	cancel_delayed_work_sync(&rt5682s->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682s->jd_check_work);
@@ -2902,17 +2904,25 @@ static int rt5682s_suspend(struct snd_soc_component *component)
 static int rt5682s_resume(struct snd_soc_component *component)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(rt5682s->regmap, false);
-	regcache_sync(rt5682s->regmap);
+	ret = regcache_sync(rt5682s->regmap);
+	if (ret) {
+		regcache_cache_only(rt5682s->regmap, true);
+		regcache_mark_dirty(rt5682s->regmap);
+		return ret;
+	}
 
 	if (rt5682s->hs_jack) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682s->jack_detect_work, msecs_to_jiffies(0));
 	}
 
-	if (rt5682s->irq)
+	if (rt5682s->suspend_irq_disabled) {
+		rt5682s->suspend_irq_disabled = false;
 		enable_irq(rt5682s->irq);
+	}
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 67f42898de9679679a97ff6a6b65e4b3100c9b59..a9da00e8df78293ec6c5f982682c3d55a23d88bb 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1482,6 +1482,7 @@ struct rt5682s_priv {
 
 	int jack_type;
 	unsigned int irq;
+	bool suspend_irq_disabled;
 	int irq_work_delay_time;
 	int wclk_enabled;
 };

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

