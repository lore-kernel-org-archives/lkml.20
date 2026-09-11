Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE93B3EC683;
	Fri, 11 Sep 2026 13:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135109; cv=fail; b=kOza2d02H+m65MpfLxgUcwkm5a4wDqxU96GQ2yxHi/XYQGSifvpD40PIqr5IZuPJnTq7QLdsboM4mM8K2I8zQtdoanvs5clR8MUFOJKhtYmKJoc8EGc6w7ZS0VuSlpmytE7UJXZp/IYotsTJvr8bvLbkDEgRxaQgFGkDdZShxjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135109; c=relaxed/simple;
	bh=Mp9Tk++qP+T0SyekBjO54guxutAYNCQrhkbB4eF3++8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=af24fnaB765CIBCIvvMa/i8E8i4U7DVIZfc7oNN68FAxT8JsT87TLDLKLtvWMk4qlWPvnbd5CC4xVS+MtWe5qoS0k0BtcM5xkj44pLELA1ks99DQNyDqR4UjWnNorjtlttpsywSnYDNsz0JrJPYOZA7CanKBJX8QPxRNBjQRk8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=mjD7YFzg; arc=fail smtp.client-ip=52.101.46.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="mjD7YFzg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3gKrXETmqqZYb1ZLQZ0E8FyGqZa4ZIhN5Y9bfu3y/Sv217Blv6Nr2JTkE+90L3l2zLuKGjTqY6ZqQi4wPruC1jsVQAeO90vtu1mrugr/mgGtiecVTfYHzpHVQrlWXNmkxm+3IcNJVr5NCzGSxP1XG9jwPxL/kdlANL44Ws3G10mbeu5Ed7h5vN2RagfuGKlnSzKbQR38gn3cQUx+mUyczn75ec1+TsOk9tIH8W/+cbHrE3OvFe2qDt7kHhT+eTyMxNXX/IIdPYdWGunif6Elsz9f1zoy0t6HdsxmCBTIBaQJ4EMFcAA0mbg8fNFIpNfiCzrmLGzXy2qZhUvfYkCJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAxFGyRMPNeJlonCC5KMpVNAGo91QKVVQVLPOCnQr8o=;
 b=wkpz+3HjNSBSgc4ZTqJLTgJfScuj330CZxiuVrvgtPQSalt98MKar3GH4yaCH8zRa7o9TXcy4I3jhH/o99bK1Xf2rzobeYu5Sfs1Lu3G7B59Q90LqWSAUcKinPxbTJ8rmtPFgGsyjDffxg/aWkgd7vmwkz0g/LffHM1KnNmnDStPx4SFHlfPL174H35cjIHwPQP5BVNj3AsKc9peK3qNhQqLo79+rB3V3blbrP8oNP4f0e4r5lat3k+tRgkNNh7BrfSvD8eMD5TzlS4eZORg01+X8K47IYNcNW5eokKCh9Runjh0xUBh7eqVH+X3GF0iqVkHtWC2848W/Gx8jKq/Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAxFGyRMPNeJlonCC5KMpVNAGo91QKVVQVLPOCnQr8o=;
 b=mjD7YFzgAbQoO4Qb0+HYi8vOIP0BhBDWc4IzFSZXX5Uvfxv0YkGfO2uBlhidFPdYizPJqwrWDccqVlB38MKKO63QX75Hnq1sGbB7m9LBO9Nl4XIPhJ6zQjozooY1Bqinh0YxLfXzADIW6FdWQXmsuco8+l2g4orwvLQHvwpHh2cPzgcGff4yBe6pupfnhFW1WUcH/Z4YWXJHNjKxI/DjLXQn1k4bXYYs4Prv10moijJiV70aThQdJhBXHhqvv9BG0sh7RfSjM3IZBfqRolScNhC6gHzmtLQkfp82+MfG1kO+a7A6cz+71/k8zexCkJAJTAiKt9IPfYoBsQRUCOs+ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA3PR03MB7235.namprd03.prod.outlook.com (2603:10b6:806:2f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 13:58:24 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0382.012; Fri, 11 Sep 2026
 13:58:23 +0000
From: evon.chiam@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] arm64: dts: altera: Move all SoCFPGA files to dts/altera
Date: Fri, 11 Sep 2026 21:58:04 +0800
Message-ID: <cabd32204f3b0dbdf4b28d44439648633291fc49.1789123511.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1789123511.git.evon.chiam@altera.com>
References: <cover.1789123511.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0002.namprd04.prod.outlook.com
 (2603:10b6:a03:217::7) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA3PR03MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b9b7ad5-cdb5-4c9f-8ee7-08df100cbeb0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	VxmUorY3uWKfoqkVZ3pi/qMasebKwkLEsJ2caYrgKWIlokxR0l7q5aQX2UIgrpiZrhnMLPEVfjdZNnBC9tQ9dSOI4Jso7xjZR0nxtFrfc0qJiSvvXtrMejrICwEXxLuPIC41XpiydCmkewG5Haq1MFNoZG3X/eH9jS53udaR19SeoOD7KMMnFBsHXN2xCC2Bdcs5dWOj57hfBcK0yEfFMVlKT8LHZN2N6nBOOABMckPYca2gPAf3hjwu9itum2XWt3PD/G8I/ecSTS8CHXAJSg7b5DBQ+dFmRp/F107QKxZV/NO7r6Jx26Lgfke9dFy17IUXT/0t6Be77A1LlPVhf+5SdiNoywIaM43AP7r9HEvVwLQ9rZfI47lkqZs+TsTardFpwYm4NXMzXtigTsycvogJ5+ANP5ypCuTDTjwFTYDMD4FgHrWiBbDa4bXSpz4kYUXLSFlT8b0JDNVuiaBP0We6VM4ROHKrMoQ5L394t4tKBx/JfyuCy34z+CfOIXuIh4gt+SakDJImbK4GhckS6j4XptPYNQrACVnRw67mC1wHoGIIMajDGfEzvFq0Y4RPx3hiNHTXVfKOj14tSF47QRQsVHZiS4uawmNoiSqS0hdx4drJjnAu579Xn2SvGYv3xeymAkHAqfiP7CUoaPA02pyu7muCqVT9bxwY6WOGVOg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K7JG0JAaBVHHneReJLkYHjQ/eNdnp4ytMA4G4plOPSeRl/+WxhVl26YrLlZq?=
 =?us-ascii?Q?I4vKowoXytw/LA/zPBDUYIK7Lh29co1/dnXK/B4OELcEI2+rwPdbyBka2ok1?=
 =?us-ascii?Q?LCSyZqlNpzevlYZ3oXfstfXmEV5h/JBIHo41EK/QgBelrzEGijPefFhdawp3?=
 =?us-ascii?Q?Eg3W+6i1xZMZ+iZGOr+wBJJdd428qp2LvP7PpztwZEWsSsYF20YsJk45gjKI?=
 =?us-ascii?Q?8hEGV3XxZonXNOJLLv86BicnelLhW8Txkq5Q8fXZeLgZsB/iNK2fE6e+4zmP?=
 =?us-ascii?Q?fxk8wlFV0mrzH57R8fgYotIHKr3pkjlRSXPZmdDOjBLBxdbT3CSM0CGXZ5HQ?=
 =?us-ascii?Q?ECz7hlkBQsjTxnxV7pNmMSiq9IGRDMSbY+Nx9VXrTrIQ4fSgD5rxMfvBqNHY?=
 =?us-ascii?Q?VaF3Fv3SeEMHK34efXQbRnvNhqPSakE8iE99bjA9H8K/eqGdp6p5qEF9ZJbe?=
 =?us-ascii?Q?+oNQFPedJM+8Hwr3bztPu4EAkQ8yAAHFiLrLKkfbCRXVkQlZ3EbsARsf6wp3?=
 =?us-ascii?Q?mWDE54LZP3MIBoMpSrHyvytLB+lQLPF/pA8lN597I4fSyXfUx8HTFOSPvI5H?=
 =?us-ascii?Q?0hdgg95egRgnvwkRKbY6UzSbDrsWYbT9CCe/LSdl/vs668ygI9oq0YXAwWFU?=
 =?us-ascii?Q?ys9dY8a0CVEra/KYYhMwYYU7y/Z3LsHYNLDLMiyhlB4h5u72eIhZbxtnsy1H?=
 =?us-ascii?Q?WJsaSNgzKcZgXNzACiOb9wB7lkC+P/EmRCXOAATMbXJZGdK8siUffl3BzCVQ?=
 =?us-ascii?Q?dTbAKrG40w+pzZmYs+QcwbgOAgfzfH6kKtk267MH362DnN0uo+oSdQYatyk6?=
 =?us-ascii?Q?UozqMuHezgrQrZc0h8ugzcbfGONNSMjDgPouGrSbEogoiOl5SaQUC6+11Qza?=
 =?us-ascii?Q?iYnUzkRq+pM7/vW3hSDcLkfXRiS/66sfkMNTR/gfwaSauN6T0g9JtIUpa6vv?=
 =?us-ascii?Q?IFoCxtfJfhgc+X39qQRlEow4hub2Eq4B3ILrNslBQz77FotZeA2T1dQQbuDM?=
 =?us-ascii?Q?sb/cKH/fewckHKr0Iydy9tOWn9bgOoWFt5z1Wv4hAcSQ8QkYNSvTCeXJ9XJP?=
 =?us-ascii?Q?mdLIm1j/yvsuX7OszHTbTex5VDD+6TfI/GsedCxi0CVsveRvLZV4q0BriUa0?=
 =?us-ascii?Q?SqkgSQ3R6bD8IX47YmAUfkP7lqNtvlafpotOVfGtbWuKaFYvIDqjpESTlPBf?=
 =?us-ascii?Q?57ZnoKx58zFUi8ZecdY/8kcUzaiCs1SBJvZSO3UPw6SzJt5Bl1z6c0w6rqkx?=
 =?us-ascii?Q?ISLmZNUFA9pG0RclJvOZxARswem2YqrMq8qdFwWY0pwuxeD4jXAz5ktuEzS+?=
 =?us-ascii?Q?qJ/vLIw/HcQkux1RiKKirs+q6bfuLH+XAFziH/oCoYa9sbubMdK22MJop1CT?=
 =?us-ascii?Q?JjsK8p/oI07GibuDt1sWOj1EIDwC6MXBgjHVXwC4aCXQBCM+D0X3A9FqgGjM?=
 =?us-ascii?Q?Fw+TYF287yDLMXjh8F5k63J/6TzYy+fcqkOVg38W1uqmCVSZDxRkJ90OppSC?=
 =?us-ascii?Q?bqTMMaci+eRoJ3BOywFslELpKb8dPwKoJ6BmolQuqpoZCAkKz+nUWMXR5rCV?=
 =?us-ascii?Q?2fhU0b0txNQgryHnVTmEbN+eJ1bE0zOBGtLr5iFIwChA8noWpxPUf/8i9ZZ/?=
 =?us-ascii?Q?9zfHnRnXSn6ATdhfiOP6cgVge9f5kgiKYSM2lIslkAz3wcZSeTgj1y16Mdf8?=
 =?us-ascii?Q?h4FJJiwkfxryd5eJFCIUXzKKDlR2Ij4SPuGCjakZln9l/nM8luCKxBylUr0D?=
 =?us-ascii?Q?Oi1OoY03oA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b9b7ad5-cdb5-4c9f-8ee7-08df100cbeb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 13:58:23.9108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSDKaP6RqqpjaQiTSVGi2QOCAXm5hMywf48aW79TQ40lYEZBwANNkHXYsvvZ0sQ5Z6iCi1DLZruth/nkqqHvMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7235

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

No compatible strings or DTS/DTSI contents are modified; the device
tree move is rename-only.

Link: https://lore.kernel.org/all/cd16fb78-551e-4630-83d6-a44a68e2e411@kernel.org/
Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v4:
- Split the MAINTAINERS change out into patch 2/2

v3 patch link:
https://lore.kernel.org/all/47719884b157863b2253b415daa447b417cd3419.1789048358.git.evon.chiam@altera.com/

Changes in v3:
- Drop stale SoCFPGA MAINTAINERS F: entry for arch/arm64/boot/dts/intel/

v2 patch link:
https://lore.kernel.org/all/4b78273b85041f74b12245d0bf222f018afd2bd6.1788933630.git.evon.chiam@altera.com/

Changes in v2:
- Reworded commit subject to drop redundant "device trees" and phrase
  the move as "to dts/altera"

v1 patch link:
https://lore.kernel.org/all/802bf0d27fbff9b1ddb6b9fc323a1a9f8f050f74.1788512748.git.evon.chiam@altera.com/

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

