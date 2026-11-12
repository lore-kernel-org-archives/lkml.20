Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467886;
	b=xwazsKi+JGaT0m3rtgr9o85vrAVRmOWrMpd2N8yvMA0NH/10LApZuZbnUNkBJMFFsCVo
	 XxfuHHAgbKkRfjluy5aTYEUKL5ZdBd5x3LmFALlWKMWECwXvGt+5HtgWneXE83JWF4zad
	 DHe6b194EMSufvSS9rajun0QRUlKOzrJW7dmpGZ/nX3blLEKSDHx6vkii8xajSQhZQxQG
	 TVc15BF+05AQCIjYRA2QijRxgansPtojVWs+4wiDV/UaN6V5Kk8S4X4qJYB9aUDpNZxTP
	 g1cu86gHfSjzqM+B+pvpjGeHYu/wuoZvygUqrGt7jcNWMXDO6KyEjn9byA0B1Socx1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467886;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dc1pVTlT0A65hfWlRac9f8PxKehnfAkimZIQLveqD68=;
	b=2FcxYw2SE/kX7Y3cUStanDFOnHezWua0pGB2V7IoiIma4Ycr7P15iD2ZktBzpyDOv4Sb
	 9Pme7vVPNaAfQmzPAsVGUlo/MGWRESvwGYZg9+HNR+CiS1C5m5evoUhZHXTgswOSoun0u
	 2zOIl+cfc1k+rGsmPUzJsaTuGOLu2C7Pc4opLoWVO54JS6pr16BPpm6AnroYB13LMGdhz
	 BABhAumxJwJ6+PuLR4dthzknIobq7eICUy3uhVar//8MHzpFtFT54akhSW62y8EqLP0Ih
	 IHNnCymvl622iy2DCQZYA0NxnbF5ZOMvHaUiJ2EK3rTg8X5sxlpjJa/6DVen7HOb5Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kL8QUXsy;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426E8606A323;
	Thu, 12 Nov 2026 07:18:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 426E8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=kL8QUXsy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=kL8QUXsyI8CnO+Bb/rYbltxmYcnzmyAHr7/Os0v3Ud3RFMj3rmrpai/86gvjBXJgNmrgXxfBtS6iW
	 6ZkmpQfI3MAiskaL6utFg124kjrefzNdNwBtc4M5dJafvStsD7bRXCPBoMXoJdjXIP58jgSTLNddfZ
	 9HcSxJ4jOLbrB54k=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af56826008-abd51;
	Thu, 12 Nov 2026 15:17:59 +0800 (CST)
X-RM-TRANSID:2ee66af56826008-abd51
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af5682633c-f689f;
	Thu, 12 Nov 2026 15:17:59 +0800 (CST)
X-RM-TRANSID:2eea6af5682633c-f689f
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] ASoC: pxa-ssp: Release the SSP port when clock lookup fails
Date: Thu, 12 Nov 2026 15:17:57 +0800
Message-ID: <20261112071757.154652-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

pxa_ssp_probe() reserves the SSP port before looking up extclk. If the
clock lookup returns an error such as -EPROBE_DEFER, the private data
is freed but the port remains reserved. A later probe attempt cannot
request that port and fails with -ENODEV.

Release the reserved SSP port before the existing private-data cleanup
when the optional clock lookup fails.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 sound/soc/pxa/pxa-ssp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index 9a98246ad19c..53682c9f2ccc 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -772,6 +772,7 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 		priv->extclk = devm_clk_get_optional(dev, "extclk");
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
+			pxa_ssp_free(priv->ssp);
 			goto err_priv;
 		}
 	} else {
-- 
2.51.0



