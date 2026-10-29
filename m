Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280898;
	b=OyIwOC/jQYvvak38dyuybcfyKM1rqVdvXPQHcmpzfyCZbk5mGpUwHlgzH+0LPuzs9b9w
	 z4xLvVCuej2UrmHRp3cxoxT6BiL8g2YsRfxiLWplkexME4UEc+ZyW4h0/vyg7S6N9EqRH
	 zcKvaaJdH2438U6hHYRFmFzjHx3Mc4ic6WIeZbqbSeqmEzXgdDBXRGMdm9PA7jeUD/cKt
	 ZFkSV1pVxO3dUL7iVcd88uHrRftQ6IxrYrl60RF1+p9KeJhA7nUJ7KBQ+4R79XknRvMvq
	 Fvz+TQVFTIO7eEqot07RB5dRtuBdRYJpqBV4vK6P/iWJXBt9URdwBJP44vgeBKMLL5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280898;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=M5EtELkjlCBuTVdRgQKUPQ6Cy1aBPE3OGjjKQZM1KyY=;
	b=DyEf4lD67b4p0FQeRgRUclSCfaww/8eUVSqadnipvIgUAlnVdrQ0HAadDJ5yqWfs/QIH
	 e/JGAmEhRnL0n5ITZsnvNbyC+jL2V4B+rww7AGCKiXmoBuXrvC5Y0COSSGMo6o1XRvBjF
	 IYZVc2DTW+yX+i1Ym3RC86lAb1Bwya0KoSotxPthoafl3yhIXUtsJCfM3yFpwBABDXIck
	 iIu8yvLdT3qzNFLyfROLWlWJpNvZNMZjFQLFvBBGv21WlUdf054jPVFOcOurXbRLkt7BZ
	 mQY03Zi5YPXPvOXxC5OZsvzVf0whaQ18owNcKU4fWnxYtoZee6+3xSkDw42OrW2Q+YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HYpyBFbf;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C223606A322
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C223606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HYpyBFbf
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39217C49F44
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:35:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D378160360;
	Thu, 29 Oct 2026 13:34:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF2761032900F;
	Thu, 29 Oct 2026 14:34:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793280890; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=M5EtELkjlCBuTVdRgQKUPQ6Cy1aBPE3OGjjKQZM1KyY=;
	b=HYpyBFbf+nA/IedgVmnPbvDdTWh0sTAQp/6/rkgOSO2A+eOAPi1FXbm/dyuDb5lipeVZHO
	CLkc9BJamJWB3SVSMlXq87jdlh87b9IQSqTuL1rnXKAVMftIftqEXQB1KSpfd7xh1q+nrJ
	Xj7cwsVpBO/dPczynN2uOFKxiPI479mJzwcwYRYLLvGLyY75iOOx50wPDgQ8H+/qLyEauK
	tUvpgu7JX3bu7TWmZLGB1zQNlydvZ6zxMPyz3hniXLppDeSSwUrKHPV8EPaFc7Q2NSj61f
	n78LPDLadJSkS+zFkYzuFJr6wdlTq0T3NB8Vi4Hi+cU0kKus4YZ12kSiu9UGlw==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/12] rtc: ds1343: use sysfs_emit() instead of sprintf()
Date: Thu, 29 Oct 2026 14:23:31 +0100
Message-ID: <20261029132339.925021-8-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
References: <20261029132339.925021-1-alexandre.belloni@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(ds1343_show_glitchfilter and ds1343_show_tricklecharger) to conform
to the recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 22abec4ba656..0ec5eaba6bd4 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -94,9 +94,9 @@ static ssize_t ds1343_show_glitchfilter(struct device *dev,
 	glitch_filt_status = !!(data & DS1343_EGFIL);
 
 	if (glitch_filt_status)
-		return sprintf(buf, "enabled\n");
+		return sysfs_emit(buf, "enabled\n");
 	else
-		return sprintf(buf, "disabled\n");
+		return sysfs_emit(buf, "disabled\n");
 }
 
 static ssize_t ds1343_store_glitchfilter(struct device *dev,
@@ -180,7 +180,7 @@ static ssize_t ds1343_show_tricklecharger(struct device *dev,
 		}
 	}
 
-	return sprintf(buf, "%s %s\n", diodes, resistors);
+	return sysfs_emit(buf, "%s %s\n", diodes, resistors);
 }
 
 static DEVICE_ATTR(trickle_charger, 0444, ds1343_show_tricklecharger, NULL);
-- 
2.56.0

