Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD2E41A4FD;
	Wed, 23 Sep 2026 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151748; cv=fail; b=I9CciXJym91tRiDMSXqiC3gxR8jr5TyF5Mz5UkD7+CIx3GV997kDwr6pyN3OVugZ+RSGBXrGhjBoA30PaufI3+MIaZfvSjxAF5991pgXwLKVRPsY6mNtyrcxPLfoFBHd4xIASO5HnnllmgVdxCN64BnFsdTZxM3IBHAMMF73Ifo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151748; c=relaxed/simple;
	bh=iAT3iBPGRunvdRzs4/PLEKctbIofM+nG3wTCspAMZSk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nWcOjGzSFEmV6t0Epv3g0oR0GHoAqKso1QMv+mWQcfNBnY/72CmIPhqGjTDG2fU6U2X6RZrqGNoZ97waoDpcLt7xmod+gScgAsjWRhUqz/TwFKIF2cODv5zDkzRgxiRh320gWhwTdT4ReMrAokNNBO+E37EWyM48iUwcyVApTo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=qUOubadu; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="qUOubadu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmUy5okaqQygfSUMiCfwy1M4cMiOlIlr5ob2aGWoHXd9+xvwu+KNEwVQO/KNhUfP+HNsOy3Iv78UIvmARCMROrkOzKk2RIw1zEjffvr1ZXBp9SdcSMVlcR6vouLgwsY4w+Wd05rpOCUyv4ItczU4k7nJxrSAzRxfQw6acENjB0e8aAPHgyqJrN53qicTrVq1L+tXDWxoLBtdfB0EXfBGjGynooXA6iJqHq5Xhrh5b8fy55D/Ds5/WVhf4/VMAcP6ARHNSGEFXnDIsb1unVJm5zQO1SmzyK/sWdk2gnw4nKS0DUy9rtz6tRSYGypvC/Y+cJynz3fr6TX+16++syXwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBMAxwEDfVKGwbheUUncAFc9uy5wqLkkOC8Rjojkdxw=;
 b=qS72w8+CQSpd82/XP/NiJutOB5eCl9N8xf1WijNbdx2iO6M5PSlUX0Op1Ij9XmQwroVBuUNVVKohJoO5CJ49hMJANmd/lVsipEfMJXmSDgA0RDfWG7VVT+vlFW34lEVQc3XC70iEE+UM+NYE6eFvzxSrWILbvfaSNDOC0Ppu3dZcjUuMJusDGaQbzqYkgPmL/z1pPbde/HuG/7xJV/oILCTD+lyoDLxI1vd3wYxK6z9aoemwfIiirtAxColb8VPXZTS8ZSU7QLcMWExZb83mcNlmpkuETLWV/FO3VA2fB6cdWusKs9zFHvcHQm7qohFhLfDAcAnFJCId6MsS91wYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBMAxwEDfVKGwbheUUncAFc9uy5wqLkkOC8Rjojkdxw=;
 b=qUOubaduFJltFOWLKykXV+OvR9SWLvKZ+RAmL8XnJB2yL9Sw3NVAI5r/dBlKVlHc7YB4UAZGgNuDq3gR4Aiyv5NQ2cYj/wgs69vUsBjJN+CeCtLE4s6BYIgn3aldRsHRBpdl5q0WESJ16jTa/I2E++S5phWwAQEGiv8lwhu/J1VF8bLcABkyqUQeuU3J1hVmre+u0Ax5CoRy+1uNg+P5UghxKPjQqcedCFR8aOFnm0+VMLRWh4W5ooZoXuwDIDG4TeoclSAOtJlzm5jwFjOdjOXZFqsg6Rb/sDLKmbrX25/CmKQ6yN1+YCZYZ6N0m7AiuKh23GapBUcKW8c+QPXKRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:21 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:20 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: socfpga: agilex5: add DDR50 read-path tuning to sdmmc
