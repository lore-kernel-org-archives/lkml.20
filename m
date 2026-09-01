Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010008.outbound.protection.outlook.com [52.101.61.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A117A43747E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788296999; cv=fail; b=O5XVVtt6w3RmI0Y1tTKdYPuvqMqnU9koKOT/MbzmM/ychX8j8UmtMPYLgTrlE0Dcsu3THeRY4bLm8K2agAgJPVNxbItyxQ8ycQnOP+PC58YuJ5BNly5bAWdPpcTWjK4AysHEg47JQiOV7Dou96OmnDORzxL/0DiGfjTNgME1FRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788296999; c=relaxed/simple;
	bh=FEbWVSUigqF59pTM4QD8vFZdf9Dgff6mcKOlg9J2NwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hLCLCWdRVXa7VNoLRy7f9Zu4yorlu5RrYRk6Lt9ZdTCmA4Uw8ToSdY5b5COSSEIYzL9I1Oplj55zS4scjcFarkA7oD8UCjJbT9LB9yaUx0BHH0h62wUfX3xMpA/VlFkiqc0Sx3S1l18U+BdvfACjPWyGHnoKSe/7qKcqJlTzYn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yt29aoGU; arc=fail smtp.client-ip=52.101.61.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yt29aoGU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAvHjP5eX9v+C2xgiLDT1IZE87hnvc5ZRh9GYhHT2tjKfDnkdhX3gAaPqZ98Z2CimtNmym1fWY7PvrilH0azYMRM5lteYAP1Igm+nXSXw77ppUs/DptIh6mxt3AZ/kHni2VkcxwyIjHcbEap1y+7GRt/d5UwnZrE2RRyc8uyyxVuScur57RPhIN3wUcKEjw+Q0M6TSYnDQ5cLG+ezWu6Yfq2w/7OqOOagLkCA2dowupxD9pGl0ILF+HtxPQjkCBUMe/02tcgWucrHIQQnXc7diRRLrrJj9DM2wyp3GIS7vd7P671qcpENul/digBBnusJtn2V/40AsSEPCC1/SQHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXFcmr0NqifiHmvGs57JRMIh9NblvbYSjOW+pNcfiY8=;
 b=eD5AcY4GkuWXNQwEIfjpZysOjnlvqPGzAJ84GsVx+L8t+N/iRLEnd7ZQ35jFtoVyTig1G+Sh5FzMrbzjhzXjH3nlDRC47tP6bQMQXJ9ZnNL1gFo/XJNZCxUrmwPg0/nn3Ghbj6W5YLHmAKDouLGrG3Uuh53CzNzE0hcyZU8wWTQn0toNyoXgdfehz1s8ANRQrV+oLwDjvbGqAcmQWKsSJ4zYut8Ew7i85OBSDMxstkU1tbkcq6/mIHo37azUa1czIs8/mHHcHWRXnfleSNThzdNuSJ2LgKSF8e1kgLdZK5XPpUQYkLgsC9yUlki6MCYL+k6fZbb1wypNDOQHpA8Jkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXFcmr0NqifiHmvGs57JRMIh9NblvbYSjOW+pNcfiY8=;
 b=Yt29aoGUy4GlyWodZE5qha9h3BZ97Xbhel0ler7sv3IeiXaaRQYoD910LkCsCQuMnoNLUdXILOnfuZZn1cmsqVTQWAZqqWW5KgRnbqmdC9FAU0BjvMgd76WfaOAArc+ec2mXJlEld8cnZu7+D40hRE3LyhOGHyteI71WNwvipjtaZPYp4TZhceNuBHrSQ1lChoIhrl6C3DI1MpDSfsnn2YmKogyFLOe1kMy4LlPUA1FVaE17YGAi1Lw+U77JYQjjJhNyHa/dG4n5aCgo8HYbrngIHb6w4Shv4q5sGsOKOp0qSpXHxM1D6a7AuYHngEgVfjW/HK/itXIJvpYD8FSjsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SAWPR12MB999293.namprd12.prod.outlook.com (2603:10b6:806:560::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 21:09:54 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 21:09:54 +0000
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
Date: Tue, 01 Sep 2026 17:09:52 -0400
X-Mailer: MailMate (3.0r7024)
Message-ID: <C8541A2F-D6A9-41B0-A3FE-52339A6601F0@nvidia.com>
In-Reply-To: <20260901204449.GK3004@cmpxchg.org>
References: <20260901190123.3511535-1-noren@nvidia.com>
 <20260901204449.GK3004@cmpxchg.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::15) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SAWPR12MB999293:EE_
X-MS-Office365-Filtering-Correlation-Id: df215ffc-3ff8-47d5-2e0d-08df086d5e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cIhbEcVKC/fSfrbNtEl4huOLT+P/68NpDIaRhQ9C6mI1pu+4/9v54KLQC1qGUtZC8kdwVFQfshuRVhTwZzRQLtis+OTSRuH4LIrlpR1r8CaeopW792HCnvg3dB9kNvd3QMBkGAdmGtt+L020RpdbCEboOz1Rk6wDMFD2AAysCvtgGvq1MtS9j12kMV243Q3sqGkqUbEd48KvpIU31v26YwHUy50G4q3CYKLJT9+fnD7B4M2bOqhNtsvMpemPEcR+BvkNLm/tcEwlorMUnkuUcTx9C5beK6+Fu9uj8SeWnpnK6dEjb+agI8Aihxq02HWQhZ7woAdDYWYybGbnVMVCjR+T/uvUN/rAYt/B8DOkYNqDZatOUdeaOQfoDT0R2j3Ja/+ir8zMYDVvw+FfFQPS3vRiNFzr4BjjRnhCcKVt4WNRHySIrZo6HVuOBeF8QmcmsR3eFrNvDpHg9LlWlWGhh31vr0z5EruSkdOkTWQjFe+90p4/m78wAFh6caPbzRoNIQezo7QuPUaMurokz6BCt62dK6fnRmajIv5JwlK88rzwwhjdOzlZvqvtDlQEIlO9wKOc2JtX84LotMcJk1fW8WrqtZZOduKlLD5ytQdXRg0Z8fnGx/CD2Ihe8qCu18tXZhwTW/3n27zO2rTFmOhYi7+5p1drVg6h3l4ItBPYoQI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fkiQ9cjg2vAkofKwllJrdsWSPcIPF8HcIg6DI5v2Rgq7Jdq+TR0UGl1muksy?=
 =?us-ascii?Q?VaY/G0OIWbhOx+33A8Ma94CtlSq1rwtqU29WbgNR/r8tWKX66XCoAG13qi0y?=
 =?us-ascii?Q?XXUB9Y61D0i+k4/72c8sagT0qz1ZButmZwoMTdt8B7IlMSpRhFOPkP5e84Ta?=
 =?us-ascii?Q?1owicGNuEY7bRDjGtwhnGee34ozOxwDGdc+SgazXWYixUDAGdu1U6Plm7hVi?=
 =?us-ascii?Q?7du8983gP90ityJXL13xjCTvZgYdUxbludF3DisSaAmrWV57Z2vZReOAvzdc?=
 =?us-ascii?Q?DzGFAjV35dMYj2jlegtmTJTphpXaV2lH30mjpswHrwTu6ULhFC6FoGKCaAIS?=
 =?us-ascii?Q?z4WR7xoT/7XFEV18GAxOGMwrxYSnJMpVztx+98MravSqJwj3NkGosRxndNuA?=
 =?us-ascii?Q?ZhFLmEoEGAmeSNTih5JadUhloM4dOBLlJMLFluDhPy766/N8gA/UHC3Li1pw?=
 =?us-ascii?Q?Q2DXNW6AFeAv6NWPLnPQJFWU1w/412w4ebw2Z5cP/O1flQLbkXx63cpWA2IM?=
 =?us-ascii?Q?trRW4cVN6gwvHXJv9cnpdqfWTs0BOdXBbl2E+KW1dQNIm9va+FF/E0YopVan?=
 =?us-ascii?Q?IkKMEliZHOHsftPQKmdInClM+TYN5CBxPQaiOJTfaulrbIHKZHDLZukkeE0x?=
 =?us-ascii?Q?J1ksYR8jt9e0Afj1W2si+aRKymQ4eq/ejvPl+EQ8xZjDA0r01/NwPPRcyccQ?=
 =?us-ascii?Q?tnldCvVPXMT8SV61TzFBC1xj0Da5vy4eaDLFgYPd18Q+nicJftTJZ/OoRnHK?=
 =?us-ascii?Q?Psbh9l81Ck8mWHUAtFQUGaN+fsQy52bRomtKE3IPIfnO22/gG5xap1YmEq66?=
 =?us-ascii?Q?CGP9iSfqGRYibNOGi3l59IEubdrh+7+qsny1sUqBnadQf4DWJESpxkezBp+S?=
 =?us-ascii?Q?3IzH8SXDP26oUMSF1QGQrWGvIqVpv+2JH+vWEl/96aw+hhOV+TsASbpyYwlb?=
 =?us-ascii?Q?4oyz53JANWNlWioF0SLbAYnjx1bKitufrVR2LCoCFWUtshhEyItTRHWKnq07?=
 =?us-ascii?Q?dZ+P7IFrpruzkeKolvh9+654EBPALWo6Mz+F4ZA2TY43Vdc+glasvOJbeIfv?=
 =?us-ascii?Q?xBzbVQ4dJZyUlqtm4fxpEsNPRpHVCI9Y5JhlUy5zd9f/VA0y1XhKpHBXuWuu?=
 =?us-ascii?Q?/PK9cll47FsJPplIp8xBJvxSYA3VNvGTSesBIvoGLXurqSyQWt19UdRe8zRy?=
 =?us-ascii?Q?xZ7d9kBc0hiX7DHBYqVf89dfyUxY0wzJhRixnd48QlhQM36DygpTcb371RCo?=
 =?us-ascii?Q?YvIt21SpmaZXQ7mQd883c4mVCCa9QFkX3wyb8XQwPIwmRLVUndJSabtGMj6Q?=
 =?us-ascii?Q?IEf7Scw5X/BpM7G46OidTcPinHrB1K3klAMvJRZYUbndjG5ShIVLDjUZ7uYP?=
 =?us-ascii?Q?gejuR4uhvAZmNHH2+982YLm/ZdDPtFZmDtB+V0JDUY3ep5KsE2HYSXa/HQRf?=
 =?us-ascii?Q?T1zKOE8N6S/bu5TJUyhrZUjzzs2AVpWxslN/DJP5HkKet/b9ecMMiQ8AOZfF?=
 =?us-ascii?Q?Jz11igkfKWY0hEXERRTFVSinKNEZvc8GDzciSaAhfLaNjICPd1xAjdZGvURi?=
 =?us-ascii?Q?CPkQ2yKAKWegxW0BNLJp8NNpSap+K3h29Znn7pQf5xXOnKqxHVVgkwijXowM?=
 =?us-ascii?Q?xgeXye+IFc2KVi+tTK0j+lNZhFcKIe7dT9M5iBYOIRdLQ8s2n61ABrL6kRxX?=
 =?us-ascii?Q?hspA4ylwUASbzooTYXbHQstOBJoRcD6JQFHu7t3q/RJp9syEZWpCxJ907rtL?=
 =?us-ascii?Q?TQ9yrbcCPw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df215ffc-3ff8-47d5-2e0d-08df086d5e5c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 21:09:53.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P7cEqQYa7Duh5n+xq5WQpbHxDgue6DHAXoPjaPGKOPDMK3n+nxsnPZwlF6ULvcGy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999293

On 1 Sep 2026, at 16:44, Johannes Weiner wrote:

> On Tue, Sep 01, 2026 at 10:01:23PM +0300, Nimrod Oren wrote:
>> When THP is enabled, set_recommended_min_free_kbytes() may raise
>> min_free_kbytes using a heuristic that scales with pageblock_nr_pages.
>> Commit f000565adb77 ("thp: set recommended min free kbytes") added this
>> heuristic to help keep pageblocks free and reduce fragmentation for THP
>> allocations.
>
> We've had problems with compaction before when min_free_kbytes was too
> small on large machines. Competing free space scanners do a lot of
> work only to fight over a very small set of possible target pages.
>
> So I'm a bit uneasy that you didn't include any benchmark numbers with
> this that prove basic functionality on larger hosts isn't regressed.
>
>> The recommendation scales poorly with larger base page sizes. With the
>> default arm64 pageblock sizes, the contribution per eligible zone
>> before applying the existing cap of 5% of low memory is:
>>
>>   4 KiB pages:   2 MiB pageblock,   22 MiB per zone
>>  16 KiB pages:  32 MiB pageblock,  352 MiB per zone
>>  64 KiB pages: 512 MiB pageblock,  5.5 GiB per zone
>
> I question whether pageblocks need to be 512M on those machines to
> begin with. After this patch, you're still asking the page allocator
> to optimize grouping such that 512M pages can be allocated at
> runtime. Only now you took away part of the mechanism to do so.
>
> If you're using 512M THPs, I would kind of assume it's on machines
> with a memory size where 5.5G for defrag purposes isn't devastating.
>
> And if you're not, it would make more sense to lower the pageblock
> size to the mTHP size you're actually using. And that would fix the
> "excessive" min_free_kbytes issue as well.

But lowering pageblock size requires a kernel compilation. That means
maintaining two sets of kernels for different needs. The ultimate
solution is to enable better compaction to generate THPs bigger than
a pageblock size, like Rik's super-pageblock proposal.

After removing automatic min_free_kbytes boosting, user can still
increase it via sysctl to restore the old free memory head room.
It is much easier, right?

>
>> The automatic min_free_kbytes increase predates proactive compaction
>> and many subsequent changes to compaction. Given those changes,
>> increasing min_free_kbytes for THP by default is no longer clearly
>> justified.
>
> That's pretty handwavy. How would these changes specifically eliminate
> the need for compaction scratch space and allocator fallback options
> to stave off fragmentation during placement?

Extra free memory is still necessary. min_free_kbytes can be adjusted
at machine boot time to achieve it, right?

Best Regards,
Yan, Zi
