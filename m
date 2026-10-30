Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.30
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793397744;
	b=LxhZfq8rE2UWrDLWr8Dz5b9nAz6OcR4HkggT0fmxlBQkddyRY40OTUMmictkoK9VCPIB
	 o1bOQpXGBItz7XjaBHzVCwDAzqAEJUFYe1k/DViH54VL3yoVnf6JAtO2Rs3GWy13wigNy
	 crtgrW3qrKj1fk74tA1kdhFhO2tNfLV+Xsj8/e2b84eeiAQBuGejz+QznJVCToRG2D2+l
	 hg0cz7r/ax7+/YDDqX6EtT23HwRIV1e0gHaEJRlVkrn2qt8kf93RdoCbuJ8Atoh9sPa6c
	 72Eokp816Bln0/1xMRL3N3c99CihvnyJGizQFrP1CspnZ8MB3rmsn9iBkEymWG3u38A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397744;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:X-Mailer:Message-ID:In-Reply-To:References:Content-Type:
	 X-MS-Reactions:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=HQceay80JDe3GT8M34tIz6aAAkVUQipEXZ0DTu/4tCY=;
	b=Ir2T7741ZYn5XbM+QQ6MwT2XUpJG6Dmjkt/5ZniuO2JU7vihMQE16nocVEhdsxeliGdt
	 Th+L8S3vDS2FbhtkuzV+g6kz6zNhgWmF0xRWvh6o/rO1otjBDqMmkXPnwTaN+QmNKJEIR
	 s7rb5tvoHeEYZuE7KXC04j9DrmaaTnsXCSptqPheF2me+qPbr8gUlgZgNbMtiw2rOuT2B
	 MIWz+iACjfsx1u0c2LZkIQz7Kkp6t6lKzZQC6fpKHhTnE9tcv0Lshj/CJLEdretNkyFeK
	 Bc6gz4f0ZG7lb7VhBBuq7h1blRqTaZQAUqv2b/GWQAQFaiGGESDo4zlHaN5lizCYxzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DyXAHFmS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.30
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A87606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51A87606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DyXAHFmS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VeY83hTFwJIMK8USIkKNePsP+qxSaz8gCYEWlSDoFJfbVBSTmvB46l6t+xt7Wi8oixGVWEZfPDPn72qJlxPAFWV7GYwDW3vCnsSqKDXf/xWKbfYWV5e58zRovKcz/zQulT6ZIrLHZYInIVaBB5yw1sess6O2Bsxrlnxqey2c8dICO5qss4cJDrmFcYfaAnbMr8XSFG65MX1JVJkKrKPgXEZ3AgziiKamJM8k2C1H8Pqrm5Vem1aaLK+ocn/guz4O3GLCURueVzq46f2hENio+YAM9zOvgENO9/FW6Rzhg6ESfb5Zs5XaqkN8g/S4GjdqKSyRLXTYj9Gpn4RQXH1/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQceay80JDe3GT8M34tIz6aAAkVUQipEXZ0DTu/4tCY=;
 b=sU3jGXpUQL3oIsucaLY/ydRcRhbzgfKa8BpSUh8DoOnpuTeIXxpn0IxLSSSmjVeLq661IjuogrCrHraLe7kzcy5IRDgJPL7oKtS2jRQhjpQfbAaugTvjXMmkN4KHZwcXBPxnqBUZIJGRWAHI9SXoDYsJxhMERflUEBVLpA2TthAs/0rnQDJcQDsgmHmH8pT11VrgUucw9b/dF+1I5T9NogpOm/6tx/iZM/K/x6oF0R0IvGgoPYPM3vJX06Q0rN5yE7sE4NvhLhbxoyHn7L88rnXVgA9DUZb+QAUuxPtQvjQXPOPnWl5Sx7ta/GAHsfCvYWgnz4NK9/xVPTKj0Kdu+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQceay80JDe3GT8M34tIz6aAAkVUQipEXZ0DTu/4tCY=;
 b=DyXAHFmSPKDGfZb7Ze984Wqpl/sRhq92GyS30QdTcrmO8gYu0lIA/TwAThI9korr/VeBkqZd/L3QmMMfMvZd+x5ocMyQoOCOrtcxijQsadxpd3CCm9cpTmuEG1myYIIhjSzXyj4xGN8hph5As8VGP2EubAc9kLfyipJIC4y5kENi9ZzPKiRR0XosHEQToJaL0MVCqdFPt/m/SFjlQuzs9Mt/UY5mEL2gtNfdNns0yqfobkzU07vGmQ6OuGYklBt2fK+YeJsVg5OO5JoqBXq08UfxgKkBAWdMaoTrazBmFyAKlDoFJjz4dk8U1zi3ZRq29h+QJmDpk9aiW66ZHa8C7w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 22:02:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 22:02:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Byungchul Park <byungchul@sk.com>, Chengming Zhou <chengming.zhou@linux.dev>,
 Chris Li <chrisl@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Dave Chinner <david@fromorbit.com>, David Rientjes <rientjes@google.com>,
 Dennis Zhou <dennis@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Gregory Price <gourry@gourry.net>, Hao Li <hao.li@linux.dev>,
 Harry Yoo <harry@kernel.org>, Hugh Dickins <hughd@google.com>,
 Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Kiryl Shutsemau <kas@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Miaohe Lin <linmiaohe@huawei.com>,
 Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>,
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Nhat Pham <nphamcs@gmail.com>,
 Nick Piggin <npiggin@gmail.com>, Nico Pache <nico.pache@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Pedro Falcato <pfalcato@suse.de>,
 Peter Xu <peterx@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>, Rakie Kim <rakie.kim@sk.com>,
 Rik van Riel <riel@surriel.com>, Roman Gushchin <roman.gushchin@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 Uladzislau Rezki <urezki@gmail.com>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>,
 Xu Xin <xu.xin@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>,
 Youngjun Park <youngjun.park@lge.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] MAINTAINERS: MM updates
