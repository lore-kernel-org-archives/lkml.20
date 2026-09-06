Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C07A3B5307;
	Sun,  6 Sep 2026 03:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666243; cv=none; b=G7iYVG79IIloq8JynWC1pVDju+Nj5dx7sYjEmDKhect3AfS5n+JXcDFIMuPR3ZWWPE78jYpGMx/PARvjGQA2W4wGa2Avum8pGH/5xz1V+giU3FpRpbeOTloDBsrz/GsUhj7lp4Hinbr4VDGdPW1sHp7eBWgDVWBKxum5l176aBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666243; c=relaxed/simple;
	bh=U5jMyqtu2sJ2vMyscEQYPQ1Za/4ab3Q7PCVxEMAan+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fAl6KIGS4LFlk8i1CBRSrvz/7aaJuOU8LgkdE77GuCRlGCnYrtccnYYlptQtqdpz/H7ftN6vZ17gJhyhicQ4I/wyz7uopmGX8REVa2fe80LVqfGTgTczwdOD2jCvhlhgqp6RHnqud79nzV40FmPZpT0HPcj26rr0kjJbhOlnU8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=UGUOvHOS; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UGUOvHOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Hi
	L2YWgaX4yHZSMXrcu25hFHSxzt3BDRx098HLV/PC4=; b=UGUOvHOSYe2Kbg1ICw
	hX7/bCv4qlQ5QNSWHguvlFctewy7Q4hYb/4Ad6LwV02vu6XUsN7FJfcVt6sXlcSF
	mShRfA/AxCbdgM8Qnp+eWWY4Ptt2L6xOGmKx87eHiFS3k3owQuylioPzy0IJZAl8
	GI9OtlqFRuB+lhsRmwWmi64ow=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S7;
	Sun, 06 Sep 2026 11:43:28 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Derek Fang <derek.fang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] ASoC: rt5682s: stop resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:17 +0800
Message-ID: <20260906034321.86080-6-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3ArW3ArW5WFy5KryrCrg_yoW8XF4Dpr
	Z3GrZ8Jr97Xw47Aay0yr48XFnYk393CF45Aa4Ut34I9r98Ar1xur1xtr12vFykJrW8Grnr
	Zr4jvw15ua15C3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UlAp5UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gBSG2qc4WCwdgAA3W

rt5682s_resume() restores cached registers during component resume but
ignores a regcache_sync() failure and continues with jack work
scheduling and IRQ enablement. Those operations assume that the codec
register state has already been restored.

Stop the local resume sequence when cache replay fails and return the
error to the ASoC component wrapper. The wrapper reports the failure
while retaining best-effort card resume, so no rollback or retry
semantics are introduced.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: bdd229ab26be ("ASoC: rt5682s: Add driver for ALC5682I-VS codec")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/rt5682s.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 34997cfb465b..4baadb542cf7 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -2907,9 +2907,12 @@ static int rt5682s_suspend(struct snd_soc_component *component)
 static int rt5682s_resume(struct snd_soc_component *component)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	regcache_cache_only(rt5682s->regmap, false);
-	regcache_sync(rt5682s->regmap);
+	ret = regcache_sync(rt5682s->regmap);
+	if (ret)
+		return ret;
 
 	if (rt5682s->hs_jack) {
 		mod_delayed_work(system_power_efficient_wq,
-- 
2.50.1 (Apple Git-155)

