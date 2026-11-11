Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794389109;
	b=eioFmtox3PXicbyKLVmHwM24toABo7Rfu8fLCZNqbutHY7pEq7ORV118QbEo/F/7JRkv
	 hiO4T5yJ0nsxjck++zKjCv1mfwz6EO2CM67s3iAV/29tZAjd29rYTdJpN2TQLOh2WnER6
	 vK95FEDSzPEa7fkwH0sVfl4Q6h8jfWbx05P3aB8Zq6nlRv7foYpPhYl/8O8oGkq6jgleQ
	 k/ms17qvPTm5OPxoSxQIVdp2cg46jQNJYfUntyv0anLri1qEoCfw8sXNU2lh4/DW/aQWh
	 fBTEqs9VpPBB4gm5nRNQnIi1r6d8CefTDq/PWrmB5dPQ2lkNdsi1B6/lfoeTM5qwuRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389109;
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
	bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
	b=ls1wF1JciDJzxuLICDbl6mJzg1bh4QNKs27CdvEm61hioOuzKKnbOl1A31n6oia5z241
	 nGcEXDvsohjpFntqTiS5lgtyIiVme5oXMc3Lioi8dXYn03mwToYXHm/NCIoLq7svq1tlz
	 NQmut6RaN7tlgdT3xuVdD4SdLQjexS9+7DlBCCNQKGay/mH+AvzmGvIU6llNO7/5gjRWu
	 AMJLdo4bPkK1V6IeCak4NJ1dfWYw86q74w2Q+Ri50j+e1v3DWQ30/lTliA1rBCATJTZww
	 HVrIBi/UDCWDXkJ6StQc9/nnwIR83ruzax/p+Wfc4UR5/xiSTZAuBZ2JvzbK5d/qISg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=NQX00uXP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.25
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF20606A324;
	Wed, 11 Nov 2026 09:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF20606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=NQX00uXP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hAk4wr3icA9jH51zriFQ1FP0QyEMXceEhmUjzMEk+2rDZtg/aOgmFRtMDvzUOtaXdVvT33WjTs5zBuIhQfXktZ9ex4pQPGbJDNTljO2Ex/nA+HxPa9nSXGOV1JajRH95k68CbclTdrKZOIT+mdorOY2E0klr4vN2szwfih9gvwlTtNTTIWjmJUlpqwccG4MW6GyKPcctprJbaJ2y0iusVVb4R4s3xUFlhX4B3181DqEcweo3GReuchge0nWMx31uOPCd8pTPT5wK7KqYQFIITiMdxeXU0rVJGQ/2/OkAVtvcIZ75t/9so56NLs7XwybtXxPNHO/0SuSMsw4oHi8iWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=p0xyn/t+60Zp1ROiOgwjVEfro64thcMF69b4gDcMgy8fAeQZJZM1rrYRU3jl1LWy5NDwkoT/wfVtJT1REgCYNNMZdldvEwrT8AOsI793wCB9snMclrPrwrJ+16bH28ni1MDRmX5R174Y2KaLAjZSkj0tGh4hEO5Zi23KUdo/vjBBdX8Vwx0GD319YH9imaYzlfx7JN8JSTwC56dmKibUflC64zhXxeRcmr2FIBvivNfC4dn0KZ1UDCaQJC9aE7vbO5GaiQIqvDNi6xIh1gxLXX/uxPcpzjuSd/i0tQtyrph993sx8PBmhGCz+zLQHNbHdX5gw15lV5gsiaseqO78UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=NQX00uXPE8lXIqhYi4YHJaIMFRns8QAhafzPwK6MAi7Jc9Q+tLvI388AdPVC9OC4+7wETjobJP1fPhxGJ/IRIW8Swc2HbZpst/c60/akYVCZh/Df1WRpg6/gAbLzzM14WkOoziqJtebaPnkp92njOn7h9ZRLGNgDzVBQWoAAzzVLK5YqRbCE9PtjBYiiHKreCyH/OeGdivOOWWgUzcPHEjlTc3VIZ+nxaY+uchH/g/g9kALnvxG2afTmRIBog4KOs+yaMsdyl6U1hFB6wzZrdQQbB+UWiyEPytN9634Y/2jbhpsr+xJKuyEaYfc7uVmqiN5Eua9Y/AIeyWzxcGOTvw==
Received: from DUZPR01CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::19) by DB9PR10MB6692.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d0::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Wed, 11 Nov
 2026 09:25:05 +0000
