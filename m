Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829537;
	b=nMUsbPXhwPp//OC8ohbIkCoh0yq2Gc02wXXWuJT67HixrBGWa62W6+Ah02ZOpPVF1oE3
	 4xDe7t5VhXbpyvfqEPOQliAqeunpaGLbq/tBdK1gzuP8LmTfdg7X84m//pjLPoipdh6gU
	 dedLqa1niSBm4o1vEwUq8+4NEFlyKHeZTQHyxPx+RkepIzyFWWeNeHADRuBLm8DHb+m+N
	 2L2N3yzuZOid0CizyJ67A8BI6/ouKSWJXpLEx4B194DCOPAW7cMJb/ZTE7BhIlqEm7fzg
	 2dTQETGN/7scgdKfc1l0z2qMvuQ/lG8lEtSZjyGfeSERISsuS1eY3mM7NTYkTm9KB6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
	b=wJz+mhcPEekwBUI9aIn5oVVtjYLOX3qzd9dAdGe0g4scGaeXaPfdv5Hz5Lp3EWwOrAtc
	 DEg3wgSfR65DEGztfHIj29ijx4b75PbUU26f1KoB7denIrT/YZGAnK1aygsC4jHMuQYYq
	 bodxvw8JGTdDlocqqJanVLeHuaqiTiqEkJLxfCH3LWcIserxGNWOx5NIMFkXf9pwvEjou
	 A/WfTTmCAs72JWL6VPrfnmOE7F5sma/FnX+EBP23wCh9dcHhk6iLQhxyAr32xdAIQmkuW
	 zpGIIWtz1C9AFnLfuQC8vrq6LGzbJaDD1B3avDwTWHaEoAsateySIxhLyT2fL/NxLBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX6QCTb+;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10C16074FBC
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E10C16074FBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FX6QCTb+
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so7665335e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829535; x=1794434335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=FX6QCTb+7hQ7a49k2he+cXjZ+2kMQvzj3kmIs1IniS/nLeDTKVLHUpzkD1SsnHFDaq
         piKWHM6u4NhFFeoMQbWWGdYBKECHcIxDTbdQvL7W396dkj3SMzJkv/bsjHHi0l0EODUf
         QSuee+c+9eI596+lJ4l5R560zoZcph8gZe3wXDHdNLjNBDyr4MkFF3X9QejxJmmfJ78m
         VfQh+MXRA6rqfLdIM8RGR/Hh1DYtoqlmjwVs+beuGrN2r3nUcX0gEXCy/uF6KNSg45/s
         NP7K7fXkxDm9n7loE1MmknICig4qnZZ0BPAw+pt15CtvItWWKolSimPXLlQnOjHn3JKE
         ZySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829535; x=1794434335;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4G69hUeaYVdLPSM1kzRF/+eQpXIfqCXeSZLLSkxOSAI=;
        b=sJTMNTmkQSAZF5uaXefuc3J1dny/BNgSMbF9hg9/F+5U7VLtcxfrgP5Vov6WbQGuSd
         AytrEsJXaXIdCora1RdsljVQARlfXa26Wf6diWcj/jQ1v57setmsaOdQTKiTxDF/wwlB
         +xRjd7cqahtV7Xl1WwL2o+TjHRbwiDciweVRDuZpJkifwnaDbXm+UoqjM8iEuOeb7ezC
         dsqkq4zXWnQPGMc4eukWziLg3Hds+8bpC2SCj1zNBrApoFzbfjtco0JH/eenYmjV0hVr
         REds5/wFAOjuI6t3Fe6KbxfiJM8YCTb+IlyxUUyZ6rKwb14mnZBhz2d3/MAQc8YR4Q1Y
         1lEg==
X-Forwarded-Encrypted: i=1; AKwUvByuF/iWXXAlAoKj09XrJD4BeajcjAOrcqGurcel5gZpLwtGKrenRxAgTkvXfINhMg9uoOg3SqSgQSaFuzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z820yjzBW1Rb603XgxHv3uMI0w3ntbsGYAQBTg+9idEILS4lucJ
	39ns34zHZB16j0Mz/ItRNdvKcp6+vHAc9f/Lo/taAdn03KYT/4z+Rxea
