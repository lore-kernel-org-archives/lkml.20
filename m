Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780407;
	b=1FmTraEKbV+A8AwA8IezVAGPGXSRzJRKpmpswST9drBkwMkStcKOipsN1B8pBhKITkXe
	 P3vsW8zSvXPW4GOTMRktSSaYLh9xUWN12JbKrpYX8iuFSTpi2jijYbQLAlI8r3JHE99n+
	 U6JCcp+a9Efyb3IRiLBae0cVC4HwFxqMJJtzqs+IjenPWue4H8qnhbckDvbM6IxBNb3eM
	 F0xt9ukSvRTASLOWUd52eukW9kPS6nyDOuKhhU2byl/oOzp3XE6St2fJTQIN1HrdOK5qJ
	 PX7ezpunv0bXzJMDcUPVa9uuZCd63gHt+MPZt0p21CHkvRfwQ8q1VqVNR/Z5Bvf/BjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780407;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMHuMddkEVnoySoE38sxvHRnp8CSMxn0vabnDI6DXBw=;
	b=RkOs0XrCUTl0uVheeQdIC7jhq2Ld5A8OvyCDbaT+Nu9HZ/A86uZ/01TNVmzO4o1pu81A
	 FRwfJALeZDDQC1RhOFh/kKz+NDOJZQavL4C7A76UGbAnMqg2U0Q07jZmiUZuFbECEofVL
	 fYl26SOSomhRZGgkg+6AbntJFTlaoke2+NQ73aU6aoAwcd476zCMqyo0jB79Eas9h1iG0
	 /WceEJc1VFtnTckmmBQkrmLle4FWXWuXZAo0o9O6IsrcwNnar9g2oQWzTBQGlpgI6ul89
	 7jN9dOD6GLH+XbFfJOiRM8dNeIBLj+RY+O85ULHbEG9Cqxi3m3r5Yet4CY+9IRE5GYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rVi9Eyxn;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E97606A326;
	Wed,  4 Nov 2026 08:20:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E97606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=rVi9Eyxn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=rVi9EyxnEb1IEZp30izmrxTsozphIjA/PORrrZibcxpt2HT84wZZuW2uvk7XPA71EaX/5zeICCDZk
	 0E1vBzxpE1Jl3W//ohtxb4NqH1+xA34yk/0agYBbVeo/+Nfv4NLyN8DL2Eb84ls/gr/ekMGGnG6bBt
	 +mPPTJ/wIhdEuAYs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76aeaeab15a3-9ca4c;
	Wed, 04 Nov 2026 16:20:03 +0800 (CST)
X-RM-TRANSID:2ee76aeaeab15a3-9ca4c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56aeaeab1521-1aa10;
	Wed, 04 Nov 2026 16:20:03 +0800 (CST)
X-RM-TRANSID:2ee56aeaeab1521-1aa10
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] ASoC: pcm512x: fix SCLK/supplies leak on resume failure
Date: Wed,  4 Nov 2026 16:20:00 +0800
Message-ID: <20261104082000.1230-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.52.0.windows.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pcm512x_resume() enabled SCLK then supplies, but each later failing step
(regcache_sync, regmap_update_bits) returned directly without undoing the
already-enabled resources, and the matching suspend() is not called by the
PM core on a failed resume. Use goto cleanup labels that disable supplies
and SCLK in reverse order.

Fixes: 5a3af1293194 ("ASoC: pcm512x: Add PCM512x driver")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/codecs/pcm512x.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index f3e209190..24194a8ec 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1772,24 +1772,31 @@ static int pcm512x_resume(struct device *dev)
 				    pcm512x->supplies);
 	if (ret != 0) {
 		dev_err(dev, "Failed to enable supplies: %d\n", ret);
-		return ret;
+		goto err_sclk;
 	}
 
 	regcache_cache_only(pcm512x->regmap, false);
 	ret = regcache_sync(pcm512x->regmap);
 	if (ret != 0) {
 		dev_err(dev, "Failed to sync cache: %d\n", ret);
-		return ret;
+		goto err_supplies;
 	}
 
 	ret = regmap_update_bits(pcm512x->regmap, PCM512x_POWER,
 				 PCM512x_RQPD, 0);
 	if (ret != 0) {
 		dev_err(dev, "Failed to remove power down: %d\n", ret);
-		return ret;
+		goto err_supplies;
 	}
 
 	return 0;
+
+err_supplies:
+	regulator_bulk_disable(ARRAY_SIZE(pcm512x->supplies), pcm512x->supplies);
+err_sclk:
+	if (!IS_ERR(pcm512x->sclk))
+		clk_disable_unprepare(pcm512x->sclk);
+	return ret;
 }
 
 EXPORT_GPL_DEV_PM_OPS(pcm512x_pm_ops) = {
-- 
2.52.0.windows.1



