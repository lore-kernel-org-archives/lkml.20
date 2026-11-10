Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794287851;
	b=kfhVQHpg+Ews4gjDAwaZ950+HwGYQ30lcFwc1j8AvmjNfJhnlk30tt4+QWsUkcWRY4ul
	 mUG9/83nJEUql2N0YWcaoudfJlBmxZZBR3uuDkpjT9J0yS6NAUPrLR/g2Qry7/bd6aPC9
	 rLEUsa5mk6LMQKY2ma0EOPcDiqZ+/y+gQ7X7w+fXx8a1w973Ry22bSjAx+YcH7Tqci1vw
	 b1SpIBaAlwIpu2muOAdmhXjihssgPjBodZ8QIeaWYCmE0Ig+f7Sd4Uinc7ylHCj/w2YvZ
	 pnqzgf7s+gwiP9HLfh8BDb/Rwwz1ZQyrDb1bK9I/5LiiAlyhXFeeLiikoBHvrLivqQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287851;
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
	bh=QtFC4bM+R/ZfHfCe+lfXK2GFUU+FSQZ3M7ghEDFdU2w=;
	b=T1NIwjMSGQoLCcnk8wc8O4BrJQ5oROW0wRxpt3oFB6rfyOH9aXsmYVyrPkKPfMDDXcof
	 OJZY7iHVud7EU60IIDJoGjyNcgRiMFkWJM61fd0G0AxaG+/6ljlWcVFunvECT8VfaIKst
	 Kt4rj9YgPXYfLrf33iFLK/QEAaPj+QyKti+mNzLMG3/o+6c+VTxb24ExYhZzlxDSqTums
	 rbAKw+jGVqx2Q23W+a2S4WrZKi/byx0rPTw33BwNa4Xmx7IaCaqh6SEFkVRmAgxNa/7M2
	 TZYsECCnhU/Zgl4qaBWPpBi3bGpVrg/F2RigzNjXhm2fm13a1R0Lv+jpFZBOjDdqZ2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.97
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023097.outbound.protection.outlook.com [52.101.127.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E99B606A31C;
	Tue, 10 Nov 2026 05:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E99B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBf1PyZp0wz5gorBFVt/rD0Bnw1rIO6YR7qxgPV1MpIfPx0FH2qC7LcHbJmxmqnNO7E9W9KE5NhKsFfG3JL+0HleU3HBQiQGt14xhqivJYPMMPZhATOht7MTgi5iIU+iHp+1N+xWzQ/p1w76A6pqo8+i0VMhntRNmHDDVu2GV5i+0lmupKieSb3uFoAAXj2in7kcRl8sybdHq5t2QiJYkDXFUOTfBigOdj7Vcvo/e88ooxTBErd7e2Bu3M+xdG02IJs1ZJXL3kAukEXCzgmAdPP1C276buXzkDsT8v3PvluYbojoOq2aBGF4S9OG9oFZx1KSKPbehWSHmRw5veCX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtFC4bM+R/ZfHfCe+lfXK2GFUU+FSQZ3M7ghEDFdU2w=;
 b=TsoJDsNN0JeKNqCmNKhu7f40BKe+6b5XE/5Id0fingytxrVsiE0/H4Bx1CrO07ym/HVsSiQxKVWwXj+yanndRt3G9IM6JwApKoWH01BoW4FtUQZ03xq5PGSnrc3GU3WSv/mY3isuU9sChZdvPQwy0552JAXqJ46O66FFEhQS4kQrF9YLlV3k5duH3Zjo+/8grLLOyGvTZBlhIy7ZrUPF5I0aaMuzwjH4SvfaY9FV3jGbK7qDj4z/Q1arm8KM8LSw3XMBDjab0RXCUToCY89i109Hc0DM+ZOvw3US4sjnWkMjCjUV7DgixhTSf6Ghb2fmWtiEPOCFykrYbZ2Q6kuefw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY6P301CA0022.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:3bf::8)
 by TYUPR06MB6242.apcprd06.prod.outlook.com (2603:1096:400:346::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 05:17:25 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:3bf:cafe::7) by TY6P301CA0022.outlook.office365.com
 (2603:1096:405:3bf::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 05:17:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 05:17:24 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0E32040920E1;
	Tue, 10 Nov 2026 13:17:24 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH v3 2/2] usb: typec: add CIX Type-C PD controller driver
