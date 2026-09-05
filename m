Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D3643B6F6;
	Sat,  5 Sep 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788604182; cv=fail; b=TPNw2yVqGXGBobzZA4+GQ51ZcMWYcSMQ+Svf1hCfKQf6zn2NzNacbk7FWV+PdnQ9brWhrCEAc0tMLh7LhNokA/LkNUX8ukSIcopvmpnzG7LesuvJGix+jP1TRct8E//tEVoqmACNzJuhd1Y5HPULcMgmUVZDzwKoSQ46kiNYDqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788604182; c=relaxed/simple;
	bh=k2N48tY9Pyqtw70msawQQC8OPVyNjWtmftW0/Ows/4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQ2nHOVK1A8YEj33pe+sy4jT3SUBngcKtfKLKHXvtUq9dyotiU8IoCVgtu/BK33v4ci6z1jqvpDKcVLIND01ACELvByLusyb7yPJe0SROeGhjvFBp6Z7+8L9WyNfKvvsCUNkPfFWat0WjjzEfBY5fOP7nXgPS0UsDju1/sFpb5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRe8ZloR6oGmN9okOUlRoobM9cYKhtptR5qNgBD+AhHCc6sfJiMsEv0ykD+F79hNlFPMD77VAxUL6LzKCVJPlgSIbJr6JuNsmhHVEpgkxn/Dbms3qVOIjdsCbc7HJso9cioTwd/m49wvLLvvVoQBtjwzHcsaovsrn19E3ydesEFUxTsof4IEXAsdr6QONpW8x4Bpl6y0mwkvyMDFx0cgUje+2dVnI3Vpl+Bx5V7YTyOw0+GBG1oQwvHnLP0qgfjz2YN0RcPQXkA1fkOyoHmn4MMp/JieOM6TSSieXD/C0kXCU1cwtB0kxB6F0xLL7VkV93lsJ318exIMWe6RSq1Huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZjYJfrtvZKK6u8L6yGJXcI+XFuM+P7zJ5hBnSezdKw=;
 b=mgwFhT5j/0nJabTtmUiNrCIBDjNS+zNr35/Hp10XR/hm25FtHuBBzr+NLMfJHAzQuh2jtC96+H0YR+xeXAyQmYb2jJym8ZEQWhWmbPiZBe+qwk1z6U1uGbwz4lnWcyvI4LQKzw96PRDTZqBhaJThN93cucJ9gLX892eC+Nya4YBWhQH+vGVrgOw5Y3MqaXMKH5Hx0QkznWAUTbrn78r/8h1XQ9dCv/cwcm3x9w/hl5qhIsbzJoPqSOdV/oHmQxjKYvgkZTanWjlblE8nvdQTLy0KbrXD6SB3xuHvVRWQS+HVj9DFL6Q9kSUrxuDee8v/iJLODUT7aYjhw2FR+QvbJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1329.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sat, 5 Sep
 2026 10:29:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 5 Sep 2026 10:29:20 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
	Oskar Senft <osk@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Vitaly Lubart <lubvital@gmail.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Breno Leitao <leitao@debian.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	James Morse <james.morse@arm.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Dave Penkler <dpenkler@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dan Williams <djbw@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Julian Braha <julianbraha@gmail.com>,
	Karthikeyan KS <karthiproffesional@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH v2 2/4] soc: aspeed: Move UART routing driver to drivers/uart-routing
