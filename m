Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC52243E484
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870287; cv=fail; b=DlnDo8psHmy0lkt57oC6ZCEzpIQ6+bgMj00XsNnBx6lJPKqrEoplUnoGZ+Ne7uNasE1ZAi/RhVK3D9absv+lquVgHj65XCDeZ7ooxNrByLuFmLNoVwZ33K1ZjnfojSHIIOWthjZuFBwDm1SExI/clX1WsxCqrjKlgJkhMZfzQuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870287; c=relaxed/simple;
	bh=YwnKBn3EqCTVc/r2rdX7pIu36yEMCZCXHXQ5OzH26pc=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=eADd5BwOqTcP9if7kDASvBTQ3a4FkY1K2K3YFXiZmt8Wqu0kk8dFWUkex5cdnhPYj2wc8xowTigxa53jqdwdI/9Oh2r4oVTiNS3ofyLpjdX0IdDHtOmIY+oPciDE+7QYomVXbj4+Q7N6W5e+VYFZ7obpkycwjvZLFnDwQOMs9h0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XJEE4hwY; arc=fail smtp.client-ip=52.101.56.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XJEE4hwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FC6en/IlDpR7GllTXmD9mU8qRWQnLQDSpHRZI6z1hOTWk/U4IFuUnOxprD+So1QC5fmfuvSK8jvAXo5BBO4L0EKrLx5Ayk/ehe06XtxGKfBE3OGjyLQqG/6j5TcQUGKHOo+XqjumFFrNCWg5KxMfMsHqcqXbP9gqr3Ejf+D17pFL3gkgrfhpocTsIC4esWi0kvUFcw8gPwUpv9mp8A/4HRr8GOTafYtG3Io8X5YxATmOkySpBoGq6wNWO9Eu0CSOWAzSgU5bXRSXNVpDqkmT02Z4Va4/R8xKwH+69yTHQk0i9aeZqP8jHeYJTQyl/0HMfGbcEINCyy+iiIeUnK+Sxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JebeRBM2yWEvaAKT8yxwdAismABECoKt1r+3mPM4Bs=;
 b=H621W3PAcT7LNa93CSZLvfFtArbcvSn0XMz00EJI8D5LeLQmF+bxfW62++WRKBWBj8//MwahJeJOF/aPtO8FouWCLX2SicjlBc2iJGVsEXN+QxRN11B8on/AFXHft/cZQ+uuxsIS7ltM5kqi9OH4KCn49HorxvfUWuz9eA2ReHAMTGDV7syaukPxIiqeQYH15BQCswaMX/XbXTe0F4fHYQnBwp+rPD3BfHFi2zf1v/q4gkAhPzcBYIHQLBt9Ue8/ustEKzZMZOWn8aZENWADEJfpbdGIwmhxqVVYg0o6BR7hjY76cl1lWDPyEctFDvtTCj6HzjFcaA0bwXGrrJiIEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JebeRBM2yWEvaAKT8yxwdAismABECoKt1r+3mPM4Bs=;
 b=XJEE4hwYBXiv5bxcOYDW/bUS65Vj/lZsebd7flDuZMA8XZXlZLjnX9TzMaRwZPjKqMnc6jWvAlZe5Tb7BOaMf/2DPcUqNTO/bXWF6FwKPMgSwTynNqYyZ0gGx0JRhvSgu42OCBtYEMmgNll95LzJuC5eO3xD+OI69tnzptKe0cOkyUR6RfAN9s033mxUHf5ysCpqShiD9Ti2KDY9LJHDUxWhkEPizwfE2w5P44phxT7APqR83BVs3DPSvV8MfWVCxGXRliymenKDw+XtWxbCqqv6nmmRTRr7co2Q55qpMaa85+t8KOcbZRnzr8SOj6UoNL4L94/JoeHhR7ePSxzR2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 12:24:41 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 12:24:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 08:24:38 -0400
