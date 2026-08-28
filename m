Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010021.outbound.protection.outlook.com [52.101.193.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA0B3242DF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882254; cv=fail; b=Vdb6m8MYm4p92wIQih1/l4faorn5vtZX2OovfxaCKO/bccUDU8NByXv8JrsnKZ0pQY90jxpHneWAS5C5UQKyyTI52zu3XRuIuQYfzJ72ZJli2OIfhg/vXuPMx6LoyO7EDhwGEiqhiTXevlvZxr5ajPqN40/I9F/U0EVOlxJFmwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882254; c=relaxed/simple;
	bh=bhgXta6ghow7uTEVne49+Wv7upAEJd2KYlpMl7S8U70=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:References:
	 In-Reply-To:MIME-Version; b=OT/rmsBt7HM8J25SF9ShHRv12wGsgSXETWZ5reR7YEGQbnhPEoMmF4J5r+41HLlDA5qo8JUN7J5p+Lkrqb+3AFSdkvhiw027OPJFsbvbD66gnjG8/vcIB7lmiaCpvTPJzfCWuqzHGdBilFDirQzL9grcIiwbTkGbkPVGbCM4DTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h81jkvJ0; arc=fail smtp.client-ip=52.101.193.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h81jkvJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HenubNH7EakCj93fFa59DwfVBSODpDUwrztved6FA6bLK3CCP/0H73IZmCUT5HiCSpCn5VyFeqP/ymgMDIiBpBRO98LD3nbtvK7ZT2BjivyK34mXO8ddjE2Anml9BwqDaZ+ufmLVW/CXoqeRKpo3LtR0EgcQMWscw0rXPEACOX20yw0CLWiSENWZTOnlUkVu0hcsLlaEU/B6f14aaoAc9Nsef7nnmDlZU3APoyfK0t4d1hOS2JtB0h9+kS0g5H/J2UtP0vht0E0f/cvNF7tVEIwuRvlRq0c887XavaM3SNE8hrzR+0XE/z5xQK/T1xt1Logh6Dbcm78Y7oks3MpjEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=noUbmMJ11ufufRtkRrBG1FfDnNRRZJH+rUpAWaj9b3c=;
 b=gAL9lCHB6itELzcZyotpPLm8yTMYhTcLasYSXNmf4QPcGOOChHD6E1T+0zi0p6UuUQ9tR2WHH3ThfOJ2HhmehEMJNQP39VLmZtea5rpigm0yYpvLUGauG6qMVUkJVf3SFcjl0P/QZpWf8OnTr3ZqQnf2lo1DbBMbyfbriEMAW+0ezdWC+H1CLWWC03hxaIKSDvLIm5KbztecbV2tx1GjnOhtk0r750V0ZwNqJme6UtYh+dGc6KC+z5YWFmsHtFypcO447JjbDhaSs6boKsa9DBy8hRSOI8SFw0rl0EPsW4UKQrF1vHuirA1jzTrpbnqczp8h05luijD/mP9v+4HOhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noUbmMJ11ufufRtkRrBG1FfDnNRRZJH+rUpAWaj9b3c=;
 b=h81jkvJ0eKczzosFSCerb21Td/xe5ETPVgVjHzQ11d0Gu3VYiZ3qJojO26SpHJKJQJBoaCSzJavfAnueYwE53VlFeVaOBsTT3fjR5OLVgqeEUAoChMOlaV90ZqTniZ5KTwyD7zsWxbVAvKIPyE0WZYWYIZ6YKkuKC49B/CkTHG/aj6b9js5RsEfN8SH/ZcVx7g3SqNjR0C+kBAAOv6EKUikR2usg4u6xqde/wSFAnzLxpQvNcf6MPJbh8obpkoeQSHI4BKWDBBhxdrPoOwN7ZB1v1/hh6SU9QDk9ZdGwLClTcjGnXwbq6dJltH0mP+ern34EaINemfPwoMUsYpHVeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 01:57:24 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 01:57:24 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 21:57:20 -0400
Message-Id: <DL07CYI5866P.2HCBRH4BWPMKN@nvidia.com>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 1/5] mm/huge_memory: do not touch frozen folios in
 deferred_split_isolate()
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
 <hannes@cmpxchg.org>, <lance.yang@linux.dev>, <hughd@google.com>,
 <baolin.wang@linux.alibaba.com>, <baohua@kernel.org>, <liam@infradead.org>,
 <nico.pache@linux.dev>, <dev.jain@arm.com>, <ryan.roberts@arm.com>,
 <balbirs@nvidia.com>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: "Usama Arif" <usama.arif@linux.dev>, "Kiryl Shutsemau"
 <kirill@shutemov.name>
