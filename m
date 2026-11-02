Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793628217;
	b=hOPVcaJm5RH8TwUVaZRHbATdPuyCN8F4HC8/zcuDYI7xUGEDumeuQANGQysh3HVJYtgH
	 b2xU6XG3YyibHffcRQv7RJNqLCxyRpWKtZQhN94IELZkEV56+JLT6dginq0nAYLl1y/Bj
	 aX1LeZCABsqjREtZKa6TsfRjsLXiECWjN9kb8GOuvRTyoAyrjMoO0YiZYA9g9XtpHZ8GP
	 /AbJbQLUEzXDsf/jc+rsSW5IlglvTTYPAg++fabQvXVrxdZ3zhvtbA/vHqhrQlLsx+uhH
	 3dw48OhWiWLpTcScLk1SvdygXxZ8Y0NMMHw4cEzRBPSrirBAdINjVLG8W6zGqFA89Lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628217;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=pqpsKgzXa2DAfbX2gDvhAfDDLq0Xer3pzgx3dnrbAjc=;
	b=NWQ27Dg+7AYww2cR3Q3EJztbs8qmH+Gkxzk66eGMzBx/NQui9ej3GNqk0UCxJsv1uEZN
	 /UKb4omjysfsxs6mQzvXfcBQwrIvKF/F6RPtL2Ppf6wXb2+cgG44/43gsdNuFMwpXdENS
	 Cj7/MK3lIhqRPLRlfHfYLphlGr9bEK5GsT5uVEzcPwGWSnbocVfE6yxVg4/aOEvex1xcA
	 znZ2MCmKurWVFnrEdtfAXIZv0XyT1uWCzLr79DDMKsHUhhY/oLy7xhlX35TRI3Q7q08He
	 7xC+jnHSb4BduFudzdPb6zOC5c8yaXvhp5eKDBMwnZ43xaQMvCkSE9tU/1Ctc3i1Y4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vnTO62q3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.36
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A96606A326;
	Mon,  2 Nov 2026 14:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A96606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vnTO62q3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql1EdVWuBoFoaD+UOZbmWRMJCEmiW+zRqvSoXZo1KdI/jykbeXW5kJe9X7AYtrIxmNtNG4RjrxMZk4rrJA07CkOPjO75PctQjuZpWDblcnJ70jxn8I3xTAvHqurf5cNFR97tW2OhklS0rkALfGq05PkIOXM0LB/2hezpiZqML09S+eIzzk9OYMkM0Ip7beJtCkFZdz9DWDgFMRk/yg50FspWAIhg5XMLsv9SPPK3SouTNateaMWRBjdILwOk0H8bmNmAXDHyuy5IWd7ETxoMklfn0X4Ognngn0LOl/HowptQ1ifeSbIosSYJHSpZRTZQOe2GH7YSIbx7Sn8JO1CNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqpsKgzXa2DAfbX2gDvhAfDDLq0Xer3pzgx3dnrbAjc=;
 b=dJ9/SWUO+E0yiAEpYRDa4wPgtLsp0c+KwICUi8oIUbVf+axP+dP322KxDB/CgUM/2tOHHl9DXjrWiJypP1QBKDp6C+jWmmORvgyX3j8enLa9+N8xvI91kOp6ldwGRdsPn9c3qveQSWJdc7fMpzuznDbMUdUdgBpYruNNhvCAgkuiD4BYwcVuU3TBWn+er9QQOSNi1Fjvsq27Q0wDPotUomym8tythgjIQUgtbI0W4PrpKp83dIxSEs5LL1CDom1C2m3fxOlTrkZV1GucbDnWwBUrpyVNbf5FWJlx44HUydD7gLqv8ZXxxhmXDfWEZIJzI6hsIO6Vz6557pr+Ejhx9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqpsKgzXa2DAfbX2gDvhAfDDLq0Xer3pzgx3dnrbAjc=;
 b=vnTO62q39akaLgS9x1oh//NI3CDv5qsGkVmrP9+nSx6cf0y8mZi4U2Kt9/LkLXFoa3HY6i15ug8SvJMAp6j8/f4Nf43/kQJAysuTT3dfS0cJRx/xfgmz0+WUKa2egg3w4dAHdOjS27hqso89Klc5qQPG/3ZhuhvlHckS1pliVRmU9nvoGy0u0EwLS9DoeJKBPvd6eINNof9BdDz2RQfnMKlRqESQucQlKQLVbOGFOIYdHHarAOzodWE259TqZYEVNdAstrLqmSDAG0erjbekNiBQEPCSau4+kYZzT8fq9xsgRAir4xRLHZuTC6TozPvqFI+486RsmgKT2nhjzfmydg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::13) by AMVPR04MB12628.eurprd04.prod.outlook.com
 (2603:10a6:20b:773::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:03:34 +0000
Received: from PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930]) by PA3PR04MB11203.eurprd04.prod.outlook.com
 ([fe80::80e9:ab1c:dbc4:6930%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 14:03:33 +0000
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
Subject: [PATCH 0/8] riscv: add OpenHW Group CVA6 APU on Digilent Genesys 2
Date: Mon,  2 Nov 2026 15:17:19 +0100
Message-Id: <20261102141727.640769-1-marouene.boubakri@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:510:23c::27) To PA3PR04MB11203.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PA3PR04MB11203:EE_|AMVPR04MB12628:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2fd41e-3e4a-4bba-57b2-08df38ea14fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|19092799006|6133799003|18002099003|56012099006|261009223027099003|261022105027099003|261021121427099003|261022075727099003|11063799006|10067099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	Sc9JLBHms1AHtTvxe/Qce7MM3MJw7L2OFNvmrlxwEf9xYzwiNCs1X5J7GxqSeZSvjX8jasnyUF6yrDky1p6H7tt94nTDjaNP3C4G6MhE1+Qgci3wTtYVJNFcNwIrduU3OUF7SbwK9SekDETn8yNWczpLECQ3RtGSVFB2IjMy2lJWsuKLRq1+tpfbuLXTNed4JfAGP0bo10iowesGca/WHFKOBmLW2h6oZMNEapw03SNY7YVDMUcRPqmcBg/zm9oZrXmNMXl8Jej07zTQ0k8/xMRrHbYsqcz61TfxeZx3p6314Zi5KTselrKcUnx3fGlyEfc+cNLLBwN3zfW3roBxQMCri6s//zyr38Nbgk4Wbe5kZGrvhXxcagHvCWSOXA0xqJvHdvRG0JMd9Zken9E7quRk+HSi4kLEghmcaYUYKqYtY0n77PQ6LmkhcxDsbK/i9VkpJM2K9lzz0uglp+MbIOQBahdAVGX64zZxYyCT2x2sX8OGOwSPYlcBB9SQGn3TVs68Ul29LiQRhVDSVsQobs+XxhEa+aObh+Kj4JhHUzTU2NFH/c3L6Sxr1qz/2iwqWhzl/ScqOzy9/xhRWDCp6EdCdWjNct1btZeCHtSol+yOVvLHHvC09foNsLZXBq/Aa2bpcsvobnWVQtcWBhzmzH5bOa22frsROMcKouzt7iU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11203.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(19092799006)(6133799003)(18002099003)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(261022075727099003)(11063799006)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VSfTk3/epsNXZPJLIXvzwUIFJe5HzfrHn8JrxyF49PpjLrxnTQK11oFvzfpm?=
 =?us-ascii?Q?K1MEEqFx7BYkz9qmRPB/MfBXTZdsULudx/rQYfD1Vjta6JWbDrh27ku59GwG?=
 =?us-ascii?Q?hNN9A3QAsM8JwPTaP64kMqoDraKmGEGn4HnsyAZSS1yl79gwF8LR4tEJ9lFK?=
 =?us-ascii?Q?eld+HzsHsGmZ69jDK4sG4u8T6WAui3C5QSNPi7KSAzQzifYb0iAiUDnStHBH?=
 =?us-ascii?Q?c6LyCQgywdP3kLIW6cadxiGjkRi6zbitakzneZqo1CgA3ffwTe4E/ix/WpfS?=
 =?us-ascii?Q?kOuuRDqu2u1P3fqADughHBUrDBTW0PMuBfZ1a9HfJy534SheOemtBlZhyCzN?=
 =?us-ascii?Q?1a3iOCR2BhxQab/9EIoUMYcvd3ma+2AWGyzz6JnPNZjOV78ev+FX5CD9T6QI?=
 =?us-ascii?Q?638TwZTstF+qNwJDCs3iAE/OCftOZUWRIRqZcabTdP40MKY7qzukXZBZI5YL?=
 =?us-ascii?Q?1ATZo7wywUrAeegtKTCnKSzmE10FS6+5V/eN9lCNxfnCMR5y9HGCGZE+15Aj?=
 =?us-ascii?Q?x3uZoL7U+TfvVYdkG9uGkTCuelQ87027xMYB3JhcB5BYmrs13XWTc1yjcz/b?=
 =?us-ascii?Q?TuFwa+X8dcZl8bDN2/CuURiqY3HZv+2oZehVX+j9mOElgQCq/hDLl3Zz5Ekk?=
 =?us-ascii?Q?Benc0ZfMGbCA7UT8QkLJDVHjTOlyk0/vsd9qULrKSy2j5iILQg67e2Ag8wQT?=
 =?us-ascii?Q?2A/Q3vhA/b/3Ak+kob1T134uOp2s9DoW6q83iI6BS7p/i3pbAEVfpxiDVpfA?=
 =?us-ascii?Q?rt3qvS3gsETp+vwAcpckj5KNK2iEktgyu42XXsme/pl0bfSjiVnpIK1XS6Tu?=
 =?us-ascii?Q?tDA/kX/2aepVG/6EsXGdg8sj+DRAMaH2Vb7eUnSX05AvxEBhvFiNh+nCSEhT?=
 =?us-ascii?Q?jAsdqYLPJnEsGTVnVx27O2Dj0vQck+m+1hqVjwHLHh5QVUfQWW2aTD35wymP?=
 =?us-ascii?Q?fWrmHIBgSpud04hO0hwW+xsCIimX59U2WJdpGssPCYlZ0yqzbGeKp89ZKJdQ?=
 =?us-ascii?Q?DFbVvj6iOFdDq8zXxoZhI8QQO8+dioLZ4PGxcZDxpKmegJtqH1mbj80lh/Gk?=
 =?us-ascii?Q?ZpJk7lh4Ba4W8vlCp7wLAWh1fuzxqpPifag/1UN2kPsntZ46YKMkI3nvhLOB?=
 =?us-ascii?Q?tjoTLtil25iQ7oWgJhQdWF7KAq7f7Rp4cJz2TekO1AilEew4xctqh4qBUOL9?=
 =?us-ascii?Q?VCrlbQih/UoBaI4e1K9A6IgbcdwYeFQY5RcA4sMrcTlsgbqe5h28Ue9EMFdN?=
 =?us-ascii?Q?1y5mCdWYkNECEJsYD+2kegJ49hIGTy1nybuIDpdR22Gg+GnKQbwjh6slMQ9T?=
 =?us-ascii?Q?DLad3RWwFbMCf3zJCoekV5SLzpLsBrwyJIghp3W/G5JD5uFUYSGyigj5bTgh?=
 =?us-ascii?Q?mNghOFOd5PyY2ee/Z3pY5HpQQ5Hoz/cPRnCihLq29hN+nLUI0h9OOgWwrJaK?=
 =?us-ascii?Q?qjUBcmZZlTlUJHBRcBsG2pcxelJEs7xxK9Ry1cC4nhQa1538tN93BJGS8ZG1?=
 =?us-ascii?Q?U3WxgOkc+i0TIZbxZJgr5WaspTzWARdCBYT2Tn2EMGBiAO7slQ3QlXjmiamQ?=
 =?us-ascii?Q?KLYuDl3z7GmY6yiY8TBuYZlH52FWAlT0ADBRLUH5Xj2uPSc0Qw8cm8oT34x6?=
 =?us-ascii?Q?naXJpRoS7M0XhAxenTafZzHOdHBos6nenMGXqQBDs6peGNToCD0kNA1HRd3b?=
 =?us-ascii?Q?/0Gn4tLQk1cw0QoczqUJ+tQ9PKWqsf/3UlhSBL4hxeZWXkXIBzHzsGMKD/Tv?=
 =?us-ascii?Q?xYEepvsX+qPy8THu08QKVEr1yeuHOrSbxf297jNOQ9KMbFTFywgwYAXlrgca?=
X-MS-Exchange-AntiSpam-MessageData-1: BWct66C7CfFKjA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2fd41e-3e4a-4bba-57b2-08df38ea14fa
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11203.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:03:33.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVc+BDqGxZaw8bwv3bS6faXbbBqmzSfzFUDjRNljJnIsy16/fMk5x+/bUzga9E6OjKUaJhkW44cRVFXyp4jiSXDuxJhcVWSegflKQd1sk8p1FTe+Ivlassauk1EFEfzWpzoxsXesV9QUZF+WUWNsWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR04MB12628

From: Marouene Boubakri <marouene.boubakri@oss.nxp.com>

This series adds support for the OpenHW Group CVA6 APU, the FPGA SoC
built around the CVA6 core (https://github.com/openhwgroup/cva6,
corev_apu/fpga, release v5.3.0), running on the Digilent Genesys 2.

Both configurations of the core built for this board are covered: the
64-bit cv64a6 (rv64imafdc plus B, Zcb, Zicond and Zkn, Sv39, 1 GiB) and
the 32-bit cv32a6 (rv32ima, Sv32, 128 MiB). The SoC description is
shared in a dtsi and the two board .dts files only carry the core
specific properties and the memory size.

The peripherals use existing bindings: 8250 UART, Xilinx SPI with an
mmc-spi-slot, Xilinx GPIO with gpio-leds, SiFive compatible CLINT and
PLIC. Patches 1 to 5 add the vendor prefix and the compatible strings
these bindings need, patch 6 the ARCH_OPENHWGROUP Kconfig option,
patch 7 the device trees and the MAINTAINERS entry, patch 8 enables the
platform in the defconfig.

The lowRISC Ethernet controller and the PULP timer of the platform have
no upstream bindings yet and are left out of the device trees.

The device trees have been validated with dtbs_check. The cv64a6
configuration has been booted on the Genesys 2 from U-Boot 2026.10 with
the board support submitted to U-Boot, using the same device tree
content as this series. The cv32a6 configuration is build tested.

Marouene Boubakri (8):
  dt-bindings: vendor-prefixes: add OpenHW Group
  dt-bindings: riscv: cpus: add OpenHW Group CVA6 compatibles
  dt-bindings: timer: sifive,clint: add OpenHW Group CVA6 APU
  dt-bindings: interrupt-controller: sifive,plic: add OpenHW Group CVA6
    APU
  dt-bindings: riscv: add OpenHW Group CVA6 APU boards
  riscv: add ARCH_OPENHWGROUP Kconfig option
  riscv: dts: openhwgroup: add CVA6 APU on Digilent Genesys 2
  riscv: defconfig: enable OpenHW Group CVA6 APU support

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   2 +
 .../bindings/riscv/openhwgroup.yaml           |  30 +++++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/openhwgroup/Makefile      |   2 +
 .../boot/dts/openhwgroup/cv32a6-genesys2.dts  |  29 +++++
 .../boot/dts/openhwgroup/cv64a6-genesys2.dts  |  31 +++++
 .../boot/dts/openhwgroup/cva6-genesys2.dtsi   | 123 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   3 +
 13 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/openhwgroup.yaml
 create mode 100644 arch/riscv/boot/dts/openhwgroup/Makefile
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv32a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cv64a6-genesys2.dts
 create mode 100644 arch/riscv/boot/dts/openhwgroup/cva6-genesys2.dtsi

-- 
2.43.0

