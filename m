Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5C3B52E4;
	Sun,  6 Sep 2026 03:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666176; cv=none; b=YdwlcqY4d8+3NHsEiLBEvG4cUTDhvsJGAgAfv9k7OntQvUBcG7owJjudC1+iJmf931eP8A9dJWvLrXqP8SeCPiqzgEAFIwIu61OA5pn3lEKBGWnYPfMIHqhFq0w8W7aP7QSAKnnucjxgCV36QlRGYksDvUsBvSeCjDUcc4idnJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666176; c=relaxed/simple;
	bh=lmoIPdj+6r2ziznCQsb0UzEOdDWnLWjBZg8LQD6n2Mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W5L6MSHT+01J72J1SvJDCQr1VlsQ3lPxFyGhv5j0qDNO15AP+kSsNNRDO53BP2mktVFlba3YlN/0VVlGkS3th8MJXfpXSnsbgqSpa0420PEwIeSXrnWkzv7gO/0dQ2Os+JIyLH2R0BpmvPLkT2fNAOfq/Oiwn5j94ZAR/hhpO38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BO3K+Qd+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BO3K+Qd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=F0
	7UPZ7n+jzCWFF3mhj/KOd+XRpPjCif2TAp+ldB/Ew=; b=BO3K+Qd+0C+wJD8nL5
	lyuFOoMTySu0MOuUSkLpIse7I/qDeqINNDKsOysK4WDIfNiE8n0j0Tx3/j6U1nC2
	BlsFJ5ZTcFAH3fevcww30S25HG49KcyN8cicP/s7QDNz4vdPfZ5YRgjuD/rshVP+
	twRAq8xBE7FPA0mlXq7/Nhvxw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXHxcb4Zxq8PnERA--.33810S6;
	Sun, 06 Sep 2026 11:42:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Nick Li <nick.li@foursemi.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] ASoC: fs210x: report register restore errors
Date: Sun,  6 Sep 2026 11:42:17 +0800
Message-ID: <20260906034217.85696-5-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgDXHxcb4Zxq8PnERA--.33810S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFyftrWrXF4Utry3XrW7twb_yoW8Jr4xpF
	93GFW8Xr97Xw4xArZIyF4UZFnakrZxWFW5Aw1jkwnxAwn8Cw1S93W5tw4jvFZrtrWYkanI
	qr40ya45Zr15Jw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U_8nrUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxR5BCmqc4R5NsQAA3l

fs210x_init_chip() marks the register cache dirty and replays it after
reset and scene setup, but ignores a replay failure and publishes
is_inited. Its resume caller already returns the helper status.

Keep is_inited clear and return a cache replay failure so the ASoC
component wrapper can report the incomplete restoration.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 756117701779 ("ASoC: codecs: Add FourSemi FS2104/5S audio amplifier driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
 sound/soc/codecs/fs210x.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index 510cbeea5b62..316f3fe80d93 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -610,8 +610,9 @@ static int fs210x_init_chip(struct fs210x_priv *fs210x)
 	if (!ret) {
 		regcache_cache_only(fs210x->regmap, false);
 		regcache_mark_dirty(fs210x->regmap);
-		regcache_sync(fs210x->regmap);
-		fs210x->is_inited = true;
+		ret = regcache_sync(fs210x->regmap);
+		if (!ret)
+			fs210x->is_inited = true;
 	}
 
 	return ret;
-- 
2.50.1 (Apple Git-155)

