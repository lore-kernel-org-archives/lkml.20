Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020077.outbound.protection.outlook.com [52.101.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A531B3C13E6;
	Tue, 13 Oct 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884885; cv=fail; b=idfWLyaC71ZJ4+tBHo58c4ODf/7HqJFYsjPMZKGuZxXS2Fa5XV6HyDu97sxA1ID6grH529zi0+8oYaE0JgCl1Rv3Puwx3Wbd3fr0SQNJYgN3ab61aB1Y+zI7Vf88pDHPuZY5ZTAlKeA3G/4zbaz8YYN9+RGCVhaGXnVEasXGO80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884885; c=relaxed/simple;
	bh=g797LRQ4BfJjFZvdoUoFe+hEBlUP6FF6NjR2S6KBH+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kHdE9uEsIrmDz6IMOMxoyNia8BK6p9befHyWIYjxx01QZFnVNetGvBmKhLvXarYhzoYZpZs1tGy/RecLrg4aQZfINeMwa8nBZGtQEDPDYyhXKDc8AVJunlt0rHcLNVLd6EX7rZYGRbajnG7bxKJjQ36swBU9DEJsVv9GV59Ct3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjONzZXwBLWtk4mhQAfRDYjqZ0/gVJ2UGAWls58Q5h+QY7G8LpzwCjiPATPuuDLq5mw4f3/eMbMwn4/rm/DgW+UnRC1nUDNFLqKZ/PScx3tjsgBBBbDE/2aByerBU3bIs7V83bU0EOiMsruiBsN0ce/1ai/iVHMMoZWm3CGGqxGkUitdMd0/qgJh3qAxeYZdncAITbrOVjrAxW7QdL+KXlUYbuacEtUMPjh8P4EhKjoSa6Nf9mwf/FYCnUs0+xYEYETvFB8zTZZykS398Au1n0gGPTCF/yZoBvsWxtzToUOrEgyMMNSNYwIC593YmiP5Dj65A4iPmkwNlNJVDEqUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tif1WxX8wln9uYlewc2tF1LcdekJsEr/a5Uu/vnmlgQ=;
 b=TkNTlyahBBCNZCNlgnbGLT6B3sXt1bSUyDcfaft/SRLn/xuCdMloVFfuLj81UR7NkvAzUwdKjupF6sXY/CJbNgRAldqWHoBq8veaptfI6sygkyVOQH+m57onA3iNRwb4DhsXdxxq+CaaXlYSGX7uZDKhYYDHUQKMm3uA7bBPD3RbIXwogRl7P7upDRmEYzbhTlRbiQbnp2gVMRK7GLA3agK1DEld21I2+QibqxmKtnFRSK3cegEnzevJnZCT2fbHf4ypMF9JS+oiPk6dZJw9Ve+PEdIXp47DCoXY7nH8DdPBYAcAkH0OYjFkRdi+2Mtk8Z247orpmVbbCKmQkLzTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB1142.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 09:47:58 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0522.011; Tue, 13 Oct 2026
 09:47:58 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Hitesh Patel <hitesh@ebytelogic.com>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v5 0/4] media: qcom: camss: rebase fixes and SC7280 enablement for the streams API
