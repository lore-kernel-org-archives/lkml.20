Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCDD582B9E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172041; cv=fail; b=l8EdXaB9iBkKbspyH9hWLwndJ3LkWn95w/U7ktKBKx1SzNOZVpFz5lcIspwTj25rrZlLrrgHUavHF5wXxs39x4jJy2TCbrQJFB6YvbPODb/ujD5HNmAsJFDG8H6NSbjt+VBaa1fdZjvs6QPCr00LR7yGGrRzOYtg+LV7yC8ciss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172041; c=relaxed/simple;
	bh=rUWSZyyV/7AZ/A3H73Zg7KOcT+PeMae5CmlIKSugTtA=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z1XwUWBMpB6RbM4Zl56+0vcRXbjzp5R1tpQ0rlHKmHnYPW/rsiQwkyWaAbwzmk6Sg7ROwXdCbiAFUCw8EB4dzKfiJH+iR9G8BLy+TQkQpnwXbz9gRNfJlGUFoye9G4EooKgIkK4l2r1goYYFHBVp1hkbVPRg30OTaDojFa3YIsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Vkws04Jm; arc=fail smtp.client-ip=52.101.57.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Vkws04Jm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r112mYbh+/j5fwSXl8TwmywFZML6ZHXzag0ByBYG7mooRaGrfzGJW9yk/gqR8rejYWZZHIOLg2fb4B340SPVvofxSTJgITU2g2xjJx7UDFZWJ3g4GlTePY5sCA//6VPw97S7gixK8AO8zMJkgTlpYzkyI1GHZ0xXqq9Q55Qc1saO/cqG1gFT2LhkRyb4VOmOlU2Fm2cD8XPmSfp9yMRSvUoRdEaRowONHpe0VXCYJ+gqVI1BNfqBixJaw7GCY4dArhRuIPcW7EeJrDmoLC1ZZxfr1YbqP89//8wAm9jNvqUwrtanjViv6DI/7IfuhUxXdc48o15mSpDCgVjCz9DgEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUWSZyyV/7AZ/A3H73Zg7KOcT+PeMae5CmlIKSugTtA=;
 b=rr06AYojrKfkSoVUSjqXQHhcZb/mMaL/yvJNbusR/CirqY5a6GIDDlBLZePRiHu6DlPkAAp3qfxc0nwhPaCOmDfZO5BZFV9SM4lElbwGO+GJ2HNfJ12YOUYezmNMFm5KXKjeNbFfzHxjdxJBE5R9DnU8EMLwooQmy7rnpZekRRMvgCfgQvvov4KMM/W8eYV+KR6oq4qnNkdX8A1yYm058ZGGaJ9x2YfZvFK1YQmiY/k7qOll1Hg1IZhVfX9ooZ6VSQz+UuLxYazSqniMFvOYwayQruHWs3DdEyiAWQBIq1wd3++rGF+PC/KVV2uwvwf7Op52cztHZYrDWDnXeMCtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUWSZyyV/7AZ/A3H73Zg7KOcT+PeMae5CmlIKSugTtA=;
 b=Vkws04JmG92BuyTYgq87kbWX+LZM0S6P+ikq8DktuR4733CbDLXuGl1n3Fg9ZX3ACUdBWNE4TUBwPWSVZpAQGgFExApnlhn+VfcPNI+1em+VYOV/NGDFh+sI1sAgeumstaWUIUlYqU1pgWzty7vu3px0vtP6cX5hPs6+6RcChhU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV8PR03MB7520.namprd03.prod.outlook.com (2603:10b6:408:181::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 17:33:57 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 17:33:57 +0000
Message-ID: <b2c02327-4d77-4ab3-855c-26b5d357f348@citrix.com>
Date: Fri, 16 Oct 2026 18:33:53 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 David Woodhouse <dwmw2@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] x86/xen/pv: Don't setup runstate area too early
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
 <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1792170392.8631fc262581453bbf619ec5b2062170.1a145adfbff0008425@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0108.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::10) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV8PR03MB7520:EE_
