Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898956;
	b=0DT4x+Yihl8Y28R5imB2JzCObzJofcMNDAXUVbL62sXaMygw3Fctb2AZZO/dER0A36J4
	 GBxVxMSltouB0xEWnqsGmoYwOuA4lriCVxfsdE3i689bGYE1suxaXxHgJ6T8lX7+aVEth
	 WwlgMGfuKcREe/3pQZrLHe4uOmFLgsDh8hQebvnv6Ne+DoOShAcqmcz0KLTafUh+z7aTf
	 QdnVclc96/wpXFRYCg4eYHrrs2HkVUpgkW8I268vAKdP+Af8KKzAJpDTnpm+JKSE9O6hO
	 Eb9D4IeDPMJFlcKTbK8DnqtT/MgevImUn6KZq1+zoJ18q1c5nCu//UmBa8/BJX47WXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898956;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yucGD6ZDvNp3B1M6A5cqWYCzGihRXq4uPJmmKP9yprk=;
	b=Ox8jRSCyJcJgrOvlTFOodop25wZXgO/a8VvD5JWMtIGxEfi4fGKEYLLlP5So5/as8DIk
	 U2OREA05uz+hyWiI31XjhQQ6jxZUNM84AWBbCZWzVpLrH3qfibhvxcZ+qHi77J1WNRlGx
	 Zdc4MvNts1YgGPr1H6KJMfTIp8UzYk8zSyd8AP5/iHED7zMYqQyISPE4yDYYkRmvxwlW+
	 P8HKR22qS6uOaCrEAR5jWIlAgUEYvnv3CBBaq/eRq/0uqqkD3tt2coA8CTWkmaS42/bng
	 Uyh8VgHgKUaH58w7rQBXUpcTBBHNBtRLZDHh1UaT5At/85CxmFhLcMixh1TFXcGE4GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="K3/XbrNp";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD37606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BD37606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=K3/XbrNp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=K3/XbrNpBvXGDi6Q6pOhWffu9Yiw0wPoKny1wIk00VHsma/m1p+GNSsgXAZKkmCq071kzZ4zPV0XY
	 4LmqL6yRy+KkLzxaVPP/e41LSUxsQz+Gn8TXc/yMX+7uFy2/ET6xNfux5bhQMf+M8Et0lmuHCTzBjP
	 x56iZud1yjpBq8Mg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86add7785477-e2856;
	Sun, 25 Oct 2026 11:29:12 +0800 (CST)
X-RM-TRANSID:2ee86add7785477-e2856
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHA-W6400298 (unknown[36.137.216.17])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36add7785674-7a2be;
	Sun, 25 Oct 2026 11:29:12 +0800 (CST)
X-RM-TRANSID:2ee36add7785674-7a2be
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	tangbin@cmss.chinamobile.com
Subject: [PATCH] ASoC: Intel: bytcr_rt5640: Add missing return after put_device()
Date: Sun, 25 Oct 2026 11:29:10 +0800
Message-ID: <20261025032910.2439-1-tangbin@cmss.chinamobile.com>
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

In the fallback i2c_client path, when i2c_verify_client() fails, the
code calls put_device(codec_dev) to drop the device reference but does
not return an error. Instead, it falls through and stores the
already-dereferenced pointer in priv->codec_dev. This leads to two
problems:

1. The code continues to use codec_dev after its reference was dropped,
   accessing potentially freed memory (use-after-free).
2. The remove function calls put_device(priv->codec_dev) again,
   resulting in a double-put that unbalances the device reference count.

Fix this by adding 'return -ENODEV;' after put_device(codec_dev) to
abort the probe cleanly when the fallback device is not a valid
i2c_client.

Fixes: 4a8b3a682be9 ("ASoC: Intel: bytcr_rt5640: fallback mechanism if MCLK is not enabled")
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 40da3eea5..557486c6f 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1764,6 +1764,7 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 			dev_err(dev, "Error '%s' is not an i2c_client\n",
 				BYT_RT5640_FALLBACK_CODEC_DEV_NAME);
 			put_device(codec_dev);
+			return -ENODEV;
 		}
 
 		/* fixup codec name */
-- 
2.52.0.windows.1