X-Gm-Gg: AYBFou21A8a72MeKGbCWAaxMbcjHStDPuzyCp0zklmQ7Fd94xEHmLAH2TponaPVc2cM
	r33z6D7Pz9VNtAsO/C3JrHIbJaZxnj8EVBNBU8uBvdBxwWRlSijo/w1jcF/D+s4uBTtZ8vINAnV
	8db1v7l4eeuTpIKw88x+zvdZrs4+Skjbysme35D6K9T/wIgQTejPcxqRX0e1ecsxSepIDMPWHfO
	dgpQtoVYJkZEKQmaPqLExlR3CkFEFeIJP0gPHMU1x82VtoglhmawoQBcn+3cbpgo/XmNn8ZYIKF
	bbio2jRA5D/NYcJx5lNWL4z0cCub96wMg5EREx4iEdWmmxJTs/ESgjRMfx4ACTRf1sOXEyvuZ1p
	i2c5WfEN0gGYqks81EtanqTFJ0CQ3D9Xse4R/RB/uVoPRnXF4q0DjV4Gmrq1HEbWHjiNy2Qer3J
	ayAfLBCKXX5wtg+Xlg1UB4rzgntjd3sTTW/aKuUwAkCZEbWHbtsKjNbNf170IXyTMlOL0vYuBDP
	VGrVFtI+kofhiWYuP9QtbVcHpfGb5E+RpH+Olf0GgkjeEjbDAbZXwk0lIwd2hyF5H1Y2SBcUjV2
	UYrQ4C3LE2FZdg+9+DpTxG+nyhQjfmI4PtLfJfkUeEqZmr5Ud35vxnecVl+o8r3Tlciy/oXp0WD
	F4t5fKHciei/0zqHtKSDJ+LD9yElRp3KBLFNHQDvUD1PKZ6UG9053KBotuJM3GonsJBI=
X-Received: by 2002:a05:600c:8b04:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4ac17a3683bmr393088445e9.18.1793829535234;
        Wed, 04 Nov 2026 13:58:55 -0800 (PST)
