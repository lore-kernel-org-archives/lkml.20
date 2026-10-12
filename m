Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C229C47A0A9;
	Mon, 12 Oct 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806759; cv=fail; b=tHq7kZQLENdCkHhdn9V559jNZSEcaPadpYMcNg8xfYEkO8Sg06nLAVXAwCQgAQkwdO0lEU+lmNUdcHBgWS1v6PbaCZ5qOVYrIhV2QTRQ/shWqtsJPQC19D1PA8Yph3DZz2YmY3HQan44X2mq6M+VX7UfS8/K2dtSedMwycz/Q9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806759; c=relaxed/simple;
	bh=UeqqAJv59Fcej3eRAAyfur7lCV83DWrucP+MHfjncVk=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nLt/RRMc/UHKofbnnhKvkgsJXcNZ1dcX1tdXWWSjWIRbwitY2TdWHNYl6zfRH03D4ODFqEiUsg74OAuNOtkWVg1IH3ONJYQs7gVIuv/S51uZ/OMz1rqnGBGCI6EIF/RxJIuqmJgL7Es0Jtat4qnOp9+cD9H/2j+BovumjVLZI8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML7itPaWQv0gdB5vJXX9kJj7DqhK8XrUN7ZkYYbLxlWzrhWvaCdZOkVJNvn8u9e44EJsLwYjlQcIH1ZgXc85YzLRWDWYhKCf7NlQ6E7RhMU3gYJWIR79KFn2S1pdnbYAyhTBrThBgM53Eg9gX/3GxF12uVcTZ5DCcKS7MUmebcIlto3B4vFiAgwHW6pvopexDD1eyn0BP8mDnSbi28I1au8l4uZnmKeWlSinqNFhvWK/t18PNMBmu8E1PLGfgT/HF/SfH4UFpLYiqnPmMV5zPlpx5dMEn+fdA34+Qr/ERY+GdnNBvKK6shvHschk/8Zhq79688emlvBkQKwxS2sVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZiF8j63WXaWPpmBQqi80Azx4Par2f2t7Xs+tLCuH90=;
 b=XnXjzsDSxqYE1HjKfnSxgh1Kp8Mn7HL4mwUePrTvU3SD91jJgyfzcIzInYPRUEvmjRtHiMb4NtqWXfdLeodM+NwKT9ZSRVAkxSjXY8w3T0kqqc5sfCRZ39RH1DvtbKYneqT4NwLe9ZXuDF4Y8SJZLSU/aO5R5oeN2hYvRg2xvmGHadeN58bUwMLoonqdL/JbOSs0mxAas0ryGBzWf6Bo5ph9gsqnTB7DDZQLkslikxtaBD8pVlvekEPlZwA/mQwCiD+8CsNZyJ7qB6V7qFyxpPxXPTyqOODYXKK5lbPqyrYocYhhXQNh+yOo1PMxx9hljVqqYlbLJSFtWWFyTQa7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::104)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:05:51 +0000
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e]) by PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 12:05:51 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	atanas.filipov@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Mon, 12 Oct 2026 17:35:38 +0530
Message-ID: <20261012120542.1140157-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::26) To PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::104)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPF076CDA63A:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b848670-4ec7-42b2-ea75-08df28592860
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|10070799003|56012099006|18002099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ImXTPxxkyRao+G768bOpl+ybqA0I6pTl+SepLE6+Z65hiMYYeSU1BkAdiiz3D7mV2mkHSamrZS0LV9HWeYvjsnXyi77GLrKUFDl7//7JrKCa20nPiqa53PlEIM/5TGjy/jBhJuMFEvVkffoF4z1eF4p+g+IKmJjPKOoi0sI/9VpJA5brmnITbptHiQIlBB8NO2mjF7wDON6GlhT3ZQfv9X57Jdqr6Bb0wzHs/1q1trDureUd8EGs9pQyRueiGYgyYnNuH65R/3ADhRBb3PyzcYs0ZFNBbqCg8OSfEG9F/Fq85W8nIlVFwa7fCXGPwgplucDcc40Wpstd35v3ytLt0p01+QvOXrDyzJ6iuhyF+8/G0Y0UcdaCytRRXWWjlMzY3gbF+yY/vNy5raZZpmwL4ZBoyI+aEes2xybNIQQuu0aA5CM5my1CdAWqUumHcvvlm4w9twd+eLDyJ/S/kCP85lCZHmGjyt4UwozxNasX+u8p632UzEyPwXOEv1w6ZiANHuVESQ/cEkC/THB+8UQw37E97cEXIww/v+89qbR97bd3TfLndgBoHoddgBOsCpAvXGoeUs8ekAlLMFopnaUH3RbXMkcu42oOpDdWD4cgvuoVD5KjZJxNej3+wQIZmlMrolb8vAmi0bRtVuotW1q4uFIUXgA7kjJM+Sd1IY4t7BI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(10070799003)(56012099006)(18002099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9sfzEQHmdcyMLs2jc383AgbLkRRNX44rQL0OYX08G5OnCwyu+F9iXjsK+uBa?=
 =?us-ascii?Q?RU1Bw/hSrXRs3NsNmJXxl6Xr2fDE77upi7DIhwYfyd1/kQ6czrEUd/BGEPll?=
 =?us-ascii?Q?Vhnkv+4kBZaFVS07iQe1pVQxYF7E9Hdde4cAszydUYZ/ljFxZgplFPwhKBb3?=
 =?us-ascii?Q?bBjfGckWHbIXBwQCIwOBOhyRUgd8lN7uJsKhtCdeg1a582iBBUpl0VAwwWyD?=
 =?us-ascii?Q?hkZ4Op05NB+xdJlPE36kpG8gD0nvub9+aUtiA/KvNKih1fDIu2ndQUkjJC77?=
 =?us-ascii?Q?rX91eTyU3avVhgGsWStVDXcUA9bobI7rQYF6iIhQLHHU9xp4nPg+u7+k7k3Q?=
 =?us-ascii?Q?NjCB8VR8AmFQmXVtA2Nu/aD9ZULKdwbtHdo8lL3SSrAAuDX6k8mQn7noYPsh?=
 =?us-ascii?Q?hQBhQ3VaqH2VYyuaF3HkPIoUDRJfkevRLEO6iEA+p+/LX3WZVU+2apzYCx5T?=
 =?us-ascii?Q?JnN8VTf94VsQEfnUKWP8dgUsSviNeW9zv003ra0I0HzFuzF9euk+DAcx5JL6?=
 =?us-ascii?Q?V8tW8OOrIvw5Vey7nJwBI36oz8bHvFjzS/BrD40XWcoNVec2lNe+K08q79jQ?=
 =?us-ascii?Q?7LRgnqjCnPFYfH5clHXRkbeXx0SbgneqEI+QpiUXKonkEb+ZLFGkBak3HWmL?=
 =?us-ascii?Q?kIK9dd+3wAynm9GICQj7oteSl6l3Wxus/593rqiAyRhZjq7m7MdXOBnWSP/e?=
 =?us-ascii?Q?nUpzi5EADD8ALF4DWAX5t1hfngIuNDtfi7DQ++DXQF3KdovpD/5CeYPa4QNG?=
 =?us-ascii?Q?apT1pqX5jXDAwh7FA+7YtGSjTldaLaFCa55HrOz7+DxaBib6A88zib9+q93x?=
 =?us-ascii?Q?Ts7Z9F4J6g7ZN9O3phfwi+n/LZMUmeFzPGxYhpjF57y3NJSDPp1pLQSDhs/C?=
 =?us-ascii?Q?G7SkgoqjBxoJOQ+i7CeqpF5ohPCFrPf+bCul/cEzk1DAiYm5h5/UQfvBLN0n?=
 =?us-ascii?Q?l9B9qYFPvLJHkpFxiJgfpIFXR4VMXY00hNitw5ewF3CQq6KTuRcuzSjhKASv?=
 =?us-ascii?Q?czAhJQAwg1eTbU9nb/A0+agjh/Jf7rkxC25p2K/dvIEWX7O260rATdOEiY+W?=
 =?us-ascii?Q?jfRS5GFW2dspIjyHVbAAKw1If3DTIFyur9ncAyF84ih/yUs3x85qHkGjAoiv?=
 =?us-ascii?Q?piPK41s4S3zXIHZcl+h0dDCdxLx119qF+eN2V+dCxieXluwux0o2uTk3ctP5?=
 =?us-ascii?Q?ZaT2xcTGi6eGJBlE6egvM5flCkekPahSbXSnXjruyU8v66VWq+G7K9kiDCbb?=
 =?us-ascii?Q?mP4nAI0MBWMciVKNqoOXUa1IVHyKFe2oEBudBXb+3wePo5NlHQ5UnMFi75zA?=
 =?us-ascii?Q?BfEV1YWRYs+t6b8O5dPCjDZU4GwLJqb8ignhOsqPfd3K0LrNtvdFZl0BV0zK?=
 =?us-ascii?Q?5Tvsb4cnJy6IzOdB40314HaIfE7icK2dd1mRGVJ5oyV6JnT6DsRA3CGkx1H2?=
 =?us-ascii?Q?jK+XTfzeCsajG6PaLzgDs33NdBeIc2LBD1wqZazYOuX+dgjfX4toF629g/IB?=
 =?us-ascii?Q?N0QFC5jN5FKHw3SdiZnRpIOi8t3qjXt79+Sn4Mtgltgy9tqUNLjx/e0NunQJ?=
 =?us-ascii?Q?5nRO3J+wI3eQM4OPZeGOC2U9fKpxowpI2LCsP0FqOAl/V1j7AlEUkYh2xm8s?=
 =?us-ascii?Q?ndDu2NQC1oDXihTtQ7IvutZg4WB2N4C6r1ZcGzzRlZC5uZ6xOUxzUhUYOOKU?=
 =?us-ascii?Q?VIDr3x5IMk27EyJs53onKoqsS4xBAdxerpt8IlCgvMtRCvfbjICMHrmXqx2g?=
 =?us-ascii?Q?9FzD47DW5+SVbRN+vgQCONpT4Ek+FPPIyEHR6kXjkuWoyLI49QT8ZS951EDt?=
