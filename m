Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639794;
	b=Eho7Eeeqs4CCMfqM3kS30x5FjRx9l1R/Q5Dkv4lzYDrz1gsRWqHzw1/o7vL12pcSD5WD
	 6bMq6ss2l4fW9LiGVHVslrvPZxQ9aqZu1B7/YYVXUc/yiaW+nI9ExEGb5/1Uyiye7xkPc
	 SWo6AV+kqCY8u0h2q05PbZnpwI0CPt56pqNL4zQY57wZInngRNtoqaPHc1k83JvyNY3tE
	 qomFb8iiYH0UjO/gxlga+mz7bYzm9VBB3JZKGlbXF+Mi+SWoZkS3cR9jBG6SsYlQo+dUC
	 q1zZ+3GH7kWQGmszu0/pNlmrMGMrnQS1fanON+mm0G1Rd/XIpBckh/bwcHyCTNfXn9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zgqD89lKzgLBL1PbvkWlYvj9CPZh0ai5gQikgbqBdYY=;
	b=A9cdtZOl2YhIe11XZ8w/kpREg7Jg210yz7S65tJDypjkuTCYU5MWK3IFAqoKoHASvn3+
	 EvMlFdMiLBjdWbFjPyeMLYicYNRwhITwqmwij/WDwQJAF8lw0+X5Jue3kk70sHNHvgvbv
	 wWOwkwFSMbTrKnKsW8wSuhGpTBLcEEe7sx1pMRgafqj04csrbHU9XX6DAFB502w3Pux5B
	 yBQ62ZkUYWkty0DTgO2N2mFQbQkMxRzhnorTA51wo7Xf+BVdXec83/kUmdEdwJe0TDE0f
	 p8J59KJ7S3ywNcJzqACSuQiP3S9hjLTrdRHomip95yNN2t3lZGEnzQsFWBxV6pe9XxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqudYOnO;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C66072ED6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A47C66072ED6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqudYOnO
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e10a70540so1834844f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639792; x=1794244592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgqD89lKzgLBL1PbvkWlYvj9CPZh0ai5gQikgbqBdYY=;
        b=QqudYOnOCpcbBJnhdewmbg8YNVY0Dz9Y18MavUWzV6bqGuoNjJx0lthzn9j6GEBpG0
         R+ttT3nCFqAMfgrAAdRcVftG7SYrWjLX4P3BEk/NuV2aWcADTKxh6uLaDeEYdz4ELNmi
         Nf9xPbjHA7cNmUI2IKP2qGXFH6333q4lKNKnsRdGTkL08mPt0/IYd3mIXDh/NqAj+SzE
         d4Boidixiv9lQV2fSeEvQdVKsc1aSKTzKx8heg9QX3zmBAvJu0mlXwF36njrxyy0AZvm
         qJsR1bV1jm0OuC46/l57zjYiooTxbRcDveH0eu5gnsB5nHTc5V9xAN1UAugUhjgmSOsR
         ctYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639792; x=1794244592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zgqD89lKzgLBL1PbvkWlYvj9CPZh0ai5gQikgbqBdYY=;
        b=p0dcr2tGhoxNGi7wDRAharI17smq7tZwJBqp7rUCy4DuJILIgGtx26WfwjPuD6+fV0
         95WmtOOZULRrFNvIMVjPRcrttBT3/xNViIiyW6uUkXzHqxYhgjlW9MHVdzuBIsJMS/RQ
         KCvCso8s/AiJDQBvfPGSI5HgfZzsLyl7Lnxeo9UrpaB2KoFkZyT+UHfZiyfEGVi7qlmi
         jxRkV8u+H5rzPXeCGKwpa35oWQ+5VD0o9PDKPenPhMU8bLK6HQ7eoUEQ4vee7Fgg/KpO
         2yG3A0nGiXbWnLpW0jnhJdR2i0sGe34cxUIkDffpMsqH1CUjwp/k9JH++lJxbv0SYj3X
         p1Bg==