Date: Wed, 23 Sep 2026 16:22:06 +0800
Message-ID: <096868737ae11bd457ec791099dcfbec775d23ad.1790151203.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790151203.git.tze.yee.ng@altera.com>
References: <cover.1790151203.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 0406d0a2-1ba0-45e1-f615-08df194bc94d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0qFAskB7EnatYKT4PJDlmXBizJYrJ5W52FFSCpbtm6S5iEkoVr691RYSOnz+ZJXU8KvT9ftHScKOp9pAPSwII3JRCmWVNDYl+kSRuABj8am+je0+swxOpM8EFM6nX/ZkYMEPVcXpjSwiuaGT0ZMr8cuLoJxodcKm5fiwykZ/QwvcsEstBoMyUcjoRc4e8BMenzpFTxPeB2aKBG3GPy75VIjld+ShxcDcw2ec2bm44iiWadAXi7OgxlStVkew5rQmLbohdf8TjclcCNysOvW9gGvV+ylhs7qiHQyYHsM2QxaYHWVauM/Q7U/eGsd4XA/wYYMHWnxzwYzLj9OyR88zb5Bopmk0aBpJTidsow466cNRzLF6iO0gZoKJIWr+j56e7uiAJmXsIRbh83a6gHQIgehaZ84kEMYTRFDzAvmLJa1iwQzhLsTKm/EEe6521dCj1f9KKH5N1R0BfphktFyWI7znjgnPIH5n57YvJd5/JYN2Qb6kJWCrsYf5IIrMjbnUuQPQQ7xEeB03JpuG7h3UJzriRklzrmKpfhT77ZwFZQRLG0K3A+gQKh0fjUAOel8bG+JRF4F+ITxpgxi4cBbgj8kcb45z1qZCjnW6LiV5SguW6kENIShUW1xqIewxUZJFC4pkg97UFJGenhxoWYZPHBEx8cTZCvA1229gyAQ2CuM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ffUts8CH6s+XTOpOPLCqPmz+ErENFtAcfXKqBkIFOaB7oeRUonmLB+vs2FEa?=
 =?us-ascii?Q?t5xyeB6vdVe4GhsjPtrBsa7+45kyN8Q6eaW+/IHWq24f2AjJoY2c0rSSL7Id?=
 =?us-ascii?Q?Ulytb/PbGRLeUqsVgg46ki4wKLjYv3ybAM5Yf6kuzAU3fxeEPdzWBaNBL2zc?=
 =?us-ascii?Q?a1Tv2HHftcf9n4+0+JqpjkWE7VD4cx8Aw1iaQ3fHMNgvOVFAfVdtY7ztODwe?=
 =?us-ascii?Q?2dw4Tj1xdpwYEnocSNh1nk4+ndGv9BkwiSv4rE6gwp8QxP5MMnkzUZKVRJqA?=
 =?us-ascii?Q?OmbLubBbyByZOcGsAyBmfnSNTqZLG8tp2QPTFbhNeimRI2QCrD1PeCU3fb6/?=
 =?us-ascii?Q?lcKuGgxmTvzDe3lJI8d1XLpCQo3VfqAlnojXgsVAoC7LWOEXE/N1VnhzaQHp?=
 =?us-ascii?Q?KanF2kLrAhrWw2YKMD3LL0G2RYRkxORuxXY0im1FsLaecgjMGjeaPr7PVlvo?=
 =?us-ascii?Q?pB1tPeTDNB3AxjcjoRDbbVzUoigrYDDzZF8q0vJEiDUN83z5uyG1Aix+eXG3?=
 =?us-ascii?Q?M3vEPOqCnfX/qT5CIkOdWLYtQdYS03yt0DwnFT0RkrKskzGTT456D+1xPjFe?=
 =?us-ascii?Q?LZl+bxbnUXHFrtxE+yI8dbQXNR9BrFxtoOvy20cPsOM4Sp2LLr/uauFzdexn?=
 =?us-ascii?Q?SG/SS0mHt0mK8Rbp8dEHDNQmONQU/+vN+VDotbYl5SuszyU+VSmz52hjoRKF?=
 =?us-ascii?Q?t0uc7aTOmg+Txj4p0NPnIuUp1MLcxvl1SnseYR7jp5dsAeM/bG3zJfV6K0i4?=
 =?us-ascii?Q?9f5lUkKBpC4/UJ7MJM6Ev7K7239nTFkL/exkm1t144d06O6mbBj1grqwJQcm?=
 =?us-ascii?Q?uNR+bZqqKjitAvoc2yLM6GUGIe3ZDFNrkr18H5SZcoqBj7KYzUZSM3UkEKm1?=
 =?us-ascii?Q?EfU+qpVPGpGYIUQRqXDeXdCPrrye7T/fa9N/79zHzJtjBidOkKT/a30AuxcV?=
 =?us-ascii?Q?QG1bZgnWe61FwuN0BvlWBCEFhU9joS0t/vdeLZNEdllde3J2OiRYi02LPNzU?=
 =?us-ascii?Q?Ys2BWnHqwIFKeBX7vHYXKOZ9XtvrZ0sIlQDkcKBYjD3VBy1PDhwt6nz9lrls?=
 =?us-ascii?Q?QPcLaU4dtVxRgV5tMMw8qq5ZRD9cvafeBo/h7w1+mzz9Q546TDXxnBq94b9q?=
 =?us-ascii?Q?EScrAXnJqykwbdz3zcLZQLyZvggbGW8NwhQZF20XqrAUY8NuwhNPtNinWz0R?=
 =?us-ascii?Q?WSpB2amFyK3nnvjlm8QNltqr4gVqHnYu98haeo4Vswcs2dyTShxCmHQOyzgo?=
 =?us-ascii?Q?i+smZW41XASlRPzsxnNcB5wi3BCgb5fgF8aBmZ857ANzxKVqGMuXf1AFSHtn?=
 =?us-ascii?Q?/KYYeXQmMnmUbtX9o4Yu1b1pz6UQBnY3O+Uen/Fr1bB2OH54kuc8BxTP/ky/?=
 =?us-ascii?Q?pL6Ul8khe+P6TsHxXANniID5eEDaD4P6FQEdk9F3Rikna+6L88rVuOhwRLUe?=
 =?us-ascii?Q?OC9jOlqYyp8sq+wx24S+qyTaznmIvoAvTbVZ/W+Saz0vHLi2TifG8ExgwdSd?=
 =?us-ascii?Q?NKZorzoGcZE/vRTEw12ZP8kE6ZEqHdlbl7cEgUx3uYZSTrW77XEKgmyzZtqm?=
 =?us-ascii?Q?B1AhD+JelonVb337NRISE8FtMFRqF52grc8eiltSRN3la0fIhAHNPYm75bdu?=
 =?us-ascii?Q?Xjp7cJ14TSYIa5SNpZHq41yNB3QLSeSnrFBq+X+T5WUbLvwHDZfen0mdrBWN?=
 =?us-ascii?Q?HeYkuQRo9oyr2tnz9gLmbEjEN02epEKgEOKEFRtxlj8q+KWKqju1hvtMz0rH?=
 =?us-ascii?Q?xGcQhBZjRA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0406d0a2-1ba0-45e1-f615-08df194bc94d
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:20.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLCqj4HBS7qg9h8frjtC9Xvs6Nwv8GUO1pO/MvLuajZ+zTcBs1IO2aCdsg49Zgqy1qgOuHor4KPiUYyo6qQFiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add the Cadence SD6HC DDR50 read-path tuning properties to the shared
Agilex5 sdmmc node so that boards enabling SD UHS DDR50 pick up sane
defaults for the loopback DQS selection and the read DQS delay:

  - cdns,ddr50-use-lpbk-dqs = <0>
  - cdns,ddr50-read-dqs-delay = <96>

Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
 arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index 5f22e6d7ab85..dc25b7382a29 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -322,6 +322,8 @@ sdmmc: mmc@10808000 {
 			resets = <&rst SDMMC_RESET>, <&rst COMBOPHY_RESET>,
 				 <&rst SDMMC_OCP_RESET>;
 			reset-names = "sdhc-reset", "combophy", "sdmmc-ocp";
+			cdns,ddr50-use-lpbk-dqs = <0>;
+			cdns,ddr50-read-dqs-delay = <96>;
 
 			status = "disabled";
 		};
-- 
2.43.7