X-Mailer: aerc 0.22.0
References: <20260826162101.1314941-2-kirill@shutemov.name>
 <20260827163838.1813081-1-usama.arif@linux.dev>
In-Reply-To: <20260827163838.1813081-1-usama.arif@linux.dev>
X-ClientProxiedBy: CYXP220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::17) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5d61b2-c48e-46e8-e518-08df04a7b424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|22082099003|18002099003|11063799006|4143699003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	CKTugI2lwEUaRekORQXWAS3uDgavLJ0rrN8dTTQLFXSPjS2RYp3jdUNRfEXe0xX1riRCih7btWB593VWUyS/njzBSeu1f/sBYecaMz6Hx12MYQPkd+/MFg/TxEKl1uMJ2m+RNEeAg/MN4OX7JS6D/GMvG2ugKnpfnBXV3I3MWp8FfFd5kKBA0gdoWpFbp2lLJSNP7wPZJV0czWSlatSNdszm2VJykuSxFdDMeAQz6/pZcEQBveAn7eU5ivWAVSwQA/uJT1rhLfSnOTIDbg5zqdykm/F2fd9g6wL7Lv4oxGNehDxAhrJAklQpKwvEMXGcg8TJhY1pkboy44tyqUyyYawsQxap/UmW3PDAAMPmIumC0INb0wd2LUpau8nCEuRewsUV3HJbgAnGLx2g+PtGl1bEIQE+QhjU47mcsNOR7z7Sriij/jLDIgDLcxXtoS3aVDEeENlQ2aq6tAD8U8HCliJEWlO07U0JsNu5Z0S82lj+rNKb27yKO5XHWMMzgWOOE5xuAKT/eNhGWbxmdq5lB7GdI4bhtCmow+rt4IB7VubEqR6m79sTXyYCaA8gkY1eSUr817EKdoBRq9BmdXfswyh5xaYx4cfOak3rSmCqOt5aB3p5Mellr7O8AsjuvK42HPWcDp+/xAG1hmtQrUQM07At+GPX/6SPc/AUh01J8Xw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmRPOWlpUFdaUERyTFZMc2kzUzhDTnBCSkI4S2dreEFvNysvUTRtcnd1d3Bo?=
 =?utf-8?B?WVpoNjJ0K1JQMUVMTnJoNnB4RXdUaDJ4TFdQbkxFWjFRZkVLeUFIem1CTDJm?=
 =?utf-8?B?Y25OdFVuQnF3eVdUMkhRWnRnWlUyYmFWeER6RWhjbGsxbUxNczBDVm1TVHJt?=
 =?utf-8?B?bktCYTFoMDV1YVMyYmR3V21YcWdZRGRtajNKcXF4TUk3b2d4TjVzakljdkhj?=
 =?utf-8?B?amxjeFNQaDEvOTd3MURPS0lEajdRbkozQ3lpakN2Y0pwaHlFdmFjaVUyc2NC?=
 =?utf-8?B?SjdmV0lNcG15eEJjWExkemg2UkU4dTNxTEtsZjJZcDhqUjUwVmNkU0R5andX?=
 =?utf-8?B?L1ZIaGNqLytsZTNmYnlvc3BlV1FyUUFvaFpSSWhpMlp1NUs3Y0ZTTEVwZE92?=
 =?utf-8?B?ZXV0ZDA5R3hLb2JhTmk3VUI1ejNpVHFCRVFJdktEM0tvdEtwRmI5RlZCdGlD?=
 =?utf-8?B?RlFVWExSOWdteGR1aFdhT0ZwUWxLclVheWhmcW5RYjBXenZteDBFZ3kxQkdW?=
 =?utf-8?B?UFZSUUViWmZaUGIvbkZ5ckhqOWpncHpZNHBIb3pFWjZxdXU0di9uaWNlWDdW?=
 =?utf-8?B?RXVTK2pGcWg4alZsYUp4aXNiaFBhVDZvNWVIS0o2bndnT21JT3NjVGVEUUho?=
 =?utf-8?B?WWdXWFUwQVdSWjh3Y3MwRlc4OGF2Uld6L2JFZFVVN01pTThNb0xMWTY1UWxS?=
 =?utf-8?B?N1FwNjlhYU9ZUmVGS3RvUDZBMzFBVi9tR2UyU203blhzUXdZaW9nZlRmSC9w?=
 =?utf-8?B?WnhCZVhJQThFVDVoOU94b09yWWRlMVh4bzhDQkFua0drb3N6eWhveVVJY2c2?=
 =?utf-8?B?UytRbDdUR2JNRW9Va3lNWTJXZ1BJQ1lDOFowV1ZGck82bVJZSk9jaEZqWXpU?=
 =?utf-8?B?L3FybGJnbGgrcmpxdkFjcnJYL1lSQnJEUzMvbEJPcjZTZUsyTUNvZ0o2RjM4?=
 =?utf-8?B?V20zVXk4WTNEY2VBd25wOUdRUXpEbU1rYmxST2dBNUR4Qk1LSW9DeDVPODEr?=
 =?utf-8?B?ZFJndW44dTdDVnEwQWhuUnY5N0pZV0NmUXRrRHlOcWdvNnJDSGN6V0twcGE1?=
 =?utf-8?B?Sk81M2tDTjF4djFmMVU2NkFCblVDWDVid1g2VjgxaXlaUVc3SWtqbDEwTEMy?=
 =?utf-8?B?Z1IrYTY0RDhzNnpHZCtTRTg3aXFqZmxUUDhwMVJhL0tCRzdPSVVObGhRZktz?=
 =?utf-8?B?Q042d0FVMHBKYUZQc2FnT2MzL2VBdUVhdWd6MTcxa0t6V2V6Y21EL1ZmQ3RV?=
 =?utf-8?B?VUppVWFjT1g3SkJCS3FST0VmcExQa3lUUnB5N2U5cFNDVzJWSXk3WHg3MUhp?=
 =?utf-8?B?ZkF2dEV2QzdhMkRGV3hXRW5MTVpNd1g3VnlzNVFEZ0Z2OWEvTXc2MjE3Rm93?=
 =?utf-8?B?ZFRPOUl6bWJsR1lJWVNLV0RBQ29NcHdQdzk4VHA1K250L3dqMjdkNURUcEor?=
 =?utf-8?B?QkdDbTBRWVYrNlpYdXI2dmlCdWRONnR0dmtQdHd1NEdVUE5McFIyci81SUNx?=
 =?utf-8?B?ejkvUFh2QVRhT2J4RGRuazVzOWV6ZUpZcEJrUloyVTlIdTFVRk1JblRMTmZ4?=
 =?utf-8?B?cEpFYm4reHBqR3hUR1BxUklEUTlvcDN6ZFp5b1JWT09YRThOUlhFOERCMlVJ?=
 =?utf-8?B?R01LS1hka2tPOWVZMG0xYWRwdEEveGNLODFwbjQzdlJnU3pNSHN6eUp3ZVVR?=
 =?utf-8?B?V1dKdCtKZjdhRjZOSjNzdG91NFUrU0NJQ2JmSjVZNDhlbGpaa2toQWkrOFpW?=
 =?utf-8?B?d1g5ZDRNdXVlYm9yZGFacDF3L3VpOG1aVis5VDZZeHJqcHp6ZlNyRlRLaFMy?=
 =?utf-8?B?ckdjcDVJcnNMbnZ4Ym5TNUd1MFVmbXlKUUwvbUhNbkNQV2p6cnhqelBKdWZ1?=
 =?utf-8?B?L1F5ckdUVjg0TU9QQkR4aTVad3RDdXgwWVI5UFhDcGtaU3p6VEh5T29NSXBa?=
 =?utf-8?B?Ly9WTHlDRVZZSGhuNXJrNFkrTmw5OURnZDdhbFN4MW9YOXRPTUJ4SktKSXZ3?=
 =?utf-8?B?NytSMHBIengvNW1CUCs0RmdyTlhLRUtBTDljUHpkeEhta3MyYWFESkNFTkhp?=
 =?utf-8?B?SnRpNlEvYWFxQVpxdGJkMTc2aU1SNlNETHpTS0l5Y21tbkZLRVlPWmVWRE9a?=
 =?utf-8?B?bmlUQStxbmpGdWNqUGsxWkdXRTE0TVhYUzBLODdBR0hzdHl5WE84bFI3T2pp?=
 =?utf-8?B?OUlkT1d0S2F1UXhGcWRPaWk1cTM3M2N0Y0FVSjhFdGtJbDJaQ0lyQnBFYnVv?=
 =?utf-8?B?QnkvbUFMNUtCcDVGZjBHdVJFTDZzN0ExUS9qWUIramxEM2xSZnIyQy80cXg1?=
 =?utf-8?Q?rXybTLmxTEafrBQZAb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5d61b2-c48e-46e8-e518-08df04a7b424
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 01:57:23.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YQ/HNbU4qNIhbTLt4Q8fFczrYqnHbQ6IqHXeX7RmlRbp8BNGucWxEOBmKvQstZx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

