Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792739554;
	b=rJVraRskGf3TRXGyVWDocjrK1PiKwz8N94q3cIh/BNdEgXlMk09bwmy3Fbv/VhYUFmxh
	 ue0nvUygaCq4pCT8knze8Gsx3uKeaN6PGtlilu5CICUgPh08sb7xRU28Yk1bYdSiou6It
	 IoPGi+dit4mQSU4i1chhY90GU0ZHKGdVGjOI7Nsuf49OpVS1bullWj3ncAwgZHJBuXT/8
	 dq4t9MmaLlLap54/oO4fcIuF8VMGbFVr4dkZ/4YQgGIuLzUoZM5fGoHYvO1CgUMm0zOfz
	 nfbCC0tuL/aUm6xIssMI2et3fBKdzUe6yaKIAPGf7DxIekMUvyf5SbPqHzALDpDR4ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739554;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:Date:
	 Message-Id:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AHKAAMCTPdxsAaY63JYPi4gB3AvcKkYlbxHrIu8+k4k=;
	b=3Sx2n/NprLE9TkEBEY08RzkTwH/O8hfvOThN94CUHu3AOEgkXpPu8v8LNbB8AHH5NY+Z
	 YY99NaOEqtvTR6vjeNEqPMrH9y6sAzLRHyf3oRSqr1/+TWjqiM73huIZa4MnccoaZs5mV
	 BdBdNRTssryObylwKlS49NNsWnMKPADwGOPy3P0rJjGcsI/NW2vtXpu8DKequ+MyVxCld
	 kTDUipd+YdFB1HstfkGsp/HIpEMiCR06977zxOo6R4h/2Z0KDDPtNcqDZrk8YhnT0Uq7f
	 KtxVxnhjcCewlBrkMtRYsnZCH/MuhQGqGgUZQ1QGK3J/uHWmC9mAvO/euyvomdvaBWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hgrkmy0a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.11
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3F606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43F3F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Hgrkmy0a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2DCB4PRF2Fa1lMzrAIVmbkGQiu/WVJIoqJgTNSxynRcBDMcGeraShZ+tXmAaNrlkHYcNelQP0uJctakz6IRauxp6u6Zf3KHjs8zLpY41/YORc7O+LrU7qMmkHe3lDufZOasI3rnx0RY0tMUyxniYZNLSee9iBO8O/SjVZjlGTQ7u5ffxPyMMsUIZnzzixSif8rff1WJbxZpmYfyEs8G1T13vsIh5Nl0jMudCcfAOaUOrBBPTGwKils0mWAjq/5tVv6g2VrV4d6nTh1TWem7rJbWPQKygU5PfOSCLGVQZpOYeq2+ZrVwxct78VmCBlilnT0eYKM1G8Lz/d/1t5pjKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHKAAMCTPdxsAaY63JYPi4gB3AvcKkYlbxHrIu8+k4k=;
 b=ZV0bsT3AnxYeLPjy1lMkTofVtCqPKtxaJiqzFmHeHFH9VAvcQYyHNAjl60lAMH3UGGOGhqxFquXjNA+ow62RKx+OT4Nn9rBYXUEHdxAHf2RJzannDtUvrB/On6xXb8xbMqe0NEQzWL4KJ32HKqwwMu18ZS4voVisOcblpItSXNj9axKrelaRQG/9ihNdEMpK5+QnS9I899n1ISVeY8ba424tqdpDoeDmqUNGUyvg0kdQJ+NOEg0N60EX4DW23sSnCD+ytN/QgBZ8bOg5/ohI0v/L+sMW4brLappmOq1RN0U1iR6gVA16b1jO4XvlN69t5tU+C3qp4ZSuoBMSSP30XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHKAAMCTPdxsAaY63JYPi4gB3AvcKkYlbxHrIu8+k4k=;
 b=Hgrkmy0abypyhpnLiQg9GH9/AHk4L8IVl1mJ7TX+pPmhcmwFKr5TUAfaqAyqK1TTh6Psx6cmQAVfc8xM3I4KdMqbFn9C5J9YsqX/Ywmagjt1BqTqF/WdzVMa2yg7pHlXUkaiSRtiTFKtZRvzkpt8T//WhHPhdgPyfeDL0DK5CAms+dux+Ih2M41OTt5zO411DV/oV7qxMTqoOmXcS63aZGaYd+hu3Ehnq5/zoHI2dS3gFLpBJC8b2ZdBrKdHtoTs1UiXwRzoBZZjWxP7C47vM5QwTBurbJY51rqoXFe0u974QZcfTl7K8kxW80UsVRMfH4bpkTLGfJOO40t5EPfi1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 07:12:31 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 07:12:31 +0000
From: shengjiu.wang@oss.nxp.com
To: p.zabel@pengutronix.de,
	krzk@kernel.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	broonie@kernel.org,
	alvin.sipraga@analog.com
