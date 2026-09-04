Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCEA441625;
	Fri,  4 Sep 2026 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516428; cv=fail; b=Dd7NRiW9lMwHK1dPXbMeA53NKVO9bHqEUY1EzFetQhjjCsD3HzodXV9R9pdE44Zf+FXFOPS6FpYhOcPfRMdhGVn2o1jp6l4aXuvQtOhSkEfRm03GmbYqMkv+B2juD5Ppms+tGP7bTO4kHluw8UenTewgJxGAba09b4Z+W2UPg1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516428; c=relaxed/simple;
	bh=6wpm8UcUSDjSj5sCOEH1YXLgwBBu3uYytwk9HNRvPYo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=POFBw54NK+e+fzlPt2MrhJb4AZP5tYDE10Oz3ukrw+OfKZbK6cO9wTQlFhZmjYRkswaNkeOdteXA4Mr8UMBIOmF3i6AF/N+tUPJDyjs63BwBgI23E7h5ooQyKmk45mswsob2kOVmaYQmjLhFIGg2MIoR+KNI0P3iQmIxIYAPgU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=we9eWcqW; arc=fail smtp.client-ip=40.107.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="we9eWcqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tRG+3DDvsdVtnbV5jdhQXgedHxq32Yt1PjRmyAVOiAiIc8M9a8gEWPny5dgpXccXZECh562oESgZyt8cY2Pu1/9r8GOid/xVOcPdWh//eDaQXfJHBuFwxlT5bH7X8kpHPdk6GE96njOUctZs3EOEZ+fos6XXbIK2DNtVWFLlFijwxRR20lICH3m9L7V7EjD06D/eLKYHJR09z3LcJb/eBtYtpRUx/ecRM46dp5DuyQo53o5G0HvYN4OWba/NqvNlLXT+A8LueIHtQ/j91THpORrNo2WtWHl4UHPI/gJlIOVFEzeJqIAGU7rAa508JeQJOm6pjqvlLwFT4ryVeovp3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eQ6NjiSHyoGcFlc3WM65Z0lb6hDwLOY/qe09R2Ar5MA=;
 b=LTCquCWD4QLAlPnoWrusFiaallK0qnO/FU55mbpd/NYGucpFWkgexmX0VvkkKUSxVw7oItnPLZfIeoIDLGnBb6mo5zXxnFFpevFNOt6goIAuDPbYVo6ek9PrlFQ9u/oAQM17jPbg4pCe47eX1+Bjxn3kPKa/jZSkyDpxDkmyd9fg4d1TZj1KmQJsjQYGKUD6BVH6Jh1xexL5LrQTLJVbKYEX122NiIjePw/2f0WE5T9vPUNFg2Fcxh8tfWP9gonw6XZNtO1lvOSk109t6oBdKM8SKjBCMxoB7A4TpFbdO4QxtdJFaZ7MlCPu7GiLIAmDAH2ijHPqw3wygUkXoW+Gug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eQ6NjiSHyoGcFlc3WM65Z0lb6hDwLOY/qe09R2Ar5MA=;
 b=we9eWcqWyAjmJnxTPhptk2G7FgUgSAJQ1gDH6MrtWrPdAw2nY8gX7TGFy0SNAPs0eLmqsq8fgqnre7s5Og2uT7LFnc7ofz3GVfIhhuv5wommeS6yEdBzz8WCXXWxjn1Rv16/7rJ7lMxkHGrrPz42oEIptZaqeTO5tQFTX/FzRtXnw0LRyDNqZNJQxormJ5iGJ+WMZ/LXasWWck25C2Qj0bl2p6nWrbt81csIW8JlrPo0P4VIa0rJYgEG7GetMuHfX7hXvW9MQTgqLBFRqkn+ANpq5rNh8wfHo/+S/syBV/18k0iWn/EcmivT4AGKc8IzIL3pm4FSzQ9oluaXWbRspQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by MW5PR03MB6905.namprd03.prod.outlook.com (2603:10b6:303:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 4 Sep
 2026 10:07:03 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 10:07:03 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: altera: move all SoCFPGA device trees from dts/intel
Date: Fri,  4 Sep 2026 18:06:01 +0800
Message-ID: <802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|MW5PR03MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b767a5e-db64-4740-e1fa-08df0a6c4471
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|55112099003|56012099006|11063799006|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	7gJXHlk2DxBttIyCEXp6jkItgWIDHiUBw+qM5fHcwU+jJuZUuCmAVFbqGcIH+UkSnUcuSck49YNyDrIrOEmtrr54tXk+z/+XRaRPu228tqUYA3+ctuLPZ+meBhCw6uylQuaRtP7LK+7Dm9dXSUk1AZv5u6Xh7oEmqhv9ubAQwYgiELQMMqGPOgq/qh/HROEGqPyMBEpDPxLsXXnH2KvtUQ8A/GzR1gGnoN7ztOX5rFdUFBdY6zzhp1qcErm04dD4H2zCAUYJeXImxPK2jh+nWZ7nDArf0lingFOiwzvxb8lvMMe8eeqlNfAYvO/Qo+CrE6tC67DR8fw0iiV80r36sV1+1HXB6gtTpm0yU48P2H6Si1DmJWO1QomhyXzfb+fwEL9P0ELFfOU3skXuk9BxKyvI0/qAdJgnHpktDLjYCuo72geBnyxp1Ufripy5X/wXKahUJ6KNx0TeHkUqGSR0YU55qUVS9FjR4THYztTLKiXnsnwH8ujm/EzcEq/R6AxIwuDM5T37u8UZZWY7MIXRuTJYzS1WqdX6P/EuxhSNIKqvF3Ci7k82G6CCXBIVuxcNLUf1ZfIToVaDwK9gh+DYKIvGQa3PUdu8fLs1MEJq7tH9MX3z6x3O38teSY3Tym5Fx8zsrv5H4S8r2YktUVgOc2mD0cKgaerEmMZv2WnSXeM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(55112099003)(56012099006)(11063799006)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hfP7kpNXfd5A1F32M2yAYvJbHxD+g/oIdyTQ7GUICDpV+Kloprwj3gkJvqD?=
 =?us-ascii?Q?TV1VUF5W9+ltBvB65SRLGtpsUL383KARm+WJU6baHjHAZKPLKJ6S39jtevuz?=
 =?us-ascii?Q?wmv32IdKHNDFS2QPUzbHPNmWv0aPNesGWqSYjwi3PbjzUZnxiq0VUmcHLda3?=
 =?us-ascii?Q?bStmFkA/wmI0Wp892sJLtJ9Zl1Bt+fuDJyCdT8XocNQqVPavtsbbbRl7i2Pw?=
 =?us-ascii?Q?DfgnPyE2VUqLsBE6SCVHlB0thb1fA7yMj4BdSmp6qdSkRja91BJfwLq0uW5n?=
 =?us-ascii?Q?SzPrgfYXU/Qoe0NEdUUjYprJO0KqptNUOocZanz6qTNFa7Et908/iZcuZVZa?=
 =?us-ascii?Q?vc8UlO9nuDBfnrizPSB1nzjAU4T7Lxz3Dga/ZdCso4wXPdIj0wfP7bu+NQpS?=
 =?us-ascii?Q?29CLfCWHa3z3sqqTb57YPvwtN/6T9DUKskQuQxcDg8b8c1CuIg7HSNt4t43f?=
 =?us-ascii?Q?TyDlM7Qk9Smrh58gwKgBH7DZ1Qxuumsm1xJi0DzLvofnNtZlcB5ffHatUvja?=
 =?us-ascii?Q?BzS85BC04qLbmeoSxUsx7b6bIMQ64YIVeNESX2b6gCWXRjmUuM1ViJsxOhDQ?=
 =?us-ascii?Q?dZbvGw5Padk7arAV5bi+VlSqYv1Cc9bLwpQuIVTpLDY0EUnAcfw0bwXvMNnq?=
 =?us-ascii?Q?O5hpMov4qnOlNG/k7wNZWWuW5HuUdz/JEDSCeV1Q7KPUzfKDZ9/InCqRkINm?=
 =?us-ascii?Q?hBOm+/J7rQJzVoJjgDoh6TnwFT7z7WZNQ3XEF1ETuxOFOS3EigYZ6yZU07yf?=
 =?us-ascii?Q?1IkN0xCnnblasezD/ZhG9s1utom9OMsirgIVEAppbPWG7nFUdtZTJ8dT5pYr?=
 =?us-ascii?Q?LLagqu5yYWxT0ggc50fFeCTje7fM2bQsS6y2zkR7voQOYl8s/vBWY1UT8F8x?=
 =?us-ascii?Q?HiRtJ88o/oBNBOcRrWQeiHp8xCU/XUeqSwBNUREE6mPDyyletIXbCfduTDtC?=
 =?us-ascii?Q?90QuzzczPK1mYNXN20sukZAK/x3+l4JTf8TMcdfXQAhQeLS0O8jCNvXMa+TF?=
 =?us-ascii?Q?hXebdwGHeI6pA+NongWEHl3u7rCEFwFUS4l1TEd/9zEO3e8ldGafMV/BL473?=
 =?us-ascii?Q?l8+POFcniZEdzgzncGMjcBVhDy2pNjJWECDevq0NzNxt2CYJrtWSD60kUmwH?=
 =?us-ascii?Q?TAtgpHhDwwzrqe23tNVplZzNxiM70thk1LkKlrhhmOnmwUFK2KyI+Xy/bsWb?=
 =?us-ascii?Q?J4+nKLPo88P8RB+klxU0zrz3iyl+CRDRiYW5oyrwEmfcWDBDzEOzZhSXOnYA?=
 =?us-ascii?Q?XbpzmFmtBCcOqweTbfDPkUm5UyTXJVdKBRMoHWdRGBZR3J1/gJWevcyVrU7X?=
 =?us-ascii?Q?Dzp7dxvyDZzXP4GQNItx5D/hCqZMJQO5uu4Hm6hx75C4SOoNJHmsWrHMc9zX?=
 =?us-ascii?Q?DVUZkXOz+wBUqdYMT3/ZZvhfJ8wKG2VCu2YfbVgPQe516VlO8q385WUprFxs?=
 =?us-ascii?Q?YZTVj/j/JoaEHmMr+VKwSo2Jm7sKLD/9M9ZiXLMJ9bfNsNourXwPNJxHUKFk?=
 =?us-ascii?Q?wPygDSu3c9nX/TcZDJUaeivEyPK//t4m/M2+Qe2mqBrL0eougGuHjhHd7Q2g?=
 =?us-ascii?Q?uYuX/wSMpE/x3bzCL5vV0OxNnjw2AJGIvPvoVMqhYkSm1oMwYoO1g24StaOS?=
 =?us-ascii?Q?oX+wlVqu0S9YRuxOjVv3xv9lneZ+Id1i/jwsGGPBpQfer7o6AZkIWS943po5?=
 =?us-ascii?Q?4eK7B+4VkmSNWe3eApg6LDL9DKZpd/HadldoE97BZ/ZH6NWTS6u2rQLj730v?=
 =?us-ascii?Q?foe5iOu2zw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b767a5e-db64-4740-e1fa-08df0a6c4471
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 10:07:03.5728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFL1L7Z/JUBj7U4qjKddV7AcM7hfJYiWOEd3lD6fLcbHuXI7ySTkUXz9SHsLXY+f3edytrG1QyOXpIVLYUpwMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR03MB6905

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

All inter-file includes are relative so no include paths need to
change. The set of DTBs produced by dtbs_install is unchanged; they
are simply built from dts/altera/ instead of dts/intel/.

No compatible strings or file contents are modified; this is a
rename-only change.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
This patch is a follow-up to the Agilex72 DTS series [Link above].
Reviewer feedback noted that moving only the Agilex72 files from
dts/intel/ was confusing since all other files there are also Altera
SoCFPGA. This patch moves all SoCFPGA device trees to dts/altera/,
leaving only the Keembay files in dts/intel/.

No compatible strings or file contents are modified; this is a
rename-only change.

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
 17 files changed, 13 insertions(+), 13 deletions(-)
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

