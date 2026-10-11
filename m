Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BBF459AE0
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745852; cv=none; b=peU0tBIU34SNYZ7EN7UlxD+UXFpS45MTkbAp2Ejkv2JqqZ2jTd9BmwBuisaRsWiOBMcUvnb2GVeYYCKCr/2oIB6UuKyxLzQWrTFzgDwkmJ+EJF2kbNDBBPXHzvGAYFrpNd7MUYwAGph2IBSjA5zmr1dbXfFQS02Tsk5xvahJrQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745852; c=relaxed/simple;
	bh=wdPewLjZll5vspdomCbhKL/Dv6JCuPL4/t8ix9sLUXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iildNX8lc5No6stzixH/CA9GgJwWP7bBKDm0nKKGCrrqlaVXPzKxlUFDmc41vWrQzX5SUMAQZPrErQ2+wdT/ZyisiabB/vdfxe5SVKIS/ZHzi31x11qsOggqXLg3ExG9iCrs7R68xpaibMHvHVi5lEYGTJVip4/y9Ev9hv7nAR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhfSILE7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhfSILE7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso17224805e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745848; x=1792350648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=npujxV3sSisPuhxFQVkDlbjVPE00PoMwF5OCaO4uhd4=;
        b=dhfSILE7NTvl0158tXlRdzf4qCNBhyGsDYWDRP0gT7YwcFtZIOwkv1eHLbqIeKRo1Y
         eFaG4zaUHSOQMHIBeC8sP15mh5hL572fRGRLmGmcYEjobmVlM3kh/g35DSkipsY5keT8
         EEC+9hvWT4WJA8MIu3wU0Q/NMwfc7aVK1xtfWHn6t9oupb45tAcFJ/w6S3Zsd2MlrFa1
         dYiQ+ftlTsOq9ayS8qh4cHy0Kcf02hnCCJk8Kclum9wTF+mSP7eYrvp5wf5+tnG8O0/Y
         Iyp0qHlgCA8LwQGHdtfsM+mN0+/+kEHRxRgprthoEwkaOfqKfWL9JwFdS4x7rAaINutL
         0faQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745848; x=1792350648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=npujxV3sSisPuhxFQVkDlbjVPE00PoMwF5OCaO4uhd4=;
        b=mKRiEEVKhOjAdHO1FJQw01PV6Y0vP4q3reguavN5SWuiw3mpOWg3cB403hppC1X86M
         mX1A7x1sf246YocVaP3r2AqtI29XpNVsl2gLLERX7F7UfFDPDpF28DRAP+MFkWCrcC8a
         nkE/W4ZF4kt18SxqCFi0EINLp9KV7ewlKhW3qyK+UUETD8Rclv7bWJpWGUkRxihQg+vq
         Q05LRHFJSGRCikcBfq7fGx8vzdhjH4xQxgVi6qDp+bpnuHZIq27r7/LD5Lyr87PD1a6K
         ysabYbZvCKCmE47nj7dBuA+MWDErjimzWZ79hJ2X43PMPtj5wr1OzdZMef0gJY3b8YIw
         zEpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzzTWPHGoYsdqrVMXXzJpWIC5OkwXnrY3PK7J/TO5CM11uoj0f1vEH4RnVNByFp4AV50EOfR70tGj/NiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6+QLz+Lmpnt+ha2OnNYiNyD0/8Y4434bUczkeJH5vbLtErvK8
	t0s1+cR4w4jNAMw8RXb374LBW6lQ7ghKKIjcnSK4niawafvdCTzt+qb5
X-Gm-Gg: AYBFou2s/lfjpR6z1hNLJ5J0PSAxSjE4npY19z5gbtqVBICI1WxEb0TtLh+AVn6YLAE
	hrsy8nmP9vhQrqfdRY4Rl5eoW+gNpfEXRCBeeghlYoCPS7tDmwAxZt2SNfMx9dbXTMQykM6Whvv
	CZXjouLWds5T5EQTGj6niWtnABsMs/GrP9Lwcbf/mJUDOl7u6N/q8woopHn9n3QHK6Rdh4vc9an
	0n8VeYxdgIegqSVsuUa1Lq8VflQ7S60oRMRe+SA1lBtKuRnAGvOwOpQFB8BFjZR/aWieeR//Lxc
	NJ0okKyVJeTxyWsG0BXINYCbm5HsG49g/HNFOZZtARn8dVU58wrycL/EliIWov4V+HTseNCbNhH
	1DFS9ZrqVDE0KlACK5uXsl2Bf+Hsu/j0H7Q6iYKxFF4V44laJY2k3ioOguvqSydeEvE3+BJNFUc
	Fzs95lEg+r2YAjTfY1ZUud0eeLLPQyGGdECcZj/1xtUh+ktIZAD2xAdAhXbNEcF4LnYyOuZ95Ko
	4SU3H9M/LHzJa5kUPXcegDQ0IPocMCvkf4=
X-Received: by 2002:a05:600c:8b78:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a18e4837f2mr135157515e9.5.1791745848550;
        Sun, 11 Oct 2026 12:10:48 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:47 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 4/4] leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen 1
