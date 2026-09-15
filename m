Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FB23D9674
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789440143; cv=fail; b=q2pdAgCIcgUw+i77OhqBnlisUY+1WMrGAEEyrK6RbcDTql4Sm8ShXi/bO4t9d8Uqf0VOpmwaZ7QK0MHB2D84BIRGbfhvm67cNkmC/5f2hWR0okPHmlniATgoqY1EeobUfnJi1Mps4H5OLxyjyfLrsgZBPsdDQpzUnHjC2HNFDC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789440143; c=relaxed/simple;
	bh=Eu6oVTYLpIeepsULdDrSZ/puyyiPucVtXC8yRIoObdo=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=URa5s5Tawk0gTquhauATrrQMKHDIpNsSQ/EKqMmzGuhYqYZKMrC+c/M1z/2c6C3s2roM1AIY/6WYg9MsHLG3Ry74H/cPXfEDTes0EHyJTn+GN48gftmqCA0u0Xl13gJF2UTR2fdMPYqvFCfwJte88q4iMAzzReLkEuS1dn8uQY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=no1YtQJg; arc=fail smtp.client-ip=40.93.194.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="no1YtQJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqdKY0oPzgYE9rqiu47BDknfrQfo0Gk4IAtK5eNEq+es+gvIQKQttI9492StqNPiH2lfxyWh78Bp2RAQULnmQT5ObUpPeEoukALqY7TjyN61uwFHJv9e6QunrfVIJ9OTIIGr3gz+MZKa1VeQEn07bbXO2NyvlLNCSYwKyAQGb4ThclTwrCrEhFzYei+R8MSsuDhChSMFvGpHOESkE2MMS+lJ4sYHswmkh6Fla9DZSgpkWPbuN4o+EdWJBBJSUv1in/VGffFHYLrt3nPl2+Os+b8OfcxdZ7OXhG4ACBP4jElr4UfZpj1qWpKWfVJGKk1FiPpAVTZhOHZSCyq21ThhbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6GHwrCgt+227TMaavusyWRAWFB/3w63V2xefeeTdpE=;
 b=xqfQNE4v6fJmSvv/9EK2KCB2un5lKsb2jUnXNADQQI2wDxPwwhO9CqBech91vf5JIclaRYS3tZCzbE9AaWDANAX3jzICwfmeOcwvPF09ife4KuL3UzfmuLqXtH8BhX+nMr6+oREDihl3VYVVs3T3XgOVjBMkVd/zTsPHXFbG3vS/o7VfSuYnrD0DxPi7f34ASUvCn+QOxFNOLZzfL+7YDAQ+AcVJHTxxZossasWkfo1s01QGoLXnsW0SYuJ69v+g4mw6sUmrTOy41DMIh8D/RCBSC9TXCqIihZEusWZgMHwsLaW4VLUece535ZwlWhFehmePITgsBy9CUDJhBzbNKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6GHwrCgt+227TMaavusyWRAWFB/3w63V2xefeeTdpE=;
 b=no1YtQJgws2yarQCMDS2hZc3uSNO7Vp8BZf+VnxydiqkGt9em9nKpobmQK4xd7zV4KuD6k10xl80m+uIsYH+umkBcn9haGzk4pN7B4dM1irQ348puzGn950mU4c5UTPYGiI8HoLPJzVPQBpzsCxvuHJ2z/XiSFgY6HOn++U0JpfNFW2XDdAo4d2vxo/85lv7v7D9xe2DcoaN5qKxDLNNYK53wfsZR48fMuMSr9y7nb4+OUghWXnl6Jusk1glyxNK4EzQsmv6zkW+GJmowrf8TfHZ0qtWaX7KOFXcG5UwCZ2xh0F06798rgBn9w5UDKRSMbFGWcnptm469XtmB1KmCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA1PR12MB9531.namprd12.prod.outlook.com (2603:10b6:208:596::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 02:42:18 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 02:42:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 22:42:15 -0400
Message-Id: <DLFJL5U9DI6F.3QJP9YP0KX636@nvidia.com>
Subject: Re: [PATCH v6 3/3] mm: implement page refcount locking via
 dedicated bit
Cc: <akpm@linux-foundation.org>, <andrew+netdev@lunn.ch>,
 <apopple@nvidia.com>, <artem.kuzin@huawei.com>,
 <baolin.wang@linux.alibaba.com>, <david@kernel.org>,
 <Liam.Howlett@oracle.com>, <edumazet@google.com>, <harry.yoo@oracle.com>,
 <hramamurthy@google.com>, <ivgorbunov@me.com>, <joshwash@google.com>,
 <kirill@shutemov.name>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <lorenzo.stoakes@oracle.com>, <mhocko@suse.com>,
 <muchun.song@linux.dev>, <pfalcato@suse.de>, <rppt@kernel.org>,
 <surenb@google.com>, <torvalds@linuxfoundation.org>, <vbabka@suse.cz>,
 <willy@infradead.org>, <yuzhao@google.com>
To: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <cover.1789239015.git.ilya.gladyshev@linux.dev>
 <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
In-Reply-To: <ebd6540ad89a4bb80e2a62d00901b5c827315b66.1789239015.git.ilya.gladyshev@linux.dev>
X-ClientProxiedBy: YQZPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::28) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA1PR12MB9531:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5a342b-9240-4665-43a6-08df12d2f56d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|6133799003|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Hludg4tJjrkRvI7nH6pppw/B03ug5q60j3HDYDZ2fuyP+DkNhZQiNQvMAoK764GVznvr8knchBj7mdXdfek6mlMj/3L9beWKvOb4B1rgU3Uq4ApiSGSgZKr32OZK4ca7td7u8oXZRE4pT7ktcbYyPRDzjcMrWkG6fGTM4aIyo9F7rfRxiqJ10pIWFU0axmNySU5T770Oph1FoGOUdPu1gBWr9WpPoV/wuL8CPRISivXNeXQTxFqr9tFMe6jtdSfWwZVqz9TrgdB5yoXPKwGbOKIp5q+72IPaebPge2dn8BS+4jpbFJ2QQb/HCs5FmzisBtbnI27eX1DkeX4flsWvUIzmtf3mPzduBCVPymjonTl6rO7RymsxX6Q4fa4qQ6mxhTq5O7o7kxrmaz/Q2TG/TEjCx6YqunqMtZ0JOotPalwUXZQlXp46MzDpx/ZE/nOAGXc1qsOoSvrx3PNgmk22g1KKfRKPSkMd5blqZXs+5SbnEKzyVEzBC1XB61cGcHoLAg1wI74dYgmoSrhOiGtIZkCwEpcrxvw2XzeHGEjddwLAEbe1qqTfMI+8Fv4z+xZzVy3MOZvXvQOgOEzIk42LiWjTmjNLDe4RM/1LULxJmpqK25ijsyr6Eecy1k7U1OpqAQD+Rx/44SmXFdm6cAiWgioSGQgBqZOsoLi4hc8CKzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1I1Um5sbUwxaW9NcG9ycE9lQnZHdlRVMjRvaGcrMnFoVm1mL1JjNFJGUnFw?=
 =?utf-8?B?eVhnY3NESlhPcnd3WXVKb0JlZ2U4eTdtalhGZ0M2NnFZK1VmNmZ2M3NHejFp?=
 =?utf-8?B?THdWRGo2azZ1UHorUWZXb2pGdmloRjZNYTZ1SVB5eGV4YllBVGNLZlptZFN1?=
 =?utf-8?B?UFF2ckNqY3RWRzJXQzZObENjWmI0NmpaeFZVZ0E0dEFvZUlCa0JkeTBSOTlQ?=
 =?utf-8?B?RTVYSm0xYjdEY3lBMVVyNGVENjNMRmNaTjdEVUFZSkZETW9qTUtJaGFab3Rs?=
 =?utf-8?B?Q0paT1VHYkxmN3ArcWdMbDJFZ09kbHFBbUlXeHFVeHM4VHpwVlhFZm1jd0Vp?=
 =?utf-8?B?NE5SVUMybnJ6U1Y1Ni9qa3N3K1dpdi9YeXFvLzdjT3B0RTB1MFNqL3BiemNW?=
 =?utf-8?B?WEFpS3hQbjFxaVhiY0t2LzQvdHpNK3UvR2o5U0xYZkNGaldwakVnSFk4K01h?=
 =?utf-8?B?Z2MrSHBQWHR3UjRYQmRiQk82UlBGeWhCQUVMcjRzaHNPUTNzZyt0a2k5dEhV?=
 =?utf-8?B?SjJWOUxZTjZVWTFHd1BtZXhjbmFBUnN4a21jSmlEVy8yekU1bFJJWG8vUWJV?=
 =?utf-8?B?alJINDFtTjdwSzNtWHNzNlVVTkhUUENiVFRSaFV5NjB0V0xyQU52WVUzYXBT?=
 =?utf-8?B?alVwYzRIb2hzMkVCZnRrNndSN05OVUhIcXVTdWxYa0wyblFPME5pZkwwQVNG?=
 =?utf-8?B?MjJuL0xNTXZucUdHTVVSeHcyY0RVczRqcjlGWkVvTkxVV1RDaVBRL3ZSaWFV?=
 =?utf-8?B?aW5vNE8rQjUyOHpQOHJ6aGh0eisxOFBnTkU1a3Nxa0hKeWlFbTFGOFN0LzN3?=
 =?utf-8?B?d3NxMk1QZmRwb2swdjliOXdTNDBvemNta1dKSEtWS1dDUDNXblNFd2I5TXl2?=
 =?utf-8?B?aTVjWUxxSk5HNlNvUFhuZ25Pa3FIVWNmc3pZSmhHaEk2QlgxYlpCTENPK2pn?=
 =?utf-8?B?ei9pVXYvd3llTGZ2Ykk4MjA3VzcwOUNWajJ6UEh5WmJCQXl2MDgyZHpvUlBR?=
 =?utf-8?B?SnJ3VHk2R0NzQmV2OTFMdnhQMkxIblRHWEw1MlhlcDNVZTR3M0diU0c2cy9i?=
 =?utf-8?B?TWtqQ09hVmdtL0F3U0N2TXd6NTJOV3ZtdVhWRXNDeCtNZXNGbHpUOEVIS2JQ?=
 =?utf-8?B?MWlzaVJNRjlKdndYRWRqakZ0MEd3d0NBQXlkVzI0bmJveFZjWjl2YTFUOWg4?=
 =?utf-8?B?aWFQY2lvUzJjT25teTVxUHpINEQ0TXVWSkFtYVcrdFRyeFVseGNEUk9oSEtO?=
 =?utf-8?B?RDhpSFBYZ1NPMGhNUTFTRUxnSkVpS1pzNnJybzJCTmZFSjRObDFKcGV0T0pj?=
 =?utf-8?B?aE9lVXIwU05veXhkRlNSN2k0UUdYR0VRSCtXSE15RWFYZUlBYllDZzM1RGZ4?=
 =?utf-8?B?K0NSOVJuNnpMRnhCQkxxSzRHZFFnV2pUeUY5bUJtNTZTbnFTV0hCR2J4Kyth?=
 =?utf-8?B?MzBvbGtzUmdkODlSOGNpSHp0RTNlMG1lWGU0Um9QZy90eGFEaGsreEs1U29M?=
 =?utf-8?B?MWtyYTlFZ0FzanlrdnVUT0RONGpITm9MMUJWUXBkRDNrR0VtdG9iSzVjajRK?=
 =?utf-8?B?bzBTZTFLdGRiVkVrSm4yWU01WXB3cTJFMW1xUDZFNGw0OWg1NU45Qnp2Yy8z?=
 =?utf-8?B?ZWpLTkloVW5yZ2hXMms2NHdJSDBUZ21MVlk0MXYzck94ZVFSYnhTNUZPTXp3?=
 =?utf-8?B?bWRYV2U1cG5VWGZkTVpLWWNWNFFmc2FCOS91MDl3UHVqZ0xrUWo0d0g3c3NM?=
 =?utf-8?B?MVFWMG1wc3Jsc29tTGRmcVBSS0NiV0gzcEh3YWIvRmZDdHYxMzZQNDhWOTFE?=
 =?utf-8?B?YlBqWndiWTY2YUhkYkgwOUxkQnpjeGp5ZEtzR3o1MVpZVm1wN2lZNlJPanlG?=
 =?utf-8?B?RDVVVXFaQ2tLbVJjb3pEb29HNWRBRnl6eG0rRFBGV1M2UlFaV0c4ajFTUGtW?=
 =?utf-8?B?Q3E2TFNIRFJHWGRmRzhrWHB4N2VzUUpPT3paUE83WWVSNnZaRzJoWWxDZ1hw?=
 =?utf-8?B?bTIrVFI3dDhYT0pCWkdSOVFMUzM0bUZETzJVQzJ5ZGNvam1GeitSd1hUc2FS?=
 =?utf-8?B?Z2F5VGRXQ2d4NjFHazhNQ25yNithSURIUnI1Mk8xdVFkRmIyUEVXU09vSjVW?=
 =?utf-8?B?UlRzVWpJaFdWSnQ1OGpVOWw4RWI3OVN5c25ZTUk0aGI5WmRxR2xlUnNxNnQ0?=
 =?utf-8?B?WG56SWdxNEIxeHBoa0N3VG4rQ2lnZGlidE1uamxQK0VYWGJ3Wm9nbk9pMVRh?=
 =?utf-8?B?WmsvemtvaVVtajhwUkJ5Q0wrU0ttdzZ6WjNqU3Z3ZFVEbmo3QlE4b2RoYVpn?=
 =?utf-8?Q?1jN8b6XApeGvV5lBuS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5a342b-9240-4665-43a6-08df12d2f56d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 02:42:18.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhxqhVdIcZpNqK20JdpVSbMsmDk6ozRG2eJQMa/W4gGgm3gdJNwHDSwPNnbw7+PA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9531

