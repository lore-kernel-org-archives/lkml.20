Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020125.outbound.protection.outlook.com [52.101.227.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF373EBF14;
	Wed, 16 Sep 2026 06:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541679; cv=fail; b=IFEQ22dmGgnbiLmzuxrJzDtf4T8eJxJFQ8BFJLSO091OWzF0Z4ca2KtMV29LF+TlHOKHzFFANdxJA2C3QwzwLWRdODsUUSeaIal0yVP10219/fAt2dR0pGBy/nVDiTOxOFCEwblGpLyPKLm5jDN80eFxEiw6yoHBr1LKx82pjzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541679; c=relaxed/simple;
	bh=VtiR3AuHX6QzvwAUlQXmP78r6C7ZH+N31TX1REZ8ZpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bxdKVzqMsV30bB+6sAQRGlriPB82sX1kXWG1BJR27R7RmMurGAk8cRVhy3CaZoAnihMNU6tJicjFuLLR7Jbyz279khx6Ze/OlYW2AsdPDfePuVxF8Dvi7CJkB+Ql4fnV2bY01melkyM81MrOBF2PCf23sbShzLhUcz6RsZe2SHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sh1me10v7HIOSeAy1gnzkb+HZq5yRaRY07ijh8zrvWprxD7tmgFEunjDvVJTuP0oTAHnu+zPWg9iRvrDbvX/PQbVTfgfah+bZx6Q/gVwDIQfdfmPO95dj3QMZqrMNVXwI5BbXhbGRqUmuQ18jkOr/XqZceJ/Jy+88oiH6EqjCmp/rM/9j7TmW2gRFSMcSfZizi3RLU34bady5p+0HqJLHCe2BGrt4edXmewy88CH/zQq8O52n59UA9RB8rVqNNhko0EKOFydd4CFnenqc6591XfScJ0/lHOAxD+knRKLQvFqc9Gbmv2ttYkeBxEzUrO8wZ9v1NJ9Caqc46nTaSE5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/yDBR/xwJPqkPU7DvOOK0VcbPejxD8fEwysZVpViWM=;
 b=w4DfsBXKt9xpsWrAPrZQjgrK4ZjxPbB3xJnpjHYt49vYXnENSpsPUT2toOPWB6HuYezWqr6KOMdu6aHj3BVb3qnSpL+ImMpIJeItc1+vnMrKdi37Bm+RB2aKtWeii7LrDh89UI3TnfK74NMGBy+PajLK0j+BICBHZjAvkLpZOVhsb7R8n5jlxZPN11e7HTQR6DEBSk6COTop84p4W+FfCmyn8AkiDeGwcGEHC0PWJ5iIbIAAl7mXMApY1apoidfhz1ESL3aqcCh5eMQxTUQfJd94f6rkzP+ow1ptGtSN80zKec0hsFL27PqgS4qgEqA3RaTq0aL3vCKYs0TBoHWsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0330.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 06:54:31 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 06:54:30 +0000
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
Subject: [PATCH v3 0/2] media: qcom: camss: SC7280 fixes for the streams API series
Date: Wed, 16 Sep 2026 12:24:20 +0530
Message-ID: <20260916065422.819512-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121536.19207-1-hitesh@ebytelogic.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7b961ac3-a258-4d6f-4938-08df13bf5b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|10070799003|23010399003|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+ESixsMyCOK3EaLb3Lo5Nm7FDIkmqU1Gj4XTJfz1HkUR56PoF43ylAcQuUT8pZxupH/qgA4Z5vQPJA4+y3IXGKnAU/qhEc+nk2VhSY04ooVebG89jBOJ5aSoyY1bN5vE2tcEUwnFPEZIT8SieiU306wug1ggbw4X6jYwr9osA2D3o+aeuQmJjl0c5+Udtyw2vopxN5pjswkrWAF3JYpZxbG5g9mmkOmDJKYkPHjwQuzGc4f76F1nSh+H3SlyqYhS5FrLF07610GdMWCyBHXRLjKj20Ilg8WENlk0oeajiC/gbdt40b06kw0ZccXJnHVqJqaJ+tIANqSYFMTkVnq3H7aBfGk1Nf0dKdRdKhAEYmHUAiu4+h9kwRbm2Fq91r9o8+exUgageaxV9nBK7Vrf14HVDw1fACwB14u97JyltoU63/2JFtEi5IK14MrW9Pl99duWs9OUG33RsCtimZVn/dJqIkEst4OEcnQzdVhE2eeXO3BhJymVnXgC6J4WRM1BbN3jH3wvI0972DHfuAgePJsJyuD7AGMrbiqKVmn3BJjQUo38U6hIaO1ys4thHO6J0+J3ybBMjJZ5s/ujn7qq2vHLuJE7np5Ay80CHoZ2gOZdt1HVUs5CG6QbfsIHNhglnC3q5D50klbbVaDMpYx5E+dbiGT7n4Aa7EhtuRPI64A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(10070799003)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVq00p1yuVMlP5zDMGAjqeHm5LODbCtiW5LGdOGz3JRb3ebJCPdJDPDXWXA4?=
 =?us-ascii?Q?3GOUZfJl4EmAJ/izk6FtfwTqYPB47+AZBWsDijqtTXSqQGSbNvaODygwBzv7?=
 =?us-ascii?Q?x6mBKVpf5JwPnzljP7t1s/53Qgng+tNjbHU7p9F7gpLWcFbyEUfSwMSWmi3i?=
 =?us-ascii?Q?k25+RkVKEbxgqp7uMV+SJ9olbnzvuO8iZ6jIXnnswUE0hIt+WNeiieTpJL+U?=
 =?us-ascii?Q?XDjImVdxP+07zXOoPZsAfcCObEnNoScbFaLKHXFvaQhm71hC8HB38DPPgKwj?=
 =?us-ascii?Q?XmaUjonM7f9aZeK7UMFt9tvKvjookXpnYJIx5lUPpWKMSErvHfaLfVfqNX5g?=
 =?us-ascii?Q?Tcb1lFKR4oiB+80LuHMvWy+S/P8dZOJLAYlJSfEaOxu4CXTUOWaTr3rq8+Gy?=
 =?us-ascii?Q?XjIhYP1VN2X/6LdBsbVeU/qJanwvCGgZj7UWDAgMAJOyFEwo8btZK0hD/YSL?=
 =?us-ascii?Q?JbDw4anQY2cu8VSzVDKOo/sBK1kUVpXUstw6hYyPNQjYsRFj+DpYG7xJANfF?=
 =?us-ascii?Q?1nLJmP9yWvMxa2KoCrCTtr2sjQtki6ahphQnKWEV/LitQcNc1Oqk9eSsDsdg?=
 =?us-ascii?Q?wkvHWZqbGExhvPSeu/RTnVPBUk79ZUGYmCyAGhqsstB6sv4O/+eEb6IxUQ14?=
 =?us-ascii?Q?WvWHVbn7skjThbxHtwx0MXuexrB44HJHQDIhQHoS013Ej4a3fd0tRuaRvZEC?=
 =?us-ascii?Q?Sucbs8/U58AlbvIgc2+IUdQA+Y8loQhM+FxKM/mXrWSYY9kzBGE5p2baWSeu?=
 =?us-ascii?Q?aIlKj4v/DUdCXDzOOWF1BU5KWVQ6ld/ovus1OYhpUY79OhzrxaEdgbo1aG79?=
 =?us-ascii?Q?MjzV0hzYopuKjYaS5e+7xEDwgUrg2PXHCaCwIkp4PUYi7BYGLBXMy4N3Qz00?=
 =?us-ascii?Q?Rty40gx5DbzdFK9nygm2OWbpKo8yEjD9G+aZCr3WAe9Ld5VWqE0hwEoK1oEv?=
 =?us-ascii?Q?RiW6xGfUOjwiUmjNohIITH4fCsNrChaxjJwpAm3phRv89/GySWuu+Kq/6jCv?=
 =?us-ascii?Q?D1odlRbYuXFkkD4UiJKe64Uqwa8U6gBZuDbkfgVVB7FmrcOrtFtWObrMr+qV?=
 =?us-ascii?Q?48t5VcmvrvuUBCXqBUtCQ+mrSWsgIrLyMqODasZehOl9QXCzzXVQx76RlS6+?=
 =?us-ascii?Q?RMR2bYheURKz9kVM/kQi80NueXmVs23dqnAhdd9VRRj65KRkCwSMJSiANK1T?=
 =?us-ascii?Q?64n9dKKemY4lT80g9Qua8RydWTbHy1U8B9D5QI+0WufYyjjH89j4g1ALKX41?=
 =?us-ascii?Q?qnLIxiDOvfOGudprJsUWwKOsjcnbj9jQDPIAEkpNQI8R7LORYEd1wMkrPiQY?=
 =?us-ascii?Q?TvJrf9CIM6hKPc1VRcOjJINAqzemMummKRzV9quV4s4s9edhORshiEHNnHxh?=
 =?us-ascii?Q?2sRGTmrWCDkvkbd945nguygrUv3TmAB2uDrdvkrxkc/6EqZkWbn7owGhQptW?=
 =?us-ascii?Q?OGpkhf9Q4bGsJnxooqV3wXbakho1p+PeQmxzropKnz/0H4ZT3k+HLKo9tfWP?=
 =?us-ascii?Q?NHJc7El6sXF5GXO/MfDUUjmO+51KFjnaGX6jfk06TxN8xamTxbhPB3F5m7i8?=
 =?us-ascii?Q?OKrJI3ki1e0kOKOkHWbjKK64KaoXfEw7ljhHipGm+Rjme/6MxCpIWgAD6siU?=
 =?us-ascii?Q?7IAYV4oKVDFf87mZOq4q03VTRWH52e6+/KtCngTF86Jl6VYlCKb0Kh04Ei3g?=
 =?us-ascii?Q?VYIR5AQ2AGU14H4324+fDh6BVJVrRQKurgy2Z7mAwYYesWt04WY/cZ4RGHpD?=
 =?us-ascii?Q?TcJHYOcFqav7pPzMMuLgh5QG2aOw9LL9T5vRwE+egjrtwy8f6g5L8sl6Jq5q?=
X-MS-Exchange-AntiSpam-MessageData-1: lqcUZ9PGVjGI+Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b961ac3-a258-4d6f-4938-08df13bf5b97
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 06:54:30.8702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egtCf/4S65+1fKpSJA7p01ahTl2McRKQTVFCev/fVfip61vJDJZQpSHo2fElL6M0dlJEIUogDTPfOxQvoHzdhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0330

Hi Gjorgji,

these are the two patches I sent on top of your "add V4L2 subdev
streams API support" series (Link below). No code change since v1;
the respins only make the dependency explicit so the Media CI applies
them onto your series (v2), and keep checkpatch quiet (v3).

Since patch 1 is a fix to the series itself (every platform that links
all CSIDs to all VFEs fails to probe once streams_enable is set on a
non-lite CSID), feel free to fold both into your v2 instead of carrying
them separately; whichever you prefer.

Both tested on RB3 Gen2 (QCS6490/SC7280) with two GMSL cameras behind a
MAX9296A, as described in my earlier report on this thread.

Link: https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com

v3: Link: tag instead of a >75 char URL line in the commit messages.
v2: dependency on the streams API series stated in the commit messages
    and as base-commit/prerequisite-patch-id trailers.

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
