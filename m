Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628257;
	b=4lEP11aS4ZBmaULyQmQ897+rVgc8VZsg0ucXkHfpuGSdCZqVeOA7C8tV61WVzqtgEAsr
	 NWTc2YCg6lBpPRqcYQX4qubR2NrfyTF0dDnSVNRJNPblnUv6KsZdHSg17B+jkz9xjf4AU
	 qJRwZ/zUH/oXPnOhf0yPSUupUyaDYqSi+ZtoAAJGy7FepVntXVyYlOvBdBD+Tbv/LeY/D
	 CITOhy6yXZMAPuaCuwasOdU0eVLcidGlCJXqul1oS/x2Y0oN/DklWfE49yicsa3LZh3aN
	 jHSFluOKMuowpeox5akNILjF7QRXCJmYNw7J1VHowDqEFT6MW3Sd3l/ARe5hTfOXl/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628257;
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
	bh=sMN/UaeR71veVcAeW7H5qqYSU3g7iV+K/16RqOJC0RU=;
	b=KMzLWPDLivSMfF+/fPFxd9Heo8VKZ6g4DxVTNgRK4gUqWHwLs5YRBrAka0qFWGgXAeKE
	 hlnRDITw/qvAIqb32NYZqxpH4K2tvj68KwGDGYrgg2lA1cmuVHC+prHV2dW819UZN4SBw
	 Aj1tkdMTfvxDTpgTlyyqVvhzhQZhmHbSIT2XIlOM/Rs3wVwSw1RTHfhD3e0fzAPawWEKZ
	 svJQmiFNHwlSq3ii8yWXS7GRlGUasi/AVym/8cLC86CgieQSk4e0H5fqtElWKilSLV/Uv
	 hacfKIAz5nOAOpobtohpgZ+AhwsburpSaegyHa5xSVr2HZbQdXdg6h9Pslyl0p6gzuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ff7SDxCY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.62
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0F60A381E;
	Mon,  2 Nov 2026 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD0F60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ff7SDxCY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2tprqOJdQ9R5yFxM3cinTYswT4KxpstXH6JNmXuEFVk7zAT1o9cSWixlFdBN6tew8RXHlzSvlhi93R3uK4kDz/eKodElwIglfTqlVjVvmDL0v3QOm+IRpCvcSDeJcsFDr3d/tjNaWZA4dqfsk9AFUHAXVNd87QWLu0SPjYTD2aYqccHpwVjmrpaDJFkSHRhunbLYBgKztFy9dG/UZBI6/Lr9nZuWPfNxfgl5aFmCQiiS+NfCrNRd+VHQYSypu3j3E+xEhzRnNTJW6J/3SCFbypvbq4vkywNE4YQ3H1uVeX6mxOT308Mq+zHTGLFpbQ1TzoyAd6AfX3BSssHCBRSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMN/UaeR71veVcAeW7H5qqYSU3g7iV+K/16RqOJC0RU=;
 b=NdTgraMAKHuZ3KK/eHCeOJC5aiPD1gsM4TzhW5EFrhWWU6RyEuU29ybLFxK3C+zLDm4qyj82QirO7IYvVdaKzFOnxelPA2i6k3lhiT5Trefuk19NHPW4choK4IpJOoJKSE+NkRe5p7+cWPYTypgjzLGrPPVZyqx7/taRXfYWeFnuNNU2VRBiHt9Uc4/Fg4XX0/GKCQG0HdY1Alx3xD/U434Ssy4yfB/p2xIxRpjunv5Hy1eArA/qf7Kco2POD6nyi/Lkt6MAPAwlpGbvGv0fiCQIolGm4PItDuZa611hpMmw0W6HELiq/X9HQq8//4JzlFvRSqbx9f2S/uz2vlrjfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMN/UaeR71veVcAeW7H5qqYSU3g7iV+K/16RqOJC0RU=;
 b=ff7SDxCY4vL8E9qbt6ZWcYrKLrydIA6qDmL7cN8aCHY6jW1lFj9AFV5iQnJ3/RMo5PsUmnVQXHEV6mjqoxErHcaYnlna/C3YV94IivQ5dqPHYD94OhJeW5K4orEzQck3sH6e/9oGxuLFFwYLOnCznlSI/6UGHDcYkSfYu5aNAQSBWEj780cb73KljtMf0/mImIGQvu4eT8Ss5dDX8ZzYR6ztJJ4c09TDD3mpCcCYHc1lyfysdwB8oOtMeUmu0E8dht+eq3fRjwBy4w2BCFKNTZ+um7iReJI+GFeiNOJDY8/45+pSyMH4TNDE++DXXFIfVUZUhm9QDnLKwYqFGCCjfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:14 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:14 +0000
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
Subject: [PATCH 6/8] riscv: add ARCH_OPENHWGROUP Kconfig option
Date: Mon,  2 Nov 2026 15:17:25 +0100
Message-Id: <20261102141727.640769-7-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:510:23c::6) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 4f4d39c5-30d8-4aae-72dd-08df38ea2d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	9r447PcKjXiGkibtfgBWB85D2zN7c84DufWCVDp/rxo80ffmq5CN0KhGuIxe7V67p9iBzWoB6kenfEXFVIRW6jbofTYhrW28SuHGqWZg9odA+HxczThnCHPsljRmqNSUHbneA/uRt3ddjrCisVHjX/ux7EeAGthv2HFum/Om7HOuBjB8AYOZgKIhYFo/6NnuBz6rdpc4iGuBDAvR+RsUUKKtH5Q6tkSM0W7d4QOwuphw5sm/6kfKiP4MImkQrGEo1GhD1rwpSqJuAk45JY2hC5UVVrj50PCApk07UAILsHuwVuVzluquUvFP/vGyx7CcInXphRfq9jr9u1xKL98riYm3MKe6wI6xouhvtoiIqwdKYPKAo/6omb6ujDa2MvoIBz+biFNMfKqHPMkh4ARpsu6KD4qaEfUUP8eh65VhRm6T9gyPgI9fNl7f1Bc6PEve6zXqRWk9IISmQLFai8cpIRjcivke0D6Nw3R+6Rc7+zxei+o/JfrNtYc2N0Ky/QFBilZRbciotVB7Ay7bVfy4P0eeDlPSO5bM7bteGafK9a26VbZnT/rQxjR9Pws3KK5QNal0ZCHpg/+I1ir0+LtquJEbSaKyQgUUQvzhKc+Ke4DfSU/RPll29OW+4kSA+MDUAJmAQ9gMAjmYuvy60oVcoz+2UHXLZcqOWM4FPk0DDgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yxB6IG7yfWl0QUSfsB79qfjpYHORRAwGcPB2pGiPHbEkVxx53Gc2OcS2JrqR?=
 =?us-ascii?Q?sL/WtUkyyrxRcfbejTSei7OsNEKQH9bxRGQ037tdhRoAvVsPvw3CIDQnkFY7?=
 =?us-ascii?Q?DM30qx/hxInyCIQCq5heec/xcoqNboohNrytmQC0KqM1Liosa0VzJWCqUxfo?=
 =?us-ascii?Q?IUFivRwHuezQtT3VjaZT2m/7I7/oC8X3Yy2d5o4AUQe8eiFQCOjSmJ/wTipZ?=
 =?us-ascii?Q?xY5nyQXMuyrbo7AjA6IU9s7d6s2yUednQ2C87Yfz8AcXUfbDFyaSi0HWYF4Y?=
 =?us-ascii?Q?2EEFqQwPBbkKTyNch7fwhj/PARGUmt5VmdZZ5HOpyBfCfcIQBRfjkfeMsoC8?=
 =?us-ascii?Q?JKE/7bztqTZwZnJZAcmTOH8f+J41R0S5Rtu1999ygnh8WFn7M5dAZLqthUec?=
 =?us-ascii?Q?q46Ulg4aKbJtPkQ5ReCQMmNIDCsVedfONjSyo31rnYi4rmaphCfe3+1EjYhf?=
 =?us-ascii?Q?9i/9LCumIZwuW82JjUrVN91FfSZdp2Lovxk45UFNXFkro9/Rs65yibIoGjEk?=
 =?us-ascii?Q?cVH2w1i3HgL3dg9Y83xj25NPA/lQU+0egXb+3ngLawZYhd8Nm5rJeoxtMll6?=
 =?us-ascii?Q?a5Zo50P9O/ItZlXKINNxOeHazHTC5ndR83hmS1Bwn7QxwXOD/iGBadTzwAJe?=
 =?us-ascii?Q?DglefPa1T2XH36nAth6P9m6Al4g9ZpmF6F287B+sdv4KkaHy9Hkaam8t2zYL?=
 =?us-ascii?Q?EIRnjFOZtW8PDYUFr5lIp0n0t3q5US4PNvja4q5nPB8mvniy1+8xDi/i50/r?=
 =?us-ascii?Q?7ATfdX85ibSLE+Hp5x5JrEAx4RWncE+AoAUBiMwB+CQ7tb/WvanxGLKfkDNf?=
 =?us-ascii?Q?0aDu3P/IE/aKyx1V5qK0AbQu+bD9QMS8qfaKI/w+Uhw6kjj1tnR16cczY1bJ?=
 =?us-ascii?Q?OOVGkhX+d4gTV0h5VNaxexVxdN7Oababis22JY7uCsjcRs5C6QLzEnW6ubCX?=
 =?us-ascii?Q?4qOayMJsgtOIoNSa4sXyB+KmlJXa81QBfUH5yuQz7WxMNqyyZfXQ3Q1njXwQ?=
 =?us-ascii?Q?ZGiFMpgsPi9MsqPnz4IBYttxTb6nRfln5rjnOEcoBXwLyaWeO0/NhWntZUXF?=
 =?us-ascii?Q?wBTWZDuLC5fZZWTFSpVRzmKB/XkJ3SXTFMRsFlN0QfMrLHdiAZtxbKQAIstS?=
 =?us-ascii?Q?PJ+b/5iOyCWLk0wVkxptPkoUHDG/1kA9DRVv34YB9q6ydhyeuUZ/ngpwTdRj?=
 =?us-ascii?Q?IQ9KON/6HZ+BGeASjnN/U2oqez7z8ftgsQRd93j4W6SaVZBJCOXKZV3ZUjJl?=
 =?us-ascii?Q?ImwpBSKQQZpBg6J6UbwRLYJHkv5H1DQvio6I+9R0oY5a1UcOZFPq8EsCqz1c?=
 =?us-ascii?Q?ysnIS9PCrSAKmogkMhvUOzduXv0Yw4RkoORNdEjushbZhN/qCasc3pbONxzB?=
 =?us-ascii?Q?MW8voALPS7nKYdLkR8cj/YUtblI1LymDrsXvoOnuxrT8D9gzMt0+5ChEtBuQ?=
 =?us-ascii?Q?i/eB19SWx2fR44ozKt+ejW+qBh1dwL4hH2GlYAYz77DH8zLKQBZF2QB+2lOd?=
 =?us-ascii?Q?ctssAsjr5SMEWI7hzlrLOtOYghs7fls3bjCgaqc6hAWNyzAL29583gJxEq3J?=
 =?us-ascii?Q?HoYRybLP3C6JzM98UK6p0Pa1IZokQjCdgwgkyHOZxlR+6R3rJCawv59mmXDw?=
 =?us-ascii?Q?5hQOVCJBAcNSch4YsupJkt75bKcfzfpJZ8kAYtb9Ync0IhnO81mAqWG5GfNG?=
 =?us-ascii?Q?q0jY/lR17X76k3IRQWjFQBgxGSAKqBujhHDsOS2wX9weqhOcu1PxmecPpzvL?=
 =?us-ascii?Q?73eqBZcKudnvdpvyKBIe2HcSCTFE6O/MEGWOGOtmkmNi0dDPkNUCgnsZK1JP?=
