Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF1E3C5857;
	Wed, 14 Oct 2026 03:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948333; cv=none; b=vAWfWU8+CaOYvIOV2VgExu+siVCjdyVdqLA2cD34S8xjg3z1e4bbKSWQZQQuS3bcbVKlT+/uqzcqF/XR/J8bRuE9kBrIXUITp7G8JkCkF5t5e9np+yaA9yJZVqgPRrK8i2jtzEhsCEEMotDL7tjnqI1xrYFP9mXqo4/NfABnWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948333; c=relaxed/simple;
	bh=fw5lB2sgYxZgdLlQFDwjQeBXVp7tJFOURK6CCOvlzxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a0y/pcwVPyrs3tQE3ajzNDkruNRf3U3QlceQlJC8t06buEpYaqdO9PieMs/hxFEK1GMn+vtowF2oRfcbvafa0N7aVOzguoNLROXGxZzAMD831Wy+GmmIs+jreKWbSWXgP8w7bHJs2DBzD+QglXllLy70yhP8+1Nd8pAXSNnHMRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=RYJdVxtn; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="RYJdVxtn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Vj
	aOfUXLUmCqR08z3V3xlnlFVncViHQcbCDJvc5knMw=; b=RYJdVxtnQoJDWIAhKj
	ex3o75fQz2hw32V5iw4y3PsG0QUoWDwS6Rkq4B8yJpP9iPymMnfac3wsvrqLaIZU
	o1xbiWnA6XDJleuBlvVHVQv6zapenHQDgr865pAXpuX+UJOnWLYZX1cpHhucTjCI
	3hw9NwS1SBOAUYpyfvL0D4buE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S6;
	Wed, 14 Oct 2026 11:24:57 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jack Yu <jack.yu@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	John Lin <john.lin@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 4/9] ASoC: rt5663: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:47 +0800
Message-ID: <20261014032452.13456-5-hppiscas@163.com>
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
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxZw15Aw4xCF45Gw4rGrW3ZFb_yoW5Ww13pF
	ZIgFZYyw1xXr4I9FZ0yr48ZF1rCrWxKayFy3y7K342y343Jr1xur1rtF12va4qqrW5Jrnr
	Zr40q34kWF1rGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pirMaOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7QoO1mrO9grDKQAA3N

rt5663_resume() ignores regcache_sync() failure before continuing
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

Fixes: df7c52168ee1 ("ASoC: add rt5663 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/rt5663.c |   17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index ec46e6180cc0ee9fd66df0174bf0d0ac8022dc45..bd6a8e98bf44445e91edf81896f526a180df083f 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -75,6 +75,7 @@ struct rt5663_priv {
 
 	int jack_type;
 	unsigned int irq;
+	bool suspend_irq_disabled;
 };
 
 static const struct reg_sequence rt5663_patch_list[] = {
@@ -3187,8 +3188,10 @@ static int rt5663_suspend(struct snd_soc_component *component)
 {
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
 
-	if (rt5663->irq)
+	if (rt5663->irq && !rt5663->suspend_irq_disabled) {
 		disable_irq(rt5663->irq);
+		rt5663->suspend_irq_disabled = true;
+	}
 
 	cancel_delayed_work_sync(&rt5663->jack_detect_work);
 	cancel_delayed_work_sync(&rt5663->jd_unplug_work);
@@ -3202,14 +3205,22 @@ static int rt5663_suspend(struct snd_soc_component *component)
 static int rt5663_resume(struct snd_soc_component *component)
 {
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(rt5663->regmap, false);
-	regcache_sync(rt5663->regmap);
+	ret = regcache_sync(rt5663->regmap);
+	if (ret) {
+		regcache_cache_only(rt5663->regmap, true);
+		regcache_mark_dirty(rt5663->regmap);
+		return ret;
+	}
 
 	rt5663_irq(0, rt5663);
 
-	if (rt5663->irq)
+	if (rt5663->suspend_irq_disabled) {
+		rt5663->suspend_irq_disabled = false;
 		enable_irq(rt5663->irq);
+	}
 
 	return 0;
 }

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

