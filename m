Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660C52459E1
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687303; cv=fail; b=bSd0/oF37BjAsRfsYd/RUueGCdgxvWHr0f7TMJlDcWXw5IXxPknZdq5Qm+NomabgjzDa9FWQJ+KaCpFNL/Otyx2rhQqu/wmz3XSFj+VLN/tNYW/GFrkc1izydFUGS3qAaQ5Y5GZqUmcU2QkfvYcwKpND9sYjCk1pCE4o8nfdJCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687303; c=relaxed/simple;
	bh=OpoJAMZGhERJVh3AvDdN1G268MPSGDQrEDt9Dv4j8fM=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CmW3M0X+owktr6RSZz1eJEj+seYlt8fqWFS0lMu8fwrZrvBXRcCOpRwBfzjMl5SILSnqZpztM0BPmBK1GjopPqU84Yq0fAPNeqhT+IcsXHZFgx81uAKsHJKnckFxdODJgqtKEcRr1Wvw12VuGcOwLo3gUDuWC1hMLIWEiPgteUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=citrix.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=Z2LgulGh; arc=fail smtp.client-ip=52.101.57.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citrix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Z2LgulGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbzHff7CYaD9FtID4akTR2sURzn6PNXyKloyDOlWlOaISzWh05GaJb6WgcpEOlOPTTqdX65X2sHCrMaKPGYiHZiNlVrDQ/Ype1FWuwoCQ4RJ/H3eK6FZumSlhX/8wSGN/Fm1DXHXyS2i9YVe+2fc3247kkQLM6UVWnL14hUcAxQJ64K6RkYClzGzZPyNznBYqT2/FGefs1OG3O4wXbimVrmOrYQ0NB5mhw5kyv43mtVlPI4R0luQ3n+iCVPlTIczFtx2VDbqH4ORp9UTgVJczVHw6rbE419MPQFKV1mY0DEHJaQAS62phlFQ5pkoZ50KkV3zaHs5vJTylRD8pXbfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZs9FrtODUepJTK93RfixhzY05q+cLLR2653X6dlM+A=;
 b=f23diwDEdSbyQ4k393fs3KUZybnJizlzsYddmhzyHOzoe20QWoVKz2BAiC+fwIV9xsi8RRFSK75ggcDNsMxfX+D7LC3N6kyg0gPKfMuA6QvaScwVGJrd9/xaTXXOLcq0cx3oZruKR9yndl2rE4VmgAEljt45i3l6psjsIytnF62VRIAmcaixuPh9HSHwtSUKJQ4tQiBXIGQwtxKqsT+ipJ9kDzP0ELHrzw4I8iPDOz1E1Xo2U/qT3Xn5p3OUUWb6a9soCPipWrzYgA0njEX63mbIDu444V5KWswaDIyJOUUwI7oBJbKtoXmifF1IpDOkbJBSQktVq7ZAsXpdX2/Crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZs9FrtODUepJTK93RfixhzY05q+cLLR2653X6dlM+A=;
 b=Z2LgulGhTJyUbdqv/Z7cswFPVCH3TbWtCK0L8t77LRgCScUxGmFMWuG+eIsF7v8cHCPOQMMqHiltqgU3ZvFRc6+SCi72gNWhdhB8ck6jD/QMlf4g/ToJgvA9WCkYoWL3ePatiq1Y0CBktoz/8EqzDYgGIkNMMv7r5+6rMqgqKes=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB7637.namprd03.prod.outlook.com (2603:10b6:806:440::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 13:08:18 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%7]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 13:08:18 +0000
Message-ID: <9c7c9b2b-2d1f-4b51-a411-e0869766e3ab@citrix.com>
Date: Tue, 29 Sep 2026 14:08:13 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>, Nikolay Borisov <nik.borisov@suse.com>,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/microcode/intel: Refresh old_microcode defines
 with the May 2026 release
