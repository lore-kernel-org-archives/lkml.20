Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5397737A839;
	Sun,  6 Sep 2026 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666175; cv=none; b=Dp4x4io8m/zczn9X7gkJ7tzXRCj+T4AJARa61xPP0qeFb8g1JLSgboJ9WnYzcV9c36dVSWLyoxIEq/+CwFjfKryIzFCM3R/kv1T68ksiw/KEkLruZwI9MkLeggKH3cfJDuHVMxob8soQNv4UUhquFOhEU2a/vWCDQzD7TEVS2dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666175; c=relaxed/simple;
	bh=s2ely7C8IHvnn1zVkej3RjWU3H45Mk+y2tp56m3lSdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UGX9Uh+pOzwtWysEgUhBpHTQj++WcJweHLc5Eb9LoXf3ygCLONd2uQb5TGiLcO6zux9UQ0kZWyK7Yvtno65HQsLOMw+TWGBriBWky8kSA1OZMplCrwVsv37V3HLU17O9dhk5mCJF9+V6n1opBXsMIovkbACbf8J9QyhKI9E1vgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DowkPoow; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DowkPoow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hB
	md32aKMBI3im5/Bl5uvL0+27adgzsCRSSkVsFnMnA=; b=DowkPoowuvDxaKU7io
	ulv3jUPjIvWN+x5SY7pOPQYzRng8XXF+x5tsrps8xh7Bu17eSaCfiXPVnpFZL6pp
	qDnuvaunMMneFBA039WonWXUn7xVOzsUNrrhKaBV/lneNMbgAGYhbnoYk9OTmZ35
	Q531MuW2uWASfzyl4UuG1zIYM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXHxcb4Zxq8PnERA--.33810S5;
	Sun, 06 Sep 2026 11:42:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ASoC: es8389: report resume restore errors
Date: Sun,  6 Sep 2026 11:42:16 +0800
Message-ID: <20260906034217.85696-4-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXHxcb4Zxq8PnERA--.33810S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWDZFyxXFW3uw17JF1UKFg_yoW8CF4fpF
	9xGFWfKr1xXw4fur45ta18ZFyFkrZ2yFW3A342g34xur1rZ34rKa1rKF1UuF98JF47WFsr
	Zr1jqw18WF1kXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j3739UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxh5BCmqc4R7QjwAA3F

es8389_resume() ignores the reset-register read, bias restoration and
register-cache replay. A failed read can leave regv uninitialized before
it selects the initialization path.

Check those operations and always leave cache bypass before returning an
error. The ASoC component wrapper reports callback failures while retaining
its best-effort resume contract.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0319c26889f7 ("ASoC: codecs: add support for ES8389")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/es8389.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 80efce3e0a22..204fe6731140 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -1026,20 +1026,28 @@ static int es8389_resume(struct snd_soc_component *component)
 {
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 	unsigned int regv;
+	int ret;
 
 	regcache_cache_only(es8389->regmap, false);
 	regcache_cache_bypass(es8389->regmap, true);
-	regmap_read(es8389->regmap, ES8389_RESET, &regv);
+	ret = regmap_read(es8389->regmap, ES8389_RESET, &regv);
+	if (ret)
+		goto disable_bypass;
 
-	if (regv == 0xff)
+	if (regv == 0xff) {
 		es8389_init(component);
-	else
-		es8389_set_bias_level(component, SND_SOC_BIAS_ON);
+	} else {
+		ret = es8389_set_bias_level(component, SND_SOC_BIAS_ON);
+		if (ret)
+			goto disable_bypass;
+	}
 
+disable_bypass:
 	regcache_cache_bypass(es8389->regmap, false);
-	regcache_sync(es8389->regmap);
+	if (ret)
+		return ret;
 
-	return 0;
+	return regcache_sync(es8389->regmap);
 }
 
 static int es8389_probe(struct snd_soc_component *component)
-- 
2.50.1 (Apple Git-155)

