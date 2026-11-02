Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628267;
	b=0Z8a6hm4DRtkX3r/RPoHoa6uEhKVEjiF7GiMk0WsQzmOD2qdmRpMX0RE50PzmGZOaCbQ
	 3JrbQww9rYwfdh9hCAWJ9NX6vmeNkaDQUQliGI8qrg2cHdNI1Es+OToa2uMx2p9ua8OXt
	 3aHceRl9iwkOhppK3T3R7tgLLiXwAg90iAD+vl8ZMn+A2rgoS0eIyHz/2WobX+Ja+1NKb
	 0ALNFwOpUamp5lhe33dJIukFY4hhlFWRI38tyjcywdbWIvgql0vaiKNP0oecvvrXwukWZ
	 1VtFNah4jVJl22lrkGm+RRDdwiS1dtD9068ZI1a2xfDhhz4ZFjDYMSjwttjWtojKIjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628267;
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
	bh=/r1uW/a74FvcOICqrXzq/n1hwfH5RjGbHO7AAzwsJgI=;
	b=CzmH+4SX7aoF6vNAgRBMD0CK/nKFgLZ5AEiCpCBFcyQiQP+jqt6IontWb14DvKWCBvgz
	 oJNl7/MCp7vTJX+Ku4JSaqey19njpBjY/cGivmvX3bzr1ryLfjH27RRM14bixpO3FopcN
	 +s5Ah06bw3GWOIDUlXVXmqNU2EVWWWoedgMsa+y5A7hHTOw5oLYaqGSP2HZgJ4iK9vBSc
	 7Yt8IoLKndssbYc8wsK6zR8Xiyhk8BqDwFBnnJMd59spkbJrZ3qaMC+EbOwk7Fp+l8109
	 Cfaw82s8qQU1kp2vPu1F8dnfoVssMSktZ0UX0TOdlZ52S6vW5PdDXbhew7a5s3AEPOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jGnXLmy8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.49
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B15560A260F;
	Mon,  2 Nov 2026 14:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B15560A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jGnXLmy8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytvyVyJs9189EX5otqngj24ygz6Lsvmfc7rGwQ/JK/7bxMbLsbwr+PEFx5f07lLvNxF5j0SUUKNlma0gYSrT612N8hfopJupC4cUWMYcpd2aANV1uD5YN3CimaMzU74mUwKSWoYNFpq3Q9e8js3Vrl+Wrhvo45Nqg8p5CEkB4EkkCpJIWYV3jQxOkPy14OXAakiuQGGV9JHU6+ynFA5B95fnEITTqZo8ixYsiZAp1BCGzPAWyD8MNEW79+hbfxcc70yd4LDufJX2KRayvremjFj1sPNbDIKVpgsYYfz3EQeP+csB6NAxyVFFmQIstHrN4qMqzaenh4D8pdpqcXTkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/r1uW/a74FvcOICqrXzq/n1hwfH5RjGbHO7AAzwsJgI=;
 b=WM5lVES+JUGZOhaQZi+nf1n0l4g5Y7p48usmNyGg5wWCng3TZzDHa8EOF675C8uLs5jDhxyQPsJrKgc3Nq/U6328Khsx6cJk4QpQog9ndK4FghVGgoXObu8tjaQ65/Y2efEJkkJKZ/8Gy/w/qf+OeBnwLmbzsIVbKbb407/a1sLwXeQ1Zaz/ecdhJd1K3f4RrDcXSIYoiaq8NQgGM7paELh4WvjkO3VQFagV7kLq3x0f5s/MKFz5D3YDKQaE1t5uKWilNHw3MSOslJ6fJGhzeqEZY7xTYM72ODI7ImWSKulQVK/tKtcD0HQltHk+M+w7RYyhInpJuHsY3TJJSuKweg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/r1uW/a74FvcOICqrXzq/n1hwfH5RjGbHO7AAzwsJgI=;
 b=jGnXLmy8SGMgJ2Li73wzdN0UwSnx7vZYl8Gi3ZBBoZRrOLFEKb7q9/pK7mbx37TsGsIca1qiawj/gwaQqIxI4g0vpVIfaxiNXcaFhXe898dfVa1OgduG0rlRcqmHf//4E0Dkk3XSCB4sgPShjq43Hzb+QrZFrFmg9gsZsxbsRYHBTJ5BzgnkSvs62FwnKO2yb+dTbeTIoR0UkxsGQqZz6ohoRWRpOlwJ5iQMQTM32jzugw4GaiD4vBDkd5n0vZ2xcLarNFLM46gjHguIE/idlpyZIPXERmLBlKwBI2YPbsI1jLBShog7ExnfhirlaFSBpH3poXCUHQZML/j7uqCyDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:22 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:22 +0000
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
Subject: [PATCH 7/8] riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2
Date: Mon,  2 Nov 2026 15:17:26 +0100
Message-Id: <20261102141727.640769-8-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:510:23d::17) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 20d53ad5-70de-42bd-fc0a-08df38ea31dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|260925021311599003|260925021911599003|260925022911599003|11063799006|56012099006|261021123027099003|261009223027099003|261028144727099003|261022075727099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hfl9EmUshsDhPzJqQeMfxf6iE4WKsnrwRrypccNbu/n+OAup4a9JmvL3FTObcfs7lL5so8FSyqorZVXN82xQ168xZXrOXNFYB3VU04lmfAroUMzVeqjAOuNCVAZ4PdWnsuQk0UJ5pEyL9F1YYdbIGNI65YNkewTosB7I9GsSOGeAlJIbfy7yELTB4NH2Omf5fL/e/Q+mUMay7lfq2+ZahnllRCeETmvtcFV8vY3pNq8X6Zm9kOp1Gg2xfYtvGibr9u7Ms8v1wn1uycKjyguA/SbiPEPuMaO15yc/hbdmcWPgfTdXK6SpcHNrgzbmlPwH3FSejMyiYsk/gOtmfmP3ZTeZ0yj0C1yMC4PpYX+A7H9VBKZR+YfK69Pl2fQD3ojJalk5tu1ku6inAFc0wXqUPWeAmKedIzWfrXlOLPsyEWjIRRta8y5sJ8RtsR38/1fcgjcvioYniloO9pjRYu7x412GpkXPNFIki9OiISk8S6Ey4C0V/qFoi6BmPwyNDSJN372j3RChdIr2facmllG4j/zn3GDMto+roIdVrlriLdJycqpjpr9b58c0z99HSLaz0lZYM5ibsHUGbXhZfmHU6/nCyl4sHS/yzM5+y5l0hywhqxXKOCB2KFtYi6BVlZWL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(260925021311599003)(260925021911599003)(260925022911599003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261028144727099003)(261022075727099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qUK0y4QM/YkvzvKKBU7JJRcZO8QFRTiDxcZ+T5J6lTusWLfVQDeyPdnuyiDT?=
 =?us-ascii?Q?7qUBaOGrttWxRDDltSN3hYx+1fENoDu18aXPSn/O/DVT/hYHwMmW18Wtg5Zw?=
 =?us-ascii?Q?6fuRumV+CaIq8xUiHij3So4V/TWOY6X8wECgMzOTf0X5QKsrnjVlujDwWkSD?=
 =?us-ascii?Q?fdQnWaqnyZH8eZvfKLj/srZ1x46/KbikNyjRuqJFAR+7/NADPPSk8h32cBAm?=
 =?us-ascii?Q?bLo9Dd0sQi+djr8rQgi4u7BOIPb/dcYo5oieREaAXnnUrzXfAP19eyC0/VJc?=
 =?us-ascii?Q?SjsZMWXJu/qUfRh25FqfUXu5wRjZlkWQO/WCBfN9i8rjd0Y096ghMvvVdk0v?=
 =?us-ascii?Q?48kRNRXBt5mko4AzxSjcgcuuF7EeMGpJEBb9sh1vuN4FIJ9hSXjD+P/MAe3e?=
 =?us-ascii?Q?cDEZxC/k0/iUVHAMPfoOk10yiRuPziIi3BO7fwFTHpZyIX5mtX84jrV9FbAQ?=
 =?us-ascii?Q?fRKZtd96lUVAaRikp/R82h+lEpKtVluJoBaDXXczVEAI2vkoY0RKA2HL+Gos?=
 =?us-ascii?Q?Lw06QVhgjTomA8XiB/7l2apyIMBZ9DzwJMkZfHgl4HSRxJLZxRlZT76798+H?=
 =?us-ascii?Q?vchsQu6SaMaGVCMCSPUVPhQfYLx1nctKvqRpjqh98r08ZgBkjO9cnhUS8UMU?=
 =?us-ascii?Q?t/2NwtyyU4RABtlZkgMg6Vteb1KCLCL+9fGAPzsrjOYTOJbCyomCKjBSYw3k?=
 =?us-ascii?Q?23Ik+XaU+4NNRrgy4+jvypmmM+/wJjg5cGnDGWlFXm28pgDoQku8g3f+B8va?=
 =?us-ascii?Q?hBEPOIREeEGW7eJPfsTl+DfuV9hXzFKThMo4dSG9QZnYXy43vf0+zJU+5NGq?=
 =?us-ascii?Q?O4Cqx3bOXWJYmlCmGLvydC9B4YuNM7j+9+bBLVw/bzNEkcjdBL1mILnHFldd?=
 =?us-ascii?Q?2Lysha5oEmHMq+yseaR0450kGKIaK0z6cUOWs9i2QH8vmsDfjr6akiSQC5GA?=
 =?us-ascii?Q?1zpvAJ80TOjTgOD7yVQIL+qerAZCoXivcLhbnA5iOKo1CGAQhTIrGjZXB7O2?=
 =?us-ascii?Q?dE5wCPabO7fnbLzrSAb+PXbdtZnQHQ03zrpW0s3rZouCiMl8+pseuwvCPCjg?=
 =?us-ascii?Q?42P5YqPs956F323vO/jDuWKmQp10PLKwjEJ5aYmGErS5zLWJBgTx3UGGz1rX?=
 =?us-ascii?Q?MO4NXs8USnEyatn7tdYDPMVUiQpFp7dvkW9BGwOkC0SXjbWRhp6xUgxUP5Nd?=
 =?us-ascii?Q?ZgOYYZ8WDCt1efHELfQef4CuE6rAYgy2tck+J8ZrnGtx8QxM1xKiZCJvZ5vL?=
 =?us-ascii?Q?j+3K6YAd4n01wL6G87rpUfDrE2kaBwsHFc39uSEQA2M0vBv1Vrrf+xSvcu83?=
 =?us-ascii?Q?xIAgk4mY7PMi8KAOkronz8UyrJV99Kh8T6k8EuvOzCTDiWoClRwB2ogstn1o?=
 =?us-ascii?Q?O2n0Y1OCbYRg+gUD9/JcQ9iNL/8TL06mr8BvYi9QfE7Vp45gRRR1b2FRucv7?=
 =?us-ascii?Q?+8CLjD0qWoQdGGeK2/VVpL6q8wdcIvJNfLTdqWmap7EFao0hhYHD0RX7+1ex?=
 =?us-ascii?Q?rYpU957MwI9THAkiDM0EhRqntGj0IX372LKxmg7lzusU8kFszCmphof0LPQK?=
 =?us-ascii?Q?S72ixgrL1aeI7vM4Bt1lmpOk+CBO4AlPSGMXCpxMyW9Q0C6hgkkNwJBj0mKa?=
 =?us-ascii?Q?ImmAFMStSpuC9qStL0P8eUBe5Aft6u3EtYzXOx9/Mlg9cZfn9Ro/p4wQwd0G?=
 =?us-ascii?Q?ourRK8cfNyFgiWG7v6i8b0AC5DkOdT831qtRAlmpNMbiXv7SZmJJ8UgOEIYe?=
 =?us-ascii?Q?rfEsYkkUyUBd9LY+t5AQqU38vsu5vb/yT58cLkyGB8u4tG7WdWOq7bpMUoGX?=
X-MS-Exchange-AntiSpam-MessageData-1: RapGprt6rryWWw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d53ad5-70de-42bd-fc0a-08df38ea31dd
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:22.1503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lxt9SA7MZhaRpcfXO/A3ePufjSMCcxu/FJBeRw9+tQ/P8TgqIIQJ9+ERQTU8nIvBQUMQrwUy/SynMEYtIyz1xmYXChDQA44y6r5QgVvI+8Yk0ms5Y2tRlVkLkr3mbnNxRn2kQXVmkpK/l7SxNCnjBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU is the FPGA SoC built around the OpenHW Group CVA6 core in
the CVA6 repository (corev_apu/fpga, release v5.3.0). It targets the
Digilent Genesys 2 board and provides a CLINT, a PLIC, a 16550 UART, a
Xilinx SPI controller connected to the SD card slot and a Xilinx GPIO
block driving the LEDs.

Describe the SoC in cva6-genesys2.dtsi, shared by the two configurations
of the core that the FPGA platform builds, and add a board device tree
for each of them:

  - cv64a6: rv64imafdc with the B, Zcb, Zicond and Zkn extensions,
    Sv39, 1 GiB of DDR3
  - cv32a6: rv32ima, Sv32, 128 MiB of DDR3

The ISA extensions follow the core configurations of CVA6 v5.3.0
(core/include/cv64a6_imafdc_sv39_config_pkg.sv and
cv32a6_ima_sv32_fpga_config_pkg.sv).

The platform also has a lowRISC Ethernet controller and a PULP APB
timer. They are left out until bindings exist for them.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
 .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  29 ++++
 .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  31 +++++
 .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 131 ++++++++++++++++++
 6 files changed, 201 insertions(+)
 create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5c..17865074a2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23566,6 +23566,13 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/sifive/
 
+RISC-V OPENHW GROUP SoC SUPPORT
+M:	Marouene Boubakri <marouene.boubakri@oss.nxp.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/openhwgroup.yaml
+F:	arch/riscv/boot/dts/openhwgroup/
+
 RISC-V PMU DRIVERS
 M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 69d8751fb1..305a93ad6f 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -5,6 +5,7 @@ subdir-y += anlogic
 subdir-y += canaan
 subdir-y += eswin
 subdir-y += microchip
+subdir-y += openhwgroup
 subdir-y += renesas
 subdir-y += sifive
 subdir-y += sophgo
diff --git a/arch/riscv/boot/dts/openhwgroup/Makefile b/arch/riscv/boot/dts/openhwgroup/Makefile
new file mode 100644
index 0000000000..a75a5863b7
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_OPENHWGROUP) += cv32a6-genesys2.dtb cv64a6-genesys2.dtb
diff --git a/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
new file mode 100644
index 0000000000..83d0286171
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU, 32-bit core (cv32a6), on the Digilent Genesys 2.
+ */
+
+/dts-v1/;
+
+#include "cva6-genesys2.dtsi"
+
+/ {
+	model = "OpenHW Group CVA6 cv32a6 on Digilent Genesys 2";
+	compatible = "openhwgroup,cv32a6-genesys2", "openhwgroup,cva6-apu";
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 128 MiB of DDR3, as configured for this core by the FPGA build */
+		reg = <0x0 0x80000000 0x0 0x8000000>;
+	};
+};
+
+&cpu0 {
+	compatible = "openhwgroup,cv32a6", "riscv";
+	riscv,isa-base = "rv32i";
+	riscv,isa-extensions = "i", "m", "a", "zicntr", "zicsr", "zifencei",
+			       "zihpm";
+	mmu-type = "riscv,sv32";
+};
diff --git a/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
new file mode 100644
index 0000000000..8fe653b35c
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU, 64-bit core (cv64a6), on the Digilent Genesys 2.
+ */
+
+/dts-v1/;
+
+#include "cva6-genesys2.dtsi"
+
+/ {
+	model = "OpenHW Group CVA6 cv64a6 on Digilent Genesys 2";
+	compatible = "openhwgroup,cv64a6-genesys2", "openhwgroup,cva6-apu";
+
+	memory@80000000 {
+		device_type = "memory";
+		/* 1 GiB of DDR3, as configured for this core by the FPGA build */
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+};
+
+&cpu0 {
+	compatible = "openhwgroup,cv64a6", "riscv";
+	riscv,isa-base = "rv64i";
+	riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "zba",
+			       "zbb", "zbc", "zbkb", "zbkc", "zbkx", "zbs",
+			       "zca", "zcb", "zcd", "zicntr", "zicond", "zicsr",
+			       "zifencei", "zihpm", "zknd", "zkne", "zknh";
+	mmu-type = "riscv,sv39";
+};
diff --git a/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
new file mode 100644
index 0000000000..95978274a7
--- /dev/null
+++ b/arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+/*
+ * Copyright 2026 NXP
+ *
+ * OpenHW Group CVA6 APU on the Digilent Genesys 2 FPGA board.
+ *
+ * The SoC description is shared between the 32-bit (cv32a6) and the
+ * 64-bit (cv64a6) configurations of the CVA6 core. The core specific
+ * properties and the memory size are set in the board .dts files.
+ */
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* The CLINT mtime counter runs at half the core clock */
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			reg = <0>;
+			clock-frequency = <50000000>;
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				interrupt-controller;
+				compatible = "riscv,cpu-intc";
+			};
+		};
+	};
+
+	/* Peripheral clock, the same as the core clock */
+	clk50: clock-50mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <50000000>;
+		clock-output-names = "clk50";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&gpio0 1 0>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "openhwgroup,cva6-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0xc0000>;
+			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "openhwgroup,cva6-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			riscv,ndev = <30>;
+		};
+
+		uart0: serial@10000000 {
+			compatible = "ns16550a";
+			reg = <0x0 0x10000000 0x0 0x1000>;
+			clock-frequency = <50000000>;
+			interrupt-parent = <&plic>;
+			interrupts = <1>;
+			/* Registers are 32-bit wide and 32-bit aligned */
+			reg-shift = <2>;
+			reg-io-width = <4>;
+		};
+
+		spi0: spi@20000000 {
+			compatible = "xlnx,xps-spi-2.00.a";
+			reg = <0x0 0x20000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <2>;
+			xlnx,num-ss-bits = <1>;
+			xlnx,num-transfer-bits = <8>;
+
+			mmc@0 {
+				compatible = "mmc-spi-slot";
+				reg = <0>;
+				spi-max-frequency = <12500000>;
+				voltage-ranges = <3300 3300>;
+				disable-wp;
+			};
+		};
+
+		gpio0: gpio@40000000 {
+			compatible = "xlnx,xps-gpio-1.00.a";
+			reg = <0x0 0x40000000 0x0 0x10000>;
+			clocks = <&clk50>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			xlnx,all-inputs = <0>;
+			xlnx,all-inputs-2 = <0>;
+			xlnx,dout-default = <0>;
+			xlnx,dout-default-2 = <0>;
+			xlnx,gpio-width = <8>;
+			xlnx,gpio2-width = <8>;
+			xlnx,interrupt-present = <0>;
+			xlnx,is-dual = <1>;
+			xlnx,tri-default = <0xffffffff>;
+			xlnx,tri-default-2 = <0xffffffff>;
+		};
+	};
+};
-- 
2.43.0

