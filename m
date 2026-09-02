Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C4339377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313811; cv=fail; b=B8sHC+LHwMaJaFKncoQ1l8vyKhcflUYZvr+1gy5eXRNrrSghEJaV3gY8YNESVsXEoa1TBkcahzNnHy1CKnNnbZDHzGnIUh5wBNINdU0SIArQNpXQcwDflpVanB1Doq1aK8e+T/KmI2evyZ1WIJCfbWo7J38yvapKcStd7LK6xdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313811; c=relaxed/simple;
	bh=1JOWEf+YfIftiLlhS8RGZZyyPVU2jPfTV43oFk6lSsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i5CwbaN4+omtJdPRY0UK6DY6T+q+GoKwbs2tPvENwht/Z/wpzVpDzaPKTadSn974TXflu/1CfMj1dPPYqK2UMV8Otbvwzp1PwrIoYtGy4daYVAUdSNj9gW9+LubN8+8QjGz8T7odrA0+oiOt4dveEW+qDpR1JORF4WIzB7sMn8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=O/xquvE+; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="O/xquvE+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzIdIT5UazHThsqaUN+98hcHdxmdVHn//nQ7gP1QKF1DGnHEWHc7CCi2OOaB0eTiPd5IoODdhLgt1V3RDZS8U3QD2zLnc9FdOa66XzGCQRQ7ZqWR6vDWBQBoYnGg8a3L0qaw+DuskJo7/SJRgi6edYl5ogo4FqS77JE7GbJNK4pG3rW5YPMUGm9r/VdOD2VGoPMyLOiRdhBHIxVc11PGY1dmm9YmMysce7mTuBEc4iWy5/3t6ir8IYt1eUdt9sPpzHY0FAHACFnCiCSMPrkxAbYr+yMgNsMp2deMjPKcUW94xAM9y7ak1Ka3UTLz0xjkfNW7XzrzwB74URrizyYBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZwWBjVuzcupxCS4COolcGmd+OenU72vY1n9rhBaljQ=;
 b=AN3qLUXHkgUJaPf4QHHulHGEELaKvjkz9Jlxs/d3zmRYJ6qG3joztunl+A3Hkvy01xGJ0bTpz+xd5NuCgVl6m7cUwLtxSnHPs4tQqhKko04XBFzCbgdcwXxGIYMlStYxRWAxQf23WJfSDgInQxYKA6YNReN+hcWrB3iIBsWwkI+2UCOSdTthpNQhmbgUJsm3yKM1LxT+OL6Q+2qs5PYjUOoMHtophxgPs6uJCM98PSBryNXicoA+yKlQYJlgSqR9j2lhTYOzGci9Bm8ovIQGqVAc4qPPOpBnSG9uQwlV8tgxUU+gTUrgMfiSjRCeQv2Y+QQfxV4+4cU4yUAnirXSLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZwWBjVuzcupxCS4COolcGmd+OenU72vY1n9rhBaljQ=;
 b=O/xquvE+2diO7I7mc5DIxFJe9dYTooUV09n23Wc2VJvLZ27gwCotZUEjAcn7SUZtipAH55Bw9MQXzvC5rDd+y3bk/ML1TbFjwQEeOnDmuTX3NRvm3b7oogI1JivFxP53WXz9B++arTT9LxlDJ96bDIp9M+0/Vf8DbhSCEIQWcDrwLzxi7WecR5R5AfT8RTxAsFyvephnzxWYQYDOZk14PWHEBppVTm/JIrlkUa4kOdAMdzOdyJmWggApOXHR4NRArFbzXI6k+JrmSPjHpD0X9ZAgWl2zXbM9gNDq3SPNpYmxtAAMR+73f7x4BUu7d8tqVvfm9pSsaF+NDRTM4hnnpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA1PR12MB7711.namprd12.prod.outlook.com (2603:10b6:208:421::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 01:50:00 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 01:50:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Nimrod Oren <noren@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Hugh Dickins <hughd@google.com>,
 Nirmoy Das <nirmoyd@nvidia.com>, Dragos Tatulea <dtatulea@nvidia.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Date: Tue, 01 Sep 2026 21:49:58 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <69C018F5-A1C8-47AD-9567-3497AA6808EC@nvidia.com>
In-Reply-To: <20260901220917.GM3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
 <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
 <20260901220917.GM3004@cmpxchg.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:208:32e::24) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA1PR12MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 232415d6-9587-4e84-7e09-08df08947fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zKzlFZylXTi8fDnop6T2GVCk7ufr5V5TFQ2Ssw9mE2AuMjvPGCSL0OfzdhXf80svwg44K4utT0v7TR++urr0/kAyXrBLIRsHJYRQBNw9YC6vVz+px4jVoTzMdwFS8Yy7Q4FuAMleFBuvAiF1DgPOdkR+uIvwLD3Ki/58C3Ij3AxzfGPdRsuI9Bo+wjdxmvw4PZ6anQopVEnGpNKPSaMzIXerdJQdKO/0emF+WDWjoO2uW/LFR073eutXJFg+JRh0hnmP15dhjRfstyZKJkVHiUNS7f0UwmETmx9/VCwfcza5+HcCSWvRqJiNYAsbuTyLxmPpZarmcix997SLZTHCslYyCZcssYv+bAJS8XnU4tPOz84spfUU5zcyjshw7rv/bSPXzYYrGTknNOvKHrLy1zLsTHjTVlpjJS4Qu+wKT3jCrN3PrYLQdN/E32k1DaH+eTQF5xp1TvXJi+ozSHJ651zZ+IV+Z5mp2XJxVAf8wMzCMJuCRzkD7uhdXC4T/eTj522sTSLdkTW+ey+Fs64v3eeb6/cKcc+xulead+p97uLdkYveylM07+eGBomn5DwMM2zLr6WZ+/pNLIGV0njU0pkDompogu+gVXKe9GTXgDr8ZXh8I4Vbx4wd92HSShydfR1SQkb9RyVrgUrypVn6M6YGiXeLBf1hXvTZMncT/1I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jvMUlOYgdHlkFBo3RyzL+ygtbAKSeLzlyUqDGODu9yFGu2mgEzVSrTHE5tIW?=
 =?us-ascii?Q?OxHicNHqYvIx11pN43XDzfupWfWQm6MCggEnwQiKsfxmPFk8J2G2oKU0MtPS?=
 =?us-ascii?Q?zCM66snv1QXNYnSQkIBTC6fJaICbWvukiTSQzm/FVjX2b5zV0U9k7NjA/nQc?=
 =?us-ascii?Q?qJYaFfn/Ac0td2LaFsuCSMbQHUqr5xzrwyQUKctrFRLop4FxkOMbw1t5gS2T?=
 =?us-ascii?Q?jEAO4iQxkfVXdXp4XSIKPp2EnMj9Q0zSycs+wXbHH0u75WALaf4HkRM+mCKg?=
 =?us-ascii?Q?rzNhwXHijgmyBWGdLHvHs/cOjO4itCVpJuLNPVeN4SVeS5TSDWEL3O6Z+Xtn?=
 =?us-ascii?Q?F3/juNoXnQtNpUjlzv9SQgosfrBrx+8CeKLptV+sXFjg07jiEMNzwbeAuoh/?=
 =?us-ascii?Q?ftgN1opGTam4tyoP/l+wfuku8pOVKvk6/5SHtej3gC83MrNiDzu4En2VNemL?=
 =?us-ascii?Q?zcOaG8a2EjcGoK1htZrqYprSygvZB1VSxTL0HXF+nKTNCZJPfP36Ztq+vn/V?=
 =?us-ascii?Q?sX2BjPDXX5K/F+Dez+L5/V1WprG/iYB+cpEimMzFxIiy/IdNTzZJ4391Alos?=
 =?us-ascii?Q?yu2J6kD89i3Pwmp+X67XgLDm7tgxN2S5rPGfLj4pXlDKDHWsUxL5eevpTDWr?=
 =?us-ascii?Q?VQIbA+tXIsBHjN3vslvPZ51yVxI7xdO8dALt8zYgyrRIZb69H7mSyVn+ctyN?=
 =?us-ascii?Q?dWlK8PMnfsE8v0wx7x8eZ2XuqOHDqjvyaXW9EzFXQ6je0LKu9jIGftbyvDYP?=
 =?us-ascii?Q?skbnQYZZbGYetzL9e/JiRNdRDqcxZfUjz3o0M1B9gMO3XR/hHFYDozBKOnmx?=
 =?us-ascii?Q?HQOLKGfLkHhTcBKUdqnUuJU7wxGXVQBsFPy+u9WCxoEd0yfJC+kJq2AQ+LyP?=
 =?us-ascii?Q?AHnvMfUU9cHjXv/SKuOJXqpTGOp2JYtevv3yRKyxqvI6AlNLi86Yc8LPBKhP?=
 =?us-ascii?Q?kWkoHT/uBd3B+OE2TJMCN4VCve9vL8CCem2A2zsFSDgHqQs0XOGczbcpnKe1?=
 =?us-ascii?Q?9szqrjVrPousP+bPxuMNeLLPkq590E0qkFpE8RT06iXrPuP1fZKPSLfewsj8?=
 =?us-ascii?Q?4TMGplX0jH9vnKRNLrZdgDEnJxrgVJFrn2SKSaTdN9HAKFp523T90p3gn/OE?=
 =?us-ascii?Q?TLgrlhOgDQBFLZ7uIbj1vAX7UfLkA4kUfWCu/NCAfqsVQAXH48Pj2xtOT/LH?=
 =?us-ascii?Q?PJy3ZfdUoR1dKbQAmVHynj7v8VXkkP+AjBUUrGPsbs5ujgrQvp5bJU4i4PK3?=
 =?us-ascii?Q?M7t79DX7Vr5TGOGfgPhDJyhTYW+UTkh4VuZlJwwkDckFT7xvCw6dRv9m7bGF?=
 =?us-ascii?Q?n7cal01ZMzySPuUNtprNZhHqzyNOyDNrcWp72aSBPXB87Wf4ogXvBrAFd3hW?=
 =?us-ascii?Q?/ulSVc4GcnhhBd9E61oc4+2F0OX/ga4Je+9KolFsuakCsBw0hEWTR7Mpm0Dm?=
 =?us-ascii?Q?ZGl9cRM0lBJb0DFlwK/BmhwC2PzCwWP1z/KUgH5T3kbd3DcXRLc4SIAawrVy?=
 =?us-ascii?Q?PKXxhTJBf3ywqLoP4qbiuuylZfUaylgGU+WxpGfCY1M26DZ/qWGHpTULjAW1?=
 =?us-ascii?Q?k71hQC+4IbmJ6ZpI6Fy98Grp9pENhy1xm33cDkgK26mr4T4GWaJjFzcZFZTP?=
 =?us-ascii?Q?AbKLEQ5SaooBdT7+8A/StlDeiejz9E4agfl3wPqhAq5G4zKM/M8aD1sIn+Ar?=
 =?us-ascii?Q?XGee1O+yIoc9fElV6oQVcoHX/2K2lSnw+2HbJ+GZ2ZBIqEoveZ7vG7PLBhrB?=
 =?us-ascii?Q?73KktcRMow=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232415d6-9587-4e84-7e09-08df08947fae
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 01:50:00.1539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bNVRhwJ5i7lqK6zjMwpqq4UUvIV9NMQOWWfE5KnwNy6N3ZX9zcx/0AIyp2/U6ZIt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7711

