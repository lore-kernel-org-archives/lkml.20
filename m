Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724574;
	b=GrGjr54Y7734QERrGtouIR/gFT0kBOP32vDMREG/+2fF/eNU+o+/aFWT+y+IPWik6HCP
	 Cte2Xhkm3UJqPCcieMH0tdBsnF5nqWwx6IG0yRGq9+nG3TPegc+qwTZd+feLerkUePOh8
	 QD4kfmzmAN0LK5zo6V7D7aFsOfhTh9EL5mVzutvUN07avVDGZm/lijOYbm1+LULwycOvS
	 INtHTgr8PFDxfTU5van/MnUO0hUCmQv2pTPrFWB5MeaJwvmJx6W1Gq5o1RZHX9laDnZ8S
	 rrhNhEF8RtyVE9K85d1rnSfz5Oo5J6r7CgNkOvZJ5H3Yq59M5fQrEZrEiqux1UbNY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724574;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=F9Kxz+/GPijvT1oPKNCsfGJFCGBSXMQozR90QHZWN/Q=;
	b=hye6W6uk0aeo1T1XC1h/8LyMTGgOIfenSufnD05ssmE+7CxoiqapT7jl2OxABpckAVJ5
	 x92uY60zR0aZvR9fVPL8s6UCtFJ1Lv7iAz2jl+wGiMX8/IxzoGJjOLE32kZ/fyoZ3hqfH
	 1BGA/6VBXNVQuWzanI27/ULtxaRyEJJHRO7wiawSnpLWcCbq4IKo4P75iuZWoMBGBrK3S
	 R2qQyBOgexq0lMGN8OxrnEIwAJl2/1RkfVuLvydzRHTJzRkAAYOVJ4+eMB8iqq7HfTB3i
	 ZH+0/ZMvrdOWh2SYOV+F1ViP60RI7g+oDn7OUUwhVvJ4HCC8UsB1a11anb+/sYZjozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YIUeZjvs;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD91606D818
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCD91606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=YIUeZjvs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9577B4E413E6;
	Tue,  3 Nov 2026 16:49:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64EDD6046C;
	Tue,  3 Nov 2026 16:49:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85873103291F6;
	Tue,  3 Nov 2026 17:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793724571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F9Kxz+/GPijvT1oPKNCsfGJFCGBSXMQozR90QHZWN/Q=;
	b=YIUeZjvsdYsTCboKAFdzerJkjjxeoy1tus5NsxuYChAJas4k7q7OYUioqy8NIEAeO/0M3U
	YQEx70cK44mEbxvb5iN4V3PbZmO4tcJo5l6iDKY4fsmX7fLYczb7pfbHptC6tC4qYdvRdL
	oLOV9v2Zn9djhS3jBCAI5Zy4ZXDaHhTM7A34ulOp8Q5J8Iq4M474+PkmRe0lL6og3V4R7N
	WiDYtWApD4Z5plkWOoYhia+SzAzbwrYZi0+Gx40699iTM1D1Ojk75Y63iIWlB1JZxkM6+J
	XYo/xZnLYspsj6bT4A9LbtX2SbiLrATO/a5n9gMfGihYbXk7kgU7nMEph2BjEQ==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Tue, 03 Nov 2026 17:49:12 +0100
Subject: [PATCH v5 4/9] i2c: cgbc: Use plateform data to get bus ID and
 adapter name
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
Message-Id: <20261103-cgbc-i2c-storage-devices-support-v5-4-ac11f23fae51@bootlin.com>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
In-Reply-To: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Obtain the bus ID (from the BC point of view) and adapter name from
platform data. This allows the specific definitions to be removed, leaving
only a generic adapter definition.

Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/i2c/busses/i2c-cgbc.c | 68 ++++++++++++++++---------------------------
 1 file changed, 25 insertions(+), 43 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cgbc.c b/drivers/i2c/busses/i2c-cgbc.c
index ac23435b731b..40ffab4fd0bc 100644
--- a/drivers/i2c/busses/i2c-cgbc.c
+++ b/drivers/i2c/busses/i2c-cgbc.c
@@ -12,9 +12,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-#define CGBC_I2C_PRIMARY_BUS_ID	0
-#define CGBC_I2C_PM_BUS_ID	4
-
 #define CGBC_I2C_CMD_START	0x40
 #define CGBC_I2C_CMD_STAT	0x48
 #define CGBC_I2C_CMD_DATA	0x50
@@ -60,11 +57,6 @@ enum cgbc_i2c_state {
 	CGBC_I2C_STATE_ERROR,
 };
 
