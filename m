Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794867030;
	b=z28jrE6u+rix8UWftmMucLQlKLvW52SO8DJySG2cksP8olBNBEZqbrav0oVVbmSjlsQc
	 pnCqjkMyswOumBhh5QN5ImUcFTvsRH/AnSzgUmunVyhlIBm7LtroY59Y6YJ+R5M5irE+8
	 BPNmNZsbxi8cwocPC38E9bSIn7BTP8FPG2cLGRWcs2KD3yE+CrnnoohRU3CNvq+96Lm+a
	 vVdZyQzk8ArK1dDZRi26kngiRblAjpDlR38g6L8SZyIzOi3DY/8w3adO+NBIKyooHK6u0
	 RD0tf2n4DE+cg/GP2+/nE2alfC7QOT/UKge+6Lj41JJ+CN9Z7VWjsKVpOhkFIt7JdqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867030;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=W5TAVO6go8Pasz513R7ZxOL8KqcwSl/G+E3fgMn+i0s=;
	b=A5GykLr0cOB6SqqSlraDe+yMJUpwUrj9PsO51JXNfOqSH60yTL9PI5N8+N54MpDSAItw
	 m85r3xdczSfe9QECUOLDddKTmettGfuZBaAIpi/ozvqZncgXS9TMF6qO6rWty4g7g+YhX
	 26DW0lYiR6nn30xNU07+T2NX68C3A+Yw/BbPNdiKec0JXjmjFEDbj9JrZNZPhVGPy0hIX
	 ueOlXwow/i1nzLDHmoBs2EiRsoaBhPLlbPBb+j/Ju9pf17O316QJI52LkeJnpFUQFw59A
	 AssmM21Zjs9+eWUo4LDedpwGtRtT8cf/OwG2n8iSmHYJjSa7Po+jeIi406BfC5hbvMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rL3JRQ91;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.198.20
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4B606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rL3JRQ91
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3mVdgmv478e/9iNi9ZaIX5BMjNxMf1yF6Sruu0OfJ4ZmEwj7WtUXa5nLXwxahJPH6TTSb6zQkTqUAi75IVoJaPBxV2eUYKay4rURfePMvk0E1z/sTy7OxHcopyxp56fJnxy/wgIYCcxbjSxCgPElNYERpT4KjwCYqpvaQRy3sBcWDR/prgB5RaOV5i7p5FUAuMQXw5jROCRSnhJKuYZTZj3HzdCItjjlUag8i18wpn+NyqktjmjSaWHqhrvwXAUy0jZRjp6k4J5QkQBMsX0AY/N+rPIynoDxATi1bxP8cMyPreuM9p7ElHY4D8KoMZK00R1vt9m51JOtk/S+mTjbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5TAVO6go8Pasz513R7ZxOL8KqcwSl/G+E3fgMn+i0s=;
 b=GGm/SoRa56s0ILW3NQg9O2VDQJEHnabohDm4+FgCd7AuL/EBXvgdZNEbADBcuRwmQx0KYUYW1qpG1E+IlVe6YWUSF/5RR6YtbmPrByqBVydkBiPSgCRvvblptCWpgSGL/iWSQMS/GSZMrxUclTw8caA9JyWyNyaJe8rFGKCl2zoY20jbz6lL28/p56q3sU6N/QuQhH3V/AO8t5vZjfhYxlDQbJvk1sFC4p1XzyP0obAdUE/5Xa0cljr13WcNtNg8MCmvUd2J3aHrlyqix7mGo4BFAvbXyhPqVBoWVRoMkfk3tlG+4cEZvUH3ZRV1TjJN/6f8keb/YfUAahezQ30OBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5TAVO6go8Pasz513R7ZxOL8KqcwSl/G+E3fgMn+i0s=;
 b=rL3JRQ91xvprclDxQvp1DUBBEN94iSpCwPWgvrM+NbBykpIVTbgdtEm7s2ozHn0zeSFUeysb6zN1XZhLfMl2l0KDJijj0T2k5UfX8j1eCvXEJ+1o+OfdVdwqqrVJunFVAyLGm9Ctzoglp4Gi7Is3E02OsTsb29W+CXm0aqVqctSjXVFDu5EoEkZDZ8lqUuHt05pp0oC7GrJ2w5roNPEwmpv4lBdCC6hg4BkRTG0zy8DMMHK8J46LwF9GeEvWk4no+yCMrmiKyNX9cDuqa/pmkgxe129YnqnqkZfmNdwsCu7sLJjVbJBbANd0EPaC8AUb201IknH+ojm5HldfcaU6mQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by CH3PR12MB8852.namprd12.prod.outlook.com (2603:10b6:610:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 22:10:22 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0615.009; Mon, 16 Nov 2026
 22:10:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 17:10:21 -0500
Message-Id: <DMWZ9AF2XRF0.5LUCF3PW1MWG@nvidia.com>
Subject: Re: [PATCH 3/3] mm/vmscan: consolidate promo vs. high watermark
 checks
Cc: "Lorenzo Stoakes" <ljs@kernel.org>, "Liam R. Howlett"
 <liam@infradead.org>, "Mike Rapoport" <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Brendan Jackman" <brendan.jackman@linux.dev>, "Johannes Weiner"
 <hannes@cmpxchg.org>, "Qi Zheng" <qi.zheng@linux.dev>, "Shakeel Butt"
 <shakeel.butt@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <kernel-team@meta.com>
To: "Joshua Hahn" <joshua.hahnjy@gmail.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Vlastimil Babka" <vbabka@kernel.org>, "David
 Hildenbrand" <david@kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
X-Mailer: aerc 0.22.0
References: <20261113235238.3595412-1-joshua.hahnjy@gmail.com>
 <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
In-Reply-To: <20261113235238.3595412-4-joshua.hahnjy@gmail.com>
X-ClientProxiedBy: YQBPR0101CA0155.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:e::28) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|CH3PR12MB8852:EE_
X-MS-Office365-Filtering-Correlation-Id: 818180fa-521b-42e8-73fd-08df442e68b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003|261028144727099003|261021123027099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	7+XWzbeZ/wIJhLvPAh1bXiUzkcxuJnOGJMTjMLznOS7L8DJ+Yj5KIvg6ugADbSHXT/AbWsp5FN+8CbtS+eC94GZsuYrBk/Dp1t9fUpNcfQaNr3VV+NoqeWxZ7UvHaViIGKREcCBf6SXqMUUZNlSMdyakXvpaksGM+43IwzupVrO86/IK6fonNKvpEqk6t87HZdI+i73H8Wv2lAzWgumDAlzzHINL06dzfij3YorLuSv7Q5eJlmv1R8kor3YVExbYPuRvfABJcdmDpWYN6rbVKpWOm/rpHmUnkd1bzNs5AjE06qzyJ9H6T72LBf+hxcEdB1q+UYEwPN1lUMtS8Zj1WRngdDJ19lUnSxl+jNO5YpHm9yRYM4J4iWXIpQA7sAFUjWs3DLN2RgbTrqYPCeSnHwmfFdFnwjT24OA3bcNxOV/s9Pn0zP13MYEfxXd3lSw8HM99OiAnQyix0u68e9DVYTkCn+u4oJfoc2Q1cdXaLCcUSznTjpRS8Axoa4RkS2PnfTjtmYI1A1xOCiKAeWkLHghufyKzlcJJoC1VkVUj96QzMt0LEzwusKeKJUBX95riUeKQaPewr3cwr4lCQdgLN5gf0w8LBsQJovVP3D2H+pEoQ7iJ0X5gVjZ8/LDENNZTtyxo+y9PnJBGMLs5WAGkqqV71fsadC2Acnjr1JjFS+k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003)(261028144727099003)(261021123027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1k0Uzl0bk15WWZ1OGlTdm5kSGk5Tkx1cEVhNkZZeVNucmlDT1pkU2ErL0R6?=
 =?utf-8?B?QlM5TWd6eWlDeWR4K3E3b2k0YlFUaVUzOFV2OURpVks5UENxcGZreTFyODUw?=
 =?utf-8?B?OHpqOXRYaDhtZmhydkR4YzhuWTlEeXppWDM1OVpITk1BZ2RMN2Jvc09IT05O?=
 =?utf-8?B?VzhveGk1ZHBnTjgyc21ObzQ0YkxCVUkva3F5OHFnQlpWYTZKVkI0TGc5dWlq?=
 =?utf-8?B?RmwvYjlTN2FSSkdncUpiL3pyc3Y4emVYSkh0azdnQ0xtcTc2TUhwTVgrdkZS?=
 =?utf-8?B?cnBUMVVva0pFcFJRV3JGc3dxK1FrMzV1THQvV1RyODh3elRZVzNjOVFqU2pY?=
 =?utf-8?B?TGJOZUpmOE1xMS81Vy9FRmUvVlArWGI2dG1iSTgzUmZCVDVlbnpnMS9WczJy?=
 =?utf-8?B?MXJ3VzhqMnRydENiSDZFYitPVDJqanRFZUxLVFJLaDQ3c0lBaW80d0gyaHhy?=
 =?utf-8?B?THJsVmsvUTY4aE1FWXV2cWdJVlNNajZwN2hvcG01ZXBKUGVDLzRaWnY5Nllt?=
 =?utf-8?B?bDZwSnJENkZCYWRFdnhxdlVreWFaOG1jZFFWcWwzaWZEekFkcUxHWklWRDdQ?=
 =?utf-8?B?OGpTUkpJV29jRGFVZWw1bkFyRit0TzNmbHFOTFAxbXpVNTVvamVzZEpXWmpB?=
 =?utf-8?B?MHYzcm9SS3hOQmJtNDR3WFAvbGtSbW1jVG4rRm15anZnSjNYbjZoa1M2YlRs?=
 =?utf-8?B?WHFBZ3ZwdFFKRU5pV3AvWk1ma2taaEs1NTg4ZVpUOStuayszRU91Mmh3SWp1?=
 =?utf-8?B?VGVxdEk0UExjanlXNEQ5TWwyRndiRzBFSU82VmpjeS9DVnBBaGc5TEl6YWkv?=
 =?utf-8?B?UHZHcG5LVW02cWFCQ3FnYXVYTFM4MlZkYzRkK3dqQ3RSK3ozM0JvOU91YkxH?=
 =?utf-8?B?WWlWMThKRXA4Tk8wSWpwUGhDQmxqL2E1N1hTb0Zla0pRbTlaS0V6Vm1sY0Rj?=
 =?utf-8?B?YmJDaHlDL1U4bHFGSDh5b093emxNTThvL1J3SlFURzdvdEwzVEdFNUVnMG82?=
 =?utf-8?B?TDV3c3BqcmwyR3JzbjZ4SnlhM0IzaGIrUU5GRVJXQnNWT0NzZ3FCT0NtVHdl?=
 =?utf-8?B?cldlU2RKQzBsaW1UNjhTUDY0YXZTcTBnUG5WUHRNaDRsWnlWaWU1THZ0MnJD?=
 =?utf-8?B?alFXWkRYMjd4amRFVnNNenVyKy9IUHFzMVlPQ1dDdkZoU1hzYWI0QS9FcnZY?=
 =?utf-8?B?TDhQOXJlMkw0MG4yaXRGWTl6cGNrd3JBV3MwdXFiMFBDTTR1UFFPNU5kelBi?=
 =?utf-8?B?emRuTFBqSXNQMFlObHN0RnpIV0hzYzN5K2cxSXdWVlJSNUE2czRaVEZCcVJu?=
 =?utf-8?B?dTQrbGFjOHc0YmY0OVNLY3FMRFh2VTZQc0dTcXkyazJiRWVITTlxS2JFRGpV?=
 =?utf-8?B?NTliYlorbC9xK2pjTFUyRXB5U2k1WFJzWFZHSEtyejBac0ZHQVNiY3RGdmlx?=
 =?utf-8?B?SEROUS8rYlJuVTZuYVRYMkV6Nnhwd3VJcGpKZUZDWDZEWDZaU3l2UE5TcUFt?=
 =?utf-8?B?WGtZZ05pVCtSMklOSis4MkVsRTVLaWRjWTZVTXR1UHg4RlFPVXRpSVhpTUZL?=
 =?utf-8?B?OEp6YWk0Umo5YTJucFhqb29PdERkelpFdytDU0JqVFNYZlJWT3psOHdNY3F5?=
 =?utf-8?B?N1ZLYTcxYkl1SjVzdGNHc1dGV2t4V1U0Z1RuQ3BVYW9YQjA3c1FUOWFJRU1r?=
 =?utf-8?B?bmg5VlY5U242TjU0bk1PbDFKMzFSYTU2elNxaXc0dXlBdlpjNmRUQWUxa21k?=
 =?utf-8?B?a0NGT1NUQ3RtZmVZK2h2eDdGSTZmZi9TTHpyS2t3UTZ1RmZNc2M2TGF1VzdU?=
 =?utf-8?B?dGVYRk9sM01lKytNTDdlUjRMazRnUTZWY1pKOXRIZHFLVUF2L3FIQWw4TXA5?=
 =?utf-8?B?ekZVYnJaemJQNzVyakRIcFY0T2V1QWtIeXJjNDVmWU1USy9RQzNJN1NRdVkx?=
 =?utf-8?B?Y01ZMk1JNTdMNG1YclVncDh3b1Z3OG5uT1JYZWdUYmF2c0lRYldHQzVuS1ND?=
 =?utf-8?B?YWNVdTgySXRHRjBMYm9PNnRhMWd6aSs3TXFyNHh5VWsycDBScktOODBNUTlx?=
 =?utf-8?B?anBxSDltdy9KdStidmVxUjJoREJJNDY2UWtGcWljbkNXYlZwdTBWdENJNFFa?=
 =?utf-8?B?RnVtcnBEMUF2djVMdzF4YVFlT0RzQlJWNmU3Tnl1VEgrWHFlM3pTWTd3T08w?=
 =?utf-8?B?ZDFXWGdrV1YvMGZOa1NEbDR2ZUZ6UTdsVHY0aE91bFprdFJrckpxa0hMWStR?=
 =?utf-8?B?bFdLMG1PQjVGOW1LczZOa045eE5DUUtYOVIvQXREbHMzeDcxK3h6alRjemh0?=
 =?utf-8?Q?pkUaJqcTv2NLhSqqsW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818180fa-521b-42e8-73fd-08df442e68b0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:10:22.6495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY1vfDofMJcvffHf/UH+Pp69++4BPT7ji1ikLj1GKyi9EksIeT+Y2wBVTh25DZUw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8852

On Fri Nov 13, 2026 at 6:52 PM EST, Joshua Hahn wrote:
> There are three sites which all check the watermark that kswapd reclaims
> zones up to, which is the promo watermark when NUMA balancing memory
> tiering is enabled, and the high watermark otherwise.
>
> Consolidate the patern into a helper function. While at it, remove the
> include for <linux/sched/sysctl.h> in mm/page_alloc.c now that the
> dependency on sysctl_numa_balancing_mode has been abstracted into
> vmscan code.
>
> No functional changes intended.
>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---
>  mm/internal.h   |  1 +
>  mm/page_alloc.c |  6 +-----
>  mm/vmscan.c     | 22 +++++++++++++---------
>  3 files changed, 15 insertions(+), 14 deletions(-)
>

LGTM.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

