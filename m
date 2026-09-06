Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E3E3B71C5;
	Sun,  6 Sep 2026 03:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666244; cv=none; b=Iiu2vz28yJmHiYBu50JgkGPG1K1ggwLIfS0RycQ8c1yZcVqeT1I4fLMliRwR9ehWaggwDTiLuAWZICQRaoxNOLWjPO3egMVD8q8abUFvIk9C7Osw9US1ulZziTjnhgGMQH7CQu0851Q8qqpLWJEa6JRQBjFHRzCDOqcHZztYQKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666244; c=relaxed/simple;
	bh=YRLAXhhh+Eyn8eX4cqpoafdP3VQm+9Aid0vDq2mt9bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f2peUh0ZM6WWPESk+Nhd5w6UtqYWHDB5ZbJn2sjBjAxemyfJGCxXtwpoEEKu5wSgJLp9RRe8VGgBfvW3+XOwVAsci5inLtYydqvnAfhHth5/JP8s/N3tEaCT/ymOrI5ScqtF2IvT7hpSJRElLddjfKJQ6Xx+4ubEP7Lib4JhGBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L07bwKqi; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L07bwKqi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=H+
	bgcZJ2n5gwbo37r7m+GA+JZ8WPPazpIhfYaDFPHic=; b=L07bwKqiBbUjpY646/
	9bunbVx+/eg16kUBxhafAibJHpw3IRmLhdh1pi9/mlnc8Q3/xIsnGzsX1qc+hsuI
	I42ZoA1aqJUMepICREexeJdLANLFLLY4W0P2gZw4CtfzRq/RjthpMXgZNFBotdNx
	uuIZx6TEsb4dTGFZH9ly0JETY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S10;
	Sun, 06 Sep 2026 11:43:30 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] ASoC: rt5640: stop jack resume after restore errors
Date: Sun,  6 Sep 2026 11:43:20 +0800
Message-ID: <20260906034321.86080-9-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S10
X-Coremail-Antispam: 1Uf129KBjvJXoWxWFWDWrWUAr4ktr1rGryDWrg_yoW5WFWrpr
	15W39xJryDX3yxJFyFyr4Sgrn5CryxCF13JFW2y3yftr17Arn3Wrn5Jw4xZa98Wa4DArnr
	ZrsFv34Ygay0g3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlZXwUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QJSG2qc4WKzngAA3+

rt5640_resume() ignores cache replay and jack-detect register update
failures, then enables the IRQ and queues jack work. The work can
therefore run against a partially restored codec.

Return the first restore error before publishing IRQ or work activity.
Keep the LDO enabled on failure because deferred component resume
remains best effort and the core still marks the component resumed;
powering it down here would create a contradictory software and hardware
state.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 997b05203b0a ("ASoC: add RT5640 CODEC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/rt5640.c | 41 +++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 74fd05176eff..2ae3c7407ee7 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2826,6 +2826,7 @@ static int rt5640_suspend(struct snd_soc_component *component)
 static int rt5640_resume(struct snd_soc_component *component)
 {
 	struct rt5640_priv *rt5640 = snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	if (rt5640->ldo1_en) {
 		gpiod_set_value_cansleep(rt5640->ldo1_en, 1);
@@ -2833,35 +2834,41 @@ static int rt5640_resume(struct snd_soc_component *component)
 	}
 
 	regcache_cache_only(rt5640->regmap, false);
-	regcache_sync(rt5640->regmap);
+	ret = regcache_sync(rt5640->regmap);
+	if (ret)
+		return ret;
 
 	if (rt5640->jack) {
 		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
-			snd_soc_component_update_bits(component,
-				RT5640_GCTL2, 0x1100, 0x1100);
+			ret = snd_soc_component_update_bits(component,
+							    RT5640_GCTL2,
+							    0x1100, 0x1100);
 		} else {
 			if (rt5640->jd_inverted) {
 				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
-					snd_soc_component_update_bits(
-						component, RT5640_GCTL2,
-						RT5640_IRQ_JD2_MASK |
-						RT5640_JD2_MASK,
-						RT5640_IRQ_JD2_NOR |
-						RT5640_JD2_EN);
+					ret = snd_soc_component_update_bits(component,
+									    RT5640_GCTL2,
+									    RT5640_IRQ_JD2_MASK |
+									    RT5640_JD2_MASK,
+									    RT5640_IRQ_JD2_NOR |
+									    RT5640_JD2_EN);
 
 			} else {
 				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
-					snd_soc_component_update_bits(
-						component, RT5640_GCTL2,
-						RT5640_IRQ_JD2_MASK |
-						RT5640_JD2_P_MASK |
-						RT5640_JD2_MASK,
-						RT5640_IRQ_JD2_NOR |
-						RT5640_JD2_P_INV |
-						RT5640_JD2_EN);
+					ret = snd_soc_component_update_bits(component,
+									    RT5640_GCTL2,
+									    RT5640_IRQ_JD2_MASK |
+									    RT5640_JD2_P_MASK |
+									    RT5640_JD2_MASK,
+									    RT5640_IRQ_JD2_NOR |
+									    RT5640_JD2_P_INV |
+									    RT5640_JD2_EN);
 			}
 		}
 
+		if (ret < 0)
+			return ret;
+
 		enable_irq(rt5640->irq);
 		queue_delayed_work(system_dfl_long_wq, &rt5640->jack_work, 0);
 	}
-- 
2.50.1 (Apple Git-155)

