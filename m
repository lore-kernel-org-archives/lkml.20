Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C3F2F7F17
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226328; cv=none; b=s4dvIwxmccP84OktTABT8nJLOYNu0BItaPKz6UvNg9pNXa5P23F2bm5QWjtOrC5deX10Z9Bh7pPXuqO9CbI3PlY32B3BGBEplJU1z+wczjwp0Yljo++qMq7Y+wx2FhbMNkkfGcQXy6JbM4OG8lAlNyPdoJmt0bUgqMhvVwB3n/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226328; c=relaxed/simple;
	bh=flqS3Tdcl2f7vRCpqn4/fTp9qVQToKkRqMn3O/v38Ds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k9o8I+S4QAj3B7o37Ok+1zH81a7aiEt+V98qoRpITn/XaBHyZoTlbPrvsucfxaEy1zlPIgVap/hOUK3YCAX2ZU/NvRBZ3IQzQQ/mwYemqNoHSBMQFgDdX/Z8KGGSQbg7foUoBX8x30VcNDckV21GTsKxpdh8tfZmN6jNpfOmKSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=diNxBfVY; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="diNxBfVY"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso1909661a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789226326; x=1789831126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EyM6kx8U+0XexgnM8KgW7ecLCZUT/Jw74RvMw1Slwo=;
        b=diNxBfVYpiH+I7LKkBKARfmeekpj48YsNAW25gSXjmCqjsDDACtYfVS8HbPIYHULxu
         dk86iiTNKxbGsJqHN1qOIfcB+kg0jUOg9f9vHz/Rv4r/vCG+y6q0IPkU7j6efR4D6M/l
         vjjRHg4cMkeTZbqHC/1QpIlMoOp9PJR/R6Kw8JjoSgfQdIOU9X0QWpi45z1+bfUFVP7H
         bRwI9OFMupL2cB9rGh22EmqQJnezHAM5jIubtdFXKUE4wcQKfL262Rgz1RfEHZl+rA/9
         HRCgxvzYmOddPCUyXgbCSV6Ns9P2+cVwpjR2/rrsLR5LrFpPPA4UJljflCcjVWuk+yui
         Ua3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226326; x=1789831126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3EyM6kx8U+0XexgnM8KgW7ecLCZUT/Jw74RvMw1Slwo=;
        b=VJIIko5Q+uKeWA2fGVGNo8kM28h99As9JaKVY/J5HBGG2g4ActnZoXodzCWwBXSd/1
         lFct0isfb1Ll0MUPNscxdxnFZ9WDIOdLRsjztdwJnF7pDqs9KtaIhREHxLfC7zbbXpzX
         oa56AxpP5hDi7GjaaqiZnffQqnSDfFCtWZnc50/e5XRYjhhwcYjEroKyrEScQIOgmiFO
         QIJev+QjpmabgF5dj0+TJyFTNdp49rLp7K0C7dzPqzuN+iiZ/kfmTSArqXY2twNePNy2
         uhSdLOiwLWHdkyY57G0NXmqbvoRUlHZJ3t+Nd5BA1blwjYwKEJo6PVzUxwrZeru3mR3/
         Frfg==
X-Forwarded-Encrypted: i=1; AKwUvByIvkXHjyBIEqfpQNUgnHZm4kJBxqxy7KWZQg4iMayFVURAzbK3T65YPJqR9KVC6fQOkAJ6xC3ULBJbv9g=@vger.kernel.org
X-Gm-Message-State: AFuF++mnu5z+s2/iZemDQ5ZwcIKR29C7ffzqX11cOyX8CoDDjJPoR1Hi
	J22evmG4nYUBDF90OQQc5INO7eBWkZ8R8w3CHnaHcAO54+Ui9VZUsE3rTVfiMg==