On Thu Aug 27, 2026 at 12:38 PM EDT, Usama Arif wrote:
> On Wed, 26 Aug 2026 17:20:57 +0100 Kiryl Shutsemau <kirill@shutemov.name>=
 wrote:
>
>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>=20
>> deferred_split_isolate() probes each queued folio with folio_try_get().
>> folio_try_get() failure is treated as a lost race with folio_put(): clea=
r
>> PG_partially_mapped, correct MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, take
>> the folio off the queue.
>>=20
>> The folio_put() race is the most common case for !folio_try_get(), but
>> it is not the only option. Another scenario is folio_ref_freeze().
>>=20
>> A zero refcount in such cases does not mean the folio is going away.  It
>> means "don't touch me" and current deferred_split_isolate() doesn't
>> respect it. It can lead to unqueueing folios from the deferred list for
>> no reason:
>>=20
>>     CPU 0                            CPU 1
>>     ---------------------------      ------------------------------
>>     freeze a mapped folio            deferred_split_scan()
>>       folio_ref_freeze()               folio_try_get() fails
>>                                        folio_clear_partially_mapped()
>>                                        NR_ANON_PARTIALLY_MAPPED--
>>                                        folio off the queue
>>     give up, put it back
>>       folio_ref_unfreeze()
>>=20
>> The folio is still partially mapped, but it is no longer a split candida=
te.
>> Nothing queues it again until part of it is unmapped once more.
>>=20
>> Skip the folio instead: whoever freezes the folio, owns it and owner is
>> responsible for its fate. It also covers the folio_put() case:
>> __folio_put() unqueues the folio via folio_unqueue_deferred_split().
>>=20
>> Reported-by: Lance Yang <lance.yang@linux.dev>
>> Link: https://lore.kernel.org/all/20260824131224.73344-1-lance.yang@linu=
x.dev/
>> Assisted-by: Claude-Code:claude-opus-5
>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>> ---
>>  mm/huge_memory.c | 19 ++++---------------
>>  1 file changed, 4 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index ced400f72d43..6281ed993243 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4590,22 +4590,11 @@ static enum lru_status deferred_split_isolate(st=
ruct list_head *item,
>>  	struct folio *folio =3D container_of(item, struct folio, _deferred_lis=
t);
>>  	struct list_head *freeable =3D cb_arg;
>> =20
>> -	if (folio_try_get(folio)) {
>> -		list_lru_isolate_move(lru, item, freeable);
>> -		return LRU_REMOVED;
>> -	}
>> +	/* Lost race to folio_put() or the folio is under folio_ref_freeze() *=
/
>> +	if (!folio_try_get(folio))
>> +		return LRU_SKIP;
>
> I think we might have a problem here for ZONE_DEVICE folios?

For coherent ZONE_DEVICE folios, yes. IIRC, private ZONE_DEVICE folios
are not added to deferred split queue.
>
> This assumes the final put always dequeues the folio, but ZONE_DEVICE fol=
ios
> bypass the generic folio_unqueue_deferred_split() path.
> With memcg disabled, this can leave a recycled folio linked on the
> deferred-split list?
>
> Should we dequeue folios in free_zone_device_folio()?

I think so, before mem_cgroup_uncharge().

But it is a pre-existing issue. We need a separate patch unqueuing
folios in free_zone_device_folio() to fix commit a30b48bf1b24
("mm/migrate_device: implement THP migration of zone device pages").

>> =20
>> -	/*
>> -	 * We lost race with folio_put(). Read folio state before the
>> -	 * isolate: folio_unqueue_deferred_split() checks list_empty()
>> -	 * locklessly, so once removed the folio can be freed any time.
>> -	 */
>> -	if (folio_test_partially_mapped(folio)) {
>> -		folio_clear_partially_mapped(folio);
>> -		mod_mthp_stat(folio_order(folio),
>> -			      MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, -1);
>> -	}
>> -	list_lru_isolate(lru, item);
>> +	list_lru_isolate_move(lru, item, freeable);
>>  	return LRU_REMOVED;
>>  }
>> =20
>> --=20
>> 2.54.0
>>=20
>>=20



--=20
Best Regards,
Yan, Zi

