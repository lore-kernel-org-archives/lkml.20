Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5144237D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787828604; cv=none; b=UF9Q1g2vIWp9R0+CCFarzETRB6AOA3r7P+R9LVAbYhIXIV4P6xUlggEMZE/jGBQjfww3vLScqZuqXdhkskESjpS2BQQahUiX88571OTnmr3aWUWiw1Ufd4N02Eh4ylQEM8xwdkepZ7+AbMl9tzGPNoILGLOFHhWWrouQwg3BzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787828604; c=relaxed/simple;
	bh=8urEIkOEgNg/W0WfryJCD+eWZUJUCTF8wpI/6h2nZwI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=URZ92ju/lQe69CxsvjwPT//SFdy/r+foK5wsHyLUQRbBzYx8LNJJDhXaPg8NXUiLdduPA8fINCu6LogeD4l3CYcRxwftW75LMsgaXVtqVsd/zRwwweJT5i5I4RD0FDvM3miiJYl+2jzzIgH5yjLLmb2ZC8TxNP31Aljh7dpeKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com; dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b=NB2GU9cd; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synaptics.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synaptics-corp-partner-google-com.20251104.gappssmtp.com header.i=@synaptics-corp-partner-google-com.20251104.gappssmtp.com header.b="NB2GU9cd"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceab75934dso24913915ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20251104.gappssmtp.com; s=20251104; t=1787828601; x=1788433401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=NB2GU9cdGqOurno5IEO8+wdLCK52SDYGmTwVmjFAd9O+6gTL8v9GxibsbPBXmdjTdN
         qIPkVtdKxQynXVjbH203cfXvodknyipvgZlFUpGq+Tc74agcTFN/ibhMe+TbPIEwz2Na
         zwp0RGZ0lwzrs8f0kB6NL7QfO0gXqqUkTEDHRCCw9qe3hXCvSnkrnblXFB0pkRljy3jY
         Q0cuYdFQifiAOswl7YNd6cC3EOc6dcAfStTATXl1ENSZZYVxIgTma+P06jJ7h6kZmaeS
         dvTUl5qmn5I2xurqcarfGmEh9sIxfHG0lBv6Rte4jahLhBSNqg30zoyu3H8zXaDFdZwv
         8Qog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787828601; x=1788433401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fj+fXTtu50ERwc8Uhij96oNyWIgOxu7AHbjsaE81Xyc=;
        b=IZKBxL/wIcju+t6cdxiHvdAxnWn332vlkkEiuRNZoq4dkodMb3bGd+6coj1SZH8iY1
         hZZOMlK72872u7iOgATXAhHDfixP6W8GQl41HXcolkqKTaG9kw+gJ7yjxvZwIaQ/4abv
         n361t4fc0T/MJSaQsTju12+UrmE6BYQFuRXUhLTvn/AwvqeWF/iBPK9O+CRE/ndI2tl2
         jESLI74YCVBfb4pph1T7IywjXM0CkMmZIdfH1KsHfwY9Kxg5P/dRG+ZNiwzMA6LjK/Zx
         JLol0uY/De/w9IgMp2wc4vPSA1r0K1nhdw5OvBYQIohWt4y2hmn2VfDMWZGTp7mzrIuD
         R/hQ==
X-Forwarded-Encrypted: i=1; AHgh+RoesDfZkaWGXXu00ZlbtE/8a+UTyIKHI9mmHgA2gWZNp120fip4LfrbHTVXoP0o5DXXQwxtnO4vDFJtfIY=@vger.kernel.org
X-Gm-Message-State: AFuF++mnpUzCOdA8PJ7nqnzCGCiC4vXS4LVKFou1aM70+o/D2lUGVqlk
	rx9tVzmHtZLpEZ5VuDQazbYoWj+lx0lj+STjGAxqqAqxa7eDCBw1XBsbbk1Xz7mdiG0=
X-Gm-Gg: AR+sD13RNXnIwOnlOLG1uJnGzGC4L7ilNniT++PR3lZhD2F+RQ5w9oYUQVwakrznagV
	uZ0NGVQGWL54S6502iCBtgvQebjqPCXc7rATC2lk2s6Fyv4gToqPa1tDQSPuqZzAOxx+5SjWHWD
	6FwlGIVGKhWYqPaLG+ArEz4rttiX8Y0jkPwmMXnh+F5qUG+EeQqx2wO/kaKcIMXvpwkE+yWiAvy
	jv64aLFI7JHuMjLME/2HJ8trFu42nT7zydDADy0rR1nHg3cQCm5fXIbDmFbYqhLZk4dXnQhTPWF
	YatqldMKf2s6csen1NoJcaUpLBElQzRbWem0pxh2VRJ5d5n/NOQtL7wbdNnB8UqaWFUmZvSHCAG
	oM4Gh97PY0h2RuV8qjNJpg8xuAYEqjKwb3IXkK5MPT2AZEArEv4eMUnfydFWPO/uD3cvUdaiy9o
	/I9iOT/VCuTtYCuoe8DX1C3Cr19jmWRbhIKNo4lA1HW+yis+Cfgf26AznfdEVMjJDdOtQgnBv7y
	W37rrok48H/ppjlziNlHNcPPH8OE/cnfmbrn0g9Q4cKXJ9cEqcNna2j9IXJtQX02tWrintIs3LG
	vER/35I=
