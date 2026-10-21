Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590624;
	b=KFiWo+mUve4HZGsC7YokWiZi2WAc6txRhnkxQuio43z8cCtXIfb+dg8fVTuq2KZo8LEg
	 rsY5AyJTPqQ3w1oYCUfuut/1dld9OZ0u5vCLwU+xhGHm2kK232HWld1IIUxrGMfH0cb2z
	 aIPzXfth6pZUTTV/20Ug7IR0qE7CGwAairCPJDOExhvhncjBolxdaf27Zsrr2F+uK2YyP
	 7C88+VUFrif+pivirkFah6djMk4ITJZXqHHR4w0RH+TTfn0s/itj/ctstv0O/lmOcapop
	 QTG6beVShzpDIsT3F4vHhOKRuAlbkVxCV0ufkiJNe9tHOYgSZWC7SkRvjKpRbka6n2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590624;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cMR0hmTVgLU3ksdmk22976ItkNRIxkjEi1bsA62j3OI=;
	b=YrvK+xvYGTnvdzGoL349BbsjyyfpWihGqv6tZt82AgdI15ScLiORkLSET9bDmpNrxABJ
	 geek8vGT2V47GtAcFXPzHT5eFGywo8IOH3HJ7S8TeX7mBVUwlW9ei59S6MgWiJSW4lg+R
	 3rKgILBxeG5bkcnqZLmNKYy1uf0QbBLHX5AQ9sEdeQihoBgIiJzsOu4bki+Bk6gbuEKhq
	 pVlltEb6R0/vztiH73ZI0l4T3GUoMyOhC7IWFWNSMjucPrGsCqwlvbnDzLVUfjRGGFpFl
	 XglkcO+iZXxtHprjbVeec6tDuML9f4CMca+7ZFJRxF/Uboo6EIEpoijXWYvC/ijQ5hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.107
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021107.outbound.protection.outlook.com [40.107.57.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEB606A33B;
	Wed, 21 Oct 2026 13:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABEB606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGOkGnOQYpQt1JuwqVy4ENUEpJ7CEgLlin7e2/GFgEV2aAwht7jusWsoMu513hZxpEFO0Ji8w2xLcqfV/zFyQD2ltZOnZiH/eF4npJmeBILuMUI7B5Ymhc7XoqIwnpxP5Kd83otx6tXNbD0NMH4uyIQ8kOPWe9tLRSibtXjBT1eyNXIQFgMVHSoFfGebT1nN3IMnvK/uwnfDV51AijoF2eEzLnBeNqBuCmdCKWtcGuX6dn+5dgfLOoYyyVHCyJyojukm4tLWYTqzKlWUAw9t3pWXJMBIWjbc7pz2ppSe+A/p9wSKiAsv7OB2rRgfv3jp0fmERAcHnyuepf9cHrfSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMR0hmTVgLU3ksdmk22976ItkNRIxkjEi1bsA62j3OI=;
 b=eG+K4KHuxMw2sgRFz06xtsbzdBNhoUBcXa7lPU4i4xZVvRijMG+cfImvNzlS5sVmK9wd7l7dms6t6IyeFn2/SRsMT5G8ZNCC11IcnngqjXss364Npfq/7uLvdf9r0/fsKf1vCNvpNuDSIWLoDXJnaYykys+mQhoOMsILk9tkX89rzhv0Bh5Aatlv1ATlhpAb4jfN5ueqk/ghkIfFvv/oak0TRhkaJQzAO9YJIp5iBS+iy0J0hcFYnZGZA19dVb+HQ7zzyjVIhVeerK8rolfULuSaq+QYcX/S3d2YiU5d6AjPDTkOiFx90vVl2vYd9r6GCwACkjcDJ0XZn49G0fq0IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4418.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 13:50:20 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:50:20 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v6 3/4] media: qcom: camss: Enable the streams API on SC7280
