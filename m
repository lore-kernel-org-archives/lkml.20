Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9D3B634C;
	Sun,  6 Sep 2026 03:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666175; cv=none; b=kZibBHN0y7YvRoYIE91DGnRbIKfwQsKo3EKJsbXn9RvOe9VvDfxEhaNeh1G2h1FXIRiZjz9UNZ42WZEHrfJuUUAneVK/cDcE4DTy8C+HKS6ykMMq6Os9aYvMDUgnKKUYN9IrucUh9Gto2ktQ08P98kSR1vLBQtrVEWeNT/x7qVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666175; c=relaxed/simple;
	bh=6r9ztJmf7FVxM591W6welLpNEpS9624eWt4/Ax/FlKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=diw5XYuTEm3WB1zcSpTMD+sNYPSA6Xh0/ytpDVoBUgBTujvS/jAENy7BX319t37ZohFDiUXh+teIUF8ppFTyjxqic9+4xYsQgNjqGX2UUw/4X+6WHEQt8ceE88n43MBdg8LciYcNVRolF2X37rd8NYI3UY7Vn5e+5ST/MuD0Zy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=o5tIle0N; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="o5tIle0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6Q
	rsJd10qbOYtSC0lScAZq51yYb3EmgqGX2IrC9tXAU=; b=o5tIle0NVCGoj2/um5
	J0RbayePZxPjcUlKM97EPiiY92y0LlDu9V4Ba0Ab0QGgMMlamRc8MUGUpZ53+3qR
	TdnFh1Gw/g2tJqZZzCH4LXpk5XOk7SD5s0b97eHuT9EcOOn7Z15nvbEpJreCMFTr
	5r51CMqtYbjncqq9Mp6GWWwj4=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXHxcb4Zxq8PnERA--.33810S4;
	Sun, 06 Sep 2026 11:42:21 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ASoC: es8375: report resume restore errors
Date: Sun,  6 Sep 2026 11:42:15 +0800
Message-ID: <20260906034217.85696-3-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXHxcb4Zxq8PnERA--.33810S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1UXw18tF1kAFWkKFWkCrg_yoW8CryDpF
	ZxtFZ09ryrXw4fCFW5tr48Was5GrWSvFy3C347K34Ivry5Aw17Cw1YkFyI9FZ3Jry7CFsr
	Z3yjqa15WF4rGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07je38nUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R1BCmqc4R2v4wAA39

es8375_resume() ignores the clock-status read, bias restoration and
register-cache replay. A read failure can leave reg uninitialized before
it selects the initialization path, and later resume processing cannot
observe a failed restore.

Return the fallible operation results to the ASoC component wrapper, which
reports callback failures while retaining its best-effort resume contract.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: de2b3119f9f7 ("ASoC: codecs: add support for ES8375")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/es8375.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index e8747bc24433..2c58225feddd 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -577,20 +577,24 @@ static int es8375_resume(struct snd_soc_component *component)
 {
 	struct es8375_priv *es8375 = snd_soc_component_get_drvdata(component);
 	unsigned int reg;
+	int ret;
 
 	regcache_cache_only(es8375->regmap, false);
 	regcache_cache_bypass(es8375->regmap, true);
-	regmap_read(es8375->regmap, ES8375_CLK_MGR2, &reg);
+	ret = regmap_read(es8375->regmap, ES8375_CLK_MGR2, &reg);
 	regcache_cache_bypass(es8375->regmap, false);
+	if (ret)
+		return ret;
 
-	if (reg == 0x00)
+	if (reg == 0x00) {
 		es8375_init(component);
-	else
-		es8375_set_bias_level(component, SND_SOC_BIAS_ON);
-
-	regcache_sync(es8375->regmap);
+	} else {
+		ret = es8375_set_bias_level(component, SND_SOC_BIAS_ON);
+		if (ret)
+			return ret;
+	}
 
-	return 0;
+	return regcache_sync(es8375->regmap);
 }
 
 static int es8375_codec_probe(struct snd_soc_component *component)
-- 
2.50.1 (Apple Git-155)

