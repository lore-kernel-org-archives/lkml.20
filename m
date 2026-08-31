Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012043.outbound.protection.outlook.com [52.101.43.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2A74A43E2;
	Mon, 31 Aug 2026 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196147; cv=fail; b=j7SH1gfW3yQlBn/9bDmHiP7yXEG/lvWphzyMIUnNMcTldsBjsYFZDxpUhQFm2XA1gpz9JmxHdciAUKzf07TgJfsjBTz6xLzLbb1vNjWbBHk+tWhkXESZ8pb0NHk/3Wf/TxZU7YU/ULY6vwxiirMvvKQocwbuact91wLpwwn061s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196147; c=relaxed/simple;
	bh=wCwL0VbvURVrD3VPVi/jMiJedLDRR3cFO5OXf6Ph+YE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EtWGjl/1bPC3OUnIlzamV9SiNKG9j+wxMPxAGMJBF6Qs5KsF4vJMicabEp1A+uOEARM6QjWD1Os/+UlQNdS1Y42b0fjgpwl8ZgULjAis1Nt+/MrBls3YglcRDAPbACt8ZwNPAPxSzZqeR2t6SNGjbLWRt8zuEZpA6ss8rDc9zR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IZ7SuFSU; arc=fail smtp.client-ip=52.101.43.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IZ7SuFSU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt+WmW2nw/4CpG80p9EXvrM/bajXTbxmh6C7nLGh1aUwBGo98xdqSH5LMuZUjR+D79BJ5xx5/krrCAw0iZLZm0uQMzmGY8RpmHr08vVIjeWokP3W+nodGH64PaU2lOC/ylQjS2eAOr5VV433RHb9pQg1+hFj9fvjcVHpOv+Og334amh3Jw16OUFvjFYDtmJ6hRk8D7EIDoqVGFJC8RHGB3HwNUNB/HzN+zatZO/lfuA4T1Hu0TLZMpCaIEujvx4iJKf112d62mzVw8pD2b1xcPrbhSItaGQLyH2f+vSUOKC4vhGKiM3c/twPJ/9gs+4Vr8qLFKCWrvVLoVb0j9asvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hjF70Ff+A0RbgolhUxiOx/4SU0/qa81iFU3mMsjLVw=;
 b=q3kNkryJw7Sl7ZKCUbz+P9+Wjd43/JAQmpN9Xs0/sx04l/oaMnoXAEIlvxg5v/mdwcnIKwpUO9WgvbivHan2k3ZWG04xbuAuXoJ7g9EQwW8U3ZisaOVPc/c+BtG+f5uGI3NDT7n5Djiwqi8g8ERcGnfpD/IHKDiZh8ro1oGulKlBUJ0nJqsyEVPYA9UuM3qBn1JSD+4PtXdoMZYAQfXQC1tXHqtrNrky3TDJk6JiJYxk7fhDNR6apnqzc8QnXdmCC15ZQA1xX+l3pDF5965ekgz3DlgxYBoWr//A8lrdzK/I0D92gZGMc9OghACuzXi4xkBhIDlpK4SXD/OMuFYHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hjF70Ff+A0RbgolhUxiOx/4SU0/qa81iFU3mMsjLVw=;
 b=IZ7SuFSUNYfXwXDRcegADWzpkc7GZikzwulW5MQc6RMALs3s/R6moHrvtk8OnLIxFghaeqXmqWBwU1zoqBJNrs2JfcRapuUrbandNhlJ+OhPBQ1YODzAM+j1YbrzcsqNVSEb3VohbIEvK1upO9FqMwzTiRaCAukYQ0KGilRRD3Nq3vuk6EUMKDoN6Xbhn/fPyk/JoIqMU4Q9XncRH/IerLLirN+8qDDFUWzZ0+rrmUEPBeQ/1KhGOYr78aOu6jzjEMFh3S1v1dCDX8AKbfoKqdBpGkoIriLheNWgMMYSH77t2qfHacYXbKENGlYG4Jhgujzqw72hlO7Qe/UllgTHvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6802.namprd12.prod.outlook.com (2603:10b6:303:20f::19)
 by IA5PR12MB999323.namprd12.prod.outlook.com (2603:10b6:208:605::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 17:09:03 +0000
Received: from MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587]) by MW4PR12MB6802.namprd12.prod.outlook.com
 ([fe80::51f4:a3d9:b44e:9587%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 17:09:03 +0000
Message-ID: <526f3609-4ffe-4cfa-ad5e-d4e833a4c737@nvidia.com>
Date: Mon, 31 Aug 2026 20:08:53 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/khugepaged: cap min_free_kbytes recommendation at 1
 GiB
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Nirmoy Das <nirmoyd@nvidia.com>,
 Dragos Tatulea <dtatulea@nvidia.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260831075635.2244437-1-noren@nvidia.com>
 <apVHXmSljK8HrIuA@tiehlicka> <apVKf8FgTG-l2EU_@gremlin>
 <784BE9B6-F891-4DFE-A4C5-D1986CE0F242@nvidia.com> <apWk0GYdNuPcE6zw@lucifer>
Content-Language: en-US
From: Nimrod Oren <noren@nvidia.com>
In-Reply-To: <apWk0GYdNuPcE6zw@lucifer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0239.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::10) To MW4PR12MB6802.namprd12.prod.outlook.com
 (2603:10b6:303:20f::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6802:EE_|IA5PR12MB999323:EE_
X-MS-Office365-Filtering-Correlation-Id: 298e92bc-a6ef-4814-6fb2-08df07828eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|6133799003|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0xsM3DKROFlRfi6XS6VCl+lmDLsKdU8mH6kUERuRDM5qhmGOD5pLv4IUwu9EqqFiEjrHaenB4J1LsN2KzWde2XwKb7xmz1U2ssGBkeATDdfoxhgo6y3t3hH+UlDwNoUiMIEMWGOK345ru6i+VKJDs/XDbkdoNap85333tZoqDPEPqefi/SmOZVTJmEwfOPZXFdFVP2qxBQRRPusUJYZ9XCxxluCles/sDU4LBkOj/Sh5xqnuSy0Tq/oz0vLLNogRpxlxCtKeVqRXsMSdtAVASKJnU27A+jvzwl9+2WB+xVu1PJONsiBMF2qx63bia2v3L+rBPznLxx6g5CMBsViQZHZCAqyZYrjahTo2iMGPhhpU7UftSFg/K5gxXk1G0wkTcZQsBSY039t+eEJYlz1hoLDCtiJt7QsPzmBerR5wy3N8nIKSGS6gwW6LNgbib4UtzScVG47ITZRMNhw2JsQbuGcjxRg6/CY7uvrGtdddYWP6CuflCDgFcL8K5xWKs6ulTcf4SH8Zp6U0GGEQ6icV9kesQk6HA/tThNbT/Oq5HlxsbfkQlCdPsoXUIkXXjWKYwnXqaQojhdVsyVrOC2PbMyFt3DHbXe3pyTMfnmfeyVGf7g+8VmCQyyg72joz6e/AHGbu4WA2NslcHCb9QPMDQBGC9QFYWYItkwXi1oyzaxw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6802.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(6133799003)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDdWVVVJdXBHblJXT3p5WTFmNjhhZWl2SFp6dXpGOHNuSDB4SXY0Z20xSHVP?=
 =?utf-8?B?Q09OamVueU1hcERmMWYyeUxmSGVYcVVHMVFuUHBoSG5ncU9vc0RzQjh5VWRD?=
 =?utf-8?B?VDhKVnBacENqWCswOU0yamo4c1VOcCtHWHdDZDZ2L0ZCTHppUUdjNnBqVG5K?=
 =?utf-8?B?Zy90aEt3LzRteHc0VXdpckRvVldVcTJ2WXJKTHB5NmJCdGhBYWZCaGpCNnBH?=
 =?utf-8?B?M1NSdjBYaVF3czU4anV1UHgwWlNKcG5NSlpnNG03Y3g2UFh3aTRGTEtVNFU0?=
 =?utf-8?B?aVlFcVlLdDQ4UW1YcWR5VW1BVlRVYzhRdWY1anRDT3Uwa0UvZWV4OXRzT003?=
 =?utf-8?B?K3R4MEc0NTd4MGROa3JyLzJWeUdaMWRQUWR4Zy9UWlBzc3QzRkJiTjFaNUJi?=
 =?utf-8?B?WFd4VittMW0vcjRFUW1zYmtvSFY3bWhhUFpaVXdkaEl2L3o4akFka3BYYXhL?=
 =?utf-8?B?cTE0dUlVQSttRGs5aURnWFFJZlZsRDBGMlExbUhMVUFBN3BBcDYzVDQvSHlN?=
 =?utf-8?B?YjdSYkYxWFFpTVhRSnBjem51d004WnRxZkVWSUNSZUV0T214ejdMOXptTVNR?=
 =?utf-8?B?dzR6aTlUQStnc2V0NVcvZ1hWTmE2clliNHZFZ2tobmxtRUJ4QmNQeHcvUWx6?=
 =?utf-8?B?elhRYjA3cWl0bGJPTWx2ZlpIQ3drUktnWlY4QkxhZDMyQktBR2hJQThLb2Q0?=
 =?utf-8?B?dG1LbUZxUW51UU1TUCsxdVBMMW44OURkRFgrcG40YnBPM2xHLzhKSFJxQ202?=
 =?utf-8?B?MDM3VTBUcmJKVHYrVXgvY2ZCQzNJeTVxdjRKbTJpL1RsaUdmdE1YcUp3RVJu?=
 =?utf-8?B?U09YVG43S05DTW9nUTJuNm56bkplc21HcUl5WUtnV25rUzNReEVQdC9CSXI0?=
 =?utf-8?B?YTdxRGs1dHZUeUN6MmVvM0lXUVcvdGRES0hiaU05NFN6MGprU2hDYnBMUVA1?=
 =?utf-8?B?bnRLc1VndXhnNk9zNjFaRkwwcTRIYm9LYkkwRlM0T2F3bGhVbDEzL08xNHM3?=
 =?utf-8?B?bngxYm5PWWpVdDNOY2c1Ym9LOW4wbnZrK2ZVN0dkTmdHMWFpbmkrdWR3b1dB?=
 =?utf-8?B?VHVBZWR4Nkl4eWFzNm9NYys5R3dpVE1IOHZOZXZVaUFEQlA4Q21ZSXZwUXll?=
 =?utf-8?B?K1hjaW1aMEZvM2ZKSEo1UGlIYm1VaEt2M1hORFBKUG5XUHBRSGR1alJzZkpy?=
 =?utf-8?B?QnZQZDlzYlJFcmhSOHVMTXJ4Q21hRGk4NVpkQ2tTMS9XZy96emYrVmNWcnE4?=
 =?utf-8?B?VTRtaTFDdVBrR2lWSHVWWWNyNnlOM0RIQitObVNVUmxRcTM1dnBLZ3RGanJw?=
 =?utf-8?B?OXB5NmNLY1JVM0hKQSsrV05FM0F4QWVSM0c5Nzh5MmNXSmVqS0hGTWQwaUZa?=
 =?utf-8?B?T01FRHl1TEYzbDBiMFljMVFCcFRZMHZ3Q0RLbkVlT1ZVREJlZXhRWUtNaUJz?=
 =?utf-8?B?Zjk0UXlDK01yYzZtOU1aSGdiK2RrcDV3YVhLMTFGSGtkeW9jWTBIaWdtSEZE?=
 =?utf-8?B?QXkwNWQwMHJHUi9tSm9lSzBDc0g2a1E5OUpJcnJ5WGxiWEFoTUt2YXVjTlln?=
 =?utf-8?B?QWFPS1VVZnFJZ0xYc1VJMGJRNmRiMTcxN3h4Z1ZneXZkbkUyRksxQmxiZ3Vm?=
 =?utf-8?B?dEhjSGh6Qld6QllhdnMzR3FVT2hRQ0szU2xWMlBqRy9RQks0SjdDd3JWWW9U?=
 =?utf-8?B?MzFIQlYxYnFtR0N6RnYxNXVueWNIL293RnQvSmNwL09nQndMejZpcUV1aXR4?=
 =?utf-8?B?dXFTdFVsSlpMYXpCZitQQlVFYUIyajl6ZHBoaXBDVmhoYUFVSjhBNHRSRnRO?=
 =?utf-8?B?MnA0UW1tbGRmSm1CcDhxSTI5MHUxbkJPdDdKQmVlNG5ObXhHaC9RUTBUQUVQ?=
 =?utf-8?B?bFBud2srdUd6RWlaVEp0a3pHMGcvZHI3N0F1UGZ5Znl3bEdTc0dIVDBJS3Nw?=
 =?utf-8?B?d1p0bzE2Mjhxc2F3dzdhcmNjT25vcUxNWmxNRmo3T0NZZW9UYVN5S1pweDNz?=
 =?utf-8?B?eDdzLzFpWFVNeGE3THBUOUo5Wk1zWFBOWEp2YVUwTFlORUN3ZHBMTVZuak9y?=
 =?utf-8?B?T1EvcDRQM08wbEVLaTczS3I1SE9DZVRDQ21rVFdZakl2MjJheGYrT3VHd1BB?=
 =?utf-8?B?T2p6STVJWHdGYkgwWWY0SERNakRnc1JCOW00ME92WklJZXllVGtuaVgvUWVa?=
 =?utf-8?B?ZmVQZ0xDUlY1RFN5aUZPZkQrdjJ3N3VGOTk0dTZKaDNWVXNLaFladktQRmpO?=
 =?utf-8?B?SHg0WVlhY01KK1J6K1JHNlN5bmViWlFwQWFZYVc5WkhoakkvS2pUem5DV1Jy?=
 =?utf-8?Q?NLtQOVkfhji0cRyKQX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298e92bc-a6ef-4814-6fb2-08df07828eab
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 17:09:03.4039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8mhKtr1mOp7WVe3RESkf/RK9OcIbLCmvgrCownLGC6MhJjBfcOfMPuAHuqLVKoTiSh8uHMZhPnF0TYDpB/qXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999323

On 31/08/2026 18:59, Lorenzo Stoakes (ARM) wrote:
> On Mon, Aug 31, 2026 at 11:00:13AM -0400, Zi Yan wrote:
>> On 31 Aug 2026, at 5:34, Lorenzo Stoakes (ARM) wrote:
>>> On Mon, Aug 31, 2026 at 11:20:30AM +0200, Michal Hocko wrote:
>>>> I would argue that the whole model of increasing min_free_kbytes for THP
>>>> is wrong. This will trigger memory reclaim sooner and make the THP
>>>> availability more likely but this was at times where we didn't have
>>>> pro-active compaction and many changes in the compaction. So is this
>>>> actually needed in general resp. only large pageblocks systems?
>>>
>>> Ohh even better :)
>>>
>>> I did find it strange that we increased accordingly.
>>>
>>> I'm more than happy to see this just die altogether if people agree that's
>>> a sensible way forward...
>>
>> It sounds reasonable to me.
>>
>> My first reaction was that THP generation might be hurt due to fewer
>> free pages. But probably the extra min_free_kbytes just moves reclaim earlier,
>> like Michal said.
>>
>> After removing this automatic min_free_kbytes bump, user can retain the old
>> behavior by setting a higher min_free_kbytes at boot time.
> 
> Nimrod - care to send a patch to just yank this min_free_kbytes change for
> thp out? :)
> 
> This solves your problem another way and is neater overall.

Absolutely :)
Thanks for the suggestion!