X-Gm-Gg: AYBFou2uureSighZOeI9RtGofBZhHgQdJyXBLU+9hpXTZXAzGDVcv+dr5cufcwZzs1J
	5Rck3pkQ5dQYTEcNuUIDdp8/zG3tw0z1526k4KVTUvgkFUZmgHwGK2GnWuuT6IPJuEoCUKW3pB/
	AKlYmqpHrzV8oc59S66Eop/kDt58ai07V33b5k9OaxqwRmLzh5VE6mGKGWq2aI8s6eJ3NhoawmI
	yLUwt33bSrxZJmsvU3I616jld270UP/9z5hgFNLPlCnOwHMRz0aJLwx4JUr1zdRym2rKMeSw2RF
	gNRt8/fKItItLY3dr2uKLberOVz4ywvTIUagJgG39V5M2cnC/1rI7eT5w0Mijl2JFE2x8l6LuTJ
	woPstpxP0swG/KQ6zCaSUH/5lod01r8efZ6QXLIDvMJUuj5iPJu114IaxV5p1cTYpVkIOGU32ic
	xaZb3zhr4Lpc0JdYLYEeYuiEInoNyb0Cv+B3WHWYgQFnMqxXbfyILC+6JbTXrcDTAryriXNGDEK
	g==
X-Received: by 2002:a17:90b:2641:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39d9c352a63mr15911734a91.22.1789226325707;
        Sat, 12 Sep 2026 08:18:45 -0700 (PDT)
