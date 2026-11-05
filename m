Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793846530;
	b=xnOw9IGfLpv79anC3ORnAgxuaW23bC+uXXRM3Ru6YSe0kITPZ6poDat0ENRgjxQy7LvG
	 Zmh1lSwdQd8dXQy65DOT78KrlaLN9O8JUzH1XtHrTzgTDIOtcHyAea+dcMgxBokvpRLH+
	 Q49oUV0DwqVNhB/99fvzRtBX28Gw6GvURphyFI6U5MQ0RnfcVQIWStk6nDSfiqC5wfRZV
	 z4RTl0RddSguUIH0AHsQ9kAQvmwoqkbCQgushY60LkTLH7nW5l7LZ7ghKSirOGXK/Sbu3
	 Vvwg08UdgdnuLKMT0zj1BV4j3ptpPeIbehCgYV7hJd2VCzGQlHadrpnHjI9XlJ7/VRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846530;
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
	b=ZbG53TUvwYwflwSiHSj/113XxxcNZxZvMnAkuGin269lUFibkIH9LruJXBQhgkA8sv4S
	 /ewM8zfHXSsZxCGGI6l7RKUqw8NkLaGlaBvBT6lsmcOVyL9B8fj4XTM2/qXMe0+ehg7Uf
	 jSgYV6MbDlxp8AqD/WK+UOoe0l1UhDE1QG8+FhpXTzzfXu2iFTNhr1Y+wdL54H7GNMZ88
	 wIxvBI+HQAHvaBpnA0Nhj6a2D7TJbt8WLLBXBFKed8LVa0/W9rECoU84rLFhVDJ+g1AbD
	 RcTHg16qCDNHem9YabFPhtPHWs2PcF7lLdnuV+q+nm5Aa4OjORjrXitEcHnQnk3XW2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cn.bosch.com;
	spf=pass smtp.mailfrom=cn.bosch.com;
	dkim=pass header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b="Dh0g/oHf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.69
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DD4606D819;
	Thu,  5 Nov 2026 02:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56DD4606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cn.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=Dh0g/oHf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ePV4fVhjhtoyU+GtMgu/MG9STBGAaFrz8GwNS7oqSwfyO2WEbvIvDZc1bcW1GkHCejOJ0r9zX28ycDUJ/1BrwZLdKSyqUjclZH2abFCRdKIcBOzI10Rak0UvZ1aJ7ruVFw8YOpGLY6RNQHB9nu0N0aT9iPh+lmHwXp7pSBh9U8JN9aKyCc7z8cPwFODw8fR3P6DN4OFAgEI4+xObQHJtMGwQkxFtmPc84/Gpf0H+KA16Yvq/aH7JyAGbolbVS9LDZMaGBIoBk0PO7ZuEvpFZGmXXZy80/rqDuy7i1a0dSh3b0lUq+uEolafwad/uhnOse9vxtEUkri9kGcOZZ4PJzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=X0/5W0xkGcHftRQSZAiNvECJV0POsz/24zxzcaBAScz50rl36+9g0uarUZ6Q+2f7G6UsN4c2Y2esDVhtIf6fC1dXeeufkhvrvj1jqoo6ipiw6S+ivSWQZHM1r1IvrQHSLtBXMsvyIO2cKUXQAOVd6KoS3SY1JebN14+Hb3llQbgscUOCCjymDqtBUPkd8cUOIPpSSjlzdTo4N5DZaDPhgr11lm4xOkLtAMwMCSZ9JnK0iev4tUdwMub/RiEt4KVTwJ2oFzHCxJ9luZ7vhl3iDzMcamcVuyO15dmQpl3FDkI8PBUdKOpzU57gdJ4ADojaodJ1t6rQ+ILSDHhdOz/fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TaEpltkPmHijHEiQGLTD38EYpONpkdlb1QtEipFxwp4=;
 b=Dh0g/oHfRc9NK0ZW2ZDrjm+ce0d1ZzWezqCn9NJ8Qoudb78bCQFCFrmMXpUwCTt54jUuXGjSFv3ornpebku6pUEkfKI7w/HnwnWcvsHl9TPHjEbUE2OtZTtTL5aTiAZBAXmnX5FINPh2kifJSBMB0VRUtHpYSbCz0hCT2oR0Uh27yHCWArLicM7HhY/rbvT+zNkFKeC0AXiGFJbSWxrLvggX3CPeUa5zxZaqWT1Y/Ut82EDNXm+BdboWwV5uuROx1xSucVdVdA8BQxvieSJlwfiruH2Au1VItvVbDVGuqYjao2Kv0lImNr1Ibqq2rqnDTmrHgN+v1u3dEjpASY47+g==
