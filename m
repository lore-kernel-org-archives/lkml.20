Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8E492E39
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588641; cv=none; b=o56ggye3c0wDFJo/mMXqsL3WIZn2s5To6X3LGXEGTzUBhvMdv4CD/bxJMkrNjVs4wGOgrHwun2AS/wN9KVEc+vJy1P1pbDq58sAvbPZQRoIK03HdE7LvEzYchYy5KV4LEECmqYJc/xOXEF+1tstJDNM+naRJcBVJjch4BDoYsbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588641; c=relaxed/simple;
	bh=R6jDUXaKPlX6MRK91sXQr260A3n0cmMR3fkp32XpTqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XBBKrwIMi3K4d/1R6oxFM2OqA11RK9xhhTot7tsjzTF/mdvRYJqaQvadRsrQsrqe1UxE6g653OSMFxnb+4G+uTzEYZmIWyGX6w2zYd5qREBXCJcOQCm3xfppaet3P5XgG7KbRJicCLTEt6ufPlsHPQuLNlqvYJ7wRW5j4+ikapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXCyLPyV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXCyLPyV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso26423895e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588636; x=1791193436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eIBXHTQYqUFLUQYYpAYLx+6fs8AovK0MEGqXpX/ICs=;
        b=kXCyLPyVGMcFBzPF+o/NtoelXtPglHJ3CKE41YMz2kT1ml+DI5eJTQe7nyMpY63gTW
         aKEIW9b37YucL+73vQuqHHnExARAijY2hxKkbMD5zDWv6kBvw10/pZ4LUjVrUweIlZ9O
         4YV4rFVjgWqCmc2HuP/neVYLz8nEA2JvtFBq6U3R5vJOmaZ/knxifFlAk8ezs858S15H
         o9nl+FYFyhnXQ4UX+NYsz/TAcL5i8I8pXJf/9Zt/c2/+OZV3Gv4iO6tgqFaflxJ8DUXn
         /JlUv+tnQUDkWi6POWlzXULLIQnJ2KSvu2tGr/AEmBebZYPgNKbfMJDDMxLaPXh5KRVa
         LGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588636; x=1791193436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eIBXHTQYqUFLUQYYpAYLx+6fs8AovK0MEGqXpX/ICs=;
        b=2eZfxukgYjIrYSnqTJ/t22g+y9awVgR0E+KYiSt48LZ39NacIHmQHJN+IEaJ7oLDAT
         wNKfC3BZLdM9Qc7kDYwkoRHWsbtbfW3XcVAijNt3ZQpQPeuW2f7RSHxU6gSXdd/ODRCd
         AbFaBG15wa/3ToejIN6C00latRh+NNa7oX6fY/DoV7iKONS9+pYHQRcUObiTf3J7VgoI
         ckOPuszzhXjjYUSZCxxGF0DQi3wVcG/YclB/w0E25cqfPVtlRHZkLsAZMImfl3RjMzl1
         g4XmWbmA4C33o8NR+1+QdTPNwGuYaML5kSfvb3ueX9hZU3eYoX2sC+Hlwu+QbfpLpDMm
         dS4w==
X-Forwarded-Encrypted: i=1; AKwUvBywbCIa1PeWpuFKY1JmDFz/XtsPs6fc+3CrlT7C1Bke1xCgHQd8SXKQ55OtCyBB9x6AUIZLSl/lrPTTUfU=@vger.kernel.org
X-Gm-Message-State: AFuF++k2hMZP6fi9I+9qP7SCTo8jNclLTIFnW8ZQ6WcTI3fIm+PcAvLY
	selYRbNQPjfPiYKnofaIGKQa48K1B+HyhCO8BE4vRctwu0e7+95YkSEQ
X-Gm-Gg: AYBFou2LpM2/BTW9lAcqccqmhtkqERcoBqviiBVT+/b5VJb55yP52j6Qzaz5i3L0H8z
	FvBV+Tfc8J38/Fu7+4xFbqTmO9LntR4bQmRnzzcGyh0w5yMG8Zr8Li84Q3Fq0VWf/d2Q+TqItiI
	jzS5HE2bIeavjRLTAK8lCAiJvha4FEdE15sxN8eJPNrlsSAJ+L4gWYE/MwuxoCZcDiZPPQ7UE+r
	9fU2WseSpabUBjpWINaVj28pXUmejyoNsIVa+/SDU5KoEpVQXDCPJ5y//5CQP12DeF1rxf4s/LJ
	iUjxZXkzZ5U6Bl+ty0bVr6Tcc4AkT7CSgA0vv72fPCjYIK9ai5YavHQTkuUnOQzyNxvvGLlfitb
	lVl8JNiYjG7mM+X2G29elmsV4yX1SCISSk04UR77JoJHmgntxn64H4REmFheEVp2UEGUFSpCh3k
	pobHj7Fj/7G/Xzw8tT5gGeiNhy9crQcf9h0dug8A9/cC7f4bOpGeF5Q+x4d6TKimrXXKT7dauY0
	yNwh7Cvm5GuJOWH/Yo0H34H36Uvjd6v2zfWMOJoz/Yu
X-Received: by 2002:a05:600c:198f:b0:49f:bd3c:bc23 with SMTP id 5b1f17b1804b1-49fe6707f90mr223845395e9.30.1790588636040;
        Mon, 28 Sep 2026 02:43:56 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0019057cfsm169401315e9.11.2026.09.28.02.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:43:55 -0700 (PDT)
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
Subject: [PATCH v2 4/4] leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen 1
Date: Mon, 28 Sep 2026 10:42:37 +0100
Message-ID: <20260928094302.86966-5-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928094302.86966-1-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
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
index 1c0de38ebcdf..b9d167e25375 100644
--- a/drivers/leds/flash/leds-lm3643.c
+++ b/drivers/leds/flash/leds-lm3643.c
@@ -691,16 +691,21 @@ static int lm3643_register_led(struct device *dev, struct lm3643 *chip,
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
@@ -711,19 +716,46 @@ static const struct property_entry lm3643_ir_flood_props[] = {
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
 
@@ -734,7 +766,15 @@ static const struct dmi_system_id lm3643_dmi_leds[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X1 Carbon Gen 14"),
 		},
-		.driver_data = (void *)lm3643_ir_flood_nodes,
+		.driver_data = (void *)lm3643_x1c14_nodes,
+	},
+	{
+		/* Lenovo ThinkPad X9-15 Gen 1 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad X9-15 Gen 1"),
+		},
+		.driver_data = (void *)lm3643_x9_15_nodes,
 	},
 	{ }
 };
-- 
2.55.0

