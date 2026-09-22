Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7755C339;
	Tue, 22 Sep 2026 15:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089433; cv=fail; b=IaxKPLYbc8ZfGEP3myAmC5qKGPGWSCXJGviFtsByzo58bheNZYUU/pxk3uhpzuhKoW8CwFwhQ+IrU7nlykUZwormYefMro+Ih+Ywu/PCr0UE5Q6eWlgzDeeBrQRiKZN3iNolGLROEqbbAVHCMnoAdvgQM+Da+mCv676hpOf0Upo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089433; c=relaxed/simple;
	bh=igcInwgKn4PXnn2Cm8gxnqy2O5ESpaWZO6P+1f7aBFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T/eLh/sKdJdtRB7p3A4CpwtiCJDFn9UTpc6TtAWBrteWWiHtwkU/oqNVMzHrEgmHHMW4imfQZ5kcmlc5agBdFjtYs0IFE17Vq94mAESbtzXhO52MmayDOFrFaB/9dm1/U/z1J2qcsycDqdzFwFMoaN8sn0sThFIr3rUWHj57/14=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rER/w+IV; arc=fail smtp.client-ip=40.107.208.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rER/w+IV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDIeJRUYvi/O7NSKpAzOqgoZyrxgI5C5/Dguy9fo1ZxzaMAue+paVI87SOriieIECw75qmnW610EJ6ooijYYg8hzSbbILlSAqpKZgZZ+o8wy0FAkrt4RhCuTPP3RMNAMIcDEEm5Bu4xQQklzDfDtqCJwftSGu6Tb9DISwgR36nsIhgO1NUJvWJxEz9FhSaoeIdtzXaHUO6RUBW3iZFEMZWyyy22C7aNS0TWPKUsa1bRxA9TuaxYv+RjqsSADaOqLm5tpATD6cavZrHpdchCupyc/zUa/aFH7L4i3keiIMYija0k6A2kzKqYE3Qlm40oe4OWG0nOBkbtFp3uajkrxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=igcInwgKn4PXnn2Cm8gxnqy2O5ESpaWZO6P+1f7aBFk=;
 b=ElsaipMNcjx3wv8ceYUcCOmRdO9uj9amhG0+myAOhGaGZLZlpPAWlaWZ/VNZm32C4xuFSgV3vPJQzCTzFyoiy9d/9wLygBIPwDrk9GGB849M/9yNzZa2SbEUsBoW6W1pZ5cwNPbonh+NBMzYWY5pxQjxN7AalDNvWxW/0ywoaSURGQtwF0Bna654DqPVUyf0nfwusNkhqqBeJoNAw8jCw578Aor67zXScnvIvZ1xHfHbuAcgGB/NHCWk/80xFnFY4z9mCE/xFruh1tG4AomG4NXo0cKQljThkLNhD0avTx9BxLhM0CyCqeLcq/3uHXhHCSrIeQT9AHFlakinA9v+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=igcInwgKn4PXnn2Cm8gxnqy2O5ESpaWZO6P+1f7aBFk=;
 b=rER/w+IVleDirH3n9Q+yddlZkBgubDP30jIqkdxj70MHfhfJlVLFgUdzqrBPLeBEDpd6XzK1//2d9bUKYiQH5wbpwuwkR3CgZEPkx6k1RMmiaUZmuN6FT82ecBZTMv1mhxFyLXWbgj9uVAvnujdAatek8S5m+hTNVsg7XyYgBQ2QF1dks2Lig/qCE9vC7QSeFJgCXArIf84noLfn56+MDkvgy4ZINkC4Xf3REaTYd47+IAPCZrf7Gm5UDLdWKz0jmPTNQjkRcJY9OFwqlGTd9L9Jz14n1ftgk+tZVxiKTZcdBdt9qjaEmqMcNlcq0g5RK70XT7LqSTDu/7J+CvHOOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 15:03:46 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 15:03:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: "zhen.ni" <zhen.ni@easystack.cn>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mm/page_owner: Add PID/TGID/COMM and cgroup
 filtering