On 1 Sep 2026, at 18:09, Johannes Weiner wrote:

> On Tue, Sep 01, 2026 at 05:09:52PM -0400, Zi Yan wrote:
>> On 1 Sep 2026, at 16:44, Johannes Weiner wrote:
>>
>>> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
>>>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>>>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>>>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>>>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>>>> allocations.
>>>
>>> We've had problems with compaction before when min_free_kbytes was too
>>> small on large machines. Competing free space scanners do a lot of
>>> work only to fight over a very small set of possible target pages.
>>>
>>> So I'm a bit uneasy that you didn't include any benchmark numbers with
>>> this that prove basic functionality on larger hosts isn't regressed.
>>>
>>>> The recommendation scales poorly with larger base page sizes. With the
>>>> default arm64 pageblock sizes, the contribution per eligible zone
>>>> before applying the existing cap of 5% of low memory is:
>>>>
>>>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>>
>>> I question whether pageblocks need to be 512M on those machines to
>>> begin with. After this patch, you're still asking the page allocator
>>> to optimize grouping such that 512M pages can be allocated at
>>> runtime. Only now you took away part of the mechanism to do so.
>>>
>>> If you're using 512M THPs, I would kind of assume it's on machines
>>> with a memory size where 5.5G for defrag purposes isn't devastating.
>>>
>>> And if you're not, it would make more sense to lower the pageblock
>>> size to the mTHP size you're actually using. And that would fix the
>>> "excessive" min_free_kbytes issue as well.
>>
>> But lowering pageblock size requires a kernel compilation. That means
>> maintaining two sets of kernels for different needs.
>
> That depends on whether anyone actually wants 512M pageblocks...
>
>> The ultimate solution is to enable better compaction to generate
>> THPs bigger than a pageblock size, like Rik's super-pageblock
>> proposal.
>
> ...or whether we can say, at that point, use gigablocks/cma+hugetlb.
>
> And then the static pageblock size for the fallback logic etc. can be
> a smaller, saner default for everybody.
>
> Because the point you didn't address: it doesn't make really sense to
> have 512M pageblocks on smaller machines, beyond the min_free_kbytes
> issue: Fragmentation events will poison half a gig at once,
> should_try_claim_block() becomes harder which results in less
> conversions and more allocations falling through to stealing, page
> isolation is more likely to fail, compaction locks and operates on
> oversized chunks which is bad for latency and concurrency...