Message-Id: <DL9XL8T6UG93.1T1NSJMI8PISK@nvidia.com>
Subject: Re: [PATCH v3] mm: remove min_free_kbytes adjustment for THP
Cc: "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Liam R. Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Kiryl Shutsemau" <kas@kernel.org>, "Mike Rapoport"
 <rppt@kernel.org>, "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko"
 <mhocko@suse.com>, "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes
 Weiner" <hannes@cmpxchg.org>, "Hugh Dickins" <hughd@google.com>, "Nirmoy
 Das" <nirmoyd@nvidia.com>, "Dragos Tatulea" <dtatulea@nvidia.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Johannes Weiner" <hannes@cmpxchg.org>, "Vlastimil Babka (SUSE)"
 <vbabka@kernel.org>, "Nimrod Oren" <noren@nvidia.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260901190123.3511535-1-noren@nvidia.com>
 <d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
In-Reply-To: <d202dcc3-d7d7-4e98-a9a5-3137cfbfd041@kernel.org>
X-ClientProxiedBy: YQBPR0101CA0203.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e8e776-08a1-4486-e648-08df0da427ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|13003099007|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	q+tCZhs8EdEpG6weRS16+MNVz1xtKbeWznGKt0pMVoWX0GJvC8EeoiSmAt35t37tsGdlbK5N0xMEiY/5FGQQPLfBJATaERGbaWTua2pk2wxOV+vgcv9OlSLzLfqO0F2mY1iQwLm9/IvRqA2Em0kQjX9/ZOftkXINScx+mRtWU79nuNIVCoz9KvJBr4sD+Q2pXuL/NA+oW7GoatYWoyX9RcQjHLqBqwN3vaQn6H1LfNpdKcInlQo/Nh8dztIKmvSx+uOYvnwtbf4jHi7A9q9OSzOLlYR61rEDLgAaBieubgSOYSWnw6eUHct3yEQ2AsRPp6NEn2leLFQ8UqmF5kZXJHMDKttUGuCqR67N12AcOht+TNG1Fu5WSfCPKiRjJJXbPUpxI1grLKoNEHL/1XeN8hMirbFBIR6vq5Y014vnYjlFewkRdxbQZp1148Ct+rK5C+5FzjIxKLKUuP7yVjTXoYyKEqKnrWfHnDH51LFYqsjZMJgfvckArRZljtEfmEumEXpAp2EfCUT9PThSGaG8pEKrnvrHsjz72jHvcZ/6bF/x+JVjsgeJ8TkQRdVzydR30UpZlzETkZqGQkIfZgqe+lQ5JCCp0F69/potZ8Yt59p4zsgUy+sLOGK0qF/I20DNVB+VVYiJTt3uKI/D1IMl3Xo7AUxSrJHZR4ZGR1uXh88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(13003099007)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3FGNXVrb0NyRVArUW0wdEtjUGhTeWxhRlpPbjV3Z2k5TU1JUmlPdVlVbTRs?=
 =?utf-8?B?REI2REprN3NBeWowMFV6d2QxZFF0SWUzYXZWZmxtZTIwN3VBa3I4VDZLaHJo?=
 =?utf-8?B?OTRKa2F6ek9GRVIrUDk1OWV3ZUlVYlhhSUJBQW94WUdDNzNSL2p5MTVFQTZH?=
 =?utf-8?B?UUJ1Q2QwZmhWbzgycERHNGJRbEdNVUV1R091M25wWFRYQURuM2FuZE5ZQ1BK?=
 =?utf-8?B?QzVySzBBZkl3eTdBT3ZYMlJ5a3hvclNLQVBEbWFBdXNIT3FrWVBDbjRNdzBT?=
 =?utf-8?B?akVLOUErOVF3RTVybHZIdHR4TEdodWpPZ3hjVjUyc1ZwZVV0cllYTXBmcUND?=
 =?utf-8?B?N1NDOE91QldqS0s3Si9aNmdEU3MwUUtaSXhBYW5iT1VibWo4SncwUFA3bnUr?=
 =?utf-8?B?MWVuMDhnSVFJeWQzcUp6cjlYY243bmd4aVJPU2YzazhmZm9vWVJTZ0p3QVFu?=
 =?utf-8?B?OWRVbnViZjdCVmQ3QlpxUVdvbkg2WHhiZmJqRHVYWXZ6QTJGNDF5VEhUY1Rh?=
 =?utf-8?B?bGtLR2g3SkdKOWJXNmFxa2JRU1loMUJpbndueTZMWFFIYnhqZXlxbWovazZF?=
 =?utf-8?B?QXZadWlXeWNVK0RzTEVQajBrMHoyYURSY1dWanhrNUhVYWxoWkVFZ05iNGdP?=
 =?utf-8?B?TW9BOTZnZTgrKzJnZE9GWlRndjN6ektpRG0zTVUxMllXY2RwZk1LUkdHcGFI?=
 =?utf-8?B?TWdSR25RMXZaRjBqaXVJWXRVU0RkZ3RxZFlpai9xcDJlcW1oK0NqVW5FMm5X?=
 =?utf-8?B?UUxXbXMwbWJMcGpLMjNDVVNEK1VFcjgwYzk5UjVhYUU1cEVlMURVb3hhUHV2?=
 =?utf-8?B?cTF6TWZyYTAxaUc2NDRRcU1naUVtQ1hsODByVk1jQW1Wd1h3Q3AxMEFtNnJG?=
 =?utf-8?B?OVB0WGxYd3M3bGNSVzNyc09XM2VFa21UeTI5ZW9hS01yejUvaXhObFoxcEov?=
 =?utf-8?B?MlM3bTdmajRyYXBPbzdJYldSWEdhbkVQS3RwNHdWcTNMWEVzUnQ4SEN0eUda?=
 =?utf-8?B?Qi90cytZcHFUcUxkOWJibXdETkN1QUZHTUtRb2FZMUJkWndtTXpodC9VQ3Jr?=
 =?utf-8?B?RFN6eXYweldVVnVwOW1LRk9hdStiSlNRN0Y2WmRiNDUxZU52VXhKZHQySWsx?=
 =?utf-8?B?K2hHUzNjUlZWQm1paFJwVm8vdldSODJBY1l6N0o5NHc5dUxFdWVkRUV2cUxr?=
 =?utf-8?B?amhwRnRLd1UrM2x1U1dzYnU3SDE1UTd1QVpOR3RmVmhoNlgyaDBlTFd0UXdR?=
 =?utf-8?B?bHJDWFlGL3lmWG5mdnU2YVYrbE50K2IyNkNSeDl0TldqRGJVaHdQS0ZvcjJK?=
 =?utf-8?B?U1RyOHJPM2djZS9ZQUFLOEd5V3VHN3BDLzY5dExtc3V0Ym5NRzdCOStZWDFt?=
 =?utf-8?B?Y3NjT2ZQVGQzR2hlL2ZtZ0FKWWNxcGpVTTRyV01TZWlPc0x3d1RMTVVBaG1T?=
 =?utf-8?B?ak9SZm9nTWd3WDVLYVZwT3hxek54MmNFRGg5QThRdlRmV0FzWTRNQ1Rac1ZD?=
 =?utf-8?B?bDkrSXppNzk2OENwTHlXN1l4M0FSV05FTm1uZlMvd2ZwMFg1clFxb3BWTWcz?=
 =?utf-8?B?cW4ySE54Ym9UbnBSSlc5K3VPM0t0NUxNaEd5ODhnQmRNT21jeTYvVDNsd3Jz?=
 =?utf-8?B?TTc2enFhZEpNSGRJT3pneW9IT1pHMDR6cjFFc0xpRTMwSEhqSnJSdFZjUVhM?=
 =?utf-8?B?ekRPYWhyampMNENZNnpSNGk0bnZuTytWZjVRcEF1d1dEZWVmZXZvSVlWeUtw?=
 =?utf-8?B?T3N2ZWUxaXdocEJWNCszTFhZK2NzQlhxRlFyTiswQ2s4YW9JeWJjcWVtWnRQ?=
 =?utf-8?B?VDZWZHJudGtIbHp1R09OM2FXbUtEZnhHY2wwaFVYVVU5TzUvM1RkejZDSVpM?=
 =?utf-8?B?YjhTMm5nSmdCUEU1cFdEWEZidnd1dm95enNZL2tETjJYbTFCTEVBVjgwZlEw?=
 =?utf-8?B?ZkJSR1A1ci9iMTQvdjBieHEwME9IdkxPY2g3bDd2RVQxZ0M0K0hwTGQwRExt?=
 =?utf-8?B?SmtUSlErYU1sSFRJSVByM2dQK2Y3NFE1SVpaODNoZm1UNUJ2MnpFTVVsaENp?=
 =?utf-8?B?VmVtZFd1bDBVYy9laGd2ME1aczlNeGk3MzBzcGJuTW94YzdkZWFldTN2UkVY?=
 =?utf-8?B?aVc5TDhWVGJ2ZXN6UmI4S01lZjFGSHpWNGMweFlLdUsvR1FGNVA2OWJXbnRx?=
 =?utf-8?B?ajJjNXhJQkdWSWJCaDd1c0pJQ3R4Z1F3VWVqY21LV2JxWVh6d0xwNmM2MEtW?=
 =?utf-8?B?NW4xOFhzUFRWNTNBUGNLNktYYjdyT3JFb0RNaGVHYUhjbGZ2anJxd3FvQXps?=
 =?utf-8?Q?LRxEE0PjdtFn6O/hPy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e8e776-08a1-4486-e648-08df0da427ed
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 12:24:40.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oR742Gfik4y/agxR4YiuT0hd1N5vVxxGynIw/g5Yqbix4dFRfDBSgBc/4+iNYcg6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594