Date: Tue, 22 Sep 2026 11:03:44 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <D5BBFCA8-AE62-429A-B982-39D5B7629FF7@nvidia.com>
In-Reply-To: <0894f68a-9cef-47ac-bf8e-86cb18b6cf67@easystack.cn>
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
 <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
 <d8d34e16-57fa-48b7-93a9-afbf4b950ce6@easystack.cn>
 <98ca914b-4722-448d-b5a4-7f095d0ca433@kernel.org> <aqPmlw8WYW9HSzIV@gremlin>
 <99a94068-ab37-47c0-878c-7c1ada5204b2@easystack.cn>
 <8997BF57-2124-4F71-9CEE-6F7D31A15D87@nvidia.com>
 <0894f68a-9cef-47ac-bf8e-86cb18b6cf67@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: MN2PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:208:238::11) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: ee089420-7c5a-4b56-49bc-08df18bab32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|4143699003|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zjKpeEE9e6aJThiWxbWuiW5ooSFYUu+t0+vhIbn+oRK38EMVJPpV+sOJudIbe5cWownTR4ZCtzZSF2pMvxXsAskFg+q6BL513NiLiH+YZ8jNETBXkykrfc1Rq9R6+yDFxWZdy4RRlKOXtmOHSiAeROjZItzgHieLU/jGtFiqIDPdX/C6h9RP208jru6Ri3tv5w8m58/CGlEh7U2H0K1xBv+0QB/cfT9Y138pMXmomSERVX6NX4Cv425JEXis0ccU/629H7VU//Hh65GhDn/mSuh9HKcG30pSpklQ/sYHBwdni38/GL9dsQgVJU/IPP6dF32ffe+uTZgz//GzVgmBAywl45iKu7++1xA7q9+tjHBAZ80hdwJ29P65xx8VCV0Op9pTEswlV4FJt2LZBnIWOsc4pBInmmYesCAHX584v1XbwMr7qgwtF3QjMpdPM2elKYrgLhEQ0CYLwcLKCbf8/4UcrClM3VJMB53nqFbEFLNfCP9DjG5sJtJzgpDvA7uQ7+ZhDWVtaumWWVOvX2FEAjQVmwLHrCofVsAG0/8iI/caF1A1gady2bY5eofa3Ib56MOsj7aPVc02uiS/qmgbbd06WxRk0xDNSZSCQjY6Hz0ZJZgIhD6G97XXPQYPW3YCzDLxn2fjUdTKwVokzlWBpIABUJWmA+dSgVaTj6nMnlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1FORzJ3Mk9VZ05WeUZ3Vkw3ZEpNeVNjSStXQnY1TGxHb2NyNjVzc3YwUmt1?=
 =?utf-8?B?M2x0RnF6U0E2aWFjeDJXV2xrejRIeVdIS00wekE4NVpTSWNUS2xCb3VodTRv?=
 =?utf-8?B?aEVjcUg4V0lWOGhlUjJwUHpVUTNhb1YraVRodzk1bGhpWHVoU3E5OEw3cDlz?=
 =?utf-8?B?NWNtQTkwcXR2WFhubFVGQ0ZJc0QyR0JEQkFJUFMxajIybXdMZlozbUE3MC9E?=
 =?utf-8?B?azVvd3lXY2dGNWJTdHpwVW50NEtEZS9RbTAyVHVqTDEvOHNQUVJnbndJSzFu?=
 =?utf-8?B?eVJuVWZFcHBlTGpQUlZhcW9TRXlTR3drb1o2VDFtcVZZRGQrdEdQWXhIY0lJ?=
 =?utf-8?B?RmJQWGtjSGxvRkxwZ2VGN0ZZa1laaDBRRWQvNHZHQUJsaVk1VE1JNWJQRHo3?=
 =?utf-8?B?bDBwMmlnSlJjWEtCeVZKMzJGQUg2M1FPRlVhNlhjUitWRjBuL0t5bE9zK1hJ?=
 =?utf-8?B?YWpoWFNrZGNJQWptWHZxMFJOd0RqaThnTjlpU2pQRUc4Mm85ak41VzRHc1NQ?=
 =?utf-8?B?YlRvYVFiM1p3a0tOb1RybjlZU1pqMDZvcGNBQ3p6UldMOXZpYmtLUzhrdzE3?=
 =?utf-8?B?ajlOTXpOY3dyV0RSVC9RSTJ3bXpnSXdWdVpUcUR1bXdjb2d6dU51K0toK2c1?=
 =?utf-8?B?aVBheHFhdkpCOHc2alZFZmtaN2NCNVc3OHRieWcvQm9qU0t5ZXpZRmZ2NURT?=
 =?utf-8?B?S1B1d01qMTIvRjJwL2JYNHBaVHpRdy9sbVgvWTNPdDY3VlkyN0ptekpVZkJV?=
 =?utf-8?B?SmxmY2FjSDcxb0thUVM1OVQwNTh2RktHeU1Qcyt6NlpNNy9KMDBVUzdOU3Ir?=
 =?utf-8?B?UVVkTGl6YlRMaGhlN2I5RXhvUy81bzFkbmVTNFJITTllOVB5YzBpcW1tTkE5?=
 =?utf-8?B?ZlRpWGg0eCtBVEgxcE5mWm5zbzkwRmluZzFrckhKMW1USkpKNE5ZWDhOUmhV?=
 =?utf-8?B?dW41V25YMWtUN3BxdXMyR0w2ZmRTYk9wQmV4cnBLNnprWENCeGVPOVNQVTF3?=
 =?utf-8?B?N0RlbGYzQ0M2Y1VFcDBWTnlnMHdvTG9MZ3ZEb25WN0h0d2w4ZzJ0Wkp4dExS?=
 =?utf-8?B?bWlUZmFRMHc5bkduTUlja05lYmtsNDVrMjk2NW9jSUtvVHVCbDVSSGpNN3dk?=
 =?utf-8?B?MlBGbmk5SWV5UEdIY2xUbG9ieUJ2UlMwMzBVbzhUZFJkZHl3ZnRKaWRNZFhn?=
 =?utf-8?B?dnRRMDY0MExiSDg4YmhJUUdUek5qWEJTSUJnckk2N3VKTWtTV05ETEVva0ti?=
 =?utf-8?B?UzV4cFRmclRRWmh5L2xDYmhiL1BBS2lOdFBTKy9Uam8rMkl0NHJZN0c1alN6?=
 =?utf-8?B?RmtmbEVjOGRJSUw5QnJhZFQ4NzJNcXVWb3luSUN3bTFaeU1PZTNZVk5OVUh4?=
 =?utf-8?B?Y2s4b1NabFUycThGWlhxeWVMVHYvMitYMXVJc2RLNklMRjRzMWZFVzZvVnln?=
 =?utf-8?B?VFhKVkFNWmZhRTlSS2lSL3YwMGU1c1FYK3lGUTgrRG5IU0NRcG56SkVPQTMv?=
 =?utf-8?B?a09FbmRnZ2FVOHhIY1pFR2R6T1B4SzBhOGhiQ2xuZk02N2J5aGJiVkt2cVND?=
 =?utf-8?B?ZGNBRU1manlZelk3YWkwSTN2NEI5V3FaT1hIcCtuYkRJendianNkaHVIOGVz?=
 =?utf-8?B?ZGlab3Z1cUxpKy9vYlFSU0NFOGgxMmFjUlFUbDh6OUxWcDBCVnFEM040TW1t?=
 =?utf-8?B?U0ExcFd6bEdKa0tzNU04SDJmSEl5UzBQRE9aZ2Z4ZkMyL2d0LzVRRkxGOWlP?=
 =?utf-8?B?Z2FhYTdlK0dqemtIZ1JBenlZOVpiK3JXMkQ0VVh1YVJ2MmFKRjJ4Wkl0bXhE?=
 =?utf-8?B?dkt0dVlSanZ2a0RyUktibVV6aHFseU9yeTlSS0l3eWttZ3ZRbVU1N1g3MGpG?=
 =?utf-8?B?MTM0SXJWRzE5R1RHcUhtTlFDdXkzOFJQM0g2TzNDV081TjAzSXlaWElSV2Nr?=
 =?utf-8?B?akhFOTRLSTR2NDIvUUFqT2VtYk1nMFhRUmVVM0pZOTlZbkNlb1ZDeWpQNWZH?=
 =?utf-8?B?aEtmQWpPWHFwZXZQSkJBbmZJVVAzbFFLMS9ISk1NWXA2WHZiZkhyalJHcTlz?=
 =?utf-8?B?OTFUYXB1aUVUSnlMMXRXVUZZY3hYYm1PdDNHYlRzdTZRT3lWVkRLSkwySHY1?=
 =?utf-8?B?Ti9LTDhEZHdpUmk2RnN6VnZmMmV3MmVlSjlMdGMyempsTXIwdzMyNWdwY1Ar?=
 =?utf-8?B?VDZzbUtvci90c1pLdEQyaHpScDRQa0o5eUZyNDZlWWswbHZVTFFOMWcwVW5N?=
 =?utf-8?B?enFHeEIwclUvYzBEZzJzMkREQjZaQitKK1lxbUdVNFNESGhjQ2srR29RSDgx?=
 =?utf-8?B?Vm9LTzMvcGloaGZoY1h5MlFRUVQ4MG55RWZwRnlOUEU1bzR3UGZtQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee089420-7c5a-4b56-49bc-08df18bab32c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 15:03:46.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zii16ReWkjRHt55bmoOzpWxM8AfelFc2+DdtMxfxJ4omDBmEgAY3igjCrBQbrNOs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366

