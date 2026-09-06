Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70DA3B3BFE;
	Sun,  6 Sep 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666238; cv=none; b=uyoPMy1SD5AZsantjn5FteporFpfg7YhGyd/jnbwf5NubhqQ632i1BPK/VcGq8bX2jqJYyUYSTXelzHnbN3E1mphV6Q75bVvPoYKEFKgaksHhuAzspG3B6pnpdePd2XRXUixRYcO8l35tpO9aUy26xuAHXiU9nVRwSpqHi4Knbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666238; c=relaxed/simple;
	bh=9b+F8e+wJYANk4mosK8r0dR4jifj6aimDHy9iQW/mDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMhmRylWtPgnLjTDqX+ndAkuMCXRuJ6VCv6LBvYBSPqq3k5ikbK4a8C3hjr2ccVj5dNH9S9BKSYCPyjevUrV0luZ2/C8dt9LALAszddviZCMuLoi4KlZuwMAw+rXe/isA+i/c9s4g44fafd/KDgdwZeJMFaBGn+u3BOP4Q1Qgsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=oEXg6h5U; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="oEXg6h5U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/t
	m7+9Ja2Dd6OLi0LaDHnGD+scflB67z6EXdpHwDxls=; b=oEXg6h5U9bK1E16vm7
	Gn919xabLXUsHU4m0jUZZDWKtHImY4YRFj2FNZq+6bA9QSZ8loTs5exrRNnuR3ZQ
	Avqn2URo/+jkl7kDBeghqjuhSxWa9MWyTK3duJInJ+AQPjIuvdYzK1sLe16moWbP
	2mOPrvs7XUl+LzwAI05gM3Mt8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S11;
	Sun, 06 Sep 2026 11:43:30 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 9/9] ASoC: rt5677: stop IRQ resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:21 +0800
Message-ID: <20260906034321.86080-10-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S11
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrWDtr45tF13Zw4UXr47Arb_yoW8WryUpF
	Z8K395J34jqF43CFWYyr48XF9ak3yfCFW5Aa40g34Fkr15CF1xua48tr1jvF98GrW8uwnI
	vF42v34UZa1ruaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_b1nUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gNSG2qc4WOwmAAA34

rt5677_resume() ignores a regcache_sync() failure after powering and
resetting the codec, then enables the IRQ and schedules a resume check.
Those operations assume that the register state has been restored.

Return the cache replay error before publishing IRQ activity. Leave the
power GPIO state unchanged on failure because deferred component resume
remains best effort and the core still marks the component resumed;
rolling power back here would create a contradictory hardware state.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0e826e867264 ("ASoC: add RT5677 CODEC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/rt5677.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 4757017cc83d..2bcb4e5739d1 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4956,6 +4956,7 @@ static int rt5677_suspend(struct snd_soc_component *component)
 static int rt5677_resume(struct snd_soc_component *component)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	if (!rt5677->dsp_vad_en) {
 		rt5677->pll_src = 0;
@@ -4967,7 +4968,9 @@ static int rt5677_resume(struct snd_soc_component *component)
 			msleep(10);
 
 		regcache_cache_only(rt5677->regmap, false);
-		regcache_sync(rt5677->regmap);
+		ret = regcache_sync(rt5677->regmap);
+		if (ret)
+			return ret;
 	}
 
 	if (rt5677->irq) {
-- 
2.50.1 (Apple Git-155)

