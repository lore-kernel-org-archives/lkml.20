Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.80
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794193131;
	b=i7Yjx824wCvz3VvG95xTDyPuttv49nCJP2ZELoXFZJ1zkAXsvsE2j+8TzMahsfRdCwNF
	 q1/NMBLmVIZS4pqq24hqoXsvX4NbUHXhz/cHoHGjPluV0wf14C2rvWa9bO5kWwLq1EaV1
	 zXg/6rbREnzwGVz319syybxW61NxDVGdfyBSsmyoMm8hpo96Mrw7EH4DkwDF9Y2dl1/kr
	 dXPbrmrpCyqhv+WzMLevy55wlXG4s9w5fLD9vU7c4znputeFDkJxx3q8E5TAtEmBU1d87
	 EtD6SsE1Tz1umSoS7ZSWku8un0LljgQXlrnDLNk+68WVFG2LyesaIF5njqk1mhAzdSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794193131;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Vwex8GKAAhQ1Zb1/glbBsz2ZpWDu1Yavm3d7ZnbfqGE=;
	b=q4jSvxdxtvwCRAjZdH7DFhVBVgpBqNkkXso4CKJgoK8vOREjrtN3HQ/1ddAzB+YWpF7r
	 UohRUp+QbwZ/as9em0DeqyhZRJpjTWpDhdxhNa7wJvVp4x8//NB+Qy9BAv1IapUMlfScZ
	 azdUnBxOts5pFreexnBmVPNIzC4X9oQNbp532RYD/uleb5h80EXipEQ1evvO3a7q1+FfU
	 h7gD8NUG6hBB84URQpT83+d3OZA+1wHvNFA7RR+pFu8x80ZIzTBZjem+jOOIe0k+t7A0H
	 31trAPDIipVWZLrmVyYxU3EH8LM19ot+DfxgUqQH05TleI5oYrzgqxFzuNhZi4hrI7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=efficios.com;
	spf=pass smtp.mailfrom=efficios.com;
	dkim=pass header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b="Bu/Vgzrw";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.193.80
Received: from YT6PR01CU002.outbound.protection.outlook.com (mail-canadacentralazon11022080.outbound.protection.outlook.com [40.107.193.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B95606A320
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B95606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=selector1 header.b=Bu/Vgzrw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jghFEftxux9evbr/M4lxMFJNXaqCilc3Qmf1QQLKpTBMglxL8b7WnDEAKvEv5yroYuh92C74j+YYAetG4guCsQpmhkdyN+/wU2nknvZhkLjZs6UejTxskQv2BY1a5HXBWSwwR+TkxbnTs0W8orIxb1ncdzcXMbRv3uCQq+AoClWZpNIqbYHq4qbWP/zAgQYUklg3LTCkzWHydCd3Ze34L57n9tea4Soagx9oJu363PECOmZuqquZdrPG/dDZwQR1v0nwyuCFilAIdVffH6OEN+0WfeaaLyiv4sIdHBmwMGPC3C3TaAuAoAHGHTy4T7Fplt7OOWqt61zlnb38qqkuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vwex8GKAAhQ1Zb1/glbBsz2ZpWDu1Yavm3d7ZnbfqGE=;
 b=SpyEzV4IVQomOd8n3eq1GZPTuTqgSAOZ+X/82w0e9sVfE7lprb8I6c+rhTQqoTKmX88293GsE6O3Ozv1qwG4wcZxOQK8TpeZaLsSELW2z92YZb03YkHVXNc+ziAEemkzV6+egWhc+U7hOnx6V/CV7CaPWjqxeB6+5Dbl14ZeRKITM2Dj+9+MwHnHrMV5OWVAemrXGvTujRffze01M2n3XhTMTrP1xCB4JagjOVI/Ir/zQ9PHxn+tLuxKAjEJBC3zn/Hfqc/4FkndCiU0oQuviifdNI0yCpfOkxMj2ya0Nz3J095MqJZ9PoRYrrk7zCxDyU1PGgPE7ws9nTpZ/HpcpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=efficios.com; dmarc=pass action=none header.from=efficios.com;
 dkim=pass header.d=efficios.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vwex8GKAAhQ1Zb1/glbBsz2ZpWDu1Yavm3d7ZnbfqGE=;
 b=Bu/VgzrwoRAJoZo6NonJn71mf5GVL8YuIVfSkzXgTHvKxd6KZ5bKa2FeFi15VrJASGHtjurwszthImqnPnBD/ROGwpPxplRdl6tGa0lzGHazBOoXSyrqoGQPtU87iVdgCw6HafzMxfY90xwj/dwKsQzblTKbGA56KJc1CgaxWY2l02Q791wc9O4H/wodtH0AEmV2KJU3IRXT9GMOsWu2H8C7uAdNqhtn7w2LYkLg3BGS1Q+2p4houokzNEq4sFUiulSNL3+wknderC+1jkkfQY6fUQzVT/F8T5r7vLHKFy2jQJw0dWCfGyEXtM7cp8LRuOpWWHgHnyM8Xu9dcqZk3g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=efficios.com;
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10) by YQ1PR01MB376387.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:c8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 02:58:49 +0000
Received: from YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc]) by YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6b9e:a901:67c5:7ddc%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 02:58:49 +0000
Message-ID: <db323b83-60ae-41d7-bdd1-03ef4e789061@efficios.com>
Date: Sun, 8 Nov 2026 21:58:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/29] sched/deadline: Move a task's bandwidth when it
 must leave its CPU
