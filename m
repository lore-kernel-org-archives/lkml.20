Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908879;
	b=gCDczTyTyyRlOYcP6sAVaTFVYNUF9SDBUi/Q/HIbZ2WsA2wXOSrCam0wZETuPkdnoKn/
	 nZMRY+ovsU+P55tPFUG/xdDd0a731Ur+pH7w0EXog7v93vmL9kaSElcvuaOihtgdeTJeb
	 /6x1mIpqv1ThVRy73t2PfSLXj3IBonEY+wY6X2ZD12fC0YR2ja8+sDNIJD9/Dtmok+ibb
	 XXH/8Tv4zyGzr8CG7ErOzaBUNPky64M5sEqTh828k/Tm/wEuKemse2Whrtl9/BlbVIStk
	 +ftYa155hF9Yw6Upwl5m0KL8lrITonjZ71H4C6FYTqeJuSn46hwikUXtStJg8QK74fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908879;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=AT8jCkieV89SScQUsNrXmDOXu9xAfYk+SvljhVm6qhE=;
	b=wB3E5kJsVM+qtDi18ujOraI3lJ6jxhwUiwndToiOTOb4o8FWyOKYNf0sXBfF2lkjAaL3
	 /fcOSHT3G/5IemigLGgUbeUPUuYs4deo500yoyYxLr3ZCA4Q/qf/8gQ3CIdFLGJjwAOXH
	 jLbuhflt6Y0XgPJaA5Sr3ZEEhSAk8YtSdT2FHW2DalapKGXkan33bnQ/GLXlBkO8mKJQ3
	 vb9qmvj+cWvb2sV5aCBvwRJha3Fh9ENtnPVtM14REAOmm7aeh/SyECrR/zzNOuCtglSSS
	 ZLIpOUS82x+/6iibhCb5/WhFhUAPRp9V9mabmmwcSJ6Ow09XXnpH7CoKTO5EiZn8Ljw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="2i/C80IR";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0A606A8B9
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E0A606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2i/C80IR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BDC001A159D;
	Tue, 17 Nov 2026 09:47:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92D4A5FC81;
	Tue, 17 Nov 2026 09:47:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E90A911BC02EE;
	Tue, 17 Nov 2026 10:47:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794908876; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AT8jCkieV89SScQUsNrXmDOXu9xAfYk+SvljhVm6qhE=;
	b=2i/C80IRixGZ6h4GPqAau5DHr5A911geLxsn6aIkxJd9iNCkvSy9ehev2YCNwwwbt5H1le
	JXetJsa5FPmuq+eJ5zfPbwPXMTCDk3gOjp+ZGNQw6Dhry1tE3yE3/SQwBnx0sisENM3pkg
	uwIsPnszGNpmCnal27G92RiWksP8oOFEV2lA+g1yPpg4z55rP9kG1IEHl1/QvlXfrQ075t
	IDXh1eMiO0gMZ+wZ4MrUwgsBDVXzXoX/grGBIzX+dQutB81T4TwpUj7uSwuwSmDwAofkAP
	t7+l2x0ti0fL/m8kKgoqR5B5nEPFZ4p3Gjd1KSZzYP5UWEEDd3WWFEDrDGvU9Q==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 17 Nov 2026 10:47:44 +0100
Subject: [PATCH v6 04/10] mfd: cgbc: Add I2C platform data
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-cgbc-i2c-storage-devices-support-v6-4-bb070ad3e9aa@bootlin.com>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
In-Reply-To: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Define I2C platform data for each I2C bus in the cgbc MFD driver. Platform
data passes per-bus parameters to the I2C driver, rather than being defined
inside the i2c-cgbc driver itself. This makes the i2c-cgbc driver more
generic.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/mfd/cgbc-core.c  | 38 +++++++++++++++++++++++++++++---------
 include/linux/mfd/cgbc.h | 10 ++++++++++
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
index 1d5c99a38e85..6c1fbff323e6 100644
--- a/drivers/mfd/cgbc-core.c
+++ b/drivers/mfd/cgbc-core.c
@@ -55,6 +55,35 @@
 
 static struct platform_device *cgbc_pdev;
 
+static const struct cgbc_i2c_platform_data cgbc_i2c_i2c0_pdata = {
+	.name = "cgbc-i2c0",
+	.cgbc_bus_id = 0,
+};
+
+static const struct cgbc_i2c_platform_data cgbc_i2c_ddc0_pdata = {
+	.name  = "cgbc-ddc0",
+	.cgbc_bus_id = 4,
+};
+
+static const struct mfd_cell cgbc_devs[] = {
+	MFD_CELL_NAME("cgbc-backlight"),
+	MFD_CELL_NAME("cgbc-gpio"),
+	MFD_CELL_NAME("cgbc-hwmon"),
+	{
+		.name = "cgbc-i2c",
+		.id = 1,
+		.platform_data = &cgbc_i2c_i2c0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_i2c0_pdata),
+	},
+	{
+		.name = "cgbc-i2c",
+		.id = 2,
+		.platform_data = &cgbc_i2c_ddc0_pdata,
+		.pdata_size = sizeof(cgbc_i2c_ddc0_pdata),
+	},
+	MFD_CELL_NAME("cgbc-wdt"),
+};
+
 /* Wait the Board Controller is ready to receive some session commands */
 static int cgbc_wait_device(struct cgbc_device_data *cgbc)
 {
@@ -236,15 +265,6 @@ int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size
 }
 EXPORT_SYMBOL_GPL(cgbc_command);
 
-static const struct mfd_cell cgbc_devs[] = {
-	{ .name = "cgbc-wdt"	},
-	{ .name = "cgbc-gpio"	},
-	{ .name = "cgbc-i2c", .id = 1 },
-	{ .name = "cgbc-i2c", .id = 2 },
-	{ .name = "cgbc-hwmon"	},
-	{ .name = "cgbc-backlight" },
-};
-
 static int cgbc_map(struct cgbc_device_data *cgbc)
 {
 	struct device *dev = cgbc->dev;
diff --git a/include/linux/mfd/cgbc.h b/include/linux/mfd/cgbc.h
index 91f501e76c8f..4b6e41b9ca4a 100644
--- a/include/linux/mfd/cgbc.h
+++ b/include/linux/mfd/cgbc.h
@@ -41,4 +41,14 @@ struct cgbc_device_data {
 int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size,
 		 void *data, unsigned int data_size, u8 *status);
 
+/**
+ * struct cgbc_i2c_platform_data - Platform data of the CGBC I2C driver
+ * @name:		I2C adapter name
+ * @cgbc_bus_id:	I2C bus ID (from Board Controller point of view)
+ */
+struct cgbc_i2c_platform_data {
+	const char *name;
+	int cgbc_bus_id;
+};
+
 #endif /*_LINUX_MFD_CGBC_H_*/

-- 
2.53.0

