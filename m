Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58233FA5FC;
	Fri,  4 Sep 2026 08:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512029; cv=fail; b=kocNaslfFFG9P45d3RI9WkVzY/NzDrESYDbsZnkzgVL4brYCxqMcK8qq3J0ipMU2Am7y/rZccyA91lNKvBkd2sygih3l68bT8gUy3r/1d5vkgo9LW/kGAypbVslmPoTJFzJRBxoaqRZ7VUwWSqe08ulW6NU2XQaMq1hg3cZJWlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512029; c=relaxed/simple;
	bh=CHCt+iYzkVf1KhpXgoSZOxL8E7VHdoDY1cgTsBu/nFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mZPn2aERdt4PZWbITf+qLJ+RGVRTH6R1szNeJyXTm62H/HIO/xGuwjNHlsTjYJ5fowSiN51BtsMpdlXs6Ziu4I6FU06+HpNVPtMc2XIOxGwnwKt/xIlI0IiyB9hWJi7eRYGY8k349+4oHm1bsp77umep/dWNLVNRmZ+U/IxNAGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=bhgb6DRV; arc=fail smtp.client-ip=40.93.201.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="bhgb6DRV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AmR4uHifWh2Iv8PzM5Fzs9b6cxRExT2qUBfmTNa1LkqpWPzPBNG6+LS0paUZ95VIjqClzHksSWjT6h93u1UKNENrBcP/SYzfdybzYsb8UoB8ePQUeftiezDobCNyr/xFA8DYr3fELnPbJW9fchRqNuaNntSkP0A2ao9YLK6RDXsdYY6HJS4VWjTWb7KTNQWKPJhyG+fIZP/LfNxM0kTQngmO774ZU1CfCl7gUuGzbpTRQCjAu3qMYdX/OfV6832JHL9dPG2z7/n6xORCjwbVtkVphVWSPOMtL2tyLglOc5FXQdpBV23wRGe58ntSUMwU8tgPtlqfV/3Y2FuDOQEq0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=DQkhTpaHuwNiMoRSFnFbQ1bZ/tx9EDXGEPayK6vf//hsBB57OLSevoojZEfMDlyNe0aUKo+nNZxfCNG6dgkxSjppChSVGYOTe+5+2+55e7wowGYlv3MiOfLGXgzJCAsICtHc4oG0GBjUb0q8CludwxPlf27D5Ac0rbnkCZ+ITBPzT+jdiePZ44W3fFogTkc7YYHuKyydFxhFw3DykMyfZLDVwGhhx0raRkZFmUKgB6qTy7EIQ9qZHpMemZLoWlvOajw0m+1Nphsa4OTTGFYsH0HloYZScynaSEP/Za9UIdU2DRvvYvF0y/UPYe7PfllIpy9LcX0vusz54d9nG25Twg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSLhflMVgYtReTPHxuDS9grUfACbKN2AOmrXslB3BWc=;
 b=bhgb6DRVum4PDcBM2rNM8gD1ai1tJ6MBUCxTBIE4dv3kg3+dz0KJHbVyTsOB8x0hrKWlfb+f4jYlXLtAr6ey1eyvhkm7KCPjuadh83EDotA+pEguWZ92S7/UVy3BEOQolKdPkq4k6upNiQahCgnkP0XKFyKpeWjCUXFU5h6TMYnWfE3mcQ/eeM/ywpS2QVeF8Bbl6x+2AwTKj+WP1T51pqEm5FvpQMYkhifZt5zA973DswfNt9qrdsg2JJwHY+fvy0NHKjEX6Xn//gzLyQZ+3fHTdzYfBRNRnWcECzhCP3eKRkuHfvLHn17nzrqJ4yWdaFyVJYre4WYdd7gMQwuNHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 DM4PR03MB5981.namprd03.prod.outlook.com (2603:10b6:5:388::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 08:53:46 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 08:53:46 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v4 4/4] usb: dwc3: add Altera Agilex5 support to generic platform driver