Date: Tue, 13 Oct 2026 15:17:51 +0530
Message-ID: <20261013094751.1503021-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013083306.1132036-1-hitesh@ebytelogic.com>
References: <20261013083306.1132036-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::8) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB1142:EE_
X-MS-Office365-Filtering-Correlation-Id: c99abace-768a-4788-102d-08df290f105e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|1800799024|7416014|366016|52116014|23010399003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n+Y1kw/ut09P3cwKoE4vjLQaJEzoy4QXPI6ll2HakV2HX/g9mbXJT8otfa8U2srplsiBQ1R/GcGjcxgseyaz/2yselbVvO2lppfwvMJYQmkES29SMqQilVgEW4eipOTSzN2jlgOEIxxQjwi5y5i+fCz62+uhzhqTxCQb7no2Mgx5Eo+gfzt+HpzrSDa0DH9l0cuJZBIskRPrHyXkt0NS4gOw/pTpjHLxKeJKgwPkmfxLo5yttLuoouBeL2PdS1hQjGUTxhBaSd5hPNdMSpzOrmPFX3w566/DV8XQuTK/+G1qEL34fas8zrlW/jKZdd+CIaVYxslYw/lICt7RXyEYfOpCV4dnC7xG0OZeYNm6sB7xJ9WPyD/PDiPxyWe81336rqhdwV8+f6H1MPl3YMUJIbniX5YsXwgBXMf8ZDjcxanJLYeofCls0BIdKZxD+fEj7itgFaVCLKCM9S8C4dyb55SmEYgyB48ifT24ZtmXMInlyvCX2C3jkwDz+BRht7YfYFzeVAekPKfCG0/sJPvyygCxm8mxI4dZBgYVyVmr71mSyRc8LK8qt0o83LXAlsushN3f/vcMVg18c+Vg8zCklhRc3Ka/5wqht3ELxf1f6qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(7416014)(366016)(52116014)(23010399003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4kB4CkNb7mPEy3cM+1MOZK7soH9ongWEzB0Maxpac4BMweJltO27PExsw/y5?=
 =?us-ascii?Q?hY+Bp9OhlPWZBRXeEPfkk6lxRiVFCjYvuDuyiHj02DQdPzWjJMxxvzLHNGYk?=
 =?us-ascii?Q?o0V2wSMd4q9oebRPseYmG2ASx6Kt7CsMU2sTcknR0V7SZCxLgvb+H22l1le6?=
 =?us-ascii?Q?UxZX/cLcgIGvpIGr1xLBT1z/iTc2fIZfByBNM40alru8e4MUQqqch777iwX1?=
 =?us-ascii?Q?0mjKBZX7Igux3+Qgh8VIBWM3qs7l70biWY2AOVGzN+iKgGb2179daVu+Ii0/?=
 =?us-ascii?Q?5atbTYEgaRKUY6OZ4tjVsUFMeu5ySldR3wJKANout0/K2RCgdzpojjFtJp9r?=
 =?us-ascii?Q?0vr/ndesfPmURL52WFixXtJ7b28R/0yLp48fpmddCMlRK9ynuNiGFrZZNDgv?=
 =?us-ascii?Q?V8AX77ZSVVfwhh5NmJgF7go6pS5IqhMgL2I0AlX+wxvxFD2jyKEAPRPM3T6S?=
 =?us-ascii?Q?v+j3+9Z6QpVaGwlGhROkcFiDObRJFMg9fhD9pK+j/uBVIqvR4aapI6+WQvKT?=
 =?us-ascii?Q?GG8ujutSkyKUN0JyJ7t1F4itiiPSZfCqguQLIiCOXf9w5kZgh5VN1VlNn4am?=
 =?us-ascii?Q?3LwyFjctL0qQXrVITQmKhDmo4WtNU8THjBCys/lr2t0USFXzLBlcUiIg/q5p?=
 =?us-ascii?Q?a5AYpCVYUCo0DhLpUkg7UX3UPRKetipRtTN+iGXSeZw8y8oHYflhYkBWAUYf?=
 =?us-ascii?Q?Sk9QTqrQ7Snfn/ayEstumatn2gWK+V+R4VBvmsvXxHYV5n/FoO/PKgaEGZnZ?=
 =?us-ascii?Q?azOGRBwDeCPOO5nUI8IrvVCj6JybGWvgE/hGOPWyRYjBpWepkTHggnQHsw4L?=
 =?us-ascii?Q?MoHxIAEcOcWygGJ4kg1uieMmhozWGveX1RVzRYjGYodybRb0M9dfnMQHjLvj?=
 =?us-ascii?Q?Jr7yH8ht8b6uOKHhZ4NwSGEaVxj5cEo72PfZe9y4iiPkkEapUFjnxtf+ltTH?=
 =?us-ascii?Q?wl1fcUs59mDtKHxB7eE4fU98BgZzkFUUjs5A7MNZGKmmHD9SJpGaB+t+YjK1?=
 =?us-ascii?Q?d6LvEkXd5guRfF0o/rtolz+C7hShGcDKdhnJis5ff0cMSGd9/SUyRQQC6ESX?=
 =?us-ascii?Q?CH8HvsW34oOwXcEYAkkDY5S591VAfHVqJzdTX79YNQd4S6twpKI/3kSg3/Wb?=
 =?us-ascii?Q?m+o1v76aLoi1cpSq7ZfzPt9edwGkcluUBIPUzlU6cgxcxY0nPKzBfz09TzdS?=
 =?us-ascii?Q?cjGTlJji2CTk4ahJqROhDnPKPPpFbfqjmhLhq0Dt47Ln3j3YDtX2PoCgNB3t?=
 =?us-ascii?Q?2vLcBB9wrnz+u3mojPEvvQm3/4uLwFmaKTwxfZfPjuzuWnV1Gved42gTP7S5?=
 =?us-ascii?Q?ZD2kclRSYkv+hlPFG426icodm85LfQB8P/8Wk0kCn6KbhMU/p8zIR9gQLAQj?=
 =?us-ascii?Q?OeqHRl6xLr9SwanQ/RgnSuhZJ7Kekhc80ncvwH+fYrrn1PlZ/qXaN41WWIaH?=
 =?us-ascii?Q?5B13WZDthvwnbpjpAfkBFzFfyqNhb5n49ErlZmQRiaW4az/84ClCkvvGUrn7?=
 =?us-ascii?Q?6mt5N0l5VbH44DNnJVICv+XAanpIuaotHgPNpVgCcE7ggwX1UYPAh0Arlw59?=
 =?us-ascii?Q?dg/IQC/MgjqaNCm1sPJOX2VAQ0L4rx+70lfbIt2y9ouWyyZQ4cu7SWaqH6Kw?=
 =?us-ascii?Q?fWKuVS4D9aolXQR8nLFvBO5iShlse7aRFWHeh1SjHy21PW3ntVliHIuL3skt?=
 =?us-ascii?Q?Cwp4LY6ETmYvw6+Kz5xLJXRXcvGqAB5Tksx2H7w+DW1O2TUgRom0+StKRxLR?=
 =?us-ascii?Q?0rBfWzY6+z5kXTFncGKOi7JsaUGscEhETJCzY8MDtMySypQB5R89Cpljkyzf?=
X-MS-Exchange-AntiSpam-MessageData-1: mgY6P+e5lBCWdQ==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c99abace-768a-4788-102d-08df290f105e
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:47:58.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPKhT9zPAFOeGuIOBuTVB9JLq850OHa7u6jCAYbVO3oeUdBdwKTZV9blhj+v2Y0BgGCVyqkVjpqwtYTENy8M5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1142

The Media CI failure on this series is expected: it cannot apply to
media-committers next, because it depends on a series that is not merged
yet.

  [PATCH 0/8] media: qcom: camss: add V4L2 subdev streams API support
  https://lore.kernel.org/r/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com

1/4 changes csid_streams_set_format(), which only exists once patch 4/8
of that series is applied, so the first patch fails and the rest follow.

My apologies for the noise - earlier revisions carried base-commit and
prerequisite-patch-id trailers precisely so the CI would not try to build
this standalone, and I dropped them when I reposted as a series. For the
record the base is next-20261009 with Gjorgji's eight patches applied on
top, with 1/8 rebased as described in my reply on that thread.

Gjorgji has asked to fold these four into his v2, so they will most
likely reach the CI through that series rather than on their own. If a v6
is wanted for any other reason I will restore the trailers.

---
Hitesh
