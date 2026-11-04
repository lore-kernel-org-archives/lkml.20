Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793777931;
	b=dyMhmK6FU5PERU9rbqUTeWgpBUuyx+B6Jb+iIQuNKBqJZPucsn3bl+RwI6gZmqtWxFWC
	 uG8LjcKdeEjzdt9WJV1ZJwIYIYwlQvKIg2ZpFPyasx/gTC3ACd7hOgCxRVew4oXfzszpv
	 SjOlewVEGxS/4OgdoYXMofjU4oxzOpsK/iy/H6gR1G7/JafZJEneIrQWmQCMwzBFSx8EX
	 0vMTaYABozbjvzS+cjn51NvEmvm6X2CNz0wfe08jRP9Cb/sU1nNBX91dXVHRsdc9e376w
	 ZKFCqajsh1OZZMiOFT49EvcKCN/VTjisFVBc5LEuURwzkTcZdHwokkm1k08UeqcsNyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777931;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Ad4YDSpqPLz1JHQN4MqrauXPy4HfFQQtQcK6c5FRBVQ=;
	b=TkYbuRCyipX88AZNG2Aw3upg3lIpYqJ2LJMBL7vomU6dKia4hiL0WJNPz/5s1B3jsH4q
	 Z/NsmPmCp4GX1U3ALZc3Y6FsS631tbaq+tpvugJau+3cYBzDC9XRumi6CRWrP/Z7ZKcSU
	 6hUG/rr359ANzPHTmuqt6Q5ecHERwhJlpHiDo2DbXnDhLpIxNKvj0zB0glTk52Uke21jK
	 CwOWUKrG9IZHc3czcD5tLjgDZ2SF08HDncpxUa+yNtaYu26GfAhp42kxhvDZUW0meQVHL
	 GoiubJxh6yXp6TDHHIg7C5RCWrGvraKZs7KG8oyEdEzOvpugWh3Xv+0On0+xDWlcXTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PUyCaIKn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.38
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011038.outbound.protection.outlook.com [40.107.130.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4154606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4154606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PUyCaIKn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Awt/I9X3G2dxuwrV+1dEIuG8qsWwWVnwhqNl421NyxMfJUfnFP1CCMMHUiBaxJBw0gh5SGmFujC1uZR8BZRYh5FPE628YKm7DgS/1i9gcVUXFUYgOyK9jna6s1EYqAoXkBcHt29nN/jAjfFcf/3V2k4rbw0ow+Fsagmtxn3Iurl7kxG6A94w7IEOuBumtBcD/se/jC8m2aeiAqgxiIeBWWROa/E0gMVeckhM2V6QlJyWH5VNJojwoS07/IGp58k3TMhd965UbIIviDzZ8k8OGjXjdRULDfV+u0bxwDRN9PAP2vfC3gyrIBV5GDPFKejbFPn1SDKd0ci6lWygK9u/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad4YDSpqPLz1JHQN4MqrauXPy4HfFQQtQcK6c5FRBVQ=;
 b=MkupOCBGOY0JilMrB0nuGFsX5SKMLJmv4jtWpbiMYomfKwvCIMNa2QeiWRqxFbIxxmNAdPakoYOfpYTTLjlq/1diQJyfHYphmtngKMGU+5X56zkZ/aHrv1pPNlagBoPi8HGFmlRRbDrOcmXZpOlEqDi4E2gyx2cUkb28Kj1DMWLI2vHmu4a9ToNfaSTT8IA0e4okpIfhl74ZDQCEui3UqSKK/379vdtsFVfv/L4YnPDext8FRxEwW90gtcHlmyyHuDWmQcfzaG3YLumUwv0IY8R7BeBD85Gu+9PXr4s6iI+NvoJxUEBd5749hGkG2z1NBamVvLNRHdgD2KiZc+gszw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ad4YDSpqPLz1JHQN4MqrauXPy4HfFQQtQcK6c5FRBVQ=;
 b=PUyCaIKnOsNDTi9SUaB2RUcTaauVMMa0oVyd0kR3rhQfaFZOHjS0PoOamlzlrf7Cfe/nTmaZYyMITipeubccvAWoNkpCQUKj1In4zT6l2Tg0qoG/R42qCdnYtHQ5vODcW1eFEACz7gWVSF2ML25AjhZLDLe8g1t5hIZF7RtWWLImPbm42LNX/OrtBmYpQGUJysgEvcVyeLnNbUI5WqVr8qKNG5PTFK2Pue7Tlj8nMigW5xBbvdUpV9QMV1DiXt80jrAaHFIhao2bkJ959OERk0JiDuPtng/135NtwLRLleexxxZbT3QUBl9WH1FbPvAzSDAHMuy37/+mRZY8fJKBNw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by AS5PR04MB9944.eurprd04.prod.outlook.com (2603:10a6:20b:682::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 07:38:47 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:47 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 06/10] irqchip/imx-irqsteer: Let devres own the clock
Date: Wed,  4 Nov 2026 16:37:54 +0900
Message-Id: <20261104073759.386777-7-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|AS5PR04MB9944:EE_
X-MS-Office365-Filtering-Correlation-Id: 56770338-0777-450d-b27d-08df3a46a91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|19092799006|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|261022105027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	eUNwUmT7DIurrHjVdR/bST9aVUW4xK0yA+qTRBGruX4kzKzt9yBRI34MBAy9mVzpFrUDUpTenJY4E8fyVxizZ8qnNBBYvWuKbcq/jnAm1/iJKF5jSyxfd5v4Vc0saI2gaxrRQNZ/yaEnrUrdO3GWKt6h4ztDGxOEfld7Cyh/+lSuAi6Zg/xvbF6TEbrvjQ0X4p7A8TjHnKsIhSlaRNVTI9ciINBgHXjtZLFf+fgrR0pXTgLEvOXmyK4I27g1jrOXj2Z2nRrrv+njJXtZ1yR+myLsdqFLot/pRy4dNBggZKrOYHrlMiuefEgsoDod3K3oJAxhfwF2DU4W8J+kylfCiWayJL2ICe5DnZV/HNTHTxOwHCoShNzmaB9QBchmoPyoFHVjoLxfjyeSw2tLt+M6zNjsat2XG3813Dm0pEEbgaJXGlmXPvwozLsAjIfSPTsntsQqNUBrQwkakyDYD2X73rQ0s/QS/j02Kn+aGFCQ0VblZBEuyWR5JiQGQwVyj94ATbzetHL2MNjufuWxVLmm97sOWk2hqYhRSQKme4WW6OIxUuxXym/cWM+ND0dFFdWeIjWHMub2cCaqDKreJELpxWGOi+QbDLfvYsFjs2iV0lSQ7g8FskgHgQlxV5fc9UUVDjEcYUkFAkx5hL02aaIYIuvjx54n+zhlXuS8fNHfyQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E2TQ8vGWAN/lYJEknJAs3QhlfLXhgxQFzHCsK/A9m9QNTOkFnqIqwsuXaTmZ?=
 =?us-ascii?Q?9Pa9BlAHA2+zSpPpHpJD4emWsfbE1OCLwGIb8kaMvXN220MYvAbrUS2CQFNa?=
 =?us-ascii?Q?9nBYjfM6MXGJh0giIowkpnHXDDYuOZrk6bgDK9Nj21EoCFg8kndSzmhz7z8J?=
 =?us-ascii?Q?ZANvy+CFmBMIDcGLuvjsxWcSmO1X5cmWHNcHs29vBXoZUjX14nR2qWXWIS7T?=
 =?us-ascii?Q?6r/BSYfOPA49DQE94GYIMd2ehK0YfV0U/S6SlRmFOEPE5EYwvFAiKwop76ZU?=
 =?us-ascii?Q?ZXRo/fANsIB4DNiiAEhmj7UVzavwjCX21FqgPkiwnqKpzMynJyfxOSOCxl3u?=
 =?us-ascii?Q?oYNmFJhs4gsWwtA2WVnHEC3I23CTupUEb8O4g6CTkw4MUA7hgBRbxIDN8ukS?=
 =?us-ascii?Q?seMkDBu8+XsLnkEyOG8OhkXyaSkMLxeoyNHdsDnTCNWvdkXusgCTedl8vD3b?=
 =?us-ascii?Q?lL+mYb+vrJ9Ks5hd/7QX0AkiJsAIlJUAE7syhhoG5MOg/sFRgQRx3dm8qp/E?=
 =?us-ascii?Q?QQs+Fyid6+zccysOtmLnKGeOnN7x1U8VOMxoEOcsZGBGUPXLkobh6LWdna3F?=
 =?us-ascii?Q?5dzt/tTngaAgFrtMW8SoQC9LOxwi3+Hiq/2CvlVx7NJwgzmJQDtaBCqo2x8W?=
 =?us-ascii?Q?VsLVmrjfLyvn7USwhqX7+S+xmgnMkQQWaJ2Tjkb97xIeQ6ynTfTrZbJaIpQC?=
 =?us-ascii?Q?4FGilZoc3TjQ5GnMK1maPo+HEgXEwhkt89qi1RmY8SYvOWzCS3Qi7WwYATj/?=
 =?us-ascii?Q?R4Rf30QKLE5E+KtvV3MhaG3OV7F4vrGOz/lIN7zhJPJYN1s75p3D53aSNQNy?=
 =?us-ascii?Q?rha9Y6oRNrqdPmuxaAbLUuGm78J0RMnZaYmzhkUX63ajKMc2cReAVCOvPtwB?=
 =?us-ascii?Q?Fo5hjDWap2lSKsggm6KcaPPwkmNAkWMKY2AJHzCl3FqgIhwYJAtvMOjpzjLl?=
 =?us-ascii?Q?rlPP9Q/yTfN2AUbTIs//qpf7S+nAX6FLQHxopNzmkTJofFBA1yq0nM4nTTHR?=
 =?us-ascii?Q?nlxzWOqb/ruX4HTqDZ1LuX4ZJGZupOct+ATvEgIJ2E56HFkVMeAyc96ncIvh?=
 =?us-ascii?Q?eqSMenRelBVDvmDdcWfVXENSb5O8Mt5uqpxHASzk2Z6etXMCvgFrBzf6Pdga?=
 =?us-ascii?Q?QPKcCfOF5wzMdlqDHtp0bkJYQKPsh09z33x5S3fLoBD1zL0mWYPeQITh6TqF?=
 =?us-ascii?Q?ZviKXSxfbZa+xRnDpMgy3Xldywwlgkkc7Py6dGU/2kHkYH7B1ZdzffkFJsMh?=
 =?us-ascii?Q?oNhVW11n1icaFdtkqlLFjnahS92MqbhBjJGpuiMKxGu5JhGmJ9c7BmyRSDzs?=
 =?us-ascii?Q?sIhGrnviI8dfuuNIjfxOLES1wEDxQiyODEj76BNWr06sl0IBi9LhxOGDOkZJ?=
 =?us-ascii?Q?nFOm8hoU+CSsWJnDTjbdGIf0imgFDHq25GHfdAcaia/IYWQ+WVyntsgJdNWf?=
 =?us-ascii?Q?w9hMw7ioime7YEQRLGlFMBgWcL2xnLztIJ6EMwXbVrxqvL06gc5bxfopvmP+?=
 =?us-ascii?Q?dy4fWH33lFYYzpi31LZIBW8e+uzEN7aNbAWeiuxcVgfoLhDO1mqmRLlRpU3Z?=
 =?us-ascii?Q?1FLejkE5xfpyDWv6BjZRez2oieEsOLyE0Ig6aQQQETKiOtIXolOR9ygsz3CJ?=
 =?us-ascii?Q?y1ciW4ASrGRFqygmR7RrTdNtFj6ZUXnEf/N26J2cIGIiW1gq/xVDTsoWU2oi?=
 =?us-ascii?Q?kHmuSULK0OFKGLVc1hHKqmOk22VSVSUqa2OsrhjvWRkvKVj2qPrpbUzyDuS2?=
 =?us-ascii?Q?1Fv4YwwRqxWDBqyaBumeBXZhcuBdX8S+dybfcx4pHAurLL0pmgkX8N3Jtd/x?=
X-MS-Exchange-AntiSpam-MessageData-1: 4VcfhfGR3yQdwQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56770338-0777-450d-b27d-08df3a46a91a
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:47.1711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r9I4Zq89KdKGefyw1EDz6oewt2udrfxIMwEemwT0nzi2awZJgE4UkH4JoXCmO3PzrOReAj7wr6t1CVlCKGIcxOgikjVVXELeVbH6ka8QbGlOEtE+wahbmo+75uLBUaMX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9944

From: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Let the driver core own the clock lifetime so that the probe() error
path and remove() do not have to hand-balance it:

 - acquire the clock with devm_clk_get_enabled() instead of a bare
   devm_clk_get() followed by a manual clk_prepare_enable(), so it is
   prepared/enabled for the device lifetime and released on unbind;
 - keep only clk_enable()/clk_disable() in the runtime PM callbacks,
   since prepare/unprepare is now handled once by devres.

Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/irqchip/irq-imx-irqsteer.c | 37 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 14fc56847a8c..063a071ba163 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -194,7 +194,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 		return PTR_ERR(data->regs);
 	}
 
