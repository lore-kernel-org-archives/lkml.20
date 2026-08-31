Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FC94F053E
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186916; cv=fail; b=BaWyAN5nS7H/i+l/bSjVoJz0GP3FbV9rAQyamtVx1096174hCvXVgBg9C2+Bhe8Rg/WHJYpEO/f2bpbVzWh0Ml+N7aABM4pSSYRnsE9RvusdB0JL1tykqEqRJs33zkQu2GeTqdMBBpyVd9daLzrkcxLuLkFnmeW7KW1ANsrhTR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186916; c=relaxed/simple;
	bh=mzEpuVzIcVxuy4B0NVa+IpVV0+M42d3dbonmQRDK2pY=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=RQCiVTTvrpAeMwxF33WZr5WxChKyW4h67d4vWeqsXG2LTMkiKWynW8kBuBT8OSEvphY5zPccu+sEBBVCNlQNxS9+Mh7AP/PNVcGBEV4MJ/mbOg9Ud7bQwXcvyf/ruDBEy4ig4oHL0546MJcfnXNcDQj0iyHIhvKQ1mljO7M77Wc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JZt3Uptu; arc=fail smtp.client-ip=40.93.201.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JZt3Uptu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3kP9dt8WkDk+fIQEMwXPLIsx6GpQ1szdqbZ5MK1Ra4PRG6STh8o2KXNoVDOC6VuAPeYIl6Z2KU+PjTmStuy0SvOSioiFB0dzCTXHg6ov+Bal3ZKlEUqZKGZWs9IuzYHYfBfv3pisR4cN4V2ukBrtm45DTUPUkP+XRsmOM/kiLwOv768HcR/TvLY1OfSEeOIVLwdrKsEUKqvWXSJuS33bfjesSRTFKr2fBmg+0f+0GoY6GP//4MgdlWkLJEwiwGaQRlBen+v1RnGXiScnoUFkLDfNUeZyiG6VnyKQ/v6RqcLkK8VIquF1R2ZOwC7Kg6qmStpy4lMaSuuTOpbSae4vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4ZxJq9vrRYOFCvXLVn/tnm1nGNGZfYfKAOO+2ul//s=;
 b=TKvUuj3Ilv+KobP0maMGGzdt1/vlyKIZmqHIyIC980GbBO1YgWRi+Hlm5aVxZMKgurXBt3SCHbZXNTLi5IKhe1KjN1RRQkUxl/1ka2OdbjqiVHekuHctRha83LzXElHPfx2WduC/DdPKBD7DZgWVYpomN6FYGjxkGDDOt6IDV6GLs4JlDvyLtp+NiRHimFQ278ezIVGhLU270qWBq25hEFeEz2NzVNQd/vp8QSPK+7AsOvUGffRsaIBF5BorSUqzjzSFBwm1iWA21K7VybS1SZOVNYHFiqQdNj0nNQfG7vbUeTGqKuEzwUt79pUGVoq9IIzdQSc4wq5DDiAwNyfXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ZxJq9vrRYOFCvXLVn/tnm1nGNGZfYfKAOO+2ul//s=;
 b=JZt3Uptu+u770WuOD+8rnmnqZMNgiadqExzbds1WFDjpPgNUWGy1aipTPek0bwsgF77yH2HEekIqqYUJHwaWuhfWuVQDi4uoyhdW04wioMmgZdmdOtGRA97HLn3NRXMpWUuCTFY7P8LL5cOPkNT9SlcPEecrKfGYdgvaUjX4CaZ5P9JDlpDKf7OhAm3I3wbRdlyGkgMSFW7p76FaRx8130jBLR/S+FHKtwSkxw3Sq+IOrM6oWnCM8Wh8QAE+6S5K4uBjmPaONyN7Js2hgNPzVrjCQV1TG2vQK8AZYpPVFg33zitN3R+ISyzZb9mQG45QSl7Ub+OmDDOAcpVNj7IU2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 14:35:09 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 14:35:09 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 10:35:07 -0400
Message-Id: <DL37CSKRA0OZ.3OAX7A0UA8NS6@nvidia.com>
Subject: Re: [Patch v2] mm: adjust out-dated document of __GFP_NOFAIL
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
To: "Wei Yang" <richard.weiyang@gmail.com>, <akpm@linux-foundation.org>,
 <david@kernel.org>, <ljs@kernel.org>, <liam@infradead.org>,
 <vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260829025847.26779-1-richard.weiyang@gmail.com>
