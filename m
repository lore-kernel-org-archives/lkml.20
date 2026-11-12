Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467831;
	b=dw5bvujoPdJbpGpQ5wVWYbbJ990pVS1rI2708u/qPEevnuDSRjsxKjAltkakN31avoSm
	 sjCb/bqecm6hnpyzRtPzqB+AI4FUUAgdA930GCLC1wBV9tUoSdnfL8tmbrcRastp4Ye68
	 VRzm9/lAaTko1oDbD2hyWquSCXe9SljstkGEmFNvXenOo+MFUWwUpIF2iF2W1C2b8pKZl
	 cawZDfMZh3BLPeGiqW9LAVWEvlUEK538WwQLxf7iMAQe8G00lT0cR1DCaBOPfJjO1eKX0
	 qOnRdPnJP/JuFnm8Wf5L6zqdkjAvmJ6felaironao5s1aCXbYtoQ7HKvnljc1eqgR5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467831;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xsx6dUsHyC3EvX9BHfakPoqLFyX3/Lp+3U4Uxj4CcsQ=;
	b=BNyVwD5wODxdNY5p5P1cLNjm6YtbUrbvZy5kT8UvVfUv7tX5anTNsF1GNIl19I+a6NCW
	 nWapZEKQaVhe3IJ4J493oK0PprmzskY3WVA3At40VZTxRwo5xxoEsQ3emiWpIVCJ1iz3t
	 glSgoTgVYQi0iTd6x9Ppo+aDO4wZKiVyyoD9NGqKO7T/yptYeI6RhSjgUCSXYGIK2ifRj
	 egz6t/hgjKapI3D9dYUdYmAt7RhQFLvCCevD3MZKXnsYZxRFafQF5G8pxnWhgDNzP/yhe
	 ki6Sw1NxHyzMPCSHwDEQmd2QEtfOni6qORplIS+HczYZppP6OPsMiL687LxycsVhzEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=qkMzcjBE;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 445EC606A332
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 445EC606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=qkMzcjBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=qkMzcjBEaQlskNp6M/ZmGW/uy+ExtccHvZbJjCGUQ0C8Eq8guqLruoUJ158k8t9ZtrxSQ52Jm71kZ
	 X10U7/TVPx7EQi8hQbOBLnED60PkT3TFxHr8A4w6NqHgG/9M8a42VHnK5o7R0tznKCvPrHrDEXogsa
	 Yu4RoNlNpCELhJnU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af567f43e7-dfe58;
	Thu, 12 Nov 2026 15:17:09 +0800 (CST)
X-RM-TRANSID:2ee76af567f43e7-dfe58
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af567f3a8d-f6e21;
	Thu, 12 Nov 2026 15:17:09 +0800 (CST)
X-RM-TRANSID:2ee46af567f3a8d-f6e21
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] regulator: tps65023: Check the I2C voltage control setup error
Date: Thu, 12 Nov 2026 15:17:08 +0800
Message-ID: <20261112071708.154511-1-zhujun2@cmss.chinamobile.com>
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

Probe clears CORE_ADJ to enable output voltage control over I2C, but
ignores a failure of that register update. The driver can then bind
without having enabled the voltage control used by its regulator
operations.

Return the update result so a failed setup aborts probe. The regulator
registrations are managed and are unwound by the driver core.

Fixes: f068ad8cca75 ("regulator: tps65023: Fixes i2c configuration issues")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/regulator/tps65023-regulator.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/tps65023-regulator.c b/drivers/regulator/tps65023-regulator.c
index 57b91b1fe328..cdebb249cb0f 100644
--- a/drivers/regulator/tps65023-regulator.c
+++ b/drivers/regulator/tps65023-regulator.c
@@ -302,10 +302,8 @@ static int tps_65023_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, tps);
 
 	/* Enable setting output voltage by I2C */
-	regmap_update_bits(tps->regmap, TPS65023_REG_CON_CTRL2,
-			   TPS65023_REG_CTRL2_CORE_ADJ, 0);
-
-	return 0;
+	return regmap_update_bits(tps->regmap, TPS65023_REG_CON_CTRL2,
+				  TPS65023_REG_CTRL2_CORE_ADJ, 0);
 }
 
 static const struct of_device_id __maybe_unused tps65023_of_match[] = {
-- 
2.51.0



