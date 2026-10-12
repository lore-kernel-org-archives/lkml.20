Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021129.outbound.protection.outlook.com [40.107.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE056386C08;
	Mon, 12 Oct 2026 09:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797031; cv=fail; b=Qra6LVQzFcj+SuPMo35xAe5LDElt2+e9gvxOKF8bJ2J5UUkRK9bs7IlDJZVGW3iao1jgvTEmv+/4yjx7WJHossg+T2RKcXAtYk0PScWJnM2AMphmkk095ZWknWW/+i//b3oIB50V8GfSeQ49BsEZNzMpMT8jzMSb9aKtjTWVuEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797031; c=relaxed/simple;
	bh=mC9oxWmk/oKw/8IzpVXdOdS7G242sQXNoE2DEPst2pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SdKSkgPCBXfo6iirL8p0mB3VITF1ATsF9VgW3+4Q8hB5SPPiaKNPt+3Uefw5+nF1FGAtQLDv+n/35wH4FoAGbUmIv9acvrBj6IiD+RLrb4LXc7CtLqunk1IS1rdQKu31DjZhy3WM+n6BvE9wVAMIDmQhMHAVlV1584WR5rj0QNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3IlaculBDScwfj4hNFUNXnU0nmnb9UtxCvuaK9hAs0/2xszPdhTqnXZ9fxgbMXM53DTFiFnEO1bqWM4LfmSOIWHaq4YnX5pbeyqcYvi4/pzjZN9REq+PGl7761hUvtm2t77zwlHUQ87YGGJBvpUFZbGLfWzxSh4fZ/7qrtosUagSQrDDODvAN6JECIkDHu2sGCfNdJ+FbZiUCf6aIllBqDiAwSRh/cmk7/1YV2T1XDz99Ox8qXnGpOvMB//KDHOyA5CqPNq8X0XRNKMOpKKSBHCYvyAOx+PFriSHNVoJknpZFonkViaQ6m/kDF0WFikm32iltoLKVWeZ6T51j+FqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8qURjXG7pRmus8giR56/mee6Grsd/hrYy6xupfWuVA=;
 b=DA154fZk25b2lxrvLnjM0VOJnuZS3muzvNAZ5qBOI4JSJAx9PbDnuwrPPHsaLaJOMNSpDpjfAgcpIR8wJm9gvnkxwNaqsYZy283mvYSZh4KwpBfMgL2nU/rEzXoPLfeAm5TMcmRyashnRkDXr0ss9M0u+RHaplKDHlJbzRVRU+EmtKz9ZUcY1NhEPIBqMZhZoRw5wxPRmNl4iAs8aKqJ9zQxWsPWN8HM9iB3IIgTe6S6/38AAS8HswxhiYOYtRkza+3NMAbPkycRL6XKDHzt32I7vD4l7mNLL/QYsp+ZKUpje4/fTnOJkkHjdyWvOp4ZHks2UHtqacnC5w6rzi9fsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB1304.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:de::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 09:23:44 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 09:23:44 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: gjorgji.rosikopulos@oss.qualcomm.com
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: qcom: camss: Enable the streams API on SC7280
Date: Mon, 12 Oct 2026 14:53:28 +0530
Message-ID: <20261012092328.120984-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com> <20260916065422.819512-1-hitesh@ebytelogic.com> <20260916065422.819512-3-hitesh@ebytelogic.com> <f2f42426-16b8-41f5-8501-a01a1c33dc01@oss.qualcomm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::23) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB1304:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f54ae1-fd79-442c-712b-08df28428306
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|1800799024|10070799003|366016|376014|10067099003|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y060k5Qi8txV7ZfRJ4aScLxtqXNodF14MDCDJqNabZWmJhW1aCfPf/GLrBMnjAIEWEF0MWWdgXegJfJxzkGc0nH26jhEk0u2Np6HNQdPEettSwhMVV5lJjvsU18TH4j8fi2pr4pJowjTfLIEeo5CDbb2QKL8GJ+Hql7Gjb5yPb3QJ3aqG3J2De3uUETTD1uu8SAjtRbgy6T6Sixin5q7Z7AzxZmOcrKZ8UOjWFkeaDjtvf8+YAqDdWVSOYZj4Wx2wo27ILUvfBn7UT/KHfdCg0ueBCIMZcy83bYLsCKn+ZJSF+HN0pryNAt3LJR6nJuOa9Fxb0jW4GA9E2bIYNG8QI9RlHlRUKsWA6IIrkhcPUovjipoDtu6wdtSWBcBwuX1Uh8DA15Vi1/O7NxMm9hFVUjJFTqTkTQPTwVGZmuSirZq2P1kFr7lwhcKqogK7NX2Xw0i8MZ+FMrq5w4mIawTIfWbHkzmkCR9wq+gubUSxPFpNq0LxrTfrR7JnHny/BJpc/GkzJnjVyOrLfxX18prZ26e978/xj5o+UEXWt5P5Lz6eebqyuqs0k8PxhSdnNV5SacJM/GsKu41pbnUnChTS6idhtOXp/WXhgtLJNLs+HSiJ8VZh9DawVlo6ws6pTIvhNgU+j1AeLVPSPUNrZSIzwZ57G546g32ouGLc2Ibcmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(1800799024)(10070799003)(366016)(376014)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c2rpVKv8mLfHuM8y58Tixzngw9D4Bwaj2KNduZt5Btyj+pfC6xqwex7FsuoV?=
 =?us-ascii?Q?7/vxoJjqYS/ZV1ngPuNkXUsqassxdoed3KX5zg5f7Vnh/3/6suSwzB1Pejcc?=
 =?us-ascii?Q?81lCXpIHDI/lGYgfulWUH81XvydU8SH28eAOavrkxSCyJ4FpMIleUsYjxhz3?=
 =?us-ascii?Q?SGY+gShHEASxXKHyVh+IR+CszpqETbhxxjtgNiFV8HuHAqjrmJVeDO5kuu0c?=
 =?us-ascii?Q?sUFnaevFHsHM2Ek+Q/8YbsCwpz/hNjegJJgdjLIAVpfMnbL6rFxuQFfVlHHT?=
 =?us-ascii?Q?33b4xxsvpJ7lMUhwSUOYLuKFhb274AuykHBWq/j5EIV8YXA2lylIwfqhUNqr?=
 =?us-ascii?Q?E+KEBrXgTwnlMfPoiSaN8uoECEfrGS4lwe4+Svqn3pya7CAPNpaoMSkoZ46X?=
 =?us-ascii?Q?KWXYEOP381xy3WAD/sfjwF3spPwLxxpdZd6iYte80hcI9u/PDPBonicfGak4?=
 =?us-ascii?Q?b2JM9PBO9/UTp4PSKnl2num31Sna3E93APAr3PRgWTIHJKbX/sa+NRTCfkrk?=
 =?us-ascii?Q?1n7A3bi5pWYoE6LtgoJ8x0cyTcS1MiIiqyvf7T/kQBWIohgO10b5vyW+1ieo?=
 =?us-ascii?Q?XT6gjpvkvyysVWhLvg/6gQdC3mv4M7j6B1D3RVPeJNtMaLGH2s+IM4WEJBAk?=
 =?us-ascii?Q?MQW6wImFWF+r1l3ihnhE/An/oDT2W1T5GYfUWZ90Mx0Sngve8CEUbMC+/0qJ?=
 =?us-ascii?Q?2YgiyZFKO1n4LxOG0selWK+ASK3IUcqTvWmcbEcAVilLN9dPTVgDGQu1eMOc?=
 =?us-ascii?Q?PakS+a8Qt+M8Q8TK5xSIJrVkBau/qbVN4t5t77ipCWUdDyv5tvBh7Pozkvn3?=
 =?us-ascii?Q?o/Fs7ntkJDq3ZnNCr7xuXiJhCp9GxkJUm+nw9f029Prt/aP+QRipX8In5uQK?=
 =?us-ascii?Q?dOdJ1PRA5kSLi+i5TEobyA5sBaYEnRDZhA2OzaC2sBgmLMPaTMvmoJXZmYA4?=
 =?us-ascii?Q?peoi7p3nFmz3xn4qNHxGy+inmpfLzZLH/tMKwDSCZ6i00Q+Tt2OLleBbY6Zn?=
 =?us-ascii?Q?8cw++x+88xE+74jxpSZfVj5G5HUIJF/j06HIftyf+d8uzDThPOPMB5WSm1NJ?=
 =?us-ascii?Q?qyQO9onOry4wWiZapeFinGQEYzQT9iT0mwwhpPC3OPH+az9lY6tzOVGGlH2g?=
 =?us-ascii?Q?eHMWFUXk36/brIrYuPaIuvEMhNtIdMB31GntnOJIjb6AkXCYk/ckaf7Pdkz0?=
 =?us-ascii?Q?yGA757DdsAUZmskWZNBdO960bevuip/1nSNpOaWT5sVPuixut51LJX9Sm8zh?=
 =?us-ascii?Q?XH/0ynqVtbR6zJw56GMfDsnbRHILtcZYfoBOtcpIwQGMaF6oDfKdtu0/1hxo?=
 =?us-ascii?Q?j8VaQeegXCn5Dm0WHcoRBELWAgGEKEob6SrAUQqB60sfEXBa/oNdC38/7Knq?=
 =?us-ascii?Q?wozIGYbg1YN3F0SS9lJZgrppteoZtqXAdgGb1WkpiCWdMPuuLmeVZflz4gqY?=
 =?us-ascii?Q?WBcJ/WNO66uTl3wss6rcuJ3zkVgrDGhIp9dV1qFfCiZEgV4YYFRsTeV36JDa?=
 =?us-ascii?Q?Zcb6vSVWfaXatJMGQwNv+K6kashClO8i3B/mgeF77dMkxVLt/vMn5tZqPalp?=
 =?us-ascii?Q?wBpm7BnVo4yw8xMjy/aDd8c+6nEmr5Lh7KlF+Sp1wI+j24OEaQYj9kNU6Bug?=
 =?us-ascii?Q?9sUUOTRr8kx5agMAxeDu4Crku3Jg46jtno5kAQX3NILpzCCZmSotUsQEQWhp?=
 =?us-ascii?Q?/OSn/vF8TY4ymw3fEAdP/INYp+HN/TIgbmYTckmBMjqsmOq6jFCjZR2xpZkC?=
 =?us-ascii?Q?DMQewtMXFl4uB1EpfS/jiETP79BCZuVTtOc/+XGqhjwMXgI9cs7T3Qo48GeU?=