Date: Wed, 21 Oct 2026 19:19:58 +0530
Message-ID: <20261021134959.2599575-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021134959.2599575-1-hitesh@ebytelogic.com>
References: <20261021134959.2599575-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::21) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
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
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4d4ca6-f026-43e6-ad58-08df2f7a3f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|376014|52116014|1800799024|18002099003|10067099003|22082099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	T4WCcoGf12qcWfb7/1hZiNJLlb6g1JfQjMESGs75hFAvvcSW/Xu0+8CYcANUKemhC7t3wqtiL1z0CSkUWwRK5hyqxyaK4b6hTDKOyvhQhdEtVtt9u/cGufp2PZYRFbvYdi86RBeJrB5hfqRLtV/YYhOrnZlfwIvSI1PRBAN5VHj/ziPTnH+/XaspMGDmcWvf+R0L58NumnDjvSgVMg6kCTpch0NEl/mqjHA2/VpMy3RqfEk5R8fGJtkTAOCUTp9sBcTKXdlhjjTDpnUBOnqNj8TL8s44N4By5EYQINg+INpg0TK1vHeyLC8SyneWydhOB16zYZVhjodO9q4xEwe6rB+NGiU6WMxmP6Co6anu3WwFPBUtfrj7hUUjsA15YWmK9nrDTM5CjzG7qr+yqdK1WrteZHAFzxz0EsENMa56+unLJ61lrRq++STcavBgtqwzSo3/kkUJFNzif2/kCpR3r66c3/bwLHTR4BwXDye4x1v2v0ufkJeOwDZH8iqaYl/Zl/D87ZQAHKQdbqisufcPUtb0w7gHAEiVPbTfYAipFeN6FhhmQfO6tmvGC0uYPPOUcf4WDJRTvAgZ7f0YZqU8OJ+ntmtcfYATxZ0B6XeNXGc11fJx3GDNnERHTPcpAZzos/rwoeMow1kfQmIFQFbDPDYI/Stah0CcsidWvrnqLj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(52116014)(1800799024)(18002099003)(10067099003)(22082099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cBUaQJkBZa9neRazgTaRoStO8+ENUhDj2jfN8PA8CXT9bPyWevR0UrL01b42?=
 =?us-ascii?Q?+YRVkuGC/nQxUIKphR9G5CUlxxkJHnawDVGbZQH3S+ePoWtSvNI6NW7B3iUB?=
 =?us-ascii?Q?zl6nE3oqdssuzpXAlW540x9llJqDh5zmVH8ZAtOI5/gIb/7wb6LGZYVI7B9C?=
 =?us-ascii?Q?7TxR3LGZgemV4ADV1E1EUvR9HuCu9H1uyKDh/64bOmjpggznf5bBOv2kSsDx?=
 =?us-ascii?Q?jHE3OPcLrfuD+5MAkwoT5Tk1m1KNAtRY8p9oCbMkNGy7ISd+MzWxQwRWettc?=
 =?us-ascii?Q?aB0X0pGgkXAaq+SVEsNbh2Et40PrTC0J+b6SiPdQ33+s/WiwmluppEIATERV?=
 =?us-ascii?Q?uYxeCkrjOb2LiWUu4qAO7nEKaJjowjx7G0bJ/j5i+4ctM4lGRi9vOG8Nraq3?=
 =?us-ascii?Q?qi3jOXFFsDM11tlz1Mqt2xp8QP1L3gAD+khAKuBwLvMnY4OUZxdXqg8FL3De?=
 =?us-ascii?Q?s7lvdNzCpqrX81sVNfuZ7TXkjbOc0XaYm8hWjLEqPxQR6sLCz54coIL59gAa?=
 =?us-ascii?Q?Y6WvHe3LdO4LWInjhxD9G1BMjXvF6UePbf266M04Azk1WDit5rE7KBH+pl30?=
 =?us-ascii?Q?w27y9HOwQNQc2kNMsa/AjhSEKdGOVU3/ZffLANOBAb2RnmGU/kblhSF5Y6BZ?=
 =?us-ascii?Q?6PvFrorhdtEhMoCtUyRRO/rE39ykhaWVx+F9d1jG/GkDgV8Yq1k/h1/tUR+O?=
 =?us-ascii?Q?J8Ei26jIDxfU8AUUkSU5X6KqzbAEHuUqPJDFh7onaz87HpvYoZEAu1QhkdiP?=
 =?us-ascii?Q?++3VZ5JQ4rYNDcOK+iSpCL8fyaN26P5UGF9tLjHusoqkAHgAZ9MyKaQlEfDN?=
 =?us-ascii?Q?OBd/Z81a5QBEEzvMqVyGb691YUWhRPlN58uKwkjrlhcIS/Z31JEeEEGE11BD?=
 =?us-ascii?Q?XJmKl/VmGG9G39H6vilciihvSIYx60/wxlMruw0iYxzJ960IiRxdXeRe7EjC?=
 =?us-ascii?Q?VfubWhyvwTj+9XVIHa4nGT3DIPzYNIliN5GgbOhkkM1zBrAKmJvW42EkN3TW?=
 =?us-ascii?Q?6qE1euOaG090Ur26kKHIHPg1PJUAhQUPkcFLyJs888EJvhX/gSSVn74N8WUJ?=
 =?us-ascii?Q?WYyyZax5tRlZbc6aeMvX+DZXkYy4NDcPbq1anrCiGi7jZheObbNglxOGAYls?=
 =?us-ascii?Q?NvJQs/avrI5YXZhgH2ZtT3M4jO+7EeCkNWsKwm2VBHLu6pDZBHFOTXGGOA/U?=
 =?us-ascii?Q?bt7QaYsHJ8tno278oZNpyMYQ9641WghArU7lkocFv9//WnUmoopoiewPHKeV?=
 =?us-ascii?Q?NHZA67ilXpfZo0YXqIeALKnaG4NHdVyfK8Vp7yal4pPgOPhqv4BaSIL5CT0S?=
 =?us-ascii?Q?MHIngMltO55oQFzdYq8jWag/nPvtXVdE8GZD6xgXtD5lfHICDQ1mKqsYtVDo?=
 =?us-ascii?Q?/SrYDJAXyFpuqcYmdbl6mNT6ki0QY/+ZJayTE8KCeJkyupwHX7y8QiVW9k51?=
 =?us-ascii?Q?l9mzasYzZHttdLXQR/F+Rpa88e1xOOLU25UqWksQkNDYk6D2zGFzgW161yIi?=
 =?us-ascii?Q?kqa+ggjgpgTqvugObFgkelIpZIiAfHpqfOF1Ki4BWyZI9uCil8gGZWNmA8QI?=
 =?us-ascii?Q?IvYdidXGwHmIVVeQ8Dk6JO19ON6MJeYiQRodQWLL9wZC4fIIaCMSCRzd3T/Z?=
 =?us-ascii?Q?mVBaHTZNpxfaeBihVlkfkGnmJdGniAvMkcVfU2usz/Se8T0CQzflsk6uZneY?=
 =?us-ascii?Q?sRfiuCFLaEY+bwwD67k7DHXzdA4udckq6Ao9w4oRzJ65rCNZmjqSbf/h+JsV?=
 =?us-ascii?Q?xrxAQmGm2H973HS/LUETOKh1X5K2359ysSsCA1M4IpbGqWsXsysZjNbMLvsp?=
X-MS-Exchange-AntiSpam-MessageData-1: c72YINEmaXRcXA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4d4ca6-f026-43e6-ad58-08df2f7a3f3a
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:50:20.5321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDaWcWum0ECimpl1R0lDB+nJYChBEJxINKKhl0DpNNkB9S+qLdpLwwEvfOdVAWHGLVVCDkp4S6RInRJX85qDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4418

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and each
can be started and stopped repeatedly while the other keeps streaming,
without the WARN in call_s_stream() and without the second pipeline
tearing the first one down that the legacy s_stream path produces. The
CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2c9c4ce5098e..a9bd79ca3f11 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5760,6 +5760,7 @@ static const struct camss_resources sc8280xp_resources = {
 
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
+	.streams_enable = true,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
-- 
2.43.0