In-Reply-To: <20260829025847.26779-1-richard.weiyang@gmail.com>
X-ClientProxiedBy: YQBPR0101CA0301.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::10) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MN2PR12MB4423:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c8373c-5c65-46e0-1231-08df076d0eb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|921020|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	yAxAFilnHs5eAAYwJnJPAbgFpkSPxYvDygJCVpDNTA1sYA2beqhIB6zwh05WQ8lmo256jd2GggxS5YJt7mwxjgnV5bJeLP6AQR/w2mO5CVbw5hjt6hjmzFIsu/0SXir8U5Qy9Ugm9FV2Gk2FoNG4n/ornS2W2YxU2kAA1JRtrCzjS8l/7h0ruo5GnNajrY4OxMcLtkmTmTyk9mW/1lSAhNglDZ2xkkQe/WgPXG1sK6Z9tNvAcBmcubR23gOTe3J5oyiOfCkTeDIuEkpdmFtjxPOUPivZqKuAfnTg5c1k/kXTNPl1Wmd03H9wU+zreP25pUG9/kKfG0hGhr8vPx8FtIR1GFn4JbKO9DDciBvbJdY85nPHRtfZggLmcq2goAIBcMA8xN7h68xEhu+qhOhU1KvR3fKeDFeC8IXchZY/W5iC4CXevDoVZLhLFRbZ02DCuymQ0pNQlFanTrIcYn7UDftBZeOUh06rDUH4FOoNFu5wfBb+gqFX0BLt2Uo6hw5PtPL5x8EWamZdUr2A0xLTPlyeBgbSE689GOUHw6vdOAA0R0jjDhFicwO8dEFXU61y725BF6LyRLCMlK3w6pigKQAZQRC5kWDi86VRNmrqxld1KpMxGVq37iHwT+cmKKDV6WcY0oowcn5sU0J6vxla8VxcWfBesGAS2tcOmzWsdHmivyW3avJmriVuijbX72eNeVaaCmC+DqkYXrPS1m29Ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEs3clRxQzUxZVJEMUI4dEVzWGdEeHhYQmZ5bHFBd2tvMUxWbW1rY09SZUtM?=
 =?utf-8?B?Vm9wWjlzM3FHK0doaFRIc1NQdmEzZGRlRjJTWTFZUEsrMU1FUmJjaU9ubnBE?=
 =?utf-8?B?MDNqd3QyUDJIeVFmc3BpTGtSVWQ0OVp4NWJwTi9YZmFmUzU1TUFsRDZXUmRK?=
 =?utf-8?B?cmpqWFNXYm5mVXBJZ0tNNTQvdEhkQ1pWL1pZNnpqZmU5SDQzMUM4UkpLODFF?=
 =?utf-8?B?Z1RabnV6VDRvRWxnZWQxRmM5QWZuZjV1SUN5eGtwdm0yQ0doNVdkbC9YMTE2?=
 =?utf-8?B?MVJjL1k1M2tVNDhjMWZvaVJzMEY1SnplMjJzc1pvR0RmRkZaSzJqSExPYUZV?=
 =?utf-8?B?VE5sdHhrZkcvSjZUdm5HRDN5YUdhcHo3Y0IyK3pCSlNIUXpNUUJDcWQxUWMr?=
 =?utf-8?B?SU5QNWJPbVFRK2VEOTI1VnVvUW9tZlNaN0J1bWRTWitmaFpmS1JSbGlBZmZt?=
 =?utf-8?B?R25ZdUdrR3U4SDlETERpTnFrRVZtU3dIUkhmQlM4L2o2NGI1b0xQeUNkcFRR?=
 =?utf-8?B?a21WNU9hU1FEKytTSEY1cjhtbGVBVlZEWGFHak1xTUp0cFVTcGRXaHFvYURt?=
 =?utf-8?B?MDJIQ1pjU1RSc0MxRE9TUmFJRkIxbUNSZjhYTmQzUWl4TWxQWkFGd05LaWZG?=
 =?utf-8?B?SG8rbFdENWc1cmhTOUMrWnZ6UUxjZGRzRG53QlZ2UklRVTQrYkJRUW0zOXZh?=
 =?utf-8?B?VmFMdDJiUklYY1RrdTc1bGtCT1ljeXIreisrWEFXcElhVjhITTJjbHNrMHR2?=
 =?utf-8?B?elhwSmp4T0gwODBrNE9Zc0RTT3I5dmdKTW9TMVdNL2krOHorY0NaS1NCbmNu?=
 =?utf-8?B?NEt4RC9uOFlHTi9SaTc3Y2ErblhRais5SjZCR0ZubXE1M1hpcEhxdnJ1TGhs?=
 =?utf-8?B?SXppT0REUmV0N1V4Q1dEQmd3ZVY4dkpVWG1KS0E1QTRIVjVjV1hMWHhoQUd2?=
 =?utf-8?B?L1JtbDIzTFhVdTRrdDdmZm5IZ3VsSkptRzI2TkpLdCt2L04xbW13c25OdXo3?=
 =?utf-8?B?UkJJM1hocHJYRUhYQ2cvdWhic1liRi9qQW5qTWtraEFnK0dXZWR6T0RlU2VW?=
 =?utf-8?B?dUVuRkVzcytCWGdpbWpGUFVVbWp4b0FvTnIyZ1Mwa2YrL2MyM2NuZGIwK2pK?=
 =?utf-8?B?ekUxRWFWTk5leE9uWFVqQUVNMGZLL2JSWlNtdVBpRGM4WFg3bzZHY21VUHdD?=
 =?utf-8?B?bGxtbC92dCtka0FldmFmMlJ6S1BGNWtyclQ0ZXcwb0s4Vjk3dTdKa0llUmRG?=
 =?utf-8?B?dzdhQ2hZOVk1UmxobXBHRmRLSkQ1ZitVTVJQRGFncnordE9CVnhnbGk3eU5B?=
 =?utf-8?B?MDduNEVZdXllR0luMEpKRlZtYnNYTkJCMTBVUmJHS3RVRCtIZWRBNDhMSzhm?=
 =?utf-8?B?dVRqZlJOK0ZKYmE0TWhKdGkyL0NwVDlTMDF2LzFpK1YrUmxsS2tubmhzZ0sz?=
 =?utf-8?B?RVYrNlJOS1VVZTdENjFwa0JIb0NVMi8wSGFQNjdWdDRnMXl1TDNybEUwSHVj?=
 =?utf-8?B?RTVZUk5qdGEyQ3FkckdzM3pWakM0ZUMwdnJUNFBLbzR0S1Y2dXpFOWNwa1Br?=
 =?utf-8?B?QXRZc2dMSDJXRzFDUlV1OEM4ZHIxNkNiVGRycjN0YW9NbllLREJRb3J3TXRG?=
 =?utf-8?B?c2Y2dis5cTFMa1M5S2xoV1VrOU12RzIwOEJIQngralB0L1Q5eXU3RGptYml1?=
 =?utf-8?B?RWozRVdsaW5DQ3Q3ZnNqbjJjckZINjZ0VjhacURGYXFvcEljZnZiVW9TZXpL?=
 =?utf-8?B?TmFZenM5ZW9WS2hxUFZyK0F6MThNN01vaDEzcUhWQ1MwZGFOZkhOVER2SFFY?=
 =?utf-8?B?bTBzOHZ6NXd2RnlzVllGRmNUeGxWL0tCaGM5T1N3VC94WFpJY3l4bWYzRnMr?=
 =?utf-8?B?UTlQQndOT3RrRnltdE1EOG1jUldyZi9LWElaeS9iY1lqSU0vVzF4Z0VhZDlY?=
 =?utf-8?B?MHhTZ1FSN1FFUmw5dC9icFZveHhobDlObUxuVzZPRW1vNVltdkpkOFZVVVRQ?=
 =?utf-8?B?d1RwWW9RQWpPamE2Y2FCbG93cDhES0hDS1hQM3VhUEp2VExKMVdPNEwyS3Rj?=
 =?utf-8?B?TE9ucmlpUmVIc0dkclBDbTl0YnIvYWdLZTVzbzBIR2s1YStidEl2OFBaOFda?=
 =?utf-8?B?ei80Wm1aMGQ2cWV4dkJGSDBOK3I3clY5VmNPL1dzSjVPaFhQNGovMmJsMDNp?=
 =?utf-8?B?ZkRBN3NOVE9DSUp5WTlTZ3hZRitKL281alA1MjF6ejVja3FHbWJ0eU9yUHlS?=
 =?utf-8?B?OHBVNjJ1VHl4NDZHVTBndXozb2RObEl5dGR3N0lxNDBOQ1EwMnUvbmdWZ0g2?=
 =?utf-8?Q?VP7D6fGI8enAAi2K67?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c8373c-5c65-46e0-1231-08df076d0eb6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 14:35:09.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gsbVqXrPCqVQ37gCL/Nwjc7UXMZoMowPFSrkdxvji/Pf6CcEXGKo4tl98TfhpuYv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423

On Fri Aug 28, 2026 at 10:58 PM EDT, Wei Yang wrote:
> Commit ee040cbd6e48 ("mm/page_alloc: don't warn about large allocations
> with __GFP_NOFAIL") remove a warning on allocating large folio with
> __GFP_NOFAIL, which was placed there by commit 903edea6c53f ("mm: warn
> about illegal __GFP_NOFAIL usage in a more appropriate location and
> manner").
>
> While in that commit, it also documented this behavior which is
> out-dated now.
>
> Adjust the document to align to current code, and adjust the comment
> while at it.
>
> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>
> ---
> v2:
>   * s/is adjusted/was placed there/ in change log
>   * instead of removing the document, say "is discouraged"
>
> v1: https://lore.kernel.org/all/20260827030548.16631-1-richard.weiyang@gm=
ail.com/T/#u
> ---
>  include/linux/gfp_types.h | 2 +-
>  mm/page_alloc.c           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

