Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A4F3DEAD6;
	Fri, 16 Oct 2026 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181531; cv=fail; b=AAp6D9vN7hTjvnET8FRY+ai7zGHDiWYvm8NzGPOlvvfNWNxODF/2k4IGdN0R6sbc1iDdiaRM6i4lMjKg7qEhIr5xpQcRndlJMJ93HEH/losNOFVtV5TyKHTqMIbdSgvPDJtP1JI4HtGE4vayjBK+tI+cAXl5YBQ7ZyxU7fCMNkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181531; c=relaxed/simple;
	bh=sWTJGMkR+LJIeLtwMcQ3gacW7wB9S5jDnc+6gIZRAlM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SjhAVXLWvJ/VyI69RfTncBz1rb4dGo46UjD1evoSxeVoGrbJkeG1O+RLeyjyu7LYxPehdRKmp/PRH92ZTl38za3J1pILYomuJkaR7e7h5R90kA6srR3ldEg0of3+VspjrYgn1GAauLmLsgnPI5RIYAEUz16UZuANRR3V9ZLn9Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h+e5verB; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h+e5verB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9ofoT252vUsQAzghQKAJXxbYn+QhdxT41JihJF+NuX4SjKxtNlwoSzxvaCDruSn0mZihMlHXOHvhtDbxWY7IG87rDcj9pXC+QJom7+nlT8xb1mj+jC6SJPtFokHOj0ayOqCb9tC4hjinZy24NhgWpahbdinNr+VQ1tVoZ26SSmzb8j+iRfxPBun3b8CcqpEQbNiJsZcTFo8guJk3LF6Ryl1B5OrJq3yzmpTBkw32xO3pKEJxAI5PkM1ebEJ3hZ5F3iAMYwp5weAxKOWZs3/zwOf0xkhYQ1ESqjUb1fkZ9nwUEkwFdRe/Pb5ZnGpYVNYzbAy2uOlok0hdu6cMQMTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZzxufTVBAk5L/1Zq+D34EozmoJou7+kTgMnz7t4vB6g=;
 b=rXLLF/TCrBzHWcAquGC1cUcdB0Gtt9tKUAH+FJDOIosaJfWaKHZj2WBukVpnLFXzTw6NvbWBuE2oYxFfSIWmD8AyQDvOIsfMScwrR9LTHOKa9FpquHqOVkmXIMAfDIAa6p3dRt8+JQsAK+z5VEOV9//p1Wvziiwrldc+OdHvdJaUgk87yhCaBEamNwGKypP+XDwXgxyq11X+Nze+9t4Xp7qbTKbSCCvlB6gRCERmTHezxrMKdrmC68FhTJwfu8HK8ygsMuF609uIpIzdbqlZFF/yGN3pk0/1r9GbGXVAj7/6th4qV8JJYA70uPT0ivVyxgeLXg+6xsgk0IM6x7eiiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzxufTVBAk5L/1Zq+D34EozmoJou7+kTgMnz7t4vB6g=;
 b=h+e5verBfF1FWKZ+mE6ECuSwUMV40+9HZqbcLfjnTwKNPrD8xESi4eFUNTl01G1VGCPQKbS9Q5ouUDKDLoOXVfkg099q93BqlY2J7dPbIQiPbsBC5b2W0txjn2iA2Qfy2yhbMOWehl4xuZ7iLRTz67ufxKu82wulPylcL6sWu/ZrDbPBlgQpYpBgPMbuSKTl7eowjY/a1+F2xyTldXp+iE6qd7SzP88sCBxu2E9HZWiFlSyBWdyQPmgVZblFkxPDjXWlgI9rHF1mLidPhtpjO9N0R02osZuqslOvd8zcYXVX9/gLO5RIT07berUXHvVEa0ec+HJgKPexHEbc/myeVw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:40 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:52 -0400
