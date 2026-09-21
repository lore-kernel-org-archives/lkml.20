Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012028.outbound.protection.outlook.com [40.93.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133DB2EEE67
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035125; cv=fail; b=Q4h1BwvZ+zNbhBICZV3a3Y0MPMk4+1WtcxabTwwSFgbhMux8yb+A1QzthRiutT/wzTUs+GYxgHy6uLfylY/Ej5HO1zV9BkfGfQsGINIeiGs9O+DVH9CjlrpRZyx96icaf+jlHF+2blJl6jToPKyydePx3ZUvn0mgg8JhxSyx0j4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035125; c=relaxed/simple;
	bh=U0kmk5Uqabzj73BZlCZ9xhNRapPDmmg6Snn8AmUFj8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YGtb1ErGGyzJml5BRSMiuEakjptA/OI3hwUiB/O/k4u/6I3WJ7NrNVQ8TdwytyOeyHpFi0/X1U6wv6+rnH2Z6cHBHNoa/vBDQaJRL/taYjk8zQpUsgRF+YZCvSCQORa20AVe3v9xIl2UWAdHvO/8IGCxIcGG/NSW/ghaUXzj4M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=diYyJ46e; arc=fail smtp.client-ip=40.93.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="diYyJ46e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaWAWvixwO0Ly4G7nvPrPTja/aYf4Uq/HIsx8Y5flRSh7SOXKPJ/ruYgbf2GQkn1MNhwzGfl3m9Ihv3hcDzxkgl+fBmwjV/4GLVt/98WdWnm3SoM0zH34MSLHUkmne+1M6l1rY8r6shLgCbiyAdA/zncgegGJhuwLsFhEmgvguf47DQHW+UGv9QsqRSo1Si59N/d40/f21+Z2q/cA4M+j7cZKLQ+qiqKRgENXl0wLqFvZxGm19mVmGuGn18KoMih3aZd1Hpq+Wg0NZKvW9l5bfrhZ1KqdBnIt5P5wUCYRETSeY315c3pe3b5e0rPhiPpGfcVVnW7lp3cUhB0uBKQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=962Mt2h7QOcLQNVaR1nqT71k5Ww6URNqOqugZkBl6SQ=;
 b=tlXJf4XFfkEjGLt9dYmE5PnnHUv5EjLXCjwIY4WV0YCuyKHeh6emkFR2TjWSJoZurXM7sqdYh26SCjBxPq0lWg5SbFFEE+0bHyW4Hg9rWTTGXkpfuItB6CtLOCZ9O7gRp+mvrmDieD7EW9dhozhas11vTB78ql2Mwh2JzqbichmoHucJkZrVQOtJxLYQOrCC9nMiL4p54BZJRQbIoZFy7ugkFDC5FknfqBKVh7yp9SaooiUH1bXMB75H0+K7TMCW/KrqwJ7S24qk0Ck8H8dnfiRLZF21LnwQ7jSc6DBqBmqRT3fq7u4bzte7qM+kxDeGz5hUxFaZKC9SjcQYd8N1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=962Mt2h7QOcLQNVaR1nqT71k5Ww6URNqOqugZkBl6SQ=;
 b=diYyJ46ekIiNeA1bulj4nZgLclI4tn5OMUrPWgjrVTQvtDhrfp07Qu4IV2z0It/U84OUisNm3PK6LON8ARuhlqitsah/dSeQYgz+w4yDtdGr9fgB5J6S76C/2R77RxkgAaN+/S/VzljUSGhQJsHvhUVTqkQ3e57fsHmRe6Fu5dc/mpWNHANSO8zKA9BxLvoYipPgpsBgIWHtE78xvl9Fs46hg+8Yx2AxhfVK+mXUr5vM77xi/1C92QxoTWmyzsiVYiCIvWDP5pw8tExLWcrIOvACZ1veG1+/DIfmO5s9RcXcDtsVEpJki+Pvg9bdusB5a4HrfeydOqO59vVRzIpYKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SJ5PPF816B88375.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Mon, 21 Sep
 2026 23:58:39 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 23:58:39 +0000
From: Zi Yan <ziy@nvidia.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, brendan.jackman@linux.dev, hannes@cmpxchg.org
Subject: Re: [PATCH v2 2/2] mm/page_alloc: refactor build_node_zonelist() out
 of build_zonelists()
Date: Mon, 21 Sep 2026 19:58:38 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <72A76ED6-51F5-4A0B-B34F-C8F5416F640C@nvidia.com>
In-Reply-To: <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>
References: <20260912030424.2889731-1-gourry@gourry.net>
 <20260912030424.2889731-3-gourry@gourry.net>
 <DLKNHNP6LH59.3MEEBCAJGFEVK@nvidia.com>
 <arCeH_aD5PUM1tNE@gourry-fedora-PF4VCD3F>
 <C7A2977A-CDD8-4EEF-9448-A130411878B6@nvidia.com>
 <arFaiV9iVgxIsZ1g@gourry-fedora-PF4VCD3F>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:208:236::21) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SJ5PPF816B88375:EE_