X-Forwarded-Encrypted: i=1; AKwUvBwGFUTgWJwcY3hlGAJsVjOCYuhgnk4/OkvchJiF+RUKoKuYQXBpBRCVugggQkpiWVM4fFIO6i4PQUVjyFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z//wGg7qY+sE7msOk3PlKkN/KowWCK6gsH0hPHBKd8bdFlBvKZN
	0nEapo/qhGS8fwUGNSlt1s/HDuxR+xLiFejbZbtSb5UzyJBLysNMuJPV
X-Gm-Gg: AYBFou0vze9eHHZR4sv7zUegbY+w1AEWBm4EyhB5pCEddnCr3eBpTEo3k/deMxw0sMM
	57H2bHZt8GGCUvo7s8J6JSjRAibFzZ3lFFNuIeA/TlP9syI1rCrTV2HrRLBU7A68U5E6xyfSnlp
	9HhMjn6o2OhvXTPTmyB8SsmHBjzC3rbjUmk2+qVOjPELq+4LawoIrZDDgrOgxcxavjwDX+Z1Xpi
	G5NIHL4vD54v8XzK/t+VXLq9AQqNTkrtXXyiT6QsrNeh3S+cBW1VYz3fRpOCVbGotyXe9dwA0ms
	aU4bf+JJlMTXaJ3Ol9cTj6Ivu3p1T/3J1ftWgfq+GMosQoQQzm2r5R1nz2TC57TA90BSJmB39Qt
	oKvxaq9pUWbcGHD9zETJEAfRu/u2OLMHr0mdTtW6O/jZniEgG87xx79Kes2YZ2MfwnKWfkxyL64
	XkJfEWoeFs1KncHOQ3k1ZlIKa2VAdLg4Y68K/x+qesyn580ge7lXkuzN+oI1Hsjc8ym0AV/HcEx
	F3nO800XThwDClxLKQNEcyUAAdyQWU0A6T/b0496P78+yf9C/Iw02dL+rj/s25fdQIFpunMuVi3
	zlghOkTGfzqJKpS27SAN7ECpZ4mK/tcEsrLuvY2vDjjtMYtWW9398KyyLx5cEyE=
X-Received: by 2002:a5d:6208:0:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-48e6e4f8bc8mr19150385f8f.43.1793639791919;
        Mon, 02 Nov 2026 09:16:31 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm23598760f8f.6.2026.11.02.09.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:16:31 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 4/4] wifi: cw1200: add XRadio XR819 support
Date: Mon,  2 Nov 2026 17:16:03 +0000
Message-ID: <20261102171603.368298-5-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102171603.368298-1-pmazzini@gmail.com>
References: <20261102171603.368298-1-pmazzini@gmail.com>
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

The XR819 uses the ST-E SDIO vendor ID with device ID 0x2281 and
reports itself as a CW1x60. It starts from a bootloader written into
its memory, then takes the usual firmware download. Its modules run
from a 24 MHz reference clock.

Give the CW1x60 entry the XR819 bootloader and firmware, and load the
bootloader instead of the NOP instruction.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/net/wireless/st/cw1200/Kconfig       |  3 +-
 drivers/net/wireless/st/cw1200/cw1200_sdio.c | 13 ++++-
 drivers/net/wireless/st/cw1200/fwio.c        | 58 ++++++++++++++++----
 drivers/net/wireless/st/cw1200/fwio.h        |  7 ++-
 include/linux/mmc/sdio_ids.h                 |  1 +
 5 files changed, 66 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/st/cw1200/Kconfig b/drivers/net/wireless/st/cw1200/Kconfig
index 03575e9894bb..9404e318137c 100644
--- a/drivers/net/wireless/st/cw1200/Kconfig
+++ b/drivers/net/wireless/st/cw1200/Kconfig
@@ -3,7 +3,8 @@ config CW1200
 	tristate "CW1200 WLAN support"
 	depends on MAC80211 && CFG80211
 	help
-	  This is a driver for the ST-E CW1100 & CW1200 WLAN chipsets.
+	  This is a driver for the ST-E CW1100 & CW1200 and the XRadio
+	  XR819 WLAN chipsets.
 	  This option just enables the driver core, see below for
 	  specific bus support.
 