Subject: [PATCH 09/14] ARM: dts: imx6ul-tx6ul: remove front compatible
 string karo,imx6ul-tx6ul-sgtl5000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-9-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181453; l=1036;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Yem2vptnsHA9x22kZvdY8LFX08zxctB09/1Vq20dEII=;
 b=4vkNMPpZnSwf4vua1zAfEhhyCPrd6f5EKhIYXLExMVBM40uZ9U9xELgibC9gdCVm3kQXcvbcS
 CI3Ji9Gic51B5kfx8ewkiRIqt6cYQQp3PuYJdKYLNw9c/OeRxcXi/qM
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:242::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0bf02b-7c19-4e18-5a09-08df2bc1b0da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	G1Q/ejbV20NAEjEtX31vVqnMSMCXMWLpt9EoCjopPZuBnEU7sHUZ/y9uy4cwx6kcg3Al7e/xVEEAy36ngINdbE5KoOFC84PK23AE8xdmGay8KLDZRA0jq+s7V88BmQyl3lPZcr+zmg+AIj+ZzgKC8o8d6uXGRwiwyXg25fL2hSUb1yHhylzUNeVIrIooR7LuuuX7xghnxXd7IWGP3okz1EcWBa/WQKG7je7mBufeRB3KQmZmMVnkHu8cxr/4+RdNyTj3fvn3xmTSkpi/2tKBvHx2Kd/Y57W65VoVXsbCDRX+iVV1/XRZFCOXim9dKpvT2gJ76eHRqk/RiwNDFQjhJoiNqN9ndYJ0VRFlJYJxo1rTMJgs9D3hMpY3tPIRh7yDZeZ+v1GH3gvzQ6hmr8xFehxfH2v3zSmUaSG+NBgLgNWADG2vZpXtYEF873+uxyux/XmUBvh8qc28Mm+Nh+rCuiJj0F3PmP985GR1QwMf9eSAhE2l9yKn46pCa4fvqUQx2L8clk+jZu6KXBhUODvi3p/SeDFwHDIibV07TRDyZSZbulf6cYMCtL/0/9yxdJzp6bmV1gujIWe/V+l8oC+HBCCNcbvrFGPa74LtZXmXNrfMffQA08RW2W8w7Qf91P2omB4hm1Oz6lgtpbh/D/kq/DsAsJ+HLAnPpKmjXhFiyMY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZDblBidGxUMTlZTjdhS1BwcGtBZ3gvTk80emcwaXVmOHJFU1ZRZlEvY2Qv?=
 =?utf-8?B?YnZjWjREVDkrelA0ZE95aEJGdDYzMG5kSnBoTmx1Mm1uKzRheWtEbVVDSUlt?=
 =?utf-8?B?Z2tRdjM5Z2tvazVsTjlRa1FMY2kxVEZTMlJWUEFDWXZQbk1ELzVFcHE1ZXdp?=
 =?utf-8?B?aytXRUhHbXowZmd4ak9xeHBkb2RCWXVTdDBRVkZVUHI0WHhNWnZxcFBvT20y?=
 =?utf-8?B?UlBIUWtnVWlZeWZjb1NzRzJQNHhuTnZWaFltQlNISThNcU1PT0dwZFFhSUg5?=
 =?utf-8?B?b1o1dXdBU3ZWL20yU0pYTVJDbHNzUUVFd3lJZEMwSEp2eVJCU2J6Ykl2Wmg3?=
 =?utf-8?B?NE1uSHlKc2NLbHI1SXNMVG40Tms4VXNJRXJjSzVBTlA2bkZ0SHJtMzhYWEc2?=
 =?utf-8?B?TnNVR3NXKzFLVXhlTGYwTFNEN21yRHJBRW9weTE4NGhKLzZ4L0VDc05RazY5?=
 =?utf-8?B?YzFpWU4rV2NySzdpQU9Za3JPYWxIczNZYkdIQXhZNENOQU5Vbkx4Z29LYWpq?=
 =?utf-8?B?d0JxbFBwdW4rS3lNYUovQVN4RWQ5bFU0bG5GN2pCMGxxYTFvMWZVWmVMWDdw?=
 =?utf-8?B?bjFqeWxzV2NpRlA2VEIrQXlrRWRZMDgvdFhrM2tjYmY1ajh5NkNZckJiSXkx?=
 =?utf-8?B?RitWVWVZYmoxSU15Nk5ITkl0cnNaYk1DRlpDVkYwcFZ3MFZWSmRGdDdNdUNR?=
 =?utf-8?B?OFd3MlErb0FHc0ZiMU9QMmJxNytIUXVGSXZON0ZSZkRKajVkankrbWhxb0xI?=
 =?utf-8?B?blJadVlBYkxWUGtSeGZHakpUeDNzMnB4ZXp3cEs0MG9nTHlzb1pMRi81NDlz?=
 =?utf-8?B?WDAwdlBRckVnNlF4WWY0Q1ZVc0plb3VWakt3MWtsVVE5MWlPbDlQU3ZBNHdp?=
 =?utf-8?B?SjB1VVpyWmxMV2FQRkd1elJKeVZhVWlrOFhUc2dLYTQwTTNaM05GUHprcmZp?=
 =?utf-8?B?SXQ1bFpIRUtHSExidWRXQlh2aDRMVHFsNEFFZnFKYm1sL3F1a2hjdS9ZY1NM?=
 =?utf-8?B?bWxKUmRvTGxQWCtLM3dSVFo1N1ZJQk9xbVoyR2pqV0lPZmMya0V6NnhvQzUz?=
 =?utf-8?B?TDZocnFkT1VHK2owY0lHcmZRcXozYVZCVXErSFpOcGtRekJMa0FPMFQyOXdS?=
 =?utf-8?B?VU8rbFdMNWlHdURjRWNDZmoreHFhVEZHOUY5TmtDK2dMTU5QNy9GRnFHVTlV?=
 =?utf-8?B?V1JQT2YvTW1wWDAzbWMxV2NsdVNiS3AzVDdZaUEzcWU3YjN4aHltdnZBTGJL?=
 =?utf-8?B?V2ZoSFpLYklRUS9BZlNSZ1lUZ3hsd05kRzYrWlRmSUdja2RSR2cvaExnQUNi?=
 =?utf-8?B?UFpkT2FFVHlkWXFqNS9Pc0d6MjV2K2pJOTlqL2pkaE9mR2VIc0laMWNkRGt1?=
 =?utf-8?B?OXNqWUk5T1ZsTGNZVWgxcGxid2gybkNPdVBwYWRDQnJEOFd0K3ZhTXUvS3VN?=
 =?utf-8?B?NzBGN2pxbHVGTE5mdTdFZDc0WFBtQnl6OU9BZDJqSUlpQWQ1NDdQWXpPOVgv?=
 =?utf-8?B?SThLVnJrRkpuaWRZTzdDMVg5Q003cG9zcXFBK3F5ajE4SVB0T2VKSnVZdGRZ?=
 =?utf-8?B?bnNNeHZuaHBSNjNxL0dqVzVOZzY5WHdMTHNnRm8vMFllU0R2VEFhWWFiN0Ni?=
 =?utf-8?B?eHhwU2R3UHkvMU9GN29QWHNrRGM2Vm0rU2gzZmVJS1pyMGpYM3VhVjlYZXdF?=
 =?utf-8?B?dGdJUHJnRUZPaHdubkJDaDgwRTJTd1ZJaTNYTDFVTHFMWUZ2L3ZOM0t1Y1lj?=
 =?utf-8?B?by9MU20zVEE0RytnVFljY1FzVTFDK3JsSjhyRERvS0JNeFVKZm54VlhVTmox?=
 =?utf-8?B?TjFqaHBLc3c2R3VGS1M4NFFmN2tFSTVwNnozNklNNVpJNWhybmlsR1hHczY1?=
 =?utf-8?B?VXFqUlJpNStnajZaQWQ3bTRIWmFwRzBjb3Z5cWdQSU9rbFhNQngrczNXbEU3?=
 =?utf-8?B?QkQ0cW00bG1qQUNJZDRPQ05ldktPQk9FRG5uS0UrbEJmRFRoWVBKcTNtbWRN?=
 =?utf-8?B?RXR6K0JNZCsraUVOTVE4VFh3T2VsRjdRVVlrN3Q4Nkx4WDhXYVR4NmhxOVVO?=
 =?utf-8?B?bXhOZGRvVjYzSE9FT05OMlpiZlRaSTlJNVpNY0NhdnhmZ3AxTFNXbXA5MkxG?=
 =?utf-8?B?KzJENEl4V09SN1JCQXF1bFRFd3JtR1I0NUxWMml5eFlyUjVZTmlrdzNES1hI?=
 =?utf-8?B?UGZUN2R3MHlWaDAxTEZtZytWMm9reXBxUDdtSTJpVEpQNmZFT3hvVVdKS2JI?=
 =?utf-8?B?YzljbitSMDhmZXhIV1NLbmJuRStNUVNtemEwRk54RS9TNStVN25wa3oxRUpS?=
 =?utf-8?B?R2dCSFhuRm1LR1MyakJ1eWNVQ3VQMkZRWUs1ckI0VEdVWXZtVUhsUVFlRnRZ?=
 =?utf-8?Q?0Ski0sWexNFL0UJ2Hcw3oFRo6HCCR8TZkNiMB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0bf02b-7c19-4e18-5a09-08df2bc1b0da
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:40.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/T9oIzIeJfaIladoNvm0om1CBdIAYK+rRCbKv5oa3gTdfhIrxDwaa4q+MkyQSG2N9Z/Ico27bTRWPzRDB+rq45Aa+IKxZlX6+3CK8zoumENgZ868QGBW0noq92QDBGa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

simple-audio-card needn't front compatible string
karo,imx6ul-tx6ul-sgtl5000. Remove it to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dtb: /sound: failed to match any schema with compatible: ['karo,imx6ul-tx6ul-sgtl5000', 'simple-audio-card']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 2f6916c0359c5..c678f8fc06c28 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -192,8 +192,7 @@ &gpio1 10 GPIO_ACTIVE_HIGH
 	};
 
 	sound {
-		compatible = "karo,imx6ul-tx6ul-sgtl5000",
-			     "simple-audio-card";
+		compatible = "simple-audio-card";
 		simple-audio-card,name = "imx6ul-tx6ul-sgtl5000-audio";
 		simple-audio-card,format = "i2s";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

