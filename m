Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5485B4AFE36
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443491; cv=fail; b=fMIu6NEc0c2p7SRCETau5kUV9JxXmDfB8lsx4tVY9yGv5u/Lxim3ekcAXL/8ediQzZL8hMgq4nSccwc+BatI9rRANmkE5bPEPlQQswwiT9up9T454hOrQNEcH+Mcto2fmyKSP8X+RvzWE6v30a065liig84/3xQa7S+d+JVXRso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443491; c=relaxed/simple;
	bh=oXxSsJUHfE0ZqJL2/icOgVffiy4iCOExoU16xq70DMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BykdkYoMwSW1gQmZokh6J7EV41toqOK+rkVa9X7lCcjxN2AIH0LEL6RiznwAQd800Tf8xdIceZIo+lB4VqUdtK5DFBsOrySFgeYrLk09cAKMeLJ9d111PxaMrhzmk9RNWXbU77fjV5LPKIafQbJYWjMxM8YIs3m4Al7ByAKTljE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QBELvnDV; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QBELvnDV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kA9eKTReSL80EuFnlU8BT6sGd6adieCL/ioifM78j4pew20PJK/gpr1uAYAbNuoY3fLK1kyRgc7EkEgtT1KGYH921tD3l4mZHDeSNnL8UCe+XXUshecHV/Qv5Mj3rg8Y+MeofoOE8Ub1u+btRYj7ZKVe1JAhp/hVqtmkrFrsP1PgV/JH9ZY0Gk/5C9FHsBwAmu7uUXY8TI40xSHBnK/fyvZGegpLpnjE2xC/NUkbxzWRDsL0xYNphuQw15PPwa80UK37vc21WicBt5L7TVRm/gjCn3COyudWbW8zeOodwjKKjPbXxKtuP7mAdoTyFEdO46DZukwnmWRQb1JJgb1A+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoXJljDt4l+WiCLEO93RA4EgqLHHixuBkgcFvlR0U1M=;
 b=V26c91GGf3wUQf/gHlr9h5tdrWF54pXh/05pacqCbD9R4ezy2j2/VIDWghs0tuD9GIogjoXc0YE0fMZ/QYR7HKgsl6BmU2yAukYPL7kuQignK2CapIOyG0JbSiuFaQp7GXb6osdzlXzruoFBErfP4b/oF/SOSY6mIPhLE753PwS+KCwRN/lcLRnaOiy3T1dHyDTXEsbZzyyThbReCB4dgqMY+WyCQXuiilpF946ty4EykIi55XUPD18jZcFJkGSb8nY5VeT77LKJc33boQSwnlGECeT9gIhNGkiBd8/GgAuGkzAxSSMxBGGh2a9hD4cC/Ks1KXZGYMY3lYFTV1ZtkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoXJljDt4l+WiCLEO93RA4EgqLHHixuBkgcFvlR0U1M=;
 b=QBELvnDV0nMGoCpVD2U+bRvfNdQePPLGk2WE1Z9cVhjk4OXqG/Q51FTdynL4/h8g0yqpt9aM2MBtSVmS+Nks4JEN9wvYQN1I1y7x9rfysNiJuLDfgSMYvvSNtEmbGEY9QqAUgmeFEW0axklvwx/F4F8MSC4f7MyZYXlMTJ1lHu/yRKgCQ+lpW0XoT80VC2A3q0cSBhBScY99NNPA191sCmr5z+eg980uiHWhvlPtBtwabqk8s4032qwXcKXEI59hlyzCZiIAfUYrMlT48GFOYHqsy4QLWJnpKz/glbqq7N3pUndIUbgCcuzp2tZiYjqjwMX7u1fI12TUVHlGFcDCOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB8331.namprd12.prod.outlook.com (2603:10b6:610:12f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 13:50:59 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 13:50:59 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christos Skarlos <christosskarlos.kernel@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, usama.arif@linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/huge_memory: fix various coding style warnings
Date: Thu, 03 Sep 2026 09:50:57 -0400
X-Mailer: MailMate (3.0r7028)
Message-ID: <DE50DF72-2F77-4B7D-8A58-A071B0E56F74@nvidia.com>
In-Reply-To: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
References: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BL1PR13CA0068.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::13) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 342d7aa8-6e56-4bc4-2a3b-08df09c26288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kh1XXfMVh5PwwviZu+2JYqQy6kj7QCgl5K696g96Ggk+QdSUzUgEcTpxNoLLjg7LPfA1U3Rs6NEeKqIwrVimLJkn9BBg0SMxF+Ehm6f93TflF5pNZxTd2Gm3JNoTlZFWn3tmBtYvb+LWXrJdqg5lAmo7UwPWmMeWExtl6CMkPwJ5zdHMZ1WFK+qoY58QUnoTNUs3ZgpUUG+wc5a0W6+ED3+wCf+Epj4cD4Jw+p1EfllxtmgvQt1uN7dCE34vKRLewD1+VLvvwQ8KWiEAejlI0dbxAI8qmZbXfi4NuvX/Gm+GkRK8TB6369WxIL9P1vI0UOX/0rrIWsOJUWgPE1IVdnFHZBoPckvPzha3mbXk5H4N+KhGbNZdFtBUW8NO89BCaOOk/88tZrqUVrPoV2BS5hi6TRHiSDHg2FdPBw9dC4Bi2/CELruQx13i1Ma1TkXKYQ04y94vA1Q5It9O/74zdZqz5obML1Vx49GR2kS91zCAAdiXyla17k2NKPsxlvy54pebVEcp4KfDpZUDXjdAjA7veoNmiOVxLS5vclL9q41768j1tT+VaSjHC09H4jPUt2GZLnMIysF/VLUhBpj7LnYE46YZlBAkwEbsjKBvQIgcvcIyVPuspVPKgMWcwU9RJ3gslaCURrLUHV3Ov7/5rmIE2gKbL+P9S0Ol4ujvP0U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2e8X2tWXnmzl2MZcLYhzmjxP0ysvGcYqTDRTnGy6eZxcSlTN18/3zwaZR2tS?=
 =?us-ascii?Q?Jy/X8YlPZFE0DeArH7twPSmUN+20pnjqr97Xh8wKB+BXjR43X8o9qav0YRGw?=
 =?us-ascii?Q?XxdU07iYBiuv3Kz91+TA6OsBBape4VNMYJmsAkob+cHyq/lgLUSP8Vu1zXaG?=
 =?us-ascii?Q?lug7HbwipCP8YzxoDZlW7XS3BsXU9W7xDP/JJ0liSYeQOzWQ025LFuxQsLFM?=
 =?us-ascii?Q?6w9LeawjNqO2UxjdgAjtE65+ow7psNrJttl1ikbfeRA+UG9QVsCNhqUD6Y6S?=
 =?us-ascii?Q?bC0hSOFCQFn5Lw9cMBmAE5pu7cniLhULNHPiCjG4yhaJ+WYzEYU0BcOZRvcl?=
 =?us-ascii?Q?TpQxFb+RaGbDUAZ7LMY+hHDZSjAKn7siZ8Ck5cQNEJyeBXqaPTNDAQV2CVQ5?=
 =?us-ascii?Q?Swjqgn086klwLUfDhhmGwVQWvVY4y0txIrZvyKEH7CCpneu1e8yrQxT+VVLF?=
 =?us-ascii?Q?AXxtg9CMTYWObVmjUOioB3cvN1/s/8laXta451xMcZq9rqYpgS77joiLeCs0?=
 =?us-ascii?Q?vQFPTdOITcfZHMEYpwhfGlfM0dFQR+PixmOXdKUEEZ+JU99yd63Y8XPLhSFn?=
 =?us-ascii?Q?XlV7dBoqicgWXai+9oLeOlQORBNR7sQCUes5w11zxZD3MRVzloPOY2AQ5ozA?=
 =?us-ascii?Q?pr5QWAJA/FSUvi3DornwKeFy+6maKhBpHEoe+MWNDRnPO7fjgiL4x/ypDvt9?=
 =?us-ascii?Q?woEZPpDHEcZ40SAjb+osy7IUg5u/RIUqFF6RoO8xoRZ+H8vEuYj8RxMyzC4J?=
 =?us-ascii?Q?7hBhDsOGeCl+M3oi96LhaJOih6QYTNBnttUUsE4LEdRmLDKfKnKfRiGesL9g?=
 =?us-ascii?Q?Vt5tJxMwcXVhRZiwufNhScPS37TWCHc7g5GjbxAxCyTxkajgSHkemVdu4L14?=
 =?us-ascii?Q?E+bcHFaedsDVukwJbLYHiA5lqSfqA6ZJIziPjK+HDQ2KYknyKDgW0fgaQhS/?=
 =?us-ascii?Q?zGPpBRpSAic0uF+YWN6Sm/0ZSUyVkiDpvpvii0l1mJIjtg0UrVnEs3u0QWRK?=
 =?us-ascii?Q?iFgKmpMuzXrKastEJ334AcLcm9B9e0vfLFdvdtJ7Kpe2UNvWycg6LIVpHYFq?=
 =?us-ascii?Q?ifvftU7y/H4ZxGDft2ih4mvqCF9+ZVneSn3qSFSGlsmccQJN15By9qKuWrA9?=
 =?us-ascii?Q?aJ6LhY4S70K6Uisqx+WVK/lu3EkWTStjVJ/L2VAE9amrY+egN2MUjmtGYoY/?=
 =?us-ascii?Q?o+rAYpeQTVbTvIcm2EAGmryOdvI3ASPd+Fg+Uuxwhm+ANy/I9IR7yE/dK13e?=
 =?us-ascii?Q?Vtgp2BV0uHexSsyuFcqzY1BNTNfhGDiqVqs8EtF+JhZM7TcYKLopkGS+4xTa?=
 =?us-ascii?Q?FdBe4lfR6dLOYuynnCQRR1vgPc69M151ZIAMcOH5AKmixbioN0sYGlcCS5J7?=
 =?us-ascii?Q?fgR/v7HMKjgZVLuVptDJBDVAFtcU89UVXEx51OjjXABFFygMfyrl6zxFU1lL?=
 =?us-ascii?Q?sxDmjCqhw3UpPJEL1NOCH1+vVEKK/eU7lgWwbRAbf7LG2PZXPuYtWWmhpXEF?=
 =?us-ascii?Q?LI/1VCGLv7MQLnHuMbB9hOQRYAGuIH+c4+4oNbDcTEEwB+I5z8gwkOxDhAAj?=
 =?us-ascii?Q?IGGegMjKIR2Zaf50t/8huvlt/t9GMUQgVKYW4PQX7aWQ/VeLLoXciNjiEtEB?=
 =?us-ascii?Q?CWhiMyMi1JHKFCxH6hHg0P9FMSZ6zbeUEvlzJfeA+xqQxZMAhUr3ptKHve94?=
 =?us-ascii?Q?Q964Yl8S/VhnYalAJu1zCu3mLecQsb+QVoYrrWLaavdvbJVd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342d7aa8-6e56-4bc4-2a3b-08df09c26288
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 13:50:59.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYTg8kfuAtDCbyHwW/Sbb47TdAZhoddJXtX5bBUfuUJrkMxV2N+QuUHM6oSl9Ohd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8331

On 3 Sep 2026, at 5:22, Christos Skarlos wrote:

> Resolve coding style issues flagged by checkpatch.pl Specifically:
> - Add missing blank lines after variable declarations.
> - Remove unnecessary braces {} for a single statement block.
>
> No functional changes are introduced.
>
> Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
> ---
>  mm/huge_memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