diff --git a/drivers/net/wireless/st/cw1200/cw1200_sdio.c b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
index 2b6afe221268..3db937785cab 100644
--- a/drivers/net/wireless/st/cw1200/cw1200_sdio.c
+++ b/drivers/net/wireless/st/cw1200/cw1200_sdio.c
@@ -35,6 +35,12 @@ static struct cw1200_platform_data_sdio sagrad_109x_evk_platform_data = {
 	.sdd_file = "sdd_sagrad_1091_1098.bin",
 };
 
+/* XRadio XR819 modules, with a 24 MHz reference clock */
+static const struct cw1200_platform_data_sdio xr819_platform_data = {
+	.ref_clk = 24000,
+	.have_5ghz = false,
+};
+
 /* Allow platform data to be overridden */
 static struct cw1200_platform_data_sdio *global_plat_data = &sagrad_109x_evk_platform_data;
 
@@ -51,6 +57,8 @@ struct hwbus_priv {
 
 static const struct sdio_device_id cw1200_sdio_ids[] = {
 	{ SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_CW1200) },
+	{ SDIO_DEVICE(SDIO_VENDOR_ID_STE, SDIO_DEVICE_ID_STE_XR819),
+	  .driver_data = (kernel_ulong_t)&xr819_platform_data },
 	{ /* end: all zeroes */			},
 };
 MODULE_DEVICE_TABLE(sdio, cw1200_sdio_ids);
@@ -295,7 +303,10 @@ static int cw1200_sdio_probe(struct sdio_func *func,
 
 	func->card->quirks |= MMC_QUIRK_LENIENT_FN0;
 
-	self->pdata = global_plat_data; /* FIXME */
+	if (id->driver_data)
+		self->pdata = (const void *)id->driver_data;
+	else
+		self->pdata = global_plat_data; /* FIXME */
 	self->func = func;
 	sdio_set_drvdata(func, self);
 	sdio_claim_host(func);
diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
index 1a68ef6ed2fa..6b885fd717db 100644
--- a/drivers/net/wireless/st/cw1200/fwio.c
+++ b/drivers/net/wireless/st/cw1200/fwio.c
@@ -66,9 +66,10 @@ static const struct cw1200_chip cw1200_chips[] = {
 		.firmware = FIRMWARE_CUT22,
 		.sdd = SDD_FILE_22,
 	}, {
-		.revision = CW1X60_HW_REV,
-		.firmware = FIRMWARE_CW1X60,
-		.sdd = SDD_FILE_CW1X60,
+		.revision = CW1X60_HW_REV,	/* XRadio XR819 */
+		.bootloader = BOOTLOADER_XR819,
+		.firmware = FIRMWARE_XR819,
+		.sdd = SDD_FILE_XR819,
 		.sync_join = true,
 		.no_switch_channel = true,
 	},
@@ -85,6 +86,38 @@ static const struct cw1200_chip *cw1200_find_chip(int revision)
 	return NULL;
 }
 