Date: Sat,  5 Sep 2026 03:28:59 -0700
Message-Id: <20260905102901.126035-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
References: <20260905102901.126035-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0032.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1329:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed56b88-aff5-4f75-da55-08df0b388bed
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|23010399003|38350700014|10067099003|6133799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9NcxRXnsu5OPgNS/38/kfT/AzalhVzdos+tJWfd5wxhkexPvxT1wCWI8vnFXEBdtxV58B35DHAvJBMSk0q4kDcCCUbv8SE3aty9JVi7TCxnVjcuUup1goi680SQoB05rMqs6k9tIexU77Cxhi0eM1JmqDZLT2TuOPsrLPYbGIAnmRTu9AzwnLfZHqql0MxkwLGvCCK6CObk90QPDIihyyDb05+IJ7i87dKKxHaU+tRGXcKu0ZaiJBYpGVFlZhYhGpTxQGmHtMi/NK5zMIH6j5zjzrmdZL07bHyWy/IgPM/qDonGl5pP1MVcXiL3tLeHk4ZY8WMOwpQCBgCWspGrwloQgdxYaVLwbBRDn071ynGZqCt8xmkRKNRjpPLIJRsN4uLVWV6+Xad3/kp0P5IhTBW9y6/vZfy9v7ePlzSq8ZR+dFDdauZfWEesmdT73/V5kRHGT16XrMXk7PuriyAIAh4snIxloYVyeJlgPydW4u+VqyZ+yla+qXbyCwsa4E0rmmHKayXwYrgNfvLc3vVBmpP6YhvZOuIpT304YAqi7hcycTLIAwMnpA1vSvGhVRBIG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(23010399003)(38350700014)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WbxliXCRFEUhKDyjB9m0Iqx1IRRh9FkG+HVPDt0DXgIPU6bAOW1nYC6VAkhd?=
 =?us-ascii?Q?7KCOxfC5jMsA9ucz4XAT5RLH3ZL3nTM3iC/PvtuywX3fNfwoHmv0MNsNhAwI?=
 =?us-ascii?Q?J/L/DC88VktjX+gwFZysj3cbxByIVBfp/KBSJRlBFwfiwRItlNXWyz146nQ5?=
 =?us-ascii?Q?+/mFW5GR17TOHBGD26GNbLcL982aGPXkKKL++xtiZJiWVpGrbAGABIcwEUG2?=
 =?us-ascii?Q?mzKAw+8inn81U6H4XDtsI1pyQl77DusfAD67CLGr/E5P4wpJFmYY5WHkOc7q?=
 =?us-ascii?Q?+PD/UPCmdcTVM5pXKQTbwFmh7Tebm+klCY1+B7R+j9bkMJKFBY1NaEVvwsZZ?=
 =?us-ascii?Q?tMsLkeS2Yxn7vP9vHYKA0r6btgEwyGagocHJpOiZ4QpTmHKiy5mN25i3XeaW?=
 =?us-ascii?Q?Z9vKBjSmRzvXFZcoRHML3gMi5aarUGnqFPmP4cagr3Vaz4lzAoZS262q2xFM?=
 =?us-ascii?Q?NkmjbCcAsjwcJ/aH2IT/JDToHd5sXYRpXH+VpmST45xRI0bfxVQnEno1ppuZ?=
 =?us-ascii?Q?jpR6zXgNbDE9WlRMYTFCIS/CV2Gw1uiqik5vGg/c+FBn5wVwPxxbv8wTd5Um?=
 =?us-ascii?Q?83bHt9mktsTd6ByWvuKMVr0Ga6c1BwtRSHkCoeZQvwmh7QH2iwsA8fi0RBj6?=
 =?us-ascii?Q?qvTrXSc4Kv1AM+xbuxtlJa2MWB2bQO1XCZz5m+JYyOM+UJVhSEitlJf9qG5B?=
 =?us-ascii?Q?on1hNq+oarvMM5j+TlcHr5y3DL8ZcP5JaHrf2RFr9tjEjA4O/DxGA3vsY7GF?=
 =?us-ascii?Q?4f9kR8gkR9/pEIBUUwKv548m1dwqSk5Kyq7cgp47gxlc+8nuQraOD4q7rr9N?=
 =?us-ascii?Q?tBxqa5jNG7Nrj4GWHkoukXDPsgTkzglHmeYcW3WBdwi1d8gOv5NCEqVpbvv1?=
 =?us-ascii?Q?BdPDVwwuL7WQceD9A2+XU+zvHBXF/7wfA0eoyhrPHSiCGT3uWt9hwcDLxwVm?=
 =?us-ascii?Q?zyfhMF1RwOFGXbv+Clqf1NuGhhQPRzBwKvZxkbBe/L3SVUTne9e8yxHjp9Vg?=
 =?us-ascii?Q?XxS03g5+2fz6GN/zu/l7qFIKXk6OjM3r7pSddz5EqSD/hJV9IPhWLv89B2TY?=
 =?us-ascii?Q?H2El+PCmjDE1yctAV3rqfldT41lzX4Qk/bcvwa5xhqiZn/bhYz7lziRlgU1b?=
 =?us-ascii?Q?jfb/VtTsN0QZ7mXdbvSV+Ni1fIYOfd/AFNY6UUElIIUsxlCUC3GM8QftYKqu?=
 =?us-ascii?Q?AIgsktaAvkYoxRmP9WFxmS5gpFJe5GpS7XVgQemgq9ckESu58W4HJCMqwxuN?=
 =?us-ascii?Q?sNsOS3d+5Oig/KAJeX+GlmFVwnVyXjiYCWcwH2pHdLOnP6nHCNhD/xm2FZmq?=
 =?us-ascii?Q?zqPUP+pD+PptvUvdQq39m+51JYKs3Gm3Mx+R2d5BiHTT/fLW5XrEGFZauQEq?=
 =?us-ascii?Q?KcnmObLGo7MbRD0W89STgK2BwSdyIG4NVeIVz2fwGSyHO5gXT0/eD3QahAq4?=
 =?us-ascii?Q?/G6anJMZHRtz7VnXI66FsGRHoeo/2PRDnh+gtYU2SwU5YysOpUyJRLR8+FXE?=
 =?us-ascii?Q?Nt/MR1bc4TKZm0EGH12fM83IZ05GGfV/5abN16BIgFdPF9PC0rDajE/Reol8?=
 =?us-ascii?Q?fi8FLoW/NSs/2+2L/xTo66OdMNQXh/UFhchwyG+xl17UlTh7I9284yOJY0OO?=
 =?us-ascii?Q?8Ix1ILOz1CRPOB7x7VKZvnyZhv9wWuv7klcGGxA01LlTd4VnAurjhAyUBd1f?=
 =?us-ascii?Q?v7HlqvzOXHOYR4CyfeYydRAgoOOtjw04F9IBsrmwQJug7enOHL2ryJ7Cczk4?=
 =?us-ascii?Q?XMngPUFe4wXU9b5T+MitPO+/4/aPGsnXXuSDK9l+0K3wG/KDqIdH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed56b88-aff5-4f75-da55-08df0b388bed
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 10:29:20.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06Uy3y0kQVDXGEX3E68ckBZxHsMk+6XoaTwmNN0CYd9nHBVyPeLVgCwgVqj1kRY/ErSQb67w8Gy51uf5uBoXy3ZBrfnfjPpCwlTTee3SNvp4qNxtON4V/xYiDC3Lcf/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1329

