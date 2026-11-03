Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723262;
	b=5GaozFeBppIiYGOrcByMVzIqTvCL6Lkqnstpb0ah8aXfe88bu4KozkGPnhVHU4sR77KH
	 3jBRtaJABwFdmb8gJuIpfi/yeEP8sxs0wmqL9xy6P3h22FC97nbB5aWw7z16uFd/b6Al7
	 qDNO7g24J2vXEkucYy3HRvU1osMd6GbCtr4HBEvHm9C8Nws4q7Ldg30eXCfrr/Vg+ZKDG
	 yL15Ako+32Jnr06NBRfqHf81bVeAaMrVkh43nMwpJUVpQqbcyVkvRmOsIRSAeztV0thUU
	 ZyUX/9nB80Jr0jTgaokFwPWuB1CUubGJGAtm1DGVGMDig2Uh3/um2I5ReJt7Izr9b8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
	b=YMCq0S4XQW+mJvLsMVGIPSLQyAgGY9ZMFdo6Qt6rLpP1JCb+19uYWKJPsSQhKbjgR9QL
	 HqwQuLVy8Ax0iQVRdyC0t7RPOIW4NOrAB/GrUr3N8s/qINgN0tofDKnzxyHfU53MAvbsZ
	 ipASBMJpNG3a9xMfzIlwxJZqxHabt9nTOWqYyrH/N3hgJkDXksBzYCxLAdlcKtj0M8/vK
	 qxUyXF0UeoifF8NbiPDGL14EhVzJkHvETar0DtqFdISpga7YY3CjjUZRSdxq78De2hDR/
	 XaKR1oSZYYVa8sJv7KIaJ9YytWcTVYGPoKalIxdyFYo/rDgIxoVTJpNSs9+6QwVtf1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXPzpZWz;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF803606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF803606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXPzpZWz
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso48989335e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723260; x=1794328060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
        b=uXPzpZWzffhrN2p3XG1K6rb86QdFCBUWw84A8AySy3Vsn2IvDe+ZsqmaXkPNmaM6ru
         ed5wLV3jfjr6od1dgjHUQH0StPfKGg400gEwRHR6SZfbalkq4EM6GiEYP9wZAeVcaX4l
         fA3JnyowqwReGEUC7otkOWjTyBBuN7OV+SlNeEysFaEFlLCfQnaLPfLgJucr+EQjuBGf
         HHFXHsdq2NgGppqlCM5gAffiwtA3u8dbSnmtyLFp2XXs4PaHHkDcdHdiagBoeeaR6a/+
         +BYnZ1cdLe1iA99g3iRTvkvORjW936hH9mM4L4IYS5xMUptDZPuEARwFxE9BU3xnS/A2
         cMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723260; x=1794328060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
        b=FV8NfXL3Pha0vxjywglhsQGKjFWrFGviVjM4ZKjptrsg0xn2CPSvQHFP8BWkGnBtLA
         bSLjehPfOp3gj8BnNNoVsg+pUfCiBhlH7mI5ZmGLdF4vhoZcB4xB4A8Og9/hR3Hs931B
         /SOoH0lWkj4SoJd3p6Cu3vYXHiQsHHKPTTTnmn9zvIdmBilJYtwl5itySzoSWeBZ2sIs
         eyFP+JDEYKNZEnmgP9BJG6eXBEHWPx0n43pjQ12Xi0zqP/TkhGTUzrntAv8Bm0uTq/gK
         a6PQz8kp4basg/2TJDm+qPltcYrS0GWqhuGwbwpiek9ogES/Hk5UV6+ux1Phvjzuq70N
         nZ5g==
X-Forwarded-Encrypted: i=1; AKwUvBydT/VdOpLY5UM9kUFri9IHZ7uZPVVxMizv3amdOStqeIYxL6+7+BRPl31IgdPgZY3w4s1gmYSnanY4oB8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mA3l8zcoZ3stHxXKJp+EcwFbaFKEK1ahbIOy6K9VUzVNvge0D
	EZThcj2A28wma+KNtcBHdK4fk3MEfIq8gBtJZNN/sdxDZL7x99oAnYl2q7Yxew==
