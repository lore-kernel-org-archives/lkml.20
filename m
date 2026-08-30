Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11063603C3;
	Sun, 30 Aug 2026 06:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072708; cv=fail; b=uREiMFklUa4A5E2K0o2w7KXQT5oBLeEavWni1ex9M/dzRI9cebcNKwykkiunv1Be2uInBH7xCkkIEnV0IWpEqk05lBKQkI4qf+mmlbVfqpmFDZBz/0u9yMSJ9pKd+DpJThRsX3O1gskmqRXQOzw0x4BRv0lwbcXzivLn8M2DGpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072708; c=relaxed/simple;
	bh=E/s1SM9JdbH0mJiDbmF+W2z+4caohcx1bNW/miyYJvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CZXI7SZ5wSdO8ODT2fZoZgdwpglv3Q/IR8Seciy9tYzZcGNKDB157+dAjJCjZQJmI0h3snW25mHH5c08lzbmyUW/FNJ2qDytkQVLAhngbUqjFRya3xrgxZzbozfyj/4yO1DDXlPczjn6ZsziwWJkoqhC65uj5tivsw2n4LoTDRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOn9TTGpTXU0dKgICkmikeKViJyfQjxch2OeYqFY8Y8cYDANug0kz91kj7ff/Blh3HZGOimQLCMFvPjnTorWzklfJhwksmkU9RtUiGnDu7ZY/aKMSGMAdoSSaqmGBSh3W//i2cygmBCFFS0T0vzgOI1s+XV9Tm2KuliaMgTMhJ7MB44nj47trZsigNP9vJ3BTXrP3zag1Bk3B9vECXHcgLP7rnRZtXKqpnWU9Ls0UchR0i1gUu9id3DahIxzKJCYBj9qBwVLyBAJ3Qlxb4kEA4xyYQQaoFjHc9qdPi4FxElpuQkhiQ6dcFkljgphUBR22vRv8IzyImz8goFnkPzAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0iFlagkn9cfjg2xziEUNqjg6EbXsyfD97TZEZxdAAk=;
 b=Kq8UOErulyCgwi1UtY9MZo+jWOfGTuvLiH7t5LIW0HK5Mlzrw4xfoVVb051AThwwjJpnEVB3y8OxKKm5/RqmMWC2t8Ym8tbsYi7x2ByflDcK/rht2iUzhQ75QvntrkBPJ0xEHBtxSSdUdotwNgb5imx/167xd07XkhIV2n0O/3Q7FBeeDe4h7j8+Z6gIDsRnar/ZO3rwq/orMYYIO1Euc9AUQBb3qnRRhXkLXT1EOv3Dz9uSpcrpFBuw1cAemYEnBVsggI+FtAZzSxskeuNtB/zQS2y2J9DhBaAZnAgzTCETBJJq5i4+JCflJa5/vxgqrcgsOOYcWaTX60jSsUgsZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1169.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Sun, 30 Aug
 2026 06:51:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sun, 30 Aug 2026 06:51:31 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/2] dt-bindings: soc: starfive: Add JHB100 UART routing controller
Date: Sat, 29 Aug 2026 23:51:17 -0700
Message-Id: <20260830065118.51551-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0069.CHNPR01.prod.partner.outlook.cn (10.43.33.36)
 To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1169:EE_
