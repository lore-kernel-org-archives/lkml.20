Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792489013;
	b=YMRsIL3DJQOrV5hcDtqvG6RIIBPHYcqXophY5853HHMlXaBS9O4L2xcke6SuAFjDTnkL
	 rEFO70rB4XfywurEcidgteScT5Ku8PZsfRFpXKiAbzIjPT3cfbIgBy/Fpz8ZoRzJR/0pE
	 6f1KujpX8TgcxILJBzvoP93fMQn2TeaUkTEcnM+0RsYgWnfAnTD6YINJSBe2MmBTWGXY9
	 7L3MAAVd98w9NoB70HmRr5z4bimAn3IxFB0MJOJdVqK8pWS61vceQ877TycQKI4QglhoM
	 HIy01mQb9QD7XzBdsZfAP3jvT/1CJ7krbGyuTWk4Wce1AJ07KmeAdHK9uGP4jtdULxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489013;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HvB6KTmsNwbWkKlK/ealNITgiL8bUgkDD72JTYk9wiM=;
	b=qYTWMPKp1xY/2RSIQ3aq3VST8D6grO7RTuGkLkdPP0x6s9XSnGAit4JpbtLc+bg9pg9g
	 jRhyX5G1SAnv45f8D/dc+LDawxvV3cYSF/N4jd/X9jPuJU7Ui9dtoJqbsXnJZk9Ja8HD+
	 0FZBcegNGXxUxyIqZbx4ecLwxbGiD4iafIxGyfXGqnFj0CWA1c34ElZ0+C35kt182Zqps
	 Bp0l5u4OzZOr81n5c1g2xj9USfMOIHoRAA0U+kOPKzghUUxuyWnv4vkRYrzkqKlVw7uex
	 YNxroWOTlMThoX1ZIE0vSELw6oYpN6qlpk9Q9w1D+RQo41hHpTn8BXvVsIu/Jkme3XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=AoMB0k7C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.19
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F22D606A31C;
	Tue, 20 Oct 2026 09:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F22D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=AoMB0k7C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygHaandwLZueprJY9heE0qTjKLmM37ujAeoduD6+8JWD8fjhYbJkE4jcQNEETrXw/lgHRh64YMw2TSHWopCzPJC4KQj8UrINrMBxIrVXbxlbP04S0Iyl45qmnMRJiXRAlONzcLAqbVZYpofHFIn+baHqmPOlx5xYDXEW4V639JgFeHioZm4uZw45dh2LMU5fVsubWf+hFSpSyCQRSaghgUijhhkqnVcSpnJRdU6ZkF8LhBEF3yF0OJHf9IwWJx1/kpKKdmDNXhdzXbrLCNwiYUzqTv0zcekqXNpds00v/8JsbxZw7dHcg4TjO14BiweIWfvHEDfBNG4mt/3yIPAf+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvB6KTmsNwbWkKlK/ealNITgiL8bUgkDD72JTYk9wiM=;
 b=FiOBlz2+Yuju95WOwOMwWoPxDesjgVSlc/mVvfPBoJLJqzL4REjAg01WD9hF3Xt1wT1GhgBugudWiJrP9zs3RR1A2dES7XSePKho5NNr4+PRXIZBgp1B3vCRjiShjMJK2lko/NddTJ+pflQ6HCHYyOhC2eYeTwGGQa1qLpmoI9SaJ5f4ANCbHkUtaOysVlg+tHg/0KxD1gi96Aa+CSFMtwkRAG+B2lxEQ/WCtf24S6j4KBd5a9oIKb7J4fbfS2dV5uyjq/qQIE4sKDKph+mBhXrzkDGdgalpF7NWIk7z5LnjlSKF4i2I617hzGNC/c/gZTd/PNfaGHnUaoyx6/bvDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvB6KTmsNwbWkKlK/ealNITgiL8bUgkDD72JTYk9wiM=;
 b=AoMB0k7Cz6Nc4XW5QpvEOyH5AL1ASgfBYDX0ShUT1X9LSs2JmQw8ddJBl+4urfUcy+sClmD0r3Y6ZXkoZtIuILvqJbe46OJGJWrs4LQGtPe4akCvzUwNwk3UFYZCEZDVcdA5F+28opVpwpYVyraaGY3uF8zauyAuzImoUyIrvcs=
