Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21B228851F;
	Sun,  6 Sep 2026 03:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666233; cv=none; b=d7yB4+qtfc7wMCz2iW/eTeFaYW6AB3ecoitF+P5mPrBEhMy+1uA86v2h6xUarUP0gr9FFzhaN4gbizAUCJk5/bh4FoUJyVWMQp2ReoXS3RxvCHV87emcK3B8SF70JP7ftHDAyU8ijvLaD6VtWbMlKVkvVq1qmsszlpqCTy7UHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666233; c=relaxed/simple;
	bh=Ig+e1RzwC8MTakwf8QsFMp/VjUla5xy9EwP9WryrrRo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzLvk4UfUfvg4fYLFLRpTZkeVbfq0LKqbcy49/bBWz1YPukVuogRtqOur0TACeqFEZ4mv1DZQ4rM+ahDCx0bqqlORn5ln/VlgZju1o1tKxQd/99QpkL502P6ANYYHMGPjYqXa98IgD0jWRDFtHdlaFUOyfNqxwEt3RK/mybuMxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=JPdgX2YQ; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="JPdgX2YQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Ze
	iRZTvsWnBiAYuYUVk/J0hSPIfRRo+tHGeA3svDlqg=; b=JPdgX2YQwqef1xlo7B
	/pE1rWEYcpBNCLj12PGb9v9tC4GegnLetmNRxwGyogzOGWcwM79nJhdG/CS1ZlCL
	g4Qp9aLYSKnUWj9D9zzks56OXZEj91iWhCGoF9G8zQDSu57Yx1GPHM669L2wWYHM
	62mb5WHqJDWot/TaV4EoIPF34=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wAXzyJb4ZxqQjr+Aw--.33771S4;
	Sun, 06 Sep 2026 11:43:26 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	John Hsu <supercraig0719@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] ASoC: nau8824: stop resume when cache sync fails
Date: Sun,  6 Sep 2026 11:43:14 +0800
Message-ID: <20260906034321.86080-3-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXzyJb4ZxqQjr+Aw--.33771S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyfJry3CF1xAF1xCr43trb_yoW8GF4fpr
	Z5GryrXrZ7X3y7AF4rtr48XFnay393JF45Aws0g39rZrn8uFyI9rn5tF1jvFZrJry8Grsr
	Zr47t3yrCF45CaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j0ZXOUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxR5RGmqc4V5RSgAA3C

nau8824_resume() restores cached registers during component resume but
ignores a regcache_sync() failure and continues with jack-detection
semaphore handling and IRQ enablement. Those operations assume that the
codec register state has already been restored.

Stop the local resume sequence when cache replay fails and return the
error to the ASoC component wrapper. The wrapper reports the failure
while retaining best-effort card resume, so no rollback or retry
semantics are introduced.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: dfeabded0496 ("ASoC: nau8824: new driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/nau8824.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 426a488ff2a3..42d6ddd66e2b 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1546,7 +1546,10 @@ static int __maybe_unused nau8824_resume(struct snd_soc_component *component)
 	int ret;
 
 	regcache_cache_only(nau8824->regmap, false);
-	regcache_sync(nau8824->regmap);
+	ret = regcache_sync(nau8824->regmap);
+	if (ret)
+		return ret;
+
 	if (nau8824->irq) {
 		/* Hold semaphore to postpone playback happening
 		 * until jack detection done.
-- 
2.50.1 (Apple Git-155)

