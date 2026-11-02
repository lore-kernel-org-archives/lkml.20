Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628272;
	b=1tpSq4UNS/slsVzuCZHkqOqmMgiWh0zCTTKVW/hI9BOkL5S9M/LWqlfLk9hPUZLZCZwG
	 vXVoxDUkUdwrwhRVbIwW6MeyfT1HQ8IXuspsbk6xZmrQ0OTgztScmzPtz6pbg6B/qbiuw
	 pifg1RO9cF4uxPfDkrUSXesqxEY8ZtrOh93tIbG5GqvVAZO4NBmpkv+GkMXtxJuGGQqID
	 k/qKkPnXxILO4JLtdzvbzBKYbed1E7Bu6n3g+ZMi7jm71UMSFeObY5C+Mn7QWNk0AgwU9
	 0SH+tGsRv2HjfJ276P9XfrUXFDDPcutjsld8UtV7244CogNCLq4U+KhLA+arp8qWyNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628272;
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
	bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
	b=4SOwRxyvp80uje8xPK2wghPGl4PtORbDSZ1T93F9SHkTvJcqGieES7PHeOrN7/Wp8P14
	 381QzIdO80uw3uoQW7GStLRHNi82IFanxbYG1ch3oXw0f6ctFLGqwgMLmEQNA//M7NM1X
	 Y7aceyYfMWeglc+zVhDtECFhnk30/gjCeMr+l/6fqakIw4MGRzyJBSmfJzN/IuVko48cA
	 vcrP6he61uRaZAhzHvf0JiKqgivnAX1MeRxsBxafuRwI1NVUBioPfe4UdPOaT9uno9HAC
	 0EKnENxZd7z/QWqehOTk/xZ16Nd5iaEg+bHeNs0tWTau3X6JISFEubFypOsWa8rVunw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A9xe25my;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.66
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCA260A5BCA;
	Mon,  2 Nov 2026 14:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCA260A5BCA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=A9xe25my
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xs/GqdikatOdL5bNjixkQDvgaek06qwv18Uzd0wxL+DO2/myv7BGIrcZH6By/Sh1b67URHzz8+CqJQ93fI7/HLN9beuEh+HubNAwdDl1rpbdBI0stGJnulAr+hs6PHuv4j957TWz68Ae7jHEDOCu9vNarM3tVOo0rAksTLrLzukw9mWJHKQk18M/8mpzSSRCJJ8LBcEHjmMUAJN0tazzRbf5bqKUR3a3dPPpLQduaG6h9WzdnBPXumeVHiAPxYZICoAe9XyTWV6tbOXzt9im7u0l5QtBTCvJ0g02fyRBJr1s6ipjcpu+38Uef7RpW/K45PSn9HdgiWTrKQHftNnllQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=KusS+2nnm013yFGQ7e1AJ/tSFT5686TCZWm8tzd0sxXaSzAaavV0OrqKzz9tkveraEzhO0zaqnSAP8x2RVNPPnSwSwD/KliEQpRYjIyvo4kU/n/+K2XIww7JkmPxkSCihXX0VnDX+CRftEnwm9CLQ3WBi28vzVC/8onWJoaCrJ/BOCxNFlhlCpfcMdNDOE/wZzVPi/55l/t+g+uRA+YolYw9zDRtU28AB6tQ/ERmUP6p+yWfplC8QkAqm2QVub8Nv0hLQ/2rsqjifmOJHOsBE1vfkMixWHzjyyir+jehxcAHNzjZ02t8iR6MDUfhw4CH8Sg3V1tuErK3a3cENI3AEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7soUBChG2eorH8MaKZzLxtkNhLd/s6s3Ma6CXM0wbKc=;
 b=A9xe25myD/SQn/ucOujRuALMWpAk/CccLK0ZF9BRA9Kl/St6FYF8W6CdT/GRbXw5ccfjoPEU1Fneymk6pKKqMCcEIpyyOteq/9MG6/MAkW7SBjEHYxhVYWeJ0/3ZFD2+SM2JlADizs7oXMBFcTU2/5SxQ0OKjbOY33NEZM+Mi4axucsXESmvYAtyZvkIxgPDNpuex7vHGpQty3rGXx6lkP0h4M8RFeOPq/uo0WP5H62HHtE7PFcnyqeZvMbnUSc3UPzNnMrc8BU/FMOFafV9267xzgQ1ZUUDxN2zWwKhyyKG+MIOYvdZ1n3naUKRnp0XorlCQd84IbWjmO1x6PVYOQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMBPR04MB12565.eurprd04.prod.outlook.com
 (2603:10a6:20b:778::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:04:28 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:04:28 +0000
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
Subject: [PATCH 8/8] riscv: defconfig: enable OpenHW Group CVA6 APU support
Date: Mon,  2 Nov 2026 15:17:27 +0100
Message-Id: <20261102141727.640769-9-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
References: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0066.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::21) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: d4973c10-76e3-4178-a816-08df38ea35d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|19092799006|261021121427099003|11063799006|56012099006|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Nzd1CCi25HM4mwItIQ93Cq1bs5DPIPNKahJhGq3MFGcQsII51BiFoScpqfSf7xFLJgvQ0A1yufk9xfb7kBALqAOhzl/N0MpICEP9z7s2dH5qZK9SePlTPJVqqSHR3JTDqM4L/h3JhUinRPt0pP1SRNjXbGhjf7qxkz0+18BKH02QdKaBD1rNsiJM/kdQN2jGvFUhpLIOIuWcyWS0npKhg2TRTgMDNTeUlPEnLSnKk39IGz7f7ump57ioLLpwdJ+y3Ni3myhKDMk0RKoyyPX06/QHXXzUcLAxtVi7JcIa7rivqS9mElQis29gPfKmx7ygLiZEyuV/z2Sjo/54ounPrkKmEkn7y5//hm1MU+Dku5W9dVSCsnItVhR7rA8pZCaF7dtVygLbb1lrF1o4ydWvVmwUTP7ernghSKkYL5tZOs0lOve2jClP+Y3Wx1jjcm6KrHXsnsE55H12RXfWGKll22BcfhHHbVMqEqJtdzwetV8gdneri/hpjnDUrimz6QjgfyxgspD7tKUpRExgsQRMkqryfqhzhQ98oABNaqOuAgzMAoV/NPktbkS0J59K265/EC6DPGCwD3thTNoqD8qENtP15HzFil8SIHjHHDRGu0Tybch4trmg+82PhJ8vsYf12+spdLGULfq64iO0GRU2tqyhdHB6iQaGFVmpFqq+KC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(19092799006)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VbdsoiF6reaDA9ujxqgoL6Wqg3QhBbWUEcJTz5NkxKY4RSpkJ08z+aM6AWDW?=
 =?us-ascii?Q?f1tbQIHqIFBK3tsdU461/NhJUF96WXRsWAIqhi7i4If3Llnlij4kbO4F5Gg4?=
 =?us-ascii?Q?KbeaOWNR0SH0MVpAjpsqo+tMMM4KNwcrL5K4WatiioIg2fcweqF0jHfxn9UQ?=
 =?us-ascii?Q?vSE1eAw+c2hcMuN2xWDVwvr7SHbtf4F3oKlpIZM0Fg4faGTbw8OqDRSZpgNG?=
 =?us-ascii?Q?t2HLdSms1At1PB1E5SQFzCMc+Vrnf0xw0WidHzRVsEcQ7jdQsRRViKguy8dW?=
 =?us-ascii?Q?mgeeDBB1/s/KxqnbLdKHPLYrw5L3N1XDuYweVCCGDlH0XKnbPkptm5sOm8XV?=
 =?us-ascii?Q?9urxl3HDPVmUosW6GjOOMRrac41x8hxLX1KFDTQXGxU4rbc4gwz41JFIb+d6?=
 =?us-ascii?Q?FZWiIobnLDIJEeb7ITx9AKNnLLs/+IO1Od0Tg3aRXax7qsQrJirRjvofrQfy?=
 =?us-ascii?Q?Hc2C11Mwjwq9p1tlY1C50s+g219VkMBUX7snbHvRDplYy9LwKX+j0xUb8Pvk?=
 =?us-ascii?Q?M+1gDXcK1H9zmIAK1Te7ja4IQ4y71BUayENp/BRWvNrb6DOp+ouo+4J+HAzI?=
 =?us-ascii?Q?CrDt1fIzruEWGEBf0D8JtzAVo7AsLtduryHuyhB1wOFWDbzkXnaan1yivhz4?=
 =?us-ascii?Q?t9EUcaCnWQhyFZGmjj+M0d0z9I+iKFRoa68+sK5lCSMnRfEplAYcDJFH9L8w?=
 =?us-ascii?Q?P+TktDQlM/DwIq4RN7bDzdIN1GlZBwgz0IeWkc62PT42/L0MvgmpPoVYK4IG?=
 =?us-ascii?Q?AMEkHeM/Bq4jc1tShOquSiV1hNtwLLF8QnLZbdd4lP64sZiHll5D4mx93Mce?=
 =?us-ascii?Q?8RBchp4BL7re8RJklo20iDPmSJU2qZyp0A07zR3/Qvo9Z2Wlj6TOYUaJ2lXR?=
 =?us-ascii?Q?ugLTSOfXzOh8pNrEFrfVE+hdeDhdRT5ywfwSeQkingnEMIZq6QvHMWWuMDoS?=
 =?us-ascii?Q?/XMe4DdL84cpH9WxSBHgrO9osOE3o2x8/J5duSDpCuTphdZLY4WvouH6lIal?=
 =?us-ascii?Q?dhJRjIfWkgbpGOt0Fa2WmEfvn060aqdUpbvS5PitNdg09RTstbD2c3rtYjti?=
 =?us-ascii?Q?cztGzsqP+J65PJuF09IVzzNiGGQzYaR5oU+vBWvSroFd2Kp12Flfx2l4Ael2?=
 =?us-ascii?Q?vjt7Q+/hyKhLgzm+gtgdDVm7Q2go0NftPV92031Rv/sWOPPUo5gQdIPWYsVZ?=
 =?us-ascii?Q?Kw+WgHsBUEZJs4Oh/WYJS0Ba/pdE9lh3RA8T2levNvMGnbEI4MmcPur6y+Bu?=
 =?us-ascii?Q?CVK5Qj0W+PYfhWvaGf+0ek+l3kMoCUfsxLOSBzpjZK1C7iJ/mDJ+K9cNWfn8?=
 =?us-ascii?Q?DklciGFxB2uPArO4XTXv8lvCxVQQBMDmmwBhSonaafxBKTOesRINi3pB0SZI?=
 =?us-ascii?Q?iDjMI/BG3o8AGoWee5KvvPNEPZ39kdCpxONF3KiGtwEF+ZX1vyHoau5di1T1?=
 =?us-ascii?Q?KR6JU+18TxlMMg3fkRhNx5hIdgkVLz3tJ30Hln7pViAnzz3FialaePudeafg?=
 =?us-ascii?Q?0f+6L7NE1GjrNOb4MbXZFvz1ISR8WZ0GqYJmvOvNmfn+AjzyeJf/PRkhCUM3?=
 =?us-ascii?Q?jzbjNHKahizeV8bkvzdJZwGSv48CqWl9akyE/cpaO0HPtqnhILy0wHZordU5?=
 =?us-ascii?Q?1rD4/DjWIHCFJ7yLohVT8n5yfejTBOyW8VbGviChUg5LlEx7gqueD7u0EIfU?=
 =?us-ascii?Q?xG5yXS6XWq1hr7DxWRcLKW2J5QJspte2KbEZzHMvhZVZsmrWZlIthoO72/P9?=
 =?us-ascii?Q?puzf4+Ef3qS77+fOHivFHnpIDrJNQevbjbnc02mPXN49vGdfjlG+YHwHeELA?=
