Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021137.outbound.protection.outlook.com [40.107.51.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8809037C0EC;
	Fri, 25 Sep 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790336727; cv=fail; b=c+rYpkwqvWaoti8HS5STskIFkScuu3Y9BhEVtQ+qABq8pRrQjTfNt8u/osdsTs7CHl9p6ejJ34p33Wr0kUb6KpVx7yUot0CT9Q2m0yFHecC3mgHj6PN4jhoUTHcMdU4p5nguYmL4qTUHdYtA4fLJA5PLFCL7Y0vjqTWe3zYGlV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790336727; c=relaxed/simple;
	bh=IO4S2UaAPFQMRW7m5z/cUXPWJsbEltejwnPr+Bf7+m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ic2HURHOJ10tLFlbqczVY2OaH5VyeAVFSg04TNm/0BFiJlCsx/xySHz4C0kfmSOPeVX2OsI5zAdmj2HG8Nt/uUr5+d0/BgUZ54Muv1IYD3hYJ9B1g0GtDbpIGdEI1ID3qUERCYFsaIaZqagZF+53qgGxqM6Oa6463qt5T7cxmBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iUuomlvtOEYGL0zvO+4ha0MIDWYWI5iMi6h9kJSAQJPzhgABfiT68cnjcfMqWuwH3yVIj9/zXTgV6ekpuN6UDzsMguOPwGIfQbgnTjwkcsvKDkCnbqBV6zVAhkaEF1WbDwEWClIUTSIkPXUM7FNS7QJmFjCiUvoiqYL1ek+E+UtNCXUHCyE5N6JtwPaU5vaUZV+5JXHXOJnSU8NDWAmdHiVatNk+QP6gYcyN80gadQmk6bwIYiCK0Gn0mYK1mmAIBqUTZ/CGR6IVlzcnkZz/CCW4UyV2Ulu4pDvONKqVhf65OuCqJIiCuaveoaIpBj6xNRYimHzSV/RVQT4Bz4yW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80bGJBd17qkxxQlcRd5A/s8w70S4j16OJADI9nOoo5E=;
 b=KB7amVmibLyS1lYygjks8C4pQD9vrtR2GaepfTToc1f8Z8N9ziruEh3oBpAoI6LC2IBswMsTN58XeTYLyWbOYKi9jkFVDvw9lx9Lri649rE/N6e3S8LsqgaQ1JrXSqIP/zcAZrGqHzAgkjqy1X7Uks3kdIiGOYFGelkkYR6bfo2gVUbkOcqufi7bx5Mog/FpMjd9wzxcz6UMkrsqyMrGvE+folPa2vK1aEigDQlsd6zsS4nAf3e0h5mZDlnx1mfKN7mMdmiQGIVjCUiT7y4NgZLjKhUynnnRqA1nZihxdlURAHcQydpAYs4hLkum+neplbvfjS99N5w1cLi2nmmuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1024.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:134::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 11:45:20 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:45:20 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com
Subject: Re: [PATCH v2 0/5] media: qcom: camss: fixes for several cameras behind a CSI-2 bridge
Date: Fri, 25 Sep 2026 17:15:11 +0530
Message-ID: <20260925114511.2228661-1-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121557.20910-1-hitesh@ebytelogic.com>
References: <20260915121557.20910-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0032.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:263::13) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB1024:EE_
X-MS-Office365-Filtering-Correlation-Id: b04389cf-2a0d-468b-e05d-08df1afa7a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|23010399003|52116014|1800799024|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	eqbrG9kjkPWJJ7yj1Zbi+cHPoHQvdoZU2HXnsE4SpM+bAr2279eYKLVUDt44DcgGKUVeknzaWTon8DVBPi/ShyaTzSkgsFCQayyhMF/CKRc/W0yaG0C0JGdSiUdg8IICTS79qyDCjHk+kKqF9fPV72FXXQb3AUqdU4eibDLW129aFKNOKGRexzUT7aRvYxixNmy80slvAvLLQLG7keudo0htUJh5HEAuH8XE2CiOTw2Ji9ARmDTX5TMarUf8sEzFAHZyRbNpBYsK0abaKB+fiEVIWcKMuHHWbI78j1td/c4i3zJvhghYbLeCJloHTXzLn/WTBY5To/Q2ffT3m9DnarAuwKbUFihnMHH6Yspf23dM9s81tAdbd1y1t3z30jXgprCprarurUG8PAD553erKjB612Ea/kSDD9ZyFADtbDl26umBQ9V5KZd5JAUMcjUAluUly2IRCMz7unnTMDnw2O5JqXweYDzeMhkgTVIXJEVfd6I4LD5bBlRlTpsmlq3Xd1bRz0PDnD7bODQKyR5ndHYNnFsBlsGzAv3foBa+zOmpsWTQHeDq03gNBZCyvgLq9dOLc+hZ2zNU9kqVPVFy8ziQs1Nu7U8zMls7g87owPA6m6SSVCilD6dTrNvp/msanR6pFF4weleW2Sr3Ca0PxtLCjO40syUuyvq1EIdPwhI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(23010399003)(52116014)(1800799024)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1j7o24yamQQ6yuSQ6fVnfgMbL9vG7g342K/Oi4QjmFnJdxfFK46m9ZD11PSR?=
 =?us-ascii?Q?LzoMpH4X7HcnfnAl/BICUr0vUMgW4B7LmeJEo2jqN4yP0Bg5M4BvwGViDn2L?=
 =?us-ascii?Q?SRiOZru6CIiQSaGNlGHaleSokOda7txzOI60fJ7jbV4L8x1Pc05rxVcXTRUh?=
 =?us-ascii?Q?1GCGrEfnTcrlINH/f59XJwIX+DA2fg8jANuVP1z3w/iiaOqA8HqFOQYSUUFR?=
 =?us-ascii?Q?YIDI4eY/db5HkDUKaklTQHqDKIls7xwLtxVJQJkDnlaUDc6gvLiL0kprKImC?=
 =?us-ascii?Q?7zHXW+mq5zbwGhE1i436AWaA1uc+OJyEaycFtJ6XBP4RVcVnQSOWgigqWgcR?=
 =?us-ascii?Q?o7d8CH+I0wkpU7P3mgLpOftmnZpEAFyMHDJMylT9tl9AHMZ/gMXx17owhK8i?=
 =?us-ascii?Q?aU2UK8kvXudbPN273Q9ovnUm9328VlGHLAvVgUgszgzqiWfCMVau1k4bjZBk?=
 =?us-ascii?Q?oa1ryUL+/zYUefIqpQPOQbxuZmqM2NUmhZey8uKWDq9ADAAWwvRLxQRzwvow?=
 =?us-ascii?Q?JCY0Cjm1FJpBJulQ6V/pbODQ2QNyAoGmI66yfroLnn9pbGRcx8CPbSEWPDno?=
 =?us-ascii?Q?Y4igCoyH/nrbH4fBKX/1UPa382iIRI74KGVowEyBB1RkVJ4hcStC+tBUJzT8?=
 =?us-ascii?Q?dnxB41iPgDsBDGPO4G8N7kKO7NSFk58bPhk48msv6CbBBQUlf/LSzie4YYWn?=
 =?us-ascii?Q?sFjWH0xHNoBQuqbmvZbYfYjAsZsWF73xm2B4EWI381Gc1++M2ApJyUFLH9lG?=
 =?us-ascii?Q?BdLXbyClitB0lzk+53PAJxJ25wmZ2VY+h1UAjwwCVKGvUsPHC+RAOLsDRd9S?=
 =?us-ascii?Q?J3yxTyObMxfQ9XCoxPjxLtr2ViCLwXLuqLEVR2pRROlonzXl5cITzm42kBjy?=
 =?us-ascii?Q?CuGD2w/NLfQEQ/4y2HShSBrNYcob82sp29Pr9CjKK4tiVy5IsLAI2cy57noE?=
 =?us-ascii?Q?fKgxTp/Rc8WUrpgi4iWb8aIX586IuSUfQoMykkhzSImMzgY+brSZlejj3o7T?=
 =?us-ascii?Q?mjXOyfRmIkYjjdlBA7srP7phSLbT61znAS7EpnkNJX5adazR+2AcbXRxrxqO?=
 =?us-ascii?Q?w6U0I0z8aU9PfOpD9AM/3y7+94WN9+oDZaadgegme4NKwVM7aKPZ+DzIWgHX?=
 =?us-ascii?Q?1naGjqeuYozYsVbRErqdnLM7Huak+lJq3OJmqalcjBwmAFz+d+k9lixdJf6C?=
 =?us-ascii?Q?n0JKkAfpJBCNdis0saFZd2tqkMKixN98bUX/WTh2IJQMuvzORuiflEf76QRz?=
 =?us-ascii?Q?hVp83TrmVaAQ+JasRMDOCdcTYiKU9eIfEi7c+sG8rEWar5XRNiKoTwZnorF6?=
 =?us-ascii?Q?x9/YxV6HUqr8g0fOeY1JXj9FU9mfG3pkZ9XcSMyeC6Sspw7W+iPD2pHkZERy?=
 =?us-ascii?Q?tWvObAwI4U5LNyiCzdz10m+YzkixCHtfgVOBSiv+VyBUjnBao/Oirxcm5qHh?=
 =?us-ascii?Q?zl10+S5AiXLCXiMnzaJYVw2YYzi//0Q2kiEdJUEWxM1RlwwYONKI68oJjA1E?=
 =?us-ascii?Q?RTKIWa08QFa2wTGjvZIYA9Fo5Fg5dbZj8yLw/sXwK3sNSkG+pHkp2RBgjOOs?=
 =?us-ascii?Q?fF0E1mOYxnNWOYyXonp5uDWNj2Z7Pswh8f55OraxtjYzCFUCUV2ceL2E8EXJ?=
 =?us-ascii?Q?wuTRR/ebbrqqHF7MGBd1iYuLVYimCoqevUg8IuJ4wDQXbe/uLESy8Jy04adj?=
 =?us-ascii?Q?MNxYyeKEOn1B61XybpVZB1QcBYpeD5fJuYeA1svDVyIPGf1nyX8T6y4HlV9w?=
 =?us-ascii?Q?PmeiDr6hmfhUuKViaR15NW7OZjbgNY+y032N2NJSlsj+8wUYjrRltEZgwJTK?=
X-MS-Exchange-AntiSpam-MessageData-1: ftesdYXQFVpd3w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b04389cf-2a0d-468b-e05d-08df1afa7a12
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:45:20.4962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwFm6Q4hbrsjjQxvtlD0VlVeMn1x/bJVQh/WvSmv8CcrEUABbZgsxeKYTSZBjJOQy9ci8ZMNOTggYTn2qwlaWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1024

Hi all,

Patchwork has just moved all five patches of this series from Under
Review to Superseded, but there is no newer version: v2 is the latest
one I sent, and I have not posted a v3.

I re-checked the series against next-20260924 today:

  - git am applies all five cleanly, no fuzz and no 3-way fallback
  - each patch builds on its own with W=1 (arm64 defconfig +
    CONFIG_VIDEO_QCOM_CAMSS=m), so the series is bisectable
  - checkpatch --strict is clean on all five

so as far as I can tell the series is still current. 5/5 carries
Bryan's Reviewed-by; 1/5 to 4/5 have not been reviewed yet.

Was the state change intentional? If you would like a resend rebased on
current media master I will send a v3 right away; otherwise, could the
patches be put back to Under Review so they stay in the queue?

Thanks,
Hitesh
