Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04513019CD;
	Mon, 12 Oct 2026 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791340; cv=fail; b=lSsqQhIZ/ZGsh3dfcVPcCKDrM/nggdA3fcLQ4aknilQtqLQGH6u7AhM47t7aKHK0Khhst2L4bw0dJkex6Wu9TPM90ODxTvvdjQLg5tgXKU0wm1N4Beq5t7joJazUr+2s+Dlq675hvrhZOjC14C5+AYUAe8uhias7UN4SHYmyjng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791340; c=relaxed/simple;
	bh=K74rfzjzglSTR/SH16tCIX+ZQTUzcxdFibJy8WdYQsk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=htPVwTPFS3Vn5qqFo1j/Cz+nslKo3PX6xv7kQIBIZ1LSgCPG2ua3AtFWajRwb/cxdlvrF9xtq7wR8KonFXehvoLDyVOqI+g18Cb5y06RV5QEgGvMsl7iwDZBsGueCC2GYCCqbt5x04pBh3bd2LUx97PeHmSyONy64kNyC9KiJeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=w6TaHU6P; arc=fail smtp.client-ip=52.101.57.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="w6TaHU6P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3ynIC37QPHdzl21yL/zSgxZP7m1DnGvOq0cDuLGXkrQlUiNrhuLmgCkzaa96MjgeiHB6+qPD4Nh6ZqTUIrDmml1rHUolJqphkyTDiqtJTOJvQUssaECbZqGAaDUza5qzVelt5tljQ05YJUjHGg0o3mNGlkOTQ1bPr62CoWtw7EDfEm84iH9QGWVdE02zHSFWt+hfAwYXw3Izv+gqKIWuBxK69atSNHs4z75es5oWGZ3BkSgg3+hgK2FnuY4a6MKACZUaNBsiVwBHKi/iI9fTv6KfzKlBpw/cdXcmmRrilSaxkWFUciuVaxCH9454H2feWDr/NwgPzI+2QEJCbmXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIe+XL10isB3sptI2DUNXfhmZ/w1n3MON0LW36OZX/4=;
 b=Wx5ZYwWZDHoeRjgQVGm+HDn1L3lH/fM+NN0XZVO5FwsscZM2HFod73cVPrRnMgw+Wr+pwshYRhOlpBy4ohc1qrXRm6YiSDEjgP0jG8PYoowcGhJmre24YemO5d5OyutaFxmX9Sf7d4ZbOWHSPzbjng7TMTHybfDhr+EcuHi7esUqhusDVrsoHzt2YswszG068C4yXk6o30YPUcNTOmhdezx3sfBYfOD50RkFnpDqPiSWTj45NwV+BCc7hrmXXKGCuoikXLRFuFxHSjHk8V7UqGY/KlXT7RBhNBGZqVByECT4vcUFBvRr7BAaVemqm5cry1/ZgbYU6kaaURu5JNaprQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIe+XL10isB3sptI2DUNXfhmZ/w1n3MON0LW36OZX/4=;
 b=w6TaHU6PeCHLkhOG/xgbTr7syUI3/XcdLchNC5fXER0l9fFXgRjSU8ed6dhJyJ3VWJrBEft1V1yasVqxZUPl7BS2pqhCUWF+tWmJxMLK70cB1Nij9dXKnvCapnqBxFVfTmLam08S3LrWs/9bIoXp3peX10CSoPShybpj3Xt8sNhOWo5sXSbG2BXDpPby8Doo3P7ijAIKsiz95KGWNAlcSZ/r0V00RaZ+I/NQe2gfaXzXjtAkTb4DoKiJeN59hhvfnso2lALYH1O7mzWRID8Y/AJMWvXgxBlDQtUp4zL+7DHVKbZf/DtAXYUeBLHHR5st+Fn70gHrnhD1LyVprd0QAg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by SA3PR03MB7233.namprd03.prod.outlook.com (2603:10b6:806:2f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 07:48:55 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 07:48:55 +0000
From: genevieve.chan@altera.com
To: dinguyen@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
Date: Mon, 12 Oct 2026 15:48:43 +0800
Message-Id: <20261012074845.18039-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|SA3PR03MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4086ef52-7a80-4fd0-ce6e-08df28354375
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	ZWo9XcOdx328b3VQ12wfpdr9e1+s702+s2H0XxAMlZxqk8QwcBfiVSkBOFJk9mQHwv/KWKYocFELTTTsg96ZuVLFmcuZz75jXCSPBZLUrhbqSXIl3mGDC9kqpBwoCAW5CYrpFmPWTipdKaIzKpo1Frbr50ATjaBR4nL7XD770vKfyrsBI5yi4QyPftDznCdP3ey99WenYI3+JHNVl8DuQmGh4Z1ainiFKVkr9zK8KPbGz3ZBpEVP8cpdlFwAwnawQ1ffrTo9PUfxXI7N9iPWL+vTA5UZPxZl5sMskF9KF4mHkGD/PVqKC1wNAN2qMdLcFgoRlfeEaeDd6u/i7dEgF5825I5kCUBPtfKtH7z5Y8t28kbMP0ykCkzkEE9SNIrMsygRPFYnUx7WiR5sP1JUuruin88DB6R3bQPe3fM+ZSEap34DSFn3QKJLWK9pAk87qp5CYTlH/mFKoI5opYp+5rI2Rz4UK2kyg4pql332NP+LA7Jwvf18GWVTfUETibjnCFJANie05AklFl5RCMWx0lwfU3Jcd8x7JoFEzU2lubf8rnVrGBK7oqHJRE4E6B/D48VyIAjHI6U2nEdjq0nKYcznGrNxTcIeLmPMROf80XT0X0IVbRwhOMANYq1zNa9mR45RtNTrS048tcyev3EAYbUOPI4d6gMYotRXjdKH7Iw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5eNk6fknPzDXmtsvkh4Y8dExYU9G6h3aHR1MFJEQWpDCHUABecZLpfasc4v?=
 =?us-ascii?Q?FGhmTxJiO066yFZwyKkVurrdct8sfNU83OlHII7q/U7k0TL+5KmLvckkyrfW?=
 =?us-ascii?Q?PhrBtig70c94p0gFgPkhyAKnPvr5BA+YDSxyvGeT454ISA/IwWHJs7gIB7AL?=
 =?us-ascii?Q?/G5gtQWIvNk5kuawwG5d2DTjVBLiRI4UtcbXqTVrcsPADXjGhQ+LVRcIRAFg?=
 =?us-ascii?Q?DjnUkikuHLKjtg1xIBL1ebFP41yCPi8H99qcVFdlTqnbfR4QK2wAiFUsNJsX?=
 =?us-ascii?Q?Sh/z/pnU81nx/6VmuJNwQV1hnom2l23oWEVgTAdlOVtV8cGe1haqPAJQ60rt?=
 =?us-ascii?Q?5Y6zwP1CL9f7KTUNtipeVmmbmY8vT57+87UnS9l9GTQ2g3rwSkQff/R5vxwJ?=
 =?us-ascii?Q?3yE8KzZGLvUNptRE/NLYo9D4/1ZgA8YgirjrTn/XTFxxb5PX0vM+OwhkiPM5?=
 =?us-ascii?Q?ypAkuPEmlcl8zBKrMXkT6BlhKKFzGEFsLoBnBtPkwSwHHe3vP/+ssl56q1oh?=
 =?us-ascii?Q?Pn0fzAXVPB2dF8oHosCcNQO96E20GdfCsiNUj5LgKCX7jQ8sTVQkPfDgwwdl?=
 =?us-ascii?Q?LXQ6Qb7D48jorifxpsGX9eakZjsbnmgnFDMOvoKLEk4SrAgve7nHyiiYzCHA?=
 =?us-ascii?Q?753Y0MZfKWX2r/KDkFdIBrlnJaJnL66EnjqtItIBADm2xUu5G4pyEG2lRNnn?=
 =?us-ascii?Q?4nAiPmqO/PTo1d0S+pecIh/MTtRvn5GP6sYAx5Tfx9HtXvWYN4fSG54rvvKT?=
 =?us-ascii?Q?TIr6Z+KQ+qDpl4lRm+pBQ7dLMJRNcvjYR3hZn5Ytqw+7q9YpTBrGjuMrqBEE?=
 =?us-ascii?Q?1zRXve/VXkmyFrG5MGCg7BQwYDfL6zTWyJx7E+2k+UwXCEaEGIXudLtotYzU?=
 =?us-ascii?Q?wE6yQrKnpKgG32vUCg2e+NMKQ6LR9qTYaNHnAIZ72FarE+tuSR/+Mjvhw5m0?=
 =?us-ascii?Q?7uxV6W33tCK4LX/fTHyWTmStnGthyl7be+ahA9yZQwmHvfBBZPrvYFdPwTUG?=
 =?us-ascii?Q?l+LUl7ZgFjwXGDuQWUMv2oLtGVbvxAIimlKMkmhwq17UsZfM2MsjD172LDYp?=
 =?us-ascii?Q?jxhtKIif1arKwc0icEcfqhnt2YZEv6i+4O2vERLYfcKpe89tn4kWT02T0eTV?=
 =?us-ascii?Q?aeIj1U+ZBA8FQH0ENI5Lvv+zvAT3Rs0GptZrDUmYMSxLqAenDESHQyDna9gR?=
 =?us-ascii?Q?lvo20hzdPLFAL8BsCYtuyAQaYrPXLPsiBWbGySa99lIXG6tCHyJz2iKxBKFJ?=
 =?us-ascii?Q?m5Ty123nLyNAdDSZywkiAuddCzF29wndtBXZ1p47qpYevwMkpOQFRqka7SkQ?=
 =?us-ascii?Q?vvfCv4QgsCTtxG6VHZxWeJeex0OAGycpO1s6OB64+jm5Ejroj8FfmCW3pB7i?=
 =?us-ascii?Q?fMpnRmMb4uLrtbQ09gsQL64SEnJIKWQDaGrzwntFfH8JYcUXVdMTThYouokb?=
 =?us-ascii?Q?4DS6Ju2ABaMm9PSZg/qvQ4GnWSdKG11gAxX8o031XN4LClozX2J0x/lrvFVQ?=
 =?us-ascii?Q?PYV/oBmVaZFH9beovuZVoSm2Gh1hAFfMDTbL1bBhHzIVjN/1K6jWv2nBaaJb?=
 =?us-ascii?Q?x+vjVUISDG6rA5M3zo8N8m98VwSf/KSDEiTrZWurP6EQZAazBRrraJaF81lH?=
 =?us-ascii?Q?kcAhZ5SPvlfavKb94mmd7zespNR7q+43jgCiOLMpLsvgolGLOYxiRCKmhEDg?=
 =?us-ascii?Q?D3y+zuGszpiTVCSwQh8x9xx/8etzT4o0k/Kmn/lcxNS75atAOch2FVBdbc0X?=
 =?us-ascii?Q?7DxNsi+gHFRpxTYwfuzE7NTTquWFknM=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4086ef52-7a80-4fd0-ce6e-08df28354375
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 07:48:54.3631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWL0836yVJrYmfLl2a2DYRJaBdFOMiibMkJS5RjuMP2u87CDyVkrtmr1vxsmZmm6MoVQlczm11CYcDRiKji4Fu5+0SJYOKjQa4wHfEW9TPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7233

From: Genevieve Chan <genevieve.chan@altera.com>

The Agilex SoCDK is populated with a single QSPI flash by default. A
multi-QSPI daughter board can be fitted in its place. That board connects
four Micron MT25QU02G devices (256 MiB each, 1 GiB total) to the HPS
QSPI controller on chip selects 0-3. Each device carries one partition
covering the whole flash, and is described in quad mode at 25 MHz, as
the four devices share the clock and data lines.

This is a board-level population difference, in the same way the
existing SoCDK eMMC and NAND variants differ from the default SoCDK.
The HPS is the Agilex SoC, later marketed as Agilex 7 F-Series. The
programming model is unchanged, so the board falls back to
"intel,socfpga-agilex" and does not add an F-Series SoC compatible.
Agilex 7 M-Series is a different device and already has its own
fallback.

Patch 1 documents that compatible next to the other Agilex SoCDK
boards. Patch 2 adds socfpga_agilex_socdk_multiqspi.dts. UART,
Ethernet, USB, SDMMC, LEDs and the watchdog match the SoCDK; the QSPI
node is the difference.

Changes in v4:
- Give the partitions on flash@1-3 unique labels so that they do not
  share an MTD name with flash@0 (Dinh, Sashiko). flash@0 keeps
  "Boot and fpga data", which U-Boot's RSU code looks up by name.
- Explain in the patch 2 commit message why the flashes run at 25 MHz
  rather than the 100 MHz used on the SoCDK (Dinh).

Changes in v3:
- Rebase onto the socfpga for-next branch, which moved the SoCFPGA
  device trees to arch/arm64/boot/dts/altera/. The new DTS is added
  there.
- Reword the subject of patch 2 to avoid repeating "Agilex" (Dinh).
- Add Conor's Acked-by to patch 1.

Changes in v2:
- Rename the compatible, DTS filename and model, dropping "agilex7f".
- State in the binding patch why the fallback is "intel,socfpga-agilex".
- Describe the daughter card instead of restating the diff.

Genevieve Chan (2):
  dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
  arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 arch/arm64/boot/dts/altera/Makefile           |   1 +
 .../altera/socfpga_agilex_socdk_multiqspi.dts | 213 ++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/altera/socfpga_agilex_socdk_multiqspi.dts


base-commit: fd26798a69439d6693a1f83b0763031b306cfb4f
-- 
2.43.7

