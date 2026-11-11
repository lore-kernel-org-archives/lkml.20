Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389083;
	b=iKEoCaFzZVfCjn6mN6XXB98fgtFF5gbO1RyrPV84iiMNDAd9o5HZ/7nrgdVRr/72qBcT
	 Tjj3aXH/2zJIIWM0TEL1vKVexSuZaDRlleDx1mWHxQ4/QFStcuUiT+j5oeO1VfPw5tyHY
	 dwq8mRFYgeMXpFGSBTiSPIeNmiSDw96DY+VSCVbLcs2Xl4jWHBn8cojomPE+0eVqglynz
	 b87jRqZ6f4gPhcqph4XJZmXfyaDvtvdMrH9YRvqL86UR0fuC/sPuYRK6lUuiWwzdkOpsB
	 pe9TOng3Nwdueau27MFmTer/hMhI032JwdIzo8pk9BFpZ6IQTcO6fqe63n48Z/cEffw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389083;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
	b=pY/LQXfz4jVbGpmGY6l0aYYqq/l2EhPw2sMpyQMd71rJoInocTWhpSFtYI12Ph2PE+CF
	 +wxYx8dd26Oe3iUQGxNZp6FXt2D+zUMFxkOlMep7GdEIClSxw+lSX00YXj1gy1f41fUV6
	 OTM19eSgGk/1zBHKVLCHrv8lZDeMly7/2LBamhLWG0yYVsdUO1bkjg/Esu4uUckaK4b00
	 zVa8rE7xwkIaYh6TOAvRoNTbvqw8v/+dV7seb/6Rs9d0M3NWpWGs/yTFvM1Evn1x8rSGd
	 YFcqJgtfu53/Y5M31NX+Eh6Il8X/yqmmFJk9NTatEE0ouh1hxnzzHJ5FIsR4Zg3eLlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=RkLq3cE8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.28
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD36606A324;
	Wed, 11 Nov 2026 09:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFD36606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=RkLq3cE8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QYRCMEoiwc98YuBMV+UtRBoZSyt+C67THpU5dNiOCHc4FBdzLD328w0q18dJY422d07HYzQ8LXz+o1YTC9Y883ywiusJldJy1VorjZpVrHN1DLPf8Bpd06c1zoQnyHqWlbX7ZinIdp0GU4XM3DyVLIbINOeO85HMY/0MzNoHgE4jDouZL/i6NovazLOPWQddFR6AX/CkF7GQxb9qWftZXMW+JfdmBrmDzNHmhhuL2SeAyJtqXQTqKZ382odPB0llhOJKHZu3etHkj4GxQAGAQTXSwjmlqFJiXqAgK6LiX+7Wgvmk/UaCXQB831msIZ3HijwtZ4/LqnE6mcnikTuPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=J0+lSZIyWQnYUr9dUBpNKl4T+DnjRnAU2s7O4j0PB+/QR5wgkV6T9+do+UZdu1fEhI1FvJLgnHnGaqcbBjUWdcSf6X4USxAQWhrgqZ6n9vKOvdwyPK2/GQFPbt6GalXcoV551qhfozLMeZr2KbGXB2T8xV1syhSx61XGO/6HO3cgl75E+SQaeTQ4hV7H0UVScDxVEW+93hmsQxElZS+gN2eVbo0hRpm14xdUGhwT83GGhnUMSlh6iEoPao1ajxryfgBQPJwREc3kROkV/ttnUoEZNgqRsFSsrLpivV7HTUK9hEEsWfy3OG/djJ9wOZV6IBkCsp4XaOrqB4KbBYR4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=RkLq3cE8C4u0DuZZrdkiTTuVD7taKex6doGqwnn2OogQd4ubONzuky41rUD3ajl+2lXEZAIz0AoAfCn0bn/M6RAMePbX2yORVKZD5Hd4ZGnwhAkIxcHHRu2UIkVMxssZlL4AUkrEFHSV09VuDVUbkk312snYFqSHmgnewld27Skyd64Vwy6H14R/2zVY+wg3pfG3qhOawIiBCFkXjiSNMhTgzlxOJoPcHXqzTAxi4xru5hxcQgHANXPATFLX9MqGBZO8asrqmHNWPnoHN4/jM05dUBQxRri1C+hCfp1bix8+VC4NRq2JGOap6qowF8WGHYsvMqTQRCkcksplVAe6Ig==
Received: from PAZP264CA0136.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f8::6)
 by DU2PR10MB7788.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:49b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:24:38 +0000