X-MS-Office365-Filtering-Correlation-Id: 6051b857-a040-4b8e-e403-08df183c41e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|4143699003|56012099006|11063799006|5023799004|22082099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bsru9Hhq6gwB6gzsG+1o0XC57MFQO3EqTw1k9CAyH0v1akcxcUimXPUrHpLmNhOrnPOsdk1g6UukjuedgSrvrG4c+9gxJRKYmo7NaVgy9a+ynRUwzwtsVc/H1/W45F9rw8/CFeV63ISYQeVBD0/yarNZRZVhf6p6cfesR6B8SsHrOtyEenH8OWvXI77qpgCMljhcL/sPrbJj5ipB8Rs9e5tU580+fngw+23F+gWZKZIFZIonZUBZ755h2TX1jcRcWsjh+VfdGzoMsXUXrxWwVM3Aiws5au3vIpZEINkz4mqeU0bN+EuW+eP5GvCn21rQ23+oMO9xt9DZGh/gwP0Yto6teRQuD/yTwZKSm4Aj2Ev2iVV5OH94QSBdQv3TF+kCfZIGyp43f/rAqTiAaFvwW09DFNiSHWrFvfkCtl164E4i7kdKlijWj3cVeCSlZs39a1ul5f+pUgNAvXRwE0wOgqQ8K8pa+fx12P3jKZN1OpxUWapbRhkCsqcS5uI6KNYa3esck35VGsqt7iXmWURiM1ywzMECvEg2DaO9T2T+TexK9sdfp1NV5Dj+vkHiII/Hsmo94usltCS39T/vh7rJ/OUnNfyBYsdyixxtetAgTTDrC768N1fzP245O2y2B3EJT+Ywc86ArUk7PQmdAmvAqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AIw3vjFoCFUxjZrukLvtppCNyk6Am8hJnEnozgG4eYhQBxDAzEgORr/Gy+8X?=
 =?us-ascii?Q?GInCGxxN3PoOtrx1Wm1EnaKMJIDnpIPMXyPLc6klOdxZjadCUUV5bfqM5q7+?=
 =?us-ascii?Q?W/fMhtpUUbwnVOQlEdHGzm+hYrBbG7TyoAJ+eGQGfaTFP5yY2ENq5sw0ze5I?=
 =?us-ascii?Q?eu0bVyEkXWY/NieAk0JZ7zRiItvT4/IhMg2TR7+nBKCIW2pUzF13IB6pz1VF?=
 =?us-ascii?Q?0JoNjR+DmEag3RcwtQPAoBJ+HydFUap2iFmlzVcH9thhphYicCNZXzmW1uw3?=
 =?us-ascii?Q?sGNNNjY8qRkiBj0TA9yyMO+l5UljCQMN8IAnSuQ+Ghg2HS2mRdJleZcJtGdH?=
 =?us-ascii?Q?obaT6Ada13VlGPt6DdVByOELyphpTiiIOBP48OyL2RJiedhAnBsuhQ896xvi?=
 =?us-ascii?Q?sgNrC11SJVZCEQxebjux22/SaFxjIqBTI+la4wjK/+GS7xZ6SSEGT0F1c6zK?=
 =?us-ascii?Q?G2HILBXf+EGKx1OJzVx4m5wp0uzlM+TZnosP+7mmEvNyCqAIwHom/E/AfoAl?=
 =?us-ascii?Q?36ZOOY1G4wX3dTRwaAGSRlGNrxUV7uBP/8cahmj3YwIKa8jz1ADeATZy+TOd?=
 =?us-ascii?Q?SVdhdtviEvE2ZpddMfuV4SS31PLI2i1ZMVMjJpEWjLQU//QnBtBb6iiEqHtv?=
 =?us-ascii?Q?t1icJS45oGF+i/WOEWD4B0KcvXIheB5aJYuY68ZwRzohaPzdHxGIfZlvLxK4?=
 =?us-ascii?Q?KesEGSWaHFlw5Elvo5cGfgoWkFqbmc5k0IAputRjUhu5nBu9n6f2jspPhHT3?=
 =?us-ascii?Q?/ayKKFALOpDyzGGF6YVFM4D/kk601MgsiXQdYDGOBG8iKBrGLcHhHzIFfBAY?=
 =?us-ascii?Q?kLqEqyFyLa2ZuzldLrlf5zM7MnpX/8Ci0TAuvSSH1g7qxGHeYfBuTmXJrXsp?=
 =?us-ascii?Q?SvRIxlpOU7TFF00YtCGd7HoXGVuI67URBKw79c4HELc9VFA5No4UZcaPNCQw?=
 =?us-ascii?Q?dLw/2hzFoxlg7Jdni0LtygMTEga7TobD5VCTMr3S3Iw3l5Bz2PykLozOGPdl?=
 =?us-ascii?Q?9ZmbTvT6pZRB6yXkK/vXH/EPqtMLDcsD0AZDw1a2Vq5SQv2IeznNS+bkepVc?=
 =?us-ascii?Q?O3v1YSRtc0cEsAs28wbCBqxm3ZMBB4Rb2Hpw2tKOPBBhYknQZavymNGlbez1?=
 =?us-ascii?Q?NSjJLu4mMnP/NtadjggaNGIQuj/KiDQsS6p/j1H1DHvuzjqm2wa0VlsCEw0z?=
 =?us-ascii?Q?avVUbtg7pG0LPEiVNK2rmLcTNLgDqcCP4RoRCgEs0NwxFSopT6BadKoulPuY?=
 =?us-ascii?Q?TBtg5VK9dh7CE8NqgTBsQCayVLNqu0Mleyo8RpTDlTq+qvgK6tWBjHROyeA9?=
 =?us-ascii?Q?6VqiFaPmfyXUcKH6YJwKINAH6GS8Qef+rexRdoCcehOge5sVTREqQtmyw8zv?=
 =?us-ascii?Q?Mbt4lELE49WRRCit26HHqsvryU+29nNkvZpbru4cid/eOpy0TxtB/SgUU3dF?=
 =?us-ascii?Q?U6/wut0beHivN1ZVCJBx1SvJTD2Ebnm5f7bdvRgr60PBwigZIxInEFNcyFmk?=
 =?us-ascii?Q?Xm4x3xUkE3cLG/0gnwCBdqoR5X00+mSo+Bn7IOstB3LnUWwM8cDvPy6/ClwB?=
 =?us-ascii?Q?C3ZAa8nykJboHtWQqmcSpRU5j3rxO4Ta5LP5FpPaWDK030YUnio7U19VuMuS?=
 =?us-ascii?Q?UH+aGRBLOaj/jD/7x0636HeuLsPhn5JuZvwMTVQRkAcgQwCW/X+U6HH/JgNX?=
 =?us-ascii?Q?a9o0QD/oSVRSKmRb5pfmguMdan0OOe9C+pwK0qHdb2p8z86P519cyE+8fHOA?=
 =?us-ascii?Q?6wWcUpnT6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6051b857-a040-4b8e-e403-08df183c41e8
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 23:58:39.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mF1e4ShaSNoVlVxJhwuOFDEeTTDL7EJA4hoLEQYtPFLk6n4a7WBEAkraBTxWMLAL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF816B88375