X-Gm-Gg: AYBFou0ib8xs6jGf7gTx69uuv66ZLzJ3+MxwpXEuyE1APecz874jEptAct4h8f/EUFm
	eupN0QiPEc0xTTWi576/jRSXPXUHtNiuGSdl0YU2nmZy+iQW1jQQht+ACH92IBTpZQd5ct90q4K
	Btcj8kzbepNrj3Z86/dAC3eY6eUpCBpC9PPlvWE5UUee4wVc7n4odjQE/QLdkzSbM0Jp2np+4CZ
	Uik9DO5CmgmSM+BR0KSIH4D54lbNkm2kKnKe5XMnywnCcQCTXAXOtQMm4SDJ3NFp79OU7RQyyVx
	k8ePTkzWp/JsPBfU+1p4kGFZGPEUquzGuQrxF0Qa8Dy6Ya+KH1oMtMhX1H/qXSEaQAbpCbg77z2
	/dSESRXhElQg7BY4N9UuXvNzp4VcWFaJcUeCOtI3qVIS4SbXBcT2+sNatYmBBQVjCAYx0aUHUcd
	aybsYi9dPIfWJgMp5IMHGc38WRUDaOyYbV/W0EAOQj8MpZDY2b6qmWCdluUXs0rJS4YnUQ+1nOR
	/R64SPJqaH9aeBEFg8Q47CW1vPbkR1QS3eb5Kt5biAJ5hd8i7dRFmwdRT8a1rZpibnsJbwKsOoN
	mnyxvOv515mbgj8t/CwyQOt579rgylHWU2XqbHavhfNZQUdxAuUG6PK0H3uxcsE0IjPxf5O07dx
	oKhfjr+HS8O7NQl1FhnoViyVuLg3Dt9pKGcI=
X-Received: by 2002:a05:600c:524b:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b2612d90d4mr86724965e9.34.1793723259495;
        Tue, 03 Nov 2026 08:27:39 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:297d:39b2:12a3:6322])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm2983463f8f.1.2026.11.03.08.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:27:38 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] gpio-f7188x: Add support for NCT5104D
Date: Tue,  3 Nov 2026 17:27:37 +0100
Message-ID: <20261103162738.135836-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Nuvoton NCT5104D is a Super I/O with four UARTs and 17 GPIO lines,
found on PC Engines APU2 boards. Like the NCT6126D, it keeps its GPIOs
in logical device 7, uses 1 for input in the direction register, and
has a single data register and no Fintek vendor ID.

It differs from the NCT6126D in three ways:
- the device ID carries the silicon revision in its low nibble, so
  match 0xC452 (rev. B) and 0xC453 (rev. C); the NCT6102D and NCT6106D
  report the same IDs and are untested
- the output type sits in logical device 0x0F, one register per group,
  with 1 for open drain
- GP0x and GP1x share their pins with UART C and UART D (CR1C bits 3
  and 2). Register a bank only when its pins are routed to GPIO and its
  group is enabled in LD7 CR30, and log each skipped bank

Only GP0x and GP1x are supported; GP67, the one line of group 6, is
left out: its pin is not connected on the APU2.

This replaces the out-of-tree gpio-nct5104d driver that PC Engines
ships with the datasheet, which was posted once in 2017:
https://github.com/tasanakorn/linux-gpio-nct5104d
https://lore.kernel.org/r/77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org

Tested push-pull and open-drain configurations on a PC Engines APU2,
with UART C and D switched to GPIO in the firmware.

The code is the author's; Claude (Opus 5.5 and Fable 5.1) reviewed it
and drafted this changelog.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/gpio/Kconfig       |   2 +-
 drivers/gpio/gpio-f7188x.c | 102 +++++++++++++++++++++++++++++++++----
 2 files changed, 92 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..7edc8a2d9262 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1060,7 +1060,7 @@ config GPIO_F7188X
 	help
 	  This option enables support for GPIOs found on Fintek Super-I/O
 	  chips F71869, F71869A, F71882FG, F71889F and F81866.
-	  As well as Nuvoton Super-I/O chip NCT6126D.
+	  As well as Nuvoton Super-I/O chips NCT6126D and NCT5104D.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index fb007b978729..7abbc3f86de7 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -23,6 +23,8 @@
 #define SIO_LDSEL		0x07	/* Logical device select */
 #define SIO_DEVID		0x20	/* Device ID (2 bytes) */
 
