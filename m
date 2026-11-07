Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.77
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794013820;
	b=SQvgl5R7XoWth3unY+gHKccBFE/0KbnCsh5ZwcY/keaAG6cD/IZgtWndhyefzFXS0/Dm
	 QbGtdRMdHRqJCDIe2wji29C8m5ZR1/IFHYnFdjLpLgiyeCl7EnpDcAtMEcXhdBrF3Ww42
	 s+aL8HSbYQWchQr0u8HQ1490al+ZfetrFd24P+mv+R9+rKoy8V0L+0w9YUenUb3Kj4cXV
	 Ixb+hKAPUxAJHlTkLX9k6KNISzUzRHaC2hRuCIILCV9CS+HTF5zFPr30pIDlSAXaLi0Ri
	 kRYE1+5m3voAOZ+KdKDe+R89UwOvG7uIPpa8ALJbi8bVgs6zbsZwR7cHNwwrVw9e1Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013820;
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
	bh=vaVYp2FVTvl/Y8u2tuTnvDKZL9ouXAE8JopojRZmC+s=;
	b=4X9zNHe1ZBOHmnGxt54xKOlf4wYucroZGQ1hCQIYDXq+EzSkMJuSWAmiUW1sjpy6vXHV
	 qIR+nVW/3kkjMDFoH+Ux/ZUUG5NBwScIFEfXcMaXeDl5A920Pxo/EalCsM95uYTlTmACx
	 MLIA3uSvcWh4pXhl4LUW7BIv14gBoVVxsym80eJWPL+rNAAUGHV8hQCvIEBPxfuomZnrl
	 wPttmjTocXBht8NjoG3Qh8M6r+eEdhY9ymFOB9ayWxRA1PrhpjcMq6klGQFOr1zvsmjYE
	 9BP3QxGMTouwo/LH2twBOkdTYWKzMtSF7pDKRTmsTmbTNaXL053s7RBm775DM0x/nGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.77
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022077.outbound.protection.outlook.com [52.101.126.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BC1606A32D;
	Sat,  7 Nov 2026 01:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65BC1606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4rLDmKvCP3d9a0plz4mVoqgz1U0Yl6Jeg1mvUpOTR0emplCM+s7S3YpkHZI+8VIwyKjAwGpnX/xmYs3O9qMNTY/9oPX/I8Jx/PUsB2GHvas49L4abXlGdRjlTglpMThWVts1pdE8aySB73pWzrNblDoloch6/mD6HWaPSzjKfSo3mDVqLQBdQ4P7Al9YdScObEbpeNsamuBmo0M38S5LIHbDKUAxLZWYibc2xIFVuxdGRwfyPNaVfGUitJA3aO1OoRXiYhclsqLQVjYmR/Pu75LokyK2X44JNnNIwpIYBuk83h+45pHCdduk0hNTeJx1oA+jk9nyQd/oGn+zcFESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaVYp2FVTvl/Y8u2tuTnvDKZL9ouXAE8JopojRZmC+s=;
 b=uruhjtPKllnqFsQ3QEtO5MO19DksDw0c/aewKa3z3r7xeqlXUUo0fXvRKQMmYsfEiJS7x10H1fpkqLNI82LxsPw69PwhKH/zYzoJI7222jqMECSW0AYqUQHw+ZpEGepg8oFSlpY7MSdXvhF1UVUSAl6rbqL34Mppo/iQNd+uhDAaHGWxaG97GnNNnCBWLWSdTP/QlU+jJZIgVN5jxnWU+EDGexQbKIDsJgKx3I0TgwsJ61ivpcmrxLRjOL7LSo6fJWZs16DwVjHFoGKyy6sKFey6KsJBmrSuvkW/MeACMK0uEhCuMeSm3YTiJFjtnWc+F9RvaJ3xOMqXqodQOE5h5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0132.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::10) by KL1PR06MB6135.apcprd06.prod.outlook.com
 (2603:1096:820:d3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Sat, 7 Nov 2026
 01:10:14 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:990:54:cafe::95) by JH0PR01CA0132.outlook.office365.com
 (2603:1096:990:54::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0771940920E1;
	Sat,  7 Nov 2026 09:10:13 +0800 (CST)
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
Subject: [PATCH 2/4] usb: typec: add CIX Type-C PD controller driver
Date: Sat,  7 Nov 2026 09:10:10 +0800
Message-ID: <20261107011012.3655873-3-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261107011012.3655873-1-gary.yang@cixtech.com>
References: <20261107011012.3655873-1-gary.yang@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KL1PR06MB6135:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: cee06b51-2de4-49ed-9452-08df3c6be0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|6133799003|10067099003|18002099003|18092099006|22082099003|56012099006|5023799004|261026121527099003|261028144727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	QwpI7Y0hM2MRVDzm23GH774c/oA3dhEIfQFxCK5aPOMCEYLLgPJrztwBoovGuSNVs4kR+nDLuOfT+YQL/MQzG1SEGorbfLCXJCi/YdvmjcPdkYKP/dm2HbzPf3zG77fFfTU2e7+hW5uP8bT7O/kKb54Dm/RDewyNWzdFKIGWpLEdzN0YZVwuskRQ4hc7jizYQjPclODs0GDw+06O44fdgcFZufCg/gdOrplQoIvsefPkSadBZl/NBV+E60235wIN19/ED4J8BL65kzA/I0NuMXCXd/5lZqeugB9NlA8gREfHwjuCy3JBSXc2Z0w6IkERu7Lw6THrHN65QE+uNXU++jcNPNB/mnipO7jO7znyf9B3UsuZLodigIucri4fPOqbZcLj1XZMarscIAMECc947RlXkmVbBEXVuiNfnf1cVLY+nKX/upK3M8vST9RYc7OGkgX02FifCFGSTEl5OBzFJtSgFbzD0VunE87Ae52lSdFq9EhLAvsUGdNh3sGBi5RMMKy1bUl47RF4UtVvRomj56hawS9lr+T+Bc+49DthkAwB1Uhx55SkeY5pA/o7M7VJqByXIAPp48ztXFY02gwr8BF912S6ANHzjjVl2WBMbd4CA8aBXTZ7XfCmPTCfWtP8L9d3CHWVWQez819Q9felSqOiFX/A64NGQQx67j8kg127tp7u3SiRpLGu6/3NUhqgBlSOsOyONcut0hfsuK0zkg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(18002099003)(18092099006)(22082099003)(56012099006)(5023799004)(261026121527099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(261102123227099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VTYX3dz/JvBLHNoHDE4AxfStSNLJdlzo/O2025DoMCzGdA4ko5PVlrZ5TA5RloLHoA2nBTjpxRRPfhSys+n8zxLynk9HcRtyBgW+NkFvWWcr/phuthJj0vIzts9OlpDFNuQAqIb0m0vmGV/Cnccyzq34QSe5VI1IjGVa27w3qTtkVpMrd8et8JvuednJCGIrIxjvj+b2fNJ7WTaj1HpEtWx+s69EUH1e/XdHltYnIjmvRXyo/8DVUQFpF1DJZMTA85sNAqcXJLYBNY+Ofqjo4PGsG31rnTPNUIlMerEyoMqQUhi2+dWwvVv8H1cJ2R8cC/6HsKZrRu91njeGofLruuYlZxpVXzW28dO1IbALaEbpIBnm03N/YCMUd9bcevXmdS+7x56bXHsxHyxnwHCCCNMQrx0TSihKWs47hsf5rgyuecyfnp6RnbMxbD23Jmsm
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:13.7131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee06b51-2de4-49ed-9452-08df3c6be0b1
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6135

Add a driver for the CIX Type-C PD controller, which is connected over
I2C and reports power, data and plug orientation changes through a
level-triggered interrupt. The Realtek RTS5453H is the first supported
device.

The controller runs the Type-C and PD state machines in firmware and
exposes the current port status over I2C. The driver translates that
into Type-C class notifications, driving the orientation switch and
mode mux registered by the platform PHY for the DisplayPort alternate
mode. A USB role switch is registered so that the USB controller can
follow the negotiated data role.

Several controller instances can share a single interrupt line, so each
instance registers a handler on it with IRQF_SHARED and only accesses
its own registers.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 MAINTAINERS                |   7 +
 drivers/usb/typec/Kconfig  |  11 +
 drivers/usb/typec/Makefile |   1 +
 drivers/usb/typec/cix_pd.c | 777 +++++++++++++++++++++++++++++++++++++
 4 files changed, 796 insertions(+)
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
index 2f80c2792dbd..b81a0d946d00 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -110,6 +110,17 @@ config TYPEC_WUSB3801
 	  If you choose to build this driver as a dynamically linked module, the
 	  module will be called wusb3801.ko.
 
+config TYPEC_CIX_PD
+	tristate "CIX Type-C PD controller driver"
+	depends on I2C
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
index 000000000000..b65e1a4760b7
--- /dev/null
+++ b/drivers/usb/typec/cix_pd.c
@@ -0,0 +1,777 @@
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
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/kstrtox.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/usb/pd.h>
+#include <linux/usb/typec.h>
+#include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_tbt.h>
+#include <linux/usb/role.h>
+
+#define RTS_DATA_CONTROL		0x50
+#define I2C_INT_ACK_BIT			BIT(2)
+#define HPD_IRQ_ACK			BIT(5)
+#define RTS_DATA_STATUS			0x5F
+/* byte 1 */
+#define CONNECTION_ORIENTATION		BIT(1)
+#define USB2_CONNECTION			BIT(4)
+#define USB3_2_CONNECTION		BIT(5)
+#define USB_DATA_ROLE			BIT(7)
+/* byte 2 */
+#define DP_CONNECTION			BIT(0)
+#define DP_SOURCE_SINK			BIT(1)
+#define DEBUG_ACCESSORY_ATTACHED	BIT(4)
+#define HPD_IRQ				BIT(6)
+#define HPD_STATE			BIT(7)
+/* byte 3 */
+#define POWER_SOURCE			BIT(0)
+#define POWER_SINK			BIT(1)
+#define POWER_MASK			3
+
+#define DATA_STATUS_COUNT		6
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
+	bool pd_int_disabled;
+	bool irq_requested;
+	bool irq_disabled;
+	bool suspended;
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
+static const struct typec_altmode_desc cix_pd_dp_altmode = {
+	.svid = USB_TYPEC_DP_SID,
+	.mode = USB_TYPEC_DP_MODE,
+};
+
+static int cix_pd_typec_port_update(struct cix_pd *typec)
+{
+	struct typec_displayport_data *dp_data = &typec->dp_data;
+	enum typec_orientation orientation;
+	enum usb_role role;
+	bool connected;
+	int ret = 0;
+
+	if (!(typec->data_status[1] & USB3_2_CONNECTION) &&
+	    !(typec->data_status[2] & DP_CONNECTION))
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
+	if (!(typec->data_status[1] & USB3_2_CONNECTION) &&
+	    !(typec->data_status[1] & USB2_CONNECTION))
+		role = USB_ROLE_NONE;
+	else if (typec->data_status[1] & USB_DATA_ROLE)
+		role = USB_ROLE_DEVICE;
+	else
+		role = USB_ROLE_HOST;
+
+	if (typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED)
+		dev_err(typec->dev,
+			"debug accessory mode not supported, try another usb cable\n");
+
+	/*
+	 * Update the partner before building the mux state so that the DP
+	 * alternate mode handed to the mux is always a registered one.
+	 * Debug accessories are treated as not connected, since they are
+	 * not supported.
+	 */
+	connected = !(typec->data_status[2] & DEBUG_ACCESSORY_ATTACHED) &&
+		    ((typec->data_status[1] & (USB2_CONNECTION | USB3_2_CONNECTION)) ||
+		     (typec->data_status[2] & DP_CONNECTION));
+	if (!connected) {
+		if (typec->partner) {
+			dev_info(typec->dev, "typec port(%d): unregister partner\n",
+				 typec->id);
+			typec_unregister_altmode(typec->partner_altmode);
+			typec->partner_altmode = NULL;
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
+		if (typec->partner && !typec->partner_altmode) {
+			typec->partner_altmode =
+				typec_partner_register_altmode(typec->partner,
+							       &cix_pd_dp_altmode);
+			if (IS_ERR(typec->partner_altmode)) {
+				dev_err(typec->dev,
+					"typec port(%d): failed to register DP altmode: %ld\n",
+					typec->id,
+					PTR_ERR(typec->partner_altmode));
+				typec->partner_altmode = NULL;
+			}
+		}
+	}
+
+	if ((typec->data_status[1] & USB3_2_CONNECTION) &&
+	    (typec->data_status[2] & DP_CONNECTION)) {
+		/* usb + dp */
+		dp_data->status = DP_STATUS_ENABLED;
+		if (typec->data_status[2] & HPD_STATE)
+			dp_data->status |= DP_STATUS_HPD_STATE;
+		if (typec->data_status[2] & HPD_IRQ)
+			dp_data->status |= DP_STATUS_IRQ_HPD;
+
+		typec->state.data = dp_data;
+		typec->state.mode = TYPEC_DP_STATE_D;
+		typec->state.alt = typec->partner_altmode;
+	} else if (typec->data_status[2] & DP_CONNECTION) {
+		/* dp only */
+		dp_data->status = DP_STATUS_ENABLED;
+		if (typec->data_status[2] & HPD_STATE)
+			dp_data->status |= DP_STATUS_HPD_STATE;
+		if (typec->data_status[2] & HPD_IRQ)
+			dp_data->status |= DP_STATUS_IRQ_HPD;
+		typec->state.data = dp_data;
+		typec->state.mode = TYPEC_DP_STATE_E;
+		typec->state.alt = typec->partner_altmode;
+	} else if (typec->data_status[1] & USB3_2_CONNECTION) {
+		/* usb only */
+		dp_data->status = 0;
+		typec->state.mode = TYPEC_STATE_USB;
+		typec->state.alt = NULL;
+		typec->state.data = NULL;
+	} else {
+		/* disconnect */
+		dp_data->status = 0;
+		typec->state.mode = TYPEC_STATE_SAFE;
+		typec->state.alt = NULL;
+		typec->state.data = NULL;
+	}
+
+	ret = typec_mux_set(typec->mux, &typec->state);
+	if (ret)
+		return ret;
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
+	if (typec->role != role) {
+		typec->role = role;
+		ret = usb_role_switch_set_role(typec->role_sw, role);
+		if (role == USB_ROLE_DEVICE)
+			typec_set_data_role(typec->port, TYPEC_DEVICE);
+		else if (role == USB_ROLE_HOST)
+			typec_set_data_role(typec->port, TYPEC_HOST);
+	}
+
+	if (typec->mode == typec->state.mode &&
+	    typec->hpd_status == dp_data->status)
+		return ret;
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
+	return ret;
+}
+
+static void cix_pd_typec_init_state(struct cix_pd *typec)
+{
+	typec->state.alt = NULL;
+	typec->state.mode = TYPEC_STATE_USB;
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
+static int cix_pd_event_handler(struct cix_pd *rts, u8 clear_irq)
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
+	err = cix_pd_typec_port_update(rts);
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
+	 * Report the controller as unresponsive; the IRQ handler turns this
+	 * into IRQ_NONE so a stuck line is throttled by the IRQ core.
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
+	const char *buf;
+	int ret;
+
+	memset(cap, 0, sizeof(*cap));
+	ret = fwnode_property_read_string(fwnode, "power-role", &buf);
+	if (ret) {
+		dev_err(dev, "power-role not found: %d\n", ret);
+		return ret;
+	}
+	ret = typec_find_port_power_role(buf);
+	if (ret < 0)
+		return ret;
+	cap->type = ret;
+	ret = fwnode_property_read_string(fwnode, "data-role", &buf);
+	if (ret) {
+		dev_err(dev, "data-role not found: %d\n", ret);
+		return ret;
+	}
+	ret = typec_find_port_data_role(buf);
+	if (ret < 0)
+		return ret;
+	cap->data = ret;
+	ret = fwnode_property_read_string(fwnode, "try-power-role", &buf);
+	if (ret) {
+		dev_err(dev, "try-power-role not found: %d\n", ret);
+		return ret;
+	}
+	ret = typec_find_power_role(buf);
+	if (ret < 0)
+		return ret;
+	cap->prefer_role = ret;
+	cap->fwnode = fwnode_handle_get(fwnode);
+	cap->orientation_aware = 1;
+	return 0;
+}
+
+static int cix_pd_typec_get_handles(struct cix_pd *typec,
+				    struct fwnode_handle *fwnode,
+				    struct device *dev)
+{
+	typec->mux = fwnode_typec_mux_get(fwnode);
+	if (IS_ERR(typec->mux))
+		return dev_err_probe(dev, PTR_ERR(typec->mux),
+				     "failed to get mux\n");
+
+	typec->role_sw = fwnode_usb_role_switch_get(fwnode);
+	if (IS_ERR(typec->role_sw)) {
+		typec_mux_put(typec->mux);
+		typec->mux = NULL;
+		return dev_err_probe(dev, PTR_ERR(typec->role_sw),
+				     "failed to get USB role switch\n");
+	}
+
+	if (!typec->mux || !typec->role_sw)
+		dev_dbg(dev, "mux or role switch not found\n");
+
+	return 0;
+}
+
+static void cix_pd_unregister_ports(struct cix_pd *typec)
+{
+	if (!IS_ERR_OR_NULL(typec->port)) {
+		typec->state.alt = NULL;
+		typec->state.mode = TYPEC_STATE_USB;
+		typec->state.data = NULL;
+		usb_role_switch_set_role(typec->role_sw, USB_ROLE_NONE);
+		typec_set_orientation(typec->port, TYPEC_ORIENTATION_NONE);
+		typec_mux_set(typec->mux, &typec->state);
+
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
+	if (cix_pd_event_handler(rts, 1) == -ESHUTDOWN)
+		return IRQ_NONE;
+
+	return IRQ_HANDLED;
+}
+
+static int cix_pd_init_ports(struct cix_pd *typec)
+{
+	struct device *dev = typec->dev;
+	struct typec_altmode_desc desc = cix_pd_dp_altmode;
+	int ret, nports;
+
+	nports = device_get_child_node_count(dev);
+	if (nports == 0) {
+		dev_err(dev, "No port entries found.\n");
+		return -ENODEV;
+	}
+
+	if (nports > 1) {
+		dev_err(dev, "More ports listed than can be supported.\n");
+		return -EINVAL;
+	}
+
+	device_for_each_child_node_scoped(dev, fwnode) {
+		ret = fwnode_property_read_u32(fwnode, "reg", &typec->id);
+		if (ret)
+			goto unregister_ports;
+
+		ret = cix_pd_typec_parse_port_props(&typec->caps, fwnode,
+						    dev);
+		if (ret)
+			goto unregister_ports;
+
+		typec->port = typec_register_port(dev, &typec->caps);
+		if (IS_ERR(typec->port)) {
+			ret = PTR_ERR(typec->port);
+			typec->port = NULL;
+			dev_err(dev, "Failed to register port: %d\n", ret);
+			goto unregister_ports;
+		}
+
+		desc.roles = typec->caps.data;
+		typec->port_altmode = typec_port_register_altmode(typec->port,
+								  &desc);
+		if (IS_ERR(typec->port_altmode)) {
+			ret = PTR_ERR(typec->port_altmode);
+			typec->port_altmode = NULL;
+			dev_err(dev, "Failed to register DP altmode: %d\n", ret);
+			goto unregister_ports;
+		}
+
+		ret = cix_pd_typec_get_handles(typec, fwnode, dev);
+		if (ret)
+			goto unregister_ports;
+	}
+
+	return 0;
+
+unregister_ports:
+	cix_pd_unregister_ports(typec);
+	return ret;
+}
+
+/*
+ * The IRQ is disabled when either the user asked for it or the device is
+ * suspended. Keep the disable/enable calls balanced and idempotent.
+ */
+static void cix_pd_sync_irq(struct cix_pd *rts)
+{
+	bool disable = rts->pd_int_disabled || rts->suspended;
+
+	if (!rts->irq_requested || rts->irq_disabled == disable)
+		return;
+
+	rts->irq_disabled = disable;
+	if (disable)
+		disable_irq(rts->irq);
+	else
+		enable_irq(rts->irq);
+}
+
+static ssize_t disable_pd_interrupt_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	const char *p;
+
+	if (rts->pd_int_disabled)
+		p = "disabled";
+	else
+		p = "enabled";
+
+	return sysfs_emit(buf, "%s\n", p);
+}
+
+static ssize_t disable_pd_interrupt_store(struct device *dev,
+					  struct device_attribute *attr,
+					  const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	bool value;
+	int ret;
+
+	ret = kstrtobool(buf, &value);
+	if (ret)
+		return ret;
+
+	mutex_lock(&rts->irq_lock);
+	rts->pd_int_disabled = value;
+	cix_pd_sync_irq(rts);
+	mutex_unlock(&rts->irq_lock);
+
+	dev_alert(dev, "Only for USB Compliance test, PD int is %s\n",
+		  value ? "disabled" : "enabled");
+
+	return count;
+}
+
+DEVICE_ATTR_RW(disable_pd_interrupt);
+
+static int cix_pd_probe(struct i2c_client *client)
+{
+	struct cix_pd *rts;
+	int ret;
+
+	dev_dbg(&client->dev, "IRQ %d supplied\n", client->irq);
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
+
+	ret = cix_pd_init_ports(rts);
+	if (ret)
+		return ret;
+
+	ret = cix_pd_event_handler(rts, 0);
+	if (ret) {
+		dev_err(&client->dev, "failed to read initial status: %d\n", ret);
+		if (ret == -ESHUTDOWN)
+			ret = -EIO;
+		goto err_unregister_ports;
+	}
+
+	if (client->irq > 0) {
+		irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
+		ret = request_threaded_irq(client->irq, NULL, cix_pd_irq_handle,
+					   IRQF_SHARED | IRQF_ONESHOT,
+					   dev_name(&client->dev), rts);
+		if (ret) {
+			dev_err(&client->dev, "failed to request irq: %d\n", ret);
+			goto err_unregister_ports;
+		}
+		rts->irq_requested = true;
+	}
+
+	ret = device_create_file(&client->dev, &dev_attr_disable_pd_interrupt);
+	if (ret)
+		dev_warn(&client->dev,
+			 "Failed to create sysfs attribute, ret = %d\n", ret);
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
+	device_remove_file(&client->dev, &dev_attr_disable_pd_interrupt);
+
+	mutex_lock(&rts->irq_lock);
+	if (rts->irq_requested) {
+		rts->suspended = true;
+		cix_pd_sync_irq(rts);
+		if (rts->wake_enabled) {
+			disable_irq_wake(rts->irq);
+			rts->wake_enabled = false;
+		}
+		free_irq(rts->irq, rts);
+		rts->irq_requested = false;
+	}
+	mutex_unlock(&rts->irq_lock);
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
+	{ "rts5453h" },
+	{}
+};
+
+static int __maybe_unused cix_pd_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+
+	mutex_lock(&rts->irq_lock);
+	if (rts->irq_requested) {
+		rts->suspended = true;
+		cix_pd_sync_irq(rts);
+		if (device_may_wakeup(dev)) {
+			enable_irq_wake(rts->irq);
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
+
+	mutex_lock(&rts->irq_lock);
+	if (rts->irq_requested) {
+		if (rts->wake_enabled) {
+			disable_irq_wake(rts->irq);
+			rts->wake_enabled = false;
+		}
+		rts->suspended = false;
+		cix_pd_sync_irq(rts);
+	}
+	mutex_unlock(&rts->irq_lock);
+
+	return 0;
+}
+
+static int __maybe_unused cix_pd_restore(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct cix_pd *rts = i2c_get_clientdata(client);
+	int ret;
+
+	ret = cix_pd_resume(dev);
+	if (ret)
+		return ret;
+
+	/* Re-trigger PD event if PD event occurs during std */
+	ret = cix_pd_event_handler(rts, 0);
+	if (ret)
+		dev_err(&client->dev, "typec event handling error %d\n", ret);
+
+	return ret;
+}
+
+static void cix_pd_shutdown(struct i2c_client *client)
+{
+	struct cix_pd *rts = i2c_get_clientdata(client);
+
+	mutex_lock(&rts->irq_lock);
+	rts->suspended = true;
+	cix_pd_sync_irq(rts);
+	mutex_unlock(&rts->irq_lock);
+}
+
+static const struct dev_pm_ops cix_pd_pm_ops = {
+	.suspend = pm_sleep_ptr(cix_pd_suspend),
+	.resume = pm_sleep_ptr(cix_pd_resume),
+	.freeze = pm_sleep_ptr(cix_pd_suspend),
+	.thaw = pm_sleep_ptr(cix_pd_resume),
+	.restore = pm_sleep_ptr(cix_pd_restore),
+};
+
+MODULE_DEVICE_TABLE(i2c, cix_pd_id);
+static struct i2c_driver cix_pd_i2c_driver = {
+	.driver = {
+		.name = "rts5453h",
+		.of_match_table = cix_pd_of_match,
+		.pm = pm_ptr(&cix_pd_pm_ops),
+	},
+	.id_table = cix_pd_id,
+	.probe = cix_pd_probe,
+	.remove = cix_pd_remove,
+	.shutdown = cix_pd_shutdown,
+};
+
+module_i2c_driver(cix_pd_i2c_driver);
+MODULE_DESCRIPTION("CIX Type-C PD controller driver");
+MODULE_AUTHOR("Chao Zeng <Chao.Zeng@cixtech.com>");
+MODULE_AUTHOR("Gary Yang <gary.yang@cixtech.com>");
+MODULE_LICENSE("GPL");
-- 
2.50.1