Received: from CPAP307CA0002.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380:3::6) by
 VI1PR10MB7636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Thu, 5 Nov 2026 02:42:05 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:380:3:cafe::95) by CPAP307CA0002.outlook.office365.com
 (2603:10a6:380:3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 02:42:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:42:05 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:42:04 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:42:01 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:22 +0800
Subject: [PATCH v2 8/8] dts: imx: Enable USB OTG mode on BSH SMM-M2 and
 SMM-S2
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
Message-ID: <20261105-add-bsh-smm-m2-v2-8-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
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
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mhkWBzkunOLVn92VNSrj/V/F7bFn96U+9C1ky3u
 Qp7mwzcO0pZGMS4GGTFFFlUE7zPSl4NMJ02sxpuDisTyBAGLk4BmAjbE4ZfTD8eFx7ZX/a+cXu+
 yjP1l8obNQ0fnNbTXTK/5+nkwBzXTIZ/1ga+0UxrKhdkr77cZSGl7NjO/6HzeIt5oyhj3EZtqSR
 mAA==
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|VI1PR10MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: d579eecd-55e5-43bd-dd0f-08df3ae660e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|23010399003|6133799003|10067099003|18002099003|261102123227099003|22082099003|56012099006|11063799006|261021121427099003|261022075727099003|261009223027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	gNu0yxmRQVW2+qMxM92hq+g3V7QFqM4Vc3C2hapWZh8IBw95zP5oMdIoSgdtq9OtusNYfJXpcnJzu3Y0KgVNHBk8qZMnqm8hUyROIt8E1fdoZzb+mN7b0xwpG0/aPzGJISkvSoAohbHw3hrKggm8GExr1PcQCZ6WbXHP1v60qHqbQMRtneieqPZS5q8s6IRLEy1SmH6UVajHtrrHlclTg2hqj9LCdvo5GNHPycuFrleCIrVAekLqi+ZpXDRqGPZ3CRTTEhwI2uu1HOFPwzCGNm3CBGY+XubDySnfbF2k4OWNr8N3uTuolez88wkOC5moMHqvgw6pFiBKvOso6Pq6z1WEwk6Yg6Hw548jkTe0Rcc6HLmqez4OdCkU3R+IRL0HjVVla6H7fh0/Oxb82XNrZVr/hBPOQskSf8W/xrEx/ScXvnpNh4qHmB13RzpLoCAPCr/c4PibhshLoLOXq+x0lsfzi0qNPta6kPp7SyhoqMco3uc2rAG1ulVB7ya2isITsUeNo/UnW20y4wqm2+ifI0aV/ubeUf45vC/MeWPDD+o9CiZA429WByFsYHmDIJe8tkcCDqV+Q6XIecKNoueXg9Qlm4YuIsfCOk3NFM7/R0wFBv6zjtYg5a8+6Iy4WfK+U1fPNM+qSVXsAJWnj0ahoUZsMueiP844G28vOGX+CpmagKbblAtszONiAIj+aLxhEiZlq/wNxMuSRysW+4KOsQ==
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(11063799006)(261021121427099003)(261022075727099003)(261009223027099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DyeNd+sIWpKpqBLQNC3T68ugAlBYFO1M9udxUNZfn8cPZlqT1qgxneAyDqb/FCfWXm8+xIjZprICVNgmNS1MCCciaBdSMHEM5kIruDBBUG5sLH+t8BjpocRsH1ZefDntCIn8al5FNFYeQYsYXsJ9Ix2SB07JNstHIGOf58jgR2rI2u6WYio8T+Me+OsDvAHkT4yzRt56BeL1CdBFL8xP6NKiVwX0f7Bj3+kksrmg3XiTd5tt6SI1cUa9GfIS48N2T0By0itxTnNZOeXbOcDs2Bxtx2mnW8zzJ8Aw76j7eDlznw3PpUELQqFV6eotUd4x1oR0+TmGyHNurHZCxopjPuSecWteE5Px3+Av/Jb2i9fsEqNT5Cu1bjeVTYkcQoH346IW9lbMGNuj7EpIOtecT2+g5UQli9AzkGOSS+0XLeIHzz9UvBfVTJlcbEWHhpV0
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:42:05.1729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d579eecd-55e5-43bd-dd0f-08df3ae660e6
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7636

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

