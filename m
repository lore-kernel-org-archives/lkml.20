Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020125.outbound.protection.outlook.com [52.101.227.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFD3EE1FE;
	Wed, 16 Sep 2026 06:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541681; cv=fail; b=DJTA/1uIkC6435i62HIzHCflTetYsFl7hotXnvs4HXCjDEsDFkzrpnNF8bNsAnwOYdP1nLR3ocQ8VVsj1/oia5Io3qz2rqcUtMZbqNBFQcazHPE9cu5db2HH04L6ZH2zugU+QANBJ+dQJ9jQB6FELRYlSk6DFQt83jJC4bHxc2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541681; c=relaxed/simple;
	bh=bPf2dl7temTDbJhUDBmvz72zSdfy2QG2TX0JPssYnPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qotQYStadMTzf3BzHN8FSflZOiLb/45WOI1EiZDsdZpEJSJrBsdVIBOPNpH82qKq53G+nvLUmnwfkfFWpx77ReNOP3qu3ZceGUgvN8PBQVrK2mI1+mv6/QsGtCTTMeN2lyfLzKOjp23ttLDr+YmCNAaK9DWm8/ohkNqt9BfGwJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpfxKCE0Wzmp3DbaEr0kW7wInShVQa1aZW98dX631NBwQWNAIcDZoDXu8ADlV78fwvSnaYOIXX/xkXCmTmCX7Uf6fywEjsOCdIaJpjasby1aYOrJVNwv5bvjKQ60U53gvu9WglzzmIIkzJ2Y+l73dQ1JcFCu+DqO2fmZshoeC3lEUPBc3nOckm22LIJZprJFdqkBWDWIS+30AQMrkw9V3SUnOOE+ZiVZJyhOBOpCBm7pqGe2L5TMUXexeCeIL02006C4lNC/rCAD5m1ARYNJ/UlPBl7cgGCnTD6kPYdZ6mC/ZscqYU8U9YqN9aefpTKtS3buLcnPHbCubhM9A0kK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08x6uP2phNEUvWj4gmufpxViKxxfECs0QQ4QPhUPqug=;
 b=Q/G/B49ja5yxX2x4R42aG5s2/0g2d95sMZj1Rm1haNhHbcBVMHAFpi1LtlP7bQiZTwT591J5aB+NyufTrPIfrDBcrtknlQLdjBbmRpZfBktCf/fph+C1Bt7aCjPAYzx8zdFahlyNTyYLuW7v/tEZ3ztfAMT31hU2qDyQdmrxdGAjg6qnvKXt5vDePDEJzEkE0IsbYK1Qk8EV0mWnNiHvVnd3UUoV8dsfu3Fr00fgxeNV594Mr2PC8Jc8nXdC0nmP3SULZnrYEw6k04WEif4cJVJbXDmvPN6d+7X0axUaJ5frXfVS1cDObZrJDVHLndRlejAPjkQ7Cwc/XGtW5MPkqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0330.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 06:54:34 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 06:54:33 +0000
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
Subject: [PATCH v3 1/2] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Wed, 16 Sep 2026 12:24:21 +0530
Message-ID: <20260916065422.819512-2-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: ca1f5f5c-f30b-4af4-87d8-08df13bf5d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|10070799003|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	BhDlmiW5gOhPSc17Snasjj3htrzj9lfT6OvXUUvebwyRQZYwGGy21IsjUEoJt72UVs3HJQ6endGHC+XbIGDIWPfR1N5Z3ueRmeob967qdwra95DEPSrbUshqZxKCGfvJdjDEQNUwcfViiDDipH2uNrBckkgGtupiwPod61ItE5tbDzlSg+J4WcsZ4ytkTvFxqM7/fDO+zw2J+nJjrA5Tt1KYUkQeqCvjOjRmNxW0vpnjHNQHCGlACSd9dy7oJAlnuH6t2PBt/YyZWzUvbOIkE4DWWYUhxYcgCARsslo04MUR6VKeKCJ4dp+uQWFZ12aA3xNdyc+3HxKdezZ04bE6VBwxOdvZ4lc8vlNuHv/JI8rMlSzoXrX69oyGf+VIn2PaTNB7qvq3MA3596e3c9UcZ7HeRt8nB5iKJwnnVOzEEgi8zqvtXoXH8l7GSlOPl60/Amge4OPgqQ+qb3d6OsTknpUrSbHBd0twYC5mxGSC6vHG25DpkC0ZavVv1SoEi6PzGpwdz3GmTb0qs/3hOxy/TK6tP4BjjotDgSG36le6Fh79h6+dCcLvtMNfCt0T2FIQOIZrElO686HJQa+Fk4WZC+Esl0F6Teb1oCMCtACK9PRxsIjG20w9oS11BHttSWx4ApwMkN7f+A6h50ZDv88uP6cjPYbuMY0BFTfDT4vME5A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3FxrfV/0dfVb2Zx4SBCO9FGzscH/HS9hDhpKqoeNp1X0XGi464tYWupNbiKh?=
 =?us-ascii?Q?QWQSWJxHW/RcpCvL70kB2fdd0MA+avr5A9UBO6ijNUzi27s6X8Mkk+yws6vm?=
 =?us-ascii?Q?zX+qdgAL1AWgn5n41+8czT0idalbYfFrzgW1cgLRrJ3dUuHvhSTC2aNWojYA?=
 =?us-ascii?Q?UrythmH+EjOzSw68iCFptgPLqAK9Y4KMGyFEdbW41+3lA0LQfKE0UYtdWl9G?=
 =?us-ascii?Q?Ml9frWXUciu6qtv6IjjoY+sIYSYzIJgU6qul+YIqgajN2+3Rwy0bFhVVmmI3?=
 =?us-ascii?Q?BWR8MXod8cH6Pr880gGkr9IH5mWn/oeCR7XgJVcq7pmDpiaDh0/4OZCOcm8k?=
 =?us-ascii?Q?gvzdtLH/IpXDoFVu0aSSb0UBis/m160xrosGugo183eSluLTyJf6vxK54YZR?=
 =?us-ascii?Q?9/E4O1rY4Yt+/TXfMPZNzOY/E2HkdydDw/goeESnJLaUx/iKPgxMH1hktmJb?=
 =?us-ascii?Q?8JDLvm3X28vP8G5bjYXZoO8hybX93fN7Ury2d737DoQfC8dkF1465VfqZ3gc?=
 =?us-ascii?Q?1jDGpYfHnVsL9TlAV2ziEZPN/mSvjkbe8opZoa8gPoIfG7CibVtrZUKwdZtG?=
 =?us-ascii?Q?F4vf9obvRO5NJafIdH+qEVCzXfUIzQq9ueC3/h0X/fCZGrjEE2NKcnzbSgfm?=
 =?us-ascii?Q?fbyNhiBoQXA2X40pMqc59tjXyL2fB8Q4Kfk1gVGSRrvstp9Ts634qD3hfzls?=
 =?us-ascii?Q?NbxySMXHQXu+kXIO/fcn4iaW+iJ39HrlPHBtPex6hyVKSnRbtl7w4Dre6ocr?=
 =?us-ascii?Q?+NFpgUQfZr9PoDNkc4nWhKrPXgYlWuEvSOO2FlA0NgIh3Oy9WwQ2hgjlXOFQ?=
 =?us-ascii?Q?9xgzrxNrWorFKIqXSd32gY7aBLiD9E8L4B+Fbb2upFiK41aGr5AITLNmAP87?=
 =?us-ascii?Q?03HJj+zUoE52oLv0lxL3jrXc/X0sHLAiYzTS+1F4VKb6VQVgU+SSz/tKdAGX?=
 =?us-ascii?Q?4NZ81bdEBQvisbYzpt8ccifFTY02km4IrOqwvcqAZ065d3FbWersoiemvpy9?=
 =?us-ascii?Q?vXzTrz11RS/lnnD2/Ha6hD4hDcWHNleQ5ykpKea0fN6MplhfXZ2zyg8baOkt?=
 =?us-ascii?Q?rjisYxMZZjzn2Q11w23qiK0sB+PM4/EU9yxPK9cXY2QKWVXMi6OVCKRRz5Fn?=
 =?us-ascii?Q?+z5CirObsser1JvO/33fPvTSYAdO70kKrco7ULyV3CxwyGqisp3UXvLOgmSx?=
 =?us-ascii?Q?KzjDCqseOabPg3xUkBOT4wBO7EU18nwch/uoCnHHEiYlIQqzsbhSXMIqvXOs?=
 =?us-ascii?Q?WXXLJ2Agdmh5ZxASr0pSN20o+ybBA4pAT+EeczJQa1egRf0BZZv5RwjBgru0?=
 =?us-ascii?Q?XUPv87MUsz5PKkXhzN+cHKoMZw/OCiJUBlAVIcoxA1qLeI7alCkeiBbf2Aje?=
 =?us-ascii?Q?eOm2CCaN0KyrPVmZkrHGOhbn1sJLKVCfIUdMFsgMeg02QnLx0CJP6WXFX5CJ?=
 =?us-ascii?Q?Qq/B69lh4qoD+7nm9AK32KBgso50prVZtJrKqWQbr/uozujI6zq7VOojJ+t0?=
 =?us-ascii?Q?ErrmI2ieJWNXOyWUreYCxHjbdGK0uWH3PqHQok40Fox3jWQRgzR4pQ1V9b/R?=
 =?us-ascii?Q?/aqCAVZcjxiVngYakssP0iQQveMxR2UNd2huEkN/W55HO+hD+EZeO9JjII2K?=
 =?us-ascii?Q?2WAt06xCBOmbnlCFFS//XEb4lpkCx7hR6HeiYOOTO5kVfqJHw2aoP6ij8Kj+?=
 =?us-ascii?Q?QDKBIdvqJ8vJou7fkN9XRW2dWEPc+6rmxsFDBQXzW6rYBjHMLER9lzCzSSKR?=
 =?us-ascii?Q?QOPNoYqr7S5t51YzmbUi8O+M9FDKy/biGfo1psw6ej0KL5mVGOvDesydB+sE?=
X-MS-Exchange-AntiSpam-MessageData-1: /rMefDNQxve05Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1f5f5c-f30b-4af4-87d8-08df13bf5d53
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:54:33.7243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4zXDAiO2+hkRA0E3EJ8p0s1sa0XFYE9bh55NJ8P3wWD5EeC41WZt/GSKdbFeTBMaLnd9ERcytl3gqstfEEKQKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0330

With the streams API a non-lite CSID registers MSM_CSID_PADS_NUM - 1
pads, one source pad per RDI0..2, while a lite CSID keeps all
MSM_CSID_PADS_NUM pads. camss_link_entities() still links source pad
MSM_CSID_PAD_FIRST_SRC + j of every CSID to line j of every VFE.

On SC7280 the non-lite csid0 is linked to vfe_lite0, which has four
lines, so the loop asks for csid0 source pad 4:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
  qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

SM8250 does not hit this because csid_vfe_fixed_pairing only links
csid[i] to vfe[i]. Every other platform that links all CSIDs to all
VFEs fails to probe as soon as streams_enable is set on a non-lite
CSID.

Skip the VFE lines for which the CSID has no source pad.

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

 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb02903..0201debd4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5022,6 +5022,9 @@ static int camss_link_entities(struct camss *camss)
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
+					if (MSM_CSID_PAD_FIRST_SRC + j >= csid->entity.num_pads)
+						continue;
+
 					ret = media_create_pad_link(&csid->entity,
 								    MSM_CSID_PAD_FIRST_SRC + j,
 								    &vfe->entity,
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