X-MS-Exchange-AntiSpam-MessageData-1: R2H58F2naXNNJQ==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4973c10-76e3-4178-a816-08df38ea35d9
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:04:28.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M4wDDom1xSFmsfRfEufOjSeNwalvioqj7qWDcN/C+M1n0uN7di1ue5Dk55zuOuweiRQKuY+ECwCXdXUs3pUVEuDf3+lxxlTRo1HSy4neFCfT/RTVpx71T1M8LZ8CoIALdr2yEoPf239/kEtiriUFoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12565

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

Enable ARCH_OPENHWGROUP so the CVA6 APU device trees are built, and the
Xilinx SPI and GPIO drivers used by the SD card slot and the LEDs on the
Digilent Genesys 2.

Signed-off-by: Marouene Boubakri <marouene.boubakri@oss.nxp.com>
---
 arch/riscv/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d55..ed495eb8ad 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_OPENHWGROUP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -166,6 +167,7 @@ CONFIG_SPI_FSL_QUADSPI=m
 CONFIG_SPI_PL022=m
 CONFIG_SPI_SIFIVE=y
 CONFIG_SPI_SUN6I=y
+CONFIG_SPI_XILINX=y
 # CONFIG_PTP_1588_CLOCK is not set
 CONFIG_PINCTRL_TH1520=y
 CONFIG_PINCTRL_SOPHGO_CV1800B=y
@@ -175,6 +177,7 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_SIFIVE=y
 CONFIG_GPIO_SPACEMIT_K1=y
+CONFIG_GPIO_XILINX=y
 CONFIG_GPIO_PCA953X=m
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_POWER_RESET_GPIO_RESTART=y
-- 
2.43.0

