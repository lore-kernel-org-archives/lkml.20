Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EEB28851F;
	Sun,  6 Sep 2026 03:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666242; cv=none; b=a2b2lg922GXMYsEWRAQsi6hiYfVtRURApdo98k8YGSMTRSN3fHT1tU8UADIqlQPbBXnt0nmGVoObFurxvxzR8sp6QLkXc3u42R3Amqb8HRBivo66M8HVN7JqI+QqfoUBeuqDTQOlO0JWfhQpKFyeByi6yX28qIBOI9iuitVyXI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666242; c=relaxed/simple;
	bh=52mewy6xIGmCPrHUdk6bECDGyU6IDtxh4tBpYBvPeOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DEpf3Fa5tsVfto8jAt1l7L8I3oZxuFqy/DAHX4OdF9kE9GpWTV4875bklFjuMCQKD7pG3/8c2ousKJz7HwXPu+4mfBIDKCNnX2zFJjSAKgAptOWNXYgaluuD8lWibQJFBUnHlKiCpn5aFeet3sD3P6v7oSmXDk8pt8r8gIE+KPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=U6SYj4l5; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="U6SYj4l5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=0R
	M/inwR7R9CQM/9L/hu82uQOOjsGR6Jedav/oKBof0=; b=U6SYj4l5Chd4EWKgfQ
	SYqLla6Gu2erOl0SOPe3jfYVKN/E/L/r6zVx3R+G56PMo4C2RuoMgqiqNAvAhTeE
	L2nnJoNGQwTdLF+/SrxW++oIJPim1UvCI/DnSinFEtxYbu0QIUy7Dy9pTSTdEzck
	zeVmwL5e3POVnSQchT/IpHbB8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S8;
	Sun, 06 Sep 2026 11:43:29 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <bardliao@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] ASoC: rt5682: stop jack resume after restore errors
Date: Sun,  6 Sep 2026 11:43:18 +0800
Message-ID: <20260906034321.86080-7-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxCrW3ur1rZr4rJFWrCw1fXrb_yoW5WrW5pF
	sxGrZ8JrWvqws7GFyFvr4xXr1fCrWxAa12yFy7t34vkr1UAr1xWr10vrWkZF9rJrWrGrnr
	ZrsrZ34Y9a15u3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UliiDUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gFSG2qc4WGwfQAA3d

rt5682_resume() ignores cache replay and headset register update
failures, then clears the jack state, schedules jack detection and
enables the IRQ. The published jack work can therefore run against a
partially restored codec.

Check cache synchronization and each fallible headset register update
before publishing jack work or enabling the IRQ. Return the first error
to the ASoC component wrapper, which reports it while retaining
best-effort card resume. The successful resume order is unchanged and no
rollback is attempted after a partial register update.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0ddce71c21f0 ("ASoC: rt5682: add rt5682 codec driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/rt5682.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 6f7e68c20d13..59c3f8b7a600 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -3010,23 +3010,42 @@ static int rt5682_suspend(struct snd_soc_component *component)
 static int rt5682_resume(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	if (rt5682->is_sdw)
 		return 0;
 
 	regcache_cache_only(rt5682->regmap, false);
-	regcache_sync(rt5682->regmap);
+	ret = regcache_sync(rt5682->regmap);
+	if (ret)
+		return ret;
 
 	if (rt5682->hs_jack && (rt5682->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET) {
-		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
-			RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_SEL_MB1_MB2_MASK,
-			RT5682_SAR_BUTDET_POW_NORM | RT5682_SAR_SEL_MB1_MB2_AUTO);
+		ret = snd_soc_component_update_bits(component,
+						    RT5682_SAR_IL_CMD_1,
+						    RT5682_SAR_BUTDET_MODE_MASK |
+						    RT5682_SAR_SEL_MB1_MB2_MASK,
+						    RT5682_SAR_BUTDET_POW_NORM |
+						    RT5682_SAR_SEL_MB1_MB2_AUTO);
+		if (ret < 0)
+			return ret;
+
 		usleep_range(5000, 6000);
-		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
-			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
-			RT5682_CTRL_MB1_FSM | RT5682_CTRL_MB2_FSM);
-		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
-			RT5682_PWR_CBJ, RT5682_PWR_CBJ);
+		ret = snd_soc_component_update_bits(component,
+						    RT5682_CBJ_CTRL_1,
+						    RT5682_MB1_PATH_MASK |
+						    RT5682_MB2_PATH_MASK,
+						    RT5682_CTRL_MB1_FSM |
+						    RT5682_CTRL_MB2_FSM);
+		if (ret < 0)
+			return ret;
+
+		ret = snd_soc_component_update_bits(component,
+						    RT5682_PWR_ANLG_3,
+						    RT5682_PWR_CBJ,
+						    RT5682_PWR_CBJ);
+		if (ret < 0)
+			return ret;
 	}
 
 	rt5682->jack_type = 0;
-- 
2.50.1 (Apple Git-155)