I actually wonder why such a big pageblock would still result in a lot
of fallbacks. Basically it indicates at some point kernel allocates a
lot of unmovable pages that use many 512MB pageblocks and the life time
of these unmovable pages are so diverse, leading to all these pageblocks
remain unmovable and free pages spread across all these pageblocks. I
thought bigger pageblocks can keep unmovable pages constrained within
fewer pageblocks, leaving more contiguous free memory.

Do you mind elaborating more on bigger pageblocks cause bigger issues?
Maybe it is something more fundamental related to our unmovable page
management (which almost does not exit)? It seems to me that the large
pageblock amplifies the issues.
>
> Seems to me the excessive min_free_kbytes is just a symptom of a
> deeper problem.

Yes, our anti-fragmentation mechanism does not work as we expected,
so that we need an excessive min_free_kbytes to get khugepaged working.
I wonder why reclaim cannot get the extra free memory instead of
reserving it via min_free_kbytes. Maybe we need a watermark boost
when some consecutive THP allocations are seen to achieve similar
effect of boosting min_free_kbytes?


>
>> After removing automatic min_free_kbytes boosting, user can still
>> increase it via sysctl to restore the old free memory head room.
>> It is much easier, right?
>>
>>>
>>>> The automatic min_free_kbytes increase predates proactive compaction
>>>> and many subsequent changes to compaction. Given those changes,
>>>> increasing min_free_kbytes for THP by default is no longer clearly
>>>> justified.
>>>
>>> That's pretty handwavy. How would these changes specifically eliminate
>>> the need for compaction scratch space and allocator fallback options
>>> to stave off fragmentation during placement?
>>
>> Extra free memory is still necessary. min_free_kbytes can be adjusted
>> at machine boot time to achieve it, right?
>
> That argument cuts both ways, no? ;)

Yes, but with current khugepaged code, min_free_kbytes is recalculated
whenever any of THP, mTHP, and shmem THP enablements is changed. After
the change, min_free_kbytes is basically a set and forget thing.


Best Regards,
Yan, Zi
