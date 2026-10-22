Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792678371;
	b=ANgE54MdY5FDfJ6ibUP7iwBFf8G7mhtxKieF1j9skdLZaoarmGPClGFKnDUw6Rjdx2zL
	 sVzFMzI+OCc1sT+vUfPu+Cn00JBV9dGqtTrjfV/gW+n+G2+rKLUOaa3Do2y8QlqZa5Y95
	 PdI4/njvLfd3ocaBLjNfFk0SWvz+pGp13spP42dex75zHjlXlU+xxSh8XGQYscoFFhhig
	 5yH4KuXPnxc3N6XiMQyIo1D5ugTlRiR/Uo97KLdk2mJXssUkBU5jaGiEe80ZDgej8BOSK
	 1Wqigi7JOTjHp4+M7mDe6/uBggOiOM9iuQtVr+rRrcK7k5+NdGu0VmFZal3Ddb3wVPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678371;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
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
	bh=edVx3dL+q3+hwntZmlbioZQYyzerBVklrHFuF1C2sC8=;
	b=OTqKYJBHggB/N5bzGWXbo0PNDCNtgzdZe3xBnKHU99mC93iR3J+6iT05z1Jp4lEWY739
	 g8Kx4Rj/NEpqffmxNRbKMnmZ8dSt9ygHSX0SD+8wiV/uNi5zo5xGMOEnAdBq0rIZLrCTD
	 Z3VFk5my49W89fs5Z0D+5Ox6wdzqHbTn96ZywIKC2Bdqh1SO7mKU8Jlw0bqBYU7ymjt03
	 mOWtB7r3YOkH+PD6YWJj8DH9XK9tdZH+7YLXBOrlDVdqmfKd85iIhKjVUmXDkI7za5pkP
	 zxpi02qV21nnAIewBSvpD9IhoJc6XIrNVgyJ6A+5yIRPcYthgiWedhXu1MtIa9Ucx0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DwI1We68;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.85.50
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010050.outbound.protection.outlook.com [52.101.85.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A4F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23A4F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DwI1We68
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBHI+f5bG89fL3dyiwZ6jThTP6dtVuHXKbz3gSANZrvhISX0SlzW7rqMjcTM3ROiwN1dyfOHJDJpfo+wOBt8gnWrTG163br5QcUEDcg8xFxOOQLth3yPDwNLwfcbbsjJCDNb8+c3vMepb52PPI+FJR1fUqDbfHETHBp8kHGXolC/0fhAbhg047Bhtf+21CfQhLOHT+9tXNCjXjAJ6pc0KWE1VhHvKHuFM2o3DTWqkNYA3CGIBVmqZehrbUr7NdzzOCzRAsVlKVrkEoJU8JQh9iEj6VrfsDxk1L5Lo5qpbR1rOFEMJcwGjPNtoR9Iop81vjaPZ5bv3RdihG+gjPMkig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edVx3dL+q3+hwntZmlbioZQYyzerBVklrHFuF1C2sC8=;
 b=FsUynIBc9c9jgC5RJF9sVlQuoOwVb50k4jigSWND4z94h70jVSQhDUTZsJcs4WCsfQIv2rZfi7jb3xH+sb6PZN6eux5JbTKy80j3H3moYbI7rlJmvm6Vxl9wxqqYlFfFkWNBPl1HCkUdV7gBBJgXw+ETLQPLp5d7HpI9HLBGsZCKHFvOKnv+6BOxgWwv8EO4NH/v2tymfe9sBl5B33AahupKFbxqDsznfQA2ZzVEhDu4yjHTYIx/puxlekl870aedWqe8HMIPL4O0x57YWNs+AGNgxXxIMy9in4tD2A0SBv+sfFqnh6RicMiwn0/E3hK6jXuyXqdSORxjlDmeQ0V9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edVx3dL+q3+hwntZmlbioZQYyzerBVklrHFuF1C2sC8=;
 b=DwI1We68/aPi/rx4CpGiGEhRor8iEtwOfrG29707bpIfSXeWtvYQFR2GwYoXRpjBupfZ3CmVSHkF1hyHXusCn7s02OA4ibs/aXOiDHvj6anqtr70NmAnHWqnCpZKeIB20GF5574SzwtO9xnQCw63CWD6Bqd6F886BWhFO54iQAPXy6dcNRSjKdQdw054l6ylvKa3DOzamnX0JWgaYUwNAm4WveEC4MdJqeCU2Xop5V2YbL19Anum8PS8rEjS/EqYi9avOWpf+8D//V3uaKPTkgeylGWml7VosCJmC5IU69QG/qwXXxUiaXz+qAKJOY0eBMypEYVorAGS2RDiWkVsDQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 22 Oct
 2026 14:12:45 +0000
Received: from IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16]) by IA0PR12MB8374.namprd12.prod.outlook.com
 ([fe80::d85f:4c87:ae84:3f16%6]) with mapi id 15.21.0522.017; Thu, 22 Oct 2026
 14:12:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Oct 2026 10:12:43 -0400
