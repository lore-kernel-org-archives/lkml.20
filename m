Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688542;
	b=MjNzE0kQocXu4Hy33KFjkGDMuXvpXVLY5eEvaEvWdYXj7TjCljuQK7fI9UqIdaU5vNKu
	 r60Weiac9H0IWfVDHbH9Q+MLl9bd64w1zG9bG2VEP0PjUB8HQ4jotc4eTqGL1nE9MaLp9
	 K7vAS+qLolOPL4qvqDgqUngVq7IN9ld7vSG64Mmf7yvov7qWnc3fjj3RVJbKYxc0expBR
	 fUVLSb6nra6yv+0uD9+mvBMGUCH/GaSONz5xzqBLNF/w6L2/ovmxpQgMvGE22db09Z2M+
	 YNN23+J1in9FVijR3MIhG0pWHVm7Ymk3iqiN+KC6H5ogUhh11I67J6e5MrrIoA9254A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688542;
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
	bh=QelaYnQQ9XkdfArt1e3xfcYdM69n0NCVRkYBLpGI5Sc=;
	b=TFZYO0EWdkvEg6rRnZ3AGTUBXwyDfmFyYQKQab7LohwoHUeaCM/JnLat5cfFMHWm5sdG
	 dXNDbobAMuTgL1jlFO3NLkx2ns8cqiwTFmHe1RPJeljphAausxYVULV2wtw3NE3qGHXz2
	 aVlTrSJeyzJn/5hLMYvFWPisw6rxvKpNznFuBpofAwPvuS+ROScUABs1/r6cQmkuEgHnX
	 JxG70BdGK1o7tL7OoE3+17vFvLPyqIMuhMq6xf2DvNyUhJoUk3d2FTg86OM9w0fH6NouU
	 uJQ9yUu0RemGLZOXr2XSMEGVhCexXhQi1xVu4KXfErHdCJuJcDvFoPCVro8Hj2wjGuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720AC606A338;
	Tue,  3 Nov 2026 06:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 720AC606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hgJMaU9gF9KOst4RSKbyBBHWYTjR6bJptvrF/c9YIJnvh00BeC4bAED5EqSih9gcOqGRnDwDSoLhzmfJYlij5OGLUTVo9LYYsKY56RaFKEh9N/4T7BlqOcfk5G9bK4N5oHYoLOl4DH0zK/jLZ3CjYA8cUZOOLpVQeS8x7LhCUWDMOrYvbLH6+P2NOSz5wvJBgxJpOmNWDqpTzU5BiU2tdr1T8pan0jDd8sgsubEtgUwm3yW0F1gEWTjd6sK8U2GJ2y1nhM6+qlPpQhtnTdFSKvqvB18VBhrwDakxyUySDKFI9SWZanRX6vyH5ARHrrBzw3Y3S4W3atyu4y/X6UHTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QelaYnQQ9XkdfArt1e3xfcYdM69n0NCVRkYBLpGI5Sc=;
 b=VvHlFG1KbcQwaFDQbG9fqcag8rZztxwJ2nn6++SMF3TnyqkWPXek/pwu9X7Zyme5Y7aBDX6q/KEBVuUmISCS1dkh+I51FW7wmQsQSYl+f36Uq5UYpmAta29g8StliTmRLmLcWU535OyumM2CFolyTyQxv0il3MD3598awz1+uhAQjkpo/zgMXEKc4BOS2FablSfdb0tBXJ6QxXDlb0xY92FWaN8ztjmgRTvmJ7B+1g+HpI0QqoRFKsBp77MzD7MiYVsDkOqYSG/odz9gm4jXxTzZEvV/aSJodA19Ahznuo6u6FwJUn49RKXAr+nbErlAKGCdnh5g7DVP0Nejyn96lw==
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
Subject: [PATCH v2 2/3] dt-bindings: usb: starfive,jhb100-dwc3: Add clock number limit
Date: Tue,  3 Nov 2026 14:48:35 +0800
Message-Id: <20261103064836.71059-3-minda.chen@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 40ad2977-ad73-4a10-9cf6-08df39768157
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|261026121527099003|261022105027099003|261022075727099003|261026140227099003|261009223027099003|261028144727099003|38350700014|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	0jccAAYbTTVowKzsvlsevvVURdqiQlrPI6jIAHT4rw32DaTIZy4Vb5bq4HfpXnhUtdcxipjzab9DIsTcH11bmUzfnc2wyGXzSd2Sadc7dkt1pEmdEuvywfliULBdU+1/uABXG67McTbF+gYxITfw9rvaEtLeNOWlV3TFWMLVJW2UDsztStcbab9RedF8uj4Tt9G5OsHrjvVV4V0YLED0LxaqCBUm+RKNz7HvCM+UCMb2oiFXoI7qF09wcKuoATKMUKy63uaJmDu178lTo5/Y5ulAewSJjQS0khE2r8Gsel1x/d/8igeYY1apsn2jhVcEoZlwgWQFWzxut3aUfJJ0bFxx4kSJ1YtbZ1/UoeFx0OxkPzbrcQsibetnS0MyiTmRREiZIY0eJd3+zOWCwmkWMCAddwQg0C387QDrGvuotqvO0BStPmjhCQCv3PAvCx3ZH+NoJ95Hh/lA8mCVYrrhxEGGIdkaDGKnmfvUoWPTbAiO/FfOXkephm+dp4Q8xXg4py9sBDY6FYYWqZNK1JJYSuE4rL6zrVP1xtCFbzMkWAyW+aR0TW1pLwIy75loncJ0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(261009223027099003)(261028144727099003)(38350700014)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ze8T3mlrnmS0Q+p4sTZzFgE7ao67ihLGm73E7R3GbTGuAjjew/AVrJtLnI0F?=
 =?us-ascii?Q?+7Q6iFt6W+8vUNZqN5UsWrJN15XU1PwqQtn5q91ZPbXN3xIihBKJdSch4hee?=
 =?us-ascii?Q?wbnGZiyNnedy0P0XtEYIEoug0RVTWaWLIZUht/2MS1Lvus8qR/xM3Nxor5Zn?=
 =?us-ascii?Q?tjIHtfadNgDaCJ8uHiswHH91ITLmo12Ibk7AszOSbgVNy4VB1mYeZ4Ozkoeo?=
 =?us-ascii?Q?8ciqO0aE/QIuliGSoSyVoKxbsNOcUJrngXPofQbT6ulxRNutBoI/vac8aRZr?=
 =?us-ascii?Q?vjaI/+zp1yQgm2frTYUshnLH4xiC++onpDBi9xS4I4MRuTmDGd+PYe0oX2q4?=
 =?us-ascii?Q?vSVw5sGCW2NPfzmDVhZ3k3fdOqvICUFdlmUsQwQKX5qZIETvpK9DrkK8EPu/?=
 =?us-ascii?Q?b68uqx6zbYoO25h1JlMDrZ4Tb/Cj+vZmwxhH4wS0z9pBjsvOD85bxjwc01JU?=
 =?us-ascii?Q?9rGl1XWzZXRn1ZBhYMDIFQFOgpQOVezaZYkkCj6srLkwtvr+JvrXTHlH/ms7?=
 =?us-ascii?Q?EYfxll8dj4a6A3TiG3V3H5+0B1PZnqAWBavwnz9EiXjSIt67a3P2qClldJjW?=
 =?us-ascii?Q?BXQ4ZRX1z983UwAdYUGDXAdYNwMo4LKHXqcUIoRUyRbHbanv/qvXY5bL5Zqf?=
 =?us-ascii?Q?XDOwbbqM0m3OHBLmulz2kwu0Byr3PcIBa043gqN4NADwUwMuTRD+CZvir6Pn?=
 =?us-ascii?Q?W5B95HY7iY0epyOv60gADdkoLCXxYeilLjQuCJ5mFagAY22etzCmq/UygT+f?=
 =?us-ascii?Q?dYRH5cygks/VOtg6mMNqozdEgFxYKJpHEpPHy0aUwi9Ng+9ZJZboNM/bLoFS?=
 =?us-ascii?Q?vmnkV1GfATx4wzSmlU5k+ytCxi8Mm7XRsMzAOtWJzfgT0ixvR4XBPcpFgnRq?=
 =?us-ascii?Q?6Zf0iNEBl9jH2pcFWmDuY33vZKIpOAADrrDQ8WoQsT0bt1gDBxcJSRoFZAW5?=
 =?us-ascii?Q?28wjsupiuk4ftothHCftrRrBcyQf+vATKjVW01gK57IdGTP6oSxTWaSvMIB0?=
 =?us-ascii?Q?h8ZzBH3f18ELs0w/v5/smjj+m19m6GdDitJcXpsZ/pWmkW9PgEcdaQ2uPQ5L?=
 =?us-ascii?Q?Z3CxFCi1w7xdqLjNhMbch3TijfF5lnMbZR5QI9zppF2Hx9dHIX/ax4cwcvbs?=
 =?us-ascii?Q?on8sb3e6E9T04RceumBTvwlVljVA42YZUcpBpddpV6oFdXmaRkFxoiffEauJ?=
 =?us-ascii?Q?mKWyWXgGaVKQL6o8hztFD07U6gmVoTft+lhXjNuRawsJT5wv9cvWLMWpsvpB?=
 =?us-ascii?Q?oIecZjY9F2GYd1+ImCDHRbUxJacvCaWP7Kl2n1vmzhLx1d/g702lCAMUYQO6?=
 =?us-ascii?Q?ve+tUtZXCgDGB9UqRlWhh9ttehplNf+Q5dhNwysWdxZf0xz+zjUGBDS+pdC3?=
 =?us-ascii?Q?2mxkCn4G2jju6E0LoeMFSgMqQa127+7WyRtBtIgPXbp0GdekP+jTdCqrm4f1?=
 =?us-ascii?Q?bnEqgFl1l2r1sYZl2nB6eXeDexWKyqawyNqjq+M4/UIuKqZrHkb0we0PzIXQ?=
 =?us-ascii?Q?e8rD59MBC+QeiFMdrbet3tmlK2WvBiNkEJciuAxZZ4xzkWnZ7/NoZJ/mP4Ca?=
 =?us-ascii?Q?9RZuaoAPIdXmxRoTHfZkLRbtHMNt0UIMbIQ/FN3awlirA9T3fDYQeAejjQaD?=
 =?us-ascii?Q?eOS/tkPTfHVF3Ck2o4qehQ1GylBs1iiX7y337ih7vo3R6w2bDLle09zH8Wwq?=
 =?us-ascii?Q?7s/CS0IuZDVNvTLtw+1I+szeN4XmjVgYbuZaCzpz/kSsJ0l92D4KjkZeahO9?=
 =?us-ascii?Q?UxVxlfcht1ntNWlqC6DEhsyWBqQxN/w=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ad2977-ad73-4a10-9cf6-08df39768157
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:48:44.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjCUgR0KSrM7qUwbdapFkSOaNA8MFxyy7j/Jg79+BKctGr3E+CUlDjTGmNdda9ciC+lqnIozXUdrRI9ar40s8iiQLMNgr8N8pLxvIS6ijNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0982

StarFive JHB100 device controller do not connect with PHY
but connect with digital adapter module. So it do not
contain core reference clock. So the minimal clock number is 2
(glue layer main enable clock and dwc3 core bus clk). So Add
minItem 2 to clock and clock-names items.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index bbaefad3b400..1fc73ba67394 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -35,12 +35,14 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: USB main enable clk
       - description: DWC3 bus early clock
       - description: DWC3 ref clock
 
   clock-names:
+    minItems: 2
     items:
       - const: main
       - const: bus_early
-- 
2.17.1

