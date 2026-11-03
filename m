Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=139.219.146.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793688536;
	b=0mUAINv2EtjjhxiK6MJ0IaeBhfe6CamyPMZ7fnhwYr9+7hTkkk66bhBMtz+2RsRFmQK1
	 ztcPnyQ9YXlRbGeJpVjZTAq4e17PEMaysPnztm6Azt0ygfvVK0iSGmnSHncJDz864rOSb
	 nt+qBVEaEHugDQ+vVCL279oFtppC0JJq26mygKX+QKobPlIXx3KKi4Pr5WYuQj6/8lwAO
	 9flu7Pswms+m+mQSpKHAoVkS7HEagHx8AbsDg446SYKp0fgtUyrzn+bCPEZ5R+Qo2GW+3
	 oZPuba5eYX2HKLvPQzIkDmg1P2YDlbYGEUDoIXKRl4c+zl6jfMivXH/AzV8j9mZIgFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688536;
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
	bh=PdNSCJ9nUdJpXU8Hf2yE6QZ9X2PAxqj7sssAhj7oH2Q=;
	b=vzAZIUxga2OhToMU/yX1vRg/d/LJvkGCoOrkWAwDIIaXlMlSi1zhSUWGxIvy6PecR+eY
	 5J2J+Zl1kxacYooIh4n/YQHmJcBJIVa6S7wrKqAPRE0rPj5yJfxe5/Y9XRHlos36xFpjK
	 /yDh8jXLWy5m7aOCRFZP0X+PjTXtWLOcjDrgi+U3w03vybIH9uCS71Jxxt4+G1UeEdzi6
	 5+DyAXU26XNN7fJtEB2h2NJIakrtvOs8ULwSGwTQCo6KcTVmN203aOgfJ59rDTnIeTttq
	 I0x/sdPBBqqQ2yG2QECPAyWXIiF1aWA9BT0CGC89q4BPgBj8gTyFKwViez7UFNUcTog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=fail smtp.remote-ip=139.219.146.116
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3729E606A329;
	Tue,  3 Nov 2026 06:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3729E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pw6Kt4zZbPb2MWNi6F2h/PJ4GctsAqoBJxBuYJkLUHKuzycCqI3y11WCrvzgB3qVvs0uJ6Pd5V0PEkCTHszXiQpy+hraQGQBdWQ1/39dDZP8ESXp3uw9uopKn6VBBHYZDhPk25xNUPBUPKDbI4ZNW3r1frQhkLhiIYCOK524DhzELN8azuSWBUtR+EDxAnmP9z2JVLT6BovSx66s3jC2XGIQS7EiSCEH5IEVhDL9Q4Kv3RiKDxkPb98FJz2+XMTg+9xshyPuL+ds5BGFsOtQYCv6hL6KjkIEyuwBlZv7f09iCUpDnYNAVexTxTkbYcwOCKYuGatue0P/lesXR3cVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdNSCJ9nUdJpXU8Hf2yE6QZ9X2PAxqj7sssAhj7oH2Q=;
 b=IJ3Zu3NLYzF8G1/UoAvFApjWUusm2ZqG2jc7T5O/kwjpSV32Z2wtios5Sk5I/p/BrWnVdR6EuclyzTkGBpFs80WraBzlcKVGWeI7tX1xPN4xn8lIQCRuDY8lYREE2brjCuFBcOs8RcwWKCmq0JaeBH2dO74o4VeNWJMJzvySc141yyIr+SGjnBQNFeJHpNhYI0r7kPzhSi9XdycehB62ox9vMxI0f3ZvZ7x0v0Mqrem2C8aMmVLB3oKcWAqDYtP+mijRxy4S5UpmG61C5XE4Q0CBJ5SwLu0RHxCqtNmLLuL7eYh3B0eXLp70q/PjDfWPRq1Vvg9NMwhyQxwsoylHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB0982.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:48:44 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%6])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 06:48:44 +0000
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
Subject: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add adapter register region
Date: Tue,  3 Nov 2026 14:48:34 +0800
Message-Id: <20261103064836.71059-2-minda.chen@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b2d3485-a259-4744-3696-08df397680eb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|261026121527099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003|38350700014|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	gn/c9heR4uW2DVjRvaff5LHjECbi4TLnZCoGGGINni+QeGxJh7CHN4uGDsf8ozE4RKi1Ur6GmCOFA+8/f0MKhiV9fgThgu9jlXK1XLDkq+iAfBRucnPleeY+rsc4j1TLCInhE/xXPx4Vm+zFddNNJVjiGYwLRNuHCZQ0OYrAAM+F9a7gBbgdxPL0rU1vIXzhWNXvOs1hIybDtYtI/E9aef1H7w7woyFAYzgrH7ZtE5SaCJxjO1zyBZDBjufmcGHn03R6Q60VfT9lDzHVN0oNHZEA+wnV6VNsuS4M0Ud6PFQhy9zz7QswSlKK6LczOLTtJRkfD5RqmWhfC4GwPisHPui7dBM08gXeERThcLMZSYMNj6r9dCfxZnkLpZ5cpRz89AbRqdPDdHkmGIagZkyZyHm7mJA/Zqes7LItByQIaUergockh4rdqNt4j1jZL5PBsBkItBNpRt7ZpnUd6g066cj9jZNXcTcp1c1mRK22YcWJiJKW+mtvIQJkO6Ti/9bvOTWB/lq5kdfcnrdrWeH5VQWALllEuk+PQw4iaerSjITuXZ3JYjgUpSik4S+7NpRX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(38350700014)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?raiVYDD0/LvEsEl4+G4dhKvf36gwmf32xQ6c+yW6u0ym3eppGzVyjbtGVI0D?=
 =?us-ascii?Q?331U33Gkjo2aUUlEKBo0Zgpzf8p7gIhEOvXU5QdljRUeq6HTAnYvdHN0IYix?=
 =?us-ascii?Q?Tg7zzkK8NU9xJt392zg1g6k7GqLPJwrCzr9Ef0MCLQrEKX2Wo54zq22OealO?=
 =?us-ascii?Q?N4KQYT/YiFnZZ/F/BzXO2utvV/D7wvAN8jHOFwsHdKzv4H77bOgAXFYDVCkT?=
 =?us-ascii?Q?WTtQEzrlF1mkIpnzMEWiboLy5wlLzZ5QF6PtmWPpSuwfqrgQmmC/+W+FPDQw?=
 =?us-ascii?Q?EZGRm7OYqriEIcD+3ORZ4/dqmeU6QjfYS17Ci20jU3wRqPvUkSer/fVeTc5n?=
 =?us-ascii?Q?gzosBdiyL0I7OWkDOnv9n8UZmS8wyTMBsIDSvT4dVDwLCudBZyRiogoIAlxy?=
 =?us-ascii?Q?SgAbSaljF4DI/rE+tjYHJGd4kRFKu6RLXxWATuK4z+CAIUNPloexGsZYqm1F?=
 =?us-ascii?Q?dO5dk/KLRrYCuqbYAv6ZR7jTkfti/qzO7NUE8WoRTziU7z/Iz9z2TGn6DkmU?=
 =?us-ascii?Q?ED+A9WYPYd0KNdz7Bw3hUw+FFToZJnmcwUIddPcUgplC/WybXjmvnTzWPwli?=
 =?us-ascii?Q?NBLgcxSL/AQetVyCuWugIfZRLURImoyyxUNFvIwOCDGnobrlrXivn6jAtW9u?=
 =?us-ascii?Q?2E/1P+3i9yV4s+preW3s08TuhFI/q2Dko0N6bdwz99UUvOOxRpb0Wfym/hIG?=
 =?us-ascii?Q?4WEsswHb4rvpKNKM1gHePC4SpGJWX4IjJLKnYzZ0JugFa5it54JhF9uHlBRw?=
 =?us-ascii?Q?5fpv9SiUc/0cKsJr8aGPXG5+/28qztts/jz9iUYtUsb5j3UbEZk4KgKcCRN0?=
 =?us-ascii?Q?FO65CIL+Xc0TXN0kCieJGhdP4r/0Q+JE5wzmoEiDMkZF0XZ5utnKvU4gDBd3?=
 =?us-ascii?Q?SxQgiU5tIlSpppZdm81uBTn+OutD3C2QfL5xyi3D9xwWiWsFmRHwQpSzgcYK?=
 =?us-ascii?Q?5/Urg6j8dE5uP7DS61pvOGyuVluGpc+zmBnv7To872oKnz5YnWVJDJY8mhgZ?=
 =?us-ascii?Q?UApoauf0HQ+tzaw9jCk2shVqnUNdpfENWnJQmiZj/V5N0YF3uRcWAUc7ANBM?=
 =?us-ascii?Q?RgkQbsVpZEmFz7ICxjO5wbMStYp8iSMOVROkGjcXQPY+22ohKF547cnd87s0?=
 =?us-ascii?Q?xo5Y2krMl3HKCKJuvGcE0d472Q9/FS32Ic+1h0+PlF+qPkaBIRP8WWMb6ytY?=
 =?us-ascii?Q?mq5JbaM7pQxhGFMN9GTHGC4FHP/kd9U00Jc5hvbyVCH5cijygK+34k61xhlc?=
 =?us-ascii?Q?ybt+IVMy17/CXJVxWqa9VltHLCws6UJg3EFQgorvFzS3tROTdIPZwhD4JaIX?=
 =?us-ascii?Q?w+er89SDeyqKT7xi3NImNFvtrk/UAaYDRE2uqwB6pTXmvSps8nO62cS6OiBp?=
 =?us-ascii?Q?GH6Z0zLjuTzJFQ+3ZOLTLPQfEUp0jC4Iq0MTfEA2pbVNujq9d1p54rIlieQ1?=
 =?us-ascii?Q?cIOXGOaaeCoAE4cSgs3FiqvZpjyllnt8avYuXqIWOZ3gKlrkKbANmL/w2iBa?=
 =?us-ascii?Q?mYwu8x5ltBzyEevCwYfjTn7I47rXIOvlSLfWleZh5ftOZyjOzB1ofyggZLeU?=
 =?us-ascii?Q?US3Q1zhAAkRNYUPlXhV/AMwg7sduttKVR+4KYDkQ9VJ9748A1Mw8zhQzRW+f?=
 =?us-ascii?Q?62DTe3CLpwrXSMIlNbqqtqDTHJagWrizBCkIlxZYQVDYLKxuTIHP3cFrZ6/g?=
 =?us-ascii?Q?JuTi811YYI5hlrQR83U77YNtjxP6e/6zzORccKE9nxbE0AxlPxtokJAzdcj7?=
 =?us-ascii?Q?ezZZLG3bRskFW4Jdh+tHNJchDwauexc=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2d3485-a259-4744-3696-08df397680eb
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:48:44.2675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lYTYu4EUkJv6OPkU2nmrD6chdZiAB93saIsw5yo3JhOKZu+zSo3lWfJVSy1OvN/IKmUsxzHN4u+4Nz6cpOS9GrAUtAHvF/Alu9LXrWxo7UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0982

Add dt-binding of JHB100 server host field USB device controller,
which still using dwc3 usb core and contains an extra PHY adapter
register IO register region. Require to add IO register descriptions
and regs-name list.

To compat with normal bmc usb, which contains only 1 dwc3 core IO
register region, add miniItem to 1.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 .../devicetree/bindings/usb/starfive,jhb100-dwc3.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
index fbabe99e9d5c..bbaefad3b400 100644
--- a/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
@@ -20,7 +20,16 @@ properties:
     const: starfive,jhb100-dwc3
 
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: DWC3 core registers
+      - description: DWC3 device controller PHY adapter registers
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

