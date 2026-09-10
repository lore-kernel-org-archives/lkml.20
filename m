Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7A48663E;
	Thu, 10 Sep 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049920; cv=fail; b=ZKaM8f2FDbstwLgXTQGtK1aN62AEvOsOAkTkyOxyfu5pmba2GygKNz4nkOKBCw0JethYeetqkM/TDRt1jXncr0UzJ9Fg7nbxQH0TIFa8wd6al2teqocLeLoJjyHtGHcvrXtSV1Zt2yALasSCwuNtaN8S42Gl8g0jkChsQbcFD04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049920; c=relaxed/simple;
	bh=R6spRMtk9bkZ/Lo6pSO9ooLI56f5LjD6wL+JthGGRXw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CRzmRqAnNyMYtK2STnKBpsHLC/TPoyjdvQntI3iXGlHbxdoze7DvB0ipOzd7NayiQhKJPG3C4poHoU39LgUpUROgrt5SFVUtT3UZhjao8+W/g77/Mied6zo32pVioMOZJtxRkIwCJK/4xZ8JcYzgaSfty2bei3PFkFlStyoq4A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=lnT4SOlZ; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="lnT4SOlZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYpWY/rfjZB8Rl5BGPb6S1hx8hnqs/FVmbDw/DcLGge6pRz5jX5CWlkGNt/50wtAuWIMGTE8cqVj3rE0r9Oo9HadTQ5kDEAwzkxAu8HvppTbFixA6tMBj662KubnO62VxCZaPpY9WjmN2vgSwhs7ZnXYUwGDD4OjPyqNbGqjKgnrTs/nQuUOmSpOf8hWBjrFO8caikb5w2/iiA8kGUSpLGBwN5Ofz9WQCPNWu/mtnAdo2T1ysykWL7cdzTDKoIOfeeAaI5Rss/3ds3ETH6np9oIRTGVwJAczkEkixxM4a0gbrfcni9bxPWTTdFJjXJVi/BB5nc9+rYX4XCqzAtKaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsuCPMBXCZyR3pZn5ux28AxhobTqVCxyuoH8dDgoeQ4=;
 b=wFpEFwBxrwnLjzZPui+cqKNcWtBeokjZZNi+JtF4sl9+E7/QAMOcb3aOPVKunkr5EcjDinu2vMK00KwtU/1iP/wvGVGfaMdYVst+znhnGpuu9wk3JPdpTGiplCHYZpB04G4ezeR+a7hqcUk2Ggz41ElbWK91EyKgm0h8wUCXtbALGYW3rXKTfyn8BkllUvlWiEaddTLzXOve69YiR+cy90KXWL8SGQNDuc1iMkksRGF0bgykr/Rods/GuJJ7tunOkPcfqzAmGshl8acea760JB6uhN+/Q36FrNRqM0V8ZUaA9KBMPRQoPVbkz2AmSakxlaPA2Uw8DJK3vyMNj+l8Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsuCPMBXCZyR3pZn5ux28AxhobTqVCxyuoH8dDgoeQ4=;
 b=lnT4SOlZqXlIXQgqLTzCwwRVltFfbxbGV0qFgnjpCbIchv6PLIwjJ6UZ6XFKXBZ5vKKHPSBC30OJqOSC0g2Dpr7dhj8zwrZ6G6jc1zm+F9U/XuxLA9IIlcjz8uk7496/7Hwu2zCauxQDIG5pXe0bPsxPNYeXDbBvwZOkDNhH41c5z4B5UOZlCysGcH+5R6sNl2rUHay853Aj+48Yk2tX/3FlXOwAv+UAIswVpiQFbUH9OAGlaz7LYkjUlijC8Z9NdS92AcEofYSnJfkli9zByU0ctPrAXf9vV/tWUKWmxKC3qq3cjoSC9kCaq1SXy7ZYjJ7lblekncV/WF6sZfvYvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SJ0PR03MB5919.namprd03.prod.outlook.com (2603:10b6:a03:2d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:18:05 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Thu, 10 Sep 2026
 14:18:05 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: altera: Move all SoCFPGA files to dts/altera
Date: Thu, 10 Sep 2026 22:16:41 +0800
Message-ID: <47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SJ0PR03MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db6a488-a42b-427e-6db3-08df0f465460
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	Dp9wPFEOrUDIZTylbXin/Zfb5DgI+fwGzDxRbh0bBaMh8kDk8MZl+T31P5yKe4NbNC0EEeU+yizG09JJwAJtbkvpNzoSv+JxPAuGmoET8+KtR4RGTirjIDVsfE7hu2PfFE5DAGcDyr4rFlixAj6h4RQD5H8W6rvC4b2zlMMLqUC0JIqOJpUCJYnj6Tt5XiXsW1w3ckVizwKayZ0obQJAL1dFcOrURr0vCLo+LYzedIjb1SDPvmIXwkDWtRtz978bxW0Z9BtsLxp2q8H+O2ycu4kGF/z/Imi7ihzzZo+bWT+vVzZHTul73CbNW7viiiqJzQDWT8gbzJX5i5l0ubugDro2hyEjD7WpKGE+Se7/2dAbsPD27F3sZwS/EsC/QCDM7j+rNx2Yo3zuxg/S/rZcH0iFPz+FiWBtWNqELGbDebiuLV2o2QfqQw/v3fo/JFZnxqO3MuH4IFpK7ZauNaVDDv3n7AjP/zkatFocOoIR20PF5vi5XYd+Ep1zw1I0VaJuyUVvk35AHHD5s7zcrztE6tRJizwS1FRpOldaShIvtW61aBAkcUjHjR286/DELlyolCX2sjDWyUupFRnBPIh1XZCYJIVmpur/EYq3QowrGD28f+VxjAS+0oI8jy42CmRT7h7MSZEuba/nq1lTCH22NtLS+zxHYpQlSRydPUdRRpM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NoLtf3DsiPWHO11daQb6H6Nm6rs4aPhvptybms+4OJbtfr4piVWgchlpcS4f?=
 =?us-ascii?Q?LeoAYJF+a1rHOGICQkFrXMOuPhxGD2Q+Goq7ETt7QfQmb7Lc+x3wOt1YodPE?=
 =?us-ascii?Q?Sigbs1RuJ4f9D549kUEq5iXynf8gc1ZiTDoBZYQIysI9GNIs4mS/kC/c6TyZ?=
 =?us-ascii?Q?U0ao+Loq2lJb4Jge0LjInRQCoJ0UjOZkfOv7Sf8EjKTcRCooPhq/cE1Zq+UO?=
 =?us-ascii?Q?sMlyIPYTx7dKOTyDSwqAmQkdS31v3P3p+avJqhdOVWllQXq3wuwZS7CHHU18?=
 =?us-ascii?Q?JUDXkHx+b4cRg/GBwqMQQy8NJbbMSbNDLjVX1M0RmnIkr67y0qqB9eg9NKmn?=
 =?us-ascii?Q?jmfTub7KdZl6tLIPuFqnQHkS9rP+QUKLrBLswqf3dHv53RgjSzvJbGz4LjcN?=
 =?us-ascii?Q?Fz7hBOv2vdgVpRWC0Lcm+ujh8tfedbyXTFbOGmSOwEH3n1i7T3wlt9k1VcGz?=
 =?us-ascii?Q?m7BPvuq2OpkTo1uSd1cdaVODj4REz1S3tCGW6HwcbCQxMPInCCqlezH4hh4R?=
 =?us-ascii?Q?nsNMVs/4pns6aS225hYQCG54v6nE/6NpOHIeqpmoxe+gz+l6Y8KHPMLRgJg9?=
 =?us-ascii?Q?NmW0G+IDOGtizL/JNuZSpAE7XGmX+zdhRCGwx59Cbb4hml/eqyy6GrmR773x?=
 =?us-ascii?Q?eAc2UDgTooMvz9zSSFyYZgJZoZ+nHTIJ7Wq1k+LseZfMp/B+GWwKAj+v27Bc?=
 =?us-ascii?Q?hWrqd/SzMzJXMMdLdwwrmA1/J62EFofaWOm+1mABk9wbu+n/wNvp2yVSeVkj?=
 =?us-ascii?Q?bqz40tzS34RpoXf8KMqE3aOmw8xhMal1ROFyTIoEKXZN1hI4H0ZXB3I/qHyc?=
 =?us-ascii?Q?tnozDAZ67LZ25VCEZBasSnqlvEG5dkqSev1UuPG3qNpMou/SKvx2oT6/Q94S?=
 =?us-ascii?Q?SSTUVeKRu8fbQVmnyjOW6+cTQomB9BkpTbIIkEaKD17wjx89QMHW7eRjT19J?=
 =?us-ascii?Q?N/ICGnOwkp7fvSW8pkvG2QgmxXINzr7VxFlFUpxixQZj1vu8VmXt+NGmfY+z?=
 =?us-ascii?Q?VyHtqRxjD/1zUiuf50KoUmxG4fIPmcEr42j/tqE2H/XUOxkJT48xIx1/761+?=
 =?us-ascii?Q?bQnOGtllVt8PPhXZ540COLao7EVtH5mKMpZPhzB/1dwfvOkHVgZ2J9hr9ybM?=
 =?us-ascii?Q?XFN7qNZFZ+TRXI35KeNnlDKJcn6UfPIyoi5Zmaag3XAeRvTKKzkDkWgr79vl?=
 =?us-ascii?Q?avOc8aHpQgMnn4UAHmikzFSMW/ekBmvtkUl7RkmgSmNCUvvWYuguiLx1yuGZ?=
 =?us-ascii?Q?Q0TmS/D159ZbfF3RChCX2/4QucbwWGFwT77ekh4Wm871wPZeLEdTWTQsSCZr?=
 =?us-ascii?Q?9Z3apu+7fHqZiCqq44aBwKukquSoC7igCWWy4/MSTKUGafEnJQFcHC5s1Six?=
 =?us-ascii?Q?Lg4tF5kfScxuihWNVEfgrJfgZsFP+HhM5koYeoWhVknOpm8fhztx5AO7vUeh?=
 =?us-ascii?Q?ujuKtYLhXwDLtFx9lZc1LrfoiNXpx50v+7cpq2TFIKgd2QTESM3nT8Lq2OS6?=
 =?us-ascii?Q?vslu0z+ZbaXUgzPMfK8PG6Jyjxsjz+643jUUnZo7oDxLs2yl4j41ybHvsRW2?=
 =?us-ascii?Q?aMpxde4ITqNU6RGrOEbXKd2o5ltUzLIY2C3D84+wVHqXuyJbyc3flrmP4iXj?=
 =?us-ascii?Q?LyaIQ0+/i7FjjPl4u6cdisnRqaqeoXYfjmxgHvXc9OzhEQovR5/wxH18J/UQ?=
 =?us-ascii?Q?d1ZM4R7d4pKo/FbiPychBC5DsnZL+9tfIBRGZOZKLotjpq8MMe8M4CLL+teQ?=
 =?us-ascii?Q?ZvZM2kV2nw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db6a488-a42b-427e-6db3-08df0f465460
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:18:05.1198
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kghzJFplKsWlLvXE+ck+2GeLiPOHsciy+5+xnkD1G987Efwud3UEabVxtIligWNX5ymwleQb3Dw1HwB/yU/BHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5919

From: "Chiam, Evon" <evon.chiam@altera.com>

The dts/intel/ directory contains two distinct families:
- Altera SoCFPGA platforms (Stratix 10, Agilex, Agilex5, Agilex72,
  Agilex7M, N5X)
- Intel Keembay

All Altera SoCFPGA device trees already have a home in dts/altera/
(Stratix 10 has been there since the directory was introduced). Move
the remaining SoCFPGA DTS/DTSI files from dts/intel/ to dts/altera/
to consolidate all Altera SoCFPGA device trees under a single
directory. Only the Keembay files remain in dts/intel/.

Also drop the stale SoCFPGA MAINTAINERS path for
arch/arm64/boot/dts/intel/. Keembay DT files there remain covered
by ARM/INTEL KEEMBAY ARCHITECTURE

All inter-file includes are relative so no include paths need to
change. The set of DTBs produced by dtbs_install is unchanged; they
are simply built from dts/altera/ instead of dts/intel/.

No compatible strings or DTS/DTSI contents are modified; the device
tree move is rename-only.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v3:
- Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/

Changes in v2:
- Reworded commit subject to drop redundant "device trees" and phrase
  the move as "to dts/altera"

v1 patch link:
https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/

 MAINTAINERS                                        |  1 -
 arch/arm64/boot/dts/altera/Makefile                | 14 +++++++++++++-
 .../boot/dts/{intel => altera}/socfpga_agilex.dtsi |  0
 .../{intel => altera}/socfpga_agilex3_socdk.dts    |  0
 .../dts/{intel => altera}/socfpga_agilex5.dtsi     |  0
 .../{intel => altera}/socfpga_agilex5_socdk.dts    |  0
 .../socfpga_agilex5_socdk_013b.dts                 |  0
 .../socfpga_agilex5_socdk_modular.dts              |  0
 .../socfpga_agilex5_socdk_nand.dts                 |  0
 .../dts/{intel => altera}/socfpga_agilex72.dtsi    |  0
 .../{intel => altera}/socfpga_agilex72_socdk.dts   |  0
 .../{intel => altera}/socfpga_agilex7m_socdk.dts   |  0
 .../dts/{intel => altera}/socfpga_agilex_n6000.dts |  0
 .../dts/{intel => altera}/socfpga_agilex_socdk.dts |  0
 .../socfpga_agilex_socdk_emmc.dts                  |  0
 .../socfpga_agilex_socdk_nand.dts                  |  0
 .../dts/{intel => altera}/socfpga_n5x_socdk.dts    |  0
 arch/arm64/boot/dts/intel/Makefile                 | 12 ------------
 18 files changed, 13 insertions(+), 14 deletions(-)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex3_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_013b.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_modular.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex5_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72.dtsi (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex72_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex7m_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_n6000.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_emmc.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_agilex_socdk_nand.dts (100%)
 rename arch/arm64/boot/dts/{intel => altera}/socfpga_n5x_socdk.dts (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..98f374ae7586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3590,7 +3590,6 @@ F:	arch/arm/boot/dts/intel/socfpga/
 F:	arch/arm/configs/socfpga_defconfig
 F:	arch/arm/mach-socfpga/
 F:	arch/arm64/boot/dts/altera/
-F:	arch/arm64/boot/dts/intel/
 
 ARM/SOCFPGA CLOCK FRAMEWORK SUPPORT
 M:	Dinh Nguyen <dinguyen@kernel.org>
diff --git a/arch/arm64/boot/dts/altera/Makefile b/arch/arm64/boot/dts/altera/Makefile
index 540bb5ae746b..8f41349103b8 100644
--- a/arch/arm64/boot/dts/altera/Makefile
+++ b/arch/arm64/boot/dts/altera/Makefile
@@ -1,5 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_stratix10_socdk.dtb \
+dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
+				socfpga_agilex_socdk.dtb \
+				socfpga_agilex_socdk_emmc.dtb \
+				socfpga_agilex_socdk_nand.dtb \
+				socfpga_agilex3_socdk.dtb \
+				socfpga_agilex5_socdk.dtb \
+				socfpga_agilex5_socdk_013b.dtb \
+				socfpga_agilex5_socdk_modular.dtb \
+				socfpga_agilex5_socdk_nand.dtb \
+				socfpga_agilex72_socdk.dtb \
+				socfpga_agilex7m_socdk.dtb \
+				socfpga_n5x_socdk.dtb \
+				socfpga_stratix10_socdk.dtb \
 				socfpga_stratix10_socdk_emmc.dtb \
 				socfpga_stratix10_socdk_nand.dtb \
 				socfpga_stratix10_swvp.dtb
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex3_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex3_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex3_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex5.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_013b.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_013b.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_modular.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_modular.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_modular.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_nand.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex5_socdk_nand.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
rename to arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex7m_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex7m_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex7m_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_n6000.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_n6000.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_n6000.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_emmc.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk_emmc.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk_emmc.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/altera/socfpga_agilex_socdk_nand.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
rename to arch/arm64/boot/dts/altera/socfpga_agilex_socdk_nand.dts
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_n5x_socdk.dts
similarity index 100%
rename from arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
rename to arch/arm64/boot/dts/altera/socfpga_n5x_socdk.dts
diff --git a/arch/arm64/boot/dts/intel/Makefile b/arch/arm64/boot/dts/intel/Makefile
index 270c70fdf084..5b030fb8d165 100644
--- a/arch/arm64/boot/dts/intel/Makefile
+++ b/arch/arm64/boot/dts/intel/Makefile
@@ -1,14 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtb-$(CONFIG_ARCH_INTEL_SOCFPGA) += socfpga_agilex_n6000.dtb \
-				socfpga_agilex_socdk.dtb \
-				socfpga_agilex_socdk_emmc.dtb \
-				socfpga_agilex_socdk_nand.dtb \
-				socfpga_agilex3_socdk.dtb \
-				socfpga_agilex5_socdk.dtb \
-				socfpga_agilex5_socdk_013b.dtb \
-				socfpga_agilex5_socdk_modular.dtb \
-				socfpga_agilex5_socdk_nand.dtb \
-				socfpga_agilex72_socdk.dtb \
-				socfpga_agilex7m_socdk.dtb \
-				socfpga_n5x_socdk.dtb
 dtb-$(CONFIG_ARCH_KEEMBAY) += keembay-evm.dtb
-- 
2.43.7