Subject: [PATCH v4 0/2] reset: Serialize shared resets whose ops may sleep
Date: Fri, 23 Oct 2026 15:16:07 +0800
Message-Id: <20261023071609.3795354-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::10) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 099fb4ca-d7fb-43e2-2f26-08df30d5010f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|18002099003|10067099003|11063799006|261009223027099003|261021123027099003|261022105027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	cG6EB5QastBaAxC3FFX7eQv7fh3E4mURluQQownFC80oHcxgPVpP60ZpDB9bc4dBFs79y/eK+pbDmEq9JCES5lM6cMkKYJ6nUh+9X4DZ9zR00O0bHCJqwgysRfYAaxWzt5AQnT7BaCHNgMyeXWST/F5p8zxpMa1OIk561POFk3PfeF7tX69CAoMIuJGoYNPFRb7zINN+ZGHGp0qHCPZuxA+PAABfP28zojWiHlS4TGAV6Tpi9zXkfcdEurfVHKTTp79ZvNoVc9iVdlBieSsa/k4cbCGLgRB0OmCIvkyMN/fx0+YA+gLPxyQSXITUefZ2aei0Om5c7Ch+0bjmOLEz1h3/gPM7FMXwfwVqZJss5xZSnpgfHL5G3GkuF4Twdi3D3CB1yRuIeBDhCFsU57UPBcX+DWYfJ/XfrISGCi8LffmGCoMlogui1+mqaMH8/ke7AjQBFCRkFrtCaHvZE7TFNIkOLDwfNWQnVpkN2sPGDIMd30X6hk0M/Vg+ppy20iG0l2EUDKethcmsQTfC+n0bqoAF8YfUT0Ov+Wq9sRCv2srGHAheVzKFw1+I1t70NOQA6bzu6hsHtVxCWVruUYeuvkNuTowb/OVvGRxs9fwpZwKNTD/pWbqp3AzP0NV1pinr/DPmnPvc/IGXLBcRkYAvym8xDfmzLMlT6TmBgv5zxPs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(18002099003)(10067099003)(11063799006)(261009223027099003)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S7LRmOxiXFDNK/Pey4xQbCw49vgRRS/5EHfaCpy0CZwu71eIty/kAKh+8h/h?=
 =?us-ascii?Q?SLZn7FJvwSlZkIg9Xx8dPf+IIfHQPNOQOQlbby3neL9lPhF0UQwHUtQf1LhC?=
 =?us-ascii?Q?/yoMLZf5KyGGJI2i4DAUdD1WLpb6wCOVT/gXF6hByr3OSugUuQMVOZLTh7us?=
 =?us-ascii?Q?pJWxNvNjPHU8/q8Nb7aq22tMm1i79Xe6o4b6047jTjc6uKzGF28ClNZ69CYp?=
 =?us-ascii?Q?AnNxYoIecKC0WBxKfu3jOOOoR9QFfU/mMYTBKXpHhBwOEkOLB+MsCBK7vgQI?=
 =?us-ascii?Q?HkcvKgyua+Qu/eeZhAenJwuPnPIm2n5kY6e+PoONjq2He/+431zOC2lpty2K?=
 =?us-ascii?Q?W80Rt8GXKoY0NGoKrYDBHFBAWVEJM0KPctIO1jscmMtYYkUeoTRrWvpvprsb?=
 =?us-ascii?Q?8XM4g9WQ9ychsK8mL0mff52GpIiO3bL7t/sCZHJ7JJYo61AVD5i2O9XUrShe?=
 =?us-ascii?Q?l28Y/eGCTw1jiji4UvVe43CgAP0Xrk5syY1KEpfJnsCKGVWJW9RkPx9iV5/e?=
 =?us-ascii?Q?1g1vLJ0PEto7lq/TX6TUUXQBrHNPVwxtgFrrJQzxcDkkwgQLeEt4SAiV0h/g?=
 =?us-ascii?Q?q63aCZiGTnT3vdqXxS/wQZx3hk1SSkzQJY0UnXINOXomuJCqJn8kDIF5IH45?=
 =?us-ascii?Q?wfyFnb3pj408GIqmTWVj4p3yPXpJSYXAgqf9L2h5/TaQWAPnJeXN+DZQLVtC?=
 =?us-ascii?Q?WM09waJohL1EzjOzWI//B6x+Adp6yFOZlK4i0V/3JHR6XApBvmySC5aKAQ9M?=
 =?us-ascii?Q?nobB+BmP1tSKPwsXRJ8eoSgbkJe6eEHgoxpG3A3ijGDEy5rjRnwQ7gV7fPUo?=
 =?us-ascii?Q?zKeRlN81GeuLN531SEhmNCnJy0SuR5nth1fJK2e94Jck5Pbv2z9939Utw4V3?=
 =?us-ascii?Q?Qn/tLi0MgTwRHMDf/PwoymqyDw3DraAmqF67SOq7wQsePYvRzhBQi/LuQnS9?=
 =?us-ascii?Q?2kHGld/ALI6SUU1iQUert21mLXuRUe1fHL29aiy1mRcql8p4Ce3hxn2FG3ef?=
 =?us-ascii?Q?sISAiczkL53twkqEktkqQtI/b9L3ZIgszecN1deg3/T7r86gIYcMGQh4SoXC?=
 =?us-ascii?Q?J20nytKZ4zCkD9dZTK0gO2LIOA4za7I2Cv3Zvm6y1ckbWDd09OKh/Zix6LL7?=
 =?us-ascii?Q?iGaSXEhPVTCyTZgMqi1ghATwKKOEWNgvCZgvQj4YOvKEfe3pM3CSYUSC9saa?=
 =?us-ascii?Q?jugtIepUxEBBWaXRGJLnjn480ygOiM7+oyVyZmVlJBe2P3AqnvaBxreDAST0?=
 =?us-ascii?Q?yD+0XeIZsc+bz/qCSb9dnga+yh3ba8Eqsjwrt2E9Ssv+IEcv6+FYbccLLQrT?=
 =?us-ascii?Q?peOj0e7plXRHBcMJnBLNZXLzcjILVEt466EQyd7ADkgH9UYWDWWLXaXP5ESR?=
 =?us-ascii?Q?71KzWlKupeeam9L0g+FGy9rkhHYs4c966xLx5QZ86t3hotc3H9k43dWR5Q1S?=
 =?us-ascii?Q?m5OhLn4prjUteLv1uFLCgCI7B9m3JGM4xDfr2Zk9fk2UEZONwO+PRhxZHC7a?=
 =?us-ascii?Q?EIX0JP3ZsJlch+MkvMscLVhfNrbm45si/ZKVGS5brfb2DgckBxuJ0PrTovb3?=
 =?us-ascii?Q?VhhL++/hTy5zWLIHEv0ODOtktRcex8lc19MhsbyAHCgLVFMJ6WhbRNPsEMPJ?=
 =?us-ascii?Q?ERi08iL5AWmOd04LtT8a49+SDXANo1kJQOGxivmdgVbJv31mLaoDI3Dhmsdc?=
 =?us-ascii?Q?WmZsgOdiVTUmnpVF4DSUD20Wu+KZjcvYArFZqwRPtYtJAZqX4goO/8Mdf5t9?=
 =?us-ascii?Q?x2U4T0H+OIlSGZ83tTAB78ZJJvREokozeswkDo2ffCaE6SeGJ+UF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 099fb4ca-d7fb-43e2-2f26-08df30d5010f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:12:31.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tzWrbuQeQHGIwbvvESjj7LasxIWGkQezHa87qiGqyKEZ5f8fYjrcYGIcG4ll3ve93VIdGT2xYOALahFBmo8yds7LLT3mJrehSjHn5EuZLX0R+O8B1wFUnCAvFmJ5GX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412