+#define SIO_ENABLE		0x30	/* Logical device enable */
+
 #define SIO_UNLOCK_KEY		0x87	/* Key to enable Super-I/O */
 #define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
 
@@ -50,8 +52,12 @@
  */
 #define SIO_NCT6126D_VER_A_ID		0xD283  /* NCT6126D version A chipset ID */
 #define SIO_NCT6126D_VER_B_ID		0xD284  /* NCT6126D version B chipset ID */
+#define SIO_NCT5104D_VER_B_ID		0xC452  /* NCT5104D version B chipset ID */
+#define SIO_NCT5104D_VER_C_ID		0xC453  /* NCT5104D version C chipset ID */
 
 #define SIO_LD_GPIO_NUVOTON	0x07	/* GPIO logical device */
+#define SIO_NCT5104D_LD_OUTMODE	0x0F	/* GPIO output mode logical device */
+#define SIO_NCT5104D_MFS	0x1C	/* Multi-function select */
 
 
 enum chips {
@@ -64,6 +70,7 @@ enum chips {
 	f81804,
 	f81865,
 	nct6126d,
+	nct5104d,
 };
 
 static const char * const f7188x_names[] = {
@@ -76,6 +83,7 @@ static const char * const f7188x_names[] = {
 	"f81804",
 	"f81865",
 	"nct6126d",
+	"nct5104d",
 };
 
 struct f7188x_sio {
@@ -188,9 +196,16 @@ static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 #define f7188x_gpio_data_in(base) ((base) + 2)
 /* Output mode register (0:open drain 1:push-pull). */
 #define f7188x_gpio_out_mode(base) ((base) + 3)
+/*
+ * NCT5104D output type register, in LD 0x0F (0:push-pull 1:open drain).
+ * LD7 spaces the groups 4 apart (E0, E4, F8); LD 0x0F uses one register
+ * per group (E0, E1, E6).
+ */
+#define nct5104d_gpio_out_mode(base) (0xE0 + ((base) - 0xE0) / 4)
 
-#define f7188x_gpio_dir_invert(type)	((type) == nct6126d)
-#define f7188x_gpio_data_single(type)	((type) == nct6126d)
+#define f7188x_is_nuvoton(type)		((type) == nct6126d || (type) == nct5104d)
+#define f7188x_gpio_dir_invert(type)	f7188x_is_nuvoton(type)
+#define f7188x_gpio_data_single(type)	f7188x_is_nuvoton(type)
 
 static struct f7188x_gpio_bank f71869_gpio_bank[] = {
 	F7188X_GPIO_BANK(6, 0xF0, DRVNAME "-0"),
@@ -287,6 +302,11 @@ static struct f7188x_gpio_bank nct6126d_gpio_bank[] = {
 	F7188X_GPIO_BANK(8, 0xFC, DRVNAME "-7"),
 };
 
+static struct f7188x_gpio_bank nct5104d_gpio_bank[] = {
+	F7188X_GPIO_BANK(8, 0xE0, DRVNAME "-0"),
+	F7188X_GPIO_BANK(8, 0xE4, DRVNAME "-1"),
+};
+
 static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
@@ -419,6 +439,36 @@ static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static void __f7188x_gpio_set_out_mode(struct f7188x_gpio_bank *bank,
+				       unsigned int offset, bool open_drain)
+{
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 data;
+
+	superio_select(sio->addr, sio->device);
+	data = superio_inb(sio->addr, f7188x_gpio_out_mode(bank->regbase));
+	if (open_drain)
+		data &= ~BIT(offset);
+	else
+		data |= BIT(offset);
+	superio_outb(sio->addr, f7188x_gpio_out_mode(bank->regbase), data);
+}
+
+static void __nct5104d_gpio_set_out_mode(struct f7188x_gpio_bank *bank,
+					 unsigned int offset, bool open_drain)
+{
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 data;
+
+	superio_select(sio->addr, SIO_NCT5104D_LD_OUTMODE);
+	data = superio_inb(sio->addr, nct5104d_gpio_out_mode(bank->regbase));
+	if (open_drain)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	superio_outb(sio->addr, nct5104d_gpio_out_mode(bank->regbase), data);
+}
+
 static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				  unsigned long config)
 {
@@ -426,23 +476,21 @@ static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	enum pin_config_param param = pinconf_to_config_param(config);
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
-	u8 data;
+	bool open_drain;
 
 	if (param != PIN_CONFIG_DRIVE_OPEN_DRAIN &&
 	    param != PIN_CONFIG_DRIVE_PUSH_PULL)
 		return -ENOTSUPP;
 
+	open_drain = param == PIN_CONFIG_DRIVE_OPEN_DRAIN;
 	err = superio_enter(sio->addr);
 	if (err)
 		return err;
-	superio_select(sio->addr, sio->device);
 
-	data = superio_inb(sio->addr, f7188x_gpio_out_mode(bank->regbase));
-	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
-		data &= ~BIT(offset);
+	if (sio->type == nct5104d)
+		__nct5104d_gpio_set_out_mode(bank, offset, open_drain);
 	else
-		data |= BIT(offset);
-	superio_outb(sio->addr, f7188x_gpio_out_mode(bank->regbase), data);
+		__f7188x_gpio_set_out_mode(bank, offset, open_drain);
 
 	superio_exit(sio->addr);
 	return 0;
@@ -458,6 +506,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 	int i;
 	struct f7188x_sio *sio = dev_get_platdata(&pdev->dev);
 	struct f7188x_gpio_data *data;
+	bool nct5104d_bank_0 = true, nct5104d_bank_1 = true;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -500,6 +549,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(nct6126d_gpio_bank);
 		data->bank = nct6126d_gpio_bank;
 		break;
+	case nct5104d:
+		data->nr_bank = ARRAY_SIZE(nct5104d_gpio_bank);
+		data->bank = nct5104d_gpio_bank;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -507,6 +560,23 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	if (sio->type == nct5104d) {
+		int cr1c, cr30;
+
+		err = superio_enter(sio->addr);
+		if (err)
+			return err;
+		cr1c = superio_inb(sio->addr, SIO_NCT5104D_MFS);
+		superio_select(sio->addr, sio->device);
+		cr30 = superio_inb(sio->addr, SIO_ENABLE);
+		superio_exit(sio->addr);
+
+		/* Bank 0: register it only if CR1C bit 3 (UART C) is clear and CR30 bit 0 is set */
+		nct5104d_bank_0 = !(cr1c & BIT(3)) && (cr30 & BIT(0));
+		/* Bank 1: register it only if CR1C bit 2 (UART D) is clear and CR30 bit 1 is set */
+		nct5104d_bank_1 = !(cr1c & BIT(2)) && (cr30 & BIT(1));
+	}
+
 	/* For each GPIO bank, register a GPIO chip. */
 	for (i = 0; i < data->nr_bank; i++) {
 		struct f7188x_gpio_bank *bank = &data->bank[i];
@@ -514,6 +584,11 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		bank->chip.parent = &pdev->dev;
 		bank->data = data;
 
+		if ((i == 0 && !nct5104d_bank_0) || (i == 1 && !nct5104d_bank_1)) {
+			dev_info(&pdev->dev, "NCT5104D: Skip registering GPIO bank %d\n", i);
+			continue;
+		}
+
 		err = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
 		if (err) {
 			dev_err(&pdev->dev,
@@ -570,13 +645,18 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 		sio->device = SIO_LD_GPIO_NUVOTON;
 		sio->type = nct6126d;
 		break;
+	case SIO_NCT5104D_VER_B_ID:
+	case SIO_NCT5104D_VER_C_ID:
+		sio->device = SIO_LD_GPIO_NUVOTON;
+		sio->type = nct5104d;
+		break;
 	default:
 		pr_info("Unsupported Fintek device 0x%04x\n", devid);
 		goto err;
 	}
 
 	/* double check manufacturer where possible */
-	if (sio->type != nct6126d) {
+	if (!f7188x_is_nuvoton(sio->type)) {
 		manid = superio_inw(addr, SIO_FINTEK_MANID);
 		if (manid != SIO_FINTEK_ID) {
 			pr_debug("Not a Fintek device at 0x%08x\n", addr);
@@ -588,7 +668,7 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	err = 0;
 
 	pr_info("Found %s at %#x\n", f7188x_names[sio->type], (unsigned int)addr);
-	if (sio->type != nct6126d)
+	if (!f7188x_is_nuvoton(sio->type))
 		pr_info("   revision %d\n", superio_inb(addr, SIO_FINTEK_DEVREV));
 
 err:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