Date: Fri,  4 Sep 2026 16:46:13 +0800
Message-ID: <414829b7f467ceb7d32652eaac7fb2446f7ab413.1788503540.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
References: <cover.1788503540.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|DM4PR03MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: b6d911a6-1d36-4409-72af-08df0a620779
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|56012099006|11063799006|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	WZcmWf7N8pUvg1Tg4t57FKYu7msvSFXWb+Eii1dk8iJVrmY5Zc6muStUr0S6usbN9mACKotIaBgWcW28yrBISopjgPVB7lPaaiWA631qrjYQt2dldgOXXpSx25MpATA8qIvSt4WR5D+plHrqAso8sHW8ANf8gIE50xd+xYjfi3zFKDiRoH6BHVUMDCvNmSyCtPELUNNI+1bchwH+MUvvB/4HIKhdH+imeCAv03QX3mbuej/KwCFZ+RoY+VF5A8BIuownSe9CmOjZEOuwg6cq/USWHJxmCYjreFrGGiNiSw2ORiFlVwJjOQ3Da3J6ymaHQxumxrRL7PeKVf+krsQcGKHfArlNnZy6IWIp8H4bgZn3K+2+UVT2Omz9iZL19OSrdeRd1KyQ/LC4U4MWPjAKyi0iEkPzV8fIpzGAE/Nb+2iVCg/PXcQ5bo2MFLnck9a124Ipho2PYWSMGK3qB9LqSaZKvdGHwHY/S1dPdyp3ME3j/b2G8tT8QR6j/H4L0o1vZS6/kdpaRU2XCitkwkHoBZyM1/ZXtytLFOvr/lcHtoUgqA/JRvFrsCQ0BGRr4BtMqJ2h2iAu5MMNs0wmwE6x9+yi3LUNgzs5uPHnyQERaP3FAv4SFsya1NdjCEbJO0sGW7d/gyl7OgErPwhYO0ypXI0c14wMAtAJUUWGAns/0tQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(56012099006)(11063799006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k9SzC4qzGFKEYchgNHqBcN8K2SQwzG1fZKXb1yUMiIQt8LQGnuBfabgd9XY/?=
 =?us-ascii?Q?KsUEcytUGAcGzWm7dogYb+5UMUnUgSy26pKVE272e3LWjBxtXmCvEITzjXWU?=
 =?us-ascii?Q?rETCO6VjT3j0C3g7junH9CCebrcQYkGAK5p7TdESRvTNRDjEBMrUZhHl4tmT?=
 =?us-ascii?Q?LlJI/BjENsWFKEdtDqwsw/XQERyk36EUvsespJ+QCZb9qz/LHJZQVSPWpO4T?=
 =?us-ascii?Q?zVnlP3ILM5jQfN0kMlZ9+bt/V7vQ2J4aJ9pN1gmENbRxTLMAzhraF4j3rMCv?=
 =?us-ascii?Q?Km9KSL+I7YI0knOo4LSIc8EYX9I3n2bJBWPl4bwwxG0VxHDxSCErVZS61RA2?=
 =?us-ascii?Q?8DxKWD5ETvR/aNhANurkeNIdEqcz2DXVYTcc1Jcvp7Gc8C+ttLJ1IoivVa2C?=
 =?us-ascii?Q?xxnAaZfaA9MS50NKiLR6GBiAPYrJYuO6My9XWwTtuoibLx05oQVzCnJjosIE?=
 =?us-ascii?Q?ErxpfRP4ZdUvXZvg0no1eiXnvtJYCpByI4AN9o4/mq7Lpuk9v9JOIoQmVCnT?=
 =?us-ascii?Q?JfjXsu0YQn/i1/+Fa6vTI6/S1TAo5/5ULZdeAP9fCHKK3nZpfoMlhSMX7DxY?=
 =?us-ascii?Q?1oecuuMPPX+QixJ0Wm5B8qXNElkUz8dI6xRMqsp7yAoZEeGr+R8DX5SREiqw?=
 =?us-ascii?Q?QIYmcvXAFXn7DzdSpEXGwperEYpyEsbPHSfOwHvxDg/6wdP6eaCsEaPOndQR?=
 =?us-ascii?Q?wv4/OsjbNL8ZgcM7mZ8FrHh5qu0J07CUB/CUQ8e6SoETqq+kKt5u1aorQ9Qp?=
 =?us-ascii?Q?/5CZu86qUFzDTe7givhkCLbOXxf1WyTRzL59UmhccFNhfo8iIz791RS0HFTz?=
 =?us-ascii?Q?UioH14T4CRr67wOrTycZV1LG2mKljIrIRE/tTUuXtSvUmxESWM9gxg5W67yS?=
 =?us-ascii?Q?/tfm/ihipmPRsCG5HI1bRfdBQv1nrnWPNnCCo0gNTeV/WPbAbcm52oB9OfsD?=
 =?us-ascii?Q?bUvJn9fqZ5gMlT7y9DGOPd8gNR+GYybXuKekBotqoQucNo0+iY5YuE9M0uwi?=
 =?us-ascii?Q?CopC+TtGUHRrJ/BD3+epj0oS/tLuK+456D+2Q8nSc7RGDTNtRM8igwP2phBW?=
 =?us-ascii?Q?Ef399zZW0dpghjeIwEeRu7s8/DQMEFpA+2k1dkR30xPN5TZ4WjMDGs6AR/JO?=
 =?us-ascii?Q?3AlTaj4S0OH1maHvmI8KQrJS1n5CSEUD2V9mwC5F+ui9GlhBZdxzLqbPWGxQ?=
 =?us-ascii?Q?5xwJIet1j1JKoskecYp15rQ5dI99orPe2fsYYmfMf5CR7GZtiLHChrYAKbo/?=
 =?us-ascii?Q?l3i+5qacR/TY/nCh8dB3VM8FujWn1WslyQ43ElNfMPVybBF5z8N45Pjxv7Ec?=
 =?us-ascii?Q?N2GtwpXfnwYA4cb+eTGZH/QIaBn7ZmrsWLGotWXu/Z1gYmLbvqFNmBQ+I9Wg?=
 =?us-ascii?Q?ikkGpu4EhhoYLY6svG6JaeP82KNS86GdvVWMw2mC6wvvY5oXkEJbz8X8FDxi?=
 =?us-ascii?Q?BT0CYi/aaDqVqbbrlJaGQ9affoF9pVLJZ7D7cSjI4+ymNjvIkKlIbf6vpi5Z?=
 =?us-ascii?Q?AYjz0OMycA4bLjmT5JsJhmCla+Xl1FA1AFrzi1UxZMTSy1dpOH5LTMiFhP2t?=
 =?us-ascii?Q?u/hoUg/+2LNojZkCnfrk9twW0FP604GpEa8YYYx+Mo7d29ahgGhz4IaTE6DZ?=
 =?us-ascii?Q?fcZbEdJwxVfp6WrWoXmazO8hgiuCxLq4LrIKLmKeg7rAGAx89gU+ht2JtCKW?=
 =?us-ascii?Q?HyhGadCQGmzOXM/fnvPLR8AYOE16odSJo7nnhlKufEemgE+aoDqLuhrFLqbw?=
 =?us-ascii?Q?ibSL367fVzuhwU3XWTQJ2k4DFnqSAVU=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d911a6-1d36-4409-72af-08df0a620779
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:46.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4q36JnDFqWy4NqtQxWJXDZp9F0SSbMXxdKMaTGxOIBKxxkv4xHmu2DzmAuNF3grrshWfeCXo/4+RZZ5g4pWTFnLYpnZCaHV4c3t7dLq+C0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5981

Add the "altr,agilex5-dwc3" compatible string to dwc3-generic-plat so the
Agilex5 USB3.1 DWC3 controller can probe through the generic DWC3 platform
glue.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb07c..8781d7ec6b9e 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -232,6 +232,7 @@ static const struct dwc3_generic_config eic7700_dwc3 =  {
 };
 
 static const struct of_device_id dwc3_generic_of_match[] = {
+	{ .compatible = "altr,agilex5-dwc3", },
 	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
 	{ .compatible = "spacemit,k3-dwc3", },
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
-- 
2.49.GIT