On Sat Sep 12, 2026 at 3:50 PM EDT, Ilya Gladyshev wrote:
> The current page refcount implementation uses a single counter value
> (zero) as dead. So, to prevent incrementing a dead refcount in
> folio_try_get(), it fundamentally requires a CAS loop.
>
> This CAS loop can act as a serialization point and can become a
> significant bottleneck during high-frequency file read operations
> [1][2].
>
> This patch reallocates the refcount value range:
>
> (1) refcount < 0 means dead refcount (uninit / frozen)
> (2) refcount =3D 0 allowed only as a temporary state (see below)
> (3) refcount > 0 is a regular reference count
>
> In other words, refcount is now split into "dead bit" and a 31-bit
> counter.
>
> Refcount decrement now works as follows:
> 1. Counter decrement
> 2. If it is now zero, try to put it deep inside the dead zone
>    (CAS to INT_MIN). Or you can view it as "set up frozen bit and reset
>    counter".
> 3. This CAS can fail only if someone grabbed a reference in-between --
>    that's okay, this page is their problem now.

I am not sure this works. David raised a concern on V4[1], where if a
folio lands to page_frag_free()'s free_frozen_pages(), it will not be
properly handled. "this page is their problem" only works if every
folio/page free functions call a generic folio/page free function that
checks the page type and does the proper handling.

