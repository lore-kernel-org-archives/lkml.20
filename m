Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.98
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793347822;
	b=y4cBlGBZkoGc7YDJrXeIi92Zl/bxpuzpVt6l+6Wqx5etTjXJS8MdTa9Eg+cSv5nRG5hc
	 c8hF63LtFKlmDJH8+Wstv6eQHnkYFgUviQYctApTiM///wI1pSm2gPQOaMubVJ6ae/4d+
	 cjLZ9vJKs7sY7whd/xrbxzcjwRqz8EvKO/B9y5qqxkVhA0d5nkrB6dXtMLmbmu6QvgpqS
	 JjM/CpizieS3Qg8mDBeM3tMxBzjCpkZyv4V8mv7sNt9FvUI7K9VrkXAKasy2HZkiBM21D
	 eUGMNCIs4S7cY+Gh7+vSfG9+zSRZoqFReh5iej7+piR5eC+pMZrBS7O2c3hQRCyB8TQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347822;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ux95tyTzC0oNMdNCWdPf+kvSStdGRlNyoIjUyJ9FIGU=;
	b=5TQl73/urISY019sT3sJwZu8S2djCiU2os855w0BclrGogVRTFoeAcZix10mhJO8q/E1
	 BOt9MUKuxE2o3uV7MG9JwqHXHXb+ayhu+h2poQKzFlxp8aslvj8Z3d92hNH7AVV7tapPI
	 +Y+24oBfq1odcxZv6enpcBbLS9uYCfOUq9ngW0fFgLJwp4OESX7SwaOCIjhrG8byWWq/2
	 byfKU5dz68JuTSD68TgY0Yx45U+OHFqqbj8uV1HmfW2/eho29kqwd9Z2UJP5Ge2gcSH+V
	 129ngjMOmy3DjXEPA+jYpzThfAGsAkhD4/9xRrZbHIGudQFRRKju8ZYj5ZM84bSarxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bawoAt3G;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.98
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11023098.outbound.protection.outlook.com [40.93.201.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA273606A31E;
	Fri, 30 Oct 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA273606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=bawoAt3G
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWpH7/9U47X0kyycYyf1S8LU+W5uffN13gdqPgnqTnPV1bYsdIY83Wo6r06qmkMUVxPnG/mQk7+9FFkyB+H9G8Rr1wu1m8z0Yze09ZTK7gtIZ2JKOWiSAyMGayg615czXK0GxCCMO1EVQZF6TIUXzfFOLdrn+MdgeyrgMIfirgPJ3y+Oor2042tJUlNutFJS8JqD4UXbcY1svK5bDd5l3KQ05I/zvNASduM0qpYStK7VaYlPnrE7H8l6eXvwrHWM6Mpg0QWKjdTt9NRP9rIqMokX2m4mHb5Kc2r+9SApijhikGG2LK6JyBIBh1PIyCsHXvqLzACrxQZpxpbRFAQdng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ux95tyTzC0oNMdNCWdPf+kvSStdGRlNyoIjUyJ9FIGU=;
 b=PIaejhY4HmDmQruNj4XtaP0PVVnr1IJMH5NIDoNP0Y0ZpZ3Q4QVG6tVMke6R+sseGMc6EFRhJfEJlI1B8tbkVcptr32y84pTjy+oiTe8w1zHOw+YQV/figQ7b77o1FXCeOFa5zOpUGQVHp4oERFuS69ftz5NmlacEguXvisdbc/LGsEGFvtAan5eTnQE7VT+jr7AgkABSLwypPIKKefeoEDWegjbZELcj+Rg8Rg/cg+L6nTm8vVowctNoJWaLgvF5ZMKmbXF0aTbe+UqeCd7HN8NuD/AZO+nCL0D3yQVWJrZxTT0o5NmVs3s51n+AgaS4ZEwtPV2vH3rrB8NRllOhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ux95tyTzC0oNMdNCWdPf+kvSStdGRlNyoIjUyJ9FIGU=;
 b=bawoAt3GCi4Nj+QsUMUOfbK64TJGwzy3DA7xYlpjTmgUtdlYWJoxTBsfbfTK6C7Rdy7O1beKGxGZsoxat62oF/4XA6E76kAas7N0S6O4GvXWYgVjfPYsfdDvzI+ndsVhb3cxX/5OFI1NYOh93J7Aa3eOySIHJ6Sg+QdLg7joZaqwG68iEirhQDgy/Zb0yoqOwrvG+tBLW+A5+OscmB/zs97uNlsEXFop1vSoZIMUn5zYzC9XAO78o+i/moRf0W2rSW3lTmuDx2Wdu5S2oy1T6fVXpxb1pbOIosF0TUVHEUql0ds6KPvhA5thYnJkRHir7b+l0rrB5hCLPBYKfXhwgA==
Received: from CY5PR15CA0189.namprd15.prod.outlook.com (2603:10b6:930:82::7)
 by BY1PR18MB6112.namprd18.prod.outlook.com (2603:10b6:a03:4a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Fri, 30 Oct
 2026 08:10:17 +0000
Received: from CY6PEPF00000048.namprd03.prod.outlook.com
 (2603:10b6:930:82:cafe::3e) by CY5PR15CA0189.outlook.office365.com
 (2603:10b6:930:82::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Fri, 30
 Oct 2026 08:10:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CY6PEPF00000048.mail.protection.outlook.com (10.167.247.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Fri, 30 Oct 2026 08:10:16 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTP id B042140BFE10;
	Fri, 30 Oct 2026 01:10:15 -0700 (PDT)
From: Petar Stepanovic <pstepanovic@axiado.com>
Date: Fri, 30 Oct 2026 01:10:14 -0700
Subject: [PATCH v4 6/6] usb: gadget: udc: crg: Add core driver and build
 integration
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
Message-Id: <20261030-axiado-ax3000-usb-device-controller-v4-6-c5267b36a777@axiado.com>
References: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
In-Reply-To: <20261030-axiado-ax3000-usb-device-controller-v4-0-c5267b36a777@axiado.com>
To: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Petar Stepanovic <pstepanovic@axiado.com>, 
 Krutik Shah <krutikshah@axiado.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793347814; l=24313;
 i=pstepanovic@axiado.com; s=20250916; h=from:subject:message-id;
 bh=F84D7WmmFhAqpFZo+GQTMf9a/fngIm0VTsDBy7BrzmQ=;
 b=KAM7007QEAHevC80RW3Q0BCQv9/H494M09fssnG8ObjG/GVSo5lF2wmHf8xsrxwZIBGULNOyV
 X8Bzl4QjdI9DImUmiJTjtPSwl99o34d/4pSWq3F7FKUG4qZE0aSkxy/
X-Developer-Key: i=pstepanovic@axiado.com; a=ed25519;
 pk=70f1UJOGT9U11ZK6o+ENXtv0I5wBE3e+Y9YWODzRsdI=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000048:EE_|BY1PR18MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: d8136052-ce1e-4bc8-8595-08df365d3b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|1800799024|36860700016|23010399003|7416014|376014|82310400026|261028144727099003|261026140227099003|5023799004|56012099006|261022113327099003|261009223027099003|261022075727099003|261021121427099003|261022105027099003|10067099003|261021123027099003|261026121527099003|18002099003|3023799007|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Gvyk4V9QPrmVaLwLd38yhkEhdmUwhzM4pxPhXEioYuP8a0W6sJZwWdQhK7jejSDtvlUn+08/rJvqLFWf4ou+kh+SbIQHOmNQwndNMy1DCfew5OV8N+QEgaWQneRqSlqt3CN2zf1u2Gi5BjRHfTmqNfnXYsXsg2AZE+XFJApcCqsfUDOgYOPw7uMuL8CuJJTXO0ewbjuo8kmxjLro7Bfy0EwXjgQCk3loV5+qW+OOOB4pUbSzYvowmAa/ArXFyPwcOIb08AdraU+mKywS/5kjHC9gOIgSiGHr4rjZVi1ktSqxak4OiHqDNIVCB7eCdSzaMhl9vZ/xfXYTtZgzZhxV9JiFhvtojsVm9PoHu0xr5asgH5KVAXhhbJGmILIPul69lslorBrib6C+rsVIegH9jyOxX3pMUaNSnNkWuIRQ1Y0dpfWd3/ERypx/EbLBlsYXbwXHKZe4O90c3pXQSGc5n4TxzZt3ft2QRSAkPhAYW4ozLvNXRIbc930bKM42guRKnn309DDJaMgSPNfekeV9VDwuG42CYqAvuKCjQ2Cz2qIh0RsZhjOx3p4chMY5CcBU1NO8ZTT2x/hZeTZYx/kJjl1FD7o3g3Y93y32l9nckuobR9xoijN3+b7BIjFsrk2nD24YMIfZVuj6czHYRVCBpV/BzjNkNb4WAO/+N+dw6OwryRPIr2xFHxcT1yxK9mHeajsWzkLlSOxyGQN06s/FLg==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(1800799024)(36860700016)(23010399003)(7416014)(376014)(82310400026)(261028144727099003)(261026140227099003)(5023799004)(56012099006)(261022113327099003)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003)(10067099003)(261021123027099003)(261026121527099003)(18002099003)(3023799007)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2enPA3fIfA6vUuq7D3rijuFHk756rzwe//HGxsU1DlXaJOFMIqx6G3ur7VomTerDsoq40yZVjnJ0Vu9/5JcsCWlUeVmJJwigpZjq6wvjHHyZoynkI69W7W9jXGm7yvZ/odoeW2lzTyZr+4J0jPmuH3pLkYdRmDY+IN4FNyCIzPXjPvzSB94oJ5M1ZlIh6EP3N30qS3KNxCg0bwMLjGL6sS+pOjhzguWClsbnYYJHZx/PnVQ4ixg/kGC7lEoy9dvj9mfo0DIrG5e2bpVu0LriKMloIB2OJ2uHSJWQ/4E0ZqbRKPAUkXak2JgVblPvReoXt6zOHlXmUHnTHLhO7IH4q6dq9i4VMeZUKE8+tNBfgZ8dE7NBFElvfI6crRg9h49saoJi6uHZRBWVryCHczH+di88NZtModFpsiBQXPAvI2uk4Xch5d0BdPZGOY0g6h1r
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 08:10:16.6521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8136052-ce1e-4bc8-8595-08df365d3b7b
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY6PEPF00000048.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB6112

This patch introduces the core probe/remove functions for the Axiado
AX3000/AX3005 UDC driver, and wires up the directory into the build
system via Kconfig and Makefile.

Co-developed-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
Co-developed-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Krutik Shah <krutikshah@axiado.com>
Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
---
 drivers/usb/gadget/udc/Kconfig            |   2 +
 drivers/usb/gadget/udc/Makefile           |   1 +
 drivers/usb/gadget/udc/crg/Kconfig        |  16 +
 drivers/usb/gadget/udc/crg/Makefile       |   9 +
 drivers/usb/gadget/udc/crg/crg-udc-core.c | 723 ++++++++++++++++++++++++++++++
 5 files changed, 751 insertions(+)

diff --git a/drivers/usb/gadget/udc/Kconfig b/drivers/usb/gadget/udc/Kconfig
index 7ddbc2606686..72a5a8a04982 100644
--- a/drivers/usb/gadget/udc/Kconfig
+++ b/drivers/usb/gadget/udc/Kconfig
@@ -421,6 +421,8 @@ source "drivers/usb/gadget/udc/aspeed-vhub/Kconfig"
 
 source "drivers/usb/gadget/udc/cdns2/Kconfig"
 
+source "drivers/usb/gadget/udc/crg/Kconfig"
+
 #
 # LAST -- dummy/emulated controller
 #
diff --git a/drivers/usb/gadget/udc/Makefile b/drivers/usb/gadget/udc/Makefile
index 1b9b1a4f9c57..227d2a0b525b 100644
--- a/drivers/usb/gadget/udc/Makefile
+++ b/drivers/usb/gadget/udc/Makefile
@@ -38,3 +38,4 @@ obj-$(CONFIG_USB_ASPEED_UDC)	+= aspeed_udc.o
 obj-$(CONFIG_USB_BDC_UDC)	+= bdc/
 obj-$(CONFIG_USB_MAX3420_UDC)	+= max3420_udc.o
 obj-$(CONFIG_USB_CDNS2_UDC)	+= cdns2/
+obj-$(CONFIG_USB_CRG_UDC)	+= crg/
diff --git a/drivers/usb/gadget/udc/crg/Kconfig b/drivers/usb/gadget/udc/crg/Kconfig
new file mode 100644
index 000000000000..7167c4943389
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+config USB_CRG_UDC
+	tristate "Corigine / Axiado USB Device Controller"
+	depends on USB_GADGET
+	depends on HAS_DMA
+	depends on ARCH_AXIADO || COMPILE_TEST
+	help
+	  Say Y here to support the USB device controller found on Axiado AX3000
+	  and AX3005 SoCs, which is based on the Corigine USB 3.1 IP.
+
+	  This controller supports High-Speed and SuperSpeed.
+
+	  Say "y" to link the driver statically, or "m" to build a
+	  dynamically linked module called "crg-udc.ko".
+
+	  If unsure, say N.
diff --git a/drivers/usb/gadget/udc/crg/Makefile b/drivers/usb/gadget/udc/crg/Makefile
new file mode 100644
index 000000000000..96b209fb59fc
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# define_trace.h needs to know how to find our trace header
+CFLAGS_crg-udc-trace.o		:= -I$(src)
+
+obj-$(CONFIG_USB_CRG_UDC)	+= crg-udc.o
+
+crg-udc-y			:= crg-udc-core.o crg-udc-ring.o crg-udc-ep0.o crg-udc-gadget.o
+crg-udc-$(CONFIG_TRACING)	+= crg-udc-trace.o
diff --git a/drivers/usb/gadget/udc/crg/crg-udc-core.c b/drivers/usb/gadget/udc/crg/crg-udc-core.c
new file mode 100644
index 000000000000..33be5c920ebe
--- /dev/null
+++ b/drivers/usb/gadget/udc/crg/crg-udc-core.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Axiado AX3000/AX3005 USB Device Controller driver.
+ *
+ * Copyright (c) 2019 Corigine Inc.
+ * Copyright (c) 2021-2026 Axiado Corporation.
+ */
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm.h>
+#include <linux/property.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#include "crg-udc.h"
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc);
+static void crg_udc_phy_exit(void *data);
+
+static void crg_udc_gadget_release(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc;
+
+	crg_udc = container_of(dev, struct crg_gadget_dev, gadget.dev);
+	kfree(crg_udc);
+}
+
+/*
+ * command related ops
+ */
+int crg_udc_issue_command(struct crg_gadget_dev *crg_udc,
+			  enum crg_cmd_type type, u32 param0, u32 param1)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status;
+	u32 tmp;
+	bool running;
+
+	running = !!(readl(&uccr->control) & CRG_U3DC_CTRL_RUN);
+	/* Only INIT_EP0 may be staged while the controller is stopped. */
+	if (!running && type != CRG_CMD_INIT_EP0)
+		return -ESHUTDOWN;
+
+	/*
+	 * A staged command must complete before the command registers can
+	 * be reused. Hardware does not consume commands while RUN is clear.
+	 */
+	tmp = readl(&uccr->cmd_control);
+	if (tmp & CRG_U3DC_CMD_CTRL_ACTIVE) {
+		if (!running)
+			return -EBUSY;
+		if (readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+					      !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE),
+					      1, 10000))
+			return -ETIMEDOUT;
+	}
+	/* Ensure that everything is written before issuing new command */
+	dma_wmb();
+
+	writel(param0, &uccr->cmd_param0);
+	writel(param1, &uccr->cmd_param1);
+
+	tmp = CRG_U3DC_CMD_CTRL_ACTIVE |
+	      FIELD_PREP(CRG_U3DC_CMD_CTRL_TYPE_MASK, type);
+	writel(tmp, &uccr->cmd_control);
+
+	if (!running)
+		return 0;
+
+	if (readl_poll_timeout_atomic(&uccr->cmd_control, tmp,
+				      !(tmp & CRG_U3DC_CMD_CTRL_ACTIVE), 1,
+				      1000)) {
+		dev_dbg(crg_udc->dev, "command timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	status = FIELD_GET(CRG_U3DC_CMD_CTRL_STATUS_MASK, tmp);
+	if (status) {
+		dev_dbg(crg_udc->dev, "command failed with status %u\n",
+			status);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void crg_udc_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+void crg_udc_free_resources(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	if (crg_udc->irq >= 0) {
+		devm_free_irq(crg_udc->dev, crg_udc->irq, crg_udc);
+		crg_udc->irq = -1;
+		crg_udc->gadget.irq = 0;
+	}
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		struct crg_udc_event *udc_event = &crg_udc->udc_event[i];
+
+		if (udc_event->event_ring.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_event->event_ring.len,
+					  udc_event->event_ring.cpu_addr,
+					  udc_event->event_ring.dma_addr);
+			udc_event->event_ring.cpu_addr = NULL;
+			udc_event->event_ring.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->event_ring.len = 0;
+			udc_event->evt_dq_pt = NULL;
+		}
+		if (udc_event->erst.cpu_addr) {
+			dma_free_coherent(crg_udc->dev, udc_event->erst.len,
+					  udc_event->erst.cpu_addr,
+					  udc_event->erst.dma_addr);
+			udc_event->erst.cpu_addr = NULL;
+			udc_event->erst.dma_addr = DMA_MAPPING_ERROR;
+			udc_event->erst.len = 0;
+			udc_event->p_erst = NULL;
+		}
+	}
+
+	if (crg_udc->ep_cx.cpu_addr) {
+		dma_free_coherent(crg_udc->dev, crg_udc->ep_cx.len,
+				  crg_udc->ep_cx.cpu_addr,
+				  crg_udc->ep_cx.dma_addr);
+		crg_udc->ep_cx.cpu_addr = NULL;
+		crg_udc->ep_cx.dma_addr = DMA_MAPPING_ERROR;
+		crg_udc->ep_cx.len = 0;
+		crg_udc->p_epcx = NULL;
+	}
+
+	for (i = 0; i < CRG_NUM_EP_CX; i++) {
+		struct crg_udc_ep *udc_ep = &crg_udc->udc_ep[i];
+
+		if (udc_ep->tran_ring_info.cpu_addr) {
+			dma_free_coherent(crg_udc->dev,
+					  udc_ep->tran_ring_info.len,
+					  udc_ep->tran_ring_info.cpu_addr,
+					  udc_ep->tran_ring_info.dma_addr);
+			udc_ep->tran_ring_info.cpu_addr = NULL;
+			udc_ep->tran_ring_info.dma_addr = DMA_MAPPING_ERROR;
+			udc_ep->tran_ring_info.len = 0;
+			udc_ep->first_trb = NULL;
+			udc_ep->last_trb = NULL;
+			udc_ep->enq_pt = NULL;
+			udc_ep->deq_pt = NULL;
+		}
+	}
+
+	if (crg_udc->status_req) {
+		crg_udc_free_request(&crg_udc->udc_ep[0].usb_ep,
+				     &crg_udc->status_req->usb_req);
+		crg_udc->status_req = NULL;
+	}
+}
+
+static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
+{
+	struct device *dev = crg_udc->dev;
+	struct reset_control *rst;
+	int ret;
+
+	crg_udc->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(crg_udc->clk))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
+				     "failed to get clock\n");
+
+	ret = clk_prepare_enable(crg_udc->clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	ret = devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk);
+	if (ret)
+		return ret;
+
+	rst =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rst))
+		return dev_err_probe(dev, PTR_ERR(rst),
+				     "failed to get reset\n");
+
+	crg_udc->phy = devm_phy_optional_get(dev, NULL);
+	if (IS_ERR(crg_udc->phy))
+		return dev_err_probe(dev, PTR_ERR(crg_udc->phy),
+				     "failed to get phy\n");
+
+	ret = phy_init(crg_udc->phy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init phy\n");
+
+	ret = phy_power_on(crg_udc->phy);
+	if (ret) {
+		phy_exit(crg_udc->phy);
+		return dev_err_probe(dev, ret, "failed to power on phy\n");
+	}
+
+	return devm_add_action_or_reset(dev, crg_udc_phy_exit, crg_udc->phy);
+}
+
+static void crg_udc_phy_exit(void *data)
+{
+	struct phy *phy = data;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+}
+
+static int crg_udc_probe(struct platform_device *pdev)
+{
+	unsigned long flags = 0;
+	int ret;
+	int i;
+	struct crg_gadget_dev *crg_udc;
+	const struct crg_udc_priv *priv;
+
+	priv = device_get_match_data(&pdev->dev);
+	if (!priv)
+		return -ENODEV;
+
+	crg_udc = kzalloc_obj(*crg_udc, GFP_KERNEL);
+	if (!crg_udc)
+		return -ENOMEM;
+	usb_initialize_gadget(&pdev->dev, &crg_udc->gadget,
+			      crg_udc_gadget_release);
+
+	crg_udc->dev = &pdev->dev;
+	crg_udc->irq = -1;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+		if (ret) {
+			dev_err(&pdev->dev, "no usable DMA mask\n");
+			goto err_free_resources;
+		}
+	}
+
+	ret = crg_udc_init_hw(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->ep0_desc.bLength = USB_DT_ENDPOINT_SIZE;
+	crg_udc->ep0_desc.bDescriptorType = USB_DT_ENDPOINT;
+	crg_udc->ep0_desc.bEndpointAddress = 0;
+	crg_udc->ep0_desc.bmAttributes = USB_ENDPOINT_XFER_CONTROL;
+	crg_udc->ep0_desc.wMaxPacketSize = cpu_to_le16(64);
+
+	crg_udc->u12_forbidden = priv->quirks & CRG_QUIRK_DIS_U1U2_ENTRY;
+	crg_udc->u12_initiate_forbidden = priv->quirks &
+					  CRG_QUIRK_DIS_U1U2_INITIATION;
+	crg_udc->reinit_ep0_on_bus_reset = priv->quirks &
+					   CRG_QUIRK_REINIT_EP0_ON_RESET;
+
+	spin_lock_init(&crg_udc->udc_lock);
+	INIT_WORK(&crg_udc->udc_reset_work, crg_udc_reset_work);
+	platform_set_drvdata(pdev, crg_udc);
+
+	crg_udc->gadget.ops = &crg_gadget_ops;
+	crg_udc->gadget.ep0 = &crg_udc->udc_ep[0].usb_ep;
+	INIT_LIST_HEAD(&crg_udc->gadget.ep_list);
+	/*
+	 * The controller supports up to SuperSpeed. Honour the standard
+	 * "maximum-speed" property to cap it; default to the hardware
+	 * maximum when the property is absent.
+	 */
+	crg_udc->gadget.max_speed = usb_get_maximum_speed(&pdev->dev);
+	if (crg_udc->gadget.max_speed == USB_SPEED_UNKNOWN)
+		crg_udc->gadget.max_speed = USB_SPEED_SUPER;
+	crg_udc->max_speed = crg_udc->gadget.max_speed;
+	crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+	crg_udc->gadget.name = KBUILD_MODNAME;
+	crg_udc->gadget.sg_supported = true;
+	crg_udc->gadget.wakeup_capable = true;
+	crg_udc->connected = 0;
+	crg_udc->dev_addr = 0;
+
+	crg_udc->mmio_virt_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(crg_udc->mmio_virt_base)) {
+		ret = dev_err_probe(&pdev->dev,
+				    PTR_ERR(crg_udc->mmio_virt_base),
+				    "failed to map registers\n");
+		goto err_put_gadget;
+	}
+
+	/* set controller device role */
+	writel((readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) |
+		CRG_UDC_ROLE_DEVICE),
+	       crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		crg_udc->uicr[i] = crg_udc->mmio_virt_base + CRG_UICR_OFFSET +
+				   i * CRG_UICR_STRIDE;
+	}
+	crg_udc->uccr = crg_udc->mmio_virt_base + CRG_UCCR_OFFSET;
+
+	/* Initialize endpoint objects before reset, DMA setup or any IRQ. */
+	crg_udc_init_ep_info(crg_udc);
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	ret = crg_udc_reset(crg_udc, &flags);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc_clear_portpm(crg_udc);
+
+	ret = crg_udc_reset_data_struct(crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "crg_udc_reset_data_struct error\n");
+		goto err_free_resources;
+	}
+
+	ret = crg_udc_init_ep0(crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	crg_udc->udc_ep[0].desc = &crg_udc->ep0_desc;
+	/* Release the reset gate only after EP0 and all event rings exist. */
+	crg_udc->resetting = false;
+
+	ret = crg_gadget_irq_init(pdev, crg_udc);
+	if (ret)
+		goto err_free_resources;
+
+	ret = usb_add_gadget(&crg_udc->gadget);
+	if (ret)
+		goto err_free_resources;
+
+	return 0;
+
+err_free_resources:
+	crg_udc_free_resources(crg_udc);
+err_put_gadget:
+	usb_put_gadget(&crg_udc->gadget);
+	return ret;
+}
+
+static void crg_udc_remove(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	u32 tmp;
+
+	/*
+	 * The gadget core must notify/unbind the function driver before we
+	 * change the controller's visible state or disable VBUS detection.
+	 */
+	usb_del_gadget(&crg_udc->gadget);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+	crg_udc_free_resources(crg_udc);
+
+	/* set controller host role */
+	tmp = readl(crg_udc->mmio_virt_base + CRG_UDC_MODE_REG) & ~0x1;
+	writel(tmp, crg_udc->mmio_virt_base + CRG_UDC_MODE_REG);
+
+	platform_set_drvdata(pdev, NULL);
+	usb_put_gadget(&crg_udc->gadget);
+}
+
+static void crg_udc_shutdown(struct platform_device *pdev)
+{
+	struct crg_gadget_dev *crg_udc = platform_get_drvdata(pdev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	crg_udc->pullup_on = false;
+	crg_udc->resetting = true;
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc_set_pullup(crg_udc, false);
+	crg_udc_set_vbus_detect(crg_udc, false);
+	if (crg_udc->uccr) {
+		u32 val = readl(&crg_udc->uccr->control);
+
+		val &= ~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN);
+		writel(val, &crg_udc->uccr->control);
+	}
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	if (crg_udc->irq >= 0)
+		synchronize_irq(crg_udc->irq);
+	cancel_work_sync(&crg_udc->udc_reset_work);
+}
+
+static int crg_udc_suspend(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	/* Stop the pullup while the controller is suspended. */
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!crg_udc->resetting)
+		crg_udc_set_pullup(crg_udc, false);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+	return 0;
+}
+
+static int crg_udc_resume(struct device *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev_get_drvdata(dev);
+	unsigned long flags;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+	if (!crg_udc->resetting && crg_udc->gadget_driver && crg_udc->pullup_on)
+		crg_udc_set_pullup(crg_udc, true);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+
+	return 0;
+}
+
+/* Program the speed limit while the controller is stopped. */
+int crg_udc_program_speed(struct crg_gadget_dev *crg_udc)
+{
+	u32 cfg, speed;
+
+	switch (crg_udc->max_speed) {
+	case USB_SPEED_FULL:
+		speed = CRG_U3DC_CFG0_MAXSPEED_FS;
+		break;
+	case USB_SPEED_HIGH:
+		speed = CRG_U3DC_CFG0_MAXSPEED_HS;
+		break;
+	case USB_SPEED_SUPER:
+		speed = CRG_U3DC_CFG0_MAXSPEED_SS;
+		break;
+	case USB_SPEED_SUPER_PLUS:
+		speed = CRG_U3DC_CFG0_MAXSPEED_SSP;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	cfg = readl(&crg_udc->uccr->config0);
+	cfg &= ~CRG_U3DC_CFG0_MAXSPEED_MASK;
+	cfg |= FIELD_PREP(CRG_U3DC_CFG0_MAXSPEED_MASK, speed);
+	writel(cfg, &crg_udc->uccr->config0);
+
+	return 0;
+}
+
+int crg_udc_reset_data_struct(struct crg_gadget_dev *crg_udc)
+{
+	int i;
+	int ret;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 val;
+
+	crg_udc->ep0_state = EP0_STATE_IDLE;
+
+	val = readl(&uccr->control);
+	val &= (~(CRG_U3DC_CTRL_INT_EN | CRG_U3DC_CTRL_RUN));
+	writel(val, &uccr->control);
+
+	ret = crg_udc_program_speed(crg_udc);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CRG_RING_NUM; i++) {
+		ret = crg_udc_init_event_ring(crg_udc, i);
+		if (ret)
+			return ret;
+	}
+
+	ret = crg_udc_init_device_context(crg_udc);
+	if (ret)
+		return ret;
+
+	if (!crg_udc->status_req) {
+		struct usb_request *req;
+
+		req = crg_udc_alloc_request(&crg_udc->udc_ep[0].usb_ep,
+					    GFP_ATOMIC);
+		if (!req)
+			return -ENOMEM;
+
+		crg_udc->status_req =
+			container_of(req, struct crg_udc_request, usb_req);
+	}
+
+	/* other hw ops */
+	return 0;
+}
+
+static void crg_gadget_handle_interrupt(struct crg_gadget_dev *crg_udc)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	unsigned long flags = 0;
+	u32 tmp_status;
+	int ret;
+
+	spin_lock_irqsave(&crg_udc->udc_lock, flags);
+
+	tmp_status = readl(&uccr->status);
+
+	if (tmp_status & CRG_U3DC_STATUS_SYS_ERR) {
+		bool was_connected = crg_udc->connected;
+
+		dev_err(crg_udc->dev, "controller system error\n");
+		writel(CRG_U3DC_STATUS_SYS_ERR, &uccr->status);
+		/* Function drivers must see enabled endpoints on disconnect. */
+		if (was_connected)
+			crg_udc_notify_disconnect(crg_udc, &flags);
+		crg_udc->connected = 0;
+		ret = crg_udc_reset(crg_udc, &flags);
+		if (!ret)
+			ret = crg_udc_reset_data_struct(crg_udc);
+		if (!ret)
+			ret = crg_udc_init_ep0(crg_udc);
+		if (ret)
+			dev_err(crg_udc->dev,
+				"failed to recover from controller error: %d\n",
+				ret);
+		crg_udc->gadget.speed = USB_SPEED_UNKNOWN;
+		if (!ret)
+			crg_udc->resetting = false;
+		if (!ret && crg_udc->pullup_on)
+			crg_udc_set_pullup(crg_udc, true);
+
+		/*
+		 * tmp_status was captured before the reset above, which tore
+		 * down and rebuilt the event rings. It no longer reflects
+		 * the controller's current state, and if recovery failed the
+		 * rings may not be consistent at all. Skip the rest of this
+		 * interrupt's processing; any event still pending will raise
+		 * a fresh interrupt once the controller is running again.
+		 */
+		spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+		return;
+	}
+
+	if (tmp_status & CRG_U3DC_STATUS_EINT) {
+		int i;
+
+		writel(CRG_U3DC_STATUS_EINT, &uccr->status);
+
+		for (i = 0; i < CRG_RING_NUM; i++) {
+			ret = crg_udc_process_event_ring(crg_udc, i, &flags);
+			if (ret)
+				dev_err(crg_udc->dev,
+					"process event ring error: %d\n", ret);
+		}
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->portsc_on_reconnecting == 1 &&
+	    crg_udc_is_event_rings_empty(crg_udc)) {
+		crg_udc->portsc_on_reconnecting = 0;
+		crg_udc_handle_port_status(crg_udc, &flags);
+	}
+
+	if (crg_udc->device_state == USB_STATE_RECONNECTING &&
+	    crg_udc->connected == 1)
+		crg_udc_prepare_for_setup(crg_udc);
+
+	spin_unlock_irqrestore(&crg_udc->udc_lock, flags);
+}
+
+/*
+ * Primary handler only checks whether the shared interrupt belongs to the
+ * controller. All controller work, including reset polling, runs in the
+ * threaded handler and therefore never busy-waits in hard IRQ context.
+ */
+static irqreturn_t crg_udc_common_irq(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 status = readl(&uccr->status);
+
+	if (!(status & (CRG_U3DC_STATUS_EINT | CRG_U3DC_STATUS_SYS_ERR)))
+		return IRQ_NONE;
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t crg_udc_irq_thread(int irq, void *dev)
+{
+	struct crg_gadget_dev *crg_udc = dev;
+
+	crg_gadget_handle_interrupt(crg_udc);
+
+	return IRQ_HANDLED;
+}
+
+static int crg_gadget_irq_init(struct platform_device *pdev,
+			       struct crg_gadget_dev *crg_udc)
+{
+	int irq;
+	int ret;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	/*
+	 * IRQF_ONESHOT keeps this (level-triggered) line masked until
+	 * crg_udc_irq_thread() has cleared the status bits, which is the
+	 * correct pairing for IRQF_SHARED with a threaded handler.
+	 */
+	ret = devm_request_threaded_irq(&pdev->dev, irq, crg_udc_common_irq,
+					crg_udc_irq_thread,
+					IRQF_SHARED | IRQF_ONESHOT, "crg_udc",
+					crg_udc);
+	if (ret) {
+		dev_err(crg_udc->dev, "request of irq%d failed\n", irq);
+	} else {
+		crg_udc->irq = irq;
+		crg_udc->gadget.irq = irq;
+	}
+
+	return ret;
+}
+
+int crg_udc_reset(struct crg_gadget_dev *crg_udc, unsigned long *flags)
+{
+	struct crg_uccr __iomem *uccr = crg_udc->uccr;
+	u32 i, tmp;
+	struct crg_udc_ep *udc_ep_ptr;
+	u32 val;
+
+	/*
+	 * Keep all endpoint operations gated until the caller has recreated
+	 * the event rings, device context and EP0 after this reset.
+	 */
+	crg_udc->resetting = true;
+	val = readl(&uccr->control);
+	val |= CRG_U3DC_CTRL_SWRST;
+	writel(val, &uccr->control);
+	spin_unlock_irqrestore(&crg_udc->udc_lock, *flags);
+	/* Poll until SWRST clears; hardware reset takes up to 10 ms */
+	if (readl_poll_timeout_atomic(&uccr->control, tmp,
+			       !(tmp & CRG_U3DC_CTRL_SWRST), 10, 10000)) {
+		spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+		dev_err(crg_udc->dev, "reset error\n");
+		return -ETIMEDOUT;
+	}
+	spin_lock_irqsave(&crg_udc->udc_lock, *flags);
+
+	crg_udc_clear_portpm(crg_udc);
+
+	crg_udc->setup_status = WAIT_FOR_SETUP;
+	/* Base on Figure 9-1, default USB_STATE is attached */
+	crg_udc->device_state = USB_STATE_ATTACHED;
+	crg_udc->dev_addr = 0;
+
+	/*
+	 * Mark all endpoints unavailable before request callbacks drop the
+	 * lock. A callback must not enqueue on a later, not-yet-nuked EP.
+	 */
+	for (i = 2; i < CRG_NUM_EP_CX; i++) {
+		udc_ep_ptr = &crg_udc->udc_ep[i];
+		udc_ep_ptr->generation++;
+		udc_ep_ptr->desc = NULL;
+		udc_ep_ptr->comp_desc = NULL;
+		udc_ep_ptr->tran_ring_full = false;
+		udc_ep_ptr->ep_state = EP_STATE_DISABLED;
+		/*
+		 * This bypasses the generic usb_ep_disable() API, so the
+		 * framework's own usb_ep.enabled bookkeeping needs to be
+		 * cleared directly here too (crg_udc_reinit() already does
+		 * this for the live bus-reset case). Otherwise a later
+		 * usb_ep_enable() call for this endpoint short-circuits on
+		 * the stale "already enabled" flag without ever calling our
+		 * .enable callback, leaving desc/the ring never set up for
+		 * the new session.
+		 */
+		udc_ep_ptr->usb_ep.enabled = 0;
+	}
+	crg_udc->num_enabled_eps = 0;
+
+	udc_ep_ptr = &crg_udc->udc_ep[0];
+	udc_ep_ptr->generation++;
+	udc_ep_ptr->desc = NULL;
+	udc_ep_ptr->comp_desc = NULL;
+	udc_ep_ptr->ep_state = EP_STATE_DISABLED;
+
+	for (i = 2; i < CRG_NUM_EP_CX; i++)
+		crg_udc_ep_nuke(&crg_udc->udc_ep[i], -ESHUTDOWN);
+	crg_udc_ep_nuke(udc_ep_ptr, -ESHUTDOWN);
+
+	return 0;
+}
+
+static const struct crg_udc_priv crg_udc_data = {
+	.quirks = CRG_UDC_QUIRKS_DEFAULT,
+};
+
+static const struct of_device_id of_crg_udc_match[] = {
+	{ .compatible = "axiado,ax3000-udc", .data = &crg_udc_data },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_crg_udc_match);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(crg_udc_pm_ops, crg_udc_suspend,
+				crg_udc_resume);
+
+static struct platform_driver crg_udc_driver = {
+	.probe = crg_udc_probe,
+	.remove = crg_udc_remove,
+	.shutdown = crg_udc_shutdown,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = of_crg_udc_match,
+		.pm = pm_sleep_ptr(&crg_udc_pm_ops),
+	},
+};
+module_platform_driver(crg_udc_driver);
+
+MODULE_AUTHOR("Axiado Corporation");
+MODULE_DESCRIPTION("Axiado AX3000/AX3005 USB Device Controller");
+MODULE_LICENSE("GPL");

-- 
2.34.1