On 22 Sep 2026, at 8:33, zhen.ni wrote:

> 在 2026/9/22 00:25, Zi Yan 写道:
>> On 19 Sep 2026, at 22:11, zhen.ni wrote:
>>
>>> 在 2026/9/11 19:32, Lorenzo Stoakes (ARM) 写道:
>>>> On Fri, Sep 11, 2026 at 01:06:46PM +0200, David Hildenbrand (Arm) wrote:
>>>>> On 9/11/26 09:58, zhen.ni wrote:
>>>>>>
>>>>>>
>>>>>> 在 2026/9/9 23:54, Zi Yan 写道:
>>>>>>> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
>>>>>>>
>>>>>>>>
>>>>>>>> Because it results in less kernel code  :)
>>>>>>>>
>>>>>>>> And less kernel code is good. Unless unavoidable.
>>>>>>>
>>>>>>> An alternative is to add BPF hooks like bpf_iter to do the filtering
>>>>>>> and by default, when no BPF program is attached, everything is printed.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> I’ve also thought about a similar approach—perhaps a new bpf_iter type
>>>>>> that could iterate over all pages by PFN. The advantage would be that
>>>>>> you can fully customize what you want to print and what you want to
>>>>>> filter. However, doing so would require refactoring the entire
>>>>>> page_owner, and I’m not sure whether it’s worth pursuing in this
>>>>>> direction.I’d also like to hear everyone’s thoughts on this.
>>>>>
>>>>> Certainly better than having more and more manual filters added to the code base.
>>>>
>>>> Agreed.
>>>>
>>>> bpf seems the ideal fit here I think?
>>>>
>>>> Means that those who want this information can get it and those who don't are
>>>> unaffected.
>>>>
>>>
>>> I have prototyped page_owner bpf_iter and confirmed it is a viable and
>>> valuable direction:
>>>
>>> 1.Most parameter parsing is offloaded to the existing BPF verifier,
>>> keeping the page_owner kernel-side logic simple.
>>>
>>> 2.Filtering and printing are delegated to the BPF program, providing
>>> greater flexibility and enabling more complex composite filtering.
>>
>> Without attaching a BPF program, page_owner could still print to
>> the console, right? Otherwise, it will break existing users without a
>> BPF program. You could add a hook to decide where to print the results.
>>
>
> The existing console/debugfs path is untouched -- the BPF iterator is a
> new, opt-in channel that coexists with it. Without a program attached,
> page_owner behaves exactly as before.

Sounds great. Thank you for the confirmation.

Best Regards,
Yan, Zi
