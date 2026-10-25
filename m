Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953822;
	b=NO2QT4OtUhNAggts83ND2zms6HTf4VeGXgwzo1isvDmFWreSJv+aqySauaCb2YamIW1X
	 GlpyuqQAil9AZjizxm3EnSEhHSq5eyZehZs38mjBSk1fKANH+HOTStRrxHG57HELDA/0p
	 1M1UplYle0W8RQIySIETK5xVPDL8wUADvRa7p3Qca2Zzyh1b1b6ayIrpiJcroZ2uS4Dnq
	 pntP1wYYocaWiYtG89Ea/zvQRDIkOdZ0U3zw6l37Nl+xwQXH3d+hfRW27TBM3Bxl9JO4d
	 kZ5uxWaBre93tp+EJ4P/BE9exx1cdL26Otzb6TNK+p0MMwmAF4FODfmI9vJrnRL9/0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
	b=Ph3JH1D6rmgXNvQD5zRkIbH5xUI+/ZSKwhDdMbQJmm2/ihwo1NsQ1lbSpx6oL0Duhj2u
	 5STNQ06MFfbyeSV2D4SuE8wYcP9g0RFqF0Dm+NKtXoZwGm7NBrUsc75Y1rxr6K/dmyCn0
	 JIG9s4GGKidhDrcEbOATHrG7kxOxCfqKCZa/BwEwUMlGgMnfe2LeJM0IfvYv5DDSBXjoP
	 tLsuKHwif8gvKHPLf9jWRGDmhH2d0EOkLq1E2dZnYEll39e5CbctmVEgcUONSD8cnM9cc
	 qcQelU0uGqfT+7id/hscjY6f8vDdBAyZYMXkxPs7rcqa7Z0dEDfhOKEEyJmP/oAe/ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptIN5jwl;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B22606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B22606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ptIN5jwl
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4395d31228so345962666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792953819; x=1793558619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=ptIN5jwl8wfXt0ZjXqZ1Prbvvn+fmQOC78CtBSeMmBPCxxuiQrVrnrqkmBLdYv5d4e
         sWS/HkRXEnCYkb6n5plCIBH8Qj1qdiNR1AdaTa0l/NNgeSMkoB2QmovQ9kO77KXCNIIg
         j/3aUKZBJs7gRpkhgVZc/ULIYrtWPjNoMaxpHlqNmAg7d0+preG26bntItsea3TB0Hpb
         T91stOC7WuGNTZTfCQCNNZEQnFHVTFG/4sp+YXlB29d9NfO9mmusXHYaFNJhbbgx2TvQ
         E6no/uQzVee8PjhW4TLusR+Lp9yse8rsXOv164SlLom3sLtZW7XmP7MO/+LeBhaMcr18
         2u2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953819; x=1793558619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EA+TGwhOKTSjJMI/+IH2m8d0jmRxkGdSQ6LfUGiuKeY=;
        b=Y3+ktzMMtQW244RDsnnJ0lnP+d7Twm6pJRkC7OTc0qjT/IZlTyMc/TuARxK12ixQkY
         faflyX9bykOsyYXXnr/g/mAhRSDAkbqt/LRLRdF3OjLjQWTnNCjOlNL7dVE9cvfTmWOu
         hZscJY0EBIGAuJJg4LPOXvjYXxDQY6t2XoTFzyw8DsHWPAmO1EXs0pN1oatODyutLen3
         SEsyZcZtA0UrMGUS4KBRcED0gG0ZwW+EbIUrh5CgQV0ziVK3H/7o7f8TOcCya/8BuV1A
         2v22paRcFeNvND3gE3NzTlDlcldV/xCtVeZzscEPq11TPztlR7SeU6Ip/0278udy2sg1
         lIvw==
X-Forwarded-Encrypted: i=1; AKwUvByjJ79FuAfqR3coHtQjbVn5d4P4wWzu0AQElH51ka8XkYtDlmJaJwBRrAc4T/c5PT3d3lpekxjiwOafu4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK2emERE0gJSMzGiG8JQZRKG1CsA2EKZqMN7H2BYRBs0kD9CT5
	0XZ6t7iTjP1I2geLFN4y/5vchAYb1PHguIF2V3znoB5sfxKXNknS7ia4
