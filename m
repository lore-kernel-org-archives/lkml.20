Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.85
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590627;
	b=xczGoQLBf5Bxa7j6pQ58/gHKNcdd8EeJzIb3Krvo83dipUdVkc3ZD+1ofs2tKkzmYhjD
	 pj/d6uZswPtBXzd1a96ms8xJ0fG1jTGLuESJ3Xi4cZF8h4hlDkypMKnif+pdH1QJ9mMGM
	 VeUxOF/xyImMt7OKLEHxjvheQrwIJZW3wpAH9R1/I9kqOWJwex5Pz19nIIQgOe0C2etex
	 nlQsxA05Vt14JmMuJUEcDHJg+cZEdnbiw7i3iRmc54H91Twu9wQA0iQZtCrndC6OLf4gN
	 UJKvufqynpTnOpa8bAbGuychhIqaU/QTctQ8fqZsnOgDs8gNKa0EIX3Jf7tN8P2iKHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590627;
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
	bh=9CXSJdiR+Zyv7nVfZg+lvO7eL5/B7N9AtCktBmRg1ws=;
	b=ZN/gd/kl+GZ1DsqXQVSR4NRu8lXK/RRaRghP1gICp6zuM5vtvYGe4CWOgtM7V6oBk/Hc
	 6pm4akdrbKL1Hork1N2cunR8op//EaFGIIXkWlOvH++rQT84j03wbd66SHdxY+C6VumvO
	 yGTdEiFhf8qUR5dg264fmvnKh+6ZGtaxv8cMLSXlAhuaNuQIVx5D4PYsuGxDQmetB6Cnr
	 XEbarjGWGXZ1kJ8Rzn39JPli8lYkr5szEFfe38bB2r3nrHjtIJWhIRvgxcW//H/sbWWFk
	 BtLBYuh/I93sbeY4ONmBWAtXA92Id7otklFW38m3EsY76YxP4RgjGOsYDwLvPKjTsKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=ebytelogic.com;
	spf=pass smtp.mailfrom=ebytelogic.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.57.85
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021085.outbound.protection.outlook.com [40.107.57.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C33606A330;
	Wed, 21 Oct 2026 13:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C33606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5NPCsj6KUB4R20VbjfBeAO+0gpztXDbxuzr9Hn63kxADEUHfaekTfm+0SWmxPtyhsf0PKOfsruInmIcAejBT/cHRRZy6KGSDHyspWDg0/Hq5DbOUH1hYn62jCpoHAyDFbMiH5ypBy0HCqBcjDJN6D7ezAh8b/EjlS6HWxGlEUsStBiPgXxEe+yv1lyWGtCQrA+sbarzFFh2DNlPkkAiEGzV7vwHI3YcHTiEDV0D33SPxsRrUboaQO07ZJB1GIcYoox2vMb8xE14bHR6UrPQZ8JwySsBqnW5AsRebvwdA/chF9r4RiA8A1VyFWL+YFPLamJbq7wajoD6rFqi5IRv6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CXSJdiR+Zyv7nVfZg+lvO7eL5/B7N9AtCktBmRg1ws=;
 b=NVyzpDXVAXE4/MjldDl8/k3SptL4IzIULVYQgJvwk0VmAD64rfZ7opMJ07Y/lTSo7Cq63zr5SqP+muBI9YtgEJrYqm2pAeg9s3rnFvJSaRZNETrxzUl0MAMTVWo5mxxVmvQiGx16zkhjwuQa3F4uY6XRuWNSYetnTXhKVW6PAq/joqrdsQ/smLIuC7eL3ANWBLMHjWlnnvQ6yTntiv+JZs0k0dfy6g0XM+fDNTH14lOCEtoVWZ2NNpsJlyViq9OzBrAOfI53gQ2SdAGtKVCxgWOA0ssC2BHJxM9fI2r9Us08VdvIFvcF5Vaa73vZbloQiU048GMlZB7TwMVKZbrjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4418.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:167::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 13:50:23 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::4cf2:bb74:999f:d6b8%8]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 13:50:23 +0000
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
Subject: [PATCH v6 4/4] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Wed, 21 Oct 2026 19:19:59 +0530
Message-ID: <20261021134959.2599575-5-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 11283caa-86b5-4de4-c177-08df2f7a40fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|23010399003|376014|52116014|1800799024|18002099003|10067099003|22082099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JH+cZJOJMsws8GNkQQz8FuujP1eM1wAD1brfBQPqz8uFq2MPAEedyhh8Jrn7VXimHbExIVtln//uv3U1qTYwIril6gMD8X4vPQ/AxPIG/aW/N+hEuUM22ocfYFrRdxjRpBFBtyA/91qKzm9+MzX36A92bMFkLYnmDkgD26fv2PJ7J9Q6Q6PzizrQNVl4Iy8ZMp4YEDZR88E8+Qs3X8pSwN3s3X4bpYAvE9AwF7zATR3bA4jugTgTaHBCxtVpFrKqteyQ4e1JuF8ZUspQNx4syEP8FEULTi+r2LJVdQY/Fqd/9oSIv0CFmsQPxI0u6tVY41/NlHxRGDcA93eFwjtGATygqI+itNhFGgsFuzmOM65GxmNsIm426w8PcP0bHImv7KOxxfDnX/Nx6w6ojRYGneWR7hLTTZtRNPVwJJL2x6ERZbPQyLRYR7F5v3K2afIbR24GUlXqAyuNj0sifVxrBz17g4mN3YsMcRrIaVbmrA3Nb5sWHjBdBLVRkDGKEwrc79DQ8QtYLkHcPic5nPjmVLh8BXmq8rg/l2Xu8UuoPszUz6LjmLVCkmhKpJcKpsUPrWyMWOzEp5y6QWheWzrQjD7+R53mjkVS2IBawL9qQVxYSdzRvyVpX7oiCLmmYjza46ln7c0M/JVTjbAbWOd+lXTP/k9Xs/tttrLh9rmel8U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(376014)(52116014)(1800799024)(18002099003)(10067099003)(22082099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1/kXQExF6ItwjTsOiXb/sjDXYQRpF0gBhfLN+ZNh3bky7NgIG5FZs/tHWUkW?=
 =?us-ascii?Q?bEVrh+VvGrDHKV32O9dKxcpA2gp69ixvTzp2vOiYZFVMC/+7uIW4vDXAmsWS?=
 =?us-ascii?Q?hV8vIDOu3RI9YsX/Qb8n5Z2rJvH3+kSXWs8c2370/3fj+sTPm9qBPJGMfYQS?=
 =?us-ascii?Q?Oi0Y08lVCZThXPh/ERlu1VTojsKwCkeAMfsnoD3BLRVTfmbEHczUx3YeCf01?=
 =?us-ascii?Q?TZ4wKUo8Cl/ocnOT/ukmXDc8j07zfrJ5k3VJMPuJAUskmSpRHEL2aQvKfTW2?=
 =?us-ascii?Q?IFbOfUVZ64IUBDkRlZBAVLWQB7s/O6HCfxXCHNs0LxFmKiBbds4oEc44MkzZ?=
 =?us-ascii?Q?KPbos0K0dSGTsOoWXl/OMMZgz8G5h3Kl9eLp3IZolP/heP0oeo/GLkjY7N5/?=
 =?us-ascii?Q?gRVrNGSWuVGAn6SMBRRzJMRMegPRSppzBjhAwFbafwtrDfQuCW4EubDAajL9?=
 =?us-ascii?Q?BDPoETdjXpkg9AHOMrnRXRD6JqovJQmVESkEKY5eKOjOM3oTjVaZg4aYuNB0?=
 =?us-ascii?Q?6u0lLH4Z9aKdHZgNvdGdMVarCTDGYaL8BQOL+8eCH7jg6hcByozg+6WKTwgU?=
 =?us-ascii?Q?CxZ2xviVD9ATohyq5bs9UZAxAONFAmBoApcljDmpvOhmH+rm8QdQZIA0vrMr?=
 =?us-ascii?Q?zd6TchneFOIxHbtbUvibQlXryk9FPDsrw5tYf1RUs8Nl+v2XRPmITH+rW5ZO?=
 =?us-ascii?Q?gRGoWPh++5mevBhNDrhkZGGoSF94vKI21Uz8NfNcSgkNVhr2lQgzj0ltRXSs?=
 =?us-ascii?Q?ouUXpcrHfm6gMnp4cgyOcqMR+zQuTkKlLZlBAwKQKdQ0X76uOCqCtqSh/Ed2?=
 =?us-ascii?Q?+ul5Pybb6349MY5G3jgLEAv0aNbqnSmJIg+k6PHN0HlZlTvRS6lHYR/aKKZH?=
 =?us-ascii?Q?OmVc/vcEXqxTUHO4/5Lp6RnAanc57aIho9NPoSk6WUJ/hSfldBL1ESaYSoZT?=
 =?us-ascii?Q?w4DN44NGm2Y00wtoHwk7105XDCCZfCeWRG/+amLlV21ZcvHolD7/2iUSAKDF?=
 =?us-ascii?Q?RI4+/vChPsV8OdHmf/XYx4LvPJZ7M6rWnmQXke0PzuzvlBftdWjQ6zTdQTsJ?=
 =?us-ascii?Q?OzEjnxQgTFm6m38xK2oRRYWSdrd8EEJ0EvdGCr1fDb4ztMFqS4qPTt45VjWH?=
 =?us-ascii?Q?cuF+kHZmOXINhlOAqqeLXEbBw0l+L3DGRbkqTrODMTI/Q87htoliKBh2Y287?=
 =?us-ascii?Q?Y0cpmIPinPO9f3CRo7nJpht08ZTk5h2g/SwQ/X8KYzTjUFhjXkicDOt+AAxP?=
 =?us-ascii?Q?oPA+L6aXWlJrr7usuoMeH1kisZ9Wm5UXYTy7+7EZhqHyscsPDzBUV7+D/rbL?=
 =?us-ascii?Q?+LZ3Hre+0XkwJXL1fW1SbJV4FlowG7x9nnb++UQ8Dm/X2CoFcETwsDBAYcui?=
 =?us-ascii?Q?SkbMadfra8yZKSt1GhlSql+z7zqvSBI8g+nym27ieXNbJsny2mHRlhfuTmfB?=
 =?us-ascii?Q?0J/TvVQAiqAlnN8X+cIHbdlFvlg31WqCAXtCAfoyl0qqWEF77J5dnuuMZRRF?=
 =?us-ascii?Q?FNoTMhsdgxO9IJMsb9gv4Kchx7PP8B84BtdSJLZKOgy25Zf7t8qZtES0+W71?=
 =?us-ascii?Q?VvM8WXoMODRa3f57PKBs/zR20SmlnmLMOgiVn0dWMqSwhN6myq96j6M1WP+j?=
 =?us-ascii?Q?qtK+NIay+ABAf3Y1Q8vZwABDNAug9BTSe0FbC5NWd7VUGKntUfZcQYwkLZ4K?=
 =?us-ascii?Q?vuuOgTGKVCkamYsqQSSFNXPtMvRaEFesuzbnnG5b3zN8wvriZXINe/aEBb4h?=
 =?us-ascii?Q?HU1B2nUYpO0SHM2/kZaKU9k8LHtQQwJZSjwKP5wK7brF+BnguQfuBbmlleU8?=
