Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96EC30ACF0;
	Tue,  6 Oct 2026 02:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791255270; cv=fail; b=huNKdPKHexNH5KLoc6JnKX8ulYZH1wg+BtJvgke25tWGqlyNQ04r/2YkleZNO3mcg5hNJC30QND3Lae+V8HdSODCsQDrK1TNoO4aDwbM1iC5oS/1ZCOuBo5x1EymGuwNEIkWX677OfxP7fFMzRfcCKGoSUu2jPmJr7mkCijD9TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791255270; c=relaxed/simple;
	bh=Mf262NP93HqOMNsP4g5IYLQH/83ks8jZ/zmO5dVs5O0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=l5dF4zH7KXlQCuu8WuddEBPe02vPeQ4faJqfYhFBLR32B9U2fOwXb4XY+fFdPQOVRx9hg3soJDCYNNodS6jLKW9C3rdoSk4gA7fdeRs/MKd1g6QqXyFDOVQnrnRg8doNrxhm48k1+VUi9mnixT/VhRf2CSc7G3zrwFjHsKugG5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YB77HM7U; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YB77HM7U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQPjR0MnUTs9WPeDbSl8/DsRM7hSdP9Xfh9RNXIz7jh/vXu4h6OMbnyudzS6jhk9AmMuTCVIiG6SfllbcpUmc83OATDEClM1gNjkTdS0eCqz11GuwbciWhGTKpfUnvb80P2jaJyxH46jqrUxc0qqpk0ncwU2Vp2sh4hyPotA762cvByMPTncNQJ47hfWSuDgByinzirTqWPySq296hMyByICw+jC9LH4VFjV34VtHYCGAYmv3lA7BgNU3ejesIxpylVxSP3Zr4Uyk/pWS66u7QTU+AZIvSXIexSWKfSb+cgJv5pjRUmYyKvu2sPnaM5GBL7Lln/7q4BIiEE+vb4FuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeZjbQQGxmtNEynS19p26f0BEtR7z+ihogep6sVj/Rk=;
 b=Pn2HyufVeVTqyAcxT/AQBUD46hjlG3CI54gxIhIbRj3Z3YbwphZiqRH4FpdmTKPhX/Uk1WlEE9GUC+EDjhO4cAO2z4pl/JcjkwRVRRvCLkazWHTztrVOJkRFSuC/mrGSnsnTplFTmhBROlM7XMgu6Vj8XDahLr1p2GC9S8R1UPh8cYbSUMdTsNASebKasXelzYQejXotCt/k4+Pv+yGZD68AF0D+GvYz4hJ4C8PnqJ3zxHtrexpdRWWQjym6XC/uog84xfhiblYvG1hCZad7PhPGXKo2UXgkh63poj8pLCv6uIL9Ia3K8Cp6CvihaB44OJKnTgxGaSppNtjJ4bNnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZeZjbQQGxmtNEynS19p26f0BEtR7z+ihogep6sVj/Rk=;
 b=YB77HM7UPfRJojSX5748YCCHsttWa59onJ5SFR8cKU7dDiHYL7w3/iqHoFmPt1PW9N4fsqbR8hDz2d2W4B+4WatTmw/1lGTsqijVY3rm7npkz36sSwFrdh7vgVk51p5pydhhT2hWzcFeP1u2TEnWdDekC7EOn9jMZjVgBQwWyGq92jSttOlXVa1W1tZKtLLcOjoCLfNAs/GUKx4gD2a8mxghx72Qaco5qvV4cqo/b/jRiuLCC5xgSBmhMIcdnTXA3OrHADLqsGk8txQE1VEwnx7CU+991oaLcWOLII/dCth/YgQ1tzuEznT2yu844TldhCZ2v5HWgSM1m43Cy9TNlQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from LV8PR03MB7398.namprd03.prod.outlook.com (2603:10b6:408:18f::13)
 by DS0PR03MB989595.namprd03.prod.outlook.com (2603:10b6:8:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 02:54:26 +0000
Received: from LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982]) by LV8PR03MB7398.namprd03.prod.outlook.com
 ([fe80::9d6:b5c1:7f72:e982%4]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 02:54:26 +0000
From: genevieve.chan@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: socfpga: agilex: add SoCDK multi-QSPI board
Date: Tue,  6 Oct 2026 10:54:16 +0800
Message-Id: <20261006025418.31931-1-genevieve.chan@altera.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To LV8PR03MB7398.namprd03.prod.outlook.com
 (2603:10b6:408:18f::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR03MB7398:EE_|DS0PR03MB989595:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc6e348-497c-48f9-8314-08df235521f6
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QsCFJjgMVSNjWFilPWdDo29baVYa8SAJ1ClUR1ocSIjQH97wELipAqfcDvMKkcFrcZ+z0Mzaw8fVyNn4QgfqnzY1S0fuKM128QPlA7pbVcprfnrSDvIPPCfmiGdGrqOpkeuRKGj1U46OY4/lBkzS28ryDKRBeBWqxInAee0tM8BVAHZtmoiL2+VDKG/kknnqqGq1cg4pOtzdm4bFb6Rt+gXnbOeRuIk+7pq5mXwaic3YYD5FX8O8Y9yUxVPtfCayx3Rtr38j0WKRGigf1z+k+YUTg0FH0L58/XMynwRzGtduN2jTHJRXYzEIWokZFH7j2im8qijIrTinO8Xpdva65XYRpA/8CCHGsORJ2/KYmdMGi/Q3pDuQlvHnlKS2zCk5jvjv0wuspcOj4du1SNuSeuCgCR/iqwEwn3hGQ4h8Ym1vw39FrR3mLoCXD81iyamZ/wRfkXrZjPQuwfSmU8BnXc/ipcaWBZquP39RUOxmRQ3kagThEyosdLa2Ohuesk0Y+N/WtjO2z6MB6Q1hKrgn8NNrFopAuDHDRiNyZu7m0+9/Ef01MHtUSypUnUPj0OTuizI7S/RtAPeNG9q1PZLLFgci/iUZG/V17pdvNoYvEtKKVrcWw/rA9p3XZxp66fBcAavVKiiJu2x/I18fjNgAJDc3L+9MjO2LmaxLrTGXSxI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR03MB7398.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YArkGjEHDIObh4hDT2UAVsel9OHVTEOUxFKdGJ0QU9BPRHHHiNKs+SMDnvsm?=
 =?us-ascii?Q?JwxWhczjZ2Y7KopNTzTda0fuKEkRA8kq48MN+ATShxliSGPmamVx+YnCXXdC?=
 =?us-ascii?Q?k9QEP97lsBpmgTuxzux5/fOw7iDZSqcJ0359dp1AE2LwU3csNdEIFqYMKTgk?=
 =?us-ascii?Q?1DvVMIr5F/lE+Kg7vxpiyxkutxqZtYEXsvPGxea4KP11ZzQ5dHzvIbcBUoH+?=
 =?us-ascii?Q?CHP8ws8PfIxzGgIGSreYOw4mS1jp41RHl+3H00XyEh8oTdCe12y/PM9FjsKA?=
 =?us-ascii?Q?INqZQwxx0oSXsFtXnMO2rRd03Vc1yJz2tVBV9lqqAw6HUgAp+Hpp2nGGxPRJ?=
 =?us-ascii?Q?/BOA1r75895w2nuwLMdF/uExgPjQybWa+qolbzGyh1CzTr7mgZVdKf8n0ILh?=
 =?us-ascii?Q?bH2zKDboUqC9910NoOc1T6W+8SSlCxS2eIPcrwAMF6D+zpo+AHruAvZd0XhV?=
 =?us-ascii?Q?hMKYFh595XjCzRTuPtdktrKhQwq2m1GBEZu480l795uHfLpmBC+FCZXoDR0y?=
 =?us-ascii?Q?3TdUe9aXh7WHYUhSvVuG55Ta6g/v641x9VsC0Q2yfNTo5I248BYZKh0clD6d?=
 =?us-ascii?Q?F5Xu6Em4nfE8tKRupya/6lal7liJdsF+ZVP2uP+GEcnqJKFbugEOS8jreWu1?=
 =?us-ascii?Q?X+sD/KlbfXsbRqwUW/p4Nbkx3avZZcCA0cxN2gDIG1XXE6R/Kt0wHyHUCYUx?=
 =?us-ascii?Q?Hn5p6HnV0pmPtmgwKsveV9QBFL35FxlSpoIUgKHgv9+g283rhYNQDYXS4vFy?=
 =?us-ascii?Q?CkNbIwS8VrsLTZkPuWFXpy9PKQCmNSw4FrsYpDv/9df9a814nPoxpdyYFSON?=
 =?us-ascii?Q?fUzPpAiSoVGXrWiczTLPNHG6FUBUO/5Z2QHdWwntZiw9AgLOuPkXeMu8KqdG?=
 =?us-ascii?Q?qUT8WUyarixgBBWN9g8CO1RiKbBSM9yTYFXzIdVVGzb6sFcKbOiJKvvFg7gC?=
 =?us-ascii?Q?IgRMO2Lhwq3lKypU0F6bEhn03vEuA3uFDA6/lkhADdVyLIAU2ESBMEcZnytZ?=
 =?us-ascii?Q?ev2IDQDQ3tmPXl8DLqJ1O1HnIYwTS9eEmGIRbFW252RIFC37HXyKV6yoo/LU?=
 =?us-ascii?Q?f+/m2G7oZkLyMlMmyrpIBq6QZg9lT+GY6qtH0cG9vgAjs+chEvhT9OQIebwZ?=
 =?us-ascii?Q?WltKCs9ERoHW+Wy/mJqx1U+jBcmoHIsau0o3hNYSqdH3P+8rtaBJUPAKWmhY?=
 =?us-ascii?Q?a6LkQPUBMbjrfH0MIZkff1DSuA+8OQ26s9d6EcMm+xBjnOKrQps9sB+Govnh?=
 =?us-ascii?Q?Cls6DAZ1fpEUytKPwjq++fdT2t4fBqaiRZ0rDoqFOMCDA9dt822yQqf9pLsB?=
 =?us-ascii?Q?05VkPEpoU3JwqbG1Y+WIvutZKvunR4+WSU6raO8i6akZhmL0oViZfcKZaFOR?=
 =?us-ascii?Q?KvIwZe+SbQUSeoVxeLb3zVnY90BEOYw+9ltd8BlBAC/2Eo9aqgb+tXhnBWGJ?=
 =?us-ascii?Q?t7c/zLgI+TKtl1xRYqiG45vusJWnPWlvrqXRXRQpM8vWx/LbsLSn48zZLeyN?=
 =?us-ascii?Q?Z3oHp5p0hTU7ccLpt3qtc4UWFU4GwjOEssW8RuVVaIdyPABx8FJQY5wVQysr?=
 =?us-ascii?Q?xJyJF984mBc5ZVa3oLa9ZmTHpfj/IAAVku3vocfhkrzRtCdER1xjgdXyU+3w?=
 =?us-ascii?Q?qI+iZ5GoVVeKRq3WQFLEwRmwK2rvXXcYVk2mrAe2k7wDo8+uEbun4qtFOuuD?=
 =?us-ascii?Q?hBMiErxAVxOxx2Yjp8FBNMIRe9SaPSN6epS+dr5h23vBT/VHoVPX4q9ZTEkf?=
 =?us-ascii?Q?pBIPukzfjKxtvv+Dwf5QHhp67oJlw3Q=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc6e348-497c-48f9-8314-08df235521f6
X-MS-Exchange-CrossTenant-AuthSource: LV8PR03MB7398.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 02:54:26.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hq3jhAi1npy4oCjm2rwGhG+EaZn4+o7Mbm6I/IsT7eMAxGmW7KKZvvFILpy/fgIHX/Ms6vyj6wjDQSr5+Tse8QmYSW+f2PL33oi098whe9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR03MB989595

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

Changes in v2:
- Rename the compatible, DTS filename and model, dropping "agilex7f".
- State in the binding patch why the fallback is "intel,socfpga-agilex".
- Describe the daughter card instead of restating the diff.

Genevieve Chan (2):
  dt-bindings: arm: altera: add Agilex SoCDK multi-QSPI board
  arm64: dts: socfpga: agilex: add Agilex SoCDK multi-QSPI board

 Documentation/devicetree/bindings/arm/altera.yaml  |   1 +
 arch/arm64/boot/dts/intel/Makefile                 |   1 +
 .../dts/intel/socfpga_agilex_socdk_multiqspi.dts   | 213 +++++++++++++++++++++
 3 files changed, 215 insertions(+)

base-commit: 04a1d21330501b113ba04efb81724f1c95ad2db8
--
2.43.7