X-Gm-Gg: AYBFou039dk2zLV0O4xcowgo2LZloL8nVlLG5oJw9dYNgZbavBiO6sYr7mDl3yF4DkJ
	coinpDaKHM7HJj6FytB8CVJ+1yGXaG2hRe46GqM1MWadI3f7MUU+xKPELwnIIYRo5coggsFJL5K
	eILOyxh+h3+PYa5NEJadnwz9hVVMiTvEsAjmjH5pJb4VAD1qPVbwNGoBbZ65qvhMiQD2Z0VjjPA
	+JGQSX/eeflFNgQweZvlqPE271IWx5NgQVzX9Sr2G9CRKiGtkXIJWWGj1jeYl4IOowRkfxgL2Vf
	iVC18ukvlVbIRXPaAJfDrcSobmwhQAoEXtzjt2xwr9VFDE8ndvy6QwlqwulFWuYiulzHekao2/3
	uKnMczca+uTwG7vLtWGmO556SMXsGBj7tK45FBTVpMf2O3+46XF9D2Frio6d88POo9qxdHge0ny
	FIaZV0TEhDNWxy+4cK6lgjoBJ55tvL/IM6PGh/ZOe0zVMdtbpvIU2FRaxC0hZ7sVOtW36cJ0Feb
	63GlAxMYq8n0nrhk2BvCL+6yhQ+QF5iaEAQaFI/isKdvOPk5hp+1HtQzFNkuUSkIpfWVllaS0Cr
	Od7Y50Sd989NVQn8/GrszybwOWQ8AxTykZ2AJoAS4J28hLneY0FR8RJ6mMI7OTD5nFerLVXfUeT
	uvI3NNO6eNUns1kEx3TLPz9YFMy0cAubCCK1ByuEclb1ZkA==
X-Received: by 2002:a17:907:944e:b0:c33:dbe8:291c with SMTP id a640c23a62f3a-c46bddf8079mr627054166b.20.1792953818947;
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa59sm225666866b.61.2026.10.25.11.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:43:38 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] pinctrl: nuvoton: fix fwnode_handle leaks in npcm7xx_gpio_of() and npcm8xx_gpio_fw()
Date: Sun, 25 Oct 2026 20:43:35 +0200
Message-ID: <20261025184335.447963-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Both npcm7xx_gpio_of() and npcm8xx_gpio_fw() iterate over GPIO bank
child nodes using for_each_gpiochip_node(dev, child), which holds a
reference on child during each iteration. Returning early on any of the
error paths inside the loop leaks the child fwnode_handle reference.

Additionally, both functions call fwnode_property_get_reference_args()
to parse the "gpio-ranges" property into args, which acquires a
reference on args.fwnode that is never released.

Use the __free(fwnode_handle) cleanup attribute for child so early
returns automatically drop the reference, and call
fwnode_handle_put(args.fwnode) after fwnode_property_get_reference_args()
succeeds.

Fixes: 3b588e43ee5c ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO driver")
Fixes: acf4884a5717 ("pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 4 +++-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 0df749cbc..47bb642cf 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2016-2018 Nuvoton Technology corporation.
 // Copyright (c) 2016, Dell Inc
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -1827,7 +1828,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 	int ret = -ENXIO;
 	struct device *dev = pctrl->dev;
 	struct fwnode_reference_args args;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int id = 0;
 
 	for_each_gpiochip_node(dev, child) {
@@ -1855,6 +1856,7 @@ static int npcm7xx_gpio_of(struct npcm7xx_pinctrl *pctrl)
 			dev_err(dev, "gpio-ranges fail for GPIO bank %u\n", id);
 			return ret;
 		}
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (!ret) {
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index a68d55cae..83e4e1511 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2020 Nuvoton Technology corporation.
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/generic.h>
@@ -2319,7 +2320,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 	struct gpio_generic_chip_config config;
 	struct fwnode_reference_args args;
 	struct device *dev = pctrl->dev;
-	struct fwnode_handle *child;
+	struct fwnode_handle *child __free(fwnode_handle) = NULL;
 	int ret = -ENXIO;
 	int id = 0, i;
 
@@ -2345,6 +2346,7 @@ static int npcm8xx_gpio_fw(struct npcm8xx_pinctrl *pctrl)
 		ret = fwnode_property_get_reference_args(child, "gpio-ranges", NULL, 3, 0, &args);
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "gpio-ranges fail for GPIO bank %u\n", id);
+		fwnode_handle_put(args.fwnode);
 
 		ret = fwnode_irq_get(child, 0);
 		if (ret < 0)
-- 
2.56.0