Date: Sun, 11 Oct 2026 20:09:46 +0100
Message-ID: <20261011191026.149338-5-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011191026.149338-1-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkPad X9-15 Gen 1 enumerates the LM3643 through ACPI (HID
TXNW3643) without a _DSD, like the X1 Carbon Gen 14. It drives the
Windows Hello IR flood illuminator with both current sources feeding a
single LED.

The flash limits were obtained from an ETW trace of the SPB class
extension during a Windows Hello unlock. The Windows driver programs
304 mA per current source (code 0x19 with the LED2 override set) and a
400 ms flash timeout.

There is no vendor value for the torch limit, so use the same
conservative limit as the X1 Carbon Gen 14.

Rename the X1 Carbon Gen 14 nodes after the machine now that the table
has a second entry. Sources and root node remain shared.

Signed-off-by: Rillian Grant <rillian.grant@gmail.com>
---
 drivers/leds/flash/leds-lm3643.c | 70 +++++++++++++++++++++++++-------
 1 file changed, 55 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-lm3643.c
index 18ac75df72e2..38b1dd09a1b7 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -692,16 +692,21 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
 	return lm3643_register_v4l2(dev, led, fwnode);
 }
 
-/*
- * Lenovo ThinkPads enumerate the chip through ACPI (HID TXNW3643) without a
- * _DSD, so the LED is not described by firmware. On the boards below it drives
- * the Windows Hello IR flood illuminator, with both current sources feeding a
- * single LED. Describe that with a software node, with torch and flash limits
- * (100 mA and 300 mA per output) well below the chip's maximums.
- */
 static const u32 lm3643_ir_flood_sources[] = { 0, 1 };
 
-static const struct property_entry lm3643_ir_flood_props[] = {
+static const struct software_node lm3643_ir_flood_root = {
+	.name = "lm3643",
+};
+
+/*
+ * The Lenovo ThinkPad X1 Carbon Gen 14 enumerates the chip through ACPI
+ * (HID TXNW3643) without a _DSD, so the LED is not described by firmware.
+ * On the X1 Gen 14 it drives the Windows Hello IR flood illuminator, with
+ * both current sources feeding a single LED. Describe that with a software
+ * node, with torch and flash limits (100 mA and 300 mA per output) well below
+ * the chip's maximums.
+ */
+static const struct property_entry lm3643_x1c14_props[] = {
 	PROPERTY_ENTRY_U32("reg", 0),
 	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
 	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
@@ -712,19 +717,46 @@ static const struct property_entry lm3643_ir_flood_props[] = {
 	{ }
 };
 
-static const struct software_node lm3643_ir_flood_root = {
-	.name = "lm3643",
+static const struct software_node lm3643_x1c14_led = {
+	.name = "led-0",
+	.parent = &lm3643_ir_flood_root,
+	.properties = lm3643_x1c14_props,
+};
+
+static const struct software_node *lm3643_x1c14_nodes[] = {
+	&lm3643_ir_flood_root,
+	&lm3643_x1c14_led,
+	NULL
 };
 
-static const struct software_node lm3643_ir_flood_led = {
+/*
+ * The Lenovo ThinkPad X9-15 Gen 1 enumerates the chip through ACPI
+ * (HID TXNW3643) without a _DSD. On the X9-15 it drives the Windows Hello IR
+ * flood illuminator, with both current sources feeding a single LED. Flash
+ * maximums were obtained from an SPB class extension ETW trace of the
+ * vendor-supplied Windows driver. The torch limit is a conservative value well
+ * below the chip's maximum.
+ */
+static const struct property_entry lm3643_x9_15_props[] = {
+	PROPERTY_ENTRY_U32("reg", 0),
+	PROPERTY_ENTRY_U32_ARRAY("led-sources", lm3643_ir_flood_sources),
+	PROPERTY_ENTRY_STRING("function", LED_FUNCTION_FLASH),
+	PROPERTY_ENTRY_U32("color", LED_COLOR_ID_IR),
+	PROPERTY_ENTRY_U32("led-max-microamp", 200000),
+	PROPERTY_ENTRY_U32("flash-max-microamp", 608050),
+	PROPERTY_ENTRY_U32("flash-max-timeout-us", 400000),
+	{ }
+};
+
+static const struct software_node lm3643_x9_15_led = {
 	.name = "led-0",
 	.parent = &lm3643_ir_flood_root,
-	.properties = lm3643_ir_flood_props,
+	.properties = lm3643_x9_15_props,
 };
 
-static const struct software_node *lm3643_ir_flood_nodes[] = {
+static const struct software_node *lm3643_x9_15_nodes[] = {
 	&lm3643_ir_flood_root,
-	&lm3643_ir_flood_led,
+	&lm3643_x9_15_led,
 	NULL
 };
 
@@ -735,7 +767,15 @@ static const struct dmi_system_id lm3643_dmi_leds[] = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
 		},
-		.driver_data = (void *)lm3643_ir_flood_nodes,
+		.driver_data = (void *)lm3643_x1c14_nodes,
+	},
+	{
+		/* Lenovo ThinkPad X9-15 Gen 1 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-15 Gen 1"),
+		},
+		.driver_data = (void *)lm3643_x9_15_nodes,
 	},
 	{ }
 };
-- 
2.56.0