Received: from TY6P301CA0020.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:3bf::10)
 by OSAPR01MB7327.jpnprd01.prod.outlook.com (2603:1096:604:142::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:36:49 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3bf:cafe::35) by TY6P301CA0020.outlook.office365.com
 (2603:1096:405:3bf::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 09:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15
 via Frontend Transport; Tue, 20 Oct 2026 09:36:48 +0000
Received: from [192.168.1.82] (unknown [10.226.92.108])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 90AA13000274;
	Tue, 20 Oct 2026 18:36:43 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Tue, 20 Oct 2026 10:36:27 +0100
Subject: [PATCH 2/3] i3c: renesas: Add support for the analog noise filter
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
Message-Id: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-2-b7ad60cde650@renesas.com>
References: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
In-Reply-To: <20261020-divo-ssgrlpcsrc-2966-i3c-anf-v1-0-b7ad60cde650@renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792488992; l=2782;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=KyWiInQ2N6ktyFQerpp+ECMFUYEWHAeZl7HEhVWMrvA=;
 b=OiFELdOZFAEdCdlWmfArYPuh5ESwydu6nvkPq5NQUAWCCWwKxPqvTe9Iv8zMwI5ZrgOKxFu1u
 /pGimp4M8l7Bbeqv5wy2prgYbbR7ZBfss590b9Y4oWrzjfApID7Jtzy
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|OSAPR01MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f50eee-3370-4cbe-f867-08df2e8da9c2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|7416014|18002099003|22082099003|261009221227099003|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	KCXvCD1rNHcIF8r+oh33jXPBdKCTxFMCSGvYA0JI1ye59CH43YDJjmhRDKzPwprst9b212iCbDufyCWFsntPDPcZu1Cd9GmMxE429KreqWTlLHCMbPxMzC65JVnQXv5WUg2eaEvASeQUrPNDzVebvLs7TkAYxSlEJQiQhiTMH6RztLG1TyGridGPysTPgWCVMUyLaKBpaR+8xNK1tdhe+hzDg0u66kHhbU43wZKQLnMsUQYFz8yLLRDvuz/6/Bt+XFUOOBo1xlpRiQI2IZKllDKzyweWQamgclSjmdRbqE/iYnusa+A2wCAPngxrGX6FDU+1kmczi80iVURQvOQR6uhvqrGUxA1jwS6mzNDQeL6F8zRrNRWUO4ABEs2jTZJmLRSpv/uxmfqv8QklvU2vdSRLv1HGcEoNcYFDWThKrc8tThilaoMMSdnf4rc3D4+gmHzIo2PgeeH1/3RXL6AAuuBmecpAUsJeb5ASMPonQjeGKX7eVGveErPmyrTojtAgc2iEHn5biPrZVqZcML/ImESPuFtSHTUnAyJRsO6hCAOs165+2xgNpEfbq+HaZmCpNiY2qC9bCe0hpHDbAb1KoHID8lTApRarmDeLoJ/jaCoof6v1jzy3CGLK7t2Oi8tGyO2oVr8UBm1bJeYR7Bkk08ZSu2ADkGj1fCGzV14cTDtjjWewAq6cmpOCE7LrIez3bZ2O6aP9ORMZTncT325QSA==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(7416014)(18002099003)(22082099003)(261009221227099003)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jOGcCoTkOP0BcmBpQ98COY7wIf7d+tw/ooz8LgYCkfqxc8qfXHhmSsyUTK/fhrwcbymFu49M4ki1z8m0RyPcF4RrkofeAGcdW3qSNjdTtiSS1tjF/+ITX8TdKfZme11slH+Qyq7MDtHNWvOFicrc2lSk/mjBkIYLREUqfEtDToHzODtz4Xka7bA273/Npk0t40fd9HHeQXqCa7Er/Jo+M5r4CIB1voFdUYSTqeqNC527NX3kGHoKhIjcwPX24abIQZcbMC0YJHdijDbUFXbOUVCtFIP6MWNz1zn14RhqDtT1uwxG2Wn98+Wnh3ePilpC8UIFd2Zhb0q5SQBET88P3tImKrp6ntidPzxlwh4IYuMMweXZJHXmbVCsNgcDqMXPQQUc23tcszxWijKK/vAdoASbXFmyI5XAaRc9FJbkAXbEgELP1CKPTN6EkcIIOAsJ
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:36:48.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f50eee-3370-4cbe-f867-08df2e8da9c2
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7327

The input terminals (I3C_SDA, I3C_SCL) of the Renesas I3C controller
have an analog filter for noise removal, controlled through a bypass
bit on the SYS_I3C_CFG register of the system controller (SYSC).

Add support for configuring the filter through the
renesas,analog-noise-filter Device Tree property, which references
the system controller together with the offset of the SYS_I3C_CFG
register and the state of the filter. Boards not providing the
property keep the reset value of the filter.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/i3c/master/renesas-i3c.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 80a6df1151bf..80d360aa87ba 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -19,10 +19,12 @@
 #include <linux/ioport.h>
 #include <linux/iopoll.h>
 #include <linux/list.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include "../internals.h"
@@ -200,6 +202,9 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
+/* System controller registers */
+#define SYSC_SYS_I3C_CFG_AF_BYPASS	BIT(0)
+
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -1466,6 +1471,8 @@ static const struct renesas_i3c_irq_desc renesas_i3c_irqs[] = {
 static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
+	struct regmap *sysc;
+	unsigned int anf[2];
 	int ret, i;
 
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
@@ -1497,6 +1504,27 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(i3c->presetn),
 				     "Error: missing presetn ctrl\n");
 
+	sysc = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						    "renesas,analog-noise-filter",
+						    ARRAY_SIZE(anf), anf);
+	if (IS_ERR(sysc) && PTR_ERR(sysc) != -ENOENT)
+		return dev_err_probe(&pdev->dev, PTR_ERR(sysc),
+				     "Failed to lookup analog noise filter\n");
+
+	if (!IS_ERR(sysc)) {
+		/*
+		 * The analog noise filter of the input terminals is bypassed
+		 * when SYSC_SYS_I3C_CFG_AF_BYPASS is set and used when the
+		 * bit is clear.
+		 */
+		u32 bypass = anf[1] ? 0 : SYSC_SYS_I3C_CFG_AF_BYPASS;
+
+		ret = regmap_update_bits(sysc, anf[0],
+					 SYSC_SYS_I3C_CFG_AF_BYPASS, bypass);
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_init(&i3c->xferqueue.lock);
 	INIT_LIST_HEAD(&i3c->xferqueue.list);
 

-- 
2.56.0

