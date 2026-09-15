Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020121.outbound.protection.outlook.com [52.101.225.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120C44AC173;
	Tue, 15 Sep 2026 12:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474558; cv=fail; b=qTE4IzM2mOZ62LsFbwpgVEwehA4lOZ9ocUW5UPf5BuDXrtzhAED9l1BeW3wNywoKMLagkJgf9jI/DpcLZkMFKHTuyscWUzwTw4a9QZjyzJQi0nOqGQmzNbRmi2BVNW2IL8q1sx46029coQErmsg8cJudugS+NIP7kdrNzqfZWJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474558; c=relaxed/simple;
	bh=ka/FDUn9YB022JPddwxbwgDgYNvfU7t10uHaYdkQ5SQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QFh94+pTyKkU1hchFkQ8MxEO9v7WtW29/HI3P1LzFkRuPVCz/VlqyBsW05sI4sv2owqv/njvoCcn2JsTjEuOkV87nALhlP9jsHmT6zCUPJ54HMCUO3d6w5QrqpoId22/n+VxBjD7V56NEa7eS0EzbiHqz0gv7A4D1gArdz8I+H8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJWmaH7bXuB0apvna6Q9YplM4ztLkCduext16G4oFGXPkJD+1Fqub+eNXICPWOzZnDeGeA2jjJh79fQ1gjpJq5z4nQR99v/TbrnyPMnhKPPS3Y6rlahUdGUJIa3X11XpFhEz8SPMJqaaDAcvceriXo3euzZpkaPx+CjiISi3D3wlv0i4qARKoVGch7nQPp5PyE1kO07cgam7i3xg3ju2tXky8EyA5kyEHh9Iwb721jyApodVZqtWvnFnR798IOlgj1vIRZPUeB6KPRY9L/htIXvSvKcyia6ZcmjX4pW7QpcCW/gKfD3KgCvoiy+TLEmykHUFnPi61jUTgHiR0Hn1sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1WIm7nXfhI3UTIMmV2clVV24OJwbdRix9lv/z1qyiw=;
 b=hqKFCb75JbDkN1aX3xdw66pPYGoMv+o6up8P/zPsqE5CPsqFgCwZ3bmzlFJ50beSPYFyxlQigJJjnb3Bg47SsjKHVcMh7wiAd9tQubkqUksLmvnzMJN5Dn4uSujjOAtC2+6jGTtWfe0r9aQsTs2yFV4gHf2ejIY1OIBXtkbGXXlrTZ+S+c2MvXNvQSNmzwmZ33GdCXJHMWmVFMG29gQhNwnGHs33fjhPZ+WDPOmFMY+HVnTf81etmYzCJ98mPeEZXtzf3mzON/XQuVLMhmTPgmiwRxX3vXVFNjR8TPHGjHDMzMg149Ufg3z1MNJPa2qs0QDpjWp4YvD8cGTbzUBKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:15:54 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:15:53 +0000
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
Subject: [PATCH 2/2] media: qcom: camss: Enable the streams API on SC7280
Date: Tue, 15 Sep 2026 17:45:36 +0530
Message-ID: <20260915121536.19207-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121536.19207-1-hitesh@ebytelogic.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20260915121536.19207-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::23) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 15126ab2-3cac-4bef-714f-08df132316d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2Tn5gOSao/EsjQhcLLojh9HoWuJJ14erYMmdDodgMb4q0Y49dy8ywxi2qSpLB5uJjCp2dLvd+/ofY83efzooGrOppMt3xtncp6t+/WmnyVWaKFLSvUVxtFJCrjMiK4WvkSxFl8RqwB2+yaibHyv18hqovAkgv5VxfZoFjwUu/BdhVuUwhcuc5Mzcpy19Rhgxkdc6CZyZc8TYJLH+c9Xd0XYUBudQblT7YS6q21YPN6umLypgbBgyKVyPKQCYJLvVJI/kz2LLFutKAfHBrVvlmLC15GMqqPmsyO+Us+/h0cimaZymTzkwsfFl7PNZxY/CCsE/1wzlGhhgQkwyJDRE0cZ9PA74/ffptKqRlv05n7En6ipIJymFpl8VOPW7zdY/kI4F4lczxIhcn6nkYjUWwSI+qAFDEtYl2lHJ+q2jCkNThb3FE8Q+pjx2IlAuyva/LuSk7DFIlMYXbYWbwrMS/2mKqlDorsjQFWPWqNxXnRQzViGkLlQ5jvk2GhHVhbpWHPex3F21BJUtwuapaMjXaNFsisz9DD7wMJyLQVJZibcIMMujd3d8eG+lwKgScBd32fS/tCzKkk08gA938wxZSkWomUy4Kv+35bM2nGM3dcBp9GpxjDBlH1KpvpbLsYTjjC+IEp5S4iogwV6En4rUVi0nabNIFm5IROsOd453eiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cSp7z2ecOsgW9ZJiGQwewKiHrE0BI9gpJQsVUfIbFvrnt2AVYhEJpZNlL0rc?=
 =?us-ascii?Q?x2rkbrHci7bdWJTGWiqXs9xTtkIXzj6n+k4NoDTDeqmnr6OlkVN9wwqf8CSe?=
 =?us-ascii?Q?FLO+ybLr0QVcpHTNclkmSplpZ0RBv3D4tVns93bsrpgEB27O9c1CwtLzvylW?=
 =?us-ascii?Q?g5cAX6QyORDokab58rS62cbXJTlE621VSYjJafQOG69mi1bW/D50oPHB8fZs?=
 =?us-ascii?Q?Z/H7WsIz7z5bymLq0LayRovmPmxyw1nnwAA2WP+YTzAWZUAsgPBE1ceZY7YR?=
 =?us-ascii?Q?/47Kdd9teQ/cFxktq0qzYxxzSBjc+pfuAm5gnBmO3qngAg/LcdwdFyLMVs1d?=
 =?us-ascii?Q?XXORviDNUzSjz7L8iBXXEsgeh3/zshTFDDeRpLH4drAMyPM7OYgI+fZHlyrU?=
 =?us-ascii?Q?LFL7bysLR3QIwiZeeVdNhMlaXxKWQ0FK1X4u1CAHw1OJJ7aZ2MZ8xqxrIwUt?=
 =?us-ascii?Q?XLJdT40iM+pdW4KmwhXmgXXm78KDYKs5dYzQQlQteMhLDp5jGDQIq2czGgfJ?=
 =?us-ascii?Q?LXxEz/adHy7WvnHndVueGSvMLcgRUkDti7fFRSMqgh7tTFAu2VmHlEN8GJ1i?=
 =?us-ascii?Q?6/340VrVvlYdznyg1NzxVGXVijZvY8+J7i/N2pAKgnLK5ATIxU8AeRM0nFQs?=
 =?us-ascii?Q?4QhPepTw2XXaYFAu9oKSXhge3G1+Tz8b1ep9cd/FWj45GotnmDbSaV1HbAgh?=
 =?us-ascii?Q?2FsYDDRzq3NPVyXoYgWACaLagbaCDhNhcJL9JTJz6ARxhUgC74Rl4uJ1SnPc?=
 =?us-ascii?Q?qtbx7baaIHbfe3t//j66E7+rgOuoIPymIW0iPcKXXMSnHUhI5RCaV1lunES6?=
 =?us-ascii?Q?h4pGRsJBEPspR7rQ7buvaVwf3ExCxhn2hwFEvvk3KqAfL2Pg6xiTqpSbNqCX?=
 =?us-ascii?Q?pDvAy+Rlzv6t4i9GeQJtGEk27k/P7pPB5riT7LW5QvfLOaF8BsgNBiUzwcVp?=
 =?us-ascii?Q?Qr4/FArG1Ys7YhAo3aAqka2b10HWMWnOc/rsNLqyRo5Yzkz/09yPbLt8w4CB?=
 =?us-ascii?Q?DYMyILgn8x6RP0LYkbguS8rKwnKU7qTT+3QP2gQpAOLLSw2T+JLT4JZmheOn?=
 =?us-ascii?Q?Ij54ak8vaMEvnT/es6zszfLWLRcrihS2BgBfOd1D5NmuY+46Mp/3itJt4FKI?=
 =?us-ascii?Q?pcfU3wO21pFLJ0VkPTJY9y0ALMarEabZvM5WGTAbT1C+ax8tdyFyiFNLFyzL?=
 =?us-ascii?Q?HkNnCTsNhavhYvBqdJeNTCdJVpKr2npZurCY2QnzBPlP49rgxqiTo1dw8ZXf?=
 =?us-ascii?Q?dhcj+gy8VTBjhaUUNRWXeZbDo4P+Cx3J3Grt5nTl8Od6IEdOREZAv5UOfeVn?=
 =?us-ascii?Q?DlKBTZWK+DP64noEfAle/nE3GnuQnqPMdY/Pg6CImH0RDg2OUpKMJUehmno+?=
 =?us-ascii?Q?ATzqyfyxlOoMem3r+CcjpkfZyoKl+yr6HJh3SRJe2DpaFIPR4fatVw4pqKdr?=
 =?us-ascii?Q?CSBRWswlifrQrXg9PWVXQGkVLg6bBPYn2c59Y81xJlF3PTXKyfhY3GUc3Fjh?=
 =?us-ascii?Q?ZAQrZ6VcNSBjAF9PoehrTNvaMU05Aw40TtTFFO8rYMFOFm4FmxjUKYEVY/U1?=
 =?us-ascii?Q?7YKwv9Y3BLaeH5LwFWUNnGKjoq5zHHX9EJGrI8w/XJhrFGLjitviHzf1bSNc?=
 =?us-ascii?Q?ZmP4hcboUjW9O2FqOyC3i+4MgbSWbHpHNAh0CR+tFl0gfgVkI23fDoFiPw3Z?=
 =?us-ascii?Q?o4XX0OjDaqr/h592RCrNQG9iUOCBVY26dD13vuhsQi9u6MXCfHYgNmy0SeAS?=
 =?us-ascii?Q?aMO7Z+ObGPxLBGvuZlc4e7TGcGLTCLXrPvzg7iZCNy6ISstJXPeaK3SBzvAU?=
X-MS-Exchange-AntiSpam-MessageData-1: gEnYv1pPoHHJBA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15126ab2-3cac-4bef-714f-08df132316d9
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:15:53.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CthNwxtpu0Fx/TbTvo7Atxi39wZItFiqR0U1SuJUg3NiL24aAdn2QZr2FW1EbALzJ7/aeZvQuaZWufjzpEIgYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

Set streams_enable on every CSIPHY, CSID and VFE line of SC7280, as
done for SM8250.

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and
each can be started and stopped repeatedly while the other keeps
streaming, without the WARN in call_s_stream() and without the second
pipeline tearing the first one down that the legacy s_stream path
produces. The CSID test pattern generator keeps working.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
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

