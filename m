Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180728;
	b=ffh9/B1AkT4vGky80uLRYIZ2rDb33y+3LHdoaDpRRtLIwpNRNsbd15jM7kW7B2lSILIe
	 fddHxr2Zmwtc0atXraiFaPV0Ygvk3PmouqepGxD+xP3wvzW6qtllzj5WLLumZqB3fRbag
	 VbRuuBfKIoqDBSzoPmwp+UAkwmc3Rfzy9mL5zEP7lUs2LMxImoMs5OCDnJCVzpvaWRjHS
	 96B58QA1BGxnWOgvkQx6QUO530P/bbyo5KX0u9lo70YPnknWlIIppT+cG09DQfzV/F49d
	 TVlhZzB6eUNpL1K9pThmZZvzEAK3jCHt966Su98dIO4PEq+VkqtM36CZ3z7sFocMddA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nQSVue22JfuRfe7QbPCCWytdcMKPPahjBQIzR2I7fRE=;
	b=46zk/4hJYOj5+Zf2TKpPm9OJCkRzk0UHI/LuRNtvHrFaPwCGKFDXUy1NPBbbaM4xhIKI
	 NLGOBpaHKOB1SvK7kP6Z5Ci0U8bkhI/gns/+NZfeHcsNcL/5jL0tEc7L7P+ylR6x0APfx
	 D8+0inazoMJI/Gze9Kch3iMBBpr1M5jUpoijqefvHTiZV3JbXwBLblFl30F5nSP0qERkO
	 b099b3X0kbenpTnTcnkDAlX5gNMPGt6+/3rvbrs65WdDg2brWNl+l4WtqJ9XON24/kZoK
	 XBV59OP7naSSTvgnfbr1FIfkV7dK7EWJPWZf3JLAPPLfdeoebE1DP3iiQmaFK4bVVbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMHotoVx;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB5A606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB5A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uMHotoVx
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48bbb06e746so350751f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180727; x=1793785527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nQSVue22JfuRfe7QbPCCWytdcMKPPahjBQIzR2I7fRE=;
        b=uMHotoVxO0t/VdyZy3UkWFC6sTzuIAYKwc55rVuXbV4v3la+IpZqUGhWOhsfYtjJkK
         NhRSNsOLElwRX4WuJVY64Fd+Dhgv1nnH5JdOpTJgPJe7P9IW06fWoZ73t5iGcZinZZMS
         YJjcbYiD8hVx/SQOw5UrO2DfcFdRGMt12Q4g2DbixQfB4WfsFjDmpt+XlZGKCQPVK57l
         ES2qO3tXbiV004udPcGaHlamvbjOjNELbwPtTkSZrRuEaBUMoZufJHTJcSA9z2EtVL/+
         6F0gbnuWZnw4409iFY7jAUfCGcDHfCzZoLVUBQl8PUzthI8okuQDMr2nLKvFf3rnZMXs
         yxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180727; x=1793785527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nQSVue22JfuRfe7QbPCCWytdcMKPPahjBQIzR2I7fRE=;
        b=Ys1QLHKKSeHKwmtjJcRVhLE5fgw9SXk5AljHzsUbv138SP3HZWaTGB2L4oOMIyDciN
         PmevTlVkn8OoUE3rjNysVnqrZA+3M7DBEqvbxSkGRzd9x1pJxVeKD8W1V+1Bxjv7pucV
         Af2swYzk8opBqdmU1Scwt4hVk7ezTeQzqWu8wuPY9P6Z56+jMMYdPzeqWdTzLXxI4lZB
         ekjrlD7uCKi1Sc+EXRsRod2ABoz+8dvt3ynk7x9n6bCzc3RixCHzX4oQ9O5Tl2d6JDPv
         cy90y/tF3/V0++pp7IZA4A1cqvo11dNLZle26bvbeJ7HuJ0uzfYqHcZ12pjXzCAEwYyc
         uXTA==
X-Gm-Message-State: AFq9FYKH+TCdDBrbJaddn8URKwnUHTQ1+NKZfRZ3G01J3OCptaHBqSzo
	ATjdNm6yk5P/s70cRA+TT3GlGJia5ESfTm8H4gzPGi+cOmo84UIQC+2cVJc1NFSl
X-Gm-Gg: AYBFou36EOJp/nIUC3QhVNM5t6Pr0ofUaNgKKeAlxyqVInqAbXbdRBIU/RaIugUuyYT
	9KY+3UYoH/9lbL87KPss6UlJd98sKRv1eyFj7BTSla25QC0afxaVly0chC3PVf3WoyLVJukmX7R
	C+/Wrn6bidXnBRxtuDZL2n10RzitDtIsrKbjnzoA7ht77fpfBv3ZigXYyq79A+CrpuMsEaAmZcO
	Xg1g2gLXpNwdM306C2nqSlGikwBR7mqelkPKEawpZqC3+DmpM00l5J3wF/klsDNaK9Psyqsa656
	g+F60X78n8sYxVuxc2T1WjVMENT5z0oHdiPjE44Ioxf3dsKGGIis+SZ7ZrBDJOqU98t3uzhQs5P
	TwDDVw+DYqSPHne9h7TAFWtCxcRJbt+cD2i1uALVpZ3BaY1JABV0HtGBzTXF5/AK7TmdhyJW/yX
	633ycKhLqizm9k+JAbO6BjNQ5Q2JZQAJgNtG8yLV/0MA7ZXfVjEfe774oxYkGSNIa/uifZo0eoY
	nkJYiuxQCAlsy7/I/cKVtZ/PtIGXQPzy1miaewPB15Xvrhp1Qijs6lQ/fMg5YBU82hmO4lV3IWs
	JgbBdWTUwYWOKjnA/3J7c7NlQCCpcC9z3u44kDG15Z4SQfWDTM4EdYKBeHA3mHNHc8El/rv+NRt
	6C2NteLvNDRiajVGkNckgvOU0TVX4pVmBoo8WKl3CXi5tXuk=
