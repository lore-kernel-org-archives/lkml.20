Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9F949BD86;
	Fri, 18 Sep 2026 07:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715491; cv=fail; b=oMSXcRRhONh19F26tpdjNfCpRFIot3Ap2wuLU3pPz/yxYmgOkhtGutMsw91A/RMZQp0aKlDYn7ybCZhr31bIRmV7lTuKCg4mxhQGYu+2CnF5cxTkMN1Dc07vxw+XrIPKvH+2jnyJgApBJklbupbjKr+pF2ZiU47+NNjOpUCUgm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715491; c=relaxed/simple;
	bh=NQy31Mxt+Bq3+juaUwejP5Q1aSrDndu1lOsa2YgGFPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MPGre7LaJZjMecYaOdtL/b79ZU5ddnRgKplJITJAjRBSRpilFd5250rfg7Zcx/ZTj3a3C/Aeif3hVI80sDgG3Tf+GHlOi7+EExqPiS5fuKWjwcaMVS7xK+MYNSK+KMoKBiOl07Ccf/OZy67oLPwszaY/+eLYX7Uq1jYkqzSE9GU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6B1R9I5q4i9KgOZxSjgSFpEQIE4/NlWkpZSLu1q5NwSHSVdmo2P6pafbphYC8qTSHNLwj3ae1grjOVvW+29x4wYpqsFS3yqwVB6Tzx3PrXJbgG2Bq5eeyOtlrqwQbxVpBgq84+48Y7bETcs1aiDlAS3q62LjDItKtgcY9RuLX9oCNbh7k2EYiZlqbNToIbqvj//6N3KKzz5UoN59NZRTP2+5Bgbwy0wKksAmzkI9RAyWiXHWDrR1lQLAxOCoTNODBqSD43lH2b3twwVUsNppIXkTe0uzmi3JdHDqkvJu4jXVZiYcldERQ/fOe0g44LUlxyndR53hZrD3Qs9XmkJzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO4ACX72uyS4jgQOAUAotDD24WgZGku0uSG1nZ5MgAo=;
 b=AR65pblQufrpz5gxP2gaWyjdSd7XAXeePT7muxHy2jP2hf+zShbLGJAtpWW3liZFvOATzzQUufScFnIgrJyhbXQp9ElLW1Ig1kpmMee8MbTwE+KH6JxEQJW+/son+3FC7Vhumfb5QB1/gZf1jy9ufeyf98Kr43O8WDeYjoUEkXOXvw0I4nzM5TQ/s+libKJkx1YxrZcFo5fbw5Xq8XrK7kJp9Gof7eUQWj5MQbbPKoTqu1RtSUT8/9e6wDPM7qwRpMZXMgQuovu8LW9z5ceSGl5eygTSMwwpYHt6I/NfqZQbKSXiwPa+ZA8P8//HGwnql8wa2BSImcGRsIFW6cinDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.14; Fri, 18 Sep
 2026 07:11:13 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%4])
 with mapi id 15.21.0339.017; Fri, 18 Sep 2026 07:11:13 +0000
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
Subject: [PATCH v1 1/3] dt-bindings: usb: dwc3: Add JHB100 device controller PHY adapter
Date: Fri, 18 Sep 2026 15:11:01 +0800
Message-Id: <20260918071103.24482-2-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260918071103.24482-1-minda.chen@starfivetech.com>
References: <20260918071103.24482-1-minda.chen@starfivetech.com>
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::16) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f56d02-4a25-4b80-fe81-08df15540622
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|10067099003|22082099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	XHhUvr72ce9psJHP1VFUOiv31cvfc0PQBD23fQTaYaXE6DUpOPfn7Vip0/Jv/lSA687itm1dUnCh4UXvcCuMPZCOeIYKx3H805hpXjeySiEqgK2Kh403EKmFCl17asQ+8DI+GgglI/yw71VXxeMHfttnVAZ/gBG9jhJFZkIAIukewJvVkvxmw7DLBwxhZHY7sMLbSwaVE2KCe8329u6epWEx6leMAscpDe25qIwKQ3vCZVDu8P9D/+KTuMobintdCoXXTS7dm8FMc1J3W2wGiVsTXpFcTPJ757Go5Dfa2W/CnvDYj9nHSCJGcFPJO9pS75DKaPO6U8E4VXUN34FqenQEgbedXSVPPNZ56v39+DSFr8D4R6iq3fDE7OKox/ScLjWHLcqrmG6BxqNHKpRxRAJFHdaSqFzsM2X66uLn/OfDiEKn+khZBJ1Y4f71WaAyLtYjYKAxgY74/GLfdIRND+3y8bVIXAD66ZkVWb57VWuizOBvGE9UkDs3DNA5E2jDXotTq5MguUSCjIy9cdjg3Q94RdZDlYTBnaI2kM4ggQZ/B8w7HgtKNJRWBUQRqD0O
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KcJgUMVceLTkI21agEzRp2nh12FfqPLSq8jkuGk03702zed6i1yQZ4Cz2XbB?=
 =?us-ascii?Q?i33y3N1oMkUm7k2IUDT6il9elR5BQVVpJRScuqQwH/Hnfo85SCiTVxVSwhVr?=
 =?us-ascii?Q?twjI4iaLmhdbApkRj49iaJSE4sJ4s6cr06cVH6KiBdT4rPQ9qLbDdh6x+C7R?=
 =?us-ascii?Q?DGeJBU3LP64ErkFAMuYdjuCRmc8p9idtuZvaCHL5tov9BPst7w1Xq70oGSW3?=
 =?us-ascii?Q?NUD6YnLLQZDSkOL9LF47bxxfYmlV7GNA7zPTxKUhzjD88TzF4tgiv58BqvE/?=
 =?us-ascii?Q?ffNQ85p04vFGyNpFTjaoxTo19Lsz5MCzeOrpb/t/xkwfYjMCSaoNH3c6EFbF?=
 =?us-ascii?Q?Ez6yXhbsXfRk4Do2dqLOdxuk3aEg95qSiHDvHMtcAW4VxO+u7IhG2nT0xP0d?=
 =?us-ascii?Q?7wbGiOvEW4gpvtUfk4Ta4Zm5Kwjqpt9Nfc89DUvH4az8NjrXAXDsGJmi4lbs?=
 =?us-ascii?Q?EuHGFr5K4sh952PBoe3x3MyxZxbIN8XJoW59nsPMgZ8gWBmrC8lXKHQ3Pc9k?=
 =?us-ascii?Q?4I+p0RS3ALgq1hGUXBtY8D/LAHFE7Ys7Q3KcAoxYV3aaz0rmu8DCOHIeJKsR?=
 =?us-ascii?Q?hyPl2sWcysl43otZhaQqutHULsr/4u72/KFieKxjGacNvVJEES2ix56x5cWX?=
 =?us-ascii?Q?Jad3Yn+QIStfFlXaJIYZcts+ZwCMOoVT4YQugb6TuHDDOtCxzss8d/4XzcHN?=
 =?us-ascii?Q?0HUYRS/yHo67JtgOrBhBIuW0r4IyVv6P+XzKb7uXaPSQpBfdFYg/Vfhch3Wb?=
 =?us-ascii?Q?uHB1yzCWXhZ9yL2Puk57i/yAVZs/VCZNKOX3fgKPkIFi/95kYp907rq/agkp?=
 =?us-ascii?Q?z1CtXhRwAbKjC0p84as+GM8gVx0hczc+QPdHOJwl5cfReFNeP0Jsf59jj8e5?=
 =?us-ascii?Q?ajeCCiFbkmJ36cI1mvumf3rRmb+Q2VBAQhM1MdJnClbBi5x1cAeGSLDobAv0?=
 =?us-ascii?Q?zWA9AOsSEoq95iNZjSiPKbtiPFsHF0NyhxZ2ZGyce5CDYnAr0EJdlAqBPRC5?=
 =?us-ascii?Q?XDQwGovuFxrEKkW9rLd2E4r1IIxP1/NmSFOlkSB5UiLWEwMjKIl0t5bBw0LE?=
 =?us-ascii?Q?FxoJaZf9iK8XCV5EjyOL/NgeeGneCGfnE3DDUyAahmDLPTDFjeoGgBO6WZ/w?=
 =?us-ascii?Q?kZDGxiWhPFuH9rOkYDD7qjKFNK4pikPJ/4EvJidH1/pnzhQ61tdJXZtaW4tC?=
 =?us-ascii?Q?vU2K+lOswJxH25dr19iSd/iLJ7KatMoltCmx19NAswXhoyjXcX/oD3+3FCkm?=
 =?us-ascii?Q?uHkQcNnyc2vEqExvMBXnLBZslZuXUuX7MQffPGgyogAQF/4uoeIiO8fOyJez?=
 =?us-ascii?Q?Qa7tsXyoXr1/SLoX1k1xg9mpnuU1h5+AXV+7CjHVlYLDs+BumS9HbShgdkXP?=
 =?us-ascii?Q?gKE7iCXm7u5Mh/474djhmPFPPg7eols2HHefecxBNm3CA+urYSRBUae9eht0?=
 =?us-ascii?Q?GCrDjHzHzgTmWSP2fFkV7D7wsTTjj9+ncxaLC6Zj65PdEbssM3oDHjSTPumn?=
 =?us-ascii?Q?w05/YbpbvM/RLU+hZ9qXR6LA1B4z/Sv3qiPx4DYILx3kCent5F780Vqw1CRR?=
 =?us-ascii?Q?yswSO1BdNDaCxHAQuJkaXTXYNDjkTaDwqtFTURsNZmG3mTXNN55L2v+uu0de?=
 =?us-ascii?Q?9VLehLRqCE7LV61Jfx/VzZ/lFI+0TXjXGauGGgBOYcukUEgKPqmRGl4eXC00?=
 =?us-ascii?Q?q38BgTiv2DBfjQCzb3s7TsDHcJMJbmqWdGbyleWm8fTVEFREa/UoJBlBY9im?=
 =?us-ascii?Q?dgcF1PoG7fIJYZkLb1vcJZjKbOHuuS4=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f56d02-4a25-4b80-fe81-08df15540622
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:11:13.5548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzsPMqzOnQ9/Gwx4WVLtDL0Ww+Ow2BYhicnJGRpx6yGQETH2Y8sz0guuAByWWDbJYTePZ74dzagHliqMVbriHqhxLAtlgJUT/hepoBtjAdY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893

Add dt-binding of JHB100 server host field USB device controller PHY
adapter register IO region and its regs-name.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index fbabe99e9d5c..b2fd98c06ba0 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -20,7 +20,16 @@ properties:
     const: starfive,jhb100-dwc3
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Core DWC3 region
+      - description: DWC3 device controller adapter region
+
+  reg-names:
+    minItems: 1
+    items:
+      - const: core
+      - const: adapter
 
   interrupts:
     maxItems: 1
-- 
2.17.1

