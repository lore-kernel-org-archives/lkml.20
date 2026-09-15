Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720E94B4890
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487556; cv=fail; b=VmfyckEC09isjt/XERXelzK5pbQxWqolN12tbvccOfrxP96vgZeMUJyDoQjeOiBhC9QUzOVz7AqMRaA0oPZOJ19CFyTWi1Yv+g/yFBwV3D7F0cW9h0pL1PcZgkcLq6Ne0/RXEDruYLdJUN1RhNlq9mfBLvDJRt4JhsdQfD2mFcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487556; c=relaxed/simple;
	bh=QQsPUcW7jC3NPazTgSjd1DD5lUSrYmoCAXJbUjw7qgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4qnUUrwCT3rViBg8QRtraxFPfNpv/l/fdm6op+Ryy3MyhoGKu9Nk70YTaCw+x9KqSqrN60ArtnxxGCFR+Qc9J/wNgRp3Oan7vVJluHaDr0lzYUU7MoihxsYvrty2cHCD+iJuk4NheJ61WDikVo8+yDFrYbC1iSKXpwv77KZ/1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DlJQ1j6x; arc=fail smtp.client-ip=52.101.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DlJQ1j6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2xFHNe2P/OPjq740XhVUYIOlmifAgRHw4DV2UrWBvplzJBNbI8025lMNNZ3JeWX5EtON1OCZutZZupOx91L5NLA1OAkqfDF5qJXN2IDQtlG4vObV9wtD7MxdfakUE23gryQehtpWs3vJtNkZpGvRSur2dX7oTdQDU/jPfX+5ZQNtmF5EOcAA3qEhPS4FWxgSr8OQw6g8i6GxWNSSPsGwqCImgSnbPt+PBEb4uSOwgiXiL4ypEPUJPea+Zr7Z+RdFjmIfmi42hKjQxe3RZprDOShSKyeD+RaZdCh0sLIqbT2n/l7OF5qVNpExkXgrug1XuQD3yJWMgv8kC2mIKs7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xuw6m+IoGXUCoU3dUnLtBdPER5KYVzNeQD5xsbFUgFg=;
 b=P0BJOyM+auBCMRugL2y1R/NwoGiRcQv5xapE77nxaGD/v95Z9966BME88n6v+REnS0H5z5oo+oWgTfeKeoXMDiCs/IbfSFZIRt6NjWXKoiRXnOw/EUlXrdLpJ038hIbXQqu10k/NJn5fLTJBrwFZFVvqu2P8ks0t4wgBra2lTEe3x2ZY66u8TD+7ZxyZB3lrgE8kfK5uR0zOghUOdPqy00TGZ85QHrkqFWN0rmCZke2ZkoM2XcmKHdM5qlvT/os7qG1mnlm0xHzquKLvgMjSPMn4W7bF4EtGj5n5t44RRDpOCfNINCsd5k9Z4y9zdenFBbyl2BidZRmKggq8BP+3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xuw6m+IoGXUCoU3dUnLtBdPER5KYVzNeQD5xsbFUgFg=;
 b=DlJQ1j6xRKUY8H5Vq5GYWyrlAov+Y8vNK1XIBemXAgC20gZsEo6cXLBS14ZpiDKu09rX2eJGPuiyLwgzaMXMihB1Yk/Z1dNW3JaJh7rbsPjlq5OZoN3wX1l4V5UfRGbA+B0IXgoKwdSfEV/WaXZSujGmh4pl/wmOJqf7tQ2crIonXaUiNkzeRIgyfIZD+q8FkpkO2/6zDmVD3RUTLtFb/hnvEAD5zosBDoKGHpsTwGVTai/zF0lXadGs/76VoqxZaWTL2TxKfonbcwKSFs9+gaWj0Wd7fKRc5Os3nsRLnyRAaHP4+Jf8T7sY3QsuWV2cXnMOQ1F8QBefKZNNnbsT0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) by
 SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:51:01 +0000
