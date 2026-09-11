Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011046.outbound.protection.outlook.com [40.107.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44213655CD
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138680; cv=fail; b=aRQmPpoI5XbFfB9XKky7sYjBjNv+Wba1xCwySonJr0oU6xtBoV0SR6BZMdm14Hmk9LsoXRYq4VpSBL9KW2HOGwcpGzuO0t0FJL2woq5QmXsDzU3U3a6PFqn0npnm/z9YOnaL4SgJL/sQA8PJ4XScEEbRhty5GQLdoxrMw1hXDf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138680; c=relaxed/simple;
	bh=TILfLR8tee13k+feGXPtpzY1apjQ18DEZe8imNrDvlQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To:MIME-Version; b=TZMUFLR5Dc6lSGWDypRCHCNun9CJWtFBCN2nsMe/Q1fPbCgolvet7n6d9BLdRRY5p92Bo970W0F0hYuXs2AM9QDkCVVFzGRiLfU1F4Zll0+q+RcCYl3MlMa5+DuGvRredSJRdDPnBQSrKmEWYt90KEG7DvnY+rHzKJG/OY8chWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jCrknJHL; arc=fail smtp.client-ip=40.107.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jCrknJHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLVlCUoQaWCPVetE4UhhOT1l5QQ8Tzv8QaIHqe3biGI/jDcuRCM3+FHJtWxJ/9Kjj9PfeIzIjxl3rFQKbODm0maroxyRYVCPvfUj5eengme+rKPXPi9hk5ebq7ShjDmpyFVbV0XLYKybUDKBPwV70VWWwg3baQm1ef+Z7F9lLwoIVKRLj8eDw3TlQNMPAis5wlxAYNSwjctWYuFG0V7gxfH1FBHVC2xvK5xJNMRERYGP0t65Ah9iXiKiWc+bLFxFQEjet5HWtXq7+8DMeq4Wo/6n/2BDnZ/VvWa8p7QekcHxSiRZqKqzp5h6fXV314QKcyNllIvpkOFe2u94MkoX5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5zHz7C3SYtPtFBoVWGT45/Vhw475AS8QamE/epO6Hw=;
 b=hxhpTl4GQnzcYvwjm7GABMEMonFk+LM3YUBrPuUEmdAjrFTQTFjYtd5PUuDeQjTo/TmMsV2Gwwt7zi/V3qIFLcJeUnwloNMk64f2BXUsO6xaqWuWPbz2VP6YJHqnzlGsu2mV91ROmlt+akOqAfLM9/sWSt1Jmb2VksJU+AafKQfFak+bWUH+4QSUBJpsM1ZhIGJWyOdy1mAUmETyW+o7T7rOh8S2wei28RNqTPmY5EuXNrPpVd/NXuMCMd30Df/4u+DaJNbjh5UVehUhv5aa0dVvB4sRf8sPBppq1lhNOnbJQuGrZHrx5p85eL+SQEawwcxRhv//9aR9tudFxrzEhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5zHz7C3SYtPtFBoVWGT45/Vhw475AS8QamE/epO6Hw=;
 b=jCrknJHLmNuavyeJy7xzRAjhf+nXSzccvlkDS8AVqKQpUyq9tAga22pXMDbTLIzYVWfNPLqJEe73dSh+fPlCPl8sc3+4eUyuN1KKR4gbu2amKNKSLxJBfiepVuGpgTDAqQDGDeOX7xiT7RnV/qZ5NwYEbtWiPDOmktg2peJ42V+GdcYm/uResOcN+pArfLSXDrnUd661KIaPQuHpOIjtfRIO2JkvASOjKWLIsgq0T05TuNDxt3daERLwdKgDKJEAJDaD8srHSk7YYmZc2IJir+7y7UQldKp5QCKvgbMdZNi+pkS2L73+GHpDLPYZnQvbNp2rHP37NqPWzFN52OxOnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by PH7PR12MB6934.namprd12.prod.outlook.com (2603:10b6:510:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 14:57:48 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 14:57:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 10:57:46 -0400
Message-Id: <DLCKQ4T6VJZA.3KVN87GD21IBI@nvidia.com>
Subject: Re: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd()
 in its two callers
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>, "Liam R . Howlett"
 <liam@infradead.org>, "Nico Pache" <nico.pache@linux.dev>, "Ryan Roberts"
 <ryan.roberts@arm.com>, "Dev Jain" <dev.jain@arm.com>, "Barry Song"
 <baohua@kernel.org>, "Lance Yang" <lance.yang@linux.dev>, "Usama Arif"
 <usama.arif@linux.dev>, "Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn"
 <jannh@google.com>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Baolin Wang"
 <baolin.wang@linux.alibaba.com>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-10-kirill@shutemov.name>
In-Reply-To: <20260910120238.2529819-10-kirill@shutemov.name>
X-ClientProxiedBy: YQBPR0101CA0201.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::7) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|PH7PR12MB6934:EE_
X-MS-Office365-Filtering-Correlation-Id: e5073c25-1685-4186-2b76-08df10150b9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	ACYiBm4Lz+58cGTkniLtYn2hWqS2U1Mw2cTnpY+5THkUUiAFHPN3cIco866vXGRh4CE4v3dniHhFawzbqHHlFtUcZehkSXoxQymtcHa3B4CHoZ9Idu3/SwSTHAqBe7QCS8HxgfHk+jGPIRXpNL7ZWi1RbXcrjdkNLbWvZeGO5A6B0a/hdHnkTySIxZx33qaUBpyxvPqhFWmSn4y43LfD1ZgGXtXhn2FOIHXgj3hRWSJSDQthqeaOlJ0O+FiGp1MhMsPUQ2rVf69/XM8ES+MWQAHZSQ6cs2AnkyypgiW4Aawx8PcKuc+HJHn21Vi348T3B0bi4mWIJMEqcvOXk0YWIFNrHgCOBUCVhCi1Q8eCrY4jIXUQd/uZAGCgJSkVGaJTeLF8RoLEBlPKpSPMmMqKUzLABaqOg6vWIYS+mTXdc4RZtQSeXthPCB2eWN4SSk9WY+RWjjbWw63Qb6+tezFJwoimo9Te6bU8ACO3gYiCDH79e8OIcQFtcvFyXHJlSNZ8p4FKjU5wLSPgp1x8Hz2kfAFSOWnFsUC1BT2RNpcyrE2X0xdcIMD1JnIlQ48jje26f+x40jklFSzuNBVRx0yuGBE3yphOIG2nGGQs1YifnhK1S1ys5y7eRpuSax+U1ngKKNTRu+6Ctnu3KuLuwy0JTHhwggf6p4Bjyopvx5QM1g4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjR1NjlScmpaT0pMb1ZtR2tmekJwb1VldmtKNzlPQVMzSFpiSSsxbm50Y2NG?=
 =?utf-8?B?Z0ErdzlaRHRVcW1DVDV2Rkxoc09XTklvRDMvaTMyR0pOMGVHZjFjcnN5VXcy?=
 =?utf-8?B?TG1DZWpVQkFTSnRoRENNY2xGa1hSRHVmZEdBNHE4QWZDT3BPTitoTDE2R1dz?=
 =?utf-8?B?UjZTWnZ1QUxaSE9MYkJnMWFMdERJRlg4VFNNUGRHbWVxUkdQU1Fiem1LVVUz?=
 =?utf-8?B?SGkydWRqQXJ3T2E4T1ZEcVdSUlZKL2lVUkhOcnFWMGtIeE9qMEhidmluaDBq?=
 =?utf-8?B?QjVrSkFkYXJHK2VGSEZGYXpxL094NlN1cmN3Y0RUdUExZi9NcksyUEJrdk9s?=
 =?utf-8?B?WWFydTg4eDFuRU1uU0RtYkZQMmIxak5mUzhma2paZkJNU1dRYngva1kxcUZs?=
 =?utf-8?B?YXExQkUyQWZjQzR5MTVpdGpIb21vM1lZRThiZ095eXBRZkJtZ0JVL2d3N2FK?=
 =?utf-8?B?WDc3VE5yT2F1SFhNV1pHdlFDRncrekwxMjlsWFF4UHBzS3hTckpZK0FJbWtO?=
 =?utf-8?B?Rmc3TWl4dm5wNitXS3RyRXpDWDNuTXM2d2ZpOXlzbFpqa2pKNVlscUxiM2Ja?=
 =?utf-8?B?ZG5FWXdRT20xd2U1VlcvU3hIRGRxSDMvVHhrK0dQRDhrVTBLQmtJVEJXb1RM?=
 =?utf-8?B?djdMa2lDelFDNWMzTVVtYjZoOHFjZDN6TzVPYnU0OEU2YktHeXpSNm8vSWdt?=
 =?utf-8?B?d2RURmxHZWtFYnBtTk1odU83dk9DRU9oOFBtOEFoMGRPTENDdzhkbkVoY0VP?=
 =?utf-8?B?eVM0eUQxenVsMnV3OVdzN1NjSkttYmRxa05GWUJwQUZPemJmVjBaZ01YTzUx?=
 =?utf-8?B?V0xKZ08xR3dxdXo5WmIxUGIrMG9ISVlsNXlNUHk2U2JRRUt4c2syaHoxRVZx?=
 =?utf-8?B?Vi9mNFlja2ZVc25TUUQ0Z3RVY2ZwVThhQ1crR05KeXh2endXWlljM2d6c3dQ?=
 =?utf-8?B?SEhoUVhaSktrMGdodzRDL2lMbTh2aE05cjNFbnQrZlIyT1YyT2Q3RWo4MmJ5?=
 =?utf-8?B?eWZTa2xjZXBHRzNDRFEvbVBiOG8zUWhqTVhmVHA4WWY1UmJlVVV6eWNsU1JR?=
 =?utf-8?B?eDlleFZBTnRyTVl6TVNDMnVHK1dlclpkS3V2bFhnSHU3aVMxMEVXbXlSRTZH?=
 =?utf-8?B?S2dSZ29uRGE2SG5ZY1BKSnp6RDhqNGFHVElXMk9qR2FEZmpDcWR6QmFrbmhF?=
 =?utf-8?B?NGY3KzlqWHg4QnNaMkpiSnJud2swa05JVFowWnBnd3JOcy9kRG5Jd08zby9F?=
 =?utf-8?B?TXZUUEh5dlNpTmJ4RHVpWDNHUGhOYitCZEpvUmtVK2x6WnlhelZHZTNyMFhh?=
 =?utf-8?B?V3FRVXpSblFESUUvMTZqdi9wQXFhSWZOOWVyUThBeWxWVTQwWWo1V2QrcS93?=
 =?utf-8?B?WmdnR3pLSldvVkFLbDIxb01rWVBHK3ZJU0JjUTN3TCtCelRtSjQvSDdsSG9k?=
 =?utf-8?B?TXVBTjFQTUF0eGVSdkt5dElvSEh2SGJBcHJha3BZS0hjcUZWVjcvYXFWWWdM?=
 =?utf-8?B?bnI1VHBHVHlwcmR3MzdwbVVaMEk5aHlreGNNTEdtTVQ4K0tWaC94eEdXMUNx?=
 =?utf-8?B?UU9SSCtxRm9Bd213bWw3YUxnYlhyTkVHZWN5NU1XMUQ0Mkd3L2QxQnI1cnJ0?=
 =?utf-8?B?SDhHUkhIN1JhSW9HWUJoYnVpVi84VG51UWhCSEtEODNzTDRSLzQ2U3VoMlZG?=
 =?utf-8?B?QTJMamYwVTRqOGJEMXpYOXVtclRmczNLczg3TGxoU3JrTlppVG5OdlBYb1p6?=
 =?utf-8?B?K0ptajRIODB1anBVWVdnUnBSWURQdGh0cXIvTUcrOVdFSnFyWjB5bHpoNlRF?=
 =?utf-8?B?UTNCTkQyVm5Ec1J3R21MV20yVld2VXJMT1hEcU9HbGxOaU5kbmNwbVNOL242?=
 =?utf-8?B?eWxneUFHTk1HYXhlV2VST0RQc2ptMHQ3Q0hlY3BsNFEyRFIyeTJPTlBCOEhl?=
 =?utf-8?B?dzdNN3hNZ0ZlejNaNlhzYjA3YmJiKzAvdVlVSHRXb2xRREhWTTBydzc2NkdJ?=
 =?utf-8?B?M0VOa3lybDF4WUQvVzZBcTF0MWZjbzE5WGd5UC9QZXF3ZmdrNGhjUmtyeFpI?=
 =?utf-8?B?cEJ2UXJnb1pwdGJjUkplOUVnU1ExdmhKTkNjK1drUkdsdXpoZ1hzc0VIMm9M?=
 =?utf-8?B?RkRDTTZTazMzQ05qVFBMbWE3T0luMUlub01jUjJaTjc3Y0JPVE00bDVYQVhx?=
 =?utf-8?B?NXlxaFMzaUplYkRmNktZYVdndExPZTkxL0ZIbFRxNzRSbVYzWHVqcXl1aHcx?=
 =?utf-8?B?cjhWNWpJQnpoVmVtZDNXc1F4ZmowZitvYUxqZjlMSDlqcTZxRmFYc3JncStl?=
 =?utf-8?Q?Sq93otEV9gvZfmKR8t?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5073c25-1685-4186-2b76-08df10150b9a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 14:57:48.6731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LyRzz/HV4iaaaeKdlnDgnU5KLZuPRXBlLTnbv/zMRQXnAndP4oAPIv6XSiCnp3F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6934

On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
> contract.  The scan is called with mmap_lock held for reading and returns
> with it still held.  The collapse is called without it.
>
> collapse_single_pmd() kept that boundary inside itself.  It dropped the
> lock on some paths and not others, and reported which by way of a bool it=
s
> callers had to carry along and then act on.
>
> Open-code it in the two callers.  Each scans under the lock it already
> holds and, on SCAN_SUCCEED, gives the lock up before running the collapse=
.
> khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
> the code dropping the lock is now the code that wanted to know.
>
> khugepaged's walk carries on to the next table while the scan keeps
> refusing, and ends once a collapse has taken the lock from under it.
> madvise_collapse() re-finds its VMA after a collapse, which it did before=
,
> and now uses a NULL vma to say that it has to.  It still reports the drop
> to its own caller, from the line that does it.
>
> The lock is given up and taken again at the same points as before.  No
> functional change.
>
> Assisted-by: LLM
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
>  1 file changed, 49 insertions(+), 53 deletions(-)
>

LGTM. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

One question:

What prevents us from doing:
while () {
    1. mmap_lock
    2. scan_pmd
    3. mmap_unlock, bail out if needed
    4. run_pmd
}

for both cases? It improves readability. What is the downside of
dropping the lock during multiple scans?

for madvise_collapse(), I see mmap_read_lock is held when it is called,
so it can be dropped at the entry and the code makes sure it is held at
the exit.


--=20
Best Regards,
Yan, Zi