Received: from MAD0EPF000008C1.eurprd05.prod.outlook.com
 (2603:10a6:102:1f8:cafe::85) by PAZP264CA0136.outlook.office365.com
 (2603:10a6:102:1f8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:24:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:24:36 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:18 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:15 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:23 +0800
Subject: [PATCH v3 7/8] ARM: dts: imx6ulz: Configure UART2 pins on BSH
 SMM-M2 variants
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
Message-ID: <20261111-add-bsh-smm-m2-v3-7-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=VqQvwx5DjvBuUeR/RiCBffb5oE02cLYBE8zFCfltHNk=;
 b=kA0DAAoW3m9onztYxqoByyZiAGr0NAyh4E1oQUppNccNvPz2SqwDQiJ4/KcHiJCc2mnsYpHL7
 oh1BAAWCgAdFiEEJWBLzRnVUDWWmXsW3m9onztYxqoFAmr0NAwACgkQ3m9onztYxqpRKQEAmxa0
 /E9xhVwXbAIr7KzRmcTJBwztNx25UQuerX9yw+oBAKlHqjTu0vAlWDuVEbZAjEleH9FYgi41X0j
 B38jHBuYE
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C1:EE_|DU2PR10MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: dbe30eb5-ac7d-4b36-3ec9-08df3fd59abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|82310400026|36860700016|56012099006|11063799006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	igbSPM+8Vi+Wa7Iig3GIZlYOysBmgsSQcJb5xv+D/q+oMF/Jh1FMLXPEBZwStILQCq4jdVXii30dD33k99K7nqUEvRlAN3n79j5+yWdxhgk0LJ3MnXkUqHCsuk9r4BdJiMeR3ZqC8IU30xosRcbrvgMZxKsLDwCwhyiiQsDYyV6774OnWCPa3ZiEhb+EbdUqO3qtGFBZnQ1ic/as/aR/Vv2s71ducp5wqCgalwG/7GrD0xfDceeKTKiZ80OpekhZ/dnCRWcM09zG7xZmsbXJ6GUl3JLCCNkDlI1Rugc2rwUe0U6Ia3wXjNp5cEA0XVuUqgOVZExgjE4OgnyRr03P27IsctaSxIJRNXmgS8eQM6q3yHsOkZG6V7vptkfwr3HIBemjM0xk9PKYGBlMRIF5ue/hshXE2KdHNJnTVENnQxxgWToTbAgIBKY5ZuywIcL18HgmNFx4uZKPNQyXAsIBLRK8iQDtds0F7Y9VuBcP4epnKI22rXT1abICpf09R9TGL/KqVTB83iAbNJQOq23DkGaqkB/4SwmaNaZ3wKsSGLHiLG0pb+ahW/BGxJUtvyP+wPItzjBNBz9fd33xtVzxUiAtR/Pi1BocTZPQdY7GdG89n4VsSTgnc132/WjQYSRFsokLwEVP8zMnOpNk46LFq2l82VjGlPkoZdX4yyJzxU1dxe0GLtSxFNbo1bvhledaYHcGpk/H8gk9pGNIjsC/WA==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	abfheTN7CJZ3xxtOc3W+uLk6abER0AxBGgCpclmh2jsXD/whJdIsIfzy/brc1jtYO8/3W2uLFHLDLCWmNMSE9q+kJqVyvHJ18wNaHhdzGNhzFjFVeFfwtRAW7i7bNWlLCoYQjFEGRj0XAZHxUcDZpK0GL55UCIb9VrMaPSRxhDuC7VBDWYvgEfPVCIf3wfBNjJII63fwQ5lMedZIqpw9nLmfCp1bRGBfR5yYH20bJY78J9GqcgFI2m0jQCLzSmdWjkpXou08SDb63yrIo+MQVMEEvs0jcaT0ck8QZKLnzEGhPfGgvHi/IyBtPjnCfwRHHxhL/RYr0a3iOK9gxJ3/edG57+QEi5eD7c/O/8uWaqaQC3p2yKpD4Mscm4ReGkbybk+zZB1FVvp5m4AAvX67n7hM+Ud9/ORcTzmWodfTxMLCrq2mmp4+/Xg86eBXcNr0
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:24:36.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbe30eb5-ac7d-4b36-3ec9-08df3fd59abb
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7788

From: Akhil Narayanan <akhil.narayanan@in.bosch.com>

Configure the UART2 RX and TX pin multiplexing for the BSH SMM-M2
variants.

Signed-off-by: Akhil Narayanan <akhil.narayanan@in.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 83df5c696748..27c7b6acc658 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -25,6 +25,8 @@ &snvs_poweroff {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
@@ -77,4 +79,11 @@ MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
 	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+		>;
+	};
 };

-- 
2.43.0