Received: from tachyon.internal (2.155.41.158.dyn.user.ono.com. [2.155.41.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e65b0sm15526735e9.11.2026.11.04.13.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:58:54 -0800 (PST)
From: =?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
To: shawn.lin@rock-chips.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	dlemoal@kernel.org,
	iav@iav.lv,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Enrique=20Hern=C3=A1ndez=20Bello?= <ehbello@gmail.com>
Subject: [PATCH v5 2/2] PCI: rockchip-host: Make the PERST# inactive delay configurable
Date: Wed,  4 Nov 2026 21:58:47 +0000
Message-ID: <20261104215848.2087944-3-ehbello@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215848.2087944-1-ehbello@gmail.com>
References: <20261104215848.2087944-1-ehbello@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

rockchip_pcie_host_init_port() waits T_PVPERL, 100 ms, before releasing
PERST#. The GPIO is acquired with GPIOD_OUT_LOW early in probe, so PERST#
is already asserted when that wait starts, and the wait therefore sets the
reset pulse width as well.

That suits a board which powers the slot at the moment it asserts PERST#,
but endpoints do not agree on what they want. On a ROCK Pi 4C carrying a
JMB585 SATA controller, a pulse that long stops the endpoint answering
configuration reads at all. Measured on that board with a single kernel and
two module parameters, one sleeping before the GPIO is acquired and one in
place of the wait, timing the pulse with a ktime delta across the two
gpiod_set_value() calls:

  pre (ms)  post (ms)  pulse      trials  enumerated
  0         0          1-11 ms    5       5
  0         10         ~18 ms     3       3
  0         15         24-47 ms   4       4
  0         20         ~28 ms     3       1
  0         100        ~108 ms    4       0
  200       0          6-11 ms    5       5
  200       100        ~108 ms    1       0

Delaying the assertion changes nothing, while widening the pulse decides
everything. The slot supply on this board is regulator-always-on, so power
had been valid for seconds in every row above, the failing ones included.

Rather than change the delay for every board, read it from the device tree,
reusing the property names the Rockchip vendor driver already carries for
the dwc-based controllers in pcie-dw-rockchip.c. The default is unchanged,
so a board that describes nothing behaves exactly as before. Whatever the
board asks for, PERST# stays asserted for at least the 100 us minimum the
specification sets, which covers T_PERST and T_PERST-CLK.

Suggested-by: Shawn Lin <shawn.lin@rock-chips.com>
Link: https://lore.kernel.org/all/95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com/
Signed-off-by: Enrique Hernández Bello <ehbello@gmail.com>
---
 drivers/pci/controller/pcie-rockchip-host.c | 26 +++++++++++++++++----
 drivers/pci/controller/pcie-rockchip.h      |  2 ++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index 5b071bd..5f78cd6 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -24,6 +24,7 @@
 #include <linux/of_pci.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include "../pci.h"
@@ -280,8 +281,10 @@ static void rockchip_pcie_set_power_limit(struct rockchip_pcie *rockchip)
 /**
  * rockchip_pcie_host_init_port - Initialize hardware
  * @rockchip: PCIe port information
+ * @perst_inactive_ms: how long to hold PERST# asserted before releasing it
  */
-static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
+static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip,
+					u32 perst_inactive_ms)
 {
 	struct device *dev = rockchip->dev;
 	int err, i = MAX_LANE_NUM;
@@ -315,7 +318,12 @@ static int rockchip_pcie_host_init_port(struct rockchip_pcie *rockchip)
 	rockchip_pcie_write(rockchip, PCIE_CLIENT_LINK_TRAIN_ENABLE,
 			    PCIE_CLIENT_CONFIG);
 
-	msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * PERST# has been asserted since the GPIO was acquired, so this wait
+	 * is also the reset pulse width. Never go below the specification
+	 * minimum, which covers both T_PERST and T_PERST-CLK, each 100 us.
+	 */
+	fsleep(max(perst_inactive_ms * USEC_PER_MSEC, PCIE_T_PERST_CLK_US));
 	gpiod_set_value_cansleep(rockchip->perst_gpio, 1);
 
 	msleep(PCIE_RESET_CONFIG_WAIT_MS);
@@ -587,6 +595,14 @@ static int rockchip_pcie_parse_host_dt(struct rockchip_pcie *rockchip)
 	if (IS_ERR(rockchip->vpcie0v9))
 		return PTR_ERR(rockchip->vpcie0v9);
 
+	if (device_property_read_u32(dev, "rockchip,perst-inactive-ms",
+				     &rockchip->perst_inactive_ms))
+		rockchip->perst_inactive_ms = PCIE_T_PVPERL_MS;
+
+	if (device_property_read_u32(dev, "rockchip,s2r-perst-inactive-ms",
+				     &rockchip->s2r_perst_inactive_ms))
+		rockchip->s2r_perst_inactive_ms = rockchip->perst_inactive_ms;
+
 	return 0;
 }
 
@@ -881,7 +897,8 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
 	if (err)
 		goto err_disable_0v9;
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->s2r_perst_inactive_ms);
 	if (err)
 		goto err_pcie_resume;
 
@@ -938,7 +955,8 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
 		goto err_set_vpcie;
 	}
 
-	err = rockchip_pcie_host_init_port(rockchip);
+	err = rockchip_pcie_host_init_port(rockchip,
+					   rockchip->perst_inactive_ms);
 	if (err)
 		goto err_vpcie;
 
diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index b5da156..c773f74 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -315,6 +315,8 @@ struct rockchip_pcie {
 	struct	regulator *vpcie1v8; /* 1.8V power supply */
 	struct	regulator *vpcie0v9; /* 0.9V power supply */
 	struct	gpio_desc *perst_gpio;
+	u32	perst_inactive_ms;
+	u32	s2r_perst_inactive_ms;
 	u32	lanes;
 	u8      lanes_map;
 	int	link_gen;
-- 
2.56.0

