Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628244;
	b=S4qqFgAiKu7E/Fefvf6Ig/mbdwqpkGdl+SQ6mP8Y5T0768aWrYD9NiqDijFjmWG1yHbe
	 6c8s+wzd2gvR+otvtVPiGKM6AVKf9NBPCkzpGBUDuOgADEb7rlFmM+XOE93LACAJ9mefe
	 NcDAvJGYkokjAzZsU3bjvvRL4C9Fx/dmh1oADHMMtT7NY9kdz3/6cNe0VKzNQf853lO4i
	 hVE/TzR3pZaProlyPOuo2UDB1ToXsPl87qkC1XfjDHyLS3NIbvgvHu808RGaaQ4TwJCTN
	 kywfEqpmPomb3QKHT5cMg5RZMw7TCVO7zduOMDJ1fvs+/QDluSuh9M3INTvm2tA8nXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628244;
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
	bh=CFmwAMJogen2+AXHxVrfnniJjeyT6+fo8ZZwEp1ct9I=;
	b=wg0D5mEUry6QMDXG/r8CWF9T9iADhwjfVkmxMMQxIt0+9YzqxmCVdGdQnfAq73oclwkU
	 KU7zb3c2kIpUymvJyMEaTeh2cdugs4lzHtKVoNpz9BiA7lMIlgiKPV85rs4e42F9B5faT
	 5PpbKz5At8sDVnXUYzI8v/XOljbVOO2KF4XkVdB0h+MrQ5EtLUpS8R1YK7KkT0HSCoZvo
	 Y//7RW5hPXf5fZLWGpEss2TxmEyhkLi9nLcjG7PksLygzFW5UVGQGf3nTq+tHed1mBWOc
	 cbPy8O9IWffjlCMBnKWd9OdR17JORE8/Y7LGF7U9PpUKux+wqbTwkzy7C4mdBnW5jpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NCllscYf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.63
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D360A2612;
	Mon,  2 Nov 2026 14:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 203D360A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NCllscYf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WonxY/7EOR5AV1eSQbB1pHp+9lQJ/TB9KwIGbzJQBRPq/kAr3cM1hWdBNwRgvbxRQIb0xCgaQG/Jlt1KYxY6z6HRa2+v+MBM/t7mpaSmqvCVSjSHe23MQkx4y+NERpuMjPBHk8V9s0x/WHHWGNJPePaZtl+pIkQfjDPodgAGICPJAt5KoxhqgC3wyK2i/Cew6fjYs3yZcMl9va3D50mRD0cqZWAevvRU0SuNHzWlDKyPMhsh6rNbo49PlX0s04sbgFkHIpQKa95tZFOyt+dNWRB1bybgsDlCpbNsZfLE+1Kf44bv2VYD8Z5ovIlAzogNMgo88gKV/1/ZKgpCoeM4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFmwAMJogen2+AXHxVrfnniJjeyT6+fo8ZZwEp1ct9I=;
 b=ETTVMq1vse6AxC++kMRd8tmHzLXL/MhCAD+QvIw4+vK3SkAnPpFzhatTYZUodcwQVZ/TFRKZ05UTVyUKZmNbruyt+nNMx+0geUnm8P6hHKlvBQb7nSEX8iqsACG9Nvr/YyMgGze4xqHUOrHbHxRKowdflyTbDS3SRlW4Os7wZRxDQYsnytqcFeJi9e7YPbEHPibl2p2ZmjWjBfOFQOZcuKhqEXMCQjDVh9x+RVKgoAcTvnUeFw05NgK21JS5PnRLkuezjgdSihLQeK7IwY/d/0cQ9iO+m8daycmUhrIufrqnR5hE/hmfiK4pnqRT8M02cvlO/wd1vLEpVLoSgJjpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFmwAMJogen2+AXHxVrfnniJjeyT6+fo8ZZwEp1ct9I=;
 b=NCllscYfff/NDnSx2SDNi15Sz2H0HDwutzX07sQN3oAs4MCGqQzN3Focx+/ek8TFev+gEtN0UVcxRQ1nLMEPt04Cw5+YLzjNUd0KOwHTnaaa4uLOZvuywWl0oLzN8FMp7VW1VpvzKp3RC3bXxZ8EVV5BLqKPDXv+CZ4j0jifndefb3AtVLkLzYyO5OcNlhmd71gZ5XShonyAJLlCAAGQW9to0F+NysH2JJ+vIDHZcR3Dt1I/t63guS9AKyTnm83FKhHMKIbwLVQeTKrBrDrUOrr+45sfSwige7w3QoN8AfJqHW4kv/IqmHq8tHhd9vECzX1xKM3ree/j3+5GslYr8A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:01 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:01 +0000
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
Subject: [PATCH 4/8] dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6 APU
Date: Mon,  2 Nov 2026 15:17:23 +0100
Message-Id: <20261102141727.640769-5-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 41cbc98b-0f16-40c1-7232-08df38ea2558
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9RYN+VVjWDccJorV3FzDsRwfRlAuAgAMQ30viHObu5iE2YyU8ZL7hC3QjHmrvYcXZl/2mGfgyhARuuhvq/uFiVcxfMHXAZmn8HWrkStWKvs8/OMUOYJG4cQ0iUH4eHZR28TWNkNAUnYenooLfhUtPMYQdDmEGhDjNZi9p/doh6AveHvEVbtc0hKa2T8wcqduG4hcU5lGqwzit7q5WXDkWdOfaIq/G7zOr0/b09YK/s7i3AV3KLDcvdHKQlGnoxIeBxck0uwuWiHuKL7P/i+bf1BQZcooTIK9OYP2WwhpAZe9TTR3g4HLeVNlTOJq+4ti9bYXcqL+FxzBEUeE7PqNWGzy1YT3F/22zCIdcGKi4HYMTc0xh+MbauXR/m82aD606bZXo1qU0VMDkkqz85WamnlH5FifeVr+u9ogRDpNeUl9hX7MpHnglV1MQJ0dexg5tyjGj3p5+r+FZJZptfGzYUuvYrZgPeOxQbo80nG3eiyN99+76MWx+YDreCDEH6Ln0zuegu4bwtNmY7MZKBs/ntZGTDcQhtuksZjlrTOh/BXaWD6bTZ0FPnHmA2S8EswUrXSOP9R8meV1/7HbfDHZTZnr/jOoP9A4lJDuUESgPL7lqNhVElj2YJKEKAH4EV5T23yPo65C1XnHHnfhWMjNDgHTJJS+2J9i6IKo8ASpA+w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HXRUD5ZR2SC/F9N5icw+6hzOdrtNJuI5gY+6uazFvq/Rg+21CkknHmEl7uFK?=
 =?us-ascii?Q?GZgawTZmmMgZGgz4RmJ8yCOjIg2rO+v+3B1bYBitDvZFyBQbS5INt3XmaVJi?=
 =?us-ascii?Q?jdFeB4UIIzWl7AP0UkCtIxWQxaAIdoMBMnsStFSlNDkfumSU6kk+EwuVd8L6?=
 =?us-ascii?Q?JaU88pXVFgDwCj1hd6rLYCJmHKlLX4NaODijU4FHeyX2pZVHiBNcS0ewu1po?=
 =?us-ascii?Q?hcqHgnKKi9FoGaTeniAqOw/LjE12WYtCSX7aCoZVzhxw/ksdu1CvxJvfCntp?=
 =?us-ascii?Q?rpI5PMEuEV2nzfJ14DOjYIkgyMcrWLwtfrZUcQKiEoesfDXpVp5OruSlVtmO?=
 =?us-ascii?Q?pjaD4pnkjNeqX31Xl0boUUchkkePNqjdlgESLCMgS1u7w2stbyr91BDdjPhA?=
 =?us-ascii?Q?6f5xEz5PUtdtEvvrO09liR2QK9gHkNHWyVp2AVPa9XUNWkBxM4o4UaLjgfeL?=
 =?us-ascii?Q?rvUytGeDlNT0u23uGOIBbwNIcMcP79gzVAGxKDVSqpIalzhzK6pi7uBLBFR3?=
 =?us-ascii?Q?MkMuRv4z9ymv9rjgcsGJPEoRpfwOMTZraD59mwDu2Ic5TNVrcG0YxBaMCRew?=
 =?us-ascii?Q?jqjql0oQDM6oH5sRzICWpoStTHoIjAYQYdpwaptswsawvaKRnu3pCBHfzj7i?=
 =?us-ascii?Q?LnidQPDYZEiLInffeT5v7Azfbp2HIqZToaZjlKXJfueZ/SBQFL2Tuqd5tyIU?=
 =?us-ascii?Q?HA/qGX1/T9/ZAXuTZPlaNmUiERiq81XWCjVMw38RZRk4cKuLjUxcagxkoW7x?=
 =?us-ascii?Q?L+Xj5AWqQtRtkDBcXuXvGHvlLwFIZaZRMxYs+I62tH/bRppb7gbDc1S6+pl9?=
 =?us-ascii?Q?xaKufLVptXqnMLgO69wjsYQ2xp5DXrI91v/BCAqKo4FLXlhYfXKdUinSEXx4?=
 =?us-ascii?Q?7dFHTMh/CeuS5PDn2igiorlHK87e+lx9ZYnl/JiVnkiFwoH/Fr0TDc8EVxxO?=
 =?us-ascii?Q?I5icVHl/CraNmZxjXYCGp3b7JiurpABWZ3CkuII2RQjmIuI9Tv05NVoMs8yC?=
 =?us-ascii?Q?UusKAsvbkC+iizW096ZX7IwT904TCAZz2RxL3s3XrLIu+bzlw35ogci19M0s?=
 =?us-ascii?Q?k+/LkFVU8fjp9aBS3H2Ol0Ceswn2N2SQ3t3TKC1Dl5E5YmX7z8w7T2ExxGf3?=
 =?us-ascii?Q?r/ogSIFdf4tFhwhd3jvh3KpxfL+oz+ko6XXK2j9xTzKr/OaHhebU+rggFj1u?=
 =?us-ascii?Q?rU0b3vGWzfiVngB8jBQTSSARiAIkpnYOenLLvNxPZobsTsc90kmE/BxG/cR6?=
 =?us-ascii?Q?gZT9b7qjBvXZiMBzcSW2lFF1BmgbDxKCOzNsysdmOXn4XTHLS3R9rG7FkUIo?=
 =?us-ascii?Q?78JKCd2BtOg5IhfyOEWY1/OouknEzrHzmh1Y2tpsegeXkulFq3FFT18rU+w+?=
 =?us-ascii?Q?YGTE+CFRpTVJGe67decAUlJ9mFYceX1hSHZB59fU8GZOpIksfJw1ke9/ByZ/?=
 =?us-ascii?Q?o+no7l3s+oCe3VQZ+BjiElYw+65uZaBlNZP5eCA8XiqdGMc6NK0w3joWMB3z?=
 =?us-ascii?Q?B5YL0q/SaQZ6LrwvbHZjX63unPVkrNdEz7eA516iqDeC8qMrrWzTx1UZg7Ip?=
 =?us-ascii?Q?q4LhCL9dv0HrEhqjfwZLxQPBmXyXAiDecK3fLrN6ZZZTPiEArY49DbMr4I6A?=
 =?us-ascii?Q?jfSMsTbJYkkhChWruEHy5p4wGXg3+eLfTC8WM7dgyMjGyr/AbWMNAPJmCjpn?=
 =?us-ascii?Q?TtM3vjJKk907US3RoVT9BIS8xYvjmw6KOLV+MDe7yy5q6qu8uicD2UJO9EUQ?=
 =?us-ascii?Q?HoebSBR4WMj8i29zM+NlLJyMJoFxLqVZAMnSqhTPVMPsRGzyVGH4xNL+wOD1?=
X-MS-Exchange-AntiSpam-MessageData-1: xjY8HQb/ONtY8Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41cbc98b-0f16-40c1-7232-08df38ea2558
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:01.2869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b15Td+w41WZTXavz5g9SGfcw3w8JgeGKlSM2yODiIF7TlTXNqHNCmlsQZRiLfeEMOKgv4myKkKs8iaaKFy7evhIKPF5d1dythRF/LnHjQhG8drQ7gd/JbZRbZdUx+coBonqnHCZEqIirm5gBMQX1hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

The CVA6 APU FPGA platform integrates a PLIC compatible with the SiFive
PLIC 1.0.0. Add its compatible string.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index cde4bb6918..00ad63ab0f 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -62,6 +62,7 @@ properties:
               - canaan,k210-plic
               - eswin,eic7700-plic
               - microchip,pic64gx-plic
+              - openhwgroup,cva6-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.43.0

