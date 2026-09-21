Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A54CDA0E;
	Mon, 21 Sep 2026 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790007944; cv=fail; b=mF8vx+E+EAcCpQeuGa/mdTY/gNQpE9sRuahlhhC+CIPnk+SdLNooXBTJXmSYTS/6/1klcCxGFI31GJuIJZU35t4nJ9ihxM/aNhikDjeyT4kZyBbfNdvZ2zuyS8zILTk1H09Plq6aW7MIyXC3+Jkw7szP71Snw++MnyskpQ/Uf5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790007944; c=relaxed/simple;
	bh=g2ys3Rzhhl/7J+TdS7CAgtomF41JC1ZAlJh9wRREBcA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Csc86wpmmMSsR6/6Hy2FaOqE0zbLe6HInmm+ZPwglF8dp/lXP/lBFBAKtFUzDdoLDWDQxoOxft/IVp2Iqm28crdtbspgNaBuTYP2e41pejUNauHxEZQGJmFuzWgW9H0OHNIRlv8qNvMWK2Q/QEMzw1HdmMNaOKrES9gq+/6Tr/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PmA/V3e5; arc=fail smtp.client-ip=52.101.53.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PmA/V3e5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYqxlzieItTpTt5DeJQ7TZOD0Rox/qpFz2XBrslz7winZgEXztRG2GnCW0eJS8Oycg4qGucOOyStKAEKicsZcQT9tkZfta4wHS1Z91u1l3kLzboTlxI+4Ngt/fEY024GZlbiUwsBOR3O9F6vv4rJmtRziedT6kLHB/Gj2SkYwXyh5vjN6vZTz27lKhgC+7nq8u5nXErxKMf31q5qhmbkjesvYTnksUWRDc+48FkwhpsgelsCdEhyM+M2AgrukrNO8LNQtjYosAg6M4nzFoSFrNYdWPPXXX/CMggzUxwjhwGNaivLwzgRgg4gXt2o1Drds/fG2EVMcPGR+Qbk/Vid/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2ys3Rzhhl/7J+TdS7CAgtomF41JC1ZAlJh9wRREBcA=;
 b=q03rTTj1YRq+ALRAqQic1+gOoyk2gO554zVFOERtjLOGXZ/bkqacubZc3r4O9kDVeFjWn9KTH6Dzj/R5dDVqp9uVgVUK5/GkUNgEWaL61JYkBol5QOOdLSEAq3X7XslgFVh0rrV5N1NNnzzMGP8YXI9UN3nutHibvK+AecO0jgFf9V1zCInX2fO93T82FotBYI5ytz6XX+u9M7eo642mYVsu/Z+BWmyPs2wEgnqP9kCtrbBbk3+VhrpztW9kxuqY/QGbaNVJ7SeqlXB3QjOjmKkIoq/AKEbGZfbfAsJWj6egeMYGvgEhQqJH8SGu9EuoHi/M5yIidWGu5c5e+C7CsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2ys3Rzhhl/7J+TdS7CAgtomF41JC1ZAlJh9wRREBcA=;
 b=PmA/V3e5B6arERnrlYgafQmv9pMwbYo9PJ21RDGyh7uEzrkH/UIHou6Sj9I8l+8nCCQursPYKvEb60N4/ie0s77LNxEUCkMNUfOjlihZK4PRQZnRiVz1HdWZtY5j/AnEpArpbNAFRt5D9WGt9d1u0iMNj8qshX/p+8c/Hq1d7CfDl4Fg1om23fpwAdYm7SZ/tzFitJcNtbiFfDN37QkoFzmNrrVq9xAQAJsbw7sqPUqTK65DSVToy8I/1Y27U+kFKvneAAIH3aW9ZbdmimAUp+lv1WWgiD/1Bfn83aKWCEygMOhiip0fnTCiJ2uoF+syvJL/PPUEmGp800Ekssr57g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by SN7PR12MB7346.namprd12.prod.outlook.com (2603:10b6:806:299::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:25:35 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:25:35 +0000
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
Date: Mon, 21 Sep 2026 12:25:31 -0400
X-Mailer: MailMate (3.0r7032)
Message-ID: <8997BF57-2124-4F71-9CEE-6F7D31A15D87@nvidia.com>
In-Reply-To: <99a94068-ab37-47c0-878c-7c1ada5204b2@easystack.cn>
References: <20260907082620.2083838-1-zhen.ni@easystack.cn>
 <79548641-25f3-4ec3-a549-782fad168962@kernel.org>
 <6e8bfb0d-d595-4e6b-9536-0323ada57e25@easystack.cn>
 <b8e23456-00af-4097-a769-210a087d2b90@kernel.org>
 <22D1EC4B-FBCB-421E-B8DA-345B5F3505FB@nvidia.com>
 <d8d34e16-57fa-48b7-93a9-afbf4b950ce6@easystack.cn>
 <98ca914b-4722-448d-b5a4-7f095d0ca433@kernel.org> <aqPmlw8WYW9HSzIV@gremlin>
 <99a94068-ab37-47c0-878c-7c1ada5204b2@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MS-Reactions: disallow
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|SN7PR12MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a67700-a703-49ea-a71e-08df17fcf73d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|11063799006|5023799004|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	KpAr3NY8na2XSWyhvZu3ZQdkzFWoitlQiQtNofxc+sELfY3oqsCRxSnlwpF6ocw945qXK47ZRsPkmlRphTduSB/6D5zg9yiZKiwdvoApAXQOTOW+bZ9dZ9/2IklZ62EZkREzSjSlEsU7AtYVgmVt60Tld6QLfVSQPrXnD84RPqS557QDrjm8iNohHolIF6RXZaAnHo18NCkLHb0jk/FnZ+RoICLCIVoY/aoHI+mfWJlWHxHOfzoUc8bDbuGBHrzzFKIZxGyuxOWwVLUi+iWQUnn91hw2nAYdI+OFnf59ULi91OWJexAm68WhBjR3fbtqcE4qWMGBP5cjmVYkRKxso0105S/FqpA9go4SVGR+FxqmZk7f7yee6dWzpqYFCYko3sYXVfqftnKsB7ksUQizhiWhpMZh9inG2wRE5OtRICYqilptBc/8VRHyCbqNVV68VBZlMQRpyemFUhntCZ4hIrYpAnF0tA58DlgsNmQ9cWzSLy/fkyYudrI2x4wlid4BGvYsZ0hpubLoXYGl+ZOPEYR6U7VJ2CBoemZY8PQIZio680PQAdqnfWxRHWW+0oPjIHpK+lDzyYXNynuhINtM6cJobN9cLCnBEiVFWIFlVFHL6biT2VGfKl9T357BWtNTOQg3Ec4pKcwpNCrgc5YvoQWkpmzaATco6ZHGqqTxVtY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(11063799006)(5023799004)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2RGZDZKdCtPa0Q3TXZPazgzeWdkdjgwbjNGUHRFQWhWckpnL29EUFhXODNp?=
 =?utf-8?B?eUNrUzl4SU1XTjFTdmRlOXIzZlpNWDB0ekcwQWtrTzdnRmc5d21CRlBDN3dT?=
 =?utf-8?B?TXBBcWpNQzRPSCt2WEg1ZWUyUitjaDJHcG5rUFgzZFhTQkt3RGRqbU9qZ2Uz?=
 =?utf-8?B?aXkvSTk2Mks0NjZqTDU3Z1RQa2FyNFB1OWlTT3JmM1J6Smw4T3VocDRtVE5U?=
 =?utf-8?B?TTg4SjBqVHI2akxDakNxdHJqMWxVYXVFNkZGeTVMNVZaK2RXT0MybFNwc1Z6?=
 =?utf-8?B?MTB6S0VaZ2tUcEN1MFArTmM2Zlc5SkdrbVMwRWd3M1JKWVp4VGd3NkhOa2hC?=
 =?utf-8?B?aStkQlBUZGlyZ1VDcU9YRi9kSXl1MEpIbkhLTUZTTEtuS3hPNG8wdkpqaHlR?=
 =?utf-8?B?b0ZBNzhvbWwzUjAxbjZnblljVWdkZVk5YmFVMkZaekZUcWFUVGhMVzMrbmIw?=
 =?utf-8?B?K3FLOHJkakV4RWlHcnZnM1NkSFMzQzdWYTVLZmEyTlkyOFhYK3VSUlRXcDB1?=
 =?utf-8?B?OTVBbDhydWFHN0pEd05rMGxCMFBnUm9zUlVnZHNieStRcWRGcDdhdHdjQmNK?=
 =?utf-8?B?Z2JUbmp0YlJtOVpLdXRJVlkwaUxOVDRwNEVKQTF0OHQ0N0N4bzU1TjJiTUE0?=
 =?utf-8?B?T2hnVE0zUVRWZ0VONk5qT2dpRUo4aVpWNWVIU29GVGNHNitHdDA4VXRMVWRv?=
 =?utf-8?B?SjR1WG9XSEtpdGxwQUkvR2lPamdkZFZ3cUhPWWZpTnRLVkJIYjNQNVozekVK?=
 =?utf-8?B?ZnNHUmdFV2ROaGZuWWJLaDM2UGxmU1A5TXFQNDNwTmZ4Y1kvTjk4bzBOUWFq?=
 =?utf-8?B?WUt1d2pmWFhIR3o3L29wM2RkNmxLQjZnSk9MaFBNK0tKeW8zTmtsdFowekxv?=
 =?utf-8?B?NTFRSU9kdGNKNjZ1enpzQ3B5YlNlZDBYTnBGaVF0SXFqajlqZFI5cTNUQkFo?=
 =?utf-8?B?eFV5SVk2YWxhVnZ1TUlRSWdhdWpKYzFxQWFMUCt4TGNhTFFBN2h4djQrNU5D?=
 =?utf-8?B?aW5DdEpRdXVnSEhrWGJPajdocDlSMVFEWmRZNmVzbEJvNjFVRitJK2tKUUM4?=
 =?utf-8?B?NGpKa2lHSmx1MVFvNkhHYXRya2h4WmxjMkF0VVRydlEvYmpFNWVUckFaVTVF?=
 =?utf-8?B?ajBTRTk3TENnTlVnaFV1Z3Bad2hQeVZLNC9BRSt2dkFSUWM0aU9NMERRVENo?=
 =?utf-8?B?TjVQQ2I3UTQxTUdwdDNkWmovNStnd0FFeDZuOTB6c04raFJLNXRPS08wUCtC?=
 =?utf-8?B?Sy92eUNtYUxwMFlMOW9IMmNJd3JGcGxVQzVGSXhCdWhYc3Erc1p3RjBEa2V2?=
 =?utf-8?B?cVJncXNuRTJqSmtrcll4L0hoZ0xhQzMvRW1IbFJGQ0xoMXFhMHpObEs3SzJZ?=
 =?utf-8?B?ZElUeUk4WTV6TE9NRktOSUIza1VnY2dlS0NlQUJJL2M3dmFXNUg3ajgxOTNX?=
 =?utf-8?B?T1VKUnRWaDcwWkxxQXJqVC84WGNtNlN1c3RvR1M2SjhONmsycVFuSWo3c2pZ?=
 =?utf-8?B?Vk9YNC9ydHlZVTRaWjZ5MFVZRk1ZcXA1ZldOMkdhWmljT1ZlTDV0U0xVQ09G?=
 =?utf-8?B?bEZFaXZpTmxvUGFtWERsSVF2MlVaU2RDMXYzMEZlemJCT1d3YXphN0VLaVcz?=
 =?utf-8?B?V1VEY0t6QmxLVm9Na28yU2dpTHlTZ08vb29WeGU1bU1BSm4yL0VDWk9KT1k5?=
 =?utf-8?B?NjVvQmxpSlBHQnpWczFFNjlqS3ZMT3RVWG9Ld0ttMGxRVXdXS2RJQWsxa0Vw?=
 =?utf-8?B?RCs2MVd2T21YQU52OTNCblhmUkRlam1STTZ6aEIxSlVxSndQdE9hWnI5R1Uw?=
 =?utf-8?B?Sy9ZS3VrTllJUjB3Z3N1YXd1aERJM2xSc2ZwTGRsLzZMeXhIMCtDcGJnQXUw?=
 =?utf-8?B?R1pHbnlNc0xVZEhlcEpzcEZUK1NzUnNNRktkdTh4R1Z0MlVyOUtqMmhmM0Zr?=
 =?utf-8?B?aThGMStCaHlDalhlbkIyU2FEN3MrUXB3a2tYYTYrRWJtcUdudkN5NHczcXlF?=
 =?utf-8?B?cXNpMURNd3laWXZ5b2plWUROd2ErcndYZ0dYQmNJVXYzdnNjZGJlZVZWQmsz?=
 =?utf-8?B?YnN1TW5VVVNTdGNkR2k3c2pSY0FsTUdHYlZWY0dFYVR1SkFJOGY0NTFwTEtE?=
 =?utf-8?B?Nmt5SlR6NjVMS3FKMnJtZWR1T3EyYWlpTGc2KzhBNVN2MWQwQlp0U2hLakhk?=
 =?utf-8?B?ZnVPWm1MakxzcjRmd2FlZ3hsbXVmQk1kMkh5aGlab1kzSzEyZmkvbDBNaHdj?=
 =?utf-8?B?bXE2a2NyNmpWMm1YcTZ1TlRMT2xaazhFUzZVYm9MakpFQjZ6bExCRmlIT0dQ?=
 =?utf-8?B?T3ZSeGdkbzh1QUhtTTI2ckljUXVNMWJvWEQ5bFRVc3RMclRTeHpUdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a67700-a703-49ea-a71e-08df17fcf73d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:25:35.8185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kV+8awTIrsFrCweHqRuK7WTiaPew0nFTvKd+u5GwWISrPB5iDDIaYbfcTyRiZmJ3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7346

On 19 Sep 2026, at 22:11, zhen.ni wrote:

> 在 2026/9/11 19:32, Lorenzo Stoakes (ARM) 写道:
>> On Fri, Sep 11, 2026 at 01:06:46PM +0200, David Hildenbrand (Arm) wrote:
>>> On 9/11/26 09:58, zhen.ni wrote:
>>>>
>>>>
>>>> 在 2026/9/9 23:54, Zi Yan 写道:
>>>>> On 9 Sep 2026, at 6:28, David Hildenbrand (Arm) wrote:
>>>>>
>>>>>>
>>>>>> Because it results in less kernel code  :)
>>>>>>
>>>>>> And less kernel code is good. Unless unavoidable.
>>>>>
>>>>> An alternative is to add BPF hooks like bpf_iter to do the filtering
>>>>> and by default, when no BPF program is attached, everything is printed.
>>>>>
>>>>>
>>>>
>>>> I’ve also thought about a similar approach—perhaps a new bpf_iter type
>>>> that could iterate over all pages by PFN. The advantage would be that
>>>> you can fully customize what you want to print and what you want to
>>>> filter. However, doing so would require refactoring the entire
>>>> page_owner, and I’m not sure whether it’s worth pursuing in this
>>>> direction.I’d also like to hear everyone’s thoughts on this.
>>>
>>> Certainly better than having more and more manual filters added to the code base.
>>
>> Agreed.
>>
>> bpf seems the ideal fit here I think?
>>
>> Means that those who want this information can get it and those who don't are
>> unaffected.
>>
>
> I have prototyped page_owner bpf_iter and confirmed it is a viable and
> valuable direction:
>
> 1.Most parameter parsing is offloaded to the existing BPF verifier,
> keeping the page_owner kernel-side logic simple.
>
> 2.Filtering and printing are delegated to the BPF program, providing
> greater flexibility and enabling more complex composite filtering.

Without attaching a BPF program, page_owner could still print to
the console, right? Otherwise, it will break existing users without a
BPF program. You could add a hook to decide where to print the results.

>
> I plan to further refine this patch series, but it will likely be
> submitted as a separate series, as it represents a different direction.
>
>
> Thanks,
> Zhen


Best Regards,
Yan, Zi