To: sashiko-reviews@lists.linux.dev
Cc: linux-rt-devel@lists.linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, linux-kernel@vger.kernel.org
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-24-mathieu.desnoyers@efficios.com>
 <sashiko-outbox-203989@kernel.org>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-203989@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0037.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::14) To YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:1d0::10)
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
X-MS-TrafficTypeDiagnostic: YT6PR01MB491026:EE_|YQ1PR01MB376387:EE_
X-MS-Office365-Filtering-Correlation-Id: 07baebea-0f0f-46f8-13f8-08df3e0d6114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|4143699003|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LMbmgffzq3asQb3ZrpP//HQPa+3WcZ+U4/CzBzjD9CHXGk2w4arDrIwC9pFJs2/ptIDiltw4DhTjTXgQySxGHCnVvsX3lj+K6ho1z0ZEEkPwtKXbE1G3tz9wH/8n7tKy2j8IRI5XKz+CwrHfDY5O4kQxcnlQ7L4en4OiZmMiih6HKUE2E5WGq/+trrZT9zu3287R8HNbLsvm/1s/Mh83IcdpHYVuj/OOGcBpP7CAs64sObnwJVdU6eL8mMHuRJy28CqlpC9Cko19xaZ1MjVeYT0drRfkYS46qR0Hmx1+RwbUbJUYwP/k2h7hIVAcQJSfglC5U/SjiLahRu5vRhmXhDGYuCoLDu7L/+u4imvq9kCO3cv+z7wXTenVEHmaEzZqzXBiatUqG+UnNkU9SgEfx2g3XfVxA1rIEXfUm/PfNxb/oeNu2KdN/C30vixPQEaZszNsNTUg2k2E9CfPk0jfafjXg0k9VwoUkg5HerkW9iH4HqdpoqAsqtYgwUzQXz7ZqkjvQBxOQRi6tL8F5Cq6ZhHeQMVnTh/TAjDauuVFu5Lnoc4UjzK3uTVl6+Xlf9EcheAWuNvmZBa/dqS03EcECKyzg7IqYdJDOCI6z8O2Rpc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(4143699003)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SldaVzJFdEdoTjFyWmJ1YkY1VmRDRXZzdUJEbUo0V0ZRUG5ueGtHUmpzNkRN?=
 =?utf-8?B?YnJ1SFIrdkpDZUd5eVZacmlCOEpDWkF1NWI3bll5TU5PeXVnaWNkd0x6V0x5?=
 =?utf-8?B?YkJEMitJVXlCVjNZU1pqcnZHK1ljcjdwODYyOHBteUZkaVQ3VlVzRzBucFBp?=
 =?utf-8?B?SjVIbTlEOEVkSmlIRndtaTJhWjEzRGJNV0wrdHE2Z1gyZzNhTk04Q3lSdHBN?=
 =?utf-8?B?QlBYVkZMWjVRNGdVR1VGM0wwYmZ4SVlIY3FzTHlYcDRhKzc1Y25xQkJHalZJ?=
 =?utf-8?B?NXp0WXFybGUvcVdmT1kwNEZNeStWeEJFRy8xSHlQYjlPTUJuM2l0aThXOXgz?=
 =?utf-8?B?OTgxS3F3N0tnWnQwc1E4QU1SOEttKzZiZjU4czVmVEFIbWZPYW1ZeGx6K05X?=
 =?utf-8?B?S2IwWU1Ka0RBSXBycWtTRkZjZEl2bldnUmlvRnU1Ylp2cENIS1hEa1FPSUtG?=
 =?utf-8?B?TVJlSnJsYnR4QzNDM3JZWFpzbnhZczd3czZ6NFF1RTZZTTU3ZnlaUWNwVkJQ?=
 =?utf-8?B?cHQ3bEtQdmxhQ1R3YTFDaThKWmZTZXBWYndIaWZYekZlSnJyS01ZeTN5eHg0?=
 =?utf-8?B?V3IwaGM3TEkwWUloNXZONC9mdTJLVVcwMDMrN1N1UlhZOFkyQUM3SWdrdkND?=
 =?utf-8?B?Nkhya1k4MDJOdTFQMWhZbE16WXo0RVNzNFBJMTN0cGI1b1plOHFZc3BGSCta?=
 =?utf-8?B?QWFsbnU0VjdnRlZrNkVuOXJMWitPN29KWmJKcXpVSmRjR0wzT0kxOHpqdWFZ?=
 =?utf-8?B?dVd5RmQ1SDdlNDVSeDJJMGRLZjNhVHZubmVweXV2SUh2c3BZcjRibUVlbFJH?=
 =?utf-8?B?ejViQytaRFIvenRUWGQ2RmlSejNERFBGWFdPaTA5ZEZjcjJ5NllaV2hmUWla?=
 =?utf-8?B?ZldmZUNVNTd0cEIrSWZEMlRvaGFLeG9yekRRdlllamZab0tyVjlLdzlVRUt1?=
 =?utf-8?B?c0dvSmlJd3BxazI1SHV0Snh2WXRIU002MkFsZ3NPT1BkeG94Y1hrY3RQRVZ3?=
 =?utf-8?B?d0lydTZ0dXRERlN0SFNrY3gzc0UwdzFabURON0JrOHhXR1podloxUTBwZEx1?=
 =?utf-8?B?VERDMnBZM09hb05DaFhaWW9nckJpdXpmclhBckR2MEN2aFJSYzVwNWZoZ1cy?=
 =?utf-8?B?WVJ4TzM2bWMrUlBBR0xKaWxpc05uNldYSEowcitkTTVjQ01FYVVKenNad1Bk?=
 =?utf-8?B?TlNyZFVzZE03Z001RzNWNm1YMEFWS2EyeXA3a0xEQlN5enVTVEE3Z0d5emJM?=
 =?utf-8?B?WVNkdEZGNEVBQTdSL0owQ2loYTRrS3EvbWE1N1lJRnJQQ2N2MzZSZVBkN09q?=
 =?utf-8?B?U3hSdGVST2VuTFRwa2d5T2FRUGlBWFlVbGxiU2pYWHArUVdvcFZkZWhvRXNX?=
 =?utf-8?B?V0VVTEU2Z1lRVngrMnhMQlRPUEo2dkdTZmN1cFJ1alVSZjhGQ2ZaMStiNkVB?=
 =?utf-8?B?Z2YxbGlScFZPVlFTQ2ZLejRuVTlQUThLTlpKRXFOZlROZnNsc05BZUFMbDNl?=
 =?utf-8?B?MDlPb0ZWUW12aDFBVkhnUlFRbmNuVUpiaGNyem9KZWpsSFRTcHZwUXpqOUlL?=
 =?utf-8?B?dVdWRGVtRGNEd2F4bU5CRlVnQmpXQzdaN2lQSUJMNWYzcEFaamRDbUtnR05y?=
 =?utf-8?B?Znl1MlRKUjQ5VnA0UUorcVNuRjU1Zm4xNEhpZldBMkhNLzd1bmpvZ3BRNzFM?=
 =?utf-8?B?eVlqVU1hbEQzMnJlS1B4ZVBDQzU3M3N4VHhhUlVCdmx1K2pYNUtJMlJyL080?=
 =?utf-8?B?QkhPUVFycHNLM0JaTm95NUpmbzdzNmRHOVNNTzB5SmpGa0NheU11L2NxNmlj?=
 =?utf-8?B?cXdIbFJlMU1xdGZDTm9VSENHQVRsSEZCSHp2VWNraDhVZWZtakVaUXAwWitx?=
 =?utf-8?B?cXRoV0ZrOFFyT01qTGdQU2JPU0JaZ0ZqVlpxMW00eHJGaWMvdHFiZVowV2Jh?=
 =?utf-8?B?MEtIaXh2dUdhVVBDUEhNaWZXdURCMXpycDlUUklJM0I5N05PZlZrTlN6YnIz?=
 =?utf-8?B?UndFQUlHRE5zdHFLOW8ydDA4dVBaTGxnc0t3M0NsWHROVHY0OXFoSkx3MmZm?=
 =?utf-8?B?enNrOGNybnAraGlwNU9mK3hvU0d2MmZHS0sybWlEalFpcG5PSmQrcnJoN0x6?=
 =?utf-8?B?TWsrb0RpaHNNYmpUemF0K1hzNHlzblJ4eTYwNyt2RVk4VzE2cVppVmtwai8x?=
 =?utf-8?B?WUY4S3g1N1Z6YlRiNWJ2RWZRUkUyOTRIYlpUaG0xOHdpRHd0OEZFZzQzNkJh?=
 =?utf-8?B?WFpVMGhhL25FZWhwREtlb3ViSTR4eG45YUhJM1dYM2hmUFFNU1k1THdjdjli?=
 =?utf-8?B?UFcrQ1JPZElzbE5Vbk1qTGFKcGw4Q1JIQVA4UHNQWkFzeHZFSVp6R25LNWcv?=
 =?utf-8?Q?Ca4t7gm3KKHtRcwUUazF01Wgbx7ZTva0Jv2rvSG/bG8+V?=
