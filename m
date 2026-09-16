Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020096.outbound.protection.outlook.com [52.101.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A8C349CD2;
	Wed, 16 Sep 2026 05:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538042; cv=fail; b=RAucLh3ZhAu5SsI4rYNppMSmxIMbR9bo5Onew+vCo4QsK5qMQhlZ3Dyafex5lffD734XCiavb5Fc3bZrvvfoPVTf6/oH3twWVeKzBy0pITEC/fqBHI9WQo1wFRHDrYh9j/dNxmCapCyFa2L+ln8/kXZu0sIWdMii8NcxsbkfLeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538042; c=relaxed/simple;
	bh=1/+ACbYpEBng2t4qWNxJZzQ92PJmBdqIggqBak3Qkbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JajyXQfbPNeyFzkeGTryeXLzB87SlC66aiYSxPUn4+wAlxOMvSvEphi5026M+z3kdH8zYtEgXabEQuPbeHrbQkfV+Sb3J8t8agm5rz++KvqW3vU2De2rkNH1xquOpQ6ETOzCHUmrgXGgQMVqG5SNUVQLfytfTuP2VUlxi2nxbNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csa7asPPW9CzNVVP30Fk9mK0KHbGcjLHmDO+iT+3UvvSFfgFlI671c7SwtII4sQrLfsb0yQMvPanNap1fYP3UkSQ6h8ILXcUPJx8AfnUNTf7yOu4YnjonbuHC/pBzPqgKjk4+a5zGrqCjGsMKGg8LIQO1tNn2HKEp706TUvotHfpDLaNYOt1FI5Rfj2n8vHTdwjGEkEaILNCdLkaPoTzsRU8FxQDHqtUClI9OcLF8JQLBUZIbLocxIioR9OISBJMcM4y7jreQ4WM4/e9P4WzQEg/KW1UvtLKhLlu5NETv3U1xRysUeBajRPLHJRbHu3QTbCeZShC0iTVvJub5NL+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PbQOIOZh4WJJ87DhgL1nYOKMZkHNc6sqQvvuGsP+ZB8=;
 b=m7OBafNKMFkIpAUOYpkQwag21L8A3UZk7KdB//5Zs4GnSdmOefbVXVlAtxxbXgldAC/mpe92IFKDrapf7bAjJwUFoWAkzCLkAGnlRzT+S3Jjczrwvebew+kRlmwasLFJhWjkUvEoPUsisqrpBu1QX8ZORxFTrjBup8TObdUY5jQcOTP6/r586CzuyiHD22lcp3L33rt6mCWvt/ZQEXEkYbZQLq5uraba84uEHj3K6jA2V9MkMJRtSjZ2+8OMMn9BlS1lW3rA3WjqczvUcpw9VNsk2ZuVCfFkyw7V5u/b9ERIYBnHfbts6J8gdyB6nbCVWN1DD4PmmH2wDpXVam1HDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4465.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:195::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 05:53:56 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 05:53:55 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 0/2] media: qcom: camss: SC7280 fixes for the streams API series
Date: Wed, 16 Sep 2026 11:23:44 +0530
Message-ID: <20260916055346.520826-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121536.19207-1-hitesh@ebytelogic.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 79850c8b-6bc4-41ec-2ee2-08df13b6e4e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|1800799024|366016|10070799003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	xsdLhrBIMH2O4lKoI3omJRTMwEL0G0SyCqakRraf/p7akIzWofPVeUMHHt2Hb3/EmbqlvcQFalqht8F5DIgaKMPgNrE/WmJ2WEa5MzOmX73RxvmLwFqtrbj11409LY4oxpJvyUh+vQu5b5CZCLBE7aO4UOoAHIrvGYuQOQXCfjP/XlonSvtprclyMpNXnHOoJnfUYOSte84KYZAwVHt04n30Kfek4e84NIX9aMwOpKldHDO4PeryvK/L5lqd4hNKCYqSL2eiWfx9vlOd3M4FLPgf8WRQwgAol1zwqmKgMqHKoIqWZtwdziqqd9T5UezkJ0w92XTrZMVB/1p3f69zu3Qy9l14LmngEYKURsmY9FGPm1su+kRpUfam6sXmc3/CDRswDwUveqKhVBrg1ZkDDtrhyL8qpKIviGbQMmt5CcOMPPawFtNylad76XLnfrf/a569xqciZ9XO0CfYU2tBrVa0Ac27OKyYuXUFCI1EeMYSSI4H0EEaYs8TIpwUeimF+W/S8vuY99rvrzF43/nU9if7n4M/7zgjQ+E61Asrsaq6XWe4hFzBIXY5kRVFTTO0GANFV171/wPut+P+tWE1tP3ZxQwxsSpB/aBUg2ObqG+WtMNmARBouaqVlp73AtbBhAXDVwXWOW02ctLZt/BTuK3PjCpinUrtn6LFZVFdbuo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GorVLxtDcP+xsyehkz/VgheF8nqsXFsseZABK1YGpvPH/TlY1HXwWyxKl2KS?=
 =?us-ascii?Q?GXYXxRoQJzehNFcF2UIjBZ6trH6ytAjslvvF+UzO/lSf8a7GBsDKLv6ly1At?=
 =?us-ascii?Q?jigDjZh2dKFZ4lbOcpTy9FmAJA3F+k6BpYo6w7UUvcLWNCFKWm8U6DWbWSvK?=
 =?us-ascii?Q?mPSQs5dN7DPBejycx4kSaJCcM9pRefZ5vEkD8+MvblVdGMoypwSsEUEdiRpZ?=
 =?us-ascii?Q?q8XtpUeoJD0Gyu9K1QVmZwdCqOif3gp/wN0sB41ksh8M/RO6xao6D1fcx06m?=
 =?us-ascii?Q?x21Qt5FijeJBNtSm1yXWNP+BnDtSEWQ0QtF+tw/5VfyxkMOa8o5E6FMz6x6R?=
 =?us-ascii?Q?R0jyrvyjFNWyzCSWjT24LaoYDPZQgNp64n4da0Y8iD/q4opiJlSxMW8gXqsC?=
 =?us-ascii?Q?pZ5iXzXaF81m/wL6u7JSaQnFGNwcQB7UOQKkteaWm9RD4/7uMtUy1o3wiDJH?=
 =?us-ascii?Q?XCvQ2JA26K3hgEnYuulZ7IT5r3oH6rS4rWEQEoa57h/yZH7t+WDzff4MP9c3?=
 =?us-ascii?Q?7d4mlkt41ZQFCxCw3rcQPetGx0OnIMTUUg0NokrSiW7WZTg7LUbjGRLsH70D?=
 =?us-ascii?Q?g29KWpQGK6Y5X1JNeti0oxuTqwM7fPr2KXucvNi0nLhBDa91CMNAjq6/6Slr?=
 =?us-ascii?Q?rFwZEwuLodsczqtXL50xMpC1UbNfuMbWjsHQQrvSIhn6SsmJz5ppOzE443c6?=
 =?us-ascii?Q?49ytdCF6J+xwZRw8g/38bFe87Mva3gHEAgU1uzJQ2QKrpCNiehaR1P5RdyQG?=
 =?us-ascii?Q?a0PZwCvlbOYregszr9fVC8xm+kdPjNuOCWeWG0Rxpa95mpe5NwtI8YvCnWyb?=
 =?us-ascii?Q?u0HthquToe9lRMk9Gg7pLj3LkqroGNd+fhPhwkBU7gziPswZMPNNqQKXmht+?=
 =?us-ascii?Q?/8qy1O33vLzGA9yuA1qDaKMxWXGTr7G1nLF9M3OckjpcuOyx3I/swzpsBuBT?=
 =?us-ascii?Q?lRvafWWTq2IWTUOwnnq9UGHgQrkSNMZeXrxFR1mUkgkQmO3s9Cjv5XBoXgI0?=
 =?us-ascii?Q?XkhPa/onfGrsCm1k85on7pXNdAeAsDvE7Tv3mqx6A1O20HuJ2kGFLwR0hDFO?=
 =?us-ascii?Q?EYbAIrCzSxkwEOG0XuLkJH+ktEUKhtEbLjZLypYv3s020V6XZFDjJK/szyXZ?=
 =?us-ascii?Q?1M7t1Gz4PWxjrLZWxcYqYYKbUwPOWFc2D9rqKINajhkUSNB7cWKgoTJWFgmh?=
 =?us-ascii?Q?UCuiyzdDSUx7DW5mWYgEKC06H426xTxF3pB6TMxnTVMrwMqlyUViIn7MxiOg?=
 =?us-ascii?Q?OFP1aHeluQ226A7PhBsHBW2buXrsstmz9seNLkaqfD8RTA+Dj2brdNq+CPDq?=
 =?us-ascii?Q?nnE9iTXPPOTfFc3ZQYWh6a227mJPZwQVs1DlQKkSpbbXbGrgzgdPBCSBazRj?=
 =?us-ascii?Q?h1l9DcU9nwG7HPv1R3Bvlslxw6hgY81BQa6T5QjpFo7XhlEunc0gXbDui8VG?=
 =?us-ascii?Q?OpipTQB5l6NPDRzk3i4zCKZ4L/NW1dDdi8Yz9jb1z9ASaa/4s/fxphtnVMZr?=
 =?us-ascii?Q?BRy91wu43F2E2ne+jLxzkMwfgmQcY0WOx64GWalpW7uHu038NNfYfW3x8owW?=
 =?us-ascii?Q?QuZG5pZ1em+q7wG0r2PNLR1fdS6BCEgLKMS49Q8YjLEc267r3oO6yUtb4OgV?=
 =?us-ascii?Q?VUivE8xTc4BMq4ynUiS9aNVPvuvphD/HcOwG+2b9hWWsLt0ONaEe216C2L4S?=
 =?us-ascii?Q?blJl4hl6yAmUW6QRH2FToQjKz/EfALX78eB//TtdRq5RxHK8cS1qZaC74Ob5?=
 =?us-ascii?Q?MF4FUFcRksB6vblZg5iuSxHqBr3t7iz01ejcHudwT3Ee99CDVVeWNLm7vi5m?=
X-MS-Exchange-AntiSpam-MessageData-1: lkc7dCkjrXy+pQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79850c8b-6bc4-41ec-2ee2-08df13b6e4e4
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:53:55.8007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hfEUUALsScoDPDdpYovDeX8Bu9o/whCNeuSIYwWMzrt+ZonIF9ksHjoaiRC2F2FawK+xqaqVbteiCfhP06CHow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4465

Hi Gjorgji,

these two patches are the ones I sent on top of your "add V4L2 subdev
streams API support" series [1] yesterday; resent as v2 because the
Media CI picked them up as a standalone series and, of course, they do
not build without your series: every error in the CI report is a symbol
your series adds (streams_enable, csid_hw_ops.configure_rx/enable_stream/
disable_stream). No code changed, v2 only spells the dependency out in
the commit messages and in base-commit/prerequisite-patch-id trailers so
patchwork and the CI apply them onto your series. I will mark v1 as
superseded on patchwork.

Since patch 1 is a fix to the series itself (every platform that links
all CSIDs to all VFEs fails to probe once streams_enable is set on a
non-lite CSID), feel free to fold both into your v2 instead of carrying
them separately; whichever you prefer.

Both tested on RB3 Gen2 (QCS6490/SC7280) with two GMSL cameras behind a
MAX9296A, as described in my earlier report on this thread.

[1] https://lore.kernel.org/linux-media/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/

Hitesh Patel (2):
  media: qcom: camss: Do not link CSID source pads the CSID does not have
  media: qcom: camss: Enable the streams API on SC7280

 drivers/media/platform/qcom/camss/camss.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)


base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
prerequisite-patch-id: 285e8b983e45d4184863e92ae99ebe46bb4f7020
prerequisite-patch-id: e8dce2cee0678cc20446f3a4a286c4a3c10d19f6
prerequisite-patch-id: d0bf82158d99863344c206a543d3e381b24a3b51
prerequisite-patch-id: ddffbfdffba948a608fc556a5ca81b9dabae7e00
prerequisite-patch-id: dca159c5eecf280ea7ce7c67f5da2364c8449759
prerequisite-patch-id: 220ee607579892058879cad0ed9344f6696313c8
prerequisite-patch-id: d7665451d090c8d4684c79736ac517d6c7ddc1fc
prerequisite-patch-id: f297c801f0254862e4fc8440dbd27473a8b78159
