Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010004.outbound.protection.outlook.com [52.101.201.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7F8439328;
	Thu,  8 Oct 2026 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791447036; cv=fail; b=s6JTOGQT26g42Zc5MEQmPAToGHz1Buvwf7S18zCalCHIqEG3S/GnwEI/2OSDujJrN2x4s1+sxvNNJS8pTTFfJhtuiBA51Oq0ig4IeSliEd3QMhQTDFRXm2xk+xZcM9OtgaF5JieigGbOdHu+/KCFgkw9apq8HznfkE+sdFl97MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791447036; c=relaxed/simple;
	bh=gGb5H2ZlMwfo96zog9CeX753vUd8MHRydOSkEmc//6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=L13iV+NQmPHBfaazmWU4KjdP2SW0TFrSOs6OG2nlX6UldZSuMDUb96wCqXtK768ix20eBDHO14WJLBMBMmfWYVONtFxXfl6P65McMDwYbBAD1DDSbwceu8+1i4P1uMRRv/C3jS5FRaRhDq1mb5wX/QtD+eZebBGxziuAWN8G3kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=aTFNrGhX; arc=fail smtp.client-ip=52.101.201.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="aTFNrGhX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcAoWZyRYLoqfAkrLOMZA6QDE9oOAJOOHGTemZ8H6dGiZHu6FSIsAtvHwwe4IyyCeMJnYabErzRyWejqBcrGM6sOC2mF5aHDTM45uAyfHn7X+EjJT1rN913IVot1543N/x3Ig4KQJ0T6We00swi05I8Nt5+mCgiasNUNluQxscGkZkJtbytphazlVFnCyaPaxTiiBuOiNNu0Au8lbuJCL9Pl4yTEgHuVCVx3FGO65ki05pDsOLwlWRy0U5X6TcTBRjxG/bbR9JQ2VcYAc5onxCn7TYSFFdeovwV+kOoGcRp68pTSy9wgZpb9xjTB6DpnBeZYCJIPBPx1Suj4EweCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYV44y2kft9rdGvnePe7TKVl4NxVtnaz/k9NEy2T1a0=;
 b=P/A65bkNqjYDlLbUjUr2z6RbP+WUDos4CzY6vRmDR5EG95hBC8qpzSlh4SFavR0i+3sFqmri8RnVDw26Y2xz0FmoFMxqQMHEKTS+UwEG/Pe8BG5vjt+X74p01aXF5WJWA/5zim5MMEJWtRxEGIj0nXu+bGAX4zlxvMoWpa+mydkgT8LhEKF//TGjDeW6yOOdARzYt5z5+QHH/j5odtimO5yfX1ic67h8DZrvfAPNC6RI3s9j/lFtQI4qVZPmbM0aO47w/Rna02m5c+41E5j9rdGqPpV5dk4JoCSDApFtsvutm5+lR/5G8U4+dnlT+QcRXPLJefICK1iN+j6UiycVjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYV44y2kft9rdGvnePe7TKVl4NxVtnaz/k9NEy2T1a0=;
 b=aTFNrGhXH2fDFnjsh9/XzkmZQuQs9FJPUYgrSwNnb93E5Pui/2f3AkRvqi2MR3Bl2UJdq9LgSS7+OfNIjBfg29f22C96Flx/IMgUgpVAjJbK7WyL1ajhHzQfXsbZfI2aLOA6qNJG8iulQZDGRH3DPXignlZJhCVnGQZQGF7HlNgm7CuFzF5xltj4CDNulo0jLq8G/iDw5Z1/6dyeTBP9xmeaAJs/zhLcVgJUXEzwHWlEVtUdJYJ3UxzTLsucQZyzRYkU34KUU4pR74TnT2Gvn7VwOyA8vuPAgw1ekw3A3UoFA9ImPD6fTKJMqIq4feiv0PWDmaR6uRt6pmmGCHKF7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by CH4PR03MB7745.namprd03.prod.outlook.com (2603:10b6:610:243::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 08:10:22 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 08:10:22 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
Date: Thu,  8 Oct 2026 16:10:12 +0800
Message-Id: <20261008081014.35006-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::7) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|CH4PR03MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 708a203e-e56a-4025-6a51-08df2513999f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	21kdeEn1HIQ7DiOrdtA4xxzk+QCc3vsPAzEjIQZRCMH2H7WHvcay2xXCDo6XQfVmP8FGtd0pB7036MjIQfCFvvYTwKVfE12x5HskrQpdgnsGmuJe5k0FDfUwEYdmcG5TeJA5uiTTSYGKHcxjOOX93Ay5zepRtkjUMWh/am5uHXQ/l7rJWVAEYeyaEt3zPsu1w869meBXJN7uToFfvSvbCkuSaMdisX6DCErICm66s0r0zHIcvc3m+GP0mlNvgoaOr7cj+LxZWCgLjbtKbQOgo6dZtxsdPcy+ahWetKmEdBTcf0MobhX19Mq5mKJ5LdcBYM/5DgGfapjtf6uKO2aZoJ7vl8k1VEuLkAyxMOfp6D5UEt2Vlq4Wm+mg5A0Ro9pFas8yzWBuOmF0he++a65CU2HFerE91vGx2psJTcyVQIueDfxQvlax/bhzWpIS6WhScj/lyCQlw+S44TWAQwZneHCxbR5gR0ZxJtrS37Qr6mERqWAhvczzeBt/KeAHI3+qJLroCzHSCcPTfEf0FSTCl8mRlu2f6wVRnGVXlgMq/l3EYkpJ1fHYU1NgjT2g2duj6Gbfo80U1s71rx5dXQnQPyzAG7Y6zEAVue0AYkVCFps1DJog0JkF4S/hD1A8PP5kOA5ti4jf1vkD5Dh2SqdxyN+l4vWYEEfB0ZE/c3Hly30=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RdwVXF3OWik7+ZFWvvkWnZM0m99oAH4DCCeSbVuYtcNZdOf8NwupxF/KjpWT?=
 =?us-ascii?Q?AP1SoxY7zoUEXiznZpdkm46t3S+XvRkCau0p5eoeWd/rom7n9oYyxN8QCq+C?=
 =?us-ascii?Q?Xq92qrfTCMeTT/qgLFK03dHwApXPjl4dd8RfyyQn/emGhmi4XhTi0NUyoyr7?=
 =?us-ascii?Q?6JK5wjkIgNU9c4yT/ftHqmILL0JmFs3yclNTDspPMbS+Da3FZAA7wYxnac5+?=
 =?us-ascii?Q?BHJYbPsxzSEs5X2kYGMOosIr7iNrkWf4NhDcQ4ElNtUtrXM52i0mQBN+weeD?=
 =?us-ascii?Q?MgY25D1LQTpUJHPi7fd5AIC5i2QvFyZD8JD5fWwdH8VY9LmEE+QI9WXfSdd7?=
 =?us-ascii?Q?bJrIdiCoKsx5TiN9rNXUzisdUEVN4biC1UdkFi1lxDFPko+Zyn7iotGTG3UC?=
 =?us-ascii?Q?eLd5xf70Rz8JbSdPYCyOp0XACG5XF3QexfHFyeQy8WbPeSTQ4OymtbAySSLV?=
 =?us-ascii?Q?oMnMAB49UqsAlrcU1/n21idJUfiNc8IQe2VJzL0Y0JMCUKFC48bIk65U/L4y?=
 =?us-ascii?Q?TWfoyvgckhOWcIIjF85w3RVxu9r8S3B4SHJaR6UWBvioxtj/cjLT3s60ICWE?=
 =?us-ascii?Q?FJ8gTD4YDkRQB2q2UvtD6/39dblT4EeaO920PZrUgUi4JuK4qC1TH12BKIaN?=
 =?us-ascii?Q?d5HkH50atZERd6jyRC4KBDMGZDXjwOBgPW+w8+3e9eKPr8KudHkXOD9VprO6?=
 =?us-ascii?Q?ubsMQpllnB5zkHnUNW8Mr/9q/E1lfHztTjy833jJFbqPctCui3NcIqUPEwFs?=
 =?us-ascii?Q?UwHLkwH95B8fy/zGGePfO1DIWaN7KDDuszsWTkZnwTBVqVbJFUR9sSp9HwUy?=
 =?us-ascii?Q?Ej/SA5YY9DFQn6yAR4P2rQmfGsMPQBIIl+UBOovuBXOOjq79ni+DOTGM5k2w?=
 =?us-ascii?Q?UMc1YpdSKNF88fzKLv3HxO1alhW3okWCI0wbTePFubWOwd4Z5GBncu4pTK5z?=
 =?us-ascii?Q?Mccomm8D4X14d8II+4f3rSNGuD/ME+m09rYekx/Xi/6seMiqA47wsIRrT6dF?=
 =?us-ascii?Q?lQgh6xDLqY8rMJrTXdQ/i3PnWSNoi9jChXrdK0kmJFK/TYpbdLjn8pA700OS?=
 =?us-ascii?Q?agGsN8Mb40PwXvT65E2Id0IiyIMhh7KR6Of24Drny7VmWoC0PRD0g5rzfpl1?=
 =?us-ascii?Q?iGS/S1tJEHiWx/BDg5QW1ed0H3Z13zAb4FFzYpNPjXNbBl8MDK8NzUc14epJ?=
 =?us-ascii?Q?u7ey7z1+cH6+uObFyd+wQ/tgFY5HvF07oi1blQlWKEhWxSuiKYprgbseY0bl?=
 =?us-ascii?Q?+astWUNcFe81yFp8Oc/Vg4snsiwlEcyYk6KK1daBnsX1j56ekt7RkGMZigoh?=
 =?us-ascii?Q?qwpy+j1saZnuY2a7VI4fdaPC4Vd/WqZmGfQUIb72zAqY1JXrdNusN7hELlzy?=
 =?us-ascii?Q?cTzOBQLz6TJfPPSYDlgRdH0ZoQ6yT/yrOcFUiGI3d5/9/dulkTCcHr6XULqn?=
 =?us-ascii?Q?GlB0g8MlJAymlvAjItj0cf+DWGXofmAzaEOjlXqtMCn0xAL2OGcmC15rsq7L?=
 =?us-ascii?Q?6ztH/QGQneoolDl420m1nncfj9+QEbkv8tF9gwdEUPW7t+IABmR81aZ89dFH?=
 =?us-ascii?Q?hdNZw1dA/QM6U2dGFObSEmluOf2TUUFmdG3VgV7eXdHjStxlhSnhtmDiN9pJ?=
 =?us-ascii?Q?WwpJgrwkXDo/gDBo/SlGSDB/beXkVARZu+n4y5L9r9RdE3jnOQgZuBPznH/5?=
 =?us-ascii?Q?SDvn/P87A4Xj13OJVenEobAoutsqECozpxqq67szCZIoqTiwx4Ap4xgVvqJT?=
 =?us-ascii?Q?ii6ooOYg5xgkxdx3XUzJbp9BhIqocn4=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708a203e-e56a-4025-6a51-08df2513999f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 08:10:22.3875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NL+4ULzl4BHhsFjU/mPZVpVeULngCdsE1tsOK10YBOub8Zijy/vUlRazi/St/Kl05QgxwvAkuDZRQTD++n2FPVEWZhxS8znuJufE0gSp7Vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7745

From: Genevieve Chan <genevieve.chan@altera.com>

The Agilex SoCDK is populated with a single QSPI flash by default. A
multi-QSPI daughter board can be fitted in its place. That board connects
four Micron MT25QU02G devices (256 MiB each, 1 GiB total) to the HPS
QSPI controller on chip selects 0-3. Each device is one "Boot and fpga
data" partition covering the whole flash, and is described in quad mode
at 25 MHz.

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

 Documentation/devicetree/bindings/arm/altera.yaml  |   1 +
 arch/arm64/boot/dts/altera/Makefile                |   1 +
 .../dts/altera/socfpga_agilex_socdk_multiqspi.dts  | 213 +++++++++++++++++++++
 3 files changed, 215 insertions(+)

base-commit: fd26798a69439d6693a1f83b0763031b306cfb4f
--
2.43.7