The Aspeed UART routing driver is not really a SoC driver: it only
exposes a serial crossbar through sysfs, and the same hardware block
exists on SoCs from other vendors. Move it to drivers/uart-routing/ and
convert it to the common framework living there.

The register layout description, that is the list of selectors with
their register offset, bit position, field mask and routing targets, is
kept as it is; only the surrounding sysfs plumbing is dropped in favour
of the framework. The per selector option lists become separate arrays
because the framework refers to them by pointer instead of embedding
them in the selector.

The Kconfig symbol and the platform driver name are unchanged, so the
sysfs paths documented in
Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing stay valid
and existing configurations keep working.

Also update MAINTAINERS to add entries for aspeed-uart-routing.c
based on the file authors, as the file currently lacks maintainers.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                |  10 +
 drivers/soc/aspeed/Kconfig                 |  10 -
 drivers/soc/aspeed/Makefile                |   1 -
 drivers/soc/aspeed/aspeed-uart-routing.c   | 601 ---------------------
 drivers/uart-routing/Kconfig               |  15 +
 drivers/uart-routing/Makefile              |   2 +
 drivers/uart-routing/aspeed-uart-routing.c | 415 ++++++++++++++
 7 files changed, 442 insertions(+), 612 deletions(-)
 delete mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
 create mode 100644 drivers/uart-routing/aspeed-uart-routing.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b7fa722755c6..ad6706c18f37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4109,6 +4109,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
 F:	drivers/pci/controller/pcie-aspeed.c
 
+ASPEED UART ROUTING DRIVER
+M:	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
+M:	Oskar Senft <osk@google.com>
+L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
+L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
+F:	Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
+F:	drivers/uart-routing/aspeed-uart-routing.c
+
 ASUS EC HARDWARE MONITOR DRIVER
 M:	Eugene Shalygin <eugene.shalygin@gmail.com>
 L:	linux-hwmon@vger.kernel.org
diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index 63a656449a1a..e27623a94fd2 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -24,16 +24,6 @@ config ASPEED_LPC_SNOOP
 	  allows the BMC to listen on and save the data written by
 	  the host to an arbitrary LPC I/O port.
 
-config ASPEED_UART_ROUTING
-	tristate "ASPEED uart routing control"
-	select REGMAP
-	select MFD_SYSCON
-	default ARCH_ASPEED
-	help
-	  Provides a driver to control the UART routing paths, allowing
-	  users to perform runtime configuration of the RX muxes among
-	  the UART controllers and I/O pins.
-
 config ASPEED_P2A_CTRL
 	tristate "ASPEED P2A (VGA MMIO to BMC) bridge control"
 	select REGMAP
diff --git a/drivers/soc/aspeed/Makefile b/drivers/soc/aspeed/Makefile
index b5188dcde37a..ace038b6ff22 100644
--- a/drivers/soc/aspeed/Makefile
+++ b/drivers/soc/aspeed/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_ASPEED_LPC_CTRL)		+= aspeed-lpc-ctrl.o
 obj-$(CONFIG_ASPEED_LPC_SNOOP)		+= aspeed-lpc-snoop.o
-obj-$(CONFIG_ASPEED_UART_ROUTING)	+= aspeed-uart-routing.o
 obj-$(CONFIG_ASPEED_P2A_CTRL)		+= aspeed-p2a-ctrl.o
 obj-$(CONFIG_ASPEED_SOCINFO)		+= aspeed-socinfo.o
 CONTEXT_ANALYSIS_aspeed-lpc-snoop.o	:= y
diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
deleted file mode 100644
index b4b521b5ddf1..000000000000
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ /dev/null
@@ -1,601 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Copyright (c) 2018 Google LLC
- * Copyright (c) 2021 Aspeed Technology Inc.
- */
-#include <linux/device.h>
-#include <linux/module.h>
-#include <linux/of.h>
-#include <linux/mfd/syscon.h>
-#include <linux/regmap.h>
-#include <linux/platform_device.h>
-
-/* register offsets */
-#define HICR9	0x98
-#define HICRA	0x9c
-
-/* attributes options */
-#define UART_ROUTING_IO1	"io1"
-#define UART_ROUTING_IO2	"io2"
-#define UART_ROUTING_IO3	"io3"
-#define UART_ROUTING_IO4	"io4"
-#define UART_ROUTING_IO5	"io5"
-#define UART_ROUTING_IO6	"io6"
-#define UART_ROUTING_IO10	"io10"
-#define UART_ROUTING_UART1	"uart1"
-#define UART_ROUTING_UART2	"uart2"
-#define UART_ROUTING_UART3	"uart3"
-#define UART_ROUTING_UART4	"uart4"
-#define UART_ROUTING_UART5	"uart5"
-#define UART_ROUTING_UART6	"uart6"
-#define UART_ROUTING_UART10	"uart10"
-#define UART_ROUTING_RES	"reserved"
-
-struct aspeed_uart_routing {
-	struct regmap *map;
-	struct attribute_group const *attr_grp;
-};
-
-struct aspeed_uart_routing_selector {
-	struct device_attribute	dev_attr;
-	uint8_t reg;
-	uint8_t mask;
-	uint8_t shift;
-	const char *const options[];
-};
-
-#define to_routing_selector(_dev_attr)					\
-	container_of(_dev_attr, struct aspeed_uart_routing_selector, dev_attr)
-
-static ssize_t aspeed_uart_routing_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf);
-
-static ssize_t aspeed_uart_routing_store(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count);
-
-#define ROUTING_ATTR(_name) {					\
-	.attr = {.name = _name,					\
-		 .mode = VERIFY_OCTAL_PERMISSIONS(0644) },	\
-	.show = aspeed_uart_routing_show,			\
-	.store = aspeed_uart_routing_store,			\
-}
-
-/* routing selector for AST25xx */
-static struct aspeed_uart_routing_selector ast2500_io6_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO6),
-	.reg = HICR9,
-	.shift = 8,
-	.mask = 0xf,
-	.options = {
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO5,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_uart5_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART5),
-	.reg = HICRA,
-	.shift = 28,
-	.mask = 0xf,
-	.options = {
-		    UART_ROUTING_IO5,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_uart4_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
-	.reg = HICRA,
-	.shift = 25,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_IO6,
-		    NULL,
-	},
-};
-
-static struct aspeed_uart_routing_selector ast2500_uart3_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
-	.reg = HICRA,
-	.shift = 22,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_uart2_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
-	.reg = HICRA,
-	.shift = 19,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_uart1_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
-	.reg = HICRA,
-	.shift = 16,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_io5_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO5),
-	.reg = HICRA,
-	.shift = 12,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_io4_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
-	.reg = HICRA,
-	.shift = 9,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_io3_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
-	.reg = HICRA,
-	.shift = 6,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_io2_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
-	.reg = HICRA,
-	.shift = 3,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2500_io1_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
-	.reg = HICRA,
-	.shift = 0,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART5,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO6,
-		    NULL,
-		    },
-};
-
-static struct attribute *ast2500_uart_routing_attrs[] = {
-	&ast2500_io6_sel.dev_attr.attr,
-	&ast2500_uart5_sel.dev_attr.attr,
-	&ast2500_uart4_sel.dev_attr.attr,
-	&ast2500_uart3_sel.dev_attr.attr,
-	&ast2500_uart2_sel.dev_attr.attr,
-	&ast2500_uart1_sel.dev_attr.attr,
-	&ast2500_io5_sel.dev_attr.attr,
-	&ast2500_io4_sel.dev_attr.attr,
-	&ast2500_io3_sel.dev_attr.attr,
-	&ast2500_io2_sel.dev_attr.attr,
-	&ast2500_io1_sel.dev_attr.attr,
-	NULL,
-};
-
-static const struct attribute_group ast2500_uart_routing_attr_group = {
-	.attrs = ast2500_uart_routing_attrs,
-};
-
-/* routing selector for AST26xx */
-static struct aspeed_uart_routing_selector ast2600_uart10_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART10),
-	.reg = HICR9,
-	.shift = 12,
-	.mask = 0xf,
-	.options = {
-		    UART_ROUTING_IO10,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-			UART_ROUTING_RES,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_io10_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO10),
-	.reg = HICR9,
-	.shift = 8,
-	.mask = 0xf,
-	.options = {
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-			UART_ROUTING_RES,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-			UART_ROUTING_RES,
-		    UART_ROUTING_UART10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_uart4_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART4),
-	.reg = HICRA,
-	.shift = 25,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_IO10,
-		    NULL,
-	},
-};
-
-static struct aspeed_uart_routing_selector ast2600_uart3_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART3),
-	.reg = HICRA,
-	.shift = 22,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_uart2_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART2),
-	.reg = HICRA,
-	.shift = 19,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_uart1_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_UART1),
-	.reg = HICRA,
-	.shift = 16,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_io4_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO4),
-	.reg = HICRA,
-	.shift = 9,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART10,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_io3_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO3),
-	.reg = HICRA,
-	.shift = 6,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART10,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_IO1,
-		    UART_ROUTING_IO2,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_io2_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO2),
-	.reg = HICRA,
-	.shift = 3,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART10,
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct aspeed_uart_routing_selector ast2600_io1_sel = {
-	.dev_attr = ROUTING_ATTR(UART_ROUTING_IO1),
-	.reg = HICRA,
-	.shift = 0,
-	.mask = 0x7,
-	.options = {
-		    UART_ROUTING_UART1,
-		    UART_ROUTING_UART2,
-		    UART_ROUTING_UART3,
-		    UART_ROUTING_UART4,
-		    UART_ROUTING_UART10,
-		    UART_ROUTING_IO3,
-		    UART_ROUTING_IO4,
-		    UART_ROUTING_IO10,
-		    NULL,
-		    },
-};
-
-static struct attribute *ast2600_uart_routing_attrs[] = {
-	&ast2600_uart10_sel.dev_attr.attr,
-	&ast2600_io10_sel.dev_attr.attr,
-	&ast2600_uart4_sel.dev_attr.attr,
-	&ast2600_uart3_sel.dev_attr.attr,
-	&ast2600_uart2_sel.dev_attr.attr,
-	&ast2600_uart1_sel.dev_attr.attr,
-	&ast2600_io4_sel.dev_attr.attr,
-	&ast2600_io3_sel.dev_attr.attr,
-	&ast2600_io2_sel.dev_attr.attr,
-	&ast2600_io1_sel.dev_attr.attr,
-	NULL,
-};
-
-static const struct attribute_group ast2600_uart_routing_attr_group = {
-	.attrs = ast2600_uart_routing_attrs,
-};
-
-static ssize_t aspeed_uart_routing_show(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
-{
-	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
-	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
-	int val, pos, len;
-
-	regmap_read(uart_routing->map, sel->reg, &val);
-	val = (val >> sel->shift) & sel->mask;
-
-	len = 0;
-	for (pos = 0; sel->options[pos] != NULL; ++pos) {
-		if (pos == val)
-			len += sysfs_emit_at(buf, len, "[%s] ", sel->options[pos]);
-		else
-			len += sysfs_emit_at(buf, len, "%s ", sel->options[pos]);
-	}
-
-	if (val >= pos)
-		len += sysfs_emit_at(buf, len, "[unknown(%d)]", val);
-
-	len += sysfs_emit_at(buf, len, "\n");
-
-	return len;
-}
-
-static ssize_t aspeed_uart_routing_store(struct device *dev,
-					 struct device_attribute *attr,
-					 const char *buf, size_t count)
-{
-	struct aspeed_uart_routing *uart_routing = dev_get_drvdata(dev);
-	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
-	int val;
-
-	val = __sysfs_match_string(sel->options, -1, buf);
-	if (val < 0) {
-		dev_err(dev, "invalid value \"%s\"\n", buf);
-		return -EINVAL;
-	}
-
-	regmap_update_bits(uart_routing->map, sel->reg,
-			(sel->mask << sel->shift),
-			(val & sel->mask) << sel->shift);
-
-	return count;
-}
-
-static int aspeed_uart_routing_probe(struct platform_device *pdev)
-{
-	int rc;
-	struct device *dev = &pdev->dev;
-	struct aspeed_uart_routing *uart_routing;
-
-	uart_routing = devm_kzalloc(&pdev->dev, sizeof(*uart_routing), GFP_KERNEL);
-	if (!uart_routing)
-		return -ENOMEM;
-
-	uart_routing->map = syscon_node_to_regmap(dev->parent->of_node);
-	if (IS_ERR(uart_routing->map)) {
-		dev_err(dev, "cannot get regmap\n");
-		return PTR_ERR(uart_routing->map);
-	}
-
-	uart_routing->attr_grp = of_device_get_match_data(dev);
-
-	rc = sysfs_create_group(&dev->kobj, uart_routing->attr_grp);
-	if (rc < 0)
-		return rc;
-
-	dev_set_drvdata(dev, uart_routing);
-
-	dev_info(dev, "module loaded\n");
-
-	return 0;
-}
-
-static void aspeed_uart_routing_remove(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct aspeed_uart_routing *uart_routing = platform_get_drvdata(pdev);
-
-	sysfs_remove_group(&dev->kobj, uart_routing->attr_grp);
-}
-
-static const struct of_device_id aspeed_uart_routing_table[] = {
-	{ .compatible = "aspeed,ast2400-uart-routing",
-	  .data = &ast2500_uart_routing_attr_group },
-	{ .compatible = "aspeed,ast2500-uart-routing",
-	  .data = &ast2500_uart_routing_attr_group },
-	{ .compatible = "aspeed,ast2600-uart-routing",
-	  .data = &ast2600_uart_routing_attr_group },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, aspeed_uart_routing_table);
-
-static struct platform_driver aspeed_uart_routing_driver = {
-	.driver = {
-		.name = "aspeed-uart-routing",
-		.of_match_table = aspeed_uart_routing_table,
-	},
-	.probe = aspeed_uart_routing_probe,
-	.remove = aspeed_uart_routing_remove,
-};
-
-module_platform_driver(aspeed_uart_routing_driver);
-
-MODULE_AUTHOR("Oskar Senft <osk@google.com>");
-MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
diff --git a/drivers/uart-routing/Kconfig b/drivers/uart-routing/Kconfig
index a0c45a7bba47..b67c2a6de74c 100644
--- a/drivers/uart-routing/Kconfig
+++ b/drivers/uart-routing/Kconfig
@@ -13,4 +13,19 @@ config UART_ROUTING
 	  This symbol is selected by the SoC specific drivers below and is
 	  not meant to be enabled on its own.
 
+config ASPEED_UART_ROUTING
+	tristate "ASPEED uart routing control"
+	depends on ARCH_ASPEED || COMPILE_TEST
+	select UART_ROUTING
+	select REGMAP
+	select MFD_SYSCON
+	default ARCH_ASPEED
+	help
+	  Provides a driver to control the UART routing paths, allowing
+	  users to perform runtime configuration of the RX muxes among
+	  the UART controllers and I/O pins.
+
+	  If M is selected, the module will be called
+	  aspeed-uart-routing.
+
 endmenu
diff --git a/drivers/uart-routing/Makefile b/drivers/uart-routing/Makefile
index 975165f070a5..226980c639a4 100644
--- a/drivers/uart-routing/Makefile
+++ b/drivers/uart-routing/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_UART_ROUTING)			+= uart-routing.o
+
+obj-$(CONFIG_ASPEED_UART_ROUTING)		+= aspeed-uart-routing.o
diff --git a/drivers/uart-routing/aspeed-uart-routing.c b/drivers/uart-routing/aspeed-uart-routing.c
new file mode 100644
index 000000000000..7286ecd87bea
--- /dev/null
+++ b/drivers/uart-routing/aspeed-uart-routing.c
@@ -0,0 +1,415 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2018 Google LLC
+ * Copyright (c) 2021 Aspeed Technology Inc.
+ */
+#include <linux/device.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+
+#include "uart-routing.h"
+
+/* register offsets */
+#define HICR9	0x98
+#define HICRA	0x9c
+
+/* attributes options */
+#define UART_ROUTING_IO1	"io1"
+#define UART_ROUTING_IO2	"io2"
+#define UART_ROUTING_IO3	"io3"
+#define UART_ROUTING_IO4	"io4"
+#define UART_ROUTING_IO5	"io5"
+#define UART_ROUTING_IO6	"io6"
+#define UART_ROUTING_IO10	"io10"
+#define UART_ROUTING_UART1	"uart1"
+#define UART_ROUTING_UART2	"uart2"
+#define UART_ROUTING_UART3	"uart3"
+#define UART_ROUTING_UART4	"uart4"
+#define UART_ROUTING_UART5	"uart5"
+#define UART_ROUTING_UART6	"uart6"
+#define UART_ROUTING_UART10	"uart10"
+#define UART_ROUTING_RES	"reserved"
+
+/* routing selector for AST25xx */
+static const char *const ast2500_io6_options[] = {
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART5,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO5,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io6_sel, io6, HICR9, 8, 0xf, ast2500_io6_options);
+
+static const char *const ast2500_uart5_options[] = {
+	UART_ROUTING_IO5,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_uart5_sel, uart5, HICRA, 28, 0xf, ast2500_uart5_options);
+
+static const char *const ast2500_uart4_options[] = {
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_uart4_sel, uart4, HICRA, 25, 0x7, ast2500_uart4_options);
+
+static const char *const ast2500_uart3_options[] = {
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_uart3_sel, uart3, HICRA, 22, 0x7, ast2500_uart3_options);
+
+static const char *const ast2500_uart2_options[] = {
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART1,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_uart2_sel, uart2, HICRA, 19, 0x7, ast2500_uart2_options);
+
+static const char *const ast2500_uart1_options[] = {
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_uart1_sel, uart1, HICRA, 16, 0x7, ast2500_uart1_options);
+
+static const char *const ast2500_io5_options[] = {
+	UART_ROUTING_UART5,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io5_sel, io5, HICRA, 12, 0x7, ast2500_io5_options);
+
+static const char *const ast2500_io4_options[] = {
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART5,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io4_sel, io4, HICRA, 9, 0x7, ast2500_io4_options);
+
+static const char *const ast2500_io3_options[] = {
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART5,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io3_sel, io3, HICRA, 6, 0x7, ast2500_io3_options);
+
+static const char *const ast2500_io2_options[] = {
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART5,
+	UART_ROUTING_UART1,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io2_sel, io2, HICRA, 3, 0x7, ast2500_io2_options);
+
+static const char *const ast2500_io1_options[] = {
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART5,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO6,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2500_io1_sel, io1, HICRA, 0, 0x7, ast2500_io1_options);
+
+static struct attribute *ast2500_uart_routing_attrs[] = {
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io6_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_uart5_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_uart4_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_uart3_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_uart2_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_uart1_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io5_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io4_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io3_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io2_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2500_io1_sel),
+	NULL,
+};
+
+static const struct attribute_group ast2500_uart_routing_attr_group = {
+	.attrs = ast2500_uart_routing_attrs,
+};
+
+/* routing selector for AST26xx */
+static const char *const ast2600_uart10_options[] = {
+	UART_ROUTING_IO10,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_RES,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_uart10_sel, uart10, HICR9, 12, 0xf, ast2600_uart10_options);
+
+static const char *const ast2600_io10_options[] = {
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_RES,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_RES,
+	UART_ROUTING_UART10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_io10_sel, io10, HICR9, 8, 0xf, ast2600_io10_options);
+
+static const char *const ast2600_uart4_options[] = {
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_uart4_sel, uart4, HICRA, 25, 0x7, ast2600_uart4_options);
+
+static const char *const ast2600_uart3_options[] = {
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_uart3_sel, uart3, HICRA, 22, 0x7, ast2600_uart3_options);
+
+static const char *const ast2600_uart2_options[] = {
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO1,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART1,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_uart2_sel, uart2, HICRA, 19, 0x7, ast2600_uart2_options);
+
+static const char *const ast2600_uart1_options[] = {
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_uart1_sel, uart1, HICRA, 16, 0x7, ast2600_uart1_options);
+
+static const char *const ast2600_io4_options[] = {
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART10,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_io4_sel, io4, HICRA, 9, 0x7, ast2600_io4_options);
+
+static const char *const ast2600_io3_options[] = {
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART10,
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_IO1,
+	UART_ROUTING_IO2,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_io3_sel, io3, HICRA, 6, 0x7, ast2600_io3_options);
+
+static const char *const ast2600_io2_options[] = {
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART10,
+	UART_ROUTING_UART1,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_io2_sel, io2, HICRA, 3, 0x7, ast2600_io2_options);
+
+static const char *const ast2600_io1_options[] = {
+	UART_ROUTING_UART1,
+	UART_ROUTING_UART2,
+	UART_ROUTING_UART3,
+	UART_ROUTING_UART4,
+	UART_ROUTING_UART10,
+	UART_ROUTING_IO3,
+	UART_ROUTING_IO4,
+	UART_ROUTING_IO10,
+	NULL,
+};
+
+UART_ROUTING_SELECTOR(ast2600_io1_sel, io1, HICRA, 0, 0x7, ast2600_io1_options);
+
+static struct attribute *ast2600_uart_routing_attrs[] = {
+	UART_ROUTING_SELECTOR_ATTR(ast2600_uart10_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_io10_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_uart4_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_uart3_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_uart2_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_uart1_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_io4_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_io3_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_io2_sel),
+	UART_ROUTING_SELECTOR_ATTR(ast2600_io1_sel),
+	NULL,
+};
+
+static const struct attribute_group ast2600_uart_routing_attr_group = {
+	.attrs = ast2600_uart_routing_attrs,
+};
+
+static int aspeed_uart_routing_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+
+	map = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(map))
+		return dev_err_probe(dev, PTR_ERR(map), "cannot get regmap\n");
+
+	return devm_uart_routing_register(dev, map,
+					  of_device_get_match_data(dev));
+}
+
+static const struct of_device_id aspeed_uart_routing_table[] = {
+	{ .compatible = "aspeed,ast2400-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2500-uart-routing",
+	  .data = &ast2500_uart_routing_attr_group },
+	{ .compatible = "aspeed,ast2600-uart-routing",
+	  .data = &ast2600_uart_routing_attr_group },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, aspeed_uart_routing_table);
+
+static struct platform_driver aspeed_uart_routing_driver = {
+	.driver = {
+		.name = "aspeed-uart-routing",
+		.of_match_table = aspeed_uart_routing_table,
+	},
+	.probe = aspeed_uart_routing_probe,
+};
+
+module_platform_driver(aspeed_uart_routing_driver);
+
+MODULE_AUTHOR("Oskar Senft <osk@google.com>");
+MODULE_AUTHOR("Chia-Wei Wang <chiawei_wang@aspeedtech.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Driver to configure Aspeed UART routing");
-- 
2.25.1