Date: Fri, 30 Oct 2026 18:02:12 -0400
X-Mailer: MailMate (3.0r7038)
Message-ID: <9F491125-3214-420E-AE00-AA62E7EEE8A7@nvidia.com>
In-Reply-To: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
References: <20261030-maintainers-v1-0-97278f8a5f54@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:208:23b::29) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: e02bd59f-7beb-4c38-bf34-08df36d174d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|18002099003|22082099003|11063799006|56012099006|261009223027099003|261021121427099003|261026140227099003|261022105027099003|261028144727099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xB9qx4fHPIdmL31pxNX9A3gQewZboBclCE9nCi2rLZLZ1OhbrZMYByOtCleCEc1mMvyP4Er5mdCifbqQYPcx48dmFegIycLeou7IVrUqOg3f8NO5EW9RfBQJyDAFj88FlU8ciG1tqfZgbVOh2sMhbEa5E+MC5yCswLiDlqFkFTM9UjaATo4MnXxp66JnaZb554/ivr11D6IJ1xELTIEGAapaZhzoHgEthFiQqB+fbnavWJB7ZAeuicDQMyYk53u/PMx6rO8iTbItDgPRHZxnwcL/yiaKdH+G4Y/oV4Jc7eEAmsxDVVfBHsVXlVHZl0Cvsa1jP4ZD4twjrGV5m75LR6u4ikDzk7UtO5p2XNewbDL/9YhiTF+P9c6340OkR9Xnx5IrZsPbJX7oRsf6mD8jwI7HwHAOIEWVPQwGJQvtdfd/yDz9SzQcnujesVDBreQguAp6pkecFJJ1BKdwp6S8ACdmCSaQnTaFKMAFVG0xj+6jh/GCylAHbkw16G5ezwh3RBofsetLMCmIh5E9Yjh0Fkr/MG1Ypw0Jn6lxEBQoymZ0R5ngm2JVSOZ7gIJ2021GbKcMs6nXElxfUSb193NEuqh1YrMRIEvSASJs4LNX+Qk18J1D328Ez3x9NdLCuf8wI8h+JfljD65YPergpOkIsLOEVpJZj3tESHz7NI6kw4Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XCU1Dyr4A2lnAdeSJXbkJxnZkFyRhtrznbN6E7hdxDvjKu3EfPFqnx2B/+df?=
 =?us-ascii?Q?2lT44r4Fx0y+IV45++R0L4noUAIcuNQvLHFk1tgS9h43Vty2FD/1i+k8yyxV?=
 =?us-ascii?Q?nNxVmcyGLRW5pn4iGGOaNrFKMltP/eSSOQ9p9uOVbEZq6htFJh+bsSPXef2s?=
 =?us-ascii?Q?SLzC6VJpZg2GviN73mwQAPb9ZMuVVKBABrFTfIkgF/oIzskRvCYVT0vWBWZp?=
 =?us-ascii?Q?Wf0rewWhGwFZPf1GVDZbfw2oSzglnFXpc4/V0p6Ai3HHTjzwBpvHCiwRQGC8?=
 =?us-ascii?Q?BHRmaFrtotEflcMM01cfOc8Lno0pHQLPz+jvDHsA4GBdFa0viiFGh/+N74jc?=
 =?us-ascii?Q?edm2fpIEZE44VX4vWIB5+vp0awGJfK6uEB1yNjbQFNGcgLLt2PGH6ZfU0xTf?=
 =?us-ascii?Q?ddvqs4oeWmRRiprhCSok8nglAv+EQBhNnFY5OLc869iyJ/77liLo5SraBKmw?=
 =?us-ascii?Q?w6onZLbm/oML6Sq0EOT64GIiYXbZpIj0UwzNrLxtmjek+HrMQRJe+rPJAggM?=
 =?us-ascii?Q?pF9VA9X8WqNWy6jff5/x5Yd24OWDiHaDm29ttm3wbMeXvbTRSamFtk80lBvR?=
 =?us-ascii?Q?Pnqlnfs0mQ30TfUawgxHIin4yNg9TURtFPGyZdQuebNPfIYP5V19PoZ4rwgq?=
 =?us-ascii?Q?B824NhRXQNNzjgrApjKZScq5hAZ4+BuLU5PHZvunx4EyOnOnskI3a6TpJt6j?=
 =?us-ascii?Q?TiZYenCocqS6zoRbzb01QtEXGGQ2wpX/VuLmxcGKSJTBlKN3dEWVa8kCce88?=
 =?us-ascii?Q?Nw/eZov5pjwSxd/XmkdJqG78w3+0SWc4DbjfdYvmqB1cYn5+o6B9Buwq6Hp0?=
 =?us-ascii?Q?+IWh0YEh6Sfw0+ooiTuThdJBNl1UgDqDyP7zCZII9tUZoAq3gLjQWl/Plxg5?=
 =?us-ascii?Q?Tk2qSsfHtLKPI6z9FdHcqDE6DwXinKX2kiBn2tZcF5mj0ttdAUf1RDbCWtqZ?=
 =?us-ascii?Q?EqQds4MA5RZMR3zKdM4Np4PwQlr88reOUuC5FKZoIG5zMLh4FSmxl8TlCZE4?=
 =?us-ascii?Q?Ie2hEAYm6B/Nb36Zb/cHDf2J4MDLGebQNDoFJGkg+EZ5smGREBYOsjmNH6P/?=
 =?us-ascii?Q?Bzq0Bdi1pXv7C+30hjL66KtF3Y9n1vQegG6ah9KTXPEdfD4+xNpFGD2tTtBN?=
 =?us-ascii?Q?MfUrNC9Z+H3etib6wxvI4oWpA2Vx4h/87TeoWFBrZlaWx397b9vHdbJEIoD5?=
 =?us-ascii?Q?6uamdF6bLmOepm00bnTi31gfksfYIDympHhW1BGzOONmO+6VqXkvwNo8NdaH?=
 =?us-ascii?Q?h0PfADG6vcqhgfXeNtMbYM6ti9kO49s2PyfF0QQ1XmfGfQdkFdNygDMGawzS?=
 =?us-ascii?Q?5wGu/4/E0Zdoe/F+f9emx+XdDMgkryQyaM8tbbJNTflEaKF9AKjPyEriCaUE?=
 =?us-ascii?Q?+VFlHtNgKtnK/xBwQxnxbqgFdtEr1AoLSJlIm5MEld46doCit6hy6Rw9mLbY?=
 =?us-ascii?Q?E40IMSuuBVTwGffj5ZT4Twof6X1z0mHRS7qTjiayWRuA8/GLKq3TFOh+X7u9?=
 =?us-ascii?Q?BtqMMJgk5R2NqXzRYG/NWM1hFk0YyyLpkdEWYICpEpGKt381pMVQsqXT9+H9?=
 =?us-ascii?Q?wK9ZZXYqI8NfPHSExFxKnohbmnkFrSbrqn8AXKm443B+E5kZJGpwqc2Cul3B?=
 =?us-ascii?Q?KTVHdI9xWdIyYKyNezOb0EgFKVoWYFM//iA2P2P+RKU2sp2mmu4a81NpGIiL?=
 =?us-ascii?Q?XZUd1TZdXeueRuo++9QRzrXHuZl8XtRRl4ztevvDXHIybrBg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e02bd59f-7beb-4c38-bf34-08df36d174d3
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 22:02:14.7393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DdllCIOb1L/yiqZfQAAChjH9gnh4kqJ2iR1+s6iHVZc7629of91YABNgY6V6YOxt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