X-Received: by 2002:a17:903:1ae8:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d707957143mr256210645ad.3.1787828601192;
        Thu, 27 Aug 2026 04:03:21 -0700 (PDT)
Received: from bt-tpe-server.synaptics-inc.local (59-124-75-166.hinet-ip.hinet.net. [59.124.75.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c4bea8sm15081585ad.82.2026.08.27.04.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 04:03:18 -0700 (PDT)
From: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
To: linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Chang <andy.chang@synaptics.corp-partner.google.com>
Subject: [PATCH v1 2/2] Bluetooth: btbcm: Add Synaptics 4384 chip support
Date: Thu, 27 Aug 2026 19:02:42 +0800
Message-Id: <20260827110242.1203546-3-andy.chang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
References: <20260827110242.1203546-1-andy.chang@synaptics.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Synaptics 4384 Bluetooth controller
by adding the corresponding chip IDs.

Tested on the VIM3 platform. Verified that the controller initializes
successfully and that firmware loading and basic Bluetooth operation
work as expected.

The VIM3 is a Khadas single-board computer that I used as the host
platform for testing the BCM4384 Bluetooth controller.

Signed-off-by: Andy Chang <andy.chang@synaptics.corp-partner.google.com>
---
 drivers/bluetooth/btbcm.c   | 6 +++++-
 drivers/bluetooth/hci_bcm.c | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btbcm.c b/drivers/bluetooth/btbcm.c
index 463d59890bef..63c4c788d9c4 100644
--- a/drivers/bluetooth/btbcm.c
+++ b/drivers/bluetooth/btbcm.c
@@ -31,6 +31,7 @@
 #define BDADDR_BCM4334B0 (&(bdaddr_t) {{0x00, 0x00, 0x00, 0xb0, 0x34, 0x43}})
 #define BDADDR_BCM4345C5 (&(bdaddr_t) {{0xac, 0x1f, 0x00, 0xc5, 0x45, 0x43}})
 #define BDADDR_BCM43341B (&(bdaddr_t) {{0xac, 0x1f, 0x00, 0x1b, 0x34, 0x43}})
+#define BDADDR_BCM4384B0 (&(bdaddr_t) {{0x93, 0x76, 0x00, 0xb0, 0x84, 0x43}})
 
 #define BCM_FW_NAME_LEN			64
 #define BCM_FW_NAME_COUNT_MAX		4
@@ -130,7 +131,8 @@ int btbcm_check_bdaddr(struct hci_dev *hdev)
 	    !bacmp(&bda->bdaddr, BDADDR_BCM4345C5) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM43430A0) ||
 	    !bacmp(&bda->bdaddr, BDADDR_BCM43430A1) ||
-	    !bacmp(&bda->bdaddr, BDADDR_BCM43341B)) {
+	    !bacmp(&bda->bdaddr, BDADDR_BCM43341B) ||
+	    !bacmp(&bda->bdaddr, BDADDR_BCM4384B0)) {
 		/* Try falling back to BDADDR EFI variable */
 		if (btbcm_set_bdaddr_from_efi(hdev) != 0) {
 			bt_dev_info(hdev, "BCM: Using default device address (%pMR)",
@@ -514,6 +516,8 @@ static const struct bcm_subver_table bcm_uart_subver_table[] = {
 	{ 0x4106, "BCM4335A0"	},	/* 002.001.006 */
 	{ 0x410c, "BCM43430B0"	},	/* 002.001.012 */
 	{ 0x2119, "BCM4373A0"	},	/* 001.001.025 */
+	{ 0x2128, "BCM4384A0"	},	/* 001.001.040 */
+	{ 0x4119, "BCM4384B0"	},	/* 002.001.025 */
 	{ }
 };
 
diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 9a103db7e355..e70b9f3fd968 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -1593,6 +1593,7 @@ static const struct of_device_id bcm_bluetooth_of_match[] = {
 	{ .compatible = "brcm,bcm4349-bt", .data = &bcm43438_device_data },
 	{ .compatible = "brcm,bcm43540-bt", .data = &bcm4354_device_data },
 	{ .compatible = "brcm,bcm4335a0" },
+	{ .compatible = "brcm,bcm4384-bt" },
 	{ .compatible = "cypress,cyw4373a0-bt", .data = &cyw4373a0_device_data },
 	{ .compatible = "infineon,cyw55572-bt", .data = &cyw55572_device_data },
 	{ },
-- 
2.25.1