X-MS-Exchange-AntiSpam-MessageData-1: us3K8fNFoGdoOA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4d39c5-30d8-4aae-72dd-08df38ea2d87
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:14.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KS2ddzFo4joa0bl4wAiLEAAflhiOBec4GyySHSucMPtqLOq09qFb003Bq7i1bx9K+ykKt4vcmKkLR7MftVxCYVzzEDxczfzcPRw+VeH/CkE6uPHz1NKUErwuqFApC27NeMc3FpnFAwawBb37BPQCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Add the SoC selection entry for OpenHW Group platforms, which is used
to build the device trees of the CVA6 APU FPGA platform.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 arch/riscv/Kconfig.socs | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c49..289448e489 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -26,6 +26,15 @@ config ARCH_MICROCHIP
 	help
 	  This enables support for Microchip SoC platforms.
 
+config ARCH_OPENHWGROUP
+	bool "OpenHW Group SoCs"
+	help
+	  This enables support for OpenHW Group SoC platform hardware.
+	  Current support is for the CVA6 APU, the FPGA platform built
+	  around the CVA6 application class core, with the 32-bit (cv32a6)
+	  and 64-bit (cv64a6) configurations of the core on the Digilent
+	  Genesys 2 board.
+
 config ARCH_RENESAS
 	bool "Renesas RISC-V SoCs"
 	help
-- 
2.43.0