X-MS-Exchange-AntiSpam-MessageData-1: VnQMIcmZA9kiCw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11283caa-86b5-4de4-c177-08df2f7a40fd
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 13:50:23.4573
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcZAIMD+MWImpHzdM7VqVhAQQ2o19o127Ca+GLv/AEnGEsRRadpTSOlEXQh2MtDmV9e2KQ0HaiCbgKmArduPHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4418

A non-lite CSID registers MSM_CSID_PADS_NUM - 1 pads, one source pad per
RDI0..2, while a lite CSID keeps all MSM_CSID_PADS_NUM pads:

  num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

camss_link_entities() still links source pad MSM_CSID_PAD_FIRST_SRC + j
of every CSID to line j of every VFE. On SC7280 the non-lite csid0 is
linked to vfe_lite0, which has four lines, so the loop asks for csid0
source pad 4 and the driver fails to probe:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
  qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

The pad count depends on lite-ness, not on streams_enable, so every
platform that links all CSIDs to all VFEs fails to probe as soon as the
CSID streams support is applied, whether or not the streams API is
enabled for that platform. SM8250 escapes it only because
csid_vfe_fixed_pairing links csid[i] to vfe[i] alone.

Skip the VFE lines for which the CSID has no source pad.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a9bd79ca3f11..4b73f8862749 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5028,6 +5028,9 @@ static int camss_link_entities(struct camss *camss)
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

