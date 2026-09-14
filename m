Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3E148BD46
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398052; cv=fail; b=VUpH4bpf5BoiBl5peDhH6jnV3FleuFc5+dwVE4bFcUr27AtrMANgZnd6xi+RKPgXypicEMhlyJb4ImjytxDvR50RaCQ57lkn52YUZyHZic5WmwJGvWKcScmc4MlYQhdnkM2TVQzgip4jVFKBezSTwtk0It3glqgSm8DQXq3fdPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398052; c=relaxed/simple;
	bh=xd+WrmN0FnoWtlL/YMc57ZYrIoZcHaHXSxVKcr1pRjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CrIxBmE35QbPklYgsVwyW7QVfH2d4DJYmnUxNYU+j0hUbMSLDzW7scP0KghFg89KqMkWdz6EkI656BpYYvgv1qRZCm4tZxIGEVJ1ild0ucWm6LuqYI0s9Ge12vbDyDT6ltVPq5KwA/UXHiVkHcvf4nktktmCDISru6OWcokjMAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ehCCoP5W; arc=fail smtp.client-ip=52.101.53.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ehCCoP5W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS2X9Vg563O3gDrkK007qWXZsd3JS4rWak03M/VQf4JYe8tLTs20eqW9BsJFmrCtKgilyOkldAMXW6mD2stKvb4uklqt0CPUAKycI7rMEkOTKyRg2+IYxNks64tikgotzzTZkXEDm6Tc0/B4nq8mFtCKs7VtX86VEMIKif1mtt3z3RF5/y01Mjl1tQzZzhR8VwMMl3GfLv2asMmozEu3dx6bOyTyJ9fzCxVhFIQ3y52lAy5XwtkSzomXgPQfcfrkqY0E32gmcvHVEPa9NV5DWBSktwBz5CIOUQat2Bq0CSdh297fnmg7y8Zuu5nrTJP7B9JcpTkRt3v2AnlkrN50RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKODAqXlUBNguKJ/OvO8Ga2oaReMIksDfsNsnyy435M=;
 b=iQZprqxahn3i1oHQ1KTkBJNavk0tvIOQ90dO8BE8NqAlAxjS7DY9Rd9TzpFEDfmxUXflKrNyKtqEVbxRxMrumaCOPHD+ub5RrNhjSeGFnYmMotBsrDKWXwUGM5kAYILKaPqBgNaqLet+Ih6OV7mhFissu6QkTc/M0ZeOKyTCiEiAH8OiWe5Ra2FhbbD8Jwcx+hffMRWqoLlR6cl+rEkx50s/NrKCGKmCBz1Uwb4JO+c8drbCjsfdJhcxX5YnmYdp8UlSzhPvQ04nQxhZD9808aBLpzPTQf9NfMSsmfLItRwGalID2nfs+kU3bXN8f7r7700vxun+OERMqljWPSO/cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKODAqXlUBNguKJ/OvO8Ga2oaReMIksDfsNsnyy435M=;
 b=ehCCoP5W6v7hsRoqFL4sWNDz4C6BxQ0edjd2pb5tjAzCBoFQrq6rxEfW2q05p754U+j+58EIBFzQsxaRHjNP2XKIEXzLakHm4hC8lQms6yqimlQ/5GJQOAG1Lj2ux8wz3BzW7BlPt7UfglTextD1Q/QBPos4B1S8OyyLbhogEHiG4fUSQ8P/yqovO+SMsJiOP9Jopc7dTIo6r1mW7l19QByLorhOV314m0SPX977mK0VULjwej/bB7TI52YHex0+MvhenIqY4l/GxD88GGMT3i5LsHkCjUSfW2YujTcqzzzQP3P7iraSq/cFc5OATf413WnzEtW8vAQ6p6RS+MdeSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV8PR12MB9083.namprd12.prod.outlook.com (2603:10b6:408:18c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:00:33 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:00:31 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org,
 Balbir Singh <balbirs@nvidia.com>
Subject: Re: [PATCH v2 1/2] mm: refactor find_next_best_node to
 find_next_best_node_in
Date: Mon, 14 Sep 2026 11:00:32 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <34108CA6-44C2-4F63-B9EE-C754F3053B5D@nvidia.com>
In-Reply-To: <20260912030424.2889731-2-gourry@gourry.net>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-2-gourry@gourry.net>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR20CA0052.namprd20.prod.outlook.com
 (2603:10b6:208:235::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV8PR12MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa624b6-9bdc-4432-bfeb-08df1270ec2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hsbmttQVoDkg2RbXRqncig22tfIPw+oN8oM2FZ6TbhR+48jeIdDAxvx5zf3DN31yvOXlkbFokdYY2CJS76ymaTp7/nYktnSMmZgHjjq9iZI3BOjOt3lHW+A/AeCCMnvsFS8BMxmYTyQnPGqh89QGvJJhJLsj8DjItzjReA8MQH59S4cc64Ex1oDW6R00xRYmjUMGs354M/uKdT9S9XXGJaGAuzBvs+ZMozLASePzj22Es09YNos//C8xf0ZaDtX4+ofef2uluRt54Fohs9kjKMJaBSz2CDCAo3h/FPJmgggi/u+nK+s3TExMt+YMVoP5e72jcGIIRnuzJ0Xs6yP+U+DzopgzOnPmZzn7B5MJSIRBx/SaaqOba3gXqjb4UWpXmM/ZvMmIOdj+MOsg18XYuds++oDLw53sAukL0gu39q/SibRDDDv7nBP3h7No3rdMVIkNSpJEryF8sQRJxbQS9VcbjtdR3IzgGeBtL3uVqPiuafjryym0KNWZJl7PEbXFFDehwjl2I1Dz80mmyb+CIol2FWs5po74LMlTgMrypoW+DCu23KniJVUDUWS4BUp9dsAAoI62zYwvXycuk8elbrfPSJLglyESNzo7PuMkcBxcp685mQNigIoVnFifj6ZIkM6fZg/b3OYDbTGBtzU5w3v4ySRLDKkIYu3+aT6U2I0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ddVDf+WNzyhDXvq2LWZkhUxS5ooKvTStmDdG/5jlDuglEBZT4DS/75nY9hof?=
 =?us-ascii?Q?G9rZPzqo1mzdREEulYURVpyjMqJ7Ub8hhItNjItaOwI4Nnet7Ibj3BvJE1tv?=
 =?us-ascii?Q?sBwv3OBZ7Aycz6Wv/aE0LYbWByZkp6+hM/dmK44DW64jYYwjXUdBSyH7rcnP?=
 =?us-ascii?Q?ZEr2//YYNC+CACHGdTtXkplMaSPNG5beePGCFO+iu5GGN7FTjdjEbPTMxGY9?=
 =?us-ascii?Q?Tl68Hhj9bin+2RicITKanl/hGBvnSCtu5nbRlLQ82wquqnzQU1HSxYzJzyOy?=
 =?us-ascii?Q?X6LdGlWgxxKvi53WCA6AL4SYmVlpIZasVHZEyzL6iyLAYnVNow6muKO174lR?=
 =?us-ascii?Q?F8cxtSbhAyskMNwDO4uhqLhzvMh4Ybcia+pdM3Vi9J/jOpAsMjUYqfKAA3R7?=
 =?us-ascii?Q?hp7vIYLwirBlV2wLoHl4k+yOEX/izvrntHFBrsIM/mQHuDVl/j9wQDfG//ta?=
 =?us-ascii?Q?aD+RTRZy5XkSg5HkwNdXkKI5G6OBmV6sE4Hh+CaKc/M8MyYd48yax8wClp/M?=
 =?us-ascii?Q?HVLJbmmvcZhDIUnRlLV5zHNO5iOf1u3zscksTqSofdyj7jiQfpmDvx8RJK6j?=
 =?us-ascii?Q?KgbvV/3NM4kD3+jsqjXZLHmEygeOu1gtg5k3t1td5zebaD8hmqOk3rWrpCpn?=
 =?us-ascii?Q?ebwBkFm9OjfQjVCTJm0bSV+vMrmwBkoaiW7TrfRUZbh+NTnqvetnBoIQctP3?=
 =?us-ascii?Q?folYVo4Ze06/xwipWiIU+tWUcwR6+mEAFG+oQLFRn+x4EokBR8JvFyMYS3hd?=
 =?us-ascii?Q?/9cVjp86V0dOk3O6NX6Y138Jel5bGQ7WbqsoNWbjUw3lQbbyaTWursK4+m7n?=
 =?us-ascii?Q?Ssh1UnJXNOcy+weCgOCxU67KtMUnLOj5ISwA6L8E3HZiOK6TIcnbbRkwlewG?=
 =?us-ascii?Q?Pf+LSPrAcWziBEi0l1zKajKjVbOtMEa8oGsyGwQG5uE4si4DW/6OcE47ommM?=
 =?us-ascii?Q?aekHtR7Qjf9/eRbFovU9X5cGZE6dR5rbXg3vmOvLz7fHB4OsTBpK/v6H4JzD?=
 =?us-ascii?Q?LiOgWhsq/w/i5/Ycn3kPpaB5yBcRz4lPvxz/5gjdxoZBWj8D1SoTZPFx1lAU?=
 =?us-ascii?Q?CqxUHmCO2XB70EDSaSBTA3esy9ts37ryClPxKtHNrEY4NlEeUIuZDCY/NNxM?=
 =?us-ascii?Q?qRJEPy6XbE8C9e/+Sz8EascuWU649fjP44R58lQKFzfzqXFswyYq6I9oHymx?=
 =?us-ascii?Q?ZJV0iHIp66lSlTw8eiBRHhp/QUQHKqSS5AQTwyCWkZtm9WPV3rw3/5/kKq19?=
 =?us-ascii?Q?bs7TNQASaFaFFDnf6SzOzBbWJEsfzPznLOsuhjDYexD8HFy/aTSmQXaIYG/S?=
 =?us-ascii?Q?FqvHKxxULLJv8qqSy1iaYNx0qaD7Jt2bubp2xB7YofDvqLpQ9WgvhuBDm99H?=
 =?us-ascii?Q?B6gg91MKUWiEO963j//wwNoiWXsRFwQNV8AQaS6WjBQpfWpJx1Hn6YHADJOh?=
 =?us-ascii?Q?Bb9hbtme4bKH+I8Q4pMPoKLgI21JbW8Ldh9TH+sINBd3oWJcBPhJprYS4Sxv?=
 =?us-ascii?Q?UsBq+rOIZ9gFQRQdLiHwPNAdD3U4NUYdp9M85lGTc+9RQu799itXgalxGVdp?=
 =?us-ascii?Q?FOh7euy2qtH5nzmzUZ5wmB4kXw1+r/dqZ8yQW62l8NLOV37Y3JOn2CsDyVVP?=
 =?us-ascii?Q?cwJy7BSZyV5EKfXaU35Zx/SGXVv5x+oMrdr5KWK/ogZeHlmBcHL1lpJqXaki?=
 =?us-ascii?Q?tKwFHgv7CxoEWsSx3LADq+915q2WDELDdl6yt1CcYQBOO1oC8dzyVwoh39/H?=
 =?us-ascii?Q?+JI76i7+Sw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa624b6-9bdc-4432-bfeb-08df1270ec2c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:00:31.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3HCzA5lD9xI/QDnFpoUisIAS+iHLQgwWdCb/Bt499RcAsjB+YN+NTvqfYmMdpN1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9083

On 11 Sep 2026, at 23:04, Gregory Price wrote:

> find_next_best_node() picks the next-closest node for a fallback list
> from the full N_MEMORY set. Refactor it into find_next_best_node_in(),
> which takes an explicit candidates nodemask.
>
> This enables building fallback lists with non-N_MEMORY candidates.
>
> No functional change: every caller still selects from N_MEMORY.
>
> Reviewed-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> Acked-by: Balbir Singh <balbirs@nvidia.com>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> ---
>  mm/internal.h     |  6 ++++--
>  mm/memory-tiers.c |  7 ++++---
>  mm/page_alloc.c   | 13 ++++++++-----
>  3 files changed, 16 insertions(+), 10 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
