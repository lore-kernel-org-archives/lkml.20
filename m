Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7594457AF;
	Mon, 28 Sep 2026 06:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577835; cv=fail; b=FE6dAAb8fb6YB68tjnfv683HyNUp82coXoSe12szoo7fUpY/6I1dKd/z7qQNCufjluAZMA10rRhA/1nMiMu4m3o1uwYFLmFpsONliXOA33ldXKIuaxNgUWtrGNJBeBOvaze/ldbhKgbG+nuMCYvHVte82gn6b3/bylcWpjSLy6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577835; c=relaxed/simple;
	bh=tjMP/MVcvWpMAn1khK+jT4V/hoPbIXJBbaP7SBTGVFk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qneWRVJyDcoQKrFf2UKo70cBk4mJlafyfKVSok3rGO5dAych/3pUov1nayXlJ00ttlau++O7QJQmSUmmus9OjGT3RYJq32NbZd3IX8g7FliBm3+1dOcMt9zuzRmFDvrRNWhktpqE/JyI2x4DPfI4z0XbhCPq/5U69AjEn0ZAn48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/GmT3ILH/iLpfk/GOe/RJ2sLUs1qeRwI8tOXMHJnPy3UoWyEHp9tKsernfFN7HJn3F0RPv/s7awB6a8QnHUnGZf5pKCod/u3QjCEcFrPRekr202UGxRk/FnafELEDl2XLlLu1hrKwjHGERxGBxJurELQGZ8RZnwS6eanvGbxPEP/xslaz6DG54cYwxLzxbyyj3p5M7GJag/O83TNihIMRgoKqxitdZIBYsqKUP6S7sYA1jSFwxvdd7bW4+jLm20fDRRKwmnjLpo0KwH3FnYlmnP0SDIQ+rSReuA3pOosn8fw37rv9cQ5ebHguRk+ybrZufOrOyk8Os8eBTwxOEC8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fxdt2couFiSAnXO/ferrAGmdVjCrdteqGGMHHqbADKU=;
 b=U84q2eTy13ZHS72eHdxMZwL4JVn7slVVGFa7X3/24Cv1BbcterKSFnCvXOvDBdWjsqPpReZ/mEFk9scjYyJXjX//cEM0nBJs5DgzVVA6zEh31SrOD8mN6t3MmKZ3uOIFqY/4wcpWFdpjrV+p41zj0eHh0HSHa5e3xfxJxTzOVMGUWHOX7kT220Q2tyjKzAmFISg6s6GjM+ipbJ1TbfU845BHeo20kXEDRTOdj0KN+2dTgM7FuAMNmAtyt+fJ3pZZGC5PqZ8sy1hfpGXAMwqrRi5Nkz8ESvm29D+vA7F2R5dbfOpcyN5bNpLxg/SWvbv7aQjHHk2DG+Q0Pfq1IEb5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB0963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:43:47 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:46 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v3 0/5] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Mon, 28 Sep 2026 12:13:31 +0530
