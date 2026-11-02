Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628251;
	b=3vUiqeYIHpQszgvOwvtQbPPs90bfEqBgi1uZarwE4G0By/tX5peRQ33wu870xEMxPbpm
	 ck2uVDEPXqM4AmvnS3UjkNT1mqVPceBwLzNiPZTvApTUkQ17XT2DBlr+oUquLLaPRBlA3
	 XJjpcBqgzJSkS5t7UpYX0nFWVlO9I37OR2aMBF+o7nIDmcJErqI6w1uO4LCnARq2EUtXx
	 nVblKgVtq7+e6I597yhkRcQGnsc/d3DnCXZTP8HiS+cPrsk3jBe5R9SOJ5u1QuDc2crOu
	 qWg0egjI8IujQbm3hXpEW5+1ZvjbaUlumsi0WU2XFKTX4XsASa71VM6sFPtxUILx2aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628251;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=30Mhw5T6VIPLQBBT1IEg9GEUyNV4IXCWhE6JWrimVcQ=;
	b=GNFeJoAXWxErBZnXjBPrBBkw/96HXQZiiE+nkRIJ1bwJd2vz7zlL3BxQ0DsQllfT3ewM
	 XQdpYWttKQlE9U0DL/HXTRNewEE/ftx4VS85M12GA4lJn0L1HcmuY0oa/HyBhCKQ6NbJT
	 HocAxMgJP0dwm8Wo9d/ewNkAaG9mN0OgFANTbC9hid7VhDlb0p47adsiFhBEpRbuq68aj
	 pj6cK1M5VXQmqn7el2yrM31WvFHJwSsqtyxbdOoUA+APOaDyXtvV7zBPkyMxtiuBt54yN
	 lY5dC55ma9ShHavpxtsgNuBeozMhO//MQz3qxhMqe444sYZw6ahhQEOXx7KHJ5hI+iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="HTXyCA/A";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.33
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F720606A324;
	Mon,  2 Nov 2026 14:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F720606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HTXyCA/A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPcd2sLG4V2CjAHOoShag0+jVz9brvH+eLXB2uY289t+8pOd8pNlne0b/HjkMF6DvHpVISLoEzMxJWSa8epEHko5CDa9gwkTle+XqZhs7ezEJshioITABPnYtWJpfDwMiP7futCNEv+GAUxD28gvymDD6EIKlXDGn8r1bxbyBA4Q9zAZkkFnInbkOFBBkQ/56GM0bc+gByNUkVLrO/vXZBcWYnHYi+wz2PUVqLiBXlKn14gkhhC9YSDOrwn0/4zs0fJMjQaBImqmvRuMeEe49gOg5YzAdZJzUjCh87YheqWQC7jgp9ECX9g4Q5byvtH+G04H6j5xyUjnsoiy3a0aRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Mhw5T6VIPLQBBT1IEg9GEUyNV4IXCWhE6JWrimVcQ=;
 b=szGatx1CmzQ1AMVAdpR56U1F7Uv3p4QLiqE2PSJb3XFiWgzsQFLcpgvgfi9VToo+qNlndUNPNTMY3ZoeCJphxEFeLl/Ws0Gnn/vyAMFRlp1cJt39x2238ADHTbM+ndst113P9RWE2WK+jiqaBDp/DqDXNK8WCWTqGAf0ikHhANaoxoDtymb10/qPIrPobcbx4L76Rom33pI7pbSK0TiiZGMYNAq9d88ioTlTIdPYnSYXlDpeMEaS/C8EQeyzZ0vW0jyYo7JdaY3HZyZusSWTFi1FkitF0fArc5KH0didd24jjcwPWFQktDPKOqTbiF76ibAmzobEWcKPnpd5uVKzdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Mhw5T6VIPLQBBT1IEg9GEUyNV4IXCWhE6JWrimVcQ=;
 b=HTXyCA/AsQc30L7OxU/yVxSMGAzQSAOelNt83JEMVscb7wQ3e4XqvBDkBS1uhYQiJid1ev43g5M6QadD7D9ZTIgsM+fw8srzx+gHeXQjUSusKm5J4QkCzzL+ReJv2LBY7/wJzQlnJUah2xDxmn3vWxgAAtSIVXximL3iy71/zZG2kL6IIN0JLUx1zSH15wWcrB7wzzfAXufIs+hJljruHI9WLy3mgMKbn+Kgo07JIoKSn9hGNy6ISimcC7y3ChWSCe9aHEB3LimsLPtcgCZtgYvxzt6qKxqcsso1I4bER6NqU+Gr/gShjKLsPa3kisYR3YcYgpa1C2lsL1SUufSApg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:08 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:08 +0000
