Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267748;
	b=4UDWjKkghhXMBEKZlZ3S09kccngqF7mzm5SurLAg5JtvbISkLN6YpV1tFzGtXiUU3BCY
	 gUyc+kNjLs6alz0YmMXDU9t3qUzQF0B2bCu2Qv8DbqQQLdw2ChfXYh4AawOkV69+Qj64x
	 nbez+Re36tOPB8N2+e2IFPVbW60+vlPDZY++TQkt37xqOr2JuQH2Idi22XSPRCnhDpdT/
	 JZratjkp32SaTdrtVrlvOhbUgrYJcRN0+cEw4evVXc62PZetEFR44IXaD7v2XEjTDQzx8
	 S+cA1FZB80jxM3Ld0MByi4dZkEuVfgivLNuNqNdrej5tAcDYUPC0FIiymu7HiuYNKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tm7h+ZdQp+5bG8kSfYA0Nc38x7iz+CnqQnhw3MzPmhw=;
	b=Dy2ou8O+a1/V2r/QOY8osvlma25RX1XRIzUjbaOpQH1LVCwHPRJkN3HRh+bALZD/P3nH
	 MufCrt90qurIU0mzl7B9srXre6LX9A0cZavFYFYmgyoW45BF/yml3LVJ/QtpHXaZG5l/g
	 sYQh88CaFY6aQELchsEqnEyMpnTVBnmnGKrHd5lTOx+xPBWCLgu0y0xV8a2zmGGOuaOMp
	 Ti3g4Vdzj7KRt3AlTHP/EH+fL47q68SI96ADOaV7rkeX8Fjq8YAodUN+dCWEVSUd6hgXg
	 emVrEaqkbfjJPPOvk+i8ANFW7AMSo76qarwmAWhq4U9WDEX1XpaMYIJ67XeukiXAdtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAV2817B;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E79606B773
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78E79606B773
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAV2817B
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17339865e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793267747; x=1793872547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tm7h+ZdQp+5bG8kSfYA0Nc38x7iz+CnqQnhw3MzPmhw=;
        b=yAV2817BCZ5MoqZcPdBC7vs5JZpazSQMPRTLw1nzrwi+dfNc2agwBojie/RndbbYF7
         +vecFFR80+ss6Kw4wQVx9wwFPNoeWUkcN2GaRqMlT8xQGw8xPFkhObjJz6Hr5d/V/eiv
         wiTmV7FHg73lsKXfvWqcdtLsunARIDDLBB+HIz/QXMOflqELVWPuP7Hu8ockbRSuurTx
         Zah4oZMzDL+rw/zp7tyKkMW8HEWB2HAU9UeKH06Ehw/Gs6IzawAyIUmwtoLbz+J/tMNy
         u+u5fYkSUseP17t09E8dXJtyMf9sxbfeo0zN3u6nudlnCImlZwH1XKvnMHGldGy2+A9Z
         uGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793267747; x=1793872547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tm7h+ZdQp+5bG8kSfYA0Nc38x7iz+CnqQnhw3MzPmhw=;
        b=gaxmlFMDLjd//OIt6lwgFovK1wMc6/ZgFD5gWB/W6UnxA5vdVBLDVIi0RUZ1T7oMbU
         o33HOphGY1nhjddNLlq54Fi6tHnAZ1iVjHReMxZ5SaOXabuSf4Jys8bPq/H70vLWJOPf
         XGW0POf2T8GEE62FZTN4Jp9pUswW+RhVbOeUH6bHOQlmyO1XdFkC8177vNexgOFeWOqY
         DgRvNLx1laXqM1oXtA0QwW5lXudJneEW42gWX4VkhsKQXJEpnQL4H5447AQ0BX7qiemm
         Ib6cxyjSPxFzoiVNK1cS4XrIAQ2jbrHDo7VOcFo4ahJ7xuJPAA8hD/8xZB61jFbT9ig3
         M/aw==
X-Gm-Message-State: AFq9FYLyxaNTMq8lGOsvOqrlZZhk45VIE/wD6yzDv06b7sdxCs1mAfB2
	YOdKupCt++tlTmKVXnjRE0RZyX6oEoX5v0u2Y/zEUicle+UbjCuVbkw0VLCbSJgr
X-Gm-Gg: AYBFou2vjX1pl/3ePLlrucs8Q/vRC4RH1iUhDv87b0SZ8Yk65bO8nSKQrcE7BRhZMgc
	+s+18I6I3b2RLiov4oWbQzT55HHolempzkuYOYCg1GcjfJlKsSP4AgbPBGGVa/urBCql85Vwy/f
	CFlQp1PnaE7sW8WonbTwAESe06fCdkCR5lMr4mw8AtpIYu/esWIf1xcJw/9OYkhyzTfG6IytNnf
	ksPVkm1TfpwuSXMJcF9bGQad99MhEX2304sdnOIHJFRmW4fAjJ/UyQqocb3ORmkX4bozliKTSif
	SYdvAoG5Hljo9IqQMCWDJpWJ3qRWKN4YptF6bmuL2MM8RRIKy6O08ubo8C2VSZxnFiDTXijces9
	H/6mygPwiKjEiW128u+IiEER81ZQiAXxNFvajbbzeTu6MJqUEiCVsumH5ON8aTcrDpN5Ec8qXEp
	hfLLl5uje7xsMydC//J5CWM4asM5tgp9yDpgPivchRxvzHb00TIGGKsDYQIk72FriwSq7w4dgV4
	wZENi59TJoIeYF55k4dtUaFqzOK706AU2pIcz2iVfARm18XLHND2jHMY2y0jS4/W0zXyNAN8HlK
	+8iSloky5Zw/pxT7NUFkHxMUixSHk9nSRUZB54JzHKE82LPP6f1UfygtLJl9Hk5HOwjT4JuFBJs
	lLIhkK/uQ5PxL2Bk4fLl/HcRsjAVJCyNjrkLDefcmg2Rpl6wd+42/SWVHDQh9ebBwoo8JDg==
X-Received: by 2002:a05:600c:1387:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4a96667b9f7mr107761615e9.5.1793267746803;
        Thu, 29 Oct 2026 02:55:46 -0700 (PDT)
Received: from GLaDOS.station ([187.13.215.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm54492295e9.14.2026.10.29.02.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:55:45 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org
Subject: [PATCH v2 1/1] tpm: tis_i2c: Add reset delays for ST33KTPM2XI2C
Date: Thu, 29 Oct 2026 10:55:28 +0100
Message-ID: <20261029095528.8073-1-stefano.r@variscite.com>
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

Pull the timings from the matched device entry. If they don't exist,
fall back to the legacy behavior without delays. Update of_tis_i2c_match
with the timings for st33ktpm2xi2c.

Link: https://www.st.com/resource/en/datasheet/st33ktpm-idevid.pdf
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Rewrite the last paragraph of the commit message

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