To: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
References: <20260928222607.3593973-1-sohil.mehta@intel.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260928222607.3593973-1-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0286.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8143e2-df00-42d0-fa94-08df1e2abac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|7416014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6XoRN8AqkpNnmQl/F8asKndrnzCoX6Ho7KH4dww/DU65KIEJvYLo7FscMhxDKznGua9wxl347ARSsdOCfGPnGCc+3ggUWiiQ9xZhIRZzwxpEglXIhV6xG+xon5ay9fCJYpyNqWjgLanciN68AmJEWChkcjOLjtSaZlYzgSJ55IguA1zGpmaMABXYZH0AO06fcIDzp2LFkqJOrEBNcLXYgsF4I4mIXIj4LWAkmmSOSiZSfv3eiqiw+2Q0F6MMAwpSdl9GFmZmvbdMYR+qhxHCpIWV+zHuCVxCtsWUDC2t3znjMdzXaYgsoVqROWnXipnGzewtanh5cmPra9XAuuQnSFHJ1E76CpptwXZ03Idz7aIHWEGvTeDdokaJuFWPoqGRH8y8NA/GoYw7HyMuUN2DsX6xkeCB8Jq/AOOXj5fTHZsCoJwRE8tHlWhYSWfGQSBxwNhtQ4wfYp9++V5hEt06QiEYxHy0WeYuvRPu8j9lwS3eWwcpMHnvdSGGvde6nN0jA+CW84kKG7CH02zSPhutdtvMuEee3i0p7U83w+CK4RFrR7KGikm4p4rXptwmVog+lAecCmRhNslCKD4cvcpiGgTEMFo4XJoIVtL4GU79xYtpjadSUU0WiqNTrsg4uh4prHKBHNAz+7uH48aEHrhBiAWrcZBplBYI/tIRsrkAlDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(7416014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjEyT01YWHhFWUpuREhsTG9rbWM0REZTaEZkRysrRW0xcTVtbHBlWVRPQjJL?=
 =?utf-8?B?cW1abVJmRk1oY2R6Uzl1SUxjKytrZHAwc1V4bFEvZmRHejlKSVNycmg2U3Mv?=
 =?utf-8?B?SXhzc1BLaE5ic2g1TmZuSXZaSitzUENaZGJhS0JTbWpmVEJ3bVh5T0kydDVr?=
 =?utf-8?B?RTlNVlVmWUwrU3BJVVV5VmlsdmZPZUlEWmZCZ2Q1L0sxbm1sV1lBMHRFWFpS?=
 =?utf-8?B?TXVrUWp1QzBscElZUG4vR3B4NGMwbDlFTEtlaVlBZzdFQTZiZ0svSnJtcFlu?=
 =?utf-8?B?YVpFTUpJNGNtc216MythM0JxVXRXYXlIMnNOMW9GTm1vSkMra2ZjV1BHVDVY?=
 =?utf-8?B?SStweFRiMkhhZVdVckN1THorVXc5VFhKZy9MODA1Ykp2QmtQQUdRYUFBai9l?=
 =?utf-8?B?cCt1cTl1NFJBU1F5Ui9MYVA5a05neFRqaGw0azdDdmFIK2ZpcHJJVXMyWThx?=
 =?utf-8?B?R2xJdENyYkhvSS9SQ3pDTHhZVTZaSzN1OUsvY1Q0N1J1WWl6RUhpNWRaNXZm?=
 =?utf-8?B?d0VRdW1qdEg0T2NhRnE2V0FYdGo4ZTZXMWozUzllZ01MTGlwU2cvbU5KbmNn?=
 =?utf-8?B?QW9PSnF0NDZCVFI1Sk44em03cS84LzRjelZZT2duUXBZVlV1ZGV3WFgzOXFz?=
 =?utf-8?B?Rk9mZnZ2K2VDVlJZclFJUGhQeHFCRkdtQWI5MjRMeVlkQ2JNRHc3TkptTjJm?=
 =?utf-8?B?WGZYdWllL0I5cjFSRmJPUGJTdzVpNGd4OTBocTlHWDJobGhpZDY1dnVHMkx4?=
 =?utf-8?B?WVZ6WHJ3NnBZdm93WUdoUmF4aTE0eU1Jc2FLZ0NoOHB4WERXT09SMmQrMUxq?=
 =?utf-8?B?ZGhXdmFPYThCd3FlcFJtWXRDdHhVTStCVFFGV2RCaFkzUGNyZVlLcXVaYTdS?=
 =?utf-8?B?eU4xdGE4QWFBdmRDR1pIL3BqS3pKbEpaeGozZngwUzg1L3o3VEFiVnEzUVdK?=
 =?utf-8?B?cWt4bFZTdWlsa2tSa2lMMG1OL3lXL21ZVExZMDVXcnBVTVYxaXBKd1F5NEpJ?=
 =?utf-8?B?Q2NMazFTSHFwK3ZEYWVGNVlzVDJmUzl2eWtnNnAzQ3RIT0wvTkJlaXY0ejAx?=
 =?utf-8?B?N1J5NDkrRTFUazJPWVUzWnIxYVkwWlhJQk8zTEQzaU1QS010WFBPSnBuaFFO?=
 =?utf-8?B?clNwSWVuQ2JkTkMveDg1YnhkcXVlY3NSVDExQWp4SC9JZVFUdFJ0TXQvTFZT?=
 =?utf-8?B?MGI4VjZzeS95WUNBN3RRU3ZZaEd2Z1l6WE03MUd4dURiaWcvbk43NGIxOXV3?=
 =?utf-8?B?ZG54SzIxdWc3cVRzbEwyaTVVelhWQVRVQ0xxc2RXVnFONkxIWnFFUXV4a2pv?=
 =?utf-8?B?bjZEZWk2VmMyRFA0aU5yYzhQc2h3eXVGZHZsRXVQeS9JUnhzTmx1S2J5ZUlu?=
 =?utf-8?B?UE81WmVGK0tGZTdGRCtRTTlySzlYYkNhTzhIaUFwQWZUaVdlcmlqZk41d1V2?=
 =?utf-8?B?ejlBdlNQK2NrdGEzenZCT1pFMUlXT2FMNWVrRUdNWUtJUGN2K0hmZXlyUlM0?=
 =?utf-8?B?UitrZnNsYlgzSGZkcHFRRDBWRzRrUVVwNk56UUNzVlBud29PL0hIU09LcE9T?=
 =?utf-8?B?TEprbjhyZ0ZIbitUbG9qVlU0S2V4N0o4Z2granZoZXRsUlVkNFZNaDJsYUcw?=
 =?utf-8?B?NlpEdThKWE5naUxpQWFFUlpNanRwTnhLNXNjTlNtQW1ham9jblhYWDFhQWpk?=
 =?utf-8?B?QjhPb1AyczlpSnRQZEZwcUJMY3dhb09NbG41NWw5cnVadklndmNkUGlYOHdV?=
 =?utf-8?B?bHRtQUQyTGExNGJTc05wT2dqdlcyb0FiWFZ1bGRObGFLWVYrVVdqNFk0M0Uv?=
 =?utf-8?B?emV0MWpRZ041dDMyV0hyUzdzMDVRcFg0OEd1dDE1KzByN0FsS0dVWmU4dVMz?=
 =?utf-8?B?OHpoRVdGWC9kSEVMZXpQOWt0S0dYa2VEaGtSTEc4WmJYbFE5UE9EbnFvTmVT?=
 =?utf-8?B?MVdVb2RYMjljbFc4YmZYYWNtZU9EUDZXNzhwYmVvaG1yVTJJcnhQRGdVbXVJ?=
 =?utf-8?B?OHhEQUJwczlid3laNk8wVkNndHdTRGJkRTlQa1FxeHpuQ09JaE1sVHMwOUU1?=
 =?utf-8?B?UURCZWluUENxMTd1U1I1WHRGamttT0lEYnhUakpRamg2VlJOeHFyTFZRWlMr?=
 =?utf-8?B?SEp0TlduWFc5WHZUeERTbmxqSE1hMFVSL3dPbi9EdUxOc3ZUeVRKMndQMVdr?=
 =?utf-8?B?YVBqSm9MT0plRDVHNnV5VEd2UXRqbTNyZVh6Tk9QTENNZHRMZnFpUzU3N21V?=
 =?utf-8?B?SHFGTnpsa0dydnYvWGgrdmliSi9hK0t2cVZ0MFhHemxXTm8rWjFYb3lqeWdm?=
 =?utf-8?B?bjJ3dXlwMlBDTmN5YlR0TFh0dFJxTmorcSs2ejlCaXMvVnViYkxmZG8wcXlt?=
 =?utf-8?Q?M2DaNrje6hOsAQYE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8143e2-df00-42d0-fa94-08df1e2abac4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:08:18.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PVbvWkMONA3ViaFjHwAgei5vqOL9iPDce3AB31uVG/0czUIbWgTFJoufunudeTozlt8LhsdFtzZIY1vuCAe24gq8+DlFSwJ/toC624kyL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB7637

On 28/09/2026 11:26 pm, Sohil Mehta wrote:
> Update the minimum expected revisions of Intel microcode based on the
> microcode-20260512 (May 2026) release.
>
> Note, the three new entries are for INTEL_PANTHERLAKE_L steppings.
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
> ---
> v2:
>  - Fix a typo in the commit message.
> ---
>  .../kernel/cpu/microcode/intel-ucode-defs.h   | 91 ++++++++++---------
>  1 file changed, 47 insertions(+), 44 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h b/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
> index af8b1d8b26f6..7f463c85c5f8 100644
> --- a/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
> +++ b/arch/x86/kernel/cpu/microcode/intel-ucode-defs.h
> @@ -136,35 +136,35 @@
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x5f, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x3e },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x66, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x2a },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0xc0002f0 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0xd000410 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6c, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x10002e0 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6a, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0xd000421 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x6c, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x10002f1 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7a, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x42 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7a, .steppings = 0x0100, .platform_mask = 0x01, .driver_data = 0x26 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7e, .steppings = 0x0020, .platform_mask = 0x80, .driver_data = 0xca },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x7e, .steppings = 0x0020, .platform_mask = 0x80, .driver_data = 0xcc },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8a, .steppings = 0x0002, .platform_mask = 0x10, .driver_data = 0x33 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0xbc },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0004, .platform_mask = 0xc2, .driver_data = 0x3c },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8d, .steppings = 0x0002, .platform_mask = 0xc2, .driver_data = 0x56 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0xbe },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8c, .steppings = 0x0004, .platform_mask = 0xc2, .driver_data = 0x3e },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8d, .steppings = 0x0002, .platform_mask = 0xc2, .driver_data = 0x58 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0200, .platform_mask = 0x10, .driver_data = 0xf6 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0200, .platform_mask = 0xc0, .driver_data = 0xf6 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0400, .platform_mask = 0xc0, .driver_data = 0xf6 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x0800, .platform_mask = 0xd0, .driver_data = 0xf6 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8e, .steppings = 0x1000, .platform_mask = 0x94, .driver_data = 0x100 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x10, .driver_data = 0x2c000410 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x87, .driver_data = 0x2b000650 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x10, .driver_data = 0x2c000410 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0x2b000650 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x10, .driver_data = 0x2c000410 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0x2b000650 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0080, .platform_mask = 0x87, .driver_data = 0x2b000650 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x10, .driver_data = 0x2c000410 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x87, .driver_data = 0x2b000650 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x10, .driver_data = 0x2c000421 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0010, .platform_mask = 0x87, .driver_data = 0x2b000670 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x10, .driver_data = 0x2c000421 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0020, .platform_mask = 0x87, .driver_data = 0x2b000670 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x10, .driver_data = 0x2c000421 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0040, .platform_mask = 0x87, .driver_data = 0x2b000670 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0080, .platform_mask = 0x87, .driver_data = 0x2b000670 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x10, .driver_data = 0x2c000421 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x8f, .steppings = 0x0100, .platform_mask = 0x87, .driver_data = 0x2b000670 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x96, .steppings = 0x0002, .platform_mask = 0x01, .driver_data = 0x1a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x43a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x40, .driver_data = 0xb },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x80, .driver_data = 0x43a },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3e },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x97, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3e },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0008, .platform_mask = 0x80, .driver_data = 0x43b },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x40, .driver_data = 0xc },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9a, .steppings = 0x0010, .platform_mask = 0x80, .driver_data = 0x43b },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9c, .steppings = 0x0001, .platform_mask = 0x01, .driver_data = 0x24000026 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9e, .steppings = 0x0200, .platform_mask = 0x2a, .driver_data = 0xf8 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0x9e, .steppings = 0x0400, .platform_mask = 0x22, .driver_data = 0xfa },
> @@ -176,30 +176,33 @@
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa5, .steppings = 0x0020, .platform_mask = 0x22, .driver_data = 0x100 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa6, .steppings = 0x0001, .platform_mask = 0x80, .driver_data = 0x102 },
>  { .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa6, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0x100 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa7, .steppings = 0x0002, .platform_mask = 0x02, .driver_data = 0x64 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaa, .steppings = 0x0010, .platform_mask = 0xe6, .driver_data = 0x25 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x20, .driver_data = 0xa000124 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x95, .driver_data = 0x10003f0 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xae, .steppings = 0x0002, .platform_mask = 0x97, .driver_data = 0x1000273 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaf, .steppings = 0x0008, .platform_mask = 0x01, .driver_data = 0x3000382 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb5, .steppings = 0x0001, .platform_mask = 0x80, .driver_data = 0xa },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0002, .platform_mask = 0x32, .driver_data = 0x132 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xb7, .steppings = 0x0010, .platform_mask = 0x32, .driver_data = 0x132 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0004, .platform_mask = 0xe0, .driver_data = 0x6133 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0008, .platform_mask = 0xe0, .driver_data = 0x6133 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xba, .steppings = 0x0100, .platform_mask = 0xe0, .driver_data = 0x6133 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbd, .steppings = 0x0002, .platform_mask = 0x80, .driver_data = 0x125 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbe, .steppings = 0x0001, .platform_mask = 0x19, .driver_data = 0x1e },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0004, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0020, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0040, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xbf, .steppings = 0x0080, .platform_mask = 0x07, .driver_data = 0x3d },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc5, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xc6, .steppings = 0x0010, .platform_mask = 0x82, .driver_data = 0x11a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xca, .steppings = 0x0004, .platform_mask = 0x82, .driver_data = 0x11a },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0002, .platform_mask = 0x87, .driver_data = 0x210002c0 },
> -{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xcf, .steppings = 0x0004, .platform_mask = 0x87, .driver_data = 0x210002c0 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xa7, .steppings = 0x0002, .platform_mask = 0x02, .driver_data = 0x65 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaa, .steppings = 0x0010, .platform_mask = 0xe6, .driver_data = 0x28 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x20, .driver_data = 0xa000142 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xad, .steppings = 0x0002, .platform_mask = 0x95, .driver_data = 0x1000423 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xae, .steppings = 0x0002, .platform_mask = 0x97, .driver_data = 0x1000307 },
> +{ .flags = X86_CPU_ID_FLAG_ENTRY_VALID, .vendor = X86_VENDOR_INTEL, .family = 0x6, .model = 0xaf, .steppings = 0x0008, .platform_mask = 0x01, .driver_data = 0x30003a3 },

This a known-buggy SRF ucode.  The only reason there wasn't an explicit
retraction of it was because a newer IPU had already been published,
with 0x030003b2 being believed to be good again.

~Andrew
