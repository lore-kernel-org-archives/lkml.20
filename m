Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792436696;
	b=jkNgXEZdxHbTm0+0WGVWw5DgofLgQ+/PBsoRPIvIzW9f3tQQ8q9h5ETzhaaXsxcA0sYF
	 /wLAztmRsPKDvrXCbFloLHy4Mn1fcudoNQNtQdLjy3xRA2Okt+KO4zEygG8BUcwOFF480
	 x5ZHlWugrisorRro77QUcNl2t0qITFGWGRAaaVq9emS43AnCNnANmaUhcXG1kRHuCxDri
	 oFIOUf5oUrKgzadq/a1Yaf3f2oz69fP2Pj/XWJBz1UjMQ37vcEQKbyEoCBTDUkEQoHcMR
	 vyyMf9ukTUCQlB1bY1u9EolcgMPcfglC+PZpImJhxy6poI8FV6J1JGT4ws/oD0lZjBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792436696;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:From:
	 Subject:Cc:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=OwXkYju8Q6RlcwZxR6BWht000Jd6fsJD01BPXoy4dqQ=;
	b=BFrf8IZTW5EhEgxNB+b3LT9loJnjm4xuHA7Sfx7rBONmOFPcPXcARLpA6NiD/o068T4q
	 xwKh5v6pUAYq9K11DqS4ASuABTZT2rJ8Jek5590/nloDQdwyiGERLEzX10BRpRmFMIYlx
	 HdGTqRSjRMrIrNvoYkg80rXA7CUxDULt5IGeLs3Xjyj6PzI7V7l3H3R+2QURDX2jKqbB3
	 FRcpb/nlnZT6yAQcFiW1J+TibR7nlIeOKSWWCx02pjug5vmxuKbGQFBioweooPm2j6AS8
	 FlR9FTm5QAJLhLjFcCLKEuiCvc3E34kylLXEzQPZ//AmuVySiLIdhjgXm0dguknnX7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=poMulWY5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.1
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAC4606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AAC4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=poMulWY5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Quki4Pm/YOkNehuQnX19D1guCzjsXuIxs610kQXmro8JDecGTT5oUreB8qAtHgbZ4IZGeShQVtsAFO4N/pfmYHWW5q6PIE96cY5sMSSDr6mnpu0iYBJm7IjqHMQ/6iA0DGMp+/jVPVT7HVCMw0M+kKynPcuMGQvDW5cVkY4LnwMKkE46wMybO1JfOl9ulsZFvIMWvj99/kxmLFgVBbHQ81UNieTG2xCKxZPGwzFTo7cE/wqtYNrRhC2bRJsYtkDDdnjL/KBVcM4i3TiVWQvMgEKAm3LusJS/2Vl+MIiNT08u0IWr2SHl9e0qjpZH+9treiLJOUHfC8pYEk2k8SnX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwXkYju8Q6RlcwZxR6BWht000Jd6fsJD01BPXoy4dqQ=;
 b=DxH7Nvv921GaDyjCHn1lUTeWolUdqDxMgaTTvuYqq7NW5SgzfdBSL1BaMrQLUAP8UlCSh8ICfcb2vX+xQxToO/2I5dHlVN/hc9SlgcC7pSCfbcfT5dVk9u/Kc5kaTiF190JwKxMHgtzVq8L0Hq0SJZFHOva2eM4FOaiZCAMAdwamgu4wfVIZJIvIkzRPoSF4HQJxuU4O9aMua8PfMsLPyra4P1wzYNbTo+jkw9tsa2dLnl0VtWrfyVLSVCm9V5ub+O0kK2zA5PYAuJgSgR9+GrdyCmNJ+q8xznH0SLLYgutO3TDdiUvu0ktRqj1Mv/8EsxaAPbpTD4qia4mY0Ku5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwXkYju8Q6RlcwZxR6BWht000Jd6fsJD01BPXoy4dqQ=;
 b=poMulWY5fEGJrY0y0o/Yt79h0ISl2ly0Kr16G3LnUtWrk7jOrORMrs7IIgDPW1oppzLzBuQrOzO9HPJNsDKM1Rog8aWymrnkfVvdhFHf+FLg3EMmudx3g7rI5t0tNJGMnWaAFIuRMxw8oYBd56dZH3Dm31Ga+xvcRLuFojbX4ot+lONn/AbeyIbcVL21qqT/u6LIvAiISDTLK1hIkkHIQADhZ0BE84Iy3yDu0y9C/F3z3JbCT83/IMBOx3NtIQAHZEkBVNjII7xAy7HIotL4Lcua738LxldzoYYV4frza3kLtbiMngWNksmLWYwF4mBL6rnMHsyzA6a5U5zcIuxzwQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH1PPFF9270C127.namprd12.prod.outlook.com (2603:10b6:61f:fc00::62b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:04:46 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 19:04:46 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 15:04:45 -0400
Message-Id: <DM91RXTJ5EFF.2YQARRB6TXQIK@nvidia.com>
To: "Gregory Price (Meta)" <gourry@gourry.net>, <linux-mm@kvack.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/memory-tiers: reset demotion targets of nodes
 without memory
Cc: <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>,
 <akpm@linux-foundation.org>, <david@kernel.org>, <joshua.hahnjy@gmail.com>,
 <rakie.kim@sk.com>, <ying.huang@linux.alibaba.com>, <weixugc@google.com>,
 <aneesh.kumar@linux.ibm.com>
X-Mailer: aerc 0.22.0
References: <20261019184712.3422641-1-gourry@gourry.net>
In-Reply-To: <20261019184712.3422641-1-gourry@gourry.net>
X-ClientProxiedBy: BLAP220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::35) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH1PPFF9270C127:EE_
X-MS-Office365-Filtering-Correlation-Id: 283a8e5e-87b2-4bb5-a1a5-08df2e13d77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|7416014|22082099003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	NZA/zSO05nJ31oB6SUl3n2b+myK+1n/9tIIDN1+4EIfzxW9OT6cnvfKpfyRr19KJzxbU7x9PaD82PoyCQxeS4fSspC07ht53s7EgSHO94YF6J3h8yrznfKZzHQyPnRXrPgImJo+j/1tcA16PGPw4ggtROde7YHw5Eo56vFvH1AoQDtaSZUpGgU3k5GUvdKC86V4BQ28w9VT+ioKfWDfgjSX4KJ2yNK9G8D7Y0Y8ArfSIYCGgXaqnuQyfzyLrOYEhEBp8VJ9bpOehUcsM3MUPOL1icpGrow6NM+yhk972GIpgeP5z0LbjHikA22zqlT1dV12zwcsOiF0ULRX1ktzpMVmc0dIF1fuDN+3kBf+PsJUa2M8vmvaGRVK6YnJQP78ZghGR5r9lkX4Dpq2DoR712yWfLylPFcYtOA5004fivaaL3W3xdnFPHTfVnd7Yk4TBBbctjNykNXobOq0xJWM3zpQ1IsxphrDC8FlleUZYIhUMZ6tzDxXTjU6tIQphdt7wFIR6Tpk4A4v9Xe0MiDCg1S9Rizo9uNc59jrT0qavk+AqXPaQOuesp++9h5XjIN0zAUCNct6TtABHSf35QuafjarHuDyD9/nqLc8RNeRCESTSbjq/USTmM2v6vO/qx6Ks8jliN09HP2wSRlelLr92L/posLLX5QUzwt57A9+3ZJg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(7416014)(22082099003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blBzOS9rZEhZWmp5RFhaSjlHQ25LNCsxTWlMb2lwZ1hUSGt0dWR0YSs1K1N5?=
 =?utf-8?B?NDNTemsrR3hLS0l3dkRoNS9OL2RvOXlrU0FmL0d6all6bVE2Kytyd2dySnNV?=
 =?utf-8?B?T2hRUUpSYmN0dEZwZTdsdkw5cUp2TVlNRTFBbEhOWldkTWZrNVpzNnV3Y2hH?=
 =?utf-8?B?V0JjWXlZT0RoUTBOaSs1b20yakZNUHVVMzhQQkd0L1dTb1hZejFSaFEyTEhx?=
 =?utf-8?B?bVoxWGtJRWFON3ZQZUV1RGdhbnp6UEJCZi9IdDBCTFQ0SllnRnVOK2kwdi9S?=
 =?utf-8?B?OHpmTmZMMlRwOXVOT1VVazhMdGgyRUVZa0ZvKzhrQ3BPbkJtYVFFeHM4MW9H?=
 =?utf-8?B?NDNxZStOR051b3VvaWx5ZjErWXRqYkdCa2FZblp1eS9nZ3pKa3VqTkIzallP?=
 =?utf-8?B?TC9hZlpGdHM5bFRDcmpZYWY5RXZvMVZ1Z0lYaDZpYkVSMnNMQU9VbmZKc2Zx?=
 =?utf-8?B?SHE5WGpTVHVGSVBPcjBCMXB5UDFpVjJMUWcyMndSMnQ4anV2WVJEdDdYSm5t?=
 =?utf-8?B?M1NlS1BGSHBMR3drdHQ4WC9NOHRKVDAyQTBwRWZ5RjlyK01jODFqcEFlRDdW?=
 =?utf-8?B?MCswY0dINmt4a2YrQVB6SW1pcmhHZzdNYWVSYWVMTmRDcTdQbFFMenNtSGFO?=
 =?utf-8?B?eWJpQktzR3IwS0xBSnR6cXkyN3FUQ1pNeVk1d1ZrQTE3V3JRU2ZGbVdwMWxl?=
 =?utf-8?B?OGUrZG5aOVZvSldZS0JmMDlBNk90RDg2NldwWnZacEhIMzJhSllMclRFWWJ0?=
 =?utf-8?B?cXVhbUdOa1dtOCtyZmxJZUFpcHI4aGxtZy8rUlNOeWtycTlVVmRHb2VnaVNv?=
 =?utf-8?B?Zmk5Wk1pMkd3OUJEZW5yandHeXRWbThjS0loKzlzeGJqUm02dXh6WDRSenh3?=
 =?utf-8?B?Yyt6aXZoNXVrMzBKM290NHpiVURiRW4zQVBUak5Ua3NZUm5veVFHOEE3b3pE?=
 =?utf-8?B?ekZ3dWVWUkR3d0hoYk92UHEyL3pSN3dGbzVjaG93K1JXSy9zYkt1cUpYbCtD?=
 =?utf-8?B?QndodWZUbm9CNGJ5WlRzZFRLTk1HU2k2Qys4V0lxU2NEWi9LL3YrSkpSdUxm?=
 =?utf-8?B?bzBMSGVmcFVlc0tFWDcyRGNwZlRac21aU2pZZnNpaTZNR2k2OVhPOGNNK0Va?=
 =?utf-8?B?Z3VQU2RlYU5weVF6MFFDWmxLLzVONnBKcStKV2NBcHlZdTUxS0Rld3VsUFNh?=
 =?utf-8?B?M29jSHZsZ3BJOEpKQ1pqYXFqYXpoMXhjSnRSenRWQUNiYkVSQ0F6d0d5Ull4?=
 =?utf-8?B?L2U1VVFrKzIyOFRsL25acncyTklBQzlrOGhHS0lSNmc5OEJkWnJSSWxpWW1x?=
 =?utf-8?B?cGEycnh1UTkrQVdTTVZkYno0aThmZENROXVIQkVsbXhXaWNEWnNBUVR3VVNs?=
 =?utf-8?B?TjhHVTZwNnRleXJlS0NGSllKdWpnSCtMOUtqd1F4T2VYYVpIcXBwRXNoVFBD?=
 =?utf-8?B?ZEFTZVpHKzhkZkJReU80SitVTnhmOXBGN0lGWTdFS0Uxcy9YMFJKOGdKUzZW?=
 =?utf-8?B?NGsxM3VxY2Z0Nm52V3psSjRManYrN0UrR0E2bytnaVFjODI0RXpDZkdtRG1n?=
 =?utf-8?B?dnV6NjJKeTRlK3Jwbm1yQU4zajdDNUZBbGVyMGc0RWtnOXVUQmlSSHZrV2V6?=
 =?utf-8?B?K3NiWHlXNUovdXQ4cEluT09GU3lXRmVtOUREQ0FocnhRVWhubDJ3bFVCVXhS?=
 =?utf-8?B?dlpOcWg3NkZRNHQwb01zcTJwNEEveTNIZit0Zm1PN3ZtSm41SnJvSjVGdno3?=
 =?utf-8?B?S0FBVnZRM2V6ZWl1NnlrTVhDWS9jbnJTWXNwNWZIZEJtU2E0Q1VKRllyZFd6?=
 =?utf-8?B?bnBPZUNkS3U5QXJ3TVIvNnFUR2dscmZHRjZCbXg0ZHZQMGxnbjZrL29SQ21Q?=
 =?utf-8?B?bDZaUUNydzMvcTUwaWVGbHBmTHBqSGE2Z2xtZDAySXNWaERtMHQ3S3Z1ak01?=
 =?utf-8?B?UHl0T2dXRWFVeDFUeFBuN1lOYWNQVW5ha0x3TzVmOXFYeWRrMnFubnlQNk9S?=
 =?utf-8?B?WVhETS8vYkpja09uWDFTRGNZVHJQRHJrelovVTlsdVZJdXc3cXBLSTRmN3ZZ?=
 =?utf-8?B?TWVUUzQ3YWE1cmxCM3FmOEQvWiswb1BRZVo4Mjk3VTFqRmE2bkxLWURiTnQ4?=
 =?utf-8?B?VmpXbzBoTlE2L2pZcnhnRlRmeFRORHdoR0s3TmVZeUpLQjM0RWJKQzJoeU1P?=
 =?utf-8?B?aU9QdWpqUE1sb0ZBQXhJdFFTK1g5d2M1aXJvRGVuQ2Y3VzdXdlVQS0N6eFNR?=
 =?utf-8?B?cHNORGNhQ2J2aHlrSmQ1Y3NySEpuMnlrR1lKWVpHTlFOUy9GOVR2L3cvUlJm?=
 =?utf-8?Q?5yuoHU5ufxo/Vsk5E0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 283a8e5e-87b2-4bb5-a1a5-08df2e13d77f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:04:46.6382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aZfMHTX/vJ9dwHINNjbE46Aeq4rQ0K4X9G1Rxxp5Em3mO4aTJlMTXfc/gwg1uMIL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFF9270C127

On Mon Oct 19, 2026 at 2:47 PM EDT, Gregory Price (Meta) wrote:
> When a node loses its last memory, offline_pages() clears N_MEMORY
> before the memory-tier callback rebuilds the demotion targets.
> disable_all_demotion_targets() resets only N_MEMORY nodes, so the node
> keeps its old node_demotion[] entry while it has no memory. Before
> 6c542ab75714, the reset covered every online node.

establish_demotion_targets() uses for_each_node_state(node, N_MEMORY),
because the to-be-online node is already added into N_MEMORY?

>
> A reclaimer reads the stale entry only between the node regaining memory
> and its targets being rebuilt, and it filters the entry against the
> current allowed targets, so there is no user-visible effect. To see it,
> online and then offline a node's only DIMM: a debugger still finds the
> lower-tier node in node_demotion[nid].preferred.
>
> Reset the targets of every node.
>
> Fixes: 6c542ab75714 ("mm/demotion: build demotion targets based on explic=
it memory tiers")
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> ---
>  mm/memory-tiers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
> index 25e121851b586..7197f1a67a340 100644
> --- a/mm/memory-tiers.c
> +++ b/mm/memory-tiers.c
> @@ -378,7 +378,7 @@ static void disable_all_demotion_targets(void)
>  	struct memory_tier *memtier;
>  	int node;
> =20
> -	for_each_node_state(node, N_MEMORY) {
> +	for_each_node(node) {

I think the above code deserves a comment explaining why for_each_node()
is needed instead of for_each_node_state(N_MEMORY), because when a node
is added or removed during memory hotadd or hotremove matters here.

>  		node_demotion[node].preferred =3D NODE_MASK_NONE;
>  		/*
>  		 * We are holding memory_tier_lock, it is safe


--=20
Best Regards,
Yan, Zi