+/* The bootloader is written word by word into the AHB memory */
+static int cw1200_load_bootloader(struct cw1200_common *priv)
+{
+	const struct firmware *bootloader;
+	const __le32 *data;
+	u32 addr = 0x08000000;
+	size_t i;
+	int ret;
+
+	ret = request_firmware(&bootloader, priv->chip->bootloader, priv->pdev);
+	if (ret) {
+		pr_err("Can't load bootloader file %s.\n", priv->chip->bootloader);
+		return ret;
+	}
+
+	data = (const __le32 *)bootloader->data;
+	for (i = 0; i < bootloader->size / 4; i++, addr += 4) {
+		ret = cw1200_reg_write_32(priv, ST90TDS_SRAM_BASE_ADDR_REG_ID,
+					  addr);
+		if (!ret)
+			ret = cw1200_reg_write_32(priv, ST90TDS_AHB_DPORT_REG_ID,
+						  le32_to_cpu(data[i]));
+		if (ret) {
+			pr_err("Can't write bootloader.\n");
+			break;
+		}
+	}
+
+	release_firmware(bootloader);
+	return ret;
+}
+
 static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 {
 	int ret, block, num_blocks;
@@ -136,6 +169,12 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 	if (!priv->sdd_path)
 		priv->sdd_path = priv->chip->sdd;
 
+	if (priv->chip->bootloader) {
+		ret = cw1200_load_bootloader(priv);
+		if (ret)
+			return ret;
+	}
+
 	/* Initialize common registers */
 	APB_WRITE(DOWNLOAD_IMAGE_SIZE_REG, DOWNLOAD_ARE_YOU_HERE);
 	APB_WRITE(DOWNLOAD_PUT_REG, 0);
@@ -143,9 +182,11 @@ static int cw1200_load_firmware_cw1200(struct cw1200_common *priv)
 	APB_WRITE(DOWNLOAD_STATUS_REG, DOWNLOAD_PENDING);
 	APB_WRITE(DOWNLOAD_FLAGS_REG, 0);
 
-	/* Write the NOP Instruction */
-	REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
-	REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
+	/* Write the NOP Instruction, unless the bootloader runs instead */
+	if (!priv->chip->bootloader) {
+		REG_WRITE(ST90TDS_SRAM_BASE_ADDR_REG_ID, 0xFFF20000);
+		REG_WRITE(ST90TDS_AHB_DPORT_REG_ID, 0xEAFFFFFE);
+	}
 
 	/* Release CPU from RESET */
 	REG_READ(ST90TDS_CONFIG_REG_ID, val32);
@@ -483,11 +524,6 @@ int cw1200_load_firmware(struct cw1200_common *priv)
 
 	switch (priv->hw_type)  {
 	case HIF_8601_SILICON:
-		if (priv->hw_revision == CW1X60_HW_REV) {
-			pr_err("Can't handle CW1160/1260 firmware load yet.\n");
-			ret = -ENOTSUPP;
-			goto out;
-		}
 		ret = cw1200_load_firmware_cw1200(priv);
 		break;
 	default:
diff --git a/drivers/net/wireless/st/cw1200/fwio.h b/drivers/net/wireless/st/cw1200/fwio.h
index 9925d4bcedda..fb66d564c304 100644
--- a/drivers/net/wireless/st/cw1200/fwio.h
+++ b/drivers/net/wireless/st/cw1200/fwio.h
@@ -14,13 +14,13 @@
 #ifndef FWIO_H_INCLUDED
 #define FWIO_H_INCLUDED
 
-#define BOOTLOADER_CW1X60       "boot_cw1x60.bin"
-#define FIRMWARE_CW1X60		"wsm_cw1x60.bin"
+#define BOOTLOADER_XR819	"xr819/boot_xr819.bin"
+#define FIRMWARE_XR819		"xr819/fw_xr819.bin"
 #define FIRMWARE_CUT22		"wsm_22.bin"
 #define FIRMWARE_CUT20		"wsm_20.bin"
 #define FIRMWARE_CUT11		"wsm_11.bin"
 #define FIRMWARE_CUT10		"wsm_10.bin"
-#define SDD_FILE_CW1X60		"sdd_cw1x60.bin"
+#define SDD_FILE_XR819		"xr819/sdd_xr819.bin"
 #define SDD_FILE_22		"sdd_22.bin"
 #define SDD_FILE_20		"sdd_20.bin"
 #define SDD_FILE_11		"sdd_11.bin"
@@ -28,6 +28,7 @@
 
 struct cw1200_chip {
 	int revision;
+	const char *bootloader;	/* NULL: write the NOP instruction */
 	const char *firmware;
 	const char *sdd;
 	bool sync_join;		/* no asynchronous join */
diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
index dfffda3d8002..35789be747a5 100644
--- a/include/linux/mmc/sdio_ids.h
+++ b/include/linux/mmc/sdio_ids.h
@@ -27,6 +27,7 @@
 
 #define SDIO_VENDOR_ID_STE			0x0020
 #define SDIO_DEVICE_ID_STE_CW1200		0x2280
+#define SDIO_DEVICE_ID_STE_XR819		0x2281
 
 #define SDIO_VENDOR_ID_INTEL			0x0089
 #define SDIO_DEVICE_ID_INTEL_IWMC3200WIMAX	0x1402
-- 
2.52.0