Received: from MAD0EPF000008A9.eurprd04.prod.outlook.com
 (2603:10a6:10:3c3:cafe::5f) by DUZPR01CA0011.outlook.office365.com
 (2603:10a6:10:3c3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 09:25:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 MAD0EPF000008A9.mail.protection.outlook.com (10.167.241.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:25:05 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 10:24:22 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 11 Nov 2026 10:24:19 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 11 Nov 2026 17:23:24 +0800
Subject: [PATCH v3 8/8] ARM: dts: imx: Enable USB OTG mode on BSH SMM-M2
 and SMM-S2
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
Message-ID: <20261111-add-bsh-smm-m2-v3-8-4abdf10e9a7f@cn.bosch.com>
References: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
In-Reply-To: <20261111-add-bsh-smm-m2-v3-0-4abdf10e9a7f@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Florian Ager <florian.ager@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=jP5A1kOtmjK+1Yg+TFdVnTV0mqPxM5FRhNJ1ZQGu19s=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLK+mPDo3K3LbG24ujHrsza3vev/bp6G1YvXrTV7abs/a
 veR4y/WdpSyMIhxMciKKbKoJniflbwaYDptZjXcHFYmkCEMXJwCMJG9xowM298vCmts1llXYPzX
 sVImfNt5s/734Uc641KFPn772bjgNSPDeSXJR3xps7zPrj7IxZxue2SzPavohNkz32X5hntlTtz
 ODAA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008A9:EE_|DB9PR10MB6692:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95eab4-ad4c-4100-8b05-08df3fd5ac09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|10067099003|11063799006|56012099006|261022075727099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	BbmFyBKcp7RW5r1JXhDjLhUbBFtzKLkAnY2LzBJaPiI25aBIAeCpTBSjr4KxPkrm/l+N+Adjdqf0wJ67nmuMHT1Grf+Dv3bGLGweS+rX2ffFLGi8+0SUYgU7JY+zPRmEqos+LKQNBHD8A8HfqUmbvCafQaCil2ludxBgDNUeubRkggd2Ik4WiJ9P/KbWSEz3728QgcMDHzt7nczzqhIdD56MF3MiycD5IaGyuuWhgBVCZ9pCECw6VFdIDMh+TPXWzCY/PqHJbNok42coGL42kqSprstDXBj5mc3Xdfe/cyIv2+5GcojeR5VRWUO7z/H1wI2jwpEoQITynvvq8kdh3xdoaL19q5EVUOhwKzM4Cm8QcS25ec4Xr7MGMpNI64xOSJ8jWrg77dgr9ooy/A2xNTEKxeTYR2m4wYjYudhQ2opSim3qnK9aYcgKg3tXD+PDWQ5zzPgvaJsRpq7RdDJevvVOD3QFL8f4w8vQV4OpDaUUVFv98bhD/yGAMaxOuzj47C2/sFJKA+ziXkXTPj510zhmPfOlg8h/W+79faHWVB3ITywal0q9uWi21vazw6aIZNpYqUFsXzLYag/P4qgi5rFupNZFPpNjoyBgyUSnorXhACYMIcojY3x0uApwWFvYBZ0Ad1kkjOZQdsngUN/PUmmNINAiGGnE16sHaH+5pX1HoVUXx9KtGFCXTVt3R8x5zKeWL4uyIQVeLCdEPnTOIw==
X-Forefront-Antispam-Report:
	CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(261022075727099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BWd5uvy7xbDgf6/f6gG3/64tniQmj1eRsp8veZuM2DU0P4tt71F/8EaTUEGAHrDsbk+3Wa6rlXGwUFzds1ZNc8SffWuVaINBnWKcqlAtgY14uojqnjMRsDZ634g8dn8r3MuxcUNmnr0RcDwKrxOVW2iQNDA0fU6sU1EOgqRJ/ha+DKVkId/tmDiWQlfKxwVGK7cM8MIMTwP5phlsfSgfuqcSD+jb73ihTMvFEdOwyZkS2qFzKV4dGc3MEvODFwh8AywOqoDfx+7WfI0DWMyYRYnpKWR+lUw/7XG6NfB2cDvg8HJaKYu3z3UTIkBSZspET+D4hRV5ZQhcmQy//+R6GqtAKaFpYDOdMZzqZga9ys7vZsbUIO+CX2BV1d1EYmbyZH2v2Ho0qU9gxC4mxJq3CuQszvKqoMeQpWhz8C/W15QKrJAF6fAOQgi58K6+zE3d
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:25:05.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95eab4-ad4c-4100-8b05-08df3fd5ac09
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008A9.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6692

From: Florian Ager <florian.ager@bshg.com>

Configure USB OTG1 in OTG mode instead of peripheral-only mode
on the BSH SMM-M2 and SMM-S2 board variants.

Remove the SRP, HNP and ADP disable properties from the SMM-M2
configuration.

Signed-off-by: Florian Ager <florian.ager@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi    | 5 +----
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 27c7b6acc658..96f084b6ade4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -37,10 +37,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
-	srp-disable;
-	hnp-disable;
-	adp-disable;
+	dr_mode = "otg";
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index d20393c2d901..7a121459f95c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -248,7 +248,7 @@ &uart4 {
 };
 
 &usbotg1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 	disable-over-current;
 	status = "okay";
 };

-- 
2.43.0

