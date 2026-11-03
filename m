Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688544;
	b=pjAuDxOSwP+MDFaCiE65uy+d5MAD3A8+T7DkSBvdlI3avC3ceRRQIjkxQ/2d7cL2i0Uf
	 XIBsB98cc00vdUkmidSFEcm+yNMDQcRqFKQPPElGZtXR5BN/3ZGjyGF+3ADQnOG++DdGJ
	 OHoeA5A5Jb7xx2MI+isGcoE6WFFjEOcTPtnSEdXJPCXvS1IWzDh4u9e23pWpnGcnQfpX1
	 drVC1lepdrgPD0mqgggvOrfnCmFCaSEmdi0ASdt9p1qCxesUDj+go4Po+6o5CJ+aSo9WZ
	 uyUgOoms1OD7wbFZ2LI/ygEFNdCZEHPGuwPOnNYpzkpgqT2IxltxVFjm/Qmmwjtnr9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688544;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Type:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=v9tu482SnNkSpLcF+GPX25sC8op4cRy2dP9m5ipWay8=;
	b=t+gR4Zrt+9/5GZGIRZVwB5scdgTV+8pA5tNH+VxReI2daFE/zatbIQx0VcnsXjPydOkr
	 eZbZKs5bfRzgrShmmdm/HOk42f3jGotAmVTuy8moHF8VJb5QY/0kHf3hQceN2G7YG3PVN
	 HjElrkeNHmRDq8uXLtl7jnlF4ohkSJz7rFoeo0aFQqgydCWbgsMWfCKcZ3NjMRfjkuU5W
	 4EWHez7B3hq4Wi8KhdUh1hJlWtpwlKJKBDyvm5O4ZnmU9k9HoFnLQy7/Sa1PokxhoHjd0
	 ZWyK3ZhJxpRhLlEYG4MtngmFIXFneNu1DhVVNJyS3LxaS/5GqDT+g1lIT/flcLMQHmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FC606A33A;
	Tue,  3 Nov 2026 06:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C0FC606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZFMwtTme1+GOaEOpZPnxE9KO37toBV41SjdvEbU9zEfPnvAtufJBDwtW4Vdc13xjxDzpe0VEQLXToaUPowA5nXUP4teDPDqebO2+1HbVVfteO+ToPq5FBuRQgPKPZsm7LXyfYXeK/HHrPRGeBfNfdS7UZ9O+5awd5x0Xlw0JVbS1Tc043VFb6J7743nhkSDD9chiicSKyN9pSYGFkPuCtiRRR9BhLfvuXIanTeblZ3xwyRFS/ghVGA9wBtRjswD0vv7QEJFOF3PWsFQGAWVMPF36Mm+wE/5G1ktawRO/GtEQhUcaei7p4k/2lSYj2kkMS8nwe+W90uJFCHcgnwjIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9tu482SnNkSpLcF+GPX25sC8op4cRy2dP9m5ipWay8=;
 b=VJX1BS9XF1xsqVGCV48aIYdJC6IFjm52b361E5O/JYa/qT6rT2XaU7ryWMZ2pDEM1ZG1BycDUQYuyrO/oX3ZOAF2zzaeOMIsROnSgzW8sslMneucFGv3CV8ckfw7ZznYEqVPT2PhIk4kp9AX3mDBfZE3CZtZqhYSFVrQ51ujeyt9cI9KsNBe9Ec4AGSaTf/QOV+BmTHb5u8RSutK0C2VaUp724DfC3IFRRQzgqZWj61gYKjsIpfYuTScNro6zWzN78eBmFGIUtlWEXNQ9V7h1ha3+dElTsHZX+RNObyisM0+3qfyI/qvFgoBC0uz2X8REjNPnLTUqnVsY9zjWYqURg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB0982.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:48:45 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%6])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 06:48:45 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 3/3] usb: dwc3: starfive: Add JHB100 USB device adapter port enable quirk
