Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020096.outbound.protection.outlook.com [52.101.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44C43E3D93;
	Wed, 16 Sep 2026 05:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538046; cv=fail; b=CjooSdI67Srdkp0KLE3f+grV5lZLqGkr//+ophougKcPO1eCjJulceJgxUeTCfKkDSptbiQEB2zCwugM4CkmPeHs/f3+WAMI0Zhs0spZ7n9N0rSY6w+7AKKH77zw+aqYVDedwQyObuEyovLFan1MxBZxu3vlRmy3jMPFw14g15c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538046; c=relaxed/simple;
	bh=ZDrSg86X5xo9cphmCJwzgG63Hyw6eteHi2BFI6iOMiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HAYvymQpRoPH4MwjViqUrZvvK57zdD8pcDKSy33yOsFPuAe4ft53ct2nQ8oMavOFYMoFpKmBUb8GT9/NkiM/QqK2KMCt6+Szv2TNooSJdusojWx/k7V8Snh4kKc6+MnISXpUyEPednnIDHbjd8kn2SJ1np0th4BD4TI2e3vEFXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q4C1TvdAoblxGP3kGs27bWJxO6A0yeeFjh4z/A5HxsHlTFUSyllE4CZ0OJyF58ZLvNkcet7msHvv5wc4Iye71rBeFUH9kB+Ao9czGbHlf7L3y5XPuUBBqRe/4kGFuGbp8lGyAXkvAO26twCkzEg9X/nDX0PBVMqlHJukpwVMw/vkZytFhwUwU5Sso3apoAkQf7kAmz7miu4wLKhjQtxcQYogX4SKhnKF1wvLiKmkBS8u2fhQNTRlhNIy8aQkdkvI3dh6SKH5YUnK1dCyWi3OOYWrh+OZrM0Ch7PZaVdlmjMwjVReKGC1LGuErOtumed2QO/YnkM1eKfcKEtmTkI4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=drxlXDbXeRItPgqJnnKSHeWNfM+2EvsMYpeynI3+J1E=;
 b=V8Atw0GfC4jfPz6ICpAQzmvfIrwoq3nidouwM5Z7Mo1cFgl0h30iPIRBwf4Dn4Ztwhn8tGTkzvlteP7qxrBtqb4iELaI7t9He23iFmZu5sL8fYS4ax+CcAokyrwb0gxpLiQvJePCYAm1/a0I5J55ZwUvIHB4HZKgSYDQpw3z3T73cU4QgLDjb1HhPYMrs5OwzIqcf/Nfi5RG5phrJxgWn3FbGhX47fXOWDlAXcfCGiQ1OLkqjh1XMMsUtYx8shqT7i3y4DotssmveAPqeqqMK7YcmPnp/XauX27BQZVxJ6c6O079to0ZYmH4KFfx29mqxw2puPh9ZO2izoOLMLtuOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4465.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:195::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 05:54:01 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 05:54:01 +0000
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
Subject: [PATCH v2 2/2] media: qcom: camss: Enable the streams API on SC7280
Date: Wed, 16 Sep 2026 11:23:46 +0530
Message-ID: <20260916055346.520826-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055346.520826-1-hitesh@ebytelogic.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916055346.520826-1-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: bc2b0a8b-980b-4f23-8321-08df13b6e85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|1800799024|366016|10070799003|22082099003|18002099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	CdvMj7mWDTnCaTaHDg0lNl9D5TF32WgxaDVhMCYAbi1F5WMIEFpHZ9yW5dLo7XFVfkkGEdWRO2F7YhzAa+yAvi25e+IUiXuq5iDnpXt3GkMll85FYfRJJNXrbj5o3XgVgROhgwg7YkU3H1/fW3JzTeL+dJ8rr2SK2MU5kRyDxhwQGWc279TWfw2FM/vfsnH3pxJyLz/b2thaiVdFUgLWqa3rktvDTOmm7KbfozpkKEqJO7q8S865zA16oc/iM40tko6WGN37X+6D2fgsxTDoSI6ZeJakG51onxiHAAGgNUJgiXrv9LPTSnkyi2/qdMmtnuwkyV0vXjQjtQVxCa6uSdv8zY1+grj0BZF9UqSn00my3TIsmtBfdfNbiRm9BjrLNIxnhMH2Tu+jKX26FPi6vT1/XPONdpRRXBcfycTy68pZYaU69M3FhfGWrovD8oip6QIKx3M4MPbfrPRbZVcHcmb7bhoADKU+73csx9Q6UlyIsT+YtH0Qe+G+4p4OaUJGtjoFrNbJSzlITdKr5RNzEdvMzrdr/MgdoaRvjaKsORrAh/+EcUnPlgMAo2KJ4lHrn0NLyn/aIwiFWYvApfzmQuWH20ZScOEHyky7kSW3Ye9kW8J2xU4cZT1D+u2Dx20xFyQMDr6lfhhmerm8HiOzQJuK97V92yrZQBhZUfC/6Ao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HEM9cWl04AZ/CnQyiHPu68Q4mT6kb3g3ZIe6Hhkl0ThxiW7ss3Neyky3Jg+K?=
 =?us-ascii?Q?AabZqAlHaDFIGhSAhiehdJ5n6k37KNeyKWJRgeHmIJ//3BKQolXc8KL0xwtF?=
 =?us-ascii?Q?i15QTWkZL+RQp9vWqPdg/boY4u8kC79QAOlAk2qXmMEHnC3H8Psv65P02PHc?=
 =?us-ascii?Q?pk6+QjGQWNw8V87H+DD0kyp4QLZbYERfOXjoXPLWJIYQwiu9ZP1qHsH6kL/B?=
 =?us-ascii?Q?yhHkYDDowawEMKuh5Ofetaga9W8vJPUs7BOZZnZ1S5XmJeEOWLPRFdB8RpOS?=
 =?us-ascii?Q?P5sTdniZ1qBk15QX9hr6rgv34tjlH8SCuY/5SbjTN/NtGTPjW/efmrdNrWbk?=
 =?us-ascii?Q?RNNcrWovCdI+yoqFs9hG/ECjjzZBdhjSJXi5UbxfxqUwuXvr2rh7TsZbrqH6?=
 =?us-ascii?Q?zZ4BJaD0MR8SERuV5vtz1FJGcqR2hDVjqaxTv7y01XqanNCL21By4Dj5feyi?=
 =?us-ascii?Q?SXaoxHF1pOioKFr/a4WEPMYRvT1MJsfZwJBpppgNrI8RXFEkOj7PWbvSG10z?=
 =?us-ascii?Q?gsyNwoYNsEDTwTUc1jkGP0L8kehUvRtEO3eQ10Zqqzo+kPvUCVPZaroXhFAG?=
 =?us-ascii?Q?E1/WkOnSSRKjEN5o+ViZqBRhzjwz0kSiwDpKj8Zr7bw3gMeILljmI0jXr7tZ?=
 =?us-ascii?Q?vK5Smde5v1cuIO71JiHWmzSikFyKzRWUqtQcN59L1YlnNtuaEM1fFpT97k+w?=
 =?us-ascii?Q?ZZGq5S+IWDDRvsLXMILzcsvJDXB/nLaysQXh5jNKsNA3qS/Q00py2rYs+jJr?=
 =?us-ascii?Q?VKXzE9ogWoW0uJcLawHl3gbRMyIHD1HrDL7qTCFFERRIvsDi4xZfOmJZB5Cr?=
 =?us-ascii?Q?2IPMcoczGT88ol16Unxavkfx0TA4fBeoGgrMrN7bYv+6w/W9mkehLB2YM5xu?=
 =?us-ascii?Q?k31WHag0GwuNxpDTGmCiYzopSWLJ4RWUw/Xn+aQFhHM+mT04288LqZgbbs7r?=
 =?us-ascii?Q?h3M58LngVNKfc7SgtLm2hwUoY9dIcbrXjUVnR8AoRKyT9tdeuYLgMjB3ujrv?=
 =?us-ascii?Q?xezjT4sdNsjHNjLra9auDgL9Tii164gHLRDK8CyyiYoXltH8JG/Nw9Jn0YJV?=
 =?us-ascii?Q?8IqPeN3UT74TriWP4G+ZJdjoOcr/NwHJ1fw6PbmszqHbPs16Whnt994MKQkc?=
 =?us-ascii?Q?d/GZSgztNBBhjo8I+8Az5EH4ij7D7A5z+wLiCQGB8Zsgtx7O17LRPR/XpeHP?=
 =?us-ascii?Q?G56GNahrRHQHKOFxXSjBMlyOnlkhId7ae5YH8h0BIlxnZEx0jg5LR9oqEQzI?=
 =?us-ascii?Q?VB7hJu4WlRH66lk8ObHkjPWgC28MgaqqcM9saG1srgU1murt9EYMEGmTblAz?=
 =?us-ascii?Q?kgC9YbGuhVAg9NhXm61WjVqqMinwzyIEwEAzKunhMaVn+rW4GhaT7kouyIso?=
 =?us-ascii?Q?9URMHsugmvcJfp45fNWJSFAoNu1aetIuhskeJxj4M2fUDRBfHGH6x430/Czh?=
 =?us-ascii?Q?HbVSjD31/Szk68B8pLE5TkFuyb09LAL+1SXXEsJpcJtGCPs8xMXpjQMuiHjg?=
 =?us-ascii?Q?aiUAVQegbB5r6f+EtJ8s58CyNq6DYb+EDpsyAVw6XmR2C4Lx77dfTBJKzNRf?=
 =?us-ascii?Q?swWJpvdBjWksWuRDR6JLbwXej/O0W1PC3gmbwIyiFltsDZS46vzZ+rqH2uwL?=
 =?us-ascii?Q?1CriTXSN44vFnmE1e3i09s+pGkwabDlLSkDPApxP9Y4NkGwiAPHIV734i1Vu?=
 =?us-ascii?Q?i5L28KEcrbE8ep1XvM+cL4pbFNjEAIRavjFJ/zykve6I4OxdvAylTXyLbc+U?=
 =?us-ascii?Q?tJOKlmKk2C7+ld0ZnsOD7uKOZgLcQqyvKQgK+vbueDftr8d+fxnLAWyK932Z?=
X-MS-Exchange-AntiSpam-MessageData-1: Yym03eY3hXsWPg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2b0a8b-980b-4f23-8321-08df13b6e85f
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:54:01.7908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2/tEX91+IFZwd5/7KR+O1MMvnXoOtf7Wuc6lV2msQK5sbVZ36btPnb3FV00nwqPieMoOJx2iEIrlyB6qBEHCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4465

Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
done for SM8250.

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

This patch applies on top of Gjorgji Rosikopulos' series "media: qcom:
camss: add V4L2 subdev streams API support" [1]; it does not build
without it.

[1] https://lore.kernel.org/linux-media/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
v2: no code change. Add the dependency on [1] to the commit message
    and as base-commit/prerequisite-patch-id trailers, so patchwork and
    the Media CI do not try to build the patches standalone.

 drivers/media/platform/qcom/camss/camss.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0201debd4..2023c0df2 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2280,6 +2280,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.streams_enable = true,
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845,
@@ -2298,6 +2299,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.streams_enable = true,
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845,
@@ -2316,6 +2318,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.streams_enable = true,
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845,
@@ -2334,6 +2337,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.streams_enable = true,
 			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845,
@@ -2352,6 +2356,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.streams_enable = true,
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845,
@@ -2373,6 +2378,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid0" },
 		.interrupt = { "csid0" },
 		.csid = {
+			.streams_enable = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2392,6 +2398,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid1" },
 		.interrupt = { "csid1" },
 		.csid = {
+			.streams_enable = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2411,6 +2418,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
 		.csid = {
+			.streams_enable = true,
 			.is_lite = false,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2430,6 +2438,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite0" },
 		.interrupt = { "csid_lite0" },
 		.csid = {
+			.streams_enable = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2449,6 +2458,7 @@ static const struct camss_subdev_resources csid_res_7280[] = {
 		.reg = { "csid_lite1" },
 		.interrupt = { "csid_lite1" },
 		.csid = {
+			.streams_enable = true,
 			.is_lite = true,
 			.hw_ops = &csid_ops_gen2,
 			.parent_dev_ops = &vfe_parent_dev_ops,
@@ -2475,6 +2485,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.vfe = {
+			.streams_enable = true,
 			.line_num = 3,
 			.is_lite = false,
 			.has_pd = true,
@@ -2501,6 +2512,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.vfe = {
+			.streams_enable = true,
 			.line_num = 3,
 			.is_lite = false,
 			.has_pd = true,
@@ -2527,6 +2539,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.reg = { "vfe2" },
 		.interrupt = { "vfe2" },
 		.vfe = {
+			.streams_enable = true,
 			.line_num = 3,
 			.is_lite = false,
 			.hw_ops = &vfe_ops_170,
@@ -2551,6 +2564,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.reg = { "vfe_lite0" },
 		.interrupt = { "vfe_lite0" },
 		.vfe = {
+			.streams_enable = true,
 			.line_num = 4,
 			.is_lite = true,
 			.hw_ops = &vfe_ops_170,
@@ -2573,6 +2587,7 @@ static const struct camss_subdev_resources vfe_res_7280[] = {
 		.reg = { "vfe_lite1" },
 		.interrupt = { "vfe_lite1" },
 		.vfe = {
+			.streams_enable = true,
 			.line_num = 4,
 			.is_lite = true,
 			.hw_ops = &vfe_ops_170,
-- 
2.43.0

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
prerequisite-patch-id: 285e8b983e45d4184863e92ae99ebe46bb4f7020
prerequisite-patch-id: e8dce2cee0678cc20446f3a4a286c4a3c10d19f6
prerequisite-patch-id: d0bf82158d99863344c206a543d3e381b24a3b51
prerequisite-patch-id: ddffbfdffba948a608fc556a5ca81b9dabae7e00
prerequisite-patch-id: dca159c5eecf280ea7ce7c67f5da2364c8449759
prerequisite-patch-id: 220ee607579892058879cad0ed9344f6696313c8
prerequisite-patch-id: d7665451d090c8d4684c79736ac517d6c7ddc1fc
prerequisite-patch-id: f297c801f0254862e4fc8440dbd27473a8b78159