Before your patches, only a speculative page getter can see any page and
folio_put() handles the last reference drop. So it is safe today.

Let me know if I miss anything.


[1] https://lore.kernel.org/linux-mm/086b119c-b777-46ae-b087-798ca3e44ecd@k=
ernel.org/
>
> The size of the dead zone allows performing an optimistic increment
> inside page_ref_add_unless_frozen(), replacing the previous read + CAS
> loop with a single RMW operation. This reduces cache line bouncing and
> improves scalability, especially in NUMA scenarios.
>
> [1]: https://lore.kernel.org/all/20251017141536.577466-1-kirill@shutemov.=
name/
> [2]: https://lore.kernel.org/all/CAHk-=3Dwj00-nGmXEkxY=3D-=3DZ_qP6kiGUziS=
FvxHJ9N-cLWry5zpA@mail.gmail.com/
>
> Reviewed-by: Artem Kuzin <artem.kuzin@huawei.com>
> Co-developed-by: Ivan Gorbunov <ivgorbunov@me.com>
> Signed-off-by: Ivan Gorbunov <ivgorbunov@me.com>
> Signed-off-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> Acked-by: Linus Torvalds <torvalds@linuxfoundation.org>
> ---
>  include/linux/page-flags.h | 13 +++++++++++++
>  include/linux/page_ref.h   | 30 +++++++++++++++++++++++++-----
>  2 files changed, 38 insertions(+), 5 deletions(-)
>


--=20
Best Regards,
Yan, Zi

