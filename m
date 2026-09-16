Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020125.outbound.protection.outlook.com [52.101.227.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3913F1040;
	Wed, 16 Sep 2026 06:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541683; cv=fail; b=iK0G/BBlgSAYQHYxZepsLbeDLJBooQRiyKr7wCg2USrLngdjBOmbKn9vpmoE4EMQt43nJS24k34YSODbp4Z+SdjUMrfyEMD+ZrOCo7+R9ZufnmjPpWtltMDDV8W25AsP/muxq6dMYgBe7R24PYJBTERVIiFsf7nSnaCv8TiAXDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541683; c=relaxed/simple;
	bh=+kCVru0R9K+Ctx7fWJzyjOzOr/GBpRL6Wtf5msp1eE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e0WKiMbgonCN5YxXfRroZgn5dj8kXK5Q69/UkM1OgOVoOWSfbI7VRJIP3+QoLy9r/VKtQBEOqIy2BiIShHTX1Vp4LAANsyE4PF2IEAdi65uc+EhtunYZCanfsVAooTGYSTHhW1Y+ne6mI55uk/AOUY0bFLTF7o0tY00iB7/zZbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yW9mc5FxkDYCYnE7Rg+KZnzVqv5DJGC7+F+GgVzDjCSmlgfIlk/ZSTZ7Jcu7sD89x2z2FJayYWPqFOfCk0C4t8WRD0o9AzzegA7R9sB3XMzijzZF+Hq7lYWhA3tYyxxwsPiBHeUs8S+9nPNfX5nGl7icMgBn+NvWMM99FHVkJPXo8ug2KMiOx/Rg03Q1OhaDZggc+ap1tTfwDniFS43DWgGUMA9XVAOYXriwlOhYQngVjmyGAVWa3DaMte+EK1vgYtaNy+JV6srMFHu8r/yhtlWIJDxUJLTZ82VO01d9fsXBoQIKJ8own9MCloZ/mTtVOZfe4Z9c7UCxZGcS6D8DAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyAaesjNJciu8X8jtU/RiXVtz+gtk5rvLQpsZjCT+n0=;
 b=lPv4a8p+QwGq59VjHvE0IkjNLudiQ+EWHkRAL0DMVOFAH1hcHpNLiE1FmP18KfSDjUCW5OKf7oNyxu6jLZXHSoPX2hWV1ikZR/hXu/d0IGXytPJ49TA1dMVcJlcYqlddXGtC5QKUIjJw9wra0vPXwVmFkkL1Kvto8hREJkeTMr17DFgaK5zrb4V6Ab+8mjsLzYiJe9EjVj8TBTPsavBvo7uK8cBoL+sigU/uLZTi7UDo/Mycxl9fmK4ECpmHrNCKhX8n/VBZT08UElmrtNLe6teUuRTVoIugNhd3M31fJ4IDyw/qXqKh/8HFvgqsXaqWEE4gzhQFZ+gul/TRhgIvEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0330.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 06:54:39 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 06:54:39 +0000
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
Subject: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on SC7280
Date: Wed, 16 Sep 2026 12:24:22 +0530
Message-ID: <20260916065422.819512-3-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916065422.819512-1-hitesh@ebytelogic.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916065422.819512-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PEPF000001B1.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::d) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0330:EE_
X-MS-Office365-Filtering-Correlation-Id: 100361a6-976b-49b5-f7b2-08df13bf60c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|10070799003|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	37D9BpdHxYWrUpytJP27WP2X9Mo9AQqk0wITkZJNNluPTlJELKMpBSn6H6IXk2sKDg37Rmf/bWRhPA1/eroIQK1WQ/t8u2hefkbB4vB5wW1lSarQ2P1TeBZViXO03lFDe3LhAd4kC38wXflvFpU+J9p9OOAP2i87YAcOYXRWXd4STNe6e1oT6M0cL9qnA7jf437wF+1KInsw3P8TFPCwigh+W586hUqLjvagXbkWgUQLYSYG+/37mumZPZksvu1wITDGujXQvOkyZ1GKe7s5OZLbKsLyV2/O1VFtFEtMSW9l5mZwFJBzlW+0BKxgCmK06rg9vwD8snHz+Q0UePtjlwGTGO7ZGWrZoLBcgryqqzN5r8ac1RDeMvFmEeyinMgvbTZHr1jPQIe9r0XKcasA0UOQtw3VkYDjeGn9+6yMHu8imYMgIYyNpNQuE3NiGm9ZWALTkktNJ9UjcjooRfAwlCIW6wcD5lAMMrA4TYivo7zjARHEiN/ijd2+w8NtCSO+iNP2HVeoS7NjSWPllKE7d49+aTVAwGMmQQT0QAryaJOfF8YS7A1wnoUxEn/CH4Zvk7VjKmHTPbSdzLUbTieuKlp/O1zOxq554QeY9BUSq+AsU8OdyY0amdqqW2ZvFKSy3Ay2xG7eeRQQQCUDh2JJXg1iW+6o8o/dSgoPebtC278=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sv7/5uVsvXBves8lW/xliprLSTU4W3KcjmQX/1WplkXypSi+wp/f4lwnsmeG?=
 =?us-ascii?Q?SOeqw0XdDnhaLKL6kdaAeMDhM9Id12exC2pwN6rjRQq2lUZOSpIQDqbyXmpe?=
 =?us-ascii?Q?mw5nTY9PjOniCwrbOjWH18pjzk+/Ops7faHPJCcr/G8a0Umzy+wDBkiTtORN?=
 =?us-ascii?Q?Hrp0V1wweJjJ/TTpiJ2CGJwhNyQmFiBecvWTcjQf+IGRE0auBFzdkKcdyZj5?=
 =?us-ascii?Q?9V6BvYMeNj75TQl/1qrImcAax4rlFYGVZddo3y59uPPEPV4u/qD1I4cyo6Ax?=
 =?us-ascii?Q?d02nk5eVZPzg+L4Js3qGCWOMmrf6aE+pz5vooxATtSTtfE+r05wAg5AENH6I?=
 =?us-ascii?Q?43jMt4culngrIEE1FqlpO3irtE1CR8X/tHH8qCnTjHz4mflVtpClKyc5iG5L?=
 =?us-ascii?Q?VqQMa04YKvK4QfSQyabknkf5HqYjpWMljz91beCoqymffBhIYPi6DTg7vPDR?=
 =?us-ascii?Q?+dVyszM53eea2u6Xuex5Q1pQdpHO/uPbBD54uffRjlwmBXbQcuVprd8H0xkI?=
 =?us-ascii?Q?i5WsoPRyfrDjEjGLPOuTz+Y2iRMxFsxnDqMprmSCgN9dVZODWOSjcfr9dPZh?=
 =?us-ascii?Q?HhyG8zpTWqr7k5AXskS29IESLLtsoWaI37f8Va5wk21KwM3hAtTuu45RdIcL?=
 =?us-ascii?Q?KE2qYPAIfPFjNM1pjRtUUWprKL4dwT8zMVdI7tMbfqm7W5Wn3dWPwWlUrej6?=
 =?us-ascii?Q?XrUBjKNsD0z51OQvcPA4b/fe6DNwo8KlXO6h1n1iWq+bADv1YTrCRFKU/Dp2?=
 =?us-ascii?Q?wMzsKRWlHvb6LKlYWL9Vnq0P9HptNIFxEhn4CmZxxhknulGc6HPnHFl7gWSB?=
 =?us-ascii?Q?keEYSvMkBa5iiyNwAjSFcOODdV2+RZkaCOFeuR/xVhRZrskXh1bkP/i6LBC9?=
 =?us-ascii?Q?xYCKhmTWt+1RoJ3+8+RptU2t/q9HfS1JwznEFjafNC4LyRCNDBmQgmwvfh3/?=
 =?us-ascii?Q?ehaIljXisytf/H5csXWWDFU3U/HXk6Amchq8MQsZ4auX1iOAYkMaL4bSENSn?=
 =?us-ascii?Q?SMn8jaaMg/rGJLM+WLcIttSRlHM/BMJog9Nk4xAyFzFgZn4C3l7HkIa3aSDV?=
 =?us-ascii?Q?/RE6HpjtBcfkd/w96ggydLK67g+Yyi7uZVuL4fKiPlCzGUySRFy3VGIkoj6F?=
 =?us-ascii?Q?tihK7V1owz2ZbD2riMwQbog5fpce8zPzSip6485jIlp1WU5ueDcp1a7fhqoe?=
 =?us-ascii?Q?n89XKHYhJRZQ+uVG62f/JdnenVvxm3YgaW6K1N/4L1vIcChljojflmwXnDK8?=
 =?us-ascii?Q?6kNsy4wHIA4rP1BaMd+GDt43MUAy1v4ZNCd9bBS48Bre+UTN/wlZ0qWu14Yz?=
 =?us-ascii?Q?bjLGEYdd/fY6PCs/KCKbZS8VDeZ3j6RjEiYHHI45w4IfxOdOUh9gGjCGu4nr?=
 =?us-ascii?Q?bK06rXRhEuulgFN/+aA2jqMBewQHeKgys5proZcPDl9belbM4xG3pch7AJji?=
 =?us-ascii?Q?SiqtEJvfk2uE+r2FOCgsiPWFKjoWKb1E2OuazaG9v0Szpd0cDLKQsXLHuCJM?=
 =?us-ascii?Q?ysildzUHHwX6dyEP6zMDfZWf7cltrCSMjsh9MAVrp7DzxFxaqWR98kr0BJAC?=
 =?us-ascii?Q?jx3gSEMH2sAW/TOnxTkcZEP4sO4V+Ora3Pbe+c9+vvJElCNNGHKZEp6sdEEn?=
 =?us-ascii?Q?bCoQcBWvp4csMom5+IbMvC1Om7vvo118c/FGd0lEY+/DefKjWcwIFLa6pFcU?=
 =?us-ascii?Q?MibCPAXgb0/+5n2ZN5jkZMXKSLyXuUxRdrl57r8RZRycxslnvjtu+N/UCRCS?=
 =?us-ascii?Q?6a6T6fLbgnfpWzS+BFUIxKRzqpxmekqwrO3CiZPACs87w22sWwQCZvjTqGHC?=
X-MS-Exchange-AntiSpam-MessageData-1: utDzh1jIO3Z1Cg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100361a6-976b-49b5-f7b2-08df13bf60c1
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:54:39.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZszOSeHX8pfJgSeAxZXMAdMxzhZdGNlAHf8uF00sse9gu/iKjmLVn4kCd/ubv20578quyfE3e9lChu1khYByA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0330

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
camss: add V4L2 subdev streams API support" (see Link below); it does
not build without it.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Link: https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com
---
v3: no code change. Reference the prerequisite series with a Link: tag
    instead of a long URL in the text (checkpatch line-length warning).
v2: no code change. Add the dependency to the commit message and as
    base-commit/prerequisite-patch-id trailers, so patchwork and the
    Media CI do not try to build the patches standalone.

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
