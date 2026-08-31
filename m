Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013045.outbound.protection.outlook.com [40.107.162.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115613C0A0F;
	Mon, 31 Aug 2026 06:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158943; cv=fail; b=LlWWbn8sQAq/1KRHq3JZqDz4rvM2XzpLFmOZLV2Uw7H6vBi5wO+FZJq3Nq8AFXwPnJnfGaaxF4pJuSE4dDom+KQGzRPBf4Wwc8Z2MrWfiREGvvnnePj/WWJ9UeDuHxvTXuVziVllZVgs2IU38g/oANQTwRc1ni+sAw/6UAi4BQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158943; c=relaxed/simple;
	bh=vsKaUQMCunSlmWeYEPnMWmm9qCmWNh5oGRkVrreCRJw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ng5VerNAOF9+KCwuqPTd0b7XJhp8dtjdckoRnqdFbIOE4BeS7q2608s1vGZz4MkauZhO/SIWlD1Gq/GXeBxB1lvXvKS3xKiHCaCRSKI8zK2SqP58zkwV+YSLcXoWWYjl0JQJzJoZl43tjuaqcILEc4JT63FzrfA5dAYUsILzoHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nDZdGkWb; arc=fail smtp.client-ip=40.107.162.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nDZdGkWb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/Fvz+8sTQ17OgkUc0TpIlCRGV6unoECxKnya0tLJVhrhR1Azy7luJpmug/w8DiJbUqc5Ovxe4I8zIy2litTPRNJuaQO9yCpO5lZjaaaAmyBhLHNRythWjCwIsQTJHUO4KsmRw0/8vhT4lYEG5bw3NjFFSZL8vQ5RbIsN14sQGezwAtsxheaF6Yv5liyaPpwAR4kMtUL9G6qqOiDYgwp98ccelF1m9RHtxEFcvVGt0GCcnM/Pcr81hhsmC0JTcqkncPQyzVo6qVcPMxPezC9ryWxKxb99gLcdzhFQag/G4SwDker8vT9P52a7f6bdvbsn00ap6WaEV4o0/2se6+cEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=S8RgUzUHK5kvyY+6QEcwVMz3Cy1BGbWiRr1oeM3Qu1SAEMlWHm3HTbSTQmZgjXKyJ+GdmM8v44Z3VnX9FC1PlqZjnoy1AAbwQwpQHsdYtYhuCQ5QGTuHEkNZlglH+U+sXptnaZ1YCwLqUDEFiki6vnzMs2UTV9GPA8dTLPDZeiGuWg1AcEGN+754TAPt4pKDaHwpPK4h6+ZyWw6ufQoKi22rvQy0+/snHgl+YOV3sG1oivNNbwpfhb/PQC4/KZYzpbnfK2kUDqZ+DJON0Zi+a8Y/9O8fy13nTzkER8VOisJripSDftTBgf1e6BiZGPGM4m4V8Ehy4WIwyVkIOmLlVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=777BBndEZWN0pQ0+ExXhYlFGeXGjovNqwjmxa9SC7PY=;
 b=nDZdGkWbulPIBiqHrl0kc01934aliyqtiwJKbvsAD8eCLk9xlUeu9+0ouQB0rAjKZDgkmMf1HN7AuncGD2x0Uyh0zaf3Wt128Zz6vBv4IB4CIfhIWZMHkZLNcgWdZYqYOtZkkhDNsJ7r/3VoFfViKvpqca9WIcdlS3WjNMcSh+b3IK4ZsNm8X6CckKSs3ocu3HxGC1ajX0kKbgpjqkxJMaMC1TWwFu9DSA4TQ/uPxiXoweiZDU+ZJhgKsuMv/X89oMlXZRUYeXv6uoQ22/wo2yKaCItOdNmDU3KXbVxx8ZL4hCA/+z7wGiDtU5g91hfRu+mHqffdQAM3f1eJBikE6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by DBBPR04MB7705.eurprd04.prod.outlook.com (2603:10a6:10:209::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:48:56 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:48:56 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 31 Aug 2026 17:48:28 +0530
Subject: [PATCH v43 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-imx-se-if-v43-7-a3deadbda4ef@nxp.com>
References: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
In-Reply-To: <20260831-imx-se-if-v43-0-a3deadbda4ef@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788178704; l=2500;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=LA5pZ8YRZFeVk56nd//uP0RHiwT4E6voL97vzkkh9tk=;
 b=sgl06/XiMJUI4/eIKouJvKrx87HQqVTrAjb+PEJ1rr+VDkz/GUKTXQahBK+AgBhySzMX09vum
 UYkL/WCKeciCw4nKvJvgtwQfbadkmwQsVdAbHGdcOfq7Fko/UiPOHYA
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|DBBPR04MB7705:EE_
X-MS-Office365-Filtering-Correlation-Id: 665a2717-0df0-4426-9273-08df072bedf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	JEjoM3QUe0X2UMm3PVHikYVgRpCqsDxXkIi2rB5NCALwp4/p5B7FpjWSgoMmlNGwYsxVnB4lcuH3tQ6D/Uk5zKsa9hj1vn/WbG73TNE3cZ4yFiWsAZbmaa4JqWdQB/FQgScTgK0+Kro+vwagdkwe9p1J1i/g7hlYu21U5MB0mAqocl66eKtzJSl8zqptdlXlQn1N3iX3gswoRqfJuwzWxWSmxsoq1bMUCb8+dex15bUz2ikxL/0+h+i6sCimsRFr0EHczXx93c3Nh6qjzkZWZQKxiRKpjonA25ieu6Z5aqG2HkM9hXSGIlmvI4IjtNua+NpZI0h73egJFLCC9oI5uVQtjE/847NDj4nYng8WdNkufTbvWTgcy+MJQs43xJoNXcTwwuj+x/N1+IzpQ0VDLqFflhHtbGyP7T4mvuRdCBRi8nAwUARQ/7eWiVa9jlhfaXyJ3FVRGtzRIZOaMJZJKh1R6dWgds+VVx4O1ZVsWb/krlzXBKQUcT/WtYd+gxW4p4yRqj/jvFn9Pff3crHzRpofocP2Ies0eSBjliV/WbtjuL10Ceydm/Rm1K2t1fSJUgre825NPxliRpKMTK4KhQWaOAvBxwA+IxwhHpy85RkZmklSwBYuaHvnmoTaRqAS+Eer5RtStGmir50eZ5QKax664CWKVnhKZL3g7og14u66B9n4GqHxhu3PcbQMFqop6eXoxAP/I0cXDmH0httHKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlJrV2ZTbERVN3cweHdYNDVKR0w0Ukk4V2FCbWEvYWxDM1pIUWRMemdKT2Vp?=
 =?utf-8?B?cjJiRmlEamRaQjlNa2ROdjdDLzBOK0lrY0syRnR4aDgzeTFBUldOTVlZQTdh?=
 =?utf-8?B?b3l6MWRzeEZHSW9UVjRQSUkyUjhGLzJHVHpXVWMvV25OTjRWSXY1K2tIYjR5?=
 =?utf-8?B?V3JCTkNDZldtazViaW82cW5QL0VsR28xaWFUVGU4ZkNxTC9ka3dVNWF0ZXNu?=
 =?utf-8?B?R1FPQzh1dnh2Q1V6K1pycU01aDIweE9hdVlOSGZZLzNLcTgyZk9wWXJ0QlY1?=
 =?utf-8?B?MnNJQmc0YWFRWUVLcnZWaFJZa2s3TGhuUndSRHFrbmg3dXlvZ2NRUkRzQk8v?=
 =?utf-8?B?VEYrV1dTay9EdzRadmdTWEhnL1NyY2tEVUhFK3E1cmxubERiOGNLOTdqTkdQ?=
 =?utf-8?B?R3BaWldNblhManJRcjE2djE3RVRQQW1DSENoTjVDQmJrVXVSQTM3WFlKVGVH?=
 =?utf-8?B?ODE5NUlDWWhybCtRTmQxUFNQMXdhS0FnWVN0Y1BTbEtjN0M3SEpiMjdpMGx6?=
 =?utf-8?B?dk1WbU5YcUZCZDVRQW9RN2IyUTZKL29BY21YVnJ2S2tPdUVCU2QwNlZrUm1D?=
 =?utf-8?B?TzlMTFpOSmQ5OGZGbktmbWErbUllQ2FQUzJFU2I0MUd1Njh4aGdaRldUdy90?=
 =?utf-8?B?WTI4MmlvMmhMK0VFNkRvWXZtWFpzNXg4MWVTVTdMTWo2dDIycmptanBLM200?=
 =?utf-8?B?ZVVPNGEzbHRhOVR3TFV2cUJ1UkJiVSs5bTlmeDczODVzbnBUemxCVldaRWdB?=
 =?utf-8?B?OVFGTGs1bnNiSkN2dmJFdjJETVd3U0ZLUUNwQTFOTVJmZTc1YnFzWFZpaTd3?=
 =?utf-8?B?ZDZtSVdXU0lNd1NBV25ra1RWdWlaeEJzeWVROWthMVFGaHpld3ZJUksxRG55?=
 =?utf-8?B?UysvOGpUYjl3V0dWSHdGYVNaa2ZuRnliOG8wRXY0OC9wNHArMUtVeWU0K3do?=
 =?utf-8?B?b0J5blJlR0x0Z0c0VlFWWkZ5SjZacFNxWHEvRk5Db3hyM3Y2RnZNSUVxSVVX?=
 =?utf-8?B?SjRVUG5jZk5pZXhpYzdRRXBIZW5lU3RFRVIzU1cwbEQ5MFFob0pJUkowa3gv?=
 =?utf-8?B?ZmJhdTlVSGhkRStzWTlUcDBoOSthMVI1aVZvWXpyMHoxc3RZUUFhODdSM0Nq?=
 =?utf-8?B?ckxqbGppaUJSa3FueGtsaE1OM29VeWRMbVlvSTZWZSswVnBoUmVYMDFkT3JL?=
 =?utf-8?B?QnlKa0R2clMxNkNBVHZ0OTlHd0VGYUVDc3hMWkhmclZzQk9mOXdIRHdBUzZk?=
 =?utf-8?B?MURCd0tDNHd0TXZ6TSttTTlWMmQreGFuSE9HT1Bzb0dZNlo1VTZMelNyREJV?=
 =?utf-8?B?ZmZsZVBjazVYM1RjWEFoRHdLcnBOdHFydUdFdTlkS0dOdHJQekVXNmdFczdw?=
 =?utf-8?B?bmhtVU5MdUNmbTJ2bTE5ZFBCSytPQm8rRDB2ZlVvQTE3dElXOWthWjJTUXZS?=
 =?utf-8?B?OGlPKzVZMzFpNlZZeHVCYWxpYlRWdHFyQlp2S0N0amxpYzZ3cmxuaGhwbitX?=
 =?utf-8?B?d0dUR1ZVc2FQbEwyWDkxcjNBWXVaNDBMd2dURFAzNmlpRkxwU1NmNU90Y0Ry?=
 =?utf-8?B?eVpEbkM0OUVsZnV6QlBHM2tSdjlqY3hFZUJ6eVEwSDZDV0JTTm85bndvdE84?=
 =?utf-8?B?THZGTTFIblhxcG12ZThZblZCVWo4Q2ZORUVQUjFYYTZIK1VhUXdManV5RFp6?=
 =?utf-8?B?cDZrZ3E3KzdtNUg5OXIrcUVnQ1BPTDVCbXE5UDBjb0FneEZuOVg5TUxEbFJk?=
 =?utf-8?B?MzFnY3h2c3A2OEtRSyt6TG8rVGFsMDNJZm9wQmp6eW94amVGS3pCd1o4Wm84?=
 =?utf-8?B?a2FNWE9ZSXBoT3kzYzZkYk8zeEk3d3NxQmUwSGxsc3ZOTm04VWVTeWo3aWpS?=
 =?utf-8?B?UlJGQnQ4dlJVRmEvNFcxckZJTlI3M2VOa2ZVbFFScUR2TEQ5UGJUQllSR1Zj?=
 =?utf-8?B?QkhiZFFCN0lRVHpSMFhCMlFVZ1pWYkd2cytvcDY4eDM3TjdWdjJOdlcwdFVS?=
 =?utf-8?B?a2E3WVM4MkVzSjRrK0lsMStZSzE2M2hRV1BEMUZvMDUyMU1weThLemY0U0Rv?=
 =?utf-8?B?UkNheS93aHVkeXJ3K2c2S2J3bnVubjdqWWhxMksyYW5wTGFnaHNINm9VTHVG?=
 =?utf-8?B?eVh1bDZPR2dMTUNlQlJLYXVOQkFDYUNNbzMyb1BlYWFsWVZETVBLRWVUQ05i?=
 =?utf-8?B?R1RSQ3FOSFcwYytXSnBZZDRER3BJOFFNbENsbEkwT3Y4eHFTemRSTEpPNnpI?=
 =?utf-8?B?dTlOd0N0NHdzMXJtdDMyWjIvY2tTdEtsM0FHczRIelFPYkxSUVpFWnpiandk?=
 =?utf-8?B?SU40b3E2c25UVFJtN2V2enhzUEg0ODJvK1NjVURmRVVPY01tdkZYaEZQd0pV?=
 =?utf-8?Q?HXWKnviU+1D85L3unE9ROQ/T2Sw30TSlmSKJ5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665a2717-0df0-4426-9273-08df072bedf6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:48:56.8143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzN6uH0UkGtCkLu7D199WmKnCx2uVqNK8sCJevb3CdruO39OMTVtPs/OtvHvcm6+Enw49+Wsz3K1fVgIqNekytCPcBsqpgnXWTl8SPjPK0tdCKKwhdixR4XP5+DxlqEJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7705

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 4b925832bb66..5fe58a025cfd 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include <dt-bindings/input/input.h>
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0