X-Received: by 2002:a05:6000:46d4:b0:48e:dee:52bc with SMTP id ffacd0b85a97d-48e5d324c1fmr3314620f8f.0.1793180726495;
        Wed, 28 Oct 2026 02:45:26 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3da7sm28827539f8f.20.2026.10.28.02.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:45:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org
Subject: [PATCH v1 1/1] tpm: tis_i2c: Add reset delays for ST33KTPM2XI2C
Date: Wed, 28 Oct 2026 10:45:04 +0100
Message-ID: <20261028094504.4256-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
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

From: Stefano Radaelli <stefano.r@variscite.com>

The optional reset control is deasserted without a delay, and probe then
proceeds directly to the first I2C register access. Since reset-gpio
initializes its line asserted, this provides no guaranteed minimum reset
pulse width or recovery interval before communication starts.

Table 66 of the ST33KTPM-IDevID datasheet specifies a minimum reset pulse
width of 1 ms and up to 50 ms from reset release before the first command.
Choose a 2 ms assertion interval to provide margin above the minimum and
wait 50 ms after deassertion, before initializing the I2C guard times.

Associate these timings with the existing st,st33ktpm2xi2c compatible using
match data. Apply the delays only when a reset control is present. Preserve
the existing deassert-only sequence and the behavior of devices without
timing data or a reset control, without adding Device Tree properties.

Link: https://www.st.com/resource/en/datasheet/st33ktpm-idevid.pdf
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/char/tpm/tpm_tis_i2c.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index cde0b093ed58..8bcbc84815fd 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -12,6 +12,8 @@
 
 #include <linux/i2c.h>
 #include <linux/crc-ccitt.h>
+#include <linux/delay.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include "tpm_tis_core.h"
 
@@ -55,6 +57,11 @@
 #define TPM_INTF_CAPABILITY_ZERO 0x0FFFF000
 #define TPM_I2C_INTERFACE_CAPABILITY_ZERO 0x80000000
 
+struct tpm_tis_i2c_reset_timings {
+	unsigned int assert_us;
+	unsigned int deassert_us;
+};
+
 struct tpm_tis_i2c_phy {
 	struct tpm_tis_data priv;
 	struct i2c_client *i2c_client;
@@ -330,6 +337,7 @@ static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
 
 static int tpm_tis_i2c_probe(struct i2c_client *dev)
 {
+	const struct tpm_tis_i2c_reset_timings *timings;
 	struct tpm_tis_i2c_phy *phy;
 	struct reset_control *reset;
 	const u8 crc_enable = 1;
@@ -347,17 +355,25 @@ static int tpm_tis_i2c_probe(struct i2c_client *dev)
 
 	set_bit(TPM_TIS_DEFAULT_CANCELLATION, &phy->priv.flags);
 	phy->i2c_client = dev;
+	timings = device_get_match_data(&dev->dev);
 
 	reset = devm_reset_control_get_optional_exclusive(&dev->dev, NULL);
 	if (IS_ERR(reset))
 		return dev_err_probe(&dev->dev, PTR_ERR(reset),
 				     "failed to get reset control\n");
 
+	/* Allow an already asserted reset to meet its minimum pulse width. */
+	if (reset && timings)
+		fsleep(timings->assert_us);
+
 	ret = reset_control_deassert(reset);
 	if (ret)
 		return dev_err_probe(&dev->dev, ret,
 				     "failed to deassert reset\n");
 
+	if (reset && timings)
+		fsleep(timings->deassert_us);
+
 	/* must precede all communication with the tpm */
 	ret = tpm_tis_i2c_init_guard_time(phy);
 	if (ret)
@@ -393,9 +409,19 @@ static const struct i2c_device_id tpm_tis_i2c_id[] = {
 MODULE_DEVICE_TABLE(i2c, tpm_tis_i2c_id);
 
 #ifdef CONFIG_OF
+/*
+ * ST33KTPM-IDevID datasheet DS15011, table 66: tWL >= 1 ms and
+ * tCMD <= 50 ms. Allow 2 ms for tWL to provide margin above the minimum.
+ */
+static const struct tpm_tis_i2c_reset_timings st33ktpm2xi2c_reset_timings = {
+	.assert_us = 2000,
+	.deassert_us = 50000,
+};
+
 static const struct of_device_id of_tis_i2c_match[] = {
 	{ .compatible = "infineon,slb9673", },
 	{ .compatible = "nuvoton,npct75x", },
+	{ .compatible = "st,st33ktpm2xi2c", .data = &st33ktpm2xi2c_reset_timings },
 	{ .compatible = "tcg,tpm-tis-i2c", },
 	{}
 };
-- 
2.47.3

