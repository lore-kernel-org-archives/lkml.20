Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974101;
	b=i85obEJDa3hWIHTo7vN0LcbRuSuuMPx006vSVofPNJViDcGroCBKgibXWkaHvF47Ital
	 142hTL/QeuAawX3hQSLNzcqcuZKCNm9peIjPBMzW36k+a2phZWKxQY6Z3L14Dkhhnsf48
	 t9+l3UNZ7nocGyLrtdHbzN5w1uGezkuj72G4vdqlOmalpKbir6+KadCf4IeQPQ7EnLbaJ
	 Vfuxfy57RVnOvuFK+vbj1Cut5SiJkRPUVGCrHBmeHNs+/L4iXoO4Ua3m8dSa3uwHCio56
	 4nZKL3J63OiqC794p2qhSXf2Xr/zsk+Yxd7LgMtdnDn2pIgElCoXFgvKyQCJh3kupHg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974101;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5n8AjyUv1UrjqrzGwH221GcNseuQyqfrXthAkeij/Rk=;
	b=IO+GpzjRkZdFUQZ3KpnD2GFx9a6zYxnAGEOD5iw9evFtOrI6magZyLzaMbE5WPkoo/uw
	 T0f8fU0HePJVH0aKJtUARWRDMA21OuZsS7C9gJXIKiXzus+LSqwjfbcUI9fw7itvtsL3g
	 ASK0gEynpAabY/GWHrXtJoT1TfyVkyrZyWcCGKRSJq2J8BIAIyADHjwwaYxqn+AYLAtAG
	 1Arqyc5Hc2wHmfgqxnsX/rqZI0kDQss1jKWMBM8PaqVgfgO0wyABYqQw4L1kinNV7YWMF
	 8i9Wy5NRm0TyUnN2Iag0/pP1REIEePC1g1IjkecgSEjCWkUNOmrkFMDGzhvaAESMYAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=phytec.de;
	spf=pass smtp.mailfrom=phytec.de;
	dkim=pass header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=gQC9eudj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.143
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020143.outbound.protection.outlook.com [52.101.69.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53510606A337;
	Fri,  6 Nov 2026 14:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53510606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=gQC9eudj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHf2Afn067YIHmMw3V5REOE0U9EQ1Zr6BDnL3c3MrgKCVYwhpARkfv+kUQPCF85vsA+qrCpJ91knkTpiGlGJXnYvA05RhXDAprI6Txv3L2L45U12GJOJxqdqybThvqzXFGVTj+fnTlHh4Zy42BpjuUvWpE9Sb1vi25kBk8HtQRfpRq5DD/LMf2RjIycgQ8kQb+6bUp2bRqQvS3Jd4yQHB5dLKsAhUsWs9fvjn+/l0+i3YjJlK+66N87RGlvLmsp1xbu/opeU39pZnh6qHv3SWpHM+xEfGqOOEONZIsBJPlYqmfjySM8QVM8kD3mUfuZFxCebjlp/YKqfyBDBKAopQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n8AjyUv1UrjqrzGwH221GcNseuQyqfrXthAkeij/Rk=;
 b=uNP2lDteIZrbwxa9OyhWNg9kQBwQUlq0Ot+1Jt0qvkGXiByBiiWpiEnfqCIA1MAGpDTykADDRIATlpQSTeLyqS86dY9Kovym3iCXB5Ft0mUnKHCvUhOM5Yz5bLnL+FkkkV9mfka7HsZjfPGRQNpjfCAt7syCbqW3LDQ2xC4NVf+wpQ5sF70J9bZw8JlLLC+7SYKDtIu7U3cLOYMumpO3tfPxdr6amknqF/5lh9Uf26OiovRWVfOBaDPyy71P0LH1sr2ZjSxnwn2m0NjtxetuUoxumoCeMCGLkI/7TxH/+lhz3o5SeBv41yt3oKcN3jgeZP7GYgY3B8+9n7MiIc08tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5n8AjyUv1UrjqrzGwH221GcNseuQyqfrXthAkeij/Rk=;
 b=gQC9eudjuPGqRrlnY0vPg88Lurxso7IPjwyzjFfp7VR9N7Kg8wzqU+ILAIDxllrMYibeqISfJqtutLyZx2J5XM1TWlOroEW0EL/bwi4ePjRB3lO7u5Ahi4QdIq4q/XpWhmPoDKO/1DaQ07FGn+vkbsyhWd1Onu4qkNLyUoTE/D/8ibyGDnwcVCcCg1DkHgYunkaDGK2jjeYjrNS74MxicLbi8dsF6GGH4aS6FuJ1YyJw2a/1AaWL7mXUUv26sZ0MWnhbyMxzNwIfH8bn//FWejAq+DPfVV/Rz20WfFdgpHRjP3/NB6nr/XDzQ7xvZoQf1ky5hm73PRDtAyU7OXgQcA==
Received: from GVZP280CA0031.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:276::11)
 by AM9P195MB1314.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:38a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 14:08:10 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:150:276:cafe::32) by GVZP280CA0031.outlook.office365.com
 (2603:10a6:150:276::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 14:08:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 14:08:10 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 6 Nov
 2026 15:08:09 +0100
From: Jan Remmet <j.remmet@phytec.de>
Subject: [PATCH 0/2] arm64: dts: imx8mp-phyboard-pollux: updates
Date: Fri, 6 Nov 2026 15:08:02 +0100
Message-ID: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNTQ6CMBBA4auQWTtJW40Vr2IMKWWEIRSa/mgN4
 e6iLr/NeytECkwRrtUKgZ4ceZl3yEMFdjBzT8jdblBCnaVQGl/sccRAzlFCP7wTWewI2+jZlYv
 DkxKi8cs05dJkH1Mg43ju0Sipa2OPte4I9roP9ODyO9/uf8fcjmTTdwfb9gE/rdC2mwAAAA==
X-Change-ID: 20261027-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-a2179ac397de
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jan
 Remmet" <j.remmet@phytec.de>, Yannic Moog <y.moog@phytec.de>, Benjamin Hahn
	<B.Hahn@phytec.de>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|AM9P195MB1314:EE_
X-MS-Office365-Filtering-Correlation-Id: 3959bb38-1daf-4c5f-f891-08df3c0f6380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|23010399003|18002099003|10067099003|11063799006|261102123227099003|261021123027099003|261021121427099003|261021135927099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	+7Lq2UEmdpdksB5S3/G9Fvh7E0NRBF62t5j0nDYfECmYEIKSdMl2ean1hkAMD83tPeOIaUOcbGJM7utS09tY8KL7KzuqKCUrSzMUJ5vmVdoXL/Lxj4kQgquj8uaqMYOKDT/QK6FGp9ZyGlv0W68NU1m/adDJXA4090fSlsytiBtDnkHhEevaJmIOcLkb1PQzpD583su76pGEza+zzP6kRVNUG9243aq+APm9BJtbnrbOfFXLo3MezA4ZAVnIM2nNIekdKkTZYPj0AknSGzlGpGPy7RPZNfQOQ+uEej5S0buX0wuquLixYIv5Id4mZbHO6iiE/MZvqcEkqoCBMZJ2b/EQyVr058XuCXKsDivKX0FembMdNQjHZ4K11yaPBupM3WzAhHO1Pvzqh1sBGG0JuZOhaNGU5Rkls5BNLAvMZEjZVI0Vb0Sae9inqVk+gCk/vNtlF5+WRQOtlB6FM8sRsZTUb4YRn2AcuxrT3tiLfCHVX6bBcOQ9UVF+XXIro9CBpox0n1diFflRCy4FUtbzSo2xxWx6CCHDmJrAQycYYWbMDm1NWhJjhtX/FThTlRBXkWN78Z6MYzFzzlfv3B2cR9E8qtD9ICn2fkFvC2nICPNVv99Gpm5akrgCOvQU4CosWTAOk/bdc2dfT2rL7Iv4NADLOwfUWfH8TH/uhSD/mvbAEoC7qyY8zxYI3b5NT3It054HKK/vDSsgpsD4ZNMnJQ==
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(23010399003)(18002099003)(10067099003)(11063799006)(261102123227099003)(261021123027099003)(261021121427099003)(261021135927099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xL8xNgk2Z56WJazpu1yGW4KG6Aa34iYA9cWdScsyhMBwyKdJw/8tqrwk/Rp2Zkt8yvBfjjq/pBYLXZBDwxAWCgbcb9IsJ9WWqr5Uwsj6YmNsN449vc89vDQwNEPIZ2up+eLUNxP6gWAGYqwWABdWoHq7sp7sGrNCbyAVOkhXXBfJWBw+0pcB8aXHZlF2CUytSOfEN1bjTlLSIXBWkWtuqnelKrrQ6KASYXR1IUmI1QxPG7oSVJ+PTpWSdm6nTulUzAX9w86YWY6vIfENMMpxlyzXR1fZGoN7xwntUviCbuq+6MsrUUVsQc7bc6gJWzgykvZQ3D+84G4aw/rSh7iptSMTRUdXy9NyxLsYbRHUmmehJaOLRaPP/4gMSwvm1wrsmQBCPJH6zei36pxoVV0O1aiCGDg5wL7E2g0Vd/mc+mDDFZp20pfqdYELTgnmsfIo
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:08:10.0902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3959bb38-1daf-4c5f-f891-08df3c0f6380
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1314

This serices collects some device tree fixes for
PHYTEC phyCORE-i.MX8MP SoM based board

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
Benjamin Hahn (1):
      arm64: dts: imx8mp-phyboard-pollux: update gpio-line-names

Yannic Moog (1):
      arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios

 .../arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
---
base-commit: f41c0c95ff151ad818424073d648f67aacca816a
change-id: 20261027-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-a2179ac397de

Best regards,
--  
Jan Remmet <j.remmet@phytec.de>