X-MS-Exchange-AntiSpam-MessageData-1: 3U/QgDc/LKjeLwAvPLcfX6gMtZ85l6J734o=
X-OriginatorOrg: efficios.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07baebea-0f0f-46f8-13f8-08df3e0d6114
X-MS-Exchange-CrossTenant-AuthSource: YT6PR01MB491026.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 02:58:49.4710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f278736-4ab6-415c-957e-1f55336bd31e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VX0YJzPAvTGYq01Ovatx3yyxIY/69VgHiT7gAOZ+ZRf1LIrdNOQ8uhS7Mj5OMhIl0c0f8QAttO50ByfLTVMZk5RoeWklDLx58rYkvowkl54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQ1PR01MB376387

On 2026-11-08 14:41, sashiko-bot@kernel.org wrote:
 > stale dl_bw_cpu on same-rd return in dl_task_move_bw()

Thanks. The record can name a CPU the task no longer runs on. That
matters only for a task that departs before the rebuild. The rebuild
recounts a task in the class on the CPU it is on. A departed task whose
recorded CPU is inactive loses its bandwidth until its 0-lag time. The
comment above dl_departed_list says so. The release from def_root_domain
happens only between the detach and dl_clear_root_domains(), in the same
rebuild, which clears it. Still, the next version records the CPU a task
departs from, which covers this case.

 > missed bw move in migrate_task_rq_dl() on task wakeup

Thanks, both shapes are real. The test should not ask whether the task
leaves an allowed CPU. It should ask whether the new CPU's root domain
counts the bandwidth. The next version compares the root domain of the
recorded CPU with the new CPU's, in migrate_task_rq_dl(). It does the
same check in task_woken_dl(), for a wakeup with no migration. The same
state also comes up with admission control on. A task is moved asleep
into a cpuset of an isolated CPU. Then cpuset.cpus gets back the CPU the
task sleeps on. Two new cases, hotplug_fallback_in_mask and
mask_back_asleep, fail on v5 and pass with the fix.

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com
