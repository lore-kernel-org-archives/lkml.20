Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012002.outbound.protection.outlook.com [40.107.200.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A5B4D4886
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954046; cv=fail; b=SySYwj5g1xd+ZjCPvnuWc9hqNopWp7tztuos5Jt3mKlG/Xr5Jl6vVFqMMFWCoxulPhOtn4ucOvfSSzTpcEQ3NTT31wWQk7/UjddP/34aR6vGydpUncK7F91tCL4rE0u4Dvr9hFyL33Ly/uFuaA6+bqi8R8Tvoen6FfnXKktckfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954046; c=relaxed/simple;
	bh=Ay75nPliKN+jMsnnu/U7En0xiAwW7Yn0br7qJ9fcg4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eFaSiP+91ZAX6BL3VAASSfOunfxtgZbAg3M3XxE9RdpJeOGvRTnXUiCQtlx2KyGHEb39X9hyXs5JztSr/Z6sK9WlA0CjHHwjMMw+M0qIPhLixci1Vcwc9KPr3ay3nxey72FzJXKNbfkIK4p8UG+8DtFuZpOAMrFOWBUhbUBPQC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UQtHbkEf; arc=fail smtp.client-ip=40.107.200.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UQtHbkEf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAegzqOVDxRKn6DjF65MjyCh2LxaKU6r9qaH+t0t6DPSGuJeLF1qx4mmZaapKllWp16OQ5l62s7BRzE2iQlnTrnhAexo18Babtovy7z/MDAXHioBVolBGS5s2SdnWi4ED5Xy5gciYYY65DT0vkV1ln7CKe0Pr4UHpZuDMZEeDviu3P11PfYoVodqUSf+cEn/kYIhKMS6ywKxBJOSIqHSqpcQjo1t78wFF2JQ8R//0PfsDZpmwJ48HHqFZcTrlUmENiEhH2Qk8zmx+Ie2x0ogLoHDvBXpGryFV2ZvgyZjPRLnLtloGY9Q2LtpNrqdYwBmGOcPcYfubJ91gJnLRUXEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6w90C0l+r58oC/T88KGo/IS7P9oS525nvwd/C2Ao5A=;
 b=mVo2qfiU8nzEYNkaLwofu+tJO3bHQ1QQaARiVxYliq+M84UzYrAAtZKaCxsgFOAIAYjINNIZ4FOy2BCB2KSLDkElCWLrFUCSDaEC2SaUvW7IOIf8R4uArm6m5OIKMFiYOSr1LStoaRp1n4E9MUlu6J4MrgA/GrIROBqbSwpbxqioDEXoy2Nf76WRPvsca5JwVGYxomeZnfrqC/zpmiGpvLCDFNEOtWvvjWyAkdcp9Pe7XGXEaQhDuh/+vBeVEqfGHCkV4hgzD9DmxYUlROb1YujA6JtJSYoH432uNKodFQRN0bUdogOT70/55PbzaGqfVKkm4KzqULHJ11r0zfbMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6w90C0l+r58oC/T88KGo/IS7P9oS525nvwd/C2Ao5A=;
 b=UQtHbkEfNds0tlruD0eI87hC3oGOvmVGaGhWQb8PuC7mEcR8ZgpjhRw20LNpiL4FLF3dv3KjpmxM9ZgcEU8FlZE5/b/AzzKtYG4kFS4YYjk+s6rpqDsziFXTuTbOzpDUXPOGSgcYmX+PzZxrb+IK9G8prJzYvCrnVqlJZ3OGPk7oE3ffMhY/h/dNuQsqNN3Np8FCuDq27jTXN24LQ1OQX/2U/b0nHgZ5oH+inHjFp+7xbIsCvS19jgHcvfaFPyUMBaKzPFYym9myWYHprKCj2x+8zyd95ARgxktNuqIXxt4xo+D5CTPhqnuSScKbycXPs8IDhWJtMZhDRfslhV9a5Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by DS4PR12MB010122.namprd12.prod.outlook.com (2603:10b6:8:50c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 15:13:59 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 15:13:59 +0000
From: Zi Yan <ziy@nvidia.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Usama Arif <usama.arif@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, chrisl@kernel.org,
 kasong@tencent.com, ljs@kernel.org, linux-mm@kvack.org,
 ying.huang@linux.alibaba.com, Baoquan He <baoquan.he@linux.dev>,
 willy@infradead.org, youngjun.park@lge.com, hannes@cmpxchg.org,
 riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, kas@kernel.org,
 baohua@kernel.org, dev.jain@arm.com, baolin.wang@linux.alibaba.com,
 Nico Pache <nico.pache@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, nphamcs@gmail.com,
 shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev,
 luizcap@redhat.com, kernel-team@meta.com
Subject: Re: [PATCH v8 00/30] mm: PMD-level swap entries for anonymous THPs
Date: Fri, 02 Oct 2026 11:13:55 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <D596001F-875E-4061-8124-68B0DB34CF19@nvidia.com>
In-Reply-To: <ebc72eb7-daf3-45be-8994-b51e5e301b56@kernel.org>
References: <20261002095503.3585565-1-usama.arif@linux.dev>
 <ebc72eb7-daf3-45be-8994-b51e5e301b56@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BN9PR03CA0754.namprd03.prod.outlook.com
 (2603:10b6:408:13a::9) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|DS4PR12MB010122:EE_
X-MS-Office365-Filtering-Correlation-Id: 98bce27d-2f05-4264-fa5f-08df2097c814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|18002099003|22082099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	WJnrYNffbHUdeI9CSVeGuJR9S69geRsc39EFjnOfpVsNUKlorEsNd6f44ZunEOEFqHFol2VZLIKsrc/p5UElOA/sa+mEmgjnlk85AseZfyt738dgCkjCGKu3DJv/78IsjtXIgCQ4AefbOY4PVvP66yXyCYJ7jaoB5TltAQmG9SPIaoX75SsNnQmObnWGAEFhevQ8C9AXfGPNG4zDdgxfIVdWSHKLGRUDfWcoI1ElSYcaNP8WXyTcvMPLWWiqTzKlw80h9ln8mEf7B19db7jv2AVKyJySATXXzNShnx5q/S3mDSbOWeFOBA4Sig78SHfsaBFCQJOU2bGJYHAzyO3M7vUAtEC7vHupFwUejOwGKmRPlRLrA6p5VUb+si+Xa7lhH4iGtSlGsI4gSrtPSKkaDAJyw5NKnYBupY6MNobehfZ8xwLZ/65SGSAu+ltrngmfHemXl3KbL/QlxQbgRvBBQI/85A0cZIkGN+APO0beHgPwBNnwjcmtKjt1X1nrgjWbUB7h4TR8rZtOPRT9YbszIHd4irm7EOMCNK3f53ah97TX2DA6QJNXNHfenpihy59dwEjipsHJump4c/V89l42d/kbyY0J/85WWYt8DwQ3wjkL+Sr8034NrlbOsnfZEPJNFeGtIfkwVxvKr0b9NG9kBzg8xNV1VyEY3NQLiHLOgzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djdSQmV3MW5WQW54dHpSRittRnVudzlaa2VXWHAyVnNNVW9Pc3FjVXc2eWJw?=
 =?utf-8?B?Mk1KRDFGUHlzRXJYcENoQ2ZlSFJTYlMrUm9rU1JqU3ZPTW1yUWJBMCtaaWJQ?=
 =?utf-8?B?cVZyYW1LbUZHNFBWV04yaHRGMWgzMVJ4NjJZaGxjdGdJWHNHcXhnYWpLdFNr?=
 =?utf-8?B?OVM5N2kwSnNRQm93cjRZTWNXQndwdDQyNXlmc0VUL1o0WVJlQ1ZjekQ0UFdx?=
 =?utf-8?B?eXF4aDRQdXdtNEFrQi9jWHR1OElXY2ZNcmJOVE1BZ2NPQmxIVUFHWDY1MUk0?=
 =?utf-8?B?ZVNNajR2WThYdUh0VEdHNmZzZGIyNGtVYWdkQXg2dUwwTXg0S2JhVVk1cHVk?=
 =?utf-8?B?dE14cTZIOWVLdCtWQ1dhVWptVzhCMEtCOEZHcnluYi9Ka2RKb0djS00xZ2NE?=
 =?utf-8?B?RXRrbUhZRnF3NHFpWEdYSmZnUm41K2ZYVG5zaDFNVnJHMWUyQlQySmFxSFR2?=
 =?utf-8?B?eWJSUDRRc2s0aHZIeGo4anNXalplbGgwQ0VVem1QRjJGUCsxSE5JYzlDNVhX?=
 =?utf-8?B?bVdlNWlJM1oxSTZSNVUzVFVESkZyZkxuaWVkZmFZVEg5YXZVUXlJb1NpNUV4?=
 =?utf-8?B?em1xL0tBY09kUEIwQVUxS2UrNU5nL2V0Nmd2NGV3aTBEaXhNVW5qRGVsVGJ6?=
 =?utf-8?B?ZEVEZmZiSGNlb0RJTnYyMGpuaDhqZTgzNVp0SHpTOFZKd1hZQ1UrWWFHcmZO?=
 =?utf-8?B?QUpzS2lIeDRybjdXQjNrbFAwSlNCSXJQbEJTZ1U1RWZ3R0lMeEtISmNRa0R6?=
 =?utf-8?B?ZXlWMEFSa1lnU1d6L2JJVVJMd2RlR2dvOFV1b3k5TnZYRTZwUDlsK1MycWk3?=
 =?utf-8?B?WUZCK21sK2o2YWd2UDRsRnNVMzNsRXNDKzlwM241em9JaGFmTGFaaC9URUpj?=
 =?utf-8?B?eGpQbTJoMDZZV0pYSzZ4YUY4OUhPMWNEaHNyWXBuVXNzaVFuQllRT2E3QW9w?=
 =?utf-8?B?UXVLQWVQRE44ei82VHFGMDNJWHRsYnNyZ3AraWZYTDFvbit1VG5wTSt4R2Y1?=
 =?utf-8?B?dTdod1lNOEp1SUJsVjRoZDdmL2MxR0tlZ1hXNUxTR3ZnMm4vd25Pb3NvYkpP?=
 =?utf-8?B?RmdPdG5Va3JxNE9uN2xGSUdjZVNBUSs4Qmw4Wk1lR0lhUHlOK0xLd2ViVGZJ?=
 =?utf-8?B?NmhGdm5uN0p6YkpxYUhnK3BRaXI1R2lkb0dXU1pLR2Y1andWOTBDbkJHRHl2?=
 =?utf-8?B?V3lmSjNubDRLSGpobjRIeTFPLzQ4bC9weDhKNmRrcStnUEFnOWlDQTBqRHpu?=
 =?utf-8?B?VTByVGdWUktHVXJ6dzlQOCt0MWFzWTBqVU5Fbmh4Nmd5Nk1yT2RCL3crbEFw?=
 =?utf-8?B?UDgvRjdBNUExaUFkK3ZUNW0wbXh4MnVLOFhjbnRIdUxHRVVaSDRsNWNBQ01W?=
 =?utf-8?B?ZFVHNG13U0FvZ0FMNjA1SVl2aXF3NkM2d29sOHNnL1lwYWpzRElESnZGOFM3?=
 =?utf-8?B?clJNOE5RMzd3YmNuSWhyOW5sc0FmTzhRRExyeDVNcnM1R1FvVzdjMngrOU96?=
 =?utf-8?B?K2RLRkQ2b1B2ZzF0T1RrdlNSSWI0RHRoQTQvWGdGTlJNaFZ3Ui9pMXhrMXdW?=
 =?utf-8?B?VFlMdFZzTk9rOFVFa0NPcjI5azBJbFJaaUI5anhTVHNQNjVnNlNZS2dGamt3?=
 =?utf-8?B?TTBSZFlBL3hHNW14bWRhUmc0WFROcUxGc0ZnSzQ0T0pPMzlMa0ZiTzBVYUF6?=
 =?utf-8?B?U3hURHROUjR5SjhWQ1VWMEhML1g5cEtxYzJTODdHRVZEL1dhUU40TWp5aUg2?=
 =?utf-8?B?Y1lVTTJXaDVwMHl0dE9pRmxmbjNwNm8yeWlid1ZtRytzOTZtYlRPNWF0OWxu?=
 =?utf-8?B?QldIQ2xtTGJmUDdSYmZSdDUzWWh5ZTZ0ZEs2RnFwQnc2QmVhRlhTbFNETXEw?=
 =?utf-8?B?R1ZhcHpNTmxUU1RRYjUxY1hQSGdqYmwxc0VYOXJhalZtNndhNXdMcHliQVBQ?=
 =?utf-8?B?V3BIS2YxQ09NN3IzeURBQjBNU1ZOMzNTWFJYN25zOHduamlJRTlMRWZ2cFVQ?=
 =?utf-8?B?Y0xxeFAwME1ScXVBQjBJQmNVclVvbnZRUWlJWVFlYzdwKy9ZemFPU1dqUTM0?=
 =?utf-8?B?c2VyK1Zad1V0K3g3VU9JYTJoVkFiWTh6elh4TGoySXZoN1ZiWFZDWEIzVVRL?=
 =?utf-8?B?NjNjcGdJQWVRVVdWNU5IaHlPNmF6MTNOTU5mN1RJMFVvbnV4eGk0VUVEV0pN?=
 =?utf-8?B?d3VoaHhKTytmWEM3ZzVzRk1reWJHZnFSVTlwSThRbVBWQ3VRVVVnakJlUXVp?=
 =?utf-8?B?VWFxREc0TjUrMnN2Q0tQQ3pjM1h3MXMyZWpWQUM0N0dvdGJOaDRvdzRiemdR?=
 =?utf-8?B?VGlsS1N2NlN5OWV4d2hYV3FGSFdtSG9JTWN4ZXlkU0VSSlpWYzJndz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98bce27d-2f05-4264-fa5f-08df2097c814
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 15:13:58.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhKjmndDWTtDEV5g3T3B22fs8/Q9NFlOEQ8Xt0Lc1M3W0bxV6Mh8K0iSyvPrBy2V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB010122

On 2 Oct 2026, at 10:28, David Hildenbrand (Arm) wrote:

> On 10/2/26 11:52, Usama Arif wrote:
>> When reclaim swaps out a PMD-mapped anonymous THP today, the PMD is
>> split into HPAGE_PMD_NR PTE-level swap entries via TTU_SPLIT_HUGE_PMD
>> before unmap.  This series introduces a PMD-level swap entry so the
>> huge mapping can survive the swap round-trip and do_huge_pmd_swap_page()
>> can restore the PMD mapping directly on swap-in, without waiting for
>> khugepaged to collapse the range later.
>>
>> The PMD swap entry is a compact page-table encoding for HPAGE_PMD_NR
>> consecutive swap slots.  swap_map accounting remains per-slot and is
>> unchanged.  Importantly, a PMD swap entry does not promise that the swap
>> cache always contains one PMD-sized folio.  While the cache is empty or
>> contains one PMD-sized folio, PMD-level handling can proceed.  Once the
>> cache has split/per-slot state, users either inspect the individual
>> slots directly (mincore) or split the PMD swap entry and retry through
>> the PTE path (fault, swapoff, MADV_WILLNEED, UFFDIO_MOVE).  MADV_FREE
>> does not consult the cache at all: it frees a whole PMD swap entry in
>> place and only splits when the advised range covers part of the PMD.
>> Likewise, if any slot is still backed by zswap's per-page
>> store, PMD-order swap-in consumers split and let the PTE path load the
>> range page by page; an all-on-disk range can still be read back as one
>> PMD-sized folio.
>>
>> The series is ordered so every consumer can handle PMD swap entries
>> before the swap-out producer starts installing them.  The swap-out patch
>> is the last functional change.
>>

<snip>
>
> I was hoping that we could get this into the next merge window, but as we are
> approach rc6 and I didn't even manage to review all patches (shame on me), I
> assume this would be a quite fit.
>
> So I assume this series is one of the things that we'll try to get in shape over
> the next merge window to queue it early after rc1.

I am going to review this series, since I have done with Lorenzo’s VM_SPECIAL one.


Best Regards,
Yan, Zi
