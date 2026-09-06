Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4640D64AA4;
	Sun,  6 Sep 2026 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666239; cv=none; b=rh0I9HqjQDyNs1AZREEWSaxtqsaXzkE9GxSGQQo9QyKFkySifXmAZWt5atp95EPkEGs6RIpj/neP1dOO2HDip/OqXhyyraZA+grI/kQahgYIhiszfG2vEmN7S7zAnAeVvDPoXnEk0Kuj5zVtB6U1nh//vEcNXAlKIkt/ZL7/mnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666239; c=relaxed/simple;
	bh=r2Dy2Yt74Wv+1M5OudVDPWhcBQ3bt3xMw0Mko3JCul8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9IafKT6Ec9V9RB598NbqbXE8RmWyywL82LtFFfrttMeLLUYzHZIZ7JhID8/s7tSe9HuQK/A4P3G6z4Ml9ZubONCmTBRXfGpgpFPA+kdG1fX9e9A0153lYcVxzkDGdGz88QVi0Klub3AQvg3MoYVLTKrKFa30Cym9JhO9CAeTwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=imThNcUc; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="imThNcUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=6D
	OaiFGv0mheh3S2QbL3/eW4Pg2Ogfy0J0U/P9l8V/E=; b=imThNcUcC2OgThuCe1
	DVy86QgDukRX/dAxg/CTi0zmaN4I/dZOmKwmO7QUuskEvH1l/iaLj25yLdPenYXb
	p0cJ6Jn44a8+3siTG+XI3PxRjbteKQS4i9zOK4hrVcWU9AxHJ0zmMTHhX0srFPZt
	ULe6nozrGbYfXmKQlrPMrXXD4=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S5;
	Sun, 06 Sep 2026 11:43:27 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Fang, Yang A" <yang.a.fang@intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] ASoC: nau8825: stop resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:15 +0800
Message-ID: <20260906034321.86080-4-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFy3ArW3ArW5Cr15Cw45Jrb_yoW8GF17pF
	Z3GrnYqrZ3X3yxAFWrtr48XFnYkrZ3GF47Aw4DK39rZr15CryxKFn3tFyjvFWDJrWUKr9r
	ZF42q3yrCF45CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2YL9UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7R9RGmqc4V+zbgAA3s

nau8825_resume() restores cached registers during component resume but
ignores a regcache_sync() failure and continues with crosstalk semaphore
handling and IRQ enablement. Those operations assume that the codec
register state has already been restored.

Stop the local resume sequence when cache replay fails and return the
error to the ASoC component wrapper. The wrapper reports the failure
while retaining best-effort card resume, so no rollback or retry
semantics are introduced.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 4454a8378be5 ("ASoC: nau8825: add pm function")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/nau8825.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index ae83b778bf93..c770a345f3cf 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2690,7 +2690,10 @@ static int __maybe_unused nau8825_resume(struct snd_soc_component *component)
 	int ret;
 
 	regcache_cache_only(nau8825->regmap, false);
-	regcache_sync(nau8825->regmap);
+	ret = regcache_sync(nau8825->regmap);
+	if (ret)
+		return ret;
+
 	nau8825->xtalk_protect = true;
 	ret = nau8825_sema_acquire(nau8825, 0);
 	if (ret)
-- 
2.50.1 (Apple Git-155)

