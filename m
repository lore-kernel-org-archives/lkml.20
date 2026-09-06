Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F233AF657;
	Sun,  6 Sep 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666237; cv=none; b=UW9QR1KkW2+UHPOudOxAfTzVwZcjWNH9sVdfZJlIVniLy7LE9JTeR2kcF7aJ3A4OG8Ug2y6ksWge6gY7W92ZFF+ptilGHN4fbqdEcF0NE8YLhTRC9Gv6t49oQp0/qGiSUrnZ6xCHMw7XmxXunF9WVzVah2bmhwsLMHD+5IzRnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666237; c=relaxed/simple;
	bh=3wJfIVNiB+LZQex5XKXCixP+hpEOeWgtV6ddCvKODz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zba1VYwFOIT7DT9zWXL1bzVzO4jO77EdH5jdRFrNXidge2eAu3OgcliTNisjKV9U6Rk3+g9a6ZzeVCdjYJ/nBElRvByWrFzwG73ke2zXozxMivHu893ITiFuhBOY2ytE1JzCQnqQ+iAfJtmAF13Wjopaw1uRB4nMmAccUwXaBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=REti0lUD; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="REti0lUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=WU
	nqizWtKi4J+FvjH6NZiK6lXZyB4b/+XDJUcrIzfZM=; b=REti0lUDUql33kuXvo
	MdYZ11NfOPUN5NE3x9MnXKLZSdAOqS8yyoNCXyy4Rph+XCioCeGPCvtDYIMPV6S+
	DbvfBEo1gGYP3gPnV4yQTRba9+aieAqeV2Kn/ziW/gR2D2WJFpUnlT6yjmonAwap
	8mvHQPpNVGuW1d0+MJmIfqSuo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S6;
	Sun, 06 Sep 2026 11:43:28 +0800 (CST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] ASoC: rt5663: stop resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:16 +0800
Message-ID: <20260906034321.86080-5-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3ArW3ArW5Ww4rZr1xGrg_yoW8Gw1xpF
	ZxGFZYyrykXw43CFW0yr4kX3Z3C393GFWrJayUK34I9r15JF1xur1rtF12vas8tr48Grsr
	Zr40q3y5Ca15CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlZXwUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgBSG2qc4WDUQgAA3u

rt5663_resume() restores cached registers during component resume but
ignores a regcache_sync() failure and continues with jack IRQ processing
and IRQ enablement. Those operations assume that the codec register
state has already been restored.

Stop the local resume sequence when cache replay fails and return the
error to the ASoC component wrapper. The wrapper reports the failure
while retaining best-effort card resume, so no rollback or retry
semantics are introduced.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: df7c52168ee1 ("ASoC: add rt5663 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/rt5663.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index 262d3bba1f3d..b3d16c6d2a00 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3202,9 +3202,12 @@ static int rt5663_suspend(struct snd_soc_component *component)
 static int rt5663_resume(struct snd_soc_component *component)
 {
 	struct rt5663_priv *rt5663 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(rt5663->regmap, false);
-	regcache_sync(rt5663->regmap);
+	ret = regcache_sync(rt5663->regmap);
+	if (ret)
+		return ret;
 
 	rt5663_irq(0, rt5663);
 
-- 
2.50.1 (Apple Git-155)