X-MS-Office365-Filtering-Correlation-Id: aa6644d4-0a41-4db1-aaf5-08df06631fb2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|366016|376014|22082099003|10067099003|56012099006|3023799007|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	QO7AuRi/E1zGI3COex56uZp3455YR3H6sfW67BWSf0kVaVDqvr2XV40AS96YabXI1uej5KmH0exaPrk4MxjJJUG/rMWqsBmpfnZ4A/3YmXebWLTwtq8P/HECUdo7//SFkhotUbumI4oR+kNC6ivxFSFPHUuUl5Zgqruz+44G8cXb5+IEt0yOf8kVTSvUEXFRiJaTWR8/NKkwJT/W7t/XExPauml0qyF+co5aKNIU7zFxG5ke3iQ0IkIGZ5ODUgph0oCnMBP1QLAq/1Eonk4NcNJ55Rg9Uae+Bak0pdrgLla39rPswOyP1VjFW9/R1307bguhVFWEomFo9wmrQLdz2V0oX5u5cv6yCdzLB8QOhX0eqJGi3jiRJr+SbIDilC0cC9FiJZtPJa61EWOwUmInj1DQUlZWCtqiK+nNIfsmDpHLmd7fC2oC+8AW9Jorz/22xNm4CNz5GbkB0AgYSscd3Ck91X8qO0J+Rtwu67QqLGAH6DZgMLyss8wLZTbQsm79HjwG6rMJyegeuWXYEutEypHMJSMv6Yo3roSsA1U787AdXBmyPQFGW1Y8fdDxSrEK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(366016)(376014)(22082099003)(10067099003)(56012099006)(3023799007)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lgEsrx03jzVzt8914ql8sEQirfhXOioPJ4aouNj2d9GL9wMqUl8eTnLMVW/Z?=
 =?us-ascii?Q?YzHEYpScbUOqU7GPs/Oc0wmHnhThVMRBH3JdDC8XP9LIv2na2WKvrOiXqLLB?=
 =?us-ascii?Q?VxslmmQuxZT/gNqUStX+c0CQiONfp4g5AJ9m6nAKWLFqEGe1p2qf5sbJgZsZ?=
 =?us-ascii?Q?dFwha0wYVU9gga5qJ7s3Adh77JHIfQZlsDLP0dMBwLcDf5jbkyXgtY3E1t6u?=
 =?us-ascii?Q?+m9vHO8F6F39YKGzZKHiJMGP2kA29JSZraCuVNLwtfoxkJLxbZL4UqlGEN2Q?=
 =?us-ascii?Q?msmjbOwFrXzDSSDrId4MECP6mbnGuwZpdcVGV2k0ZJ5s1FRELw0a5l5xmgXg?=
 =?us-ascii?Q?q0ZEeT+fGbrHr73T0dh0Se4wwlW7RyMTcL5X/f3F8sNcgJwAjy3J6JSTH8dt?=
 =?us-ascii?Q?OXZ6bIbTaKTG3+28bRnSBEhv8VVSYBtZ/OgwCkiAdsquSTHsmcIKunoxjrjH?=
 =?us-ascii?Q?5p/f6UdiuSrj1W/LBNmrGo0qEdGfosknVkwnNJcloKiqfZorS/e0Sqv+WXfA?=
 =?us-ascii?Q?RDj49yrWitlWySuf5jCJqEBmqkOPj2mc1/75Xv3DQtr3YXooqtMDSm2K/PC9?=
 =?us-ascii?Q?2FGml0ipCjlubP8ovseuisPQVpxnGyDfMmmdxUZAbHOciaIIkTF5biotrZP0?=
 =?us-ascii?Q?hzzxl3OFH5egAK51UY8ibWDlGpW1r3FCdzIq43VlVp4HEma3grGNj77e7crO?=
 =?us-ascii?Q?LoY+D11y9/diqeecm3ivrk2FrmIHvzFoTthPx49XRSk6+FrO5DPJ+2DrKPYW?=
 =?us-ascii?Q?DOaQzkzloEPHuAsDOvHgslXZRk4OvnQ465JRGdXC6HKizNuUCA/rVAEXljc2?=
 =?us-ascii?Q?4fNkQLPRq0X3oNwsHVQa1WEG7He9JXoxbyndOluniLcoCdczqyKGYYB2Y9xS?=
 =?us-ascii?Q?xllqR+IEoa5jJzL61AKX7+20hdAP1N/bxwgnxRqGIwPIEr5kKqmO8H52Thni?=
 =?us-ascii?Q?nrJs61mtVOGI7WhvZ6BasIZS0pFgSAbLnPmSdQ+RTomAJUJCyBEBhj4+oBfo?=
 =?us-ascii?Q?ChVYE4LS3oa37DA+BpwciLiS6gvLoJ+Czd5tAHps2k1Z795r3Z7zM0YuuAWl?=
 =?us-ascii?Q?OlfoEi758cx0DYVHLIIT78kNHGXosWPFExu+yqSQtsDZr9Tq9ZpKMz8bKUBE?=
 =?us-ascii?Q?eTK26beiyrWMCyKMCID/JHL/vKt8STyho3k9fYqcVgdkgAGUPT2m6PYz/FB0?=
 =?us-ascii?Q?rp8Vogi1uXBvr9FtintHR1wS/tXU3LlIA+gKc9kbGioFf7HwbMesd0mZtRUL?=
 =?us-ascii?Q?1Q9I9gsetOl5WjrvOrVvMKMRGeezYNu/jksuoxqbJMMtbXP/PzlSUXRpkV1/?=
 =?us-ascii?Q?1vesyq5sqKUll/TFh6kJFczYOh6X/6P2aV9PpsmCnMyoZBtU5TeBDvcRUhNm?=
 =?us-ascii?Q?kF8m6X2iftIBUqCQGhseNSRqlgH04UIqmfqvAgOknOwaa4tzTKQuGLVy5Lt0?=
 =?us-ascii?Q?MxEoleEuhhYUMi8mjZWwRwRrr1Yi8KTFwTesYGWPu1eYNfssBQqsAoRneFFr?=
 =?us-ascii?Q?oG+yGgFTtb+6M71PsYAeNcPtML8bZ+s8Y9UBKPfD7en+u7B04fep+M7L3rC+?=
 =?us-ascii?Q?V6kl09+ZNCXfprP3bj8DmOEfiJ0g6alznoo6YLtOYc8yMwY4p65ebHWgbBws?=
 =?us-ascii?Q?bFUPQKUNf8XYD32DLhhjtdzVMrQ+yE0x2rbie4nIMX6SZNBGw+TZqlaqh+NG?=
 =?us-ascii?Q?t2zJeSkmGisVpZdjNWbDv1iHrV+EM6P3Jl6zvt4rxwwpQUIl2rL3E+r71Q+E?=
 =?us-ascii?Q?6Hmi8+ldWP4PDNJztd8GlZPmdbouc5ANo/stwO8aXBS6IIJyIa8h?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6644d4-0a41-4db1-aaf5-08df06631fb2
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 06:51:31.4748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfT/OZzI8auF+Uyq8uRIUzorW+E89eSiHn2Fet9wCL/D/IdgdSv4i7wpk85HqdueObfUcEoH1+hrAA0lJJT6UziULurvFHHNpww1gziLYOtQDIhcxrcO6jI+LHqscmfg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1169

Add device tree bindings for the StarFive JHB100 UART routing controller.
This controller allows dynamic routing of inputs between built-in UARTs
and physical serial I/O ports, enabling use cases such as Host <-> BMC
communication via UARTs.

The clocks property exists in the hardware, but the driver does not use
it.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 .../starfive,jhb100-uart-routing.yaml         | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml
new file mode 100644
index 000000000000..6719ae59b9dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-uart-routing.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-uart-routing.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: StarFive JHB100 UART Routing Controller
+
+maintainers:
+  - Changhuang Liang <changhuang.liang@starfivetech.com>
+
+description: >
+  The StarFive JHB100 UART routing controller allows dynamic routing of the
+  inputs for the built-in UARTs and the physical serial I/O ports.
+
+  This allows, for example, connecting the output of one UART to another
+  UART, which can be used to enable Host <-> BMC communication over UARTs,
+  e.g. to give the BMC access to the Host's serial console.
+
+properties:
+  compatible:
+    const: starfive,jhb100-uart-routing
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    uart-routing@11a42a00 {
+        compatible = "starfive,jhb100-uart-routing";
+        reg = <0x11a42a00 0x100>;
+        resets = <&per0crg 74>;
+    };
-- 
2.25.1