From: marouene.boubakri@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Radu Rendec <radu@rendec.net>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Subject: [PATCH 5/8] dt-bindings: riscv: add OpenHW Group CVA6 APU boards
Date: Mon,  2 Nov 2026 15:17:24 +0100
Message-Id: <20261102141727.640769-6-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF00013301.namprd07.prod.outlook.com
 (2603:10b6:518:1::f) To PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13)
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMBPR04MB12565:EE_
X-MS-Office365-Filtering-Correlation-Id: babfda37-50c2-46b8-04d8-08df38ea297a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261009223027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tAac3noDdZOUUhfzK1amEv0/jVjhg8RVAG7Z59drPRhDxycMn0jTXTpygVIbwnD27C4NGMOAn4ZUoWixE6S7WjOs/EoOr1wcBWwyfCdELjQGmxg491z7cEwp9KJOozq85psuiOVWGTj9qHHW5glVr4+HSXuhefOFXc437pVLSEqbi4iwht5u4VbtmetlNuAtDaO45CTTr8IUdvL14EiPfjzy1UqCFsDAqgtARS6jDbJKXw6lur50VUySgzsf9ifhYh46ouwr8iFE3p+6CvPxjo75Y1yRGtXGab4AaaoMjI3RTxhrxqfyg9s3z78cDpf5LrHIW0iUaoexjoDfrTHG5IshW7Dgk+nmMpHMNXYeSXVJJgaw3goKlBOb9vpPBQwMOMkIM/dqKK3Gi20I8xswERWvRihwylYg3GXiPr7HPZm+R//jfWGvjrVbhkc4A+FT2vQtyL4rQdofJhk3oyTIiNHAIyVgzZY+Uarw0wWNZvknH+AZBIrC67T0uzl5zdofMizbqx+S4KEtWZ48KJ7jjGN3zlIbaT8d8s20mShysfNkrBz+jT9ZNLwynP+pNO/HMDwMddj9MqddtI8MTpaSWGROvSvjSZKGuKXY8Lc8Zez7uZEd1B2QTRNzsQoFGOgy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Gw/mzGsoHqZeDdXZS+Eb5OMlJm0MaFxCsvDCR7xa5biqm4jskfWVDrBw4j+?=
 =?us-ascii?Q?3Ak9yI/Sr/0zjtItJuomXqGHuY7MbiEBF6n++Qup1jFHqt7aRmuzUCBKdHm1?=
 =?us-ascii?Q?44nGhcvMrG2z1K5vCvEoa/aL6X8XqybBAFG8JS4ygDIkUFlb8gFK3OROQoFk?=
 =?us-ascii?Q?ctE23K6+4vGlrMwW5F69lq0Z9/g5HZZNRrx8Unhi7zEV/1olSYJxt6w8eLsb?=
 =?us-ascii?Q?sUBkGyaB9F2Pzwvud1pOrqqZJxTgBLceU5ecLIwjOOegL3XsIisik87CKTj9?=
 =?us-ascii?Q?0X5b2/YcQBMDzSCiBM3OVEPA09aEV7LylOmysOy2B3vmeCKJ/KDyZ3HM1wN1?=
 =?us-ascii?Q?OT5ayMurQsJDG3YiOAiSwAV5jHqMPq90ZeyyYdT8+xLLQWaizO7Lpr2HaUeR?=
 =?us-ascii?Q?d5Z3QKcgmnTLTMggMZiW6A/4yoC9OiRmoSCb+5ROHSwWbQ+9zSCwowK5TRVx?=
 =?us-ascii?Q?rCXrel4ar09EMbB+Yi6Zb+RoENSLG5f8muLwHD2no7D2EZORaGelYS8wqjll?=
 =?us-ascii?Q?v+KMxIpf1xl7kr1djaM9cB/5OcQKKyLo3WgmWBCnCv/hiEcez6RZ2/PQLbdP?=
 =?us-ascii?Q?0Y4ZudRFpVKwDpStkeIxKgeG/9XYB8nQx9vKgyy3N4UzoHd7hSUWpMpk0zVU?=
 =?us-ascii?Q?OfKHi9eE8o4yEmoBCxCWGpPiB5fpdgvggeyx92ZpzrqShXlZOZnn/7ZDo0gC?=
 =?us-ascii?Q?zkPAzirZy1MiMIx3imKTMTpqQn2cziAnehp2kHZ04CPLmzDdb2vhs5N67Us2?=
 =?us-ascii?Q?BVerBBjf+ha7AXUor5cwxRYssYngRP0U7belIjROxv95QUVcjX3OWsem3PZT?=
 =?us-ascii?Q?bblL9vWB2thJqidH9aswEtBUyyXjprwuH39zAAHY0+a6nzvEw0eR5YxrR0CR?=
 =?us-ascii?Q?V11UoUFRrbfIRoQk/EY7lZ+euNeS+UaA/khgasTA0MQDbxomS2FJ3bdGeEuj?=
 =?us-ascii?Q?RABy6cUwLlIBa1PR4DkgO8EPU+u/4BgOjT6oLe5J9STPtTFemAQCsl6EZ7iZ?=
 =?us-ascii?Q?T7Gj6MJcBd3f/JN7TuYb5fPGNcyg1GdYLbkFLtmt7CzLNiwkyZwG7GSNV3RE?=
 =?us-ascii?Q?GDIfAeFm5CEYz6AZ+c9ehUzkMUIWgMHGs86JuM4LVkNg6UCYo2xPNqyWB6cX?=
 =?us-ascii?Q?qESXNLhgTjv3izuJpYo91bSwygthwEEuTumCnsaaVw+/9PMrtlXmQ/GQPo8N?=
 =?us-ascii?Q?cqTwVmCmI7eS52PcG/eXAGTK2QYnOW0/WLDPXnIYcv+81NwkTFY5/6VEabZU?=
 =?us-ascii?Q?fYTKChSf1E8UqKp5cTQDBgo17TPENyg96h23kUSgNJeIHGh4s5ZhhZrwvqrt?=
 =?us-ascii?Q?6vNMGAPKCLKVnagP2L2Bm8MJmHRCYGIfceQBEXnhPoipT7hFBM/Nj1gn2sOl?=
 =?us-ascii?Q?5j66C6saxWuSG+n5lnj5utwGvnQizP0kMVAyH4KZJe82N68i4iVpqG2sKedZ?=
 =?us-ascii?Q?Fv07wBWnmgCFffr/oJDQkDccAVwcf1OyfFPr7Ta9DdL0HF43Os4xed0M/4qh?=
 =?us-ascii?Q?2/pUKyzcn7LJmlfBqiIWCgcncKc6G/eI7e9NnqeieUZTf65dKE0zCIkgLHuY?=
 =?us-ascii?Q?TtOR2tzAJr2kDy7V9btmyeg3lPjhboT5EueZ14ATQnxZsAwbiJks1SzNb5OB?=
 =?us-ascii?Q?o8QiJpcl9Tb7r6tLMtw+RGEmr7eJBKjqAnEcVTv3vVoBkVxbx13aiKj3OTKN?=
 =?us-ascii?Q?64pa6q/hPrNB71ZFxpgR5fLKZpKn46N38BEdXgo/89T2K0AjsslCwxtpcyCD?=
 =?us-ascii?Q?AnF830NvcHPmMOibQYReMkayP5JeGgnovcEvOtkxTPTjSBIflNsT4Ay8RZRZ?=