Date: Tue, 10 Nov 2026 13:17:23 +0800
Message-ID: <20261110051723.434009-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110051723.434009-1-gary.yang@cixtech.com>
References: <20261110051723.434009-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TYUPR06MB6242:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 407f3ab6-9294-4000-25be-08df3ee9e81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|22082099003|18092099006|18002099003|6133799003|3023799007|5023799004|56012099006|261028144727099003|261102123227099003|261009223027099003|261026121527099003|261021121427099003|261022075727099003|261021135927099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zNSE2alDPPk55oaLH7jtzHGQx7yrsrRfIT84VJ1wB9ZOG/bbdcWUshu8x4XzVbTjmQFihPG6lXDC0sAC7bWxnptK8tS5Vfp2FqYZnsNWEwVz20M+WcaicnYOldiRMK6puW3wDNItWImGrNCxb38XW4B0gWyVcT6Q6qhuglqA5WIdsy+mAiCAXLwxazm07GVrTM4/Okq4uOT+VmTCM3r/8zedWPlBzTHNUvboVE3s4KQDzFdgwttCulbnvYG9U6UuwoZBT/0ibFWqJ0hDCm2UWaXCq2cX+Xoej4nliVt02nDdeBPZNWIz2sPoevkbwamtoxNBr3A+PGMFDPRcs/3M/7OyccjaIo0GFdrciP+9BKveAqv+km45C+rbuKUT54nBzUJgwW8w4YEI61Ixw/0fGSOKVpRHmAvmEv6RbyeRnyNZjCE+1at2Zy9DZliNJFAVqdq1Gs3RIRDpDLpb/GAQ/GvYwpHx0d92GCO9Wa/kaITgKs7esy1k/Q/mt7HPOmqntgQb31HSeJz1+v9jadeDrzySITCMLpeUMxGcu7JWMmJDpJnsRBNa7am/MZ95BJrVpUBKWmVmLJ6136x4+uDnu3vnycX0FpgpnPpz4DmciXnh/XmOcaqx8VYFxtiVrxKmrWGGGU0f1wnds+9y9th3gLk1Z6iOUNE9nbkyAiZoPrCpdNcXrKduB4n4HgV9nBrHjZOfotiM5oxnJ4FveaF3ZQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(22082099003)(18092099006)(18002099003)(6133799003)(3023799007)(5023799004)(56012099006)(261028144727099003)(261102123227099003)(261009223027099003)(261026121527099003)(261021121427099003)(261022075727099003)(261021135927099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OkiXdjNUn2xTQktrhDdwyeHl6IttOsBxvPxYk8bJDcmWvV4XVRzy6KjNheuKqciBW6YozEYnW/w4XEkyWrYmRA63rW93j7bkWTUrE6xfl4Z88CxBtf26ZSTwq6JpK8L4Sfgk11W7iqmmTLlOt9xcHp5DJw4/mlqmCw3KeVmq+noyy8iTI/ovM6YvXY3YOD1MdeeUxagdh3r1OWSQGTfyeWI49xkEmiaFE3L/5JhuPYyURoZzJHeXX+JykfXYW1BPJwP4S0UZdulgncvVwtTbwj//ZIiirfuIOJzwytAsOiqHiNphmKM9V72w52pUhaEFhvlQDJVSMNQynsEmLFDJp2vsw8SavjCAuk+Pl5fBSdtqv/+A9rihBwWCADWT6cSXJcsp75zANQNaZ0icXsrjUW3+RqLwg4dUOv7iRKi7raea846501SPkrB0L9IKT1ir
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:17:24.9961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407f3ab6-9294-4000-25be-08df3ee9e81a
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6242

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

Several controller instances can share a single interrupt line, so each
instance registers a handler on it with IRQF_SHARED and only accesses
its own registers.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                |   7 +
 drivers/usb/typec/Kconfig  |  13 +
 drivers/usb/typec/Makefile |   1 +
 drivers/usb/typec/cix_pd.c | 701 +++++++++++++++++++++++++++++++++++++
 4 files changed, 722 insertions(+)
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
index 000000000000..5a7a3efd3ac1
--- /dev/null
+++ b/drivers/usb/typec/cix_pd.c
@@ -0,0 +1,701 @@
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
+			} else {
+				typec_altmode_update_active(typec->partner_altmode,
+							    true);
+			}
+		}
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
+static int cix_pd_event_handler(struct cix_pd *rts, u8 clear_irq, bool force)
+{
+	int ret, err = 0;
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
+	return err;
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
+	if (cix_pd_event_handler(rts, 1, false) == -ESHUTDOWN)
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
+	if (ret) {
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
+	if (client->irq > 0 && device_may_wakeup(dev)) {
+		mutex_lock(&rts->irq_lock);
+		if (!rts->wake_enabled) {
+			ret = enable_irq_wake(client->irq);
+			if (ret)
+				dev_err(dev, "failed to enable IRQ wake: %d\n",
+					ret);
+			else
+				rts->wake_enabled = true;
+		}
+		mutex_unlock(&rts->irq_lock);
+	}
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
+	mutex_lock(&rts->irq_lock);
+	if (rts->wake_enabled) {
+		disable_irq_wake(client->irq);
+		rts->wake_enabled = false;
+	}
+	mutex_unlock(&rts->irq_lock);
+
+	/* Force the USB role to be reprogrammed after system resume. */
+	ret = cix_pd_event_handler(rts, 0, true);
+	if (ret) {
+		dev_err(dev, "failed to refresh status: %d\n", ret);
+		if (ret == -ESHUTDOWN)
+			ret = -EIO;
+	}
+
+	return ret;
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
-- 
2.50.1