X-MS-Exchange-AntiSpam-MessageData-1: jpYNeXMAGx4G7Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f54ae1-fd79-442c-712b-08df28428306
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 09:23:44.3363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C//IuiVkMHJcCmAUQdsUBbCjVKnk31CuU8s2YhxsNyNA7LFSCk2dPrntYWObThUJTe+qXzdevehQuFLnB8ipgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1304

On 12/10/2026 10:27, Gjorgji Rosikopulos (Consultant) wrote:
> Thanks i will try to include your changes in my next series,
> it will need verification from your side as well.

Please do carry it in v2 - that is the right way round, since the patch
does not build without your series and there is no point in it going
separately.

Two things to make v2 easier:

1) streams_enable at SoC level, per Bryan's comment. struct camss_resources
   already has legacy_phy set once per SoC, so putting streams_enable
   next to it keeps the two consistent and drops the 15 per-subdev
   assignments my patch was adding. Happy to prepare that hunk if useful.

2) The CSIPHY legacy-PHY conflict Bryan reported on 1/8 yesterday. I
   already resolved that when porting to qcom-next v7.2; details in my
   reply on that thread. Reusing it should let v2 apply to current
   linux-next without you needing the hardware to test the legacy path.

The SER/DES setup is up and running here, so send v2 whenever it is ready
and I will verify on RB3 Gen2 (QCS6490 / SC7280) with two GMSL cameras
behind a MAX9296A, one per CSI-2 port. I will run it against current
linux-next rather than our vendor branch this time, so the Tested-by
applies to the tree you are actually submitting against.

---
Hitesh
