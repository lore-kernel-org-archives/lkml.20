Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0686D25E469
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788575235; cv=fail; b=sLUvMZutzVPNXwIRlhRA399+20o0K+BI6L832xZKvQu373qimus4FXT4yBipiKoQ1vOspjXCbzhHm3jEDZ5M22zkj9Gpfw8rirSacU/SrQSozQ7BIKrXWnTGoQ864z7PlsdSzltdaaTS0xaU67X/kxMM1UKRmOIdTKhIqJ+vGDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788575235; c=relaxed/simple;
	bh=d7RGvCkwQQt7Dfb8Z2PQkeVGrN0RPII/BPlrrsZvNFs=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To:MIME-Version; b=iOrsNLeZ58IQCGzBLq7yCiE3Je4V2lTn1WVI9QCV5AAy8WRUvYJV6a/Of/gdYBGwXW98ttVjDe++pBnjZk3v639CfGg0mMVYeXpz0MujPfWiHN/NB/h7ZhUAw4l0P1I2YiP8AsUp5wAVRkULvG339C+6mxldO+0oMkeR6LWenSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Th+n8yxf; arc=fail smtp.client-ip=52.101.56.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Th+n8yxf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYEi7aBH6bHWst9Ax2wtTWXxyZLyd814lBKiIDd5bm6kDq/VNHvM1NycZsleAWW0O4JKvM6KhNf8XZgPndi5nkZCeo7+7F0kt75OEd50s0TWhiEXCb356ZkW4FU6KQQ6iY/qJ1shVVyMkpKQTMMerSRMmX7wAflxzDyK8fn3kpjqC250ezM0cRrI25Gx1hg15+ko/EqsRhe/tPyCLNfKkJXAwRH5Ng/XF9yD1AiZgV0x+rZHDaxxiNmDbp1Q7MbI4JBctp3YDblJNsK6Oe2Iyg8eRUtKbjFtfc+LOgYPkqgv5LuTBKT3Cv5WApzkl5ij8zh+/F9hkrFLY6PAdTdNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltSX/1VZ/j/SmVJ9oeCVKGZIRlIM7j0Jzz+gGewcNts=;
 b=mdnHZdGlSWsxR7jv5ElNk0V4t2ttJd2eTP/NVX612AvJtdwq1Bn30pzoGETJW7x8WO77tRVxR7G6MIIT09qWFsI41ENaDqD3GzNRzLpBqka9nftb13qsVYyaadzacDQbte/YBQh1FIyP8phtOBJzrHcK1262ILlzPeBjI7wYnljUxsT2/5YSSxo2/AtQgsuhdhPQKxL5wdnpTq94XsaOe9XtILhHjFeCALP++SqIWKHeVwA7yOG94BSGclhckV46FuDV2XXBJ/i62W5kXPgMx8omqnHNCFZsQmOwhGfNg5tmBHuLCO61wOwL+3CEazV3pq313jIqWo0gAQdh33noTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltSX/1VZ/j/SmVJ9oeCVKGZIRlIM7j0Jzz+gGewcNts=;
 b=Th+n8yxfZZ42d3ixQCbwEDOnxECkvDj6Aj1BXDQwOWFBEPyuI5u5S26syFF4H1UQcDVsCq2y2BO4uYLjMoTZIEhPdRlvxh0ahJtuZ1NEUhmZ3Hua+4Bnyl8fQV21O78DgrtUr/3aDi4ATqghBPzveEh/cfx5gjUV+8/9bSfemwJEDu3f88e9T6GU3ja3nOmQK5onwMiMCk/9mXzy0J26nd9tpp7uBwJZJnaJiQ9TYoVLdLM1m82RENeLBvul22OumTQPZuquyLdDJXMselznAeoFM+48fMv8xRlt6Aurz+z68KQn4PA8lgh1ZHwESa60yLt8vACm9cd2HOlhqdZ1rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB9021.namprd12.prod.outlook.com (2603:10b6:610:173::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sat, 5 Sep
 2026 02:25:55 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%5]) with mapi id 15.21.0360.008; Sat, 5 Sep 2026
 02:25:55 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Sep 2026 22:25:54 -0400
Message-Id: <DL70Z6ZM3ORM.104CN64UDYXPL@nvidia.com>
Cc: <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
 <kernel-team@meta.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <liam@infradead.org>, "Nico Pache"
 <nico.pache@linux.dev>, "Ryan Roberts" <ryan.roberts@arm.com>, "Dev Jain"
 <dev.jain@arm.com>, "Barry Song" <baohua@kernel.org>, "Lance Yang"
 <lance.yang@linux.dev>, "Usama Arif" <usama.arif@linux.dev>, "Vlastimil
 Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, "Kiryl
 Shutsemau (Meta)" <kas@kernel.org>
To: "Kiryl Shutsemau" <kirill@shutemov.name>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Hildenbrand" <david@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH 02/12] mm/khugepaged: count collapses where khugepaged
 makes them