On Tue Sep 8, 2026 at 7:54 AM EDT, Vlastimil Babka (SUSE) wrote:
> On 9/1/26 21:01, Nimrod Oren wrote:
>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>> allocations.
>>=20
>> The recommendation scales poorly with larger base page sizes. With the
>> default arm64 pageblock sizes, the contribution per eligible zone
>> before applying the existing cap of 5% of low memory is:
>>=20
>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>>=20
>> Even with that cap, min_free_kbytes can reach excessive levels.
>>=20
>> The automatic min_free_kbytes increase predates proactive compaction
>> and many subsequent changes to compaction. Given those changes,
>> increasing min_free_kbytes for THP by default is no longer clearly
>> justified.
>>=20
>> Remove set_recommended_min_free_kbytes() and all associated
>> recalculation paths. With this policy gone, min_free_kbytes is
>> controlled only by the page allocator's default calculation and the
>> vm.min_free_kbytes sysctl. Users who want additional headroom may set a
>> higher value via that sysctl.
>>=20
>> Link: https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.co=
m/
>> Suggested-by: Michal Hocko <mhocko@suse.com>
>> Signed-off-by: Nimrod Oren <noren@nvidia.com>
>> ---
>> v3:
>> * Replace the 1 GiB cap with removal of the THP-driven min_free_kbytes
>>   increase as suggested by Michal.
>> * Remove all associated recalculation paths.
>> * Make min_free_kbytes, user_min_free_kbytes,
>>   calculate_min_free_kbytes(), and setup_per_zone_wmarks() static.
>> * Drop the now-unused declarations and khugepaged's page_alloc.h include=
.
>> * Drop the obsolete v2 documentation addition.
>>=20
>> v2:
>> * Use a named constant for the cap.
>> * Drop explicit linux/sizes.h include.
>> * Update min_free_kbytes documentation.
>> https://lore.kernel.org/r/20260831075635.2244437-1-noren@nvidia.com/
>>=20
>> v1:
>> * Cap the final recommendation at 1 GiB as suggested by Lorenzo.
>> https://lore.kernel.org/r/20260728202014.2517142-1-noren@nvidia.com/
>>=20
>> RFC v1:
>> https://lore.kernel.org/r/20260716173504.760369-1-noren@nvidia.com/
>> ---
>>  include/linux/khugepaged.h |  5 ----
>>  mm/huge_memory.c           | 14 ---------
>>  mm/internal.h              |  8 -----
>>  mm/khugepaged.c            | 60 --------------------------------------
>>  mm/page_alloc.c            | 11 +++----
>>  mm/page_alloc.h            |  2 --
>>  mm/shmem.c                 |  7 -----
>>  7 files changed, 4 insertions(+), 103 deletions(-)
>
> Given neither of the patchset versions achieved universal acceptance, cou=
ld
> we try just disabling all the automatic (re)calculations of min_free_kbyt=
es
> the first moment the sysctl gets adjusted from userspace?

Sounds good to me. Johannes, WDYT?

--=20
Best Regards,
Yan, Zi