Message-ID: <20260928064336.272659-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: fbee2582-f2a7-48ac-6193-08df1d2bd869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|52116014|5023799004|56012099006|10067099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XoYFS7T/jlufggdZAUn7zUjd5oxRZNnGu7Vv4csdEPyZoINvWr56PLKeFvswfaR/iQLHcOMGIoTzx5uIvB7PcBG2MVjFCE5KRfc2fSxom25joO4nGm1GBKH8udT41nhmHU9gqrTdAhkFRY19N2SqCFGQVg5bVBO9nWWFja/V6dzalM02h/mx5FwJ8hL7VG3n7vQYtVteepxrYBT5D6Un3oDpMoEm9SlIPokqIYByQf89/89h9FpG6Ah3pptRW2za8p6e6Kb9v5bQ6w28GA5QCFs+OYBzLmBUbgZJI64tLGrki/39D1gdJ3vlRXRYJ2rxZwRYQalMepHem75YG6u5O4gtseC/6hBVqc6+tnhc3qvJ0bVSTW8HvxuT7BmTgpaKMT6ClvpXp9pQPtYVP5mSY7Q/tzxWIR87Y4rNYfSzzWMlPFNpAU9rV1k3UGtKSnVB8PYuepHFHX7AH94GsAY7VmE6WeKc8336mednSrkIERAhWjxGM8wqdcZfG9RZs2xHHeS2s6P1pG511GEOCUzsRrbUxYA3aDmmRFgwYXYZzo1h7SMvH1dZs8OCSZxvrHn6P5bRJhXvx+XENvunODAb8Jczw5LMBwapa8dXURfP1KLOj6NwaFMLnadeIu4Gnwcj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(52116014)(5023799004)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6K7Qmh8FV8hvwUiYOy7T/gIFS1uDtaSelGyMI7lXbNalFurqESWW3yT8XOjE?=
 =?us-ascii?Q?0yCNZdOqAzM/3kYBnR702Hm4zihpp/Dt97zDxjprUIHOE0Ev7df2B0D8YyKh?=
 =?us-ascii?Q?8/r/wiwln1ZyA+hhu6qqeRTP0Jg0JnyU6WtBhcO5XVm5UgOC2OxkjbfcmnqG?=
 =?us-ascii?Q?pYeblGM1Oi/4J7lVejUDVPXab2NDMWBScC+8DZHDu+951Caricq6A0jdwbNv?=
 =?us-ascii?Q?cojYEEPvrT3GtLYoivnbJzx1BZ1RvhP3l4EeenRgWg3iZRz1i0dN6hItDkxS?=
 =?us-ascii?Q?7syuu7j8N9LUPPBPsFaxF/HMgokUmQIWpNbp1+u01y3DxZdGoDtU1RFAaa8H?=
 =?us-ascii?Q?Say14oqDtKtHJcOu1tC6tKPim245HKqq7gM9ELKQbk1xIqYoLUDTD18ly67M?=
 =?us-ascii?Q?vAlqhYwIzt29swSGKGoK9QK1QIJplBxoD0QnQW+GGdQb5sOyGYArddiPXOGe?=
 =?us-ascii?Q?UDhM0q93mV1LiBb/n+uoiUv9KlyW1+9SNmNIe7O0IdAcn0ugC1iEzG411T3m?=
 =?us-ascii?Q?3wbRqYdWG8TqIG0jdvyZoXO07pKLpPrOk756RBKe9JFuOpV0focOubHntxuI?=
 =?us-ascii?Q?lYNRLhaZwnIqArGrhy/AYs3+uRHczkMm+L9dr6yzFY+eETPJObKotHDQ6FPW?=
 =?us-ascii?Q?ehvLIMcSdACx/aK2e4iShRJl0B4f98w3ImSZzjbGFxgoqLvsVe/5uLfrND5K?=
 =?us-ascii?Q?ZbkrwZOBtPPnh8rCKJJwtCIMB+UcJl6GkmlZ8oGw9idRFJ/Bi4y5a3Kk4NTJ?=
 =?us-ascii?Q?R+BL4MbCuFUtc3AVzctvdH2Ec1QSW7Mu0fH3qLKOHPRt1AJ6gm61LSk5WHed?=
 =?us-ascii?Q?QSsk/kBtnswZ/IZgnZDwl+vAkd4WMGj2zhC/m24IiDVazxYjQc6kuQG5srgr?=
 =?us-ascii?Q?+wPZBDhhVog4c1s3xbZ10R0uhSox2EqxiYZWAWPRWRuhf1hepVB5FMWd3kzv?=
 =?us-ascii?Q?scSQZFvGw/LPFGZIEiMTyZeCeuoCpXqHqCOeyj3Y8Mj1uwK0XOfhs8riNJA8?=
 =?us-ascii?Q?53lFwkjjTTD1q7Wo6zDSeGkCrTW0LcQzeHjbBiOjhqvUyk3Vex/4QHoeN3we?=
 =?us-ascii?Q?0I/pWTNtY//jdSjYwMtiFDK5vU72SurES6vV4OUcOvnB6A70yI2REx+La3+G?=
 =?us-ascii?Q?Vv/BmhYEA8tHMpwjW0T/s1ggPTFVjpQNhGpPyna4QrmRKWjoMDHJOEY5EhEl?=
 =?us-ascii?Q?rKwmWyLvLESaifsDD/zh84eSXmgdDvk6hSvP7yxLYJlmrAbzn6vDzmP180Ca?=
 =?us-ascii?Q?xwJWS6Sbo1VNLIfkBsQQp2G92KBMrokekoQtJJ9VIKQlxNysz61uWaoBmTRn?=
 =?us-ascii?Q?R0bFpWgc0fQNBQBJrtju0oWCZLN09XXLPjtw4b5UbKf1stxcuqKjxfxzo1RP?=
 =?us-ascii?Q?LBMRNjWUphF4R488qNoSAOTCy6d+WZPLtMJm0uZ4QL+wQ939zMBQqaHHZUNN?=
 =?us-ascii?Q?WpDy7SASJregPflV4XxfOXmWGtBh9a7Li0DbHWLRxwUwXHTV3ppmW3CsJkuO?=
 =?us-ascii?Q?/L5AmfiqwMcxEP99haozmAk1v59m1Hbq5bsYvmnCYWdsDMDCS9RTqfnr19fa?=
 =?us-ascii?Q?5BLG6dqxj1FuwFZkloUUG2Vx4tpiFGwuhjqpPYz7yHucqPIRgLLsR9wsAgFv?=
 =?us-ascii?Q?g80/g9bb7fHwXhvyKJO7XyPQklXiIYBZGQzR60CiPjOvbZLeJ6gAH7HIUdLt?=
 =?us-ascii?Q?T4Sd2E5vDcF8W5wpqwX/W7dnJJhdqjCiUC3nUiEseymarZKFJnXloUJUXfnu?=
 =?us-ascii?Q?pDqFrmQASfNjx3fWzSawL3eRsm08+2utuW1Xwbip7crhJbeRJCgEJC26gBIr?=