On 21 Sep 2026, at 12:38, Gregory Price wrote:

> On Mon, Sep 21, 2026 at 12:18:12PM -0400, Zi Yan wrote:
>> On 20 Sep 2026, at 23:29, Gregory Price wrote:
>>
>> OK, ZONELIST_PRIVATE and ZONELIST_KTEST are not upstream yet, right?
>> In theory, the new zlidx can be added when you add new ZONELIST_ types.
>>
>> I am OK with adding it now, but you could mention this change in
>> the commit message to avoid confusion. Something like,
>> for bulid_node_zonelist(), use ZONELIST_FALLBACK explicitly.
>>
> ...
>>> And add a BUILD_ON_BUG/ASSERT that forces any CONFIG_NUMA to have
>>> balanced zonelist additions.
>>
>> Got it. Thank you for the explanation. Are all combinations of
>> {ZONELIST_FALLBACK, ZONELIST_PRIVATE, ZONELIST_KTEST} x
>> {N_MEMORY_GENERAL, N_MEMORY, /* private only */} allowed?
>
> Slight inaccuracy on the way zonelists are actually built.
>
> Every node has a list in every zonelist.  The contents of each node's
> list in that zonelist are limited to the candidate nodemask.
>
> So consider the following nodes:  N0, N1, P2   (N=normal, P=private)
>
> With the following candidate mappings:
>    FALLBACK = N_MEMORY_GENERAL  (_COMMON)  (all normal nodes)
>    PRIVATE  = N_MEMORY                     (all nodes)
>    KTEST    = N_MEMORY & !N_MEMORY_GENERAL (only private nodes)
>

One more question. What prevents one adding
build_node_zonelists(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK)?
Based on your above mapping, each of ZONELIST_* has its own candidate.


Best Regards,
Yan, Zi