Received: from [127.0.0.2] ([2404:c0:701d:4e35:f53f:aaab:9e63:54e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d1056sm10635924a91.7.2026.09.12.08.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:18:45 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
Date: Sat, 12 Sep 2026 22:18:11 +0700
Subject: [PATCH v2 1/2] power: supply: bq256xx: Expose VBUS state through
 extcon
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-riva-usb-v2-1-997fe0171ee5@gmail.com>
References: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
In-Reply-To: <20260912-riva-usb-v2-0-997fe0171ee5@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Reza Kurniawan <imkyufie@gmail.com>
X-Mailer: b4 0.15.2

Useful for USB controllers needing to sense VBUS state changes. This is
needed for devices like Xiaomi Redmi 5A (riva) that doesn't have its VBUS
session comparator wired directly to the USB connector pin to automatically
enable certain USB functions upon the presence of a USB power input.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 drivers/power/supply/Kconfig           |  1 +
 drivers/power/supply/bq256xx_charger.c | 96 +++++++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 8 deletions(-)

diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
index b89ef40df..ee7dc5f26 100644
--- a/drivers/power/supply/Kconfig
+++ b/drivers/power/supply/Kconfig
@@ -850,6 +850,7 @@ config CHARGER_BQ256XX
 	tristate "TI BQ256XX battery charger driver"
 	depends on I2C
 	depends on GPIOLIB || COMPILE_TEST
+	depends on EXTCON || !EXTCON
 	select REGMAP_I2C
 	help
 	  Say Y to enable support for the TI BQ256XX battery chargers. The
diff --git a/drivers/power/supply/bq256xx_charger.c b/drivers/power/supply/bq256xx_charger.c
index 4b1f81b1e..454bc497b 100644
--- a/drivers/power/supply/bq256xx_charger.c
+++ b/drivers/power/supply/bq256xx_charger.c
@@ -16,6 +16,7 @@
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
+#include <linux/extcon-provider.h>
 
 #define BQ256XX_MANUFACTURER "Texas Instruments"
 
@@ -209,6 +210,7 @@ enum bq256xx_id {
  * @client: i2c client structure
  * @regmap: register map structure
  * @dev: device structure
+ * @edev: extcon device registered to report vbus state changes
  * @charger: power supply registered for the charger
  * @battery: power supply registered for the battery
  * @lock: mutex lock structure
@@ -229,6 +231,7 @@ enum bq256xx_id {
 struct bq256xx_device {
 	struct i2c_client *client;
 	struct device *dev;
+	struct extcon_dev *edev;
 	struct power_supply *charger;
 	struct power_supply *battery;
 	struct mutex lock;
@@ -1164,8 +1167,14 @@ static int bq256xx_get_charger_property(struct power_supply *psy,
 	return ret;
 }
 
-static bool bq256xx_state_changed(struct bq256xx_device *bq,
-				  struct bq256xx_state *new_state)
+enum bq256xx_state_change {
+	CHANGED_NONE,
+	CHANGED_VBUS,
+	CHANGED_OTHER
+};
+
+static enum bq256xx_state_change bq256xx_state_changed(struct bq256xx_device *bq,
+						       struct bq256xx_state *new_state)
 {
 	struct bq256xx_state old_state;
 
@@ -1173,27 +1182,92 @@ static bool bq256xx_state_changed(struct bq256xx_device *bq,
 	old_state = bq->state;
 	mutex_unlock(&bq->lock);
 
-	return memcmp(&old_state, new_state, sizeof(struct bq256xx_state)) != 0;
+	if (new_state->online != old_state.online)
+		return CHANGED_VBUS;
+
+	if (memcmp(&old_state, new_state, sizeof(struct bq256xx_state)) != 0)
+		return CHANGED_OTHER;
+
+	return CHANGED_NONE;
+}
+
+static const unsigned int bq256xx_usb_extcon_cable[] = {
+	EXTCON_USB,
+	EXTCON_NONE,
+};
+
+static void bq256xx_extcon_update(struct bq256xx_device *bq, bool online)
+{
+	int ret;
+
+	if (!bq->edev)
+		return;
+
+	ret = extcon_set_state_sync(bq->edev, EXTCON_USB, online);
+	if (ret)
+		dev_err(bq->dev, "Failed to update extcon state: %d\n", ret);
+}
+
+static int bq256xx_extcon_init(struct bq256xx_device *bq)
+{
+	unsigned int charger_status_0;
+	int ret;
+
+	if (!IS_REACHABLE(CONFIG_EXTCON)) {
+		dev_dbg(bq->dev, "Extcon support is disabled\n");
+		return 0;
+	}
+
+	bq->edev = devm_extcon_dev_allocate(bq->dev, bq256xx_usb_extcon_cable);
+	if (IS_ERR(bq->edev)) {
+		dev_err(bq->dev, "Failed to allocate extcon device\n");
+		return PTR_ERR(bq->edev);
+	}
+
+	ret = devm_extcon_dev_register(bq->dev, bq->edev);
+	if (ret < 0) {
+		dev_err(bq->dev, "Failed to register extcon device\n");
+		return ret;
+	}
+
+	ret = regmap_read(bq->regmap, BQ256XX_CHARGER_STATUS_0,
+			  &charger_status_0);
+	if (ret) {
+		dev_err(bq->dev, "Failed to read charger status\n");
+		return ret;
+	}
+
+	bq256xx_extcon_update(bq, !!(charger_status_0 & BQ256XX_PG_STAT_MASK));
+
+	return 0;
 }
 
 static irqreturn_t bq256xx_irq_handler_thread(int irq, void *private)
 {
 	struct bq256xx_device *bq = private;
 	struct bq256xx_state state;
+	enum bq256xx_state_change changed;
 	int ret;
 
 	ret = bq256xx_get_state(bq, &state);
 	if (ret < 0)
 		goto irq_out;
 
-	if (!bq256xx_state_changed(bq, &state))
+	changed = bq256xx_state_changed(bq, &state);
+	switch (changed) {
+	case CHANGED_NONE:
 		goto irq_out;
 
-	mutex_lock(&bq->lock);
-	bq->state = state;
-	mutex_unlock(&bq->lock);
+	case CHANGED_VBUS:
+		bq256xx_extcon_update(bq, state.online);
+		fallthrough;
+	case CHANGED_OTHER:
+		mutex_lock(&bq->lock);
+		bq->state = state;
+		mutex_unlock(&bq->lock);
 
-	power_supply_changed(bq->charger);
+		power_supply_changed(bq->charger);
+	}
 
 irq_out:
 	return IRQ_HANDLED;
@@ -1743,6 +1817,12 @@ static int bq256xx_probe(struct i2c_client *client)
 	if (!IS_ERR_OR_NULL(bq->usb3_phy))
 		usb_register_notifier(bq->usb3_phy, &bq->usb_nb);
 
+	ret = bq256xx_extcon_init(bq);
+	if (ret) {
+		dev_err(dev, "Failed to register extcon device\n");
+		return ret;
+	}
+
 	if (client->irq) {
 		ret = devm_request_threaded_irq(dev, client->irq, NULL,
 						bq256xx_irq_handler_thread,

-- 
2.55.0