X-MS-Exchange-AntiSpam-MessageData-1: zm120wSesNhK5w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbee2582-f2a7-48ac-6193-08df1d2bd869
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:46.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUsuX9tEBGxUHudEbfh5sNhFmDKmaKOVqKsG0J2uWmOMJKEBivpoppjjCxFxVOUdafp9qY04NM2a77L7UcxQ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0963

This series contains the CAMSS changes needed to run two GMSL cameras
on the RB3 Gen2 (QCS6490 / SC7280) vision mezzanine, where a MAX9296A
deserializer sits between the sensors and the SoC. The deserializer and
serializer drivers (the out-of-tree maxim-serdes work for MAX9296A and
MAX96717) and the AR0234/IMX900 sensor drivers are out of tree and not
part of this submission; only the SoC side is here.

Patches 1-3 are fixes for two RDI lines streaming on the same VFE, hit
by any configuration in which the CSID demultiplexes several virtual
channels, not only by a bridge: the VFE 17x interrupt handler drops
write master buffer done events, VFE 17x hands the second line the
wrong write master, and stopping one line resets the VFE underneath
the other.

Patch 4 addresses the assumption that the sensor is the CSI-2
transmitter: the rate the receiver has to be programmed for belongs to
whatever drives the bus, and v4l2_get_link_freq() already knows how to
ask it. Patch 5 lets one transmitter with several CSI-2 outputs link
each output to its own CSIPHY.

v2 was sent in reply to the v1 thread, which made it unclear whether it
was a series or a comment on v1 [1]. This v3 is the same series posted
as its own thread; there are no code changes since v2.

The v1 patches 6-8 (shared CSIPHY/CSID refcount and the streams API
handling in camss-video) remain dropped. Gjorgji's "add V4L2 subdev
streams API support" series [2] covers that ground properly: tested on
RB3 Gen2 with streams enabled for SC7280, both cameras stream and start
and stop independently without them.

A CCI fix found during the same bring-up, enabling SCL clock stretching,
has been sent separately to linux-i2c [3]. It is independent of this
series.

Tested on RB3 Gen2 with AR0234 and IMX900 cameras on MAX96717
serializers, on the vendor 6.18 tree and on the qualcomm-linux qcom-next
branch (v7.2 based): both cameras streaming concurrently on the two
CSI-2 ports, and each camera started and stopped repeatedly while the
other keeps streaming, without interference. The CSID test pattern
generator was exercised after patch 4 as well.

Re-checked against next-20260925: the series applies cleanly, every
patch builds on its own with W=1 for arm64 (defconfig plus
CONFIG_VIDEO_QCOM_CAMSS=m) and checkpatch --strict is clean.

Changes in v3:
- Resend as a standalone series rather than a reply to the v1 thread
  (Bryan); no code changes
- Rebased on next-20260925

Changes in v2:
- Fixes first, with Fixes: tags and "Fix" titles, commit logs rewritten
  (Bryan)
- 1/5: no PIX special case, plain removal of the IRQ_STATUS_0 gate
  (Bryan)
- 2/5: use vfe_get_output_v2() on 17x like the other gen2 VFEs instead
  of a 17x-only mapping; no PIX special case (Bryan)
- 3/5: commit log rewritten without part names and with the affected
  line spelled out (Bryan)
- 4/5: camss taken from the entity's media device instead of an extra
  argument, so the callers are unchanged; multi-line clause split
  (Bryan)
- 5/5: Reviewed-by added (Bryan)
- v1 6-8 dropped in favour of [2] (Loic, Bryan)

[1] https://lore.kernel.org/linux-media/20260915121557.20910-1-hitesh@ebytelogic.com/
[2] https://lore.kernel.org/all/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/
[3] https://lore.kernel.org/linux-i2c/20260921131954.1690578-1-hitesh@ebytelogic.com/

Hitesh Patel (5):
  media: qcom: camss: vfe-17x: Fix write master buffer done being
    dropped
  media: qcom: camss: vfe-17x: Fix write master selection for RDI lines
  media: qcom: camss: vfe: Fix VFE reset while another line is streaming
  media: qcom: camss: Take the link frequency from the CSI-2 transmitter
  media: qcom: camss: Create the source to CSIPHY link per endpoint

 .../media/platform/qcom/camss/camss-vfe-17x.c |  46 +------
 drivers/media/platform/qcom/camss/camss-vfe.c |   8 ++
 drivers/media/platform/qcom/camss/camss.c     | 121 ++++++++++++------
 3 files changed, 93 insertions(+), 82 deletions(-)


base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
-- 
2.43.0