X-MS-Exchange-AntiSpam-MessageData-1: fDNwMBDkEip2zg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b848670-4ec7-42b2-ea75-08df28592860
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:05:50.9366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZUvh0jmDT6LN7dn8t4vqvrFw3TYKwtPEkndrKKbRHGdAczJT2Gpubk/jEDK8zx/95DC/fS3eXZgJIhjxFhzkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987

Gjorgji asked me to post what I have so he can fold it into v2 of

  [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
  https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com

so here it is. These four patches apply on top of that series; they do
not build without it.

1/4 and 2/4 are what that series needs to build and apply on current
linux-next. Only its patch 1/8 needs hand work; 2/8 to 8/8 apply
unchanged.

1/4  set_fmt has gained a const struct v4l2_subdev_client_info *
     parameter, so csid_streams_set_format() no longer matches the op it
     is assigned to.

2/4  Bryan asked for the flag at the SoC rather than on each CSIPHY and
     CSID. struct camss_resources is already the per-SoC descriptor, so
     declaring streams_enable there and reading camss->res->streams_enable
     takes SM8250 from fourteen assignments to one.

3/4  SC7280 enablement, now a single line thanks to 2/4.

4/4  Without this, camss does not probe at all once the series is
     applied:

       WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
       qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
       qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

     Gjorgji, you thought this one could go away in v2. It cannot, and it
     is worse than I first described: the pad count in your 4/8 is

       num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

     which depends on lite-ness, not on streams_enable, so any platform
     that links all CSIDs to all VFEs fails to probe whether or not the
     streams API is enabled for it.

The CSIPHY rebase for your 1/8 is not included here, since it is your
patch to amend; the resolution is in my reply on that thread. The short
version is that SC7280 has no camss child node named "phy", so
camss_detect_legacy_phy() puts it in legacy mode and the lane
enable/disable has to dispatch on camss->legacy_phy rather than assume
the generic PHY path.

Tested on RB3 Gen2 (QCS6490 / SC7280) against next-20261009:

  qcom-camss acb3000.isp: streams_enable=1 legacy_phy=1 version=4
  msm_csiphy0-4: flags=0x14  (FL_STREAMS | FL_HAS_DEVNODE)
  msm_csid0-4:   flags=0x1c  (FL_STREAMS | FL_HAS_EVENTS | FL_HAS_DEVNODE)
  msm_csid0-2: 4 pads, msm_csid3-4 (lite): 5 pads

  imx577 -> csiphy3 -> csid0 -> vfe0_rdi0, SRGGB10_1X10/4056x3040
  msm_csiphy3 routes: 0/0 -> 1/0 [ACTIVE]
  msm_csid0   routes: 0/0 -> 1/0 [ACTIVE]

  10 frames captured off /dev/video0, 4056x3040 pRAA, 5072 bytes per
  line, with real sensor content.

A correction to the scope I gave on the 0/8 thread: I said I would
follow up with the two-camera MAX9296A case on linux-next. I withdraw
that. The upstream qcs6490-rb3gen2 files describe only the on-board
IMX577, and our GMSL mezzanine DT is not upstream and is not something
we plan to push, so that case cannot be exercised on a plain
next-20261009. The concurrent two-pipeline result I reported in
September stands on the qualcomm-linux qcom-next branch, which sets
v4l2_subdev_enable_streams_api = true by default so it did go through
the streams API. If SER/DES behaviour matters for a future revision I
can retest there, but I cannot offer it against linux-next.

Note for anyone else testing this series: the streams uAPI is gated at
compile time by

  static bool v4l2_subdev_enable_streams_api;

in drivers/media/v4l2-core/v4l2-subdev.c. Until that is true,
VIDIOC_SUBDEV_QUERYCAP strips V4L2_SUBDEV_CAP_STREAMS and the routing
ioctls return early, so media-ctl reports no routes and v4l2-ctl says
"Streams API not supported" even though the subdevs have
V4L2_SUBDEV_FL_STREAMS set.

v4: Posted as a series at Gjorgji's request, for folding into his v2.
    Added 1/4 (set_fmt signature) and 2/4 (SoC-level flag, per Bryan).
    3/4 is now a single line instead of fifteen. 4/4 unchanged, but its
    commit message no longer claims the pad count depends on the streams
    API. Tested on next-20261009 rather than our vendor branch.
v3: Referenced the prerequisite series with a Link: tag.
v2: Added the dependency to the commit message and as base-commit.

Hitesh Patel (4):
  media: qcom: camss: csid: Match the current set_fmt pad op signature
  media: qcom: camss: Set the streams API flag per SoC
  media: qcom: camss: Enable the streams API on SC7280
  media: qcom: camss: Do not link CSID source pads the CSID does not have

 drivers/media/platform/qcom/camss/camss-csid.c   |  3 ++-
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 -
 drivers/media/platform/qcom/camss/camss-csiphy.c |  4 ++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 -
 drivers/media/platform/qcom/camss/camss-vfe.c    | 10 +++++-----
 drivers/media/platform/qcom/camss/camss-vfe.h    |  1 -
 drivers/media/platform/qcom/camss/camss.c        | 19 +++++--------------
 drivers/media/platform/qcom/camss/camss.h        |  2 ++
 8 files changed, 16 insertions(+), 25 deletions(-)
-- 
2.43.0

