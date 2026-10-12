Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010037.outbound.protection.outlook.com [52.101.56.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0FF4CA294;
	Mon, 12 Oct 2026 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791826662; cv=fail; b=WCfx6q7j1uWZFhqjQOLiuuVRFuncON06xZDwi/7bBUSavShE+fG6qgUO9mkkgQOHp8OOAO0YzLQNh/SZABHCmUcDc0HCC/tap38ErYa7TjWYp7uvhVUlwcmXX7ns93VcB+M0WOmf9wPMyr9nUrbPdhxfpEhAntT/cZbD8rXS8tE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791826662; c=relaxed/simple;
	bh=3Hv6x4yBBumdmXopnuMSn6bAqjkgxpnHibC7Xi18oEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQ5T0iHZdTB5dbo00ZXzws7UAFvvt0NEzvqa6oP7L9MHRlEyIkj/9wS2Uf+1AYh8UhQBZTlUvnGGIYsziHZ5TbpWIn8OeUJelqksBxB8suGoiSelMEN3pcaRMFMn1MM+P5gYH2P88ozRSUz7GWjmy/ZWOHNFIhu45iEzQ1Qgq5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=m1QMzIUX; arc=fail smtp.client-ip=52.101.56.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="m1QMzIUX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWOuq6TGS2irtnkbmqcP3Z9Cu24en8oOzDOL4MQBXKlYntNK14UiYEVOLjTBDNHVAcaEoR3jUOiWnvwOkMqIxnD4LUzSmF4UwMb99HaOmDDN4S9DLxZKu90PBGYbFekWRmuCcZMJPSi8+qOLjkqByN9LoaZ/JgJRBk/qq5ZBvyuIcnLxXatxnnAFaNVpuFNoENDB7iHpjebKe35agzaEmD1kxwV35D/Cq2IzU48yyrWNJBfNCHAvoQSH74Vue2iQ+Q1Q9aKDCxj15E6It1nd4+uwsUEI3UgMQl5G/JNkw37KNHAuLEzY0JdDc7OY+0b7lZ18VUxtpmJcqfhzZMLnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnDG8gwIdl0eknBwQX82WW4/L+f53AbwHfEwuDFj1I0=;
 b=vvgsEASZtoAPA8KaaaeATu/ejbVKvt6tcFOEZ73rqYrReUspXzn2zt2trRclL2sScChmk1758ZGEnb91IQoi2kWLcSWCCKS3fldU6Btsjxm8r9j0GYXFCRkH0wDsiw5qJnBHFnL/yTofxeIuhz1jilv5jtj0EXq+5AMuBSV9yKWOD4kyTW3JuV99Ecc9JiPDl7UBsKYUH4T5DDIbsQMGMblqqO5P2gGyMWFudKHkfCI/5mW2z2j4s2pYLM/5TpHxJoR1Pasjq1rs/5MJzDTPgENiMsqXfttKgUb4FhaI/a+O5/sTfGmEbXhC+3hgCW2hnxIZk+JxV1ioRG4j/4XzFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnDG8gwIdl0eknBwQX82WW4/L+f53AbwHfEwuDFj1I0=;
 b=m1QMzIUXV4oYW40OTxY6DfAzpKXP3ZwTf/tgnlFB8l1tzUsOU35dT/H7FKbSprIAe3Bm4C/d9f6ND/0SkASyh0Uyz6tQkMEUK80J+L7c4smSGjRpjg52ORlmc11KFQ4YcSNpr39PKILH3If5F4MJeZGqoF1If2iTX4bjBxVqy6XGmnhvDtJpCAfxUZroOvJ1KfnC4fP7xPsy7kQWuw/Or2iS2hiBDo2OQR/UGMrw1BUgj6HJinJyOZvmEL02PqHeXEsUGa1nfsK54S5E7PxxSMQuiV3qFwjjDLBlGPlCVFDfuuPAQTFySnZPvo0PRt5RBA1OcDEZOYMa9HdF8LxeCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 17:37:37 +0000
Received: from PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0]) by PH7PR12MB5974.namprd12.prod.outlook.com
 ([fe80::f5a5:bbc3:e9da:f8a0%3]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 17:37:36 +0000
From: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
To: Corey Minyard <corey@minyard.net>
Cc: Donald Shannon <donalds@nvidia.com>,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 11/11] ipmi: Add NVIDIA LSTP IPMI BMC driver
Date: Mon, 12 Oct 2026 20:36:09 +0300
Message-ID: <20261012-lstp-usb-adapter-v1-11-aambrozewicz@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN0PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::17) To PH7PR12MB5974.namprd12.prod.outlook.com
 (2603:10b6:510:1d9::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5974:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: ea49837d-b5a2-4448-416b-08df288780f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|3023799007|261009221227099003|261009223027099003|5023799004|11063799006|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4bLXbzsC9OmwOlCGkCmTytjVbk7oEQezS5rYao1u7e0T9AOfP6j5b6JrFGhtgwtSKNti8cKigfI03M6dQO9YBfMAMEdjxgwfypaF0SoqMqH7NgpWf6F+rNaxMYEwEUwIfi+3modj/+I5RfgfiCjxk1bWwN40xFyoVI2uyEx31yEyUI71ZNpjvP2O6+SWBdnwiXXCpEasUSd8779At2O/cf95LdgyrX031HpAeFyU4Alpdb4Xm24tWX7Ipib6zg4UFLtSwLFHoACONCTuUm6F1m5Yl5PTPEjWxxezJGyI6lxyaHtbVGmMHTNB+0waEZR16zmpem+G7cnJZZd+VvG2sNSOdSBnYOKpM9l3rxwtSqzZccpec/gMtf0utwAXMMrYKjTa3yrqwwb00NqqgdPzWRgVxA072Rmrtng5WH8KYCkElyocWH9ioEiMQw2HO4CUAOmj3ifg4Z4TFa6HsvalOTwu+wm02MH0Sg97nMe98y8TpP5jKQvMwZ4GxWsQjHtGXU+X58oakNQkSemmb51TXKQO1jGg9P/UlWJzvJJnlet9vTfyA4IvOzfa1k4ZqoR5ru2ZHTwEBiqjZL7lwqBH4krw+77Ad7n1miOKtuBc7gyVSz6fdHIoZaKLHgZCQBSTAtH9HkMfFZSUorM+AjFCwIDf/m2v1Y+SH0HN1lgg8Wc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB5974.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(3023799007)(261009221227099003)(261009223027099003)(5023799004)(11063799006)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B1Tx48wOPCyGg5ym2J7zvONU173CcD/HrOd3SgntI2KZfSmCcKx37ZVqgVgY?=
 =?us-ascii?Q?D7Kzoni9IRRQMDWLJ6bEBEXD/nxbqMM+44P/jXeAuqnf38DQ9J3jR30jDdaz?=
 =?us-ascii?Q?/KzMMFC4zUYZYXjcfwJ7BDX6DWMCinG4ic9gG0CfYj2KP8kjhHPBZz2OrZkZ?=
 =?us-ascii?Q?PEVlxobMIZYX4zIs1f+jCO5PT6Fzt57nRAjR3ly/81xlQPTdj3Ih0VUodzqN?=
 =?us-ascii?Q?sHbE9IzAmlz7K7XRniPf5x+wziV7mecO+u85bYX1L1SwlAAo6UtREluZCnDF?=
 =?us-ascii?Q?svozDsKEZhDAUyA03T8TIxUBUzxthfBRyyE+GSBkHwcuWyPBg6i+nMlp++0Q?=
 =?us-ascii?Q?qozZf0pOe5aVJ/MlLptg+3kZ5B6KD658grS5X6XTAU+KElDSkUFySRjTDkit?=
 =?us-ascii?Q?Q2p981skcU504VRFkmLTNRdli8TphTj/jq3XVcFl+7tD3cEc0t2SUdP7R3e/?=
 =?us-ascii?Q?LMojBb53Su4Kb/ni52bblSjZ1gyDNJ65K4jPz94zYymX0vHBRE51DDihGLeq?=
 =?us-ascii?Q?GqBKODOJJDIocy3YK0xbqITFhdzNoLFLSE1LhjNJEVi3uAsJ34dvtVa+skOh?=
 =?us-ascii?Q?a6Ws3ezTuw6p08TbLIyQEMpTE2SyvkJsI7ysitx0spRw6i0yeq3mVpLrg2bZ?=
 =?us-ascii?Q?19aq689LBa/wLJOCE1Z0AlOvI1CC/kZ47lyF1SinRhyaBjKphA4L9lbhoMju?=
 =?us-ascii?Q?8UIJ7IDh4RZkUQvGIS2e/aoSIRC9VvpmgvRIZbO15iGPoNekXDAxZgnCMViX?=
 =?us-ascii?Q?ZFmvdQEWBLJtdS1kH5Dhcrgooc1SqhWenUSySngi0mmaDx3vpQPicVCMq/+N?=
 =?us-ascii?Q?Cms5Y6uVLH5csbWa6nbLRBq03gYEZ/9EtksqQiREx5JPGn7tzrJvs9/PvVJT?=
 =?us-ascii?Q?Ot0PXTAaKPvvqp51RbxD1iiQKCJFeEyRb2Q3bgeNwuzmA3ZmkYh44HMlEJkt?=
 =?us-ascii?Q?Vbe60QuTbp/c9PSVRR3JNr4hX8I4mjY8AWrPQlCUTZibZRR2PLx99FGo1ZIX?=
 =?us-ascii?Q?ePP9h+/Yhx2N1SSPo76u0mrPlF3Us4Awx/b/ILFs7X/8MxXPm8AtKasSo+DE?=
 =?us-ascii?Q?0qBIr2WQa7/wbDCXjQkDtaNFKproKuZLY8HjtfXhtEovtNfounw6ER82cxdu?=
 =?us-ascii?Q?ieu61hgUChiKNwAWj+pEzVvmCYEu5L+NLbIFJHxaSnMMGuAR2RxjTRfqfZ4E?=
 =?us-ascii?Q?+mmoO44bbq3T6W34WHtcljeN1aclrjxVFNbuy+KQTSmwMz32w4iXcrvGkN3H?=
 =?us-ascii?Q?S5zmSOp58QCIDkRpob8dYF1JNoza1HmOECIsfeb10RynKyQv7ocLaaKp9u0T?=
 =?us-ascii?Q?xjyCmP4NJGmPFADDAVoZEJokyaDFzxrJJ8m6A1OD+lEs0Dg6EMPj/TSy99Ja?=
 =?us-ascii?Q?LFAWOROg6wHym3Fx5qe0m7n+LyB+6qC3+QqwcyBK/7WMRaaKtqKXFRfMLDD5?=
 =?us-ascii?Q?le3lY8VZyUm5T115oPZgy1W4tFmZ7iDwOeUQFEYLPpae4KBTrGz2O/tggAU5?=
 =?us-ascii?Q?m76R0aA6SLu8VNecdnHkFAKiHE9PAMtp312f8hTwXzSRttU/+M1xrom3QkVc?=
 =?us-ascii?Q?qtC6UN9bnE9idHDa6oEsr8LfljANW0t7couq/rFy9xkCJfEKDvCGzVvt2roF?=
 =?us-ascii?Q?j2CeazOlVeQ44QXdcmBxC4KMmoG4dKTtKeoIGL77nWFGu0i0OC6XWGE8B0tT?=
 =?us-ascii?Q?TXXjfqL6q/9fOg4x8ujADmC7qFSXJ6tm939LO4ddAzYxqCWa9Yxb8o/5F44t?=
 =?us-ascii?Q?OnTABpmX6w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea49837d-b5a2-4448-416b-08df288780f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5974.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 17:37:36.1328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Djfh7TwrDq91rmBSBmXDZEeMRrqclKSPxFgLmDuVTQzMRZCdzxR+Hvcc012ubi9NuQ7kiIUM7wOYynua5jvnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

Add a BMC-side driver for the IPMI channels of NVIDIA LSTP USB adapters.
The adapter carries IPMI messages between the host and the BMC; each
channel is exposed to BMC userspace as an ipmi-lstp<n> character device
that reads requests from the host and writes the responses back.

By default each message on the node carries a one-byte message number
between the length and the payload, and a response echoes the number
of the request it answers. The number exists only on the node, not in
the LSTP protocol. With USB_LSTP_IPMI_MSG_NUM disabled the
node uses the ssif_bmc layout (struct ipmi_ssif_msg) instead, so
userspace written for ssif_bmc works unchanged.

Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
---
 MAINTAINERS                   |   1 +
 drivers/char/ipmi/Kconfig     |  32 +++
 drivers/char/ipmi/Makefile    |   1 +
 drivers/char/ipmi/ipmi-lstp.c | 464 ++++++++++++++++++++++++++++++++++
 4 files changed, 498 insertions(+)
 create mode 100644 drivers/char/ipmi/ipmi-lstp.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e58895b7d5a..96667b3baa7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19577,6 +19577,7 @@ F:	Documentation/devicetree/bindings/spi/nvidia,lstp-spi.yaml
 F:	Documentation/devicetree/bindings/usb/nvidia,lstp.yaml
 F:	Documentation/driver-api/usb/lstp.rst
 F:	Documentation/firmware-guide/acpi/lstp.rst
+F:	drivers/char/ipmi/ipmi-lstp.c
 F:	drivers/gpio/gpio-lstp.c
 F:	drivers/i2c/busses/i2c-lstp.c
 F:	drivers/leds/leds-lstp.c
diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
index 538a7d3c65bf..eb51a2d56fc9 100644
--- a/drivers/char/ipmi/Kconfig
+++ b/drivers/char/ipmi/Kconfig
@@ -119,6 +119,38 @@ config IPMI_POWEROFF
 
 endif # IPMI_HANDLER
 
+config LSTP_IPMI_BMC
+	tristate "NVIDIA LSTP IPMI BMC support"
+	depends on USB_LSTP
+	default USB_LSTP
+	help
+	  Say Y or M here to support the IPMI channels of NVIDIA LSTP USB
+	  adapters on a BMC. Each channel is exposed as an ipmi-lstp<n>
+	  character device through which BMC userspace receives requests
+	  from the host and sends the responses back.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called ipmi-lstp.
+
+config USB_LSTP_IPMI_MSG_NUM
+	bool "Message-number header on LSTP IPMI nodes"
+	depends on LSTP_IPMI_BMC
+	default y
+	help
+	  Messages read from and written to an LSTP IPMI device node carry a
+	  one-byte message number between the length and the payload, and a
+	  response must echo the number of the request it answers. The number
+	  exists only on the device node, not in the LSTP protocol, and no
+	  other BMC-side IPMI driver has it.
+
+	  Disable this option to drop it. The node then uses the layout of
+	  struct ipmi_ssif_msg from the ssif_bmc driver, a length followed by
+	  the payload, so that userspace written for ssif_bmc works unchanged.
+	  A response answers the request read last, and is dropped once a newer
+	  request has arrived.
+
+	  Say Y if userspace parses the message number.
+
 config IPMI_KCS_BMC
 	tristate
 
diff --git a/drivers/char/ipmi/Makefile b/drivers/char/ipmi/Makefile
index 4ea450a82242..2e320ce2c901 100644
--- a/drivers/char/ipmi/Makefile
+++ b/drivers/char/ipmi/Makefile
@@ -29,3 +29,4 @@ obj-$(CONFIG_ASPEED_KCS_IPMI_BMC) += kcs_bmc_aspeed.o
 obj-$(CONFIG_NPCM7XX_KCS_IPMI_BMC) += kcs_bmc_npcm7xx.o
 obj-$(CONFIG_IPMB_DEVICE_INTERFACE) += ipmb_dev_int.o
 obj-$(CONFIG_SSIF_IPMI_BMC) += ssif_bmc.o
+obj-$(CONFIG_LSTP_IPMI_BMC) += ipmi-lstp.o
diff --git a/drivers/char/ipmi/ipmi-lstp.c b/drivers/char/ipmi/ipmi-lstp.c
new file mode 100644
index 000000000000..787d633d4ada
--- /dev/null
+++ b/drivers/char/ipmi/ipmi-lstp.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * IPMI driver for LSTP USB interface.
+ *
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES.  All rights reserved.
+ */
+
+#include <linux/build_bug.h>
+#include <linux/err.h>
+#include <linux/idr.h>
+#include <linux/ipmi_ssif_bmc.h>
+#include <linux/kfifo.h>
+#include <linux/kref.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+#include <linux/usb/lstp.h>
+
+/* ~1 s of queued requests at OpenBMC rates; past that the host has retried. */
+#define BUFFER_SIZE 4096
+
+static DEFINE_IDA(lstp_ipmi_ida);
+
+#define IPMI_LSTP_PAYLOAD_MAX 254
+#define IPMI_MIN_MSG_LEN 2 /* netfn/lun + cmd */
+
+/*
+ * read(2) and write(2) layout with CONFIG_USB_LSTP_IPMI_MSG_NUM. Deployed
+ * userspace parses these bytes, so the field widths and offsets are fixed;
+ * native byte order, as both ends are the same host. @msg_num exists only on
+ * this interface, never on the wire.
+ */
+struct ipmi_lstp_msg_header {
+	__u32 len;
+	__u8 msg_num;
+} __packed;
+
+struct ipmi_lstp_msg {
+	struct ipmi_lstp_msg_header header;
+	__u8 payload[IPMI_LSTP_PAYLOAD_MAX];
+};
+
+static_assert(sizeof(struct ipmi_lstp_msg_header) == 5, "IPMI read(2) header layout is ABI");
+static_assert(offsetof(struct ipmi_lstp_msg_header, msg_num) == 4,
+	      "IPMI read(2) header layout is ABI");
+
+/*
+ * The layout without CONFIG_USB_LSTP_IPMI_MSG_NUM is the ssif_bmc driver's:
+ * the same len and payload, no @msg_num.
+ */
+static_assert(offsetof(struct ipmi_ssif_msg, payload) ==
+		      sizeof_field(struct ipmi_lstp_msg_header, len),
+	      "Untagged layout must be the LSTP header without msg_num");
+static_assert(IPMI_SSIF_PAYLOAD_MAX == IPMI_LSTP_PAYLOAD_MAX,
+	      "Untagged layout must carry the LSTP payload");
+
+#define LSTP_IPMI_MSG_NUM IS_ENABLED(CONFIG_USB_LSTP_IPMI_MSG_NUM)
+
+/* The leading bytes of struct ipmi_lstp_msg_header that userspace sees. */
+#define LSTP_IPMI_UAPI_HDR_LEN                                     \
+	(LSTP_IPMI_MSG_NUM ? sizeof(struct ipmi_lstp_msg_header) : \
+			     sizeof_field(struct ipmi_lstp_msg_header, len))
+#define LSTP_IPMI_UAPI_MSG_MAX \
+	(LSTP_IPMI_MSG_NUM ? sizeof(struct ipmi_lstp_msg) : sizeof(struct ipmi_ssif_msg))
+
+/* One per bind; the bind and each open fd hold @ref. */
+struct lstp_ipmi_ctx {
+	struct kref ref;
+	struct lstp_channel *ch; /* pinned for the life of @ctx */
+	struct miscdevice miscdev;
+	int ida_id; /* -1 until allocated */
+	bool running; /* exclusive-open flag */
+	spinlock_t lock; /* protects @running, @msg_count, @read_tag, @fifo */
+	struct mutex tx_lock; /* held across write()'s gone test and send; teardown waits on it */
+	wait_queue_head_t req_wq;
+	struct kfifo_rec_ptr_2 fifo; /* pending requests, oldest dropped to fit */
+	u8 msg_count; /* tag of the outstanding request; write() echoes it */
+	u8 read_tag; /* untagged ABI: tag of the request read() handed out last, 0 for none */
+	bool stopped; /* node torn down; see lstp_ipmi_gone() */
+};
+
+enum lstp_ipmi_cmd {
+	LSTP_IPMI_CMD_MESSAGE = 0x00,
+};
+
+/* @stopped is per bind and never cleared; see Documentation/driver-api/usb/lstp.rst. */
+static inline bool lstp_ipmi_gone(struct lstp_ipmi_ctx *ctx)
+{
+	return READ_ONCE(ctx->stopped) || lstp_channel_disconnected(ctx->ch);
+}
+
+static inline bool lstp_ipmi_readable(struct lstp_ipmi_ctx *ctx)
+{
+	return !kfifo_is_empty(&ctx->fifo) || lstp_ipmi_gone(ctx);
+}
+
+/* Partial-init safe: a failed lstp_ipmi_init() unwinds through it as well. */
+static void lstp_ipmi_ctx_release(struct kref *ref)
+{
+	struct lstp_ipmi_ctx *ctx = container_of(ref, struct lstp_ipmi_ctx, ref);
+	struct lstp_channel *ch = ctx->ch;
+
+	kfifo_free(&ctx->fifo);
+	if (ctx->ida_id >= 0)
+		ida_free(&lstp_ipmi_ida, ctx->ida_id);
+	kfree(ctx->miscdev.name);
+	mutex_destroy(&ctx->tx_lock);
+	kfree(ctx);
+	lstp_channel_put(ch);
+}
+
+/* Devres action for the bind's reference, booked ahead of the node's own. */
+static void lstp_ipmi_ctx_put(void *data)
+{
+	struct lstp_ipmi_ctx *ctx = data;
+
+	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
+}
+
+static inline struct lstp_ipmi_ctx *to_ctx(struct file *file)
+{
+	return container_of(file->private_data, struct lstp_ipmi_ctx, miscdev);
+}
+
+static int lstp_ipmi_open(struct inode *inode, struct file *file)
+{
+	struct lstp_ipmi_ctx *ctx = to_ctx(file);
+	int ret = 0;
+
+	spin_lock_irq(&ctx->lock);
+	if (lstp_ipmi_gone(ctx))
+		ret = -ENODEV;
+	else if (ctx->running)
+		ret = -EBUSY;
+	else
+		ctx->running = true;
+	spin_unlock_irq(&ctx->lock);
+
+	if (ret)
+		return ret;
+
+	/*
+	 * misc_mtx spans this ->open and misc_deregister(), which the bind's
+	 * @ref outlasts, so @ctx is live here and this cannot race the final put.
+	 */
+	kref_get(&ctx->ref);
+	return 0;
+}
+
+/* Read one queued request: the userspace header, then the payload. */
+static ssize_t lstp_ipmi_read(struct file *file, char __user *buf, size_t count, loff_t *ppos)
+{
+	struct lstp_ipmi_ctx *ctx = to_ctx(file);
+	struct ipmi_lstp_msg msg;
+	unsigned long flags;
+	unsigned int len = 0;
+	size_t ulen = 0;
+
+	/*
+	 * copy_to_user() may sleep, so drain to @msg under @ctx->lock first.
+	 * Loop: two readers on one fd can both wake, only one wins the record.
+	 */
+	while (!len) {
+		/* Before the queue: a request queued when the bind went cannot be answered. */
+		if (lstp_ipmi_gone(ctx))
+			return -ENODEV;
+		if (kfifo_is_empty(&ctx->fifo)) {
+			if (file->f_flags & O_NONBLOCK)
+				return -EAGAIN;
+			int ret = wait_event_interruptible(ctx->req_wq, lstp_ipmi_readable(ctx));
+
+			if (ret)
+				return ret;
+		}
+
+		spin_lock_irqsave(&ctx->lock, flags);
+		/*
+		 * Peek before consuming: kfifo_out() drops whatever of the
+		 * record does not fit, so a short @count would retire a
+		 * request the caller never saw. Leave it queued and let the
+		 * caller come back with room for it.
+		 */
+		len = kfifo_out_peek(&ctx->fifo, &msg, sizeof(msg));
+		ulen = len ? LSTP_IPMI_UAPI_HDR_LEN + msg.header.len : 0;
+		if (len && ulen <= count) {
+			kfifo_skip(&ctx->fifo);
+			WRITE_ONCE(ctx->read_tag, msg.header.msg_num);
+		}
+		spin_unlock_irqrestore(&ctx->lock, flags);
+
+		if (ulen > count)
+			return -EINVAL;
+	}
+
+	if (copy_to_user(buf, &msg.header, LSTP_IPMI_UAPI_HDR_LEN) ||
+	    copy_to_user(buf + LSTP_IPMI_UAPI_HDR_LEN, msg.payload, msg.header.len))
+		return -EFAULT;
+	return ulen;
+}
+
+/*
+ * Forward a response. A write whose @msg_num misses the outstanding tag is
+ * dropped and reported as consumed, so userspace need not track the race
+ * against a request that arrived meanwhile. Without the tag in the ABI, a
+ * response answers the request read() handed out last.
+ */
+static ssize_t lstp_ipmi_write(struct file *file, const char __user *buf, size_t count,
+			       loff_t *ppos)
+{
+	struct lstp_ipmi_ctx *ctx = to_ctx(file);
+	struct lstp_channel *ch = ctx->ch;
+	struct ipmi_lstp_msg msg;
+	ssize_t ret;
+
+	if (count < LSTP_IPMI_UAPI_HDR_LEN || count > LSTP_IPMI_UAPI_MSG_MAX)
+		return -EINVAL;
+
+	/* The untagged bound admits struct padding past the payload; drop it. */
+	if (copy_from_user(&msg.header, buf, LSTP_IPMI_UAPI_HDR_LEN) ||
+	    copy_from_user(msg.payload, buf + LSTP_IPMI_UAPI_HDR_LEN,
+			   min(count - LSTP_IPMI_UAPI_HDR_LEN, sizeof(msg.payload))))
+		return -EFAULT;
+
+	/* Held through the send; see lstp_ipmi_stop_and_deregister(). */
+	guard(mutex)(&ctx->tx_lock);
+	if (lstp_ipmi_gone(ctx))
+		return -ENODEV;
+
+	if (!LSTP_IPMI_MSG_NUM)
+		msg.header.msg_num = READ_ONCE(ctx->read_tag);
+
+	/*
+	 * 0 tags no request; it is only @msg_count's value before the first.
+	 * Stale tag read is fine; pairs with WRITE_ONCE in the IRQ producer.
+	 */
+	if (!msg.header.msg_num || msg.header.msg_num != READ_ONCE(ctx->msg_count))
+		return count;
+
+	if (!msg.header.len || msg.header.len > IPMI_LSTP_PAYLOAD_MAX ||
+	    count < LSTP_IPMI_UAPI_HDR_LEN + msg.header.len)
+		return -EINVAL;
+
+	ret = lstp_send(ch, LSTP_IPMI_CMD_MESSAGE, msg.payload, msg.header.len);
+	if (ret && ret != -ENODEV)
+		dev_err_ratelimited(ch->dev, "%s: ch_%d: Could not forward response (%pe)\n",
+				    __func__, ch->ch_id, ERR_PTR(ret));
+
+	return (ret < 0) ? ret : count;
+}
+
+static int lstp_ipmi_release(struct inode *inode, struct file *file)
+{
+	struct lstp_ipmi_ctx *ctx = to_ctx(file);
+
+	spin_lock_irq(&ctx->lock);
+	ctx->running = false;
+	spin_unlock_irq(&ctx->lock);
+
+	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
+
+	return 0;
+}
+
+static __poll_t lstp_ipmi_poll(struct file *file, poll_table *wait)
+{
+	struct lstp_ipmi_ctx *ctx = to_ctx(file);
+
+	poll_wait(file, &ctx->req_wq, wait);
+	if (lstp_ipmi_gone(ctx))
+		return EPOLLHUP;
+	if (!kfifo_is_empty(&ctx->fifo))
+		return EPOLLIN | EPOLLRDNORM;
+
+	return 0;
+}
+
+static const struct file_operations lstp_ipmi_fops = {
+	.owner = THIS_MODULE,
+	.open = lstp_ipmi_open,
+	.read = lstp_ipmi_read,
+	.write = lstp_ipmi_write,
+	.release = lstp_ipmi_release,
+	.poll = lstp_ipmi_poll,
+};
+
+/*
+ * @stopped before the wake: this runs ahead of the framework's fence action, so
+ * a reader woken without it would find nothing changed and sleep again. The
+ * empty @tx_lock section then waits out a write() that tested @stopped before
+ * it went up, so no response is sent once the unwind moves on; a send is
+ * bounded by the USB timeout.
+ */
+static void lstp_ipmi_stop_and_deregister(void *data)
+{
+	struct lstp_ipmi_ctx *ctx = data;
+
+	misc_deregister(&ctx->miscdev);
+	WRITE_ONCE(ctx->stopped, true);
+	wake_up_all(&ctx->req_wq);
+	scoped_guard(mutex, &ctx->tx_lock) {
+	}
+}
+
+/*
+ * ops->irq_packet. Requests are never NACKed, so drop-oldest is the whole
+ * flow-control policy.
+ */
+static void lstp_ipmi_irq_callback(struct lstp_channel *ch, struct lstp_packet *pkt)
+{
+	struct lstp_ipmi_ctx *ctx = ch->priv;
+	u16 rx_len = le16_to_cpu(pkt->hdr.length);
+	struct ipmi_lstp_msg msg;
+	unsigned long flags;
+	unsigned int dropped = 0;
+
+	if (rx_len < IPMI_MIN_MSG_LEN || rx_len > IPMI_LSTP_PAYLOAD_MAX) {
+		dev_warn_ratelimited(ch->dev, "%s: ch_%d: Invalid IPMI request length %u\n",
+				     __func__, ch->ch_id, rx_len);
+		return;
+	}
+
+	unsigned int msg_size = sizeof(msg.header) + rx_len;
+
+	msg.header.len = rx_len;
+	memcpy(msg.payload, pkt->payload, rx_len);
+
+	spin_lock_irqsave(&ctx->lock, flags);
+	/*
+	 * Skip 0 on wrap: it is the initial value, meaning nothing outstanding,
+	 * so no request may carry it. Pairs with the READ_ONCE in write().
+	 */
+	u8 tag = ctx->msg_count + 1;
+
+	msg.header.msg_num = tag ?: 1;
+	WRITE_ONCE(ctx->msg_count, msg.header.msg_num);
+	while (kfifo_avail(&ctx->fifo) < msg_size) {
+		kfifo_skip(&ctx->fifo);
+		dropped++;
+	}
+	kfifo_in(&ctx->fifo, &msg, msg_size);
+	spin_unlock_irqrestore(&ctx->lock, flags);
+
+	if (dropped)
+		dev_warn_ratelimited(ch->dev, "%s: ch_%d: FIFO full, dropped %u stale request(s)\n",
+				     __func__, ch->ch_id, dropped);
+
+	wake_up_all(&ctx->req_wq);
+}
+
+/*
+ * Build this bind's context and its "ipmi-lstpN" node name. An fd held across
+ * the unbind keeps the context, and with it the number, until it closes; the
+ * next bind takes the lowest number free.
+ */
+static int lstp_ipmi_init(struct lstp_channel *ch, const struct lstp_channel_init_info *info)
+{
+	struct lstp_ipmi_ctx *ctx = kzalloc_obj(*ctx);
+
+	if (!ctx)
+		return -ENOMEM;
+
+	kref_init(&ctx->ref);
+	ctx->ida_id = -1;
+	ctx->ch = lstp_channel_get(ch);
+	spin_lock_init(&ctx->lock);
+	mutex_init(&ctx->tx_lock);
+	init_waitqueue_head(&ctx->req_wq);
+
+	int ret = kfifo_alloc(&ctx->fifo, BUFFER_SIZE, GFP_KERNEL);
+
+	if (ret)
+		goto err_put;
+
+	ret = ida_alloc(&lstp_ipmi_ida, GFP_KERNEL);
+	if (ret < 0)
+		goto err_put;
+	ctx->ida_id = ret;
+	ctx->miscdev.name = kasprintf(GFP_KERNEL, "ipmi-lstp%d", ctx->ida_id);
+	if (!ctx->miscdev.name) {
+		ret = -ENOMEM;
+		goto err_put;
+	}
+
+	if (fwnode_property_present(ch->fwnode, "label"))
+		dev_notice_once(ch->dev,
+				"%s: ch_%d: Firmware \"label\" no longer names the node, which is %s; use a udev symlink for a stable name\n",
+				__func__, ch->ch_id, ctx->miscdev.name);
+
+	ctx->miscdev.minor = MISC_DYNAMIC_MINOR;
+	ctx->miscdev.fops = &lstp_ipmi_fops;
+	ctx->miscdev.parent = ch->dev;
+
+	ch->priv = ctx;
+	dev_dbg(ch->dev, "%s: ch_%d: Initialized as %s\n", __func__, ch->ch_id, ch->display_name);
+	return 0;
+
+err_put:
+	kref_put(&ctx->ref, lstp_ipmi_ctx_release);
+	return ret;
+}
+
+static int lstp_ipmi_start(struct lstp_channel *ch, struct lstp_ipmi_ctx *ctx)
+{
+	int ret = misc_register(&ctx->miscdev);
+
+	if (ret) {
+		dev_err(ch->dev, "%s: ch_%d: Could not register miscdevice (%pe)\n", __func__,
+			ch->ch_id, ERR_PTR(ret));
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(ch->dev, lstp_ipmi_stop_and_deregister, ctx);
+	if (ret)
+		return ret;
+
+	dev_info(ch->dev, "%s: ch_%d: Started as %s\n", __func__, ch->ch_id, ch->display_name);
+	return 0;
+}
+
+static int lstp_ipmi_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
+{
+	struct lstp_channel *ch = lstp_channel_from_auxdev(auxdev);
+	const struct lstp_channel_init_info *info = dev_get_platdata(&auxdev->dev);
+
+	if (!info)
+		return -ENODEV;
+
+	int ret = lstp_ipmi_init(ch, info);
+
+	if (ret)
+		return ret;
+
+	/* Booked first, so it unwinds after the node's deregister action. */
+	ret = devm_add_action_or_reset(ch->dev, lstp_ipmi_ctx_put, ch->priv);
+	if (ret)
+		return ret;
+
+	return lstp_ipmi_start(ch, ch->priv);
+}
+
+static const struct lstp_ops lstp_ipmi_ops = {
+	.irq_packet = lstp_ipmi_irq_callback,
+};
+
+static const struct auxiliary_device_id lstp_ipmi_id_table[] = { { .name = "lstp.ipmi" }, {} };
+MODULE_DEVICE_TABLE(auxiliary, lstp_ipmi_id_table);
+
+static struct lstp_auxiliary_driver lstp_ipmi_drv = {
+	.adrv = {
+		.name = "ipmi",
+		.probe = lstp_ipmi_probe,
+		.id_table = lstp_ipmi_id_table,
+	},
+	.ops = &lstp_ipmi_ops,
+};
+module_lstp_auxiliary_driver(lstp_ipmi_drv);
+
+MODULE_IMPORT_NS("LSTP");
+MODULE_DESCRIPTION("LSTP BMC-side IPMI driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