X-MS-Office365-Filtering-Correlation-Id: e63bbcf2-8486-4d2d-da8c-08df2baba84b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Y32QSNfpAcp1JaZajXGfLKqDOk2boDj1Wb//qirXbVhWmsvUesKNFfy453AL+AGU3FnLeo6+oHmcJ3cokQL7YIAXt2u4PcRjWWMZZ3VD+MRSGT0MXFXP9z7fKtNq0F2rPSVyaAk/5fV7y2144EsFM51DnP+fXcDI2O8TTW5VYJVKuiq8FvaqC89xHZalivKR2YREsl/6J+P+KxdU7gSY3hG9gMqxOJkRNazXq8HIt33/c4Nfkt37IoasRuR0yIBnSeGdRaIcTdo8AO4WfdrWc51dAjatWagLnAhCIo08P8YDpxDRhm/Nilv3ykTxmwdOjGt6nGu1GAaFs2HYDf6FtNrnLMvk4pPh3igLAhk+l7BH8nvMs+jvo6T75Y2hSqNAOoJbB1SUUCM2eIjGCE7ZIDHvFSESiHDDsvuNb+NTXDqLdzWZCdcJjZthMJ1P5TugsCiLaCqlr2iGmMkLQ/0q+7fVjtiyJ4F3GpygCFTcHuJdLscSiCBwAhux6ELwRNjUiMqf6PuG52y8NsQpKowxVU677MaJJ5BFkUXKtRwCeV6+2kB+iTCNAFeexjnpizPMgV57e01jMk6B7GKflJaz2k+W4GQ5U0q/eQvXW5kfZNKlDLVoHV2fF0mYQFtaYB9Y0LUuWkXvaeOcX5fb2naNC4uJWbq/UhJnUr9Qm+LZfwo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WTFrL2NuYjkrQU1sakFOVGhLNXJsbXdBMHIvRXVhTFR1UlZUQ2NyUjk2MVJI?=
 =?utf-8?B?OWdGMXBaZ3hndWswZURJV3BxaTFnaFc4VmhzVXBhZWxFQU1yclg1MnB5WGdU?=
 =?utf-8?B?aXJESmtTeS9SNlZKZVRSay9CN2VCME0vNXZPdUJjOGNudjRldFBnYmtvWldM?=
 =?utf-8?B?NGJQUnBVei82emJiS0hSM29JMkcvYWEvOFpWbEt0QUwvZ0VSSGZTNzNESitP?=
 =?utf-8?B?dmNWYm1zbTkwZHFUUFRBRUhKNHdRekdzclllTXdBd3JLai9nT0p3SUtRQ3c4?=
 =?utf-8?B?RDRGN0Q1eDR0K3NTKzdwT005ci9kL1JRdlJINzdxbzBhT0dpNjM5VUd3YlU5?=
 =?utf-8?B?bDRscmJiMUVkME1uZTFpZ0xsVWxoM0VJVmJheWtGdkJ5UlYzTW1RMjNCQzU1?=
 =?utf-8?B?SHc1azJiaWF6TUtiOEMzZWs1ZjFwWDRkc09aK2loaWJpSmRmNUZ1ZDNDMDhJ?=
 =?utf-8?B?SWNtNDRPSnhIVjREVlZuKzFzdnM1MTk2N0lmRm55YWJORzdwNHhOalZqMG5U?=
 =?utf-8?B?eC9SMXM1TUxXUnFVZDJYTHhKUUFMMnAvOFFra1RVSW9IdkN3bmtxbEp1YTBX?=
 =?utf-8?B?V1JHUjl3VjA3Ykh2OW1ZSHZlTHJMRmdoa01tcEQ3ZWdMZXhRQmhmRU5LNCts?=
 =?utf-8?B?UzR0eEQ4K21VMStJWjY5dWxuTU91NzJWeWpVQ25XVG94TTREY1RHOU93Tnl6?=
 =?utf-8?B?RGZJTDQ4N1ZlOE9tTDNDbndMdlR1bFdyNFZCeXU4RnFaTGQxNDJGaHNsVmZz?=
 =?utf-8?B?dzFob3pCbFMzRU1Na0h2TWg3cVNXMEJxeGxMQlZUTDV4WG83YnZSaFlCTjBa?=
 =?utf-8?B?RFlpRk5wZng1NHQ4cU0wZUdkUTl6anNkam1ySStPR3VRSjJ4UzRzTGsyemJ4?=
 =?utf-8?B?MGVFWUU2Y1VJMjZ3Y3pLQ0E2OWZESi81WUI4T2poYWhNOW42anMyVTJ1bTg5?=
 =?utf-8?B?RmJOcTh0UXBEbFBXNzAvRmdEa0hxNHFvV09vT1ltdG05VmxqQW0xSzMrUE9j?=
 =?utf-8?B?SGRYOEdlZFdkOGdJNzRmOFUzWTNxaVZYWklRL2dwVkZ0ekNhNVd3MU5kZnhp?=
 =?utf-8?B?K3REbUFWY1RYSWdwTC9Tb0U2QzFWaUxPSWsyRENBNjQ5N05IREZ6Zk9Xenpm?=
 =?utf-8?B?dE5XeE9IeU5hSzFlUEVrb2xIZDJWZmdHdHYraEl5SVNKYnZSK21wUDFVLzVq?=
 =?utf-8?B?L0FRY2NuS25PWlRDZnZkc0kxOFExUTNSd05uRUJ3M1pPaG9lWmRhR3REZWVs?=
 =?utf-8?B?dmZrNGdkOEMrTUtsclpJajhCSGwyNkExeVpWTW5rQ0g1RmYrcm52eGdZVDR6?=
 =?utf-8?B?YkswRTRIRjA2VnFHWDRCYkVncEdzVXNtTFgvQzc5Kzc2RlppUXcrRTBIdXFk?=
 =?utf-8?B?clU4bUF5N2tIWU5Vc1Awdm9VWGJYZGUrU0VLOC9tOVNHRFlCa0xhMXZ2VFZq?=
 =?utf-8?B?NmtWT2RuVDhkN21QUGJ1QTFEUWxKek9xRHVwNjN2dklsS1RSV1VtbmZ4a2FC?=
 =?utf-8?B?aVRGRmYwTkhCUCtaRVQxbDh0VlI2OFV4dnR2cGxYY05IZ1F4QnBWR1VtYnE4?=
 =?utf-8?B?MWlrbzRWOUc1b09WdXV0R3BSUVZVN0NaWnFiQzlqTWtSWnF5VC9lM25pdlRX?=
 =?utf-8?B?NGc4NUZuMytRSGRUNmlST2tjQ3FZaHFncmVaQUtlWTUrcktuSVBhcjZZN05R?=
 =?utf-8?B?Nk1UM016RENSVmVEd0N5SEREZjJ0QlB0MWxVWXJhcGowSWowYjZhKzNPdUx3?=
 =?utf-8?B?TFQybFRSbHVtQkpOV2pmd21GdmRtbG1tR1hCS1JhMHR3WjNZS3B0QmNLVlFr?=
 =?utf-8?B?TnlQVmFxVFFtNlZ0UXFZYmRIU3MzbmNIcTMxWG5RdjhxN3F1MjcvZHVJUVRX?=
 =?utf-8?B?R3Byb01aV3cwSm1rTW9iKzVRV3FTMHR1L3FUNVBpYkdJdnFWU0NaT3VEVlZq?=
 =?utf-8?B?VXRraW5sVE8ydGdVVkx5Mis2MmptRE1QMXR6aXBvUis0MXFVZGIwY1Mra1Fr?=
 =?utf-8?B?a0JzNVJpY1kvSk5kSUZjL0ozbE5GVFBYUC9UTENWY2lES1J4U0ZDblV3Yld4?=
 =?utf-8?B?UHVWVWcveXdZRG0wRk5JLzF3UFJ6dEdXM1JjY0JyV3o4SGhJdnhRTGZmNHI3?=
 =?utf-8?B?U29qbWVEVlNrUVJYTkQxcEMrTjB1bWxyVUp4VlROT0lkaWJmWVRTb2MvTkdn?=
 =?utf-8?B?R2lPdTJIKzg4K1R0R3ZHNE9OaU1EancvbDdmcWtjM0hsOGhCT1NUUHJaVGh2?=
 =?utf-8?B?eGlWTGt2K3FuTUxrSS9obEN0NndBM29BYm5LTlJiVUsvWkh3OXB5cWRiUlU4?=
 =?utf-8?B?cmErc1ZwdmxZZEJvckRWVzEvSGVzR0VoUC84c2J4S0xBUDRGUzFNOUxhVEgv?=
 =?utf-8?Q?m5ATrKNg+ke7QTMw=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e63bbcf2-8486-4d2d-da8c-08df2baba84b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 17:33:57.4609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S/b65zLiBz9FzPtAa1JNaHQ9/QKtzrHDNQfKdA4GeemMYY8LMI38cg23AvKfHZhLjUayKaSxImfwpAjdkw7W1OfMvLltBXJuV9y7S5PTlN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7520

On 16/10/2026 6:06 pm, Teddy Astie wrote:
> This is no longer required since [1].
>
> At this moment of boot, per_cpu areas are not initialized, which prevents
> using VCPUOP_register_runstate_phys_area as per_cpu_ptr_to_phys() would
> misbehave in this case.

This isn't really correct.

The per-cpu area for the BSP is within the main image, which is why the
logic functions today.  What's missing is the call to
pcpu_setup_first_chunk() which tells per_cpu_ptr_to_phys() about where
the BSP data is.

I think you want to say:

"A future change wants to use per_cpu_ptr_to_phys() in
xen_setup_runstate_info(), but this call is too early.  It turns out to
be no longer required since ..."

>
> [1] 8a22b9996b00 ("xen: drop xen_sched_clock in favour of using plain wallclock time")
> ---

Missing SoB.

~Andrew
