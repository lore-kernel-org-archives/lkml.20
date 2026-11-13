Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794579095;
	b=YSI5nHCftw7ouq7lHdZkM3+UJkFinJX+df9WEcC7H53VrjJ45R4wzR4Mjrgmy4n5ncGk
	 O7daiCX+/QbSwcdAyDIvuDUG3EOqO7zwhVPEE9itCQDtJe8NBQFy1jKM1Yh+/yaSZewUl
	 CITyvQumWhBZLP2vBMb1+gHi9Rz7w6FSgVQHoAFjXSK9mqlsQyptJ2o2ZRl3LdIa/TEez
	 4nMiN+MUalbK7eCc/2dPM6ojzaWQQe1j3zhQWSp5YlIz3xAOjGnEa4HVYX/DqUL4ETplr
	 n2FNIff+xzYHFaszpbJvLhctFhTMr44ZbZaBOHZ6LzzbvDXff+q+Y4DY3jETj8jlteg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794579095;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
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
	bh=PzEYo8D5KskH8A8VsNYN4FtMMLbGzH7ot313BY8F7v4=;
	b=0ZNjn7rv70ut03yIH2z82H7rrX5emfi9HSgkd1eamq9pR7J72Xa284mGcAlkhkkhRP+Q
	 ip9knfHZaQiGeUS7ZFvYG41SHfvYZZ+qBTBa7SjyoKtG58n9g8aZuNEc38hnBNF5aXfiv
	 b7up6K8PSuxQs4W8yC/rurpjqQ6u0eZ+o2T4YIboTSfzUBGxXc4vCjXf264hliW1uhdOT
	 UMLCLZ5YWtM2EEdTWHFlRlilN/8V0oFDVYuQMSOKZOhauT2QaErGC2muiJJBiSIlcm0ly
	 QiG+O6o81aCL8+80YdOHEuxnklkrVeKdNlJUOThQh1lzbsWtw1WZapl6RsWHS/50ZQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.111
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022111.outbound.protection.outlook.com [40.107.75.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0454606A327;
	Fri, 13 Nov 2026 14:11:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0454606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1JgOGOKSvNjH8uwgfTGcmSnt5b3QLqGPGNW98SG4onqnP6pz7rHD3cyaDXbiP12vo3SE7w0N76+0ijAlfEd9VJOkiqknV5or/HCL2Pv4ObN1KGQe5fCUVizlHft1sdWTnR37CKgZBvHwlx7brYQcthX+plCP7dYii5Mezxae/YbhvruqVh8mtIbOH7jflp7Tx4uPb1i8tZ4Q79Rdd94caVjiUxTSAMcg59U9qnQ7ItV3JqBQCDuVE0WXo9vBUS47W6BOrEbYDhU1eT/7skwXx1j/j+UVfeFWxTIn0RRq8iZzy2jxarsCJrODANHhLfeaohibn5pAJtLr0aM8seVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzEYo8D5KskH8A8VsNYN4FtMMLbGzH7ot313BY8F7v4=;
 b=TNu4agNHuoMryErGGdu0Sow/UN6rZsnnOL7AHrQOBCLcs1BeTYfXrwEs4yamerJBPr+hI5klpSHwZMxXRIt23k19PyH2yPF7Tp9ktasxRKao95gI4zF7E5hyuXZg61XK+HEQC/vRT6a27bWRgo4h2/9bDUaZ4uVG14PQKk4ABg26IAPokx0oYRB89u56vBZxcPsb/wZX8H327Jk4Cmc6Co7sW/IkSqXyA0ogWD2bfUNfcF+qYvUxqctgncjDBOrgQbtTah9zyNEKxaSzSF70IZdLtoHsIxyzjcfZ7UfpQRzflZt4jxmS7OkqX58xNUSXCZ+ktOvL3joLEy5uztimhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR02CA0011.apcprd02.prod.outlook.com (2603:1096:4:295::18)
 by SEZPR06MB5200.apcprd06.prod.outlook.com (2603:1096:101:74::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Fri, 13 Nov
 2026 14:11:29 +0000
Received: from SG1PEPF000082E1.apcprd02.prod.outlook.com
 (2603:1096:4:295:cafe::69) by SI3PR02CA0011.outlook.office365.com
 (2603:1096:4:295::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 14:11:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E1.mail.protection.outlook.com (10.167.240.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 14:11:26 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 685265077DF0;
	Fri, 13 Nov 2026 20:53:04 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v4 2/2] usb: typec: add CIX Type-C PD controller driver
Date: Fri, 13 Nov 2026 20:53:04 +0800
Message-ID: <20261113125304.1693911-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261113125304.1693911-1-gary.yang@cixtech.com>
References: <20261113125304.1693911-1-gary.yang@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E1:EE_|SEZPR06MB5200:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7b10bb14-0d93-4412-1157-08df41900263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|261028144727099003|10067099003|5023799004|56012099006|261022075727099003|261021130227099003|261021123027099003|261022113327099003|261022115727099003|261021133027099003|261022105027099003|261026140227099003|261026130827099003|261021121427099003|261026121527099003|261021135927099003|261026135527099003|261102123227099003|261009223027099003|18092099006|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rU27xr9muOH7WRPcBsnimfOdOVg+ygtSmC+xxrctNYqXKw4zzJpzZtIL39VEnkLSETwm4fb1oVOkvGadUHFia2ryF6jWoIX7Br9WYjEVu4dMTLUrp7sBEwJizgFlzOsLfC/Uwf2UMIhfEnBHDZtq4o+JksGb+rx8i+plLtBh625A3Vmgf8SciRzbdTyegtnqWQJDsEwqPlELv8VbMNNaawjfHt8aFkCMp+TMiEg+XBG19E/Y10RAnxvI4UO+sKqkofGo81MZOAvDIU5W0YbYwV8sHoGn1uru9fsRZ35q3cdf9t6ocDTZFhYH9hxudqiN2pNDMyFjIo2s6X9nqRhYSK8t6ZcMxJWKoUC3e1mskJ/avQq7GI82IqPHlWO+ZEVl4aJMBVcgv/zpHGue6kYFYKmJCEpfN6vzqeKSWBZepxLJhUaevz/qi0Tq3e2IOviXTTMIPh/tuwfZbd+klg4p06wjV1xXf2zgS2Ndq/9KSEKNfHCBEhWcrHWdxc3mGmgi0L8SDKNqEmBNPpzZ5Yv1/6lfwHJApMKyK6MErBKqpDzciGpRZURMUuv4NhGhD+UZzEEg96OmmfwmfJTK3ZXslJqaX0eueyyuTCA0FOKhrpPtF8eXXylV9rP4OVJOY1UoNSwbAHCV/lmVSSqjaNVC5J4MoGz/W10B2z/90ACWMpgfkDmwnlQLMJPSq9UCBcyivkZ11banS2NijmTXH+I7cA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(261028144727099003)(10067099003)(5023799004)(56012099006)(261022075727099003)(261021130227099003)(261021123027099003)(261022113327099003)(261022115727099003)(261021133027099003)(261022105027099003)(261026140227099003)(261026130827099003)(261021121427099003)(261026121527099003)(261021135927099003)(261026135527099003)(261102123227099003)(261009223027099003)(18092099006)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7aLbcAhveMlanTczpBJ762CANAVKauUUcZz/LsufFN488e45Vl8cOy3aKqVP3CcDcClGiB/UW/Fiz4b9cjXRm2nz36+Q3uAXYcHWjZbMNJ8WA3za9MUUF42Z+m84x5zA+iMnTvgfCD/ybH/jnvD/ZPL8d7i6O/LkOKRZ/KlNiKMsJ/3Z+Ivc7HcJDmdGh0TmLExZ2TMLy8W0iG3PW3AGMqqMXdjvLCPVYerUx/2ovilhEPWdIsJXdqYDGB+Ur9CP48eKftKFDpbU456FD4AxG9OehYCIZHqT/jjQBWlZk1a22YBpjvO/WylkO+gxT3o6JMg6qKt/X3s5ZZxvKyglHYn/fkL8XwScGcAytPeWrR5Pu/XsCxkK4OZjVxGGE1xYKwvKOr64fMceESZXu/QYwoG9jhM7rFz+lYTHjGhcmGbq8quuGLTDCK1g30YTlgoH
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 14:11:26.3267
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b10bb14-0d93-4412-1157-08df41900263
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5200

Add a driver for the CIX Type-C PD controller, which is connected over
I2C and reports power, data and plug orientation changes through a
level-triggered interrupt. The Realtek RTS5453H is the first supported
device.

The controller runs the Type-C and PD state machines in firmware and
exposes the current port status over I2C. The driver translates that
into Type-C class notifications, driving the orientation switch and
mode mux registered by the platform PHY for the DisplayPort alternate
mode. It also drives the platform USB role switch so that the USB
controller follows the negotiated data role.

The platform wires several controller instances to one shared
level-triggered interrupt line, and the controller has no per-instance
pending bit. Each instance acknowledges its own interrupt and reports
IRQ_NONE when the port status did not change since the last report, so
the interrupt core can attribute the interrupt and can disable a line
that a controller keeps asserted without ever clearing it. Reporting
IRQ_HANDLED unconditionally would turn such a line into an
uninterruptible interrupt storm.

The interrupt handler accesses the controller over I2C, so the
interrupt is disabled for the whole system sleep and re-enabled only
after the I2C adapter has resumed. The core re-enables the line in
resume_device_irqs() before the adapter is resumed, which would
otherwise let the handler access a suspended bus.

The DisplayPort alternate mode is entered by the controller firmware,
so the driver reports it as active only once an alternate mode driver
is bound to the mode device: typec_altmode_update_active() takes a
module reference only when a driver is bound, and reporting the mode
earlier would unbalance that reference when the mode is deactivated.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                |   7 +
 drivers/usb/typec/Kconfig  |  13 +
 drivers/usb/typec/Makefile |   1 +
 drivers/usb/typec/cix_pd.c | 768 +++++++++++++++++++++++++++++++++++++
 4 files changed, 789 insertions(+)
 create mode 100644 drivers/usb/typec/cix_pd.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..bd99313bf91d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6522,6 +6522,13 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX USB TYPE-C PD CONTROLLER
+M:	Gary Yang <gary.yang@cixtech.com>
+L:	linux-usb@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
+F:	drivers/usb/typec/cix_pd.c
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2f80c2792dbd..4d62f5deeeba 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -110,6 +110,19 @@ config TYPEC_WUSB3801
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called wusb3801.ko.
 
+config TYPEC_CIX_PD
+	tristate "CIX Type-C PD controller driver"
+	depends on I2C
+	depends on USB_ROLE_SWITCH
+	depends on ARCH_CIX || COMPILE_TEST
+	select REGMAP_I2C
+	help
+	  Say Y or M here if your system has a CIX Type-C PD controller.
+	  This driver currently supports the Realtek RTS5453H controller.
+
+	  If you choose to build this driver as a dynamically linked module, the
+	  module will be called cix_pd.ko.
+
 source "drivers/usb/typec/mux/Kconfig"
 
 source "drivers/usb/typec/altmodes/Kconfig"
diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 8a6a1c663eb6..bb3f3139fd7e 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -11,4 +11,5 @@ obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
 obj-$(CONFIG_TYPEC_STUSB160X) 	+= stusb160x.o
 obj-$(CONFIG_TYPEC_RT1719)	+= rt1719.o
 obj-$(CONFIG_TYPEC_WUSB3801)	+= wusb3801.o
+obj-$(CONFIG_TYPEC_CIX_PD)	+= cix_pd.o
 obj-$(CONFIG_TYPEC)		+= mux/
diff --git a/drivers/usb/typec/cix_pd.c b/drivers/usb/typec/cix_pd.c
new file mode 100644
index 000000000000..b413a125c7e6
--- /dev/null
+++ b/drivers/usb/typec/cix_pd.c
@@ -0,0 +1,768 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 Cix Technology Group Co., Ltd.
+ *
+ * Driver for the CIX Type-C PD controller.
+ */
+
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/string.h>
+#include <linux/usb/role.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+
+#define RTS_DATA_CONTROL			0x50
+#define I2C_INT_ACK_BIT				BIT(2)
+#define HPD_IRQ_ACK					BIT(5)
+#define RTS_DATA_STATUS				0x5F
+/* byte 1 */
+#define CONNECTION_ORIENTATION		BIT(1)
+#define USB2_CONNECTION				BIT(4)
+#define USB3_2_CONNECTION			BIT(5)
+#define USB_DATA_ROLE				BIT(7)
+/* byte 2 */
+#define DP_CONNECTION				BIT(0)
+#define DP_SOURCE_SINK				BIT(1)
+#define DEBUG_ACCESSORY_ATTACHED	BIT(4)
+#define HPD_IRQ						BIT(6)
+#define HPD_STATE					BIT(7)
+/* byte 3 */
+#define POWER_SOURCE				BIT(0)
+#define POWER_SINK					BIT(1)
+#define POWER_MASK					3
+
+#define DATA_STATUS_COUNT			6
+
+struct cix_pd {
+	struct device *dev;
+	struct regmap *regmap;
+	struct mutex lock; /* device lock */
+	struct mutex irq_lock; /* protects IRQ state transitions */
+	int id;
+	int irq;
+	u8 data_status[DATA_STATUS_COUNT];
+	u8 prev_status[DATA_STATUS_COUNT];
+	bool status_valid;
+	struct typec_displayport_data dp_data;
+	struct typec_mux_state state;
+	struct typec_capability caps;
+	struct typec_mux *mux;
+	struct usb_role_switch *role_sw;
+	struct typec_altmode *port_altmode;
+	struct typec_altmode *partner_altmode;
+	struct typec_port *port;
+	enum usb_role role;
+	unsigned long mode;
+	u32 hpd_status;
+	struct typec_partner	*partner;
+	struct typec_partner_desc desc;
+	bool wake_enabled;
+	bool irq_disabled;
+};
+
+static int cix_pd_block_read(struct cix_pd *rts, u8 reg, void *val, size_t len)
+{
+	return regmap_bulk_read(rts->regmap, reg, val, len);
+}
+
+static int cix_pd_block_write(struct cix_pd *rts, u8 reg,
+			      const void *val, size_t len)
+{
+	return regmap_bulk_write(rts->regmap, reg, val, len);
+}
+
+static const struct regmap_config cix_pd_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 0x7F,
+};
+
+static const char *const dp_only_mode = "Alt Mode:DP";
+static const char *const dp_usb_mode = "Alt Mode:DP + USB";
+static const char *const usb_mode = "Alt Mode:USB";
+
+static const char *const power_source = "power source";
+static const char *const power_sink = "power sink";
+
+static const char *const orientation_normal = "orientation normal";
+static const char *const orientation_reverse = "orientation reverse";
+
+static const char *const data_host = "usb host";
+static const char *const data_device = "usb device";
+
+static const char *cix_pd_pwr_role_str(const struct cix_pd *rts)
+{
+	switch (rts->data_status[3] & POWER_MASK) {
+	case POWER_SOURCE:
+		return power_source;
+	case POWER_SINK:
+		return power_sink;
+	default:
+		return "unknown";
+	}
+}
+
+/*
+ * The controller negotiates the DisplayPort alternate mode autonomously,
+ * so the capabilities below describe the fixed set supported by the
+ * platform DP output: a receptacle exposing DFP_D with pin assignments
+ * C, D and E.
+ */
+#define CIX_PD_DP_PIN_ASSIGN	(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D) | \
+				 BIT(DP_PIN_ASSIGN_E))
+
+static const struct typec_altmode_desc cix_pd_dp_port_altmode = {
+	.svid = USB_TYPEC_DP_SID,
+	.mode = USB_TYPEC_DP_MODE,
+	.vdo = DP_CAP_DFP_D | DP_CAP_RECEPTACLE |
+	       (CIX_PD_DP_PIN_ASSIGN << 8),
+};
+
+static const struct typec_altmode_desc cix_pd_dp_partner_altmode = {
+	.svid = USB_TYPEC_DP_SID,
+	.mode = USB_TYPEC_DP_MODE,
+	.vdo = DP_CAP_UFP_D | DP_CAP_RECEPTACLE |
+	       (CIX_PD_DP_PIN_ASSIGN << 16),
+	.mode_selection = true,
+};
+
+static int cix_pd_typec_port_update(struct cix_pd *typec, bool force)
+{
+	struct typec_displayport_data *dp_data = &typec->dp_data;
+	enum typec_orientation orientation;
+	enum usb_role role;
+	bool usb2, usb3, dp, connected, dev_role;
+	int ret, err;
+
+	usb2 = typec->data_status[1] & USB2_CONNECTION;
+	usb3 = typec->data_status[1] & USB3_2_CONNECTION;
+	dp = typec->data_status[2] & DP_CONNECTION;
+
+	/*
+	 * Debug accessories are not supported, so they are reported as
+	 * disconnected instead of being passed on to the framework.
+	 */
+	if (typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED) {
+		dev_err(typec->dev,
+			"debug accessory mode not supported, try another usb cable\n");
+		connected = false;
+	} else {
+		connected = usb2 || usb3 || dp;
+	}
+
+	if (!connected)
+		orientation = TYPEC_ORIENTATION_NONE;
+	else if (typec->data_status[1] & CONNECTION_ORIENTATION)
+		orientation = TYPEC_ORIENTATION_REVERSE;
+	else
+		orientation = TYPEC_ORIENTATION_NORMAL;
+
+	ret = typec_set_orientation(typec->port, orientation);
+	if (ret)
+		return ret;
+
+	/*
+	 * The controller reports the data role whenever a cable is attached,
+	 * including DisplayPort-only configurations where no USB data role is
+	 * available. Keep the port's data role in sync independently of the
+	 * USB role switch.
+	 */
+	dev_role = typec->data_status[1] & USB_DATA_ROLE;
+	if (connected)
+		typec_set_data_role(typec->port,
+				    dev_role ? TYPEC_DEVICE : TYPEC_HOST);
+
+	if (!connected || !(usb2 || usb3))
+		role = USB_ROLE_NONE;
+	else if (dev_role)
+		role = USB_ROLE_DEVICE;
+	else
+		role = USB_ROLE_HOST;
+
+	if (force || typec->role != role) {
+		err = 0;
+		if (typec->role_sw) {
+			err = usb_role_switch_set_role(typec->role_sw, role);
+			if (err)
+				dev_err(typec->dev,
+					"typec port(%d): failed to set USB role: %d\n",
+					typec->id, err);
+		}
+
+		/* Only cache the role once the switch accepted it. */
+		if (!err)
+			typec->role = role;
+	}
+
+	if ((typec->data_status[3] & POWER_MASK) == POWER_SOURCE) {
+		typec_set_pwr_role(typec->port, TYPEC_SOURCE);
+	} else if ((typec->data_status[3] & POWER_MASK) == POWER_SINK) {
+		typec_set_pwr_role(typec->port, TYPEC_SINK);
+	} else {
+		dev_dbg(typec->dev, "typec port(%d): unknown power state %d\n",
+			typec->id, typec->data_status[3]);
+	}
+
+	if (!connected) {
+		if (typec->partner_altmode) {
+			typec_altmode_update_active(typec->partner_altmode,
+						    false);
+			typec_unregister_altmode(typec->partner_altmode);
+			typec->partner_altmode = NULL;
+		}
+		if (typec->partner) {
+			dev_info(typec->dev, "typec port(%d): unregister partner\n",
+				 typec->id);
+			typec_unregister_partner(typec->partner);
+			typec->partner = NULL;
+		}
+	} else {
+		if (!typec->partner) {
+			dev_info(typec->dev, "typec port(%d): register partner\n",
+				 typec->id);
+			typec->partner = typec_register_partner(typec->port,
+								&typec->desc);
+			if (IS_ERR(typec->partner)) {
+				dev_err(typec->dev,
+					"typec port(%d): failed to register partner: %ld\n",
+					typec->id, PTR_ERR(typec->partner));
+				typec->partner = NULL;
+			}
+		}
+
+		if (typec->partner_altmode && !dp) {
+			typec_altmode_update_active(typec->partner_altmode,
+						    false);
+			typec_unregister_altmode(typec->partner_altmode);
+			typec->partner_altmode = NULL;
+		}
+
+		if (typec->partner && dp && !typec->partner_altmode) {
+			typec->partner_altmode =
+				typec_partner_register_altmode(typec->partner,
+							       &cix_pd_dp_partner_altmode);
+			if (IS_ERR(typec->partner_altmode)) {
+				dev_err(typec->dev,
+					"typec port(%d): failed to register DP altmode: %ld\n",
+					typec->id,
+					PTR_ERR(typec->partner_altmode));
+				typec->partner_altmode = NULL;
+			}
+		}
+
+		/*
+		 * typec_altmode_update_active() takes a reference to the
+		 * alternate mode driver's module only when a driver is bound
+		 * to the mode device. Reporting the mode as active without a
+		 * driver would leave that reference unbalanced, and the later
+		 * deactivation would drop a reference that was never taken.
+		 * Report the mode only once a driver is bound, and retry on
+		 * the next status update so that a driver loaded after the
+		 * cable was attached still learns about the active mode.
+		 */
+		if (typec->partner_altmode &&
+		    device_is_bound(&typec->partner_altmode->dev))
+			typec_altmode_update_active(typec->partner_altmode, true);
+	}
+
+	dp_data->status = 0;
+	typec->state.data = NULL;
+	typec->state.alt = NULL;
+
+	/*
+	 * Only pass a DisplayPort state to the mux when the partner's
+	 * alternate mode was registered successfully.
+	 */
+	if (connected && dp && typec->partner_altmode) {
+		dp_data->status = DP_STATUS_ENABLED;
+		if (typec->data_status[2] & HPD_STATE)
+			dp_data->status |= DP_STATUS_HPD_STATE;
+		if (typec->data_status[2] & HPD_IRQ)
+			dp_data->status |= DP_STATUS_IRQ_HPD;
+
+		typec->state.data = dp_data;
+		typec->state.alt = typec->port_altmode;
+		typec->state.mode = usb3 ? TYPEC_DP_STATE_D :
+					   TYPEC_DP_STATE_E;
+	} else if (connected && (usb2 || usb3)) {
+		typec->state.mode = TYPEC_STATE_USB;
+	} else {
+		typec->state.mode = TYPEC_STATE_SAFE;
+	}
+
+	ret = typec_mux_set(typec->mux, &typec->state);
+	if (ret)
+		return ret;
+
+	if (typec->mode == typec->state.mode &&
+	    typec->hpd_status == dp_data->status)
+		return 0;
+
+	if (typec->state.mode == TYPEC_DP_STATE_D)
+		dev_info(typec->dev,
+			 "typec port(%d): alt mode(%s) orientation(%s), usb_data_role(%s), power role(%s), hpd_state(%d)\n",
+			 typec->id, dp_usb_mode,
+			 orientation == TYPEC_ORIENTATION_REVERSE ?
+			 orientation_reverse : orientation_normal,
+			 role == USB_ROLE_DEVICE ? data_device : data_host,
+			 cix_pd_pwr_role_str(typec),
+			 (int)(dp_data->status & DP_STATUS_HPD_STATE));
+	else if (typec->state.mode == TYPEC_DP_STATE_E)
+		dev_info(typec->dev,
+			 "typec port(%d): alt mode(%s) orientation(%s), power role(%s), hpd_state(%d)\n",
+			 typec->id, dp_only_mode,
+			 orientation == TYPEC_ORIENTATION_REVERSE ?
+			 orientation_reverse : orientation_normal,
+			 cix_pd_pwr_role_str(typec),
+			 (int)(dp_data->status & DP_STATUS_HPD_STATE));
+	else if (typec->state.mode == TYPEC_STATE_USB)
+		dev_info(typec->dev,
+			 "typec port(%d): alt mode(%s) orientation(%s), power role(%s), usb_data_role(%s)\n",
+			 typec->id, usb_mode,
+			 orientation == TYPEC_ORIENTATION_REVERSE ?
+			 orientation_reverse : orientation_normal,
+			 cix_pd_pwr_role_str(typec),
+			 role == USB_ROLE_DEVICE ? data_device : data_host);
+	else if (typec->state.mode == TYPEC_STATE_SAFE)
+		dev_info(typec->dev, "typec port(%d): disconnect state\n",
+			 typec->id);
+
+	typec->mode = typec->state.mode;
+	typec->hpd_status = dp_data->status;
+
+	return 0;
+}
+
+static void cix_pd_typec_init_state(struct cix_pd *typec)
+{
+	typec->state.alt = NULL;
+	typec->state.mode = TYPEC_STATE_SAFE;
+	typec->state.data = NULL;
+	typec->partner = NULL;
+	typec->desc.accessory = TYPEC_ACCESSORY_NONE;
+	/*
+	 * The data status registers only report the source/sink state, not
+	 * whether USB PD is being used, so the partner is not advertised as
+	 * PD capable.
+	 */
+	typec->desc.usb_pd = 0;
+}
+
+/*
+ * Returns 1 when the reported port state changed, 0 when it did not, and a
+ * negative error code when the controller could not be accessed.
+ */
+static int cix_pd_event_handler(struct cix_pd *rts, u8 clear_irq, bool force)
+{
+	int ret, err = 0;
+	bool changed;
+	u8 data_control[3] = {0};
+
+	mutex_lock(&rts->lock);
+	if (clear_irq) {
+		data_control[0] = 2;
+		data_control[1] = I2C_INT_ACK_BIT;
+		data_control[2] = 0;
+
+		ret = cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
+		if (ret)
+			goto i2c_err;
+	}
+
+	ret = cix_pd_block_read(rts, RTS_DATA_STATUS, rts->data_status, 6);
+	if (ret)
+		goto i2c_err;
+
+	dev_dbg(rts->dev,
+		"typec port(%d): data status = 0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
+		rts->id, rts->data_status[0], rts->data_status[1],
+		rts->data_status[2], rts->data_status[3], rts->data_status[4],
+		rts->data_status[5]);
+
+	/*
+	 * Only bytes 1..3 are decoded by this driver. Byte 0 and bytes 4..5
+	 * have no known meaning, so they are excluded from the comparison: a
+	 * change in an undecoded bit must not be reported as a port event.
+	 */
+	changed = !rts->status_valid ||
+		  memcmp(&rts->data_status[1], &rts->prev_status[1],
+			 DATA_STATUS_COUNT - 3);
+	memcpy(rts->prev_status, rts->data_status, DATA_STATUS_COUNT);
+	rts->status_valid = true;
+
+	err = cix_pd_typec_port_update(rts, force);
+	if (err)
+		dev_err(rts->dev, "typec port(%d): failed to update port: %d\n",
+			rts->id, err);
+
+	if (rts->data_status[2] & HPD_IRQ) {
+		data_control[0] = 2;
+		data_control[1] = 0;
+		data_control[2] = HPD_IRQ_ACK;
+		ret = cix_pd_block_write(rts, RTS_DATA_CONTROL, data_control, 3);
+		if (ret)
+			goto i2c_err;
+	}
+
+	mutex_unlock(&rts->lock);
+	return changed ? 1 : 0;
+
+i2c_err:
+	/*
+	 * Report the controller as unresponsive so the IRQ handler can tell
+	 * the interrupt core that this instance did not handle the event.
+	 */
+	dev_err(rts->dev, "typec port(%d): i2c transfer error = %d\n",
+		rts->id, ret);
+	mutex_unlock(&rts->lock);
+	return -ESHUTDOWN;
+}
+
+static int cix_pd_typec_parse_port_props(struct typec_capability *cap,
+					 struct fwnode_handle *fwnode,
+					 struct device *dev)
+{
+	int ret;
+
+	memset(cap, 0, sizeof(*cap));
+	ret = typec_get_fw_cap(cap, fwnode);
+	if (ret) {
+		/*
+		 * typec_get_fw_cap() stores a borrowed reference without
+		 * taking it, so it must not be dropped by the caller.
+		 */
+		cap->fwnode = NULL;
+		return dev_err_probe(dev, ret,
+				     "failed to parse connector properties\n");
+	}
+
+	cap->fwnode = fwnode_handle_get(fwnode);
+	cap->orientation_aware = true;
+	/* Alternate modes are entered and exited by the controller firmware. */
+	cap->no_mode_control = true;
+
+	return 0;
+}
+
+static int cix_pd_typec_get_handles(struct cix_pd *typec,
+				    struct fwnode_handle *fwnode,
+				    struct device *dev)
+{
+	int ret;
+
+	typec->mux = fwnode_typec_mux_get(fwnode);
+	if (IS_ERR(typec->mux))
+		return dev_err_probe(dev, PTR_ERR(typec->mux),
+				     "failed to get mux\n");
+
+	typec->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(typec->role_sw)) {
+		ret = PTR_ERR(typec->role_sw);
+		typec->role_sw = NULL;
+		typec_mux_put(typec->mux);
+		typec->mux = NULL;
+		return dev_err_probe(dev, ret,
+				     "failed to get USB role switch\n");
+	}
+
+	if (!typec->mux)
+		dev_dbg(dev, "mux not found\n");
+
+	return 0;
+}
+
+static void cix_pd_unregister_ports(struct cix_pd *typec)
+{
+	if (!IS_ERR_OR_NULL(typec->port)) {
+		typec->state.alt = NULL;
+		typec->state.mode = TYPEC_STATE_SAFE;
+		typec->state.data = NULL;
+		usb_role_switch_set_role(typec->role_sw, USB_ROLE_NONE);
+		typec_set_orientation(typec->port, TYPEC_ORIENTATION_NONE);
+		typec_mux_set(typec->mux, &typec->state);
+
+		if (typec->partner_altmode)
+			typec_altmode_update_active(typec->partner_altmode,
+						    false);
+		typec_unregister_altmode(typec->partner_altmode);
+		typec->partner_altmode = NULL;
+		typec_unregister_partner(typec->partner);
+		typec->partner = NULL;
+		typec_unregister_altmode(typec->port_altmode);
+		typec->port_altmode = NULL;
+
+		typec_unregister_port(typec->port);
+		typec->port = NULL;
+	}
+
+	usb_role_switch_put(typec->role_sw);
+	typec->role_sw = NULL;
+	typec_mux_put(typec->mux);
+	typec->mux = NULL;
+	fwnode_handle_put(typec->caps.fwnode);
+	typec->caps.fwnode = NULL;
+}
+
+static irqreturn_t cix_pd_irq_handle(int irq, void *data)
+{
+	struct cix_pd *rts = data;
+
+	/*
+	 * The Type-C ports of this platform are wired to one shared,
+	 * level-triggered interrupt line and the controller has no
+	 * per-instance pending bit, so the interrupt is attributed by
+	 * comparing the port status with the previously reported one. The
+	 * controller interrupt is acknowledged in any case, but an unchanged
+	 * status is reported as IRQ_NONE: if a sibling keeps the shared line
+	 * asserted without ever clearing its interrupt, the spurious
+	 * interrupt detector can then eventually disable the line instead of
+	 * leaving the system in an interrupt storm.
+	 */
+	if (cix_pd_event_handler(rts, 1, false) <= 0)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int cix_pd_init_ports(struct cix_pd *typec)
+{
+	struct device *dev = typec->dev;
+	struct typec_altmode_desc desc = cix_pd_dp_port_altmode;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = device_get_named_child_node(dev, "connector");
+	if (!fwnode)
+		return dev_err_probe(dev, -ENODEV, "no connector node found\n");
+
+	ret = cix_pd_typec_get_handles(typec, fwnode, dev);
+	if (ret)
+		goto out_put_fwnode;
+
+	ret = cix_pd_typec_parse_port_props(&typec->caps, fwnode, dev);
+	if (ret)
+		goto out_unregister_ports;
+
+	typec->port = typec_register_port(dev, &typec->caps);
+	if (IS_ERR(typec->port)) {
+		ret = PTR_ERR(typec->port);
+		typec->port = NULL;
+		dev_err_probe(dev, ret, "failed to register port\n");
+		goto out_unregister_ports;
+	}
+
+	desc.roles = typec->caps.data;
+	typec->port_altmode = typec_port_register_altmode(typec->port, &desc);
+	if (IS_ERR(typec->port_altmode)) {
+		ret = PTR_ERR(typec->port_altmode);
+		typec->port_altmode = NULL;
+		dev_err_probe(dev, ret, "failed to register DP altmode\n");
+		goto out_unregister_ports;
+	}
+
+	fwnode_handle_put(fwnode);
+
+	return 0;
+
+out_unregister_ports:
+	cix_pd_unregister_ports(typec);
+out_put_fwnode:
+	fwnode_handle_put(fwnode);
+	return ret;
+}
+
+static int cix_pd_probe(struct i2c_client *client)
+{
+	struct cix_pd *rts;
+	int ret;
+
+	rts = devm_kzalloc(&client->dev, sizeof(*rts), GFP_KERNEL);
+	if (!rts)
+		return -ENOMEM;
+
+	rts->dev = &client->dev;
+	rts->irq = client->irq;
+	mutex_init(&rts->lock);
+	mutex_init(&rts->irq_lock);
+	cix_pd_typec_init_state(rts);
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
+		return dev_err_probe(&client->dev, -ENODEV,
+				     "i2c check functionality failed\n");
+
+	rts->regmap = devm_regmap_init_i2c(client, &cix_pd_regmap_config);
+	if (IS_ERR(rts->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(rts->regmap),
+				     "failed to init regmap\n");
+
+	i2c_set_clientdata(client, rts);
+	rts->id = client->addr;
+
+	ret = cix_pd_init_ports(rts);
+	if (ret)
+		return ret;
+
+	/*
+	 * Acknowledge any interrupt the controller raised before the IRQ was
+	 * requested, so the shared line is not left asserted by this instance.
+	 */
+	ret = cix_pd_event_handler(rts, 1, false);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read initial status: %d\n", ret);
+		if (ret == -ESHUTDOWN)
+			ret = -EIO;
+		goto err_unregister_ports;
+	}
+
+	if (client->irq > 0) {
+		ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
+					   IRQF_SHARED | IRQF_ONESHOT,
+					   dev_name(&client->dev), rts);
+		if (ret) {
+			dev_err(&client->dev, "failed to request irq: %d\n", ret);
+			goto err_unregister_ports;
+		}
+	}
+
+	device_set_wakeup_capable(&client->dev, true);
+
+	return 0;
+
+err_unregister_ports:
+	cix_pd_unregister_ports(rts);
+	return ret;
+}
+
+static void cix_pd_remove(struct i2c_client *client)
+{
+	struct cix_pd *rts = i2c_get_clientdata(client);
+
+	if (rts->irq > 0) {
+		if (rts->wake_enabled) {
+			disable_irq_wake(rts->irq);
+			rts->wake_enabled = false;
+		}
+		free_irq(rts->irq, rts);
+	}
+
+	cix_pd_unregister_ports(rts);
+}
+
+static const struct of_device_id cix_pd_of_match[] = {
+	{ .compatible = "realtek,rts5453h", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cix_pd_of_match);
+
+static const struct i2c_device_id cix_pd_id[] = {
+	{ .name = "rts5453h" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, cix_pd_id);
+
+static int __maybe_unused cix_pd_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	int ret;
+
+	if (client->irq <= 0)
+		return 0;
+
+	mutex_lock(&rts->irq_lock);
+	if (rts->irq_disabled) {
+		mutex_unlock(&rts->irq_lock);
+		return 0;
+	}
+
+	/*
+	 * The threaded handler talks to the controller over I2C, so it must
+	 * not run once the adapter is suspended. The core re-enables the
+	 * interrupt in resume_device_irqs(), which runs before the adapter is
+	 * resumed, so the IRQ is kept disabled here and only re-enabled in
+	 * ->resume().
+	 */
+	disable_irq(client->irq);
+	rts->irq_disabled = true;
+
+	if (device_may_wakeup(dev)) {
+		ret = enable_irq_wake(client->irq);
+		if (ret) {
+			dev_err(dev, "failed to enable IRQ wake: %d\n", ret);
+			enable_irq(client->irq);
+			rts->irq_disabled = false;
+		} else {
+			rts->wake_enabled = true;
+		}
+	}
+	mutex_unlock(&rts->irq_lock);
+
+	return 0;
+}
+
+static int __maybe_unused cix_pd_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	int ret;
+
+	if (client->irq > 0) {
+		mutex_lock(&rts->irq_lock);
+		if (rts->wake_enabled) {
+			disable_irq_wake(client->irq);
+			rts->wake_enabled = false;
+		}
+		if (rts->irq_disabled) {
+			enable_irq(client->irq);
+			rts->irq_disabled = false;
+		}
+		mutex_unlock(&rts->irq_lock);
+	}
+
+	/* Force the USB role to be reprogrammed after system resume. */
+	ret = cix_pd_event_handler(rts, 0, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to refresh status: %d\n", ret);
+		if (ret == -ESHUTDOWN)
+			ret = -EIO;
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops cix_pd_pm_ops = {
+	.suspend = pm_sleep_ptr(cix_pd_suspend),
+	.resume = pm_sleep_ptr(cix_pd_resume),
+	.freeze = pm_sleep_ptr(cix_pd_suspend),
+	.thaw = pm_sleep_ptr(cix_pd_resume),
+	.poweroff = pm_sleep_ptr(cix_pd_suspend),
+	.restore = pm_sleep_ptr(cix_pd_resume),
+};
+
+static struct i2c_driver cix_pd_i2c_driver = {
+	.driver = {
+		.name = "rts5453h",
+		.of_match_table = cix_pd_of_match,
+		.pm = pm_ptr(&cix_pd_pm_ops),
+	},
+	.id_table = cix_pd_id,
+	.probe = cix_pd_probe,
+	.remove = cix_pd_remove,
+};
+
+module_i2c_driver(cix_pd_i2c_driver);
+MODULE_DESCRIPTION("CIX Type-C PD controller driver");
+MODULE_AUTHOR("Chao Zeng <Chao.Zeng@cixtech.com>");
+MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
+MODULE_LICENSE("GPL");