Date: Tue,  3 Nov 2026 14:48:36 +0800
Message-Id: <20261103064836.71059-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261103064836.71059-1-minda.chen@starfivetech.com>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::14) To ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB0982:EE_
X-MS-Office365-Filtering-Correlation-Id: 6690e497-c242-432b-1615-08df397681d1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|3023799007|6133799003|10067099003|18002099003|261102123227099003|22082099003|261102130727099003|56012099006|261026121527099003|261022105027099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|38350700014|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	97vEeERGoGRN6JAvxzem0GDY38I7T+qigczI6/+F2PodCQ4hh4xtAj87eqyjdB4/joD5yBZ+uxXGO7RFdyxzjEOEsz7XeR6IasFerNvCZFTmnshiIigJAVR8UV50fLshatYLTcF9M8Mt5XayWFv4CK0j4df5jfx9uyXRasH8m68dIqwKOShuAhwC1x0vVNplJVD7T249rzDwayTU4BQKvWOtDi/tMhJc6zCWfC0s4aTIcHGuamXDHfkk06IwfrJUIsC8JgnyRVy5SHFXSsC9MV8LARzkvivUV8o/K00soFMsCLv47fUWr8L4wWmmZIqNEO1RA8VVm+4J0F+wRVRM7GXDgBWTzKDKSM5vjzOQx47s9s/qunsG7OkIElHTgwc/n8VuQIo3AWBiNbf9a9AQhjZG2HhMU9Co3X7nG4vI3qUvRYnwycmWAAKmcRwdbwnHRy2fSFMIDpWoawenWLVy1N0uy0J17V2H7rsLgS5R6wbBXfIEnQq7zHlmDIQTEO/IVLvXaR7dwcJWPSjeGG/WowMfoZgHvwk4mHk4t6IagsNSMFd/e0fJNClTyMhRGU8W
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(3023799007)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(261102130727099003)(56012099006)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(38350700014)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Iztjbbm2Zj45DLKHO96nXo3xxmtPLj28s6VV7boYMqm1930MDOUAOO6nvoE?=
 =?us-ascii?Q?vjmlQjhXQyTFu/PyyBvdG8urIzSWs7IoFNZ2dzUwKjsn+qtO3/HwdLHWH7+v?=
 =?us-ascii?Q?05QceJ6RCPYAlbpJboLMgTUm36G22RiyG3p6vE55z/r54XbFNPl4tDZacHM9?=
 =?us-ascii?Q?PviXqfn+RFZKo/XdDOnzEx/Bx0KxaDH6wY3ZWvbAuVCcQnCVjlDQlHnOs/aN?=
 =?us-ascii?Q?CyG7XZCPjhY4Yfb6GQH/aLmBRt8RcF6ye7lUtCV19BbmMnuf+h2Ts6kG2MOD?=
 =?us-ascii?Q?HtzaKQalNGeMYZ+a+I2/OuW+JpGkSJuAoxtw34ETOmVyUshv40jpzd8ZTMAj?=
 =?us-ascii?Q?bNbZN5DCJG1Hkl104IPI2QeDQb0T3e7SqvFJauGsgkrcv4mRKoWqdjXH00L5?=
 =?us-ascii?Q?TVOyOMGIjC+wm90fVrAu5n7a/9v40XhGs+MdDFVZ9nLSBJOdswSq8QlwuAzG?=
 =?us-ascii?Q?vDCwbvakJcPwlHAzbnhmLMUzT7oEfY3gGe9tHmNsTQDFzUC1d1kWx6J7wfYs?=
 =?us-ascii?Q?9Y/k1eEyxiD9EuzwBREN5iYlbOsKbXBBJQ7sTITo/8vX061oXeinknMLRinp?=
 =?us-ascii?Q?ASRTz1xoWdey3yeFBdrnsedoeDHd+TQPDlfji+Za27T6uYgyPGy07RlN1IqV?=
 =?us-ascii?Q?WTFLMXYYBp4wM6lHNRW41c1yMns0gfHu1TvTg8e9aNCUMwh8TzD9b0fQAF8y?=
 =?us-ascii?Q?tlJ9zrcz0AOrm2lt/Bbz3AbdQKfUzzW/caMpcTtHRVjoB33yku68eT1DGAYe?=
 =?us-ascii?Q?gel9WHPFZTLPIKi3edHpI911pe2RBIFeAQCvlyFd6lLhYlnMBP3gGMY6jwMQ?=
 =?us-ascii?Q?lNQxMyNtPNYKSciR/dVtBHmJ+IyGSORa5/IKhkH6Euqn0beD0a0xO5Ef+Krq?=
 =?us-ascii?Q?qaJryRj5KBtu5u2rr/W+U5BR6l6jV9RSNkNKQfjaVKemnYbwrc5+rXdcIYbe?=
 =?us-ascii?Q?Jdu5wKH1R27TJHjhXXmKxV2xciiVZDNl0X6ntbuuOYJa0OUc5c7Q/uDyN80d?=
 =?us-ascii?Q?fxnYlEMjiFZsv+8KdzAGCeucWsr5pIiYH7F734wocjU5BR2U3P8uBpVKgtzq?=
 =?us-ascii?Q?w4Vf66zQJo+3c0gSdWTF3ssULkJ96cKIiBNKTLELlpLukzkqe7RL/9ic76cM?=
 =?us-ascii?Q?7z8LLidJRZkJZjpavEzvKPEhBcRnnooHgOvPuwzr5sLxsvz+o1hwBAsgBbOF?=
 =?us-ascii?Q?8RODEzIYZcx5D8b280Isp8PJ8m2MMxcLE1znsjQqJQfOVczwzcAheC4lFPEe?=
 =?us-ascii?Q?5WQwwiW1C93TYf7gJdQx9Ribom6iaDVB5epmNy7W6/q3ELGDji510oYEldaq?=
 =?us-ascii?Q?paJfBnJrqsdeOwUyvYKkLYnY3JAlB8a1ba46mkoG+7xSibO+xUCZlb48VZIX?=
 =?us-ascii?Q?S15WByiDo5DIJqOKJTP32v92CBooPGFXxIhmuC5EL+IVFi3zKDP5spMeOlII?=
 =?us-ascii?Q?gIUiNw8yh0ErdKBIYGWbtzWMKEiCSvU9Ozs0AF8LNMcGWo6A8gcpCMtf2Ly9?=
 =?us-ascii?Q?0gkTKSZkktyaS+xAh7CCGSkOvXDvwz0FdaqiDmXazUQjLaazNur9AjAZ7lXp?=
 =?us-ascii?Q?zpqtkuku3ykYVZ6FJBs2JBt2iu4vuwGwNdFmPQlgpK1J8/BhkLC7+EmIzqCO?=
 =?us-ascii?Q?8SyeR/6wLRpFO0MCZP1KXP4+xlMOO58B4JVtBaSumx3ECECDglXhoFgFO5yJ?=
 =?us-ascii?Q?0GpgmDehmOjNE3X8VS3OcRF6sj9k/BG9HNf1gsBfZdXI/SJJLxE/+/ikCbrT?=
 =?us-ascii?Q?s8v3CLJgwFjP4BbL7pm32dmOKFfNkdQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6690e497-c242-432b-1615-08df397681d1
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:48:45.7771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yTWUb0XSLEO89u6Kb6Kvx6vu1i1zq+7Y5kgP9Bp+9F3XyaH6gRYwG3StyDK3YOkY69Obx2mAFplu6Fyp9TZJPcoMNnVTocYdZxom0+PHstI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0982