Message-Id: <DMBFFYYB7137.1E4V40K7E0TT7@nvidia.com>
Cc: <akpm@linux-foundation.org>, <vbabka@kernel.org>, <surenb@google.com>,
 <mhocko@suse.com>, <brendan.jackman@linux.dev>, <hannes@cmpxchg.org>
To: "Zenghui Yu" <zenghui.yu@linux.dev>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
From: "Zi Yan" <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc: remove unneeded forward declaration of
 __free_pages_ok()
X-Mailer: aerc 0.22.0
References: <20261022124504.75642-1-zenghui.yu@linux.dev>
In-Reply-To: <20261022124504.75642-1-zenghui.yu@linux.dev>
X-ClientProxiedBy: CH0PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:610:77::29) To IA0PR12MB8374.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR12MB8374:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 57931897-c77e-417b-f04b-08df30468b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	HS4X+q7OuyROXdJQ/gq8mwaIxuIGuYoBALdMQMJoMIKt3lt3wan8xXIvuwMxFqotxvryeKWbwyGp4oJf/1gF3i6FEnjwrbptYw0ByUIL0Wg5iWd92qpdxUHNU6BtKZbto3fvVKTq2OOQXw2AxS0zU2FK0KmzhSGUBKBepdwYKR2cU5G095dzsyUDPsM4ehC8EWohm2d+HLHViwFqXoYXVazXq6ioIszl0wpu2+VT7SQgz5hGxmzPKKwEXMv6txb4ZpVwOhPPg/5dy5bNpIw33s8BJ0vOodHjjJthfgw1ew7VAuAvUjc4AZkknycbg5wl6TjJmbUeUQ9lDbwBiYCdUtpC7VzPLc4BQRf76yPkV9dUkZTQ36Y6tZxY9nmRe9x0nCHLO3zn9+AN8UVtFr4vo9Fs0qfydg3+bLGl+T44rO+B6GWs0abxOM3UCEBPTUPhWNihf7LczGef/0SdZ2uwW5A21BEXawtRqEj5jL/pdenOgfkZYE/C2FH/PVsdIeaceoh5pi9qFADNllFYRCEzqouDRrO9twVs0g77XlT7GFs+sssEki6m7eBAnW0SBA9z1K5eSe+RAH3yolbLgAS9d+yg9WaVzI3Dw0zATEc1fhfs/ZY7ZulfhCgTUfnMc+XpieeG4UYtSLWEoDWbJOolGKHJ/b0/ngABM+HPYi0vlnY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8374.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261021123027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkF2NFY4cFZWZmplMWNSRU5RcHk4bTJOeCszQkY1Um5VK3BmRFk0M0V3Yk84?=
 =?utf-8?B?Y3hkWE0wck00RUFPc0Vqay9PdFp1Y0MzNHMrOHNrU0E5YVlSSWpZSEpyK2hx?=
 =?utf-8?B?b3NYU1duOE5SMXRZTzFwQ1Q1VXJONVMvVDRVblNjQ3F5MkxhMCtNQVJ4TkhK?=
 =?utf-8?B?QnNiNURGbkpRdUEyZW56Vmg4Z0ErbWJpbDNZNllDYWxBNldDUVhLbEJMYm1W?=
 =?utf-8?B?TXJ3b1oxZGFTUUVjSjg0Rml5VHk2bC9UVDVOMXlVNjN1T0d6ZG5xRndGUVZZ?=
 =?utf-8?B?YTJUa0pWZXV4V1oxYmdIWFdqTTJDcVVneWJMaDJJVVFhaFZHM0F5WGVMOElh?=
 =?utf-8?B?b0dCYWk0UWphZ1FXSnUyN3NEdEpmTmFhd0k2ZllpdURjTmxsTEdTdHFFTVc5?=
 =?utf-8?B?WFkzN3NnT0NxaEsvWXBCSjdzdTZTSHpLNGVVSWJTZVNkWHNJTGJidzlkdWM3?=
 =?utf-8?B?YndNYS9XSGZ5bjNUaDFqNTQ3RldHcXM0cHozdnk0VXMweC9tRFhwTGFIRVhs?=
 =?utf-8?B?QUJKaDlZVnBuUVdPWkdUSUZndFdxVm5EbitPZEtMc3FnT2RqakdNRUQrSzRj?=
 =?utf-8?B?Yldwb0RtSXpNcGpqWm9pbC85WDVwTVQ4Vm5nNmt6TmlrdE1Vbm9NVEJZT3hR?=
 =?utf-8?B?SGpkWWhhNkVvQTF2ZjhuOGl0M0RrYUNCMjVMWkVFU0NnZ2I0Y3hhd1RJc0Yv?=
 =?utf-8?B?WmU5dkZLbnRWMENGV3ZVdW9ETnFMaE90QUV0K1hESENMVVplOWd0YVFNUVhI?=
 =?utf-8?B?cFY2RExmT0hzWEIrUXNWRk1LUm5IcGJHVHpZSnl4Qk15NWpDMzE1cnlPRXNp?=
 =?utf-8?B?djlHTDkvRXphVVYxK1VSZkhPTUkySlVkcjI2VjdLOTZmR0craEVhNzN1YzF6?=
 =?utf-8?B?d0xpeW1Ta0liUEtmRDcxMHo4bmlPUVRSYXg2YUZzRnM4YW44MUZZNStOZUcw?=
 =?utf-8?B?bkZ3bHBZeWwxQWVmWUt1d2dQOEhhRENBcnpWUUh6TWxBdTFUM3I0UXVFNVhi?=
 =?utf-8?B?ZnBOclU0U0FvTVBrMDYrV0hacytxMFl3RENVYlNPWGZxMSt2Qk1VZXdlZW1x?=
 =?utf-8?B?Z1ovaFJqRU1VRFNFMzNUR2pwbHVSKzk3LzFmZkNGNzZVem5CT0Q2eFg1ZVpX?=
 =?utf-8?B?TTBjdHpmZE5ZNFMzd0Y1b1AyL2xUYTljdUtsZTFselovZm44bjdhaERoVkJM?=
 =?utf-8?B?RFVOUWNCU3pMRFBlQXEycVN6VnBBeWZMeWtqNHViWVpGMVRvKzRrbDAxbU5N?=
 =?utf-8?B?dTN2SFlGNFR6YVYwRk1jc0ZQQnd3K2FYZTZzUXBUVWFvbWNGbEhLVzJLWWZw?=
 =?utf-8?B?U1BUOTI3eG1WMG92czdqeUgxWHA0TGs1Z3REZTRCNTE0M1dzMnpPcVB6U0RW?=
 =?utf-8?B?cFNxL3M1cjNIOEhmejRONVRDdGw1Q1pwcHhMSTVmU2tVSmwwcnpxcTRHY29Q?=
 =?utf-8?B?WjNXanB0WUZ2TXdpOW45R04reDZJaDJMS2JGMG9talFEeWJQYXhUNDU3K2Fk?=
 =?utf-8?B?cWFKM3hPUVIwazJJNHZxN0d3VThRSDE3Unc2eWYrUnBrVHY3clhLVTUyRUZs?=
 =?utf-8?B?ZnFSVGJUSWJ6NUQzbGNlTnNnMCt5eHNNOElnenVUdWZrUUtmaXFJUHRRU1dV?=
 =?utf-8?B?SEVkeno1S2w1dnZ1YVplTlNEeDRhcVo2TnMyTnVLTG8vVHhXVUhMOVJ3ZWNq?=
 =?utf-8?B?Z0tBdktBUUFpSHgyOHhvWFZEMUpCQStWRzRGbGFjb1MwMTdhYm9RNE9YaUYz?=
 =?utf-8?B?djlMeEhVb2Y4cUczdUtUcC92NW5Bc1hsWjM4SEhRYTlDTXVhRVJPQ2JDOHBB?=
 =?utf-8?B?QVlhSHZsdHRXemx1b1hpTmZSK0NjZ29zcVhnS044ZzBRTlRhbTM4VkJjRWFv?=
 =?utf-8?B?RzNrRTJvSDlNRU9raFVWOFhQL1IzZnZpTVh0bWF4R21rZFgvZDlEQ3RrRjl3?=
 =?utf-8?B?eXhjMk9YUmRPMThCemova2lxeXpqaWdmbHlxallNQzVIeHd4REgrWXFTMTBt?=
 =?utf-8?B?d0hyUkxHdnlFVG56eGJRamNGZjN6TkdUTGZKZTg2S2hsaU9QK3ZiN0dKWDlV?=
 =?utf-8?B?bWhtNnlsckpTVGJwSEhzRDhrekx2WGgyRU1nbU9ybm9XWjhLVjl4b3c4eG9j?=
 =?utf-8?B?aDVXTlZES1J6RGtjZmNVcGw1Z3l0bzY3TXhDNFo5aWFCVERwem9nQ0hDa1Uz?=
 =?utf-8?B?RVZSdFB1dGQ2UXBES01va1FvVUpmaFREQjlXdURJd0RGcWNlZ2xpNCtaNWls?=
 =?utf-8?B?eW5Yb2FTK3FJTkpOc0UxMmJVc253MGZJd0dVZWs4NDYrcDgrcDdmV01OUTBZ?=
 =?utf-8?Q?g3XXFqUXk/18f80dao?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57931897-c77e-417b-f04b-08df30468b27
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8374.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 14:12:45.1467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x+RA/0fC/LtBNpqOO8Ij1l4oYHOjJ5M2LZvc5+6/pRupgqal41ssXgaEzhgB5/cD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173

On Thu Oct 22, 2026 at 8:45 AM EDT, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
>
> All remaining callers of __free_pages_ok() appear after its definition, s=
o
> the forward declaration near the top of mm/page_alloc.c is no longer
> needed.  Remove it.
>
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
> ---
>  mm/page_alloc.c | 2 --
>  1 file changed, 2 deletions(-)
>

LGTM. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--=20
Best Regards,
Yan, Zi