-struct i2c_algo_cgbc_data {
-	u8		bus_id;
-	unsigned long	read_maxtime_us;
-};
-
 struct cgbc_i2c_data {
 	struct device		*dev;
 	struct cgbc_device_data *cgbc;
@@ -73,6 +65,8 @@ struct cgbc_i2c_data {
 	int			nmsgs;
 	int			pos;
 	enum cgbc_i2c_state	state;
+	u8			bus_id;
+	unsigned long		read_maxtime_us;
 };
 
 struct cgbc_i2c_transfer {
@@ -115,10 +109,9 @@ static unsigned int cgbc_i2c_reg_to_freq(u8 reg)
 
 static int cgbc_i2c_get_status(struct i2c_adapter *adap)
 {
-	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
 	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
 	struct cgbc_device_data *cgbc = i2c->cgbc;
-	u8 cmd = CGBC_I2C_CMD_STAT | algo_data->bus_id;
+	u8 cmd = CGBC_I2C_CMD_STAT | i2c->bus_id;
 	u8 status;
 	int ret;
 
@@ -132,7 +125,6 @@ static int cgbc_i2c_get_status(struct i2c_adapter *adap)
 static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
 				  unsigned int bus_frequency)
 {
-	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
 	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
 	struct cgbc_device_data *cgbc = i2c->cgbc;
 	u8 cmd[2], data;
@@ -144,7 +136,7 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
 		bus_frequency = I2C_MAX_STANDARD_MODE_FREQ;
 	}
 
-	cmd[0] = CGBC_I2C_CMD_SPEED | algo_data->bus_id;
+	cmd[0] = CGBC_I2C_CMD_SPEED | i2c->bus_id;
 	cmd[1] = cgbc_i2c_freq_to_reg(bus_frequency);
 
 	ret = cgbc_command(cgbc, &cmd, sizeof(cmd), &data, 1, NULL);
@@ -170,7 +162,7 @@ static int cgbc_i2c_set_frequency(struct i2c_adapter *adap,
 	 * can be read by a command is CGBC_I2C_READ_MAX_LEN.
 	 * Therefore, calculate the max time to properly size the timeout.
 	 */
-	algo_data->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
+	i2c->read_maxtime_us = (BITS_PER_BYTE + 1) * CGBC_I2C_READ_MAX_LEN
 		* USEC_PER_SEC / bus_frequency;
 
 	return 0;
@@ -200,7 +192,6 @@ static unsigned int cgbc_i2c_xfer_to_cmd(struct cgbc_i2c_transfer xfer, u8 *cmd)
 
 static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 {
-	struct i2c_algo_cgbc_data *algo_data = adap->algo_data;
 	struct cgbc_i2c_data *i2c = i2c_get_adapdata(adap);
 	struct cgbc_device_data *cgbc = i2c->cgbc;
 	struct i2c_msg *msg = i2c->msg;
@@ -210,7 +201,7 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 	u8 cmd_data, data_len;
 
 	struct cgbc_i2c_transfer xfer = {
-		.bus_id = algo_data->bus_id,
+		.bus_id = i2c->bus_id,
 		.addr = i2c_8bit_addr_from_msg(msg),
 	};
 
@@ -268,7 +259,7 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 
 		ret = read_poll_timeout(cgbc_i2c_get_status, status,
 					status != CGBC_I2C_STAT_BUSY, 0,
-					2 * algo_data->read_maxtime_us, false, adap);
+					2 * i2c->read_maxtime_us, false, adap);
 		if (ret)
 			goto err;
 
@@ -282,7 +273,7 @@ static int cgbc_i2c_xfer_msg(struct i2c_adapter *adap)
 			goto err;
 		}
 
-		cmd_data = CGBC_I2C_CMD_DATA | algo_data->bus_id;
+		cmd_data = CGBC_I2C_CMD_DATA | i2c->bus_id;
 		ret = cgbc_command(cgbc, &cmd_data, sizeof(cmd_data),
 				   msg->buf + i2c->pos, len, &data_len);
 		if (ret)
@@ -350,44 +341,35 @@ static const struct i2c_algorithm cgbc_i2c_algorithm = {
 	.functionality = cgbc_i2c_func,
 };
 
-static struct i2c_algo_cgbc_data cgbc_i2c_algo_data[] = {
-	{ .bus_id = CGBC_I2C_PRIMARY_BUS_ID },
-	{ .bus_id = CGBC_I2C_PM_BUS_ID },
-};
-
-static const struct i2c_adapter cgbc_i2c_adapter[] = {
-	{
-		.owner		= THIS_MODULE,
-		.name		= "cgbc-i2c0",
-		.class		= I2C_CLASS_DEPRECATED,
-		.algo		= &cgbc_i2c_algorithm,
-		.algo_data	= &cgbc_i2c_algo_data[0],
-		.nr		= -1,
-	},
-	{
-		.owner		= THIS_MODULE,
-		.name		= "cgbc-ddc0",
-		.class		= I2C_CLASS_DEPRECATED,
-		.algo		= &cgbc_i2c_algorithm,
-		.algo_data	= &cgbc_i2c_algo_data[1],
-		.nr		= -1,
-	},
+static const struct i2c_adapter cgbc_i2c_adapter = {
+	.owner		= THIS_MODULE,
+	.class		= I2C_CLASS_DEPRECATED,
+	.algo		= &cgbc_i2c_algorithm,
+	.nr		= -1,
 };
 
 static int cgbc_i2c_probe(struct platform_device *pdev)
 {
-	struct cgbc_device_data *cgbc = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct cgbc_device_data *cgbc = dev_get_drvdata(dev->parent);
+	struct cgbc_i2c_platform_data *pdata;
 	struct cgbc_i2c_data *i2c;
 	int ret;
 
-	i2c = devm_kzalloc(&pdev->dev, sizeof(*i2c), GFP_KERNEL);
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
 
+	pdata = dev_get_platdata(dev);
+	if (!pdata)
+		return dev_err_probe(dev, -ENODEV, "missing platform_data\n");
+
 	i2c->cgbc = cgbc;
-	i2c->dev = &pdev->dev;
-	i2c->adap = cgbc_i2c_adapter[pdev->id];
+	i2c->dev = dev;
+	i2c->adap = cgbc_i2c_adapter;
 	i2c->adap.dev.parent = i2c->dev;
+	i2c->bus_id = pdata->cgbc_bus_id;
+	strscpy(i2c->adap.name, pdata->name, sizeof(i2c->adap.name));
 	i2c_set_adapdata(&i2c->adap, i2c);
 	platform_set_drvdata(pdev, i2c);
 

-- 
2.53.0