Received: from DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a]) by DS7PR12MB8371.namprd12.prod.outlook.com
 ([fe80::23d7:9e07:1de8:d80a%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:51:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R . Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
Subject: Re: [PATCH v2 09/12] mm/collapse: open-code collapse_single_pmd() in
 its two callers
Date: Tue, 15 Sep 2026 11:51:00 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <C70450FF-9795-4A17-9C5C-448C38203F7A@nvidia.com>
In-Reply-To: <aqfeuAPx3lCKSXtd@thinkstation>
References: <20260910120238.2529819-1-kirill@shutemov.name>
 <20260910120238.2529819-10-kirill@shutemov.name>
 <DLCTWPIN1HRO.2HK4RPZ43F301@nvidia.com> <aqfeuAPx3lCKSXtd@thinkstation>
Content-Type: text/plain
X-MS-Reactions: disallow
X-ClientProxiedBy: CH3P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:1e8::31) To DS7PR12MB8371.namprd12.prod.outlook.com
 (2603:10b6:8:e9::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8371:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 673783cc-a89b-458e-d1f0-08df134123ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|56012099006|6133799003|4143699003|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dziaLEzhS6SIvb55+yuaG27Z/0O4SLgAHTACVytaqzyroQM1RxZ2neZhfcp+s9dOJH1JHEELVUBpQR7icMrdG51dfmNvOj8itHvvpOu70Bg9EGXk2o1yeK0WTvq6q/ftW4JNigLKkxi4EcwivLwsbkjYR178wJtrg1i3aG/BUQp1icn8IZvU/Lwi9vmlbbTksJdLIYup6t9DX/ZEEzUEXi2F+kR5xmmp9aUwhcscJnV6SAoT/jkx23Kp0zPDAtdxXLkUzfmbkXT11vzwM0GwDUJ1oribqsgNKSFVTaZ/zApyHoJJAJuRZxiSyq7/YOSHQsxJOlUkQA520j2GKXYLWPKN3ocL4OvnoVetxig/7LKYsTC/AjqLAGxrV8wtARka/Fs/teCU2GGiQZePn70HCAFMmlotY4hUIFIbhIx2Cqq3b5IsmTUrhVDBtoAwmLJcZ66iI1FCQLodPIcKy+igkHwRY9HT7c/igx+l5VOpGEQo1bdI8y5kBxtTnGuVna7Vl7Uri2Gr8TyNm4Y9YoEFp+XJNHUt6xf8DuWVTRFqemVBAL9BPQOPWHIv4xOUJFVbw+IEqECvsOnZh9ekzW4beYmpfWPbIY7USxcXQRCEkO6eu/DmAatjjRpLvne4KgDCb6XlBBJJ+X2kfDDCdyYK7cIkHi9c0e3PR/8U2mcfB7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8371.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(56012099006)(6133799003)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6VljITF7x/YFg0TkkcxlkD2XfbHibsB5ofPHdmgqYZgDVJhnrS6g/w/QfiSm?=
 =?us-ascii?Q?h8FdKKro3SA1LAoFa6fvml/63FqDrTwM88IMeLs5ljPAWy3aOiKJxriqILY2?=
 =?us-ascii?Q?Fg0wRsr8DjTiZ+TcPCM8p6pzXyxPKJEqRYhzy7N0c1ny3atNg63v29lzdQEa?=
 =?us-ascii?Q?BViie/59c2goQi0pOM4cQD+ieJH4PsBp/sM6qmlh77ioPWN/tfdZ+8HYhisD?=
 =?us-ascii?Q?r+NTheo4YsQFZBEywgT+7rajBrNorv3oWmqc1WjbeTfUj23tUZCg3GxfzJ36?=
 =?us-ascii?Q?Y3REFwoG8nKtwg6ItJowwVjr1wDO84O2s9eFqHk5fZYHfrzxuBB0FH+rLDZM?=
 =?us-ascii?Q?BqNB5ayODj/6WQ4EdQhbOH0qZGXrnzmGwN9hQDHp4oyOHS2L4E9kAG1dUVvA?=
 =?us-ascii?Q?6OTi8Zal7jx+nQx5UaebvHK13hkG6oIUdxpbYHHAvq8LT2CcvagbP+Ph3KVC?=
 =?us-ascii?Q?7XhwIvJVucnGgmoQ/Bgy3jP1ZWDNSoIm0ADF4wef20wdd3F9kuy4cZocB1L7?=
 =?us-ascii?Q?39Kk3pFl2MQeG8lqWU6O5YNBSBPhnsbODyq8AAeXgo1optE7LO/sJDj2dT6f?=
 =?us-ascii?Q?h98hP4qdsW56rj1jQYFtNBYhF0khNpaJWD0eDbbA+PxEm31NGACD3DuC6dpn?=
 =?us-ascii?Q?laJIbMdvbusSp2VYufIaNX8Z7sA1Oy/IJ4HmraGn0QRGC92Et4oOikhy6cge?=
 =?us-ascii?Q?KafaNl3tHGqt8Grtgd6xzhg1sUgwt7RHTpt2qZCXiEhVfyLn2YxV4kf3C8ph?=
 =?us-ascii?Q?f7YGwy5YQvl3r44eBs8E/aHpcoqwvgIRLVJWNszYHdEs1aGmsNWqyWdcorBo?=
 =?us-ascii?Q?CAIam+elFruPyiuQySK1ZNEqfjk0+b/itPfTNeNC6sdKeoyamd6/zlzhpMdD?=
 =?us-ascii?Q?iJg09nlz/pqjvy6BXrpv62mWutOtBU6RkWBDhbykmQ9cH2DUnf+Bv8FaAmG6?=
 =?us-ascii?Q?9RatWESST5XoxeazsekVgJn8sYq7R6uhkIqLQTSQ0T7NM2Kyonq+i9jy2sF0?=
 =?us-ascii?Q?T3qPrb2EpIJ3MbKZLXnm2S4kaLsDJTNEEaQqaDeBgK8CsD/2GhVPKoLyJViU?=
 =?us-ascii?Q?5IetwzUp9baacAze7b7qfhszLeREvfDekfh2+oI2L0qLgfP8pdYlL/R/oAv0?=
 =?us-ascii?Q?PYIie1Qv2YsQLYHkHLnH4FYdsWrj5sgqu7l68c6ESV5ng4kakOalNfwFhT3R?=
 =?us-ascii?Q?/VnCjrn43USpVrxdi90KB2oXl2ucRuRKJFKTtYsJZRRKRoxskjisbe5+Z5z0?=
 =?us-ascii?Q?D2nmf0aK8H+ZdBvaec2pla1uRococqmyOLZKhlPco66ox1d+C8YPJVndp/KK?=
 =?us-ascii?Q?ny50Vd3IKf9W7fkKi53ppRUMjGeAECQXnlZDGmnMX8mqruEbb0celwnIQ9og?=
 =?us-ascii?Q?cNIaawLwERh7HBxrorpJkFl30pFKg79JBYes5UjHiQUQH+4FEBXImMc2kAC8?=
 =?us-ascii?Q?b04PP5ccY/EvhAIvhy1EiE/LJ5yX0fDfV1OsRlQ7gygMn9Kv7jTmK8cGCBlk?=
 =?us-ascii?Q?xvrhWZgXsKePHMs7SJD9Wxcw7eLxxuak9MTYBaYElqYKVNU84HbV6xRxRnZz?=
 =?us-ascii?Q?Eyl0KVaWAaIwsn2gFpAlnsL0B6SEE3uUwgsyqr/8MrEeMz2pWOBSfX8JoBJt?=
 =?us-ascii?Q?u+rOWZOIMEaiCFmDXGn3TkPOv2BE+lRfY2FgECxu4DkVmkR4nhyJv/RSFB/M?=
 =?us-ascii?Q?aD6T1rN7LmrlXe88uFIfk+wdt+8qK0ruMOeMwzeK7i4Ul/kT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673783cc-a89b-458e-d1f0-08df134123ee
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8371.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:51:00.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJ37od0r0UUGFyFbwI5mBYrGUKKNGF7UGP6Ltk6IZVu9feMqIQ9sD5GmqPRJ9xtB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902

On 14 Sep 2026, at 7:47, Kiryl Shutsemau wrote:

> On Fri, Sep 11, 2026 at 06:09:32PM -0400, Zi Yan wrote:
>> On Thu Sep 10, 2026 at 8:02 AM EDT, Kiryl Shutsemau wrote:
>>> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>>>
>>> collapse_scan_pmd() and collapse_run_pmd() each have a clear locking
>>> contract.  The scan is called with mmap_lock held for reading and returns
>>> with it still held.  The collapse is called without it.
>>>
>>> collapse_single_pmd() kept that boundary inside itself.  It dropped the
>>> lock on some paths and not others, and reported which by way of a bool its
>>> callers had to carry along and then act on.
>>>
>>> Open-code it in the two callers.  Each scans under the lock it already
>>> holds and, on SCAN_SUCCEED, gives the lock up before running the collapse.
>>> khugepaged's lock_dropped and madvise_collapse()'s mmap_unlocked both go:
>>> the code dropping the lock is now the code that wanted to know.
>>>
>>> khugepaged's walk carries on to the next table while the scan keeps
>>> refusing, and ends once a collapse has taken the lock from under it.
>>> madvise_collapse() re-finds its VMA after a collapse, which it did before,
>>> and now uses a NULL vma to say that it has to.  It still reports the drop
>>> to its own caller, from the line that does it.
>>>
>>> The lock is given up and taken again at the same points as before.  No
>>> functional change.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>>> ---
>>>  mm/khugepaged.c | 102 +++++++++++++++++++++++-------------------------
>>>  1 file changed, 49 insertions(+), 53 deletions(-)
>>>
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index c26907300c23..9bdf12128357 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -2857,28 +2857,6 @@ static enum scan_result collapse_run_pmd(struct mm_struct *mm,
>>>  	return result;
>>>  }
>>>
>>> -/*
>>> - * Try to collapse a single PMD starting at a PMD aligned addr, and return
>>> - * the results.
>>> - */
>>> -static enum scan_result collapse_single_pmd(unsigned long addr,
>>> -		struct vm_area_struct *vma, bool *lock_dropped,
>>> -		struct collapse_control *cc)
>>> -{
>>> -	struct mm_struct *mm = vma->vm_mm;
>>> -	enum scan_result result;
>>> -
>>> -	result = collapse_scan_pmd(vma, addr, cc);
>>> -	if (result != SCAN_SUCCEED)
>>> -		return result;
>>> -
>>> -	/* The collapse takes its own locks, so give this up */
>>> -	mmap_read_unlock(mm);
>>> -	*lock_dropped = true;
>>> -
>>> -	return collapse_run_pmd(mm, addr, cc);
>>> -}
>>> -
>>
>> Sorry for walking back on this. I think collapse_single_pmd() can be
>> kept and still get patch 10 to 12 applied. The reason is that by looking at the
>> code after patch 11 is applied, the collapse_scan_pmd() +
>> collapse_run_pmd() patterns in madvise_collapse() and
>> collapse_scan_mm_slot() look very similar. And it can make
>> collapse_scan_pmd() and collapse_run_pmd() internal with only
>> collapse_single_pmd() exported.
>
> I gave more motivation in my reply to David:
>
> https://lore.kernel.org/all/aqQf9hSy0iNjnL6t@thinkstation/
>
> Short version: scan and run have different locking expectations, and
> the split puts the boundary where the lock is. It is also what makes
> moving the scan to per-VMA locking trivial, since the caller owns the
> lock and the engine never touches it.

Thanks. You also explained this to me in my early email to patch 9.
It makes sense.

My motivation is to minimize code divergence of madvise_collapse and khugepaged.
But it seems that their workflows prevent the unification.

Best Regards,
Yan, Zi