Add an extra iomem field to struct dwc3_gerneric, so as JHB100
can add PHY adapter setting. Other soc also can use it.

Also Add Starfive JHB100 USB 2.0 device controller generic init
function to remap PHY adapter io memory region and add adapter
pre-run/stop function.

On the JHB100 BMC SoC, each DWC3 device controller is connected to a
port of the xHCI controller that is exported to the server host over
PCIe, through a PHY adapter. Setting the adapter USB 2.0 port enable
bit asserts the connect status in the xHCI PORTSC register, so it must
only be set once the gadget is ready to be enumerated, otherwise the
host fails to enumerate the device. And clear the ppt enable bit
while gadget device stop.

Add an optional "adapter" register region and toggle the port enable
bit from the pre_run_stop glue callback.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 48 +++++++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..ebcd43442fc4 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -22,12 +22,15 @@
 #define EIC7700_HSP_AXI_LP_XM_CSYSREQ	BIT(0)
 #define EIC7700_HSP_AXI_LP_XS_CSYSREQ	BIT(16)
 
+#define STARFIVE_JHB100_ADAPTER_PORT_EN		BIT(20)
+
 struct dwc3_generic {
 	struct device		*dev;
 	struct dwc3		dwc;
 	struct clk_bulk_data	*clks;
 	int			num_clocks;
 	struct reset_control	*resets;
+	void __iomem		*regs;
 };
 
 struct dwc3_generic_config {
@@ -42,6 +45,44 @@ static void dwc3_generic_reset_control_assert(void *data)
 	reset_control_assert(data);
 }
 
+static void dwc3_starfive_jhb100_pre_run_stop(struct dwc3 *dwc3, bool start)
+{
+	struct dwc3_generic *data = to_dwc3_generic(dwc3);
+	u32	val;
+
+	val = readl(data->regs);
+
+	if (start)
+		val |= STARFIVE_JHB100_ADAPTER_PORT_EN;
+	else
+		val &= ~STARFIVE_JHB100_ADAPTER_PORT_EN;
+
+	writel(val, data->regs);
+}
+
+static const struct dwc3_glue_ops starfive_jhb100_glue_ops = {
+	.pre_run_stop = dwc3_starfive_jhb100_pre_run_stop,
+};
+
+static int starfive_dwc3_jhb100_init(struct dwc3_generic *dwc3g)
+{
+	struct platform_device *pdev = to_platform_device(dwc3g->dev);
+	struct resource *res;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "adapter");
+	if (res) {
+		/* usb device controller with adapter */
+		dwc3g->regs = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(dwc3g->regs))
+			return dev_err_probe(&pdev->dev, PTR_ERR(dwc3g->regs),
+					     "failed to get adapter regs\n");
+
+		dwc3g->dwc.glue_ops = &starfive_jhb100_glue_ops;
+	}
+
+	return 0;
+}
+
 static int dwc3_eic7700_init(struct dwc3_generic *dwc3g)
 {
 	struct device *dev = dwc3g->dev;
@@ -231,12 +272,17 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 	.properties = DWC3_DEFAULT_PROPERTIES,
 };
 
+static const struct dwc3_generic_config starfive_jhb100_dwc3 =  {
+	.init = starfive_dwc3_jhb100_init,
+	.properties = DWC3_DEFAULT_PROPERTIES,
+};
+
 static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
-	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "starfive,jhb100-dwc3", &starfive_jhb100_dwc3},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.17.1