On 30 Oct 2026, at 17:34, David Hildenbrand (Arm) wrote:

> Hi,
>
> several MM updates:
>
> Make Zi Yan a THP maintainer (thanks for all your hard work over
> the years and thanks for taking on this responsibility), and perform some
> MM MAINTAINERS cleanups.
>
> Then, start the next step of the transition from Andrew's MM tree to
> separate component trees that all get integrated into the mm-next
> integration tree.
>
> Start routing shmem through mm/core.git, adding me as a maintainer
> primarily to pick patches.
>
> Then, target the following components for the mm/core.git tree that I
> (co)maintain:
>
>      - MEMORY MANAGEMENT - BALLOON
>      - MEMORY MANAGEMENT - CORE
>      - MEMORY MANAGEMENT - GUP (GET USER PAGES)
>      - MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
>      - MEMORY MANAGEMENT - MEMORY HOT(UN)PLUG
>      - MEMORY MANAGEMENT - MIGRATION
>      - MEMORY MANAGEMENT - NUMA PLACEMENT
>      - MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>      - MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>
> More details in the last patch.
>
> In the upcoming cycles we'll then route more of the other MM components
> through different trees.
>
> Let's see how this goes, in particular with the continuous stream of
> fixes. But getting these in in a controlled way has highest priority
> right now wither way.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> David Hildenbrand (Arm) (7):
>       MAINTAINERS: mention for-next branch in MEMORY MANAGEMENT - MEMORY MAP
>       MAINTAINERS: TMPFS (SHMEM FILESYSTEM) updates
>       MAINTAINERS: add Zi Yan as co-maintainer for MEMORY MANAGEMENT - THP
>       MAINTAINERS: sort entries in MM sections
>       MAINTAINERS: add missing files to MM component sections
>       MAINTAINERS: rename and move MEMORY HOT(UN)PLUG
>       MAINTAINERS: route more MM changes through mm/core.git
>
>  MAINTAINERS | 165 ++++++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 105 insertions(+), 60 deletions(-)
>

For all the changes.

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