X-MS-Exchange-AntiSpam-MessageData-1: Kfb/oQ0eSzcexg==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: babfda37-50c2-46b8-04d8-08df38ea297a
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:08.1522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BfLeJymIsLBUAtaDfcplT24nNQF9DWV6EIuaibtiB24snnSLHZbWZminbq/JVaSOUo10VsAdB2lw1ZwJOwabKsd4CjJcdV5hfUNK9bgklUnUQMZCE/kThfrvijttJdbXOox7UbeJsqPX/zEUe4fEeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
the CVA6 repository (corev_apu/fpga). Add the board compatible strings
for its Digilent Genesys 2 builds with the 32-bit (cv32a6) and the
64-bit (cv64a6) configurations of the core.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 .../bindings/riscv/openhwgroup.yaml           | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.yaml

diff --git a/Documentation/devicetree/bindings/riscv/openhwgroup.yaml b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
new file mode 100644
index 0000000000..3bca66cad5
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/openhwgroup.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/openhwgroup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OpenHW Group SoC-based boards
+
+maintainers:
+  - Marouene Boubakri <marouene.boubakri@oss.nxp.com>
+
+description:
+  OpenHW Group SoC-based boards. The CVA6 APU is the FPGA SoC built around
+  the CVA6 core in the CVA6 repository (corev_apu/fpga).
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: CVA6 APU on the Digilent Genesys 2 board
+        items:
+          - enum:
+              - openhwgroup,cv32a6-genesys2
+              - openhwgroup,cv64a6-genesys2
+          - const: openhwgroup,cva6-apu
+
+additionalProperties: true
+
+...
-- 
2.43.0