From: Shengjiu Wang <shengjiu.wang@nxp.com>

For a shared reset only the first caller runs the hardware op; the others
bump the refcount and return. When the op can sleep, a concurrent caller can
return before the first caller's op has finished and then touch hardware
still in reset.

Serialize the shared refcount update and the hardware op under a new
per-control mutex, but only for providers that opt in via a new
reset_controller_dev::can_sleep flag. Providers that leave it clear keep the
lockless path, so atomic callers are unaffected. reset-gpio is the first
provider to set the flag.

Changes in v4:
- Move the can_sleep/mutex description to the top of the core commit message.
- Also serialize reset_control_assert() under shared_lock.
- Split the reset-gpio can_sleep assignment into its own patch (2/2).
- Fix a kerneldoc typo; drop the Assisted-by trailer.
- Drop the Fixes: tag, present as a correctness improvement.

Changes in v3:
- Drop the reset_control_reset_atomic()/reset_control_deassert_atomic()
  variants and their reset.h declarations/stubs; gate the mutex on
  rcdev->can_sleep instead, so non-sleeping controllers keep the lockless
  path and need no new API.
- Use a dedicated rstc->shared_lock taken inside the SRCU read-side section
  instead of reusing rstc->lock before SRCU.
- Set can_sleep in reset-gpio; no other provider is converted.
- Drop the lockdep_assert_not_held() additions and the reset.rst / kerneldoc
  text about sleeping-vs-atomic variants.
  
Changes in v2:
- Serialize only the shared may-sleep path under rstc->lock (taken before
  SRCU to match reset_control_acquire()'s order); exclusive path stays
  lockless, and reset_control_assert() is left unchanged.
- Add lockless reset_control_reset_atomic()/reset_control_deassert_atomic()
  for atomic callers; gate the mutex on can_sleep so no shared consumer is
  regressed and so it works on all configs.
- Factor the body into __reset_control_*()/__reset_control_*_locked()
  helpers, and lockdep_assert_not_held() at each lock site to catch a
  controller op re-entering the API on the same control.
- Declare the new variants and stubs in reset.h, and document the sleeping
  vs atomic variants in the kerneldoc and reset.rst.

Shengjiu Wang (2):
  reset: core: Serialize concurrent deassert/reset of shared resets
  reset: gpio: Set can_sleep for the shared reset serialization

 drivers/reset/core.c             | 205 ++++++++++++++++++++-----------
 drivers/reset/reset-gpio.c       |   1 +
 include/linux/reset-controller.h |   4 +
 3 files changed, 139 insertions(+), 71 deletions(-)

-- 
2.34.1