X-Mailer: aerc 0.22.0
References: <cover.1788533997.git.kas@kernel.org>
 <ef229484e454d804ffbdbf8ae87798919594fd1b.1788533997.git.kas@kernel.org>
In-Reply-To: <ef229484e454d804ffbdbf8ae87798919594fd1b.1788533997.git.kas@kernel.org>
X-ClientProxiedBy: IA4P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:559::16) To IA0PR12MB8374.namprd12.prod.outlook.com
 (2603:10b6:208:40e::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB9021:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f4ef662-3918-4e35-449c-08df0af503a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|18002099003|10067099003|56012099006|4143699003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	sifjDydtBLI/TqTTxAfUu1DWEhMhE6kKgKj//+oKdQnxiPHTty1hY6f/sImOEXLo+hFd/vp/cbEmqU45Xh5ilANmH1N8Am6hffpMKgZ05VOx0u/PhJBTyueAtOL0Obyg/gn7lTcduaT803XOjJOBdNJDdIIX87FyZzoIAHA7XNB0GOWeks1ahddpkEZjTB7tfSJ5AwkrgKdmJJpdglMVVogmYe3YHxGh7JfYWV2gj4a8fgbo7plYGoK9yNEpjvM5uhO+FnVkzERgLtnuu42YTkX1skVcoT40AY1mPtHDJN7/Tn5LVh65Jm3Hceg1qh2NdHiupAa+yX3cFNI40lHnI23eWRlXU+BZ0YBTcV4bS27dh/BbvZ1nC62DM/+Sj45eGZC32j80Qw7Zo159d61lXVrCTDZP9iGgSFOUoR2YvIIMyDgqbhwDE6j4tjSV9f8Qk1iWnLUPu8i9LFP1jn/+eu1WZuQS3P3Ck9Kbkime1ky8Hn6fM7e1tgG+6dIOeeaw+/9jzGokwSogHOfuF7Q8ZGpifC9PB5te9f9U08/oX73zgbxmloU2kt7B0vBF6XF9hyQkgS2sOG0aYlSwtuYnL1T6CiJJay+tSGToHWJZM9JzbCmsNpTj53zSce3Vq0ZlULNO4kEFzxRmCnRjM2u1wp8YmPCah4umWvcubIzuhuw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(18002099003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXloWWdEbm9vWFRKUitEcEw5N0wzQzAycklZb2RYY2ZjZGE0VmkwcDM1eHVI?=
 =?utf-8?B?dUhUMEQ1Q2ZXUFdDT214VUk3STBCQ3hIY1FBdm9ZVmJUVmxvK2h3VDZjSi8v?=
 =?utf-8?B?azZ4ZzMxQ0RrRjVPeTk5NHF5ZjBPUWJBdWFLUWhNM2ZBRFBiazNXaW1nMUxr?=
 =?utf-8?B?TWluSC92b0pKZGg4QlhDbzlLdVB0OHYxUHloNzE3Nlpid0IvcURSYjBRa3Uz?=
 =?utf-8?B?Y2xiQ3U4WGdGdVhQVjNPcTM5eVdjdkZMVFg4SzlMdXFBZEJJdUFBWmhkSTRL?=
 =?utf-8?B?T1IwS1lxejlHMkJMcHZOVGxvWjFMcmNYTXN6REZ6SWNKTXdaN3Q4bjVSby9W?=
 =?utf-8?B?N29ybnhadDlFMkZTNWZENkE5UUpJbDBZZGl5eVFWSy9PT3lwQWVZaUtIbklt?=
 =?utf-8?B?cVBjMGRwWXRRemUrbEQzOHREQURtVVBhT3QxSVFIeEJRSXN3WGo4Z0FZd1lt?=
 =?utf-8?B?eVJ4V1A1ZEg1VE9DOFNLSnpSaEJldlR2Y0JsenQ0VmZCa2JxYSsxcTYxalR3?=
 =?utf-8?B?UkdOSXdLa1VJTnRZeDRFSEN5ZkNaZkIwUUJNSERtei95T3lsZEk0TnAwV3Zj?=
 =?utf-8?B?NWQxa0lmV3NnbGRmbFRBY2dWeUh0ZnJ6YkwzWDl0Z3V5TTJmblIrRzJPQnJo?=
 =?utf-8?B?QWZTdVdYU2dtazc2REg3U09jUFJTdStoZDBPR2dSaEVqQU9qVmpGWE5pTGp5?=
 =?utf-8?B?T1pCZFhWdEtPRDNHeStBTUdPMzZkMWRuYkc4NzE2WW1xVEdFdTBSRHB0Tk9I?=
 =?utf-8?B?SnBuZHZER2RTbTIrQWhZM1J6amgrRU1nakMzM0YwR1ZhT3FmRzhuMDFCUFN6?=
 =?utf-8?B?QTZUSjNkT2U5V1Bxd3Y1UTQzWmhrTjBEMFFETHNlN0p2SmR3clhnMFJ5d3FP?=
 =?utf-8?B?NWVpem9KSDA5eHplWTlIckhCRDR5dnNoZHB3SjhCU2d6bEVFSW9CZzJMemZB?=
 =?utf-8?B?OUo4cEFONmtsTDZaUEMzRU4ycHlaREFmdjdMMGdla2JpQVlYWUtWclM4SzNl?=
 =?utf-8?B?K2QzWWV3RFBuZTBpNTliYTdzTnlWZ3k3cDRtakI5dUVoSlBROGRwZmNYV3hV?=
 =?utf-8?B?MkhRdW9WbG9qL1l0T0hrNlVWYXpuekoyWWd0YnhpQUdHakQ1anJkMjQyVEw0?=
 =?utf-8?B?eWFUc0VKMmlzSlJkTkNwVy81SlR2bWVxZzU3MG1tRWI1Z1BCM2xIM01zOWtY?=
 =?utf-8?B?Y0s1VTcxU3JYMTZQZ2taRDg4M1JCZzJCamdNdGRHRlJEQlMwNk1OdUZHUHBV?=
 =?utf-8?B?SXpQUktLd08zdGFmVWJQRGFYaW9JR0Z0ZFI2SjREYWR5NDBtS09PN3F3V3E4?=
 =?utf-8?B?T0lRek01U1kyYjQrZFhnM1BENk9EWXRPa2hhR2NDdmp3ZzdrSDN4bDNYZWZl?=
 =?utf-8?B?ektyUTdEdzh6WTh0VnRPNWFtZmFQVE1YOFRDVXEzclNobGVpdHF2RkE4QlYy?=
 =?utf-8?B?Q0p0L1FJNVVYZU9SSDRjemtzQWorSHRFV2NtYWtma1hDY2FCbW5sc1lVc0NS?=
 =?utf-8?B?aDBTdTJjZ0tibGNVa0UwUmFuYVh2R2Z0TndpeW1BRFArdlZVZE8rTmw3MWs0?=
 =?utf-8?B?ZjBjMzEzODV4TkYwdkNNaEhpcTdJandYR3kxOXJWTlpzMjdma2FaYlpySXB3?=
 =?utf-8?B?UkwwTWhKeE5PUWFZR2Jzc2tFc3g3NmdwaW9XS0gwMEFmcnlsQjljMXFCd3dn?=
 =?utf-8?B?YlhmWXFzNHVoUUVsZGV5a2dGOFowTWtVdzJnZXEvdUsvWVNrZFErNjgwK0xG?=
 =?utf-8?B?azEzSXVNbTdhblF6TmZVdVozc3ZId0JyRDJxcHVQOU1QWjRLeHY3ZFYzMzJH?=
 =?utf-8?B?dGhYQnJkVlNpNWZKUHNiUTBhcGFkckZZNjVyRFlTYUNsU21adlduWEdrZXhn?=
 =?utf-8?B?MnlMZU40eWVwc1ZGNDB3WmZyeTMzM1dwU2Z3RytYZXA1RDZQRkNmVEhsSE43?=
 =?utf-8?B?ZENXVjRNSlU1NEwrcHVnVEhVRjJ0YzZOb0U0dHdaR05XMFJ1OFRNNVk3QWtk?=
 =?utf-8?B?aWsyTnJOQjU5OVp0Z1QxZnJiSXFiVEJkelJEMjFweGI1V0trZGdnUC9sKys3?=
 =?utf-8?B?OW5RQjJHTmFtMHpZRmZVaVJsSDVMZ3ZMTHhXdTJnb1BFY2tUOC9wWTZ5Myth?=
 =?utf-8?B?R0NjMDBXQjBKWVhsKzR4bldscll6V29uRi9kbi9YMk9GSU1BSFIvem4yc2Jw?=
 =?utf-8?B?dVQrZkx0V2F5VTVseFpha1dHR21KeTVBM2l0RG5Rbnh0dGdOMUZyQXlEN1hX?=
 =?utf-8?B?MUtWM2h3aFFMVXJUUTA0WnNvcmlJQlAvdGY0QmpMdCs0eVM1aHVWbW9IREhS?=
 =?utf-8?Q?eRWReDuGAGxwpBiOV0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f4ef662-3918-4e35-449c-08df0af503a5
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2026 02:25:55.5508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Ec81rCxBmjC0iIr7WqlE0F9fQ3Ta+STWzCI8n2/6fl9BYPPqOBjy2GeyuXJE4bG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9021

On Fri Sep 4, 2026 at 11:10 AM EDT, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
>
> collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, an=
d
> tests cc->is_khugepaged to know whether it should: the counter belongs to
> the daemon, and MADV_COLLAPSE must not touch it.
>
> The daemon sees every result of every collapse it asks for, so it can kee=
p
> its own counter without the shared path testing who called.
>
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>  mm/khugepaged.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