-	data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
+	data->ipg_clk = devm_clk_get_enabled(&pdev->dev, "ipg");
 	if (IS_ERR(data->ipg_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(data->ipg_clk),
 				     "failed to get ipg clk\n");
@@ -229,12 +229,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
-	ret = clk_prepare_enable(data->ipg_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
-		return ret;
-	}
-
 	/* steer all IRQs into configured channel */
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
@@ -251,14 +245,13 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
 	if (ret)
-		goto out;
+		return ret;
 
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
 		dev_err(&pdev->dev, "failed to create IRQ domain\n");
-		ret = -ENOMEM;
-		goto out;
+		return -ENOMEM;
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
@@ -273,15 +266,23 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	}
 
 	return 0;
-out:
-	clk_disable_unprepare(data->ipg_clk);
-	return ret;
 }
 
 static void imx_irqsteer_remove(struct platform_device *pdev)
 {
 	struct irqsteer_data *irqsteer_data = platform_get_drvdata(pdev);
-	int i;
+	int i, ret;
+
+	/*
+	 * The device may be runtime-suspended here, in which case the runtime
+	 * suspend callback has already dropped the clock enable count. Resume
+	 * it so the devres clk_disable_unprepare(), which runs after remove(),
+	 * finds the clock enabled and stays balanced. On success drop the
+	 * usage count again with pm_runtime_put_noidle(): it must not trigger a
+	 * suspend (which would re-disable the clock) and must not leak to the
+	 * next probe of this persistent device.
+	 */
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 
 	for (i = 0; i < irqsteer_data->irq_count; i++) {
 		if (!irqsteer_data->irq[i])
@@ -294,8 +295,8 @@ static void imx_irqsteer_remove(struct platform_device *pdev)
 
 	irq_domain_remove(irqsteer_data->domain);
 
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		clk_disable_unprepare(irqsteer_data->ipg_clk);
+	if (ret >= 0)
+		pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
@@ -325,7 +326,7 @@ static int imx_irqsteer_suspend(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 
 	imx_irqsteer_save_regs(irqsteer_data);
-	clk_disable_unprepare(irqsteer_data->ipg_clk);
+	clk_disable(irqsteer_data->ipg_clk);
 
 	return 0;
 }
@@ -335,7 +336,7 @@ static int imx_irqsteer_resume(struct device *dev)
 	struct irqsteer_data *irqsteer_data = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(irqsteer_data->ipg_clk);
+	ret = clk_enable(irqsteer_data->ipg_clk);
 	if (ret) {
 		dev_err(dev, "failed to enable ipg clk: %d\n", ret);
 		return ret;
-- 
2.34.1

