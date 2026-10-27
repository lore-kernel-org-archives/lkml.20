Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793135058;
	b=so7IgHGvi11r4cplm08Wz2lxVXE8HNLUdv2svufcpJiFm2A739eC+tpQ5+gTIBk8lNRq
	 Ax7peoKveDPbYMdO5QOesv4QOY7bG36WD0+tVNRjzUGNexM6xONfKPzc0K+QhS3EaJ7RQ
	 rnU2tiD+8kThVEaxYmSr1os+GK4/Mp9yehdOo2sx1XSP2i7Dz+Sv7BpOJHEi87U72jJQ5
	 L9w+GV5veoGsNn883mQT0unnxUtB5wmKkyPzfhoEwRedwa/n0uN1g96Gz5+KTMT6Hkznz
	 3l+VBDQ1rqXrOZK94JFdoofgG5NfbwpTAiP3D+dJk7KFaF8Z6wbb5eqPqmNkp53aUGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793135058;
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
	bh=gjv3DTrc8QOFN8oOgd0X4+2of6rdF6Ayu9jM95Hlmwg=;
	b=zWdCN1QUnOUUKI6cbp4QqiYgHEstGkr5ozOw/k6J7g+6fuYqgKXU1BQlRbkh+Nw4rvC0
	 3tFsQ27ijaEzGOt2h4ZznD7aqEbfP/Ezh9muqJ04TeQt48G0e+GZZnEVwVvwMRiyeZCR6
	 5vZ+mrxZZWXp39uI7vBmYVMvxAh2YuHXt6YheiOO9BAJfC0GSMzhKv8ZygJMQaAmONgZ2
	 e7pd0NnAclrdN9QY2KMFQvEH9kCUNRro+sMPbBUEr1Q3T5ZYstlp4cmDTqLWwfkDQ2eyu
	 py2ZBtv5u18Vl8OFN9VoEj83FV55W2GGJhlxZUN7pNSdwtPZtdIthTPWzPjZNWGMc1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxj2C2lm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.3
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013003.outbound.protection.outlook.com [40.93.196.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC65606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEC65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=pxj2C2lm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fjoO4fhhktZilcXq0lVLcXUFefRDtkIgnd+1Upq9VVTRdSPyYhiSa2fTjEVX6U3Ye34Iy2WLAXLRDqTh6n+YvyLe6DSQ/vN9aLhZZGOn6E+wu1F2uC1avJ1U/+Eahx3KbOP+Guaed+DOBghZ5wJY4q+2HCRa2EuSOvzo0D40iJGJqNjOtLIBTPa+SSLZS3FH3G2qN52Tdc4+I1bpdfd1F2SOrqzmBYIAJIZ9kYD9fh+VoWHj8/AnzfF31q+UY+8puEmRvdsUf9iwaX9+ltcbQGSr2jx3yhMkX2UuM8fiNTIDL+N8b+WPlkWlQphacTt3EpaCJKC59K+zchbP44Sf1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjv3DTrc8QOFN8oOgd0X4+2of6rdF6Ayu9jM95Hlmwg=;
 b=JOlVkOYN6YPhcfvYfhkJgdncO+1z16PDdYthmce8duvj4qqkN4PTHGWauMYN1cTcoEVyrXggQ6+OHxGglj4ZAehwzmyIiQ+eovOwWfNKZnBwVn6PkyNkupo0vQsHTTmgRsGcua5B5aCGz02h7nw0DLVDf1nfJxk3aEIkh521MULrDPC6Cx3W/mBnRKniXtVdBp4VUMDnU6Z+tdI9oTuIAYr5VED3gVW7vwhj5YDEOcIAHaaGRODp13Zs7nXeBe9pQcDOlI4WptHi0nKs4YLYLu1lfAgcv4jQuth0sUwV/NAMDjebOOp8mQBEIga4b5OfQp+05LW/40SCOUX2/9qMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjv3DTrc8QOFN8oOgd0X4+2of6rdF6Ayu9jM95Hlmwg=;
 b=pxj2C2lmbfqRV11YmFThbJipbIG+fLqaI0pk2H2B3VufP3vdT082+F0cu9xu/cOZYaD22dJm/5myYwjDyXWpPKEXa/BbCuHZTmb+JJ1X4xIvXFWEQCimC2p0cG0itqD5YN+RlINwnVoUs6ExMzbp0f6VfTdopf0TJ4y4+77Io6NAe908owjtjtL9x9izNg/lSO1ME1+uq8ykgGwyPaVTGpwJOyfJMX9C5yirVHduKfkGU0kKwwhFhX7p9M7ud/pW4g7I2CkYhhxxc3si136kK3/fW7Cy1ELlqt78jJqLcS76uN1u1M3m2xx9jGu/yJgTA/LCbDjo3UCcBP35bZBgyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by IA4PR12MB243497.namprd12.prod.outlook.com (2603:10b6:207:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 21:04:14 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 21:04:14 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
Subject: Re: [PATCH 7/9] mm: page_isolation: do not take slab pages for free
Date: Tue, 27 Oct 2026 17:04:11 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <6793C31C-09FA-47A9-81DE-9897A86B2029@nvidia.com>
In-Reply-To: <20261027-pgalloc-ai-hotfixes-v1-7-9c7d1aca801e@kernel.org>
References: <20261027-pgalloc-ai-hotfixes-v1-0-9c7d1aca801e@kernel.org>
 <20261027-pgalloc-ai-hotfixes-v1-7-9c7d1aca801e@kernel.org>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: CH5P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::19) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|IA4PR12MB243497:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3145a4-420b-4292-fc98-08df346ddb08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|4143699003|56012099006|11063799006|261021121427099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ywwBSkcvUZe8zHFIiaQajaZVcCKLu8ksqHMaCgELE/myjPEjlJbzgk3pg30cOrH4MgXZLDEiEvzWHbWwXWu4j6eMt/fEfohUkiYT+poeA1uRVOcpN64qe+wBqIbqDy9wXkRudQSylDkd4r8ewFPhN+nr4VpHDDcD5uPJw19zoIGyoNZaAWsCFGLgMP82eP+uSuTPicuqavpesa5yLRkLs4+xB99pUWP06H4H33aTQiWRT1SCjVjoENOWNYZYzt6B02Me0Ht8uglvvD1xiT7hspc+F92bKYVZNpH2w/hwMXKGhOBNTyJjN/tHE5eN/kjb/TicmhLchO0GQHPStbBeUFtaSyMAJ+0zayE8CtyTgJz1GS8gRtm1GpKHlBNWfxtnIHiV/KYLWfeqrGO52kVj8g42LFADSYsk2dSMW9+OMZ5qhT/we8YgHHjpaxvSfv8xok6MCBlHVIP/GInt1Uw0DkeUx79FPnhW+JuMmQPiwg0CTWV6zJ6hbmMtJWEqddNnTW2+tqy+/wNzqQJN6sVSNXETJmI0unzAnTF8KhS40HZ/IQ0F0bbIFyLCsLiaZlLCc2+MSmpBS342/yk37cn/oobUJz0CODeJPx3B43m1jBCPZbrFoEP8pWz+qw3bDjRz6HDowmfStW752kPqZ26nmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(4143699003)(56012099006)(11063799006)(261021121427099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UFekqPQN61E6yJzgouYe+kuFrPnYQvkdVTPZCpXCVyKKlON5CEMbCtODjzx9?=
 =?us-ascii?Q?NeXpll/pyLr8d5pjRzqyxfQgVVn15GOUQY2JV3p0YA0zYBKR+GgwFfs10Fw4?=
 =?us-ascii?Q?5E1EVOSle1lBsyAcrTfoM8Vo4BqEv/q0IGcSs/lM+38wFgQiSnH+Y1Jkbtj4?=
 =?us-ascii?Q?ovqMlGriiDeJ9gdRdhxKbLmvlB4V5eEkx0ZNSmHctQc3VI1B6cRKNhbOdaha?=
 =?us-ascii?Q?s6BUU/RsGoM7jdy9IQo+70w2VkdoiJhSbBu0uLqA/35+XKtvJgoSxQ2kNJXB?=
 =?us-ascii?Q?VIDPSQtiE3naCrEsPNRq/XT2mi7gW9ByULemVFFviBvGrtFTDXIhyAMRBpAS?=
 =?us-ascii?Q?MQeds70t0emkQ6hcjrSp1dqnMinKNCSO/YIRAepzOL0hjmmsn+1Jr6idc+rL?=
 =?us-ascii?Q?HtaiGPxzCzf8UsQKK7S19C3m11iFPak8vEn111LS1ntzbXl3Q3gDbFhtim60?=
 =?us-ascii?Q?5Nkr7Z3vuqs1uQOx5sujTeX1fscahWn7qTiMiQrkfYPU2ApnqPMneFlYHPQC?=
 =?us-ascii?Q?pCQQHkTWPcobgipdwIlFzyM7CWY5JiKM/uA5cohvMxVfTKz5lSO9Uv0lLZm+?=
 =?us-ascii?Q?Uc+IqUDjecxZkj8up5bpB0Ixj4e9hePBwugi1e+wMZFUXhtVsRezeTGVaJSz?=
 =?us-ascii?Q?MEQrnPzAbpL7emizM9XXlToii8wmHCVbhrh9EZzzjrj1iwobtBmJl6FH4qnW?=
 =?us-ascii?Q?f+tzyc5VaN+lTwDdFuGDl1NP8JuVIcPlDZYWan0uPEsgAJfVpUVnj38EqXIH?=
 =?us-ascii?Q?lTIQ7Q0QbCqqpGh98MmQ24B1Q2lIVji5M9k0yx8nLYrl/dyqG/uAB1EhOEXS?=
 =?us-ascii?Q?5s1nwT0DovtcfZdH6swe1m7jBZgY/kBmEo3ywWPh2sc2iQwlARgQsfinJmTt?=
 =?us-ascii?Q?kobhCAemC+xKGbRbmuHwyGoPV7QOt2ewt0DqYKf/5NcK9yjufp8M4gYbaowv?=
 =?us-ascii?Q?4bafgrIQWDvHQGV35MbAh6teewHEs8LxZd6cRCrJPcJVSkR50PuzSv6ZckWW?=
 =?us-ascii?Q?AnPUO8/yHMzkblHio45xUYWdD9FNr0XMBSUEy/jnKqSvDCngqqkJ6ErDgG3c?=
 =?us-ascii?Q?suijl4lVdF9aei1Vd3sGzeKpgvJth0un1uqbVa6j5qxkZw58LkqqVtXHfT42?=
 =?us-ascii?Q?sTDli581aKs0qyz9RFTT7LH42bk/2s4Ns9NKccTUCXzOy6IoXl35YK7udr1L?=
 =?us-ascii?Q?gWcOUmuAFftPRldJPlUxCl7f+iOqjdzAsvtpnwDcufDr0yLE4a+whM9o58aG?=
 =?us-ascii?Q?D8OFD+VqeWq1VADkRxLQ4MkmFRaB+fI7tqJ1SvXwWbMSt5jp1Ne3P8ePDLk8?=
 =?us-ascii?Q?RvRPlmSiQ70oTADlc3XaA8H5Ht15JWw/zoJHWd/BzUfRrAzP9Pr4+IN4sqDD?=
 =?us-ascii?Q?PCaa1lDEhqx2bnczgDeMYK1TFXRxOKafNJnfwDCBUkiGE6JFx8buR2I3c7Kl?=
 =?us-ascii?Q?xXVPHMQGK07xpQs7suMa0POnQA0k6HsMfrzZMw46Mcwly1FUsrtlIEj9GOJ9?=
 =?us-ascii?Q?i0OY7y34AhM1jODwp3V6a6pRIOhwzuYStmD/W0jgqhdwJVkrmchLHBHC4Rz2?=
 =?us-ascii?Q?0VfiJ9koknPodSvtZM1xTeKxmsQjux9AALRTuT2Vjn9yDPoah/eEgTEYV2o9?=
 =?us-ascii?Q?52Y/vPyeh4meZijx/HNTCqJQg5hKX/CnAu/qmhvsbFFjhjPCXBGzHF+P/ZPM?=
 =?us-ascii?Q?yUOtdLnDRykaKbLxjahHQ8egoIEAOeVej21TAXsBkf8XLq/ZLEE2DspNxiKE?=
 =?us-ascii?Q?5f59A7feIA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3145a4-420b-4292-fc98-08df346ddb08
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 21:04:14.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcodl7Lqe/lcHydCtW7teKQeBPFvlc7d3N0HiD+p34XoD+yqNQAuWnlDi99QCzmz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB243497

On 27 Oct 2026, at 11:46, Vlastimil Babka (SUSE) wrote:

> From: Josef Bacik <josef@toxicpanda.com>
>
> page_is_unmovable() regards a page with a reference count of zero as free
> or about to be freed. Since slab allocates frozen pages, they will
> be wrongly considered to be freed if order 0 (higher-order compound
> pages are caught earlier).
>
> If such slabs are the only unmovable pages of a memory block, memory
> offlining now isolates the block, this can lead to offline_pages()
> looping without progress.
>
> Thus detect the slab pages as removable to return -EBUSY, as would
> happen before commit 9aec2fb0fd5e ("slab: allocate frozen pages").
>
> Fixes: 9aec2fb0fd5e ("slab: allocate frozen pages")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
> ---
>  mm/memory_hotplug.c | 7 +++++++
>  mm/page_isolation.c | 7 +++++++
>  2 files changed, 14 insertions(+)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
