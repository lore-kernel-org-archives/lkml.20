Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE9B35A397
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790269386; cv=none; b=XcSRmXPdzRcegz91QmPorZhPWO6YyfpGGmLNAUhxSlT3ADlg6D6+R2HuefwK6enOUN1LX1dTPXjIpel1Fa2xzrG4o7p45A5W9cod2NfhScawMRykOeWKsCDg9/OaN0TR0Mkeg1AW8IhtDv/tJUC0GWZJ+U2OTc1NNdkvNYBN/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790269386; c=relaxed/simple;
	bh=+DishUC9Q/FjQaKHTl665w3QwFFpXMruE6ofyX0ZP1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JxnuPHdjiDkylGxu3egmpL1cBuowzPn1Ro/82Te6bNm6w7L8iGkFlBsPzmJG23m+THRUcnv/fzRWT4TCtUQOfONiSRzCdn7hwnahV0JDY0kquuDQKilq+aZfQAuDHLLjt5eI5gUczz1d3GPILbEOkMM6RsQbovR8v+S0S3xlhRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxJkACzT; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxJkACzT"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so467255e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790269383; x=1790874183; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZhfhCdd8Py1unbndSuBk6kmJMuO/LMVFXW3aXeose2Q=;
        b=XxJkACzTupgkX1nqjBituYPiT2wRuzaqBZlGBpwI9SrtFA0lDbrLw+ofqNon97he/y
         dEj5chVd7iNLhgd6urzXopyxt23EWMtZGGY32fqvFILkMTvBxMz8K1IBeMVw1iYTesCX
         HLYGS0A/hCBmdZ7CxuymhOOjVvumytalI7nxjaAfAFfDDnJRqYY3cNmWlDbhKlrF58to
         40/OC5rqsTRq+iiT+i274ueJf1fuDCVwVOLUD0K3g1RP0tdqkSp57X/gUBC1BhU+7kRb
         MOGZWbFD1Lm+6tRuFeo+I6yorT50FqoN4PTyNvSId5/zkCI04mZX6dqCu0hNqLbPPgb8
         NeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790269383; x=1790874183;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZhfhCdd8Py1unbndSuBk6kmJMuO/LMVFXW3aXeose2Q=;
        b=a/W/s6HqCkVn4lYeXT5jwfAuQER629ih5i4A6CNrEFLKLp75fNTGC3o6+P2lGVGaap
         WwatsgAXua0tn9mnjMMXXLj+hFqnlI6UNA/Vfm5gJdn+R8OIpLqcVMgJdw1nBs/y0dSS
         OzmPa6szi55y7nhVavhveaUfctbe+o+S5K7kUbJZ2Q6WswGl+DBYADCgkZhCsUhGzNVN
         j2zKFsR1qdca5MTVjicALzQivSv0WxwfyS7V4cXEHE12lw3Hd3xKf5VLk8afXaCSMWB2
         kiFEjIPJNXRmyRoWBUU8kKBVpNbDRwM+Wu+vfAGwNBu2Gu3Tsbh06eVtL/uesAfFM6ip
         0a7A==
X-Forwarded-Encrypted: i=1; AKwUvBw8P/ur3GvifqbHnia1geA1dMo4x/ZC5/8cWXZNnlZTAu5aTbvie/J98S0B7S4zc/57pDvr98YQvmpXL/U=@vger.kernel.org
X-Gm-Message-State: AFuF++mjqapA8buddAQGhVPOo+wXEYJ1nv5995cLEgjewcmDHrHC6Ora
	xRQPNSY7mw8j3EERcG93f1r4utn4jTi8Ly5I5M1SiozdmnOuSFEwrZi6
X-Gm-Gg: AYBFou25qrWXXIWuXfbipMDlXXDVgKW4FRg38cqaRS5DtAFJ0qC9MMBpdfofrKxfQio
	qjpJNb+yvI40gqi9gLvwQEK2VDdMlGHOSXn9WNejmR2eGQLo1VOk3YPLDc6SMZak247GSCdYDWS
	tK7USvFLgFGjCELAQwo14g7cQc+7lOQPsBGpqcoT97FATnklNENnu2CdwFt71nodJs4n9ujqyM3
	wd63yEdScXmNpxRwuetT9XIc+iOynL/RkcC8s41R+uL2Ty+C6VU5E0QlHc8R7v1ZmWQ2tR+aZqG
	UBoIL6mVQ9PIrqDaE3PP2q3oEeG3YIbEiMF6axPwjLTwXTH8JRjb4Y/x5CL9j91+9slQP1TsoY9
	BW/37AB10RLv5+BgfAy54MC6e/69+CKnOwuCGoA+WXrsqCJXJuT/OEYRvX3iZSlr+e54KUoVPuP
	P25G4SI0an2jW7IL6o5mJRk54E6gdRl4luzl4JunHikeKm4SkuHQ3upH3zU8tXxChAT+xqoBxiS
	cOmtBdxf7YhqWM373NKaX/O/tJZg7nQfVunvew=
X-Received: by 2002:a05:600c:34ce:b0:49e:7caa:e7b2 with SMTP id 5b1f17b1804b1-49fe670428emr51811075e9.29.1790269383141;
        Thu, 24 Sep 2026 10:03:03 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5e07bdcsm73460935e9.15.2026.09.24.10.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:03:02 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 19:02:56 +0200
Subject: [PATCH] spi: spi-qpic-snand: set 'qpic_version2' flag
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qpic-snand-set-qpic_version2-v1-1-a0a9a3e0d06a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBCA4VfRnE2tsRGvImljMJfFjqQ27245f
 of/j6AchBXaLELgS1Q2n1DkGYyr8wujTMlAhirTkMVjlxHVOz+h8vlzuDh8HSGVtXWNsXXBBtJ
 iDzzL/e+7/nleoX8CDW4AAAA=
X-Change-ID: 20260924-qpic-snand-set-qpic_version2-2374a90471e0
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The kerneldoc of 'struct qcom_nandc_props' says this about the
'qpic_version2' member of the structure:

  "flag to indicate QPIC IP version 2"

Since the SNAND controller is based on QPIC v2, set the flag in
the device specific properties.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/spi/spi-qpic-snand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index aaa40753d274..b5fa561bcdd5 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1676,6 +1676,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
 static const struct qcom_nandc_props ipq9574_snandc_props = {
 	.dev_cmd_reg_start = 0x7000,
 	.bam_offset = 0x30000,
+	.qpic_version2 = true,
 	.supports_bam = true,
 };
 

---
base-commit: f6c3117b539d72095404bcd974418f6dfee6d8ac
change-id: 20260924-qpic-snand-set-qpic_version2-2374a90471e0

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

