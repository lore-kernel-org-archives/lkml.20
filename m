Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847AE3C1977;
	Wed, 14 Oct 2026 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948334; cv=none; b=OPjye8FkLMkViNfC1ZJMCR1YpN3QEcjpeUlp3Doz6emi0S8/K2/Q6BQZoFtiCgx0dDDXhAhvKTgVSG3BzdJsJ9DFV7XD/5crxcAfOrMsvokz3ncc/OWyrThl5S2F3ubB2++iKSs4hycG22bAoEyhAoyCrp+9M+jlRzjd9d9Lxc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948334; c=relaxed/simple;
	bh=gNgb5psNen8K/d5g8peQEmCtk/uEuyEtVGGXsKMXYps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0jDYERTpAuas8aev51F2poL0yIPehnfVdJ+KoFxm2TBXhk8mSqMrakVa41oxdorvj3Lol1kOLa0VcDcvxzjO8QxdBdeikExkulfXM0LqbTZwO+v22GwVcjtYKgOf2wkmLgPtyWMecOt6wqJNDRkWqjBJEB4L2c1luLQHlYiyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=WN46vypI; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="WN46vypI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=H/
	sYmUCbiWUcpNWRY/wG3e2SV+DXH/sxQvHGXTzq84g=; b=WN46vypIzohvHirscs
	V73GT7A8jKtnq2TPue8IZjGh/tWguIFekg6IHeUf4GMpAmHgQJxNGEcKpMBeeg4g
	gVQUQL/aMMxYOwEoaAO/9HoLGEMl46pK89MSq/0ArsGW3EpMfylDQNQdcsNqEDdr
	kvMGYIb3AouMUbW7uPbxGMrBw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S8;
	Wed, 14 Oct 2026 11:24:59 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 6/9] ASoC: rt5682: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:49 +0800
Message-ID: <20261014032452.13456-7-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw1kGr1kZFyrGw1xKrg_yoW5tw13pF
	ZxGrZ5t3yUXrsFyF90yw48WF18GrWSka1jy347K34Utr15Arn3uw1fJr1UZF1DtrW0kFnr
	Wr4jv3yUWF45G3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pircTQUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gsO1mrO9gu6eAAA3m

rt5682_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

Leave the SoundWire no-op branch unchanged; stop the I2C jack restore
path on replay failure.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0ddce71c21f0 ("ASoC: rt5682: add rt5682 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/rt5682.c |   16 +++++++++++++---
 sound/soc/codecs/rt5682.h |    1 +
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 1aceb08b280d6cd4eca01badbc3107b0645c8949..db3f1383f84f5abaa2dc35681c59fe3f4a6188d4 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2962,8 +2962,10 @@ static int rt5682_suspend(struct snd_soc_component *component)
 	if (rt5682->is_sdw)
 		return 0;
 
-	if (rt5682->irq)
+	if (rt5682->irq && !rt5682->suspend_irq_disabled) {
 		disable_irq(rt5682->irq);
+		rt5682->suspend_irq_disabled = true;
+	}
 
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682->jd_check_work);
@@ -3010,12 +3012,18 @@ static int rt5682_suspend(struct snd_soc_component *component)
 static int rt5682_resume(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	if (rt5682->is_sdw)
 		return 0;
 
 	regcache_cache_only(rt5682->regmap, false);
-	regcache_sync(rt5682->regmap);
+	ret = regcache_sync(rt5682->regmap);
+	if (ret) {
+		regcache_cache_only(rt5682->regmap, true);
+		regcache_mark_dirty(rt5682->regmap);
+		return ret;
+	}
 
 	if (rt5682->hs_jack && (rt5682->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET) {
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
@@ -3033,8 +3041,10 @@ static int rt5682_resume(struct snd_soc_component *component)
 	mod_delayed_work(system_power_efficient_wq,
 		&rt5682->jack_detect_work, msecs_to_jiffies(0));
 
-	if (rt5682->irq)
+	if (rt5682->suspend_irq_disabled) {
+		rt5682->suspend_irq_disabled = false;
 		enable_irq(rt5682->irq);
+	}
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index de43a5d99403b926c21b2415af9022b42bf9ae8b..74356cd7fb45d84a49b6d532538ff03c529763e8 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1466,6 +1466,7 @@ struct rt5682_priv {
 
 	int jack_type;
 	int irq;
+	bool suspend_irq_disabled;
 	int irq_work_delay_time;
 };
 

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

