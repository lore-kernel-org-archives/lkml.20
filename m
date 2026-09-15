Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020140.outbound.protection.outlook.com [52.101.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C61F4B0489;
	Tue, 15 Sep 2026 12:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474553; cv=fail; b=qqeshmHQrTOLndlaNmgJlscGnWXbeoX39WRDorsb6T1xlcwcymuXr1vculHly0UU0sAYql0eblxY5r29sIcY/z2VnV/fTI4eoI9xu9rJkC1ShJp9E3vH49OGscvj3vMM/vNopjclrXGXstnmWb4mYxX7mYBfreldlkVtRJtlkVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474553; c=relaxed/simple;
	bh=Q0fgMV3v/wwQ9jHi7chIPHtwhLT9VYQFHm3hF825WHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sAXyrNiBtBixiYUUnsvAIGmiOpw+/cVc8Rk8xeYQAsyMLpSods2ZndtDbDaHLEApqWL7zYBLy9Va2WA8Jq5XSDUVz8r+F/Zivvcj12s1ejMfoGuaTJiC/M/R4GlKtdjDNDqHVr3morquhEjAjH2WzFwCg2Yn1Tgv05d/T0RgNfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCWicXOtc250Fab53L5gHAV7wonCtk5wW8HmEY+ZYV++1ZuAgj4Wj+LaVJz9qN3bN9Y3p7uekBkjkqKQXozA4mAunEKRbjOaqsEB6RZFPsop/hGSgfg3FGVXFOrb5Oye1GmLt5AxTjSplsWVnrdoTlU5Tlybg5FppyhLgUDTzfQVE1scfU6GplWYj2YUw4WW6QmkysD8U9FBlBGhKAQ+lv6VQey7mhtGiUJlkgh7BkzlDGG/F0tPW60vDUkzfEbUU7gwlf5xWuOhl8YbHFfnhQYkcIGBqhmg+lV7PqdWiUYlKE6AWn9YJeyZw7zvruLCelQSCkL3zQzZJZ6ojxfJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nqleGqbuZo9PEhL/Sbn9c667T8NsEgvfXwrfJq7ssWw=;
 b=w5D/LIdGunOpekh2vvegMoHP6FplPKJV6FEnt9C0tGnU3ppM0WQf6xj+HvZTW4Nf7NtWpnHGWhHHYp+1I+cS0a2zvtKzh/wWjQLVLX9kyMcDNC7bgZNURox4qGGOBR+sjRlultvVmauFRsc0z1X2pFtHONc4Kx0hT4o95ihTlGN3RY6ejJwXWqBYIj/5ng3SbNtURmLbLoVyRHKtTtHyb7K7LSsG0UZatLMhM5QS6qegZbzyCijUrvMLXpFQT3Xk4trYFXWrmVUXvasDR0THqF6JO3MowEEag4tWph0VosydJN7NQRqdtajgv2L+aaqE2P5dDMcJQZSGOGgWQFOCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:15:46 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:15:46 +0000
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
Subject: [PATCH 1/2] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Tue, 15 Sep 2026 17:45:35 +0530
Message-ID: <20260915121536.19207-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4a503dbf-caae-47c2-963d-08df1323128c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SxjsLcXITvwAHs3GYJi/ANkFiuixKYA8yXwfW2+tTjbuPdVsWDTVFtZAoP+7bsqpdpBFjABrvc1C+++6L1W8jxL8+8xr6yQcNVCvOUpRQD7PYbeXj4HUAJJ6XomSNq7nya5pj7AufPvXfzmc7WbguHaMxMCQyI9wgIQAk4L0Bd51OMhXZYFg0O+jYT36oTLNvg4Tgwf26FPIM4au61jJaiqq7AzJnVeOEDh+wXlhm4ImzquPOMfvApSDOi6z3Yu/Y//M/pCIJw4G9Rbzk+nS7KJRTTK6JoNMOpHfMaR/hSbACnhPS2mWLnBuoj5aaUqqJjyDID5lFXnD5OBPaWzmxP37QC2DVALrD9tMOD7ptT28iLUpv+pzQTlwaU5S9IuvTeYf9IoewxisAD7wEv0Y/Oez4pJpvp9Hen+/JJEZB8K4gLJcryYBUZOtLZxD143I7hSyQbhnMOvXfka/DtN5UR7G9tdac/7PxqvrdDNXGwFuNui8y1lVhETGPX3nLTlZVcjLmESJUhkVfqMzQ3O/2CLQI8N3EM1+W7TRL0LB8QskyH0pI0zt3UAFay/Laoj7vO8Fh5eqYzNtaSdCw4TCrgxvxWAS58B7y/XuV47pJ7lPTeC0Fsuux2sWaPIFThYwk1aEYb7zP1DBySuDEmuBIi6oXLDy9rjQ2qGVL4CuT6Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AHXsgUVNM8E1SZnqa0XGAhfT0ZIAo7rjRZdnMGN80dX2J/meXrleHt4mKcYx?=
 =?us-ascii?Q?GzvJZd7uyRTPeBOrMmJM8EokEsAqvZsoIQHBfXmxuKnWBKwZiNO2+3K2Vz5q?=
 =?us-ascii?Q?lzWzuZMszqZ7vhCmGITPu3YKdkWL9Nt2LntK1YzGhzq2G0v2pL+DpTKqeJcj?=
 =?us-ascii?Q?d85/nycdmOJuUCpU8RSycGQZqx0A2Kgd5VDLbt7Ju/bpEmn3qwGqq8wXaNLX?=
 =?us-ascii?Q?50ezIs4SXefxa5nZvhTbzE5uCncdVpLu7QbQuAkVNzRlLHkQ07NC8hkwzN+9?=
 =?us-ascii?Q?kaZeS68laUTk1n4DIN1S0X8jl0232k+nF3fWVpPia8uBZQYy6a22/1TWhkuM?=
 =?us-ascii?Q?msPNOU26RgGNkgs6pWglVYaqmZp0ZDhkW1Z3gOUxLthhEIi9d9l0ETMI3+5d?=
 =?us-ascii?Q?2jQbN4PtRWiqIpl64nJCGU2xMbtmGGcDd+lsu8yT3QYNScFRMOQxrPN+AHnr?=
 =?us-ascii?Q?tBggbVLU4KdMnYr9jnNRkX7P92sj2O79xKpJQYDVkNHOn4nHTpR9vItR9iWY?=
 =?us-ascii?Q?tZSpl6IPFDMWyhVLQP+VOwG2MAD7KeWCAnMoa3g+GXJUivWSxbMcPb+z0bnX?=
 =?us-ascii?Q?/w5Ptkcx1JYjr6fwO/mzvm6ahZ7rjasDnzp6FR3lPI/oN/cSoe6fWg8IdYcB?=
 =?us-ascii?Q?Diz1nCsoptwyqQw6IEhFYOf9Ewy0qSLG2OCev+piUDyfpRrQ8s5/AkNXnDYY?=
 =?us-ascii?Q?V+G3m6YZp1umv2jKWqHyBCXE2LUXDol0kDYJLpiC3sYpIg1GWvFZJJPP08k2?=
 =?us-ascii?Q?+AyMoVrJnppcIDocGl2s9IhZ4woHwbO+Lo1EoKDA2owBj6frQpZZYPlWgU92?=
 =?us-ascii?Q?WIyem8inMUjAu0cCk3b/br5b53PIKzT1K/N2h/QwZPPNj5d+O+RupvGSLG2J?=
 =?us-ascii?Q?Nm5aipEf5AmjHhHIrZAU+vZLBSsPmTMnMfdt6+5K4dlZ6sbCy2617vDn28MQ?=
 =?us-ascii?Q?N7mNVvGkyElajrv//o/tSPtouoxnjD+E64vH34NzhPZdm2VNpvroKONqxWtc?=
 =?us-ascii?Q?klQ/6s8ADoJPMXBxeOXGaICGJzbURJCti1DMO4ARWRRmxKI2xxF0TeNxYcl5?=
 =?us-ascii?Q?AsaHJWqAFSw0lN05NkKoLNAm94ha106QeEY7UQpIKl7loKKLWMdLoMfQOzc+?=
 =?us-ascii?Q?jTXnzCP/byUW1N0zaJGrM6ShZpo2gdgRWcjgaJjvcEw1BZxZB0jlvb3hyxgh?=
 =?us-ascii?Q?QbCq8WQd2Z8PBuqWa9PNc/LLFQNniZ37UAfhDdH0vkIW8+EfTWdgGx+5ZTDq?=
 =?us-ascii?Q?hETDyU7vLNlLuovYPu67sBKSb4WF611ylrdbozQ/G/kS/c4r67NygtfFSuda?=
 =?us-ascii?Q?cACRJhRIKn2GWSsWVEnjtCHA9Sa6fkmpigZvEeyueqlb58IUg4hAM+bO+MkZ?=
 =?us-ascii?Q?azMnVdFB6xF5/84yMYQVnggo3y9C6198SOXvttXlB4ZnlFzuzcRJ0wfYBlac?=
 =?us-ascii?Q?JlVhe+A6ZJ0ETubxCapb+RZvWHVbq4NI1q0+x5WLMSUb591olrrjBkVOaxZG?=
 =?us-ascii?Q?zlBrbt0r0W9qTSl5HBb8Q6WgHc7amPJQzbDWaoDyYHLWzExA25xYXQ3LnlDL?=
 =?us-ascii?Q?TSCVh6E2Khhgdkizm3ybUPB39qmWfJpX3Jh8LKWYKt4aZmp+3dSQV3Y1LN9g?=
 =?us-ascii?Q?3woOUF6N+mKHuv4n1CsRrAKpwMtk1ZISwHOjAywT3qIB/aiD+sHd5R13/qss?=
 =?us-ascii?Q?DxSjjXhNyFfr7KSFj0ijx7fkm6yGwGGN5Bx6LSTHOTLkumZFnUXCHR83hjLr?=
 =?us-ascii?Q?rPfX54nHViPZPenAiVIZpvqPDzd9yfY9tsDqpNpNBxhgdpl3cnaz7JRLQ+7r?=
X-MS-Exchange-AntiSpam-MessageData-1: zihgFQSQDfxD2Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a503dbf-caae-47c2-963d-08df1323128c
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:15:46.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjotZeTgd0Hok1JydCSHCKFS+PRazeDfwdbOxFi1MH55kMKi0/u12JUp1zg0TnXJzvGUell2L++4u2oSVrnzYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

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

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
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

