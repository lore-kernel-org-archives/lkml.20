Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023096.outbound.protection.outlook.com [52.101.83.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618D3644BE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787829718; cv=fail; b=BDb1EspHypI8bm/zUldO/FaRIBWhtG45tmOeckmQTREjP7tatTWpNJBbt+pyQ1z1THAY/jR3BKuQQtuyyOZPP3Zgc0IBv2TXyRFt7TMq+z6B/KeGXKX63QouSrco82bZHv7vxeeu9IZ0HTPUk2GmwFC1Q1kvm7HZVyXexqoLucA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787829718; c=relaxed/simple;
	bh=VnnjR1xk2ci7ELPZaqD0kYH8H4+tvFeVExjWLdEoIaY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXwVCCasyB2zKa12AB+fnnqFmuf1EerKyuBwqyRMqUt5VkFnPFUyI5TPt+iqfbLGZXClgmSymlB4WV/ZAcC/SHc1v3+k1ieHOu90dfnFJjOiB22joIi1QbzJNZERckcWbEcRRZ04cYCqw/4kmzBkqinOhffx+ejOT8c+6p6C5n4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com; spf=pass smtp.mailfrom=codasip.com; dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b=i+jH8nFl; arc=fail smtp.client-ip=52.101.83.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=codasip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codasip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codasip.com header.i=@codasip.com header.b="i+jH8nFl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cD7rLIbmujYLEMA1DCIKbCpOS0WfjzSwYgFbwv6yaxQqGgIhHq6BkigRV9ONqAJbecgvsadKZWAcGatxNNXk0xTugDpkQZcHV4aLzmLrTgEfQtmIUgAst8/kI/9ZmdupTt6atq3lVE34eeoomrDzJDFZAUmlD9FoXqfzb5tyxbvvrwDwS14us2+xpIFxxLAT0/sanviz29P4TsJOQ+8PHYQ8D8HEeWChFiMNfsMqf/QBUrU9I8FF8cheVOTFv4qGkbD6fnTxxi+iW5UZMsU4/XNfmkycBYaH3peoZvp7i/tWL3HvK6XevC5ZE6fjjR6PoZR5UTZVmZxQWuzhFf4oMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8MnArjUx0HOdi0t72v2E2g9+msO687bRGIOLbx02n8=;
 b=SEBHa0vQJfv6FbUkUxWCHpVnUyCGYP1kAnx4tBV56jAL4xEYMdvdhv+4PDY8UzyQK41R139aYyI6Ci7oNp58MAfzWBciPDDIx8GkDjjKwlEHOPyo8ZMHzdN/H94m5woZefkusOQR3BXaEmuiQ133dS4C5YFikgUoGHaFzeqSAOcPDg1fFurMY9idO70dwKSLp9eCXAIxPNl4YLW0Kk17gnLzUT1nM4gbKuoIIzKZWBsp9Axui0m/sfKyGY3aoq8WrVDBxK7RfkOJpMx87APi1FmrzaoITs9s1YMTNlazlxvzFTFy5KZ8IkyH2Dnd87HyNSi6S1COvzj5WP9K3Js6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=codasip.com; dmarc=pass action=none header.from=codasip.com;
 dkim=pass header.d=codasip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codasip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8MnArjUx0HOdi0t72v2E2g9+msO687bRGIOLbx02n8=;
 b=i+jH8nFlfgeKJTDDcEdYlCrWR3+ZMb5DUiXRMxdpbbFmJZmjDHIkmngR48Dny3+Abaittc5uLD+mFN3w92wsL7uc1mSb0JlrGptWYKp3miyEPilgzPA+/UwGBXMlz6JqPF5v4neXrvmc75CPv3uVgUgodwggLN20l6+THKIFyIXEd9Bk1yVdaGcAnIkLv9cQDUE66LdjiUIL+Cw1ZP94zYciIFfQ+g2FX2GEvjQ/T2YUlc7eyP0fMUVVUCwdEsJNBxYk8wEVMf1uHbJwb9tT6NrGEJviAxgKYd5KJQ8AbYLagZZ3WLx01+MKnmm2KLEAyfyrW9SYfANdtVW+P/OujQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=codasip.com;
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1f4::5)
 by PAXP192MB1558.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:28e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Thu, 27 Aug
 2026 11:21:46 +0000
Received: from AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c]) by AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 ([fe80::f0e5:8465:302:9a9c%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 11:21:46 +0000
Message-ID: <babc7c19-8b33-425b-a872-1569e036c722@codasip.com>
Date: Thu, 27 Aug 2026 13:21:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: module: Use scope-based resource management for
 scratch buf
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Miaoqian Lin
 <linmq006@gmail.com>, Sean Chang <seanwascoding@gmail.com>,
 linux-riscv@lists.infradead.or, linux-kernel@vger.kernel.org
References: <20260512063359.713142-1-florian.schmaus@codasip.com>
Content-Language: en-US
From: Florian Schmaus <florian.schmaus@codasip.com>
In-Reply-To: <20260512063359.713142-1-florian.schmaus@codasip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR5P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f2::20) To AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:1f4::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB0983:EE_|PAXP192MB1558:EE_
X-MS-Office365-Filtering-Correlation-Id: 687587f2-1365-4833-403a-08df042d6142
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LbCb3E25SAlC9Cik4K+WXZNGa054SIbS+Yvv+AH9LHCUAl2o4ZCJBzDW3W+nR5KrafZgi9k68vqnp0IlJ/OAyOIkI5tZsu1k88AghVeQAYR8RJcQwrg0UIllYJRO4qupJYbogrGE+tGpdWvqEbl6bZFnb1Z1CTT1gQaEhWazZj2LbJSlYCCrSUc9rPCtZnphRljL1VDMGW3B+IoRd3rrOR5J7+P4wQTWYnUPzKOS4Idy57lkHQiYOwTr0pCjrmiNhS33p4b/DKSTkPbqqrF7GUgSgq2h2UyJzOpvk2dfDPCsJW3fzoWp4TULX1qndvOGPq4eKWcJgbVEbpT2pX6D8jdfxj8dxM0ePv9uAB+X6QpWzuGmvkPaT+jU22U1utuEMa8iQ62PYrRTryqiYccQA1B77JNp4PwA4HGmFTKVopu6PAuR1VTLgA5SjmaP1I++ZxDFlAoVIzwDmsL8G/Yx0uGZ8AVvYjsTHU9mkN/8Y1Cbi23anbPT2IcyZIUXooFfIb1caxVIuLoqZhH0ADJnMn9vfDDy1iAr0yjpkBo07EEI4MQdzeahogKzvMep1bK3FWUoga3cjd1jaBLHSVOwJZkhTFpP0oljZQ3vNUp6sRLe8BJIYi9d/VUfYslct/5372uF7FQD6n9xmf0eTeKQ6HZML/at4ScfqUr42BhByu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB0983.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWFDZGhrRXJ5OTRUWjcvQmZPdDF2K1ZnRWl0cWVmWGlvTjlLVm9PaG45UzZR?=
 =?utf-8?B?RTV2b1IydWVOaGZ4aWxqY3ZYcWFETHdIcGZFNSsyWVpOclhrUXhEajJPVDVC?=
 =?utf-8?B?dmUweEVtUk5SdjdMY1gyK2IrR0hxdEdrRFF3d0dIZ1JQVEkvb1F1RjdYOFd4?=
 =?utf-8?B?KzhSclNYKzNZbkpXb0xOVUErd044M0ZSN004aGpxNXBoWXozUldGbGVoekpl?=
 =?utf-8?B?dUJ1MG92TXFHSG1yTVZvbjAwdG01Q2QrcFp2WlMxOC9yU05PQVdQME5JMC8w?=
 =?utf-8?B?R24xZmZqT21lNHlYbkt1TUJSeUVkMklUVHpXMmdvVHBCY1VuN0VhWndKMTZi?=
 =?utf-8?B?WmR3RWRLVjJIaE1JSEN1QW1MZ3VUekhHQ1dsSFpjSElRRTNXUmJhUlBFNGky?=
 =?utf-8?B?b2tRNGVCV0hxNnVkYjhqUzFyU3IvZmI2OGp4a05WU2JzNEFnTis0SjlpT2Fm?=
 =?utf-8?B?Tm5jQW9xQzFNa3RML3ZSUlA5Q2x4WEZ2K1YweXYwdE0zTzZCMXJsSkROTnRv?=
 =?utf-8?B?RldoYzVuV2l0U1VOS2xTTytNUVhrdkN1bElKd2VPaDh5SllaTVdlTEUvT0t6?=
 =?utf-8?B?a1BEUFBIbTJJcVYrMHV0NExSY3FNdm1QbVJCcVdNSTA2ZXJyMnhITnI5RXUz?=
 =?utf-8?B?cUV5c0VKc09Dd1FDaUZDSWh2cnFYV2lmeSt0S0doTnRFUTl4Wkx3V1hIVzZP?=
 =?utf-8?B?WHNMVHlDeUZtZ0FBM0thQlB2SldxOXVKeGJaU1NlTXVOT05ENUJKVWtJY05X?=
 =?utf-8?B?UlN4L1pDL1VyK0pMeGZMeWVKbEU4TlNqMU1vbVZNcEMwcGhTWjU0dHdLbks5?=
 =?utf-8?B?WEFnYk9nUGxzZk1wNHJEY1hKWHhFVk1ibVNtSGNjUVhZaE4wWkVjbFFEK2hR?=
 =?utf-8?B?QTVUR01zZlZSeTJtQk1reVpxU2FKTXlwYnZ5ak5naGF1KzFMdTQzUkx2dC9p?=
 =?utf-8?B?UFZQTzl1dVEwQ3pVMVBkVWZSeDZLUGdaL3E3T2t5TnJNcHU4S2VBSkg5bEJU?=
 =?utf-8?B?QjliZUVSdmlSekV2UXNSaDJuUllkc3VYS3FoQnVKUjZ3RERhVkY1MTAraVNq?=
 =?utf-8?B?UmFJTGxaTHk1NHUzWThxVndKU2haUUtENUZCaEMralk4bFdkS1VCVS9XSWpP?=
 =?utf-8?B?czNVWVVtMkZqSjNPMzJrVElPTGRMdEVCMGhEVFF4UENKc1c2emFoOEQzbGNz?=
 =?utf-8?B?T29GdkkvYm51dEhoY2VYWVZIYmRiLzZMYVZBbHBjcXVMUWVMRGJnb1ZmR1Rt?=
 =?utf-8?B?eDFjZ3paTEd5bmN5bzJ0UGVNeXRVL0RuS0RDdzhPRHF0WVduWXpGaVg0RmlO?=
 =?utf-8?B?b3RTSXZFY1Y1em9saTVTVHBmcDdOd0gvTzdzOSsrOUFRVmg5TTg4VTBnT1Vq?=
 =?utf-8?B?WkFNUEljdDEvVXRVVFM4d20wUS8zbU1qL2Z4eXRzUkM0blRvRTcwemdoQ1Rk?=
 =?utf-8?B?WWk1bmJWeXQzK21SQWZrY1RPOW90RzEvd1NXOUR2OVA3UEpsTXVHTHRVOHFt?=
 =?utf-8?B?b0RNR25JeDhMTWEwSC9VWHp2OGFydkZaNEg2eXpTYkNHa0Q3eUhRRWdWTmhk?=
 =?utf-8?B?SWZDQklMMkZnMFIrQ3gvQ2JqOUo2TW9INUN0MURLVGI4a2RIbEJKeS9rSjVn?=
 =?utf-8?B?MDlzeFVNQ21pN0VJVWpiNlhZNWplMGk5V2lSNkE2ZFArUDhFUnhVZDB5dVdj?=
 =?utf-8?B?clJMSmVFTERFL2dOdjFQY2ZHN3k0Y2x1aUVxejB6YXNQOWovVjJ1SGdHcCsx?=
 =?utf-8?B?VytNeThmZWtIOFgzWlN0NElaQnY1ak1jQXdIdTRLaEZuTDB1bjBHNEp6WmJj?=
 =?utf-8?B?aVI0bVJvZHVLSllLOEJJVVVHT2VxSGdldjdnV3A2bm9qdlJjRTVpdGdQcElZ?=
 =?utf-8?B?N05NQUdiREwxVHNHQ29OT2pIdFVlNHZQYThYMzVjUW1neG4zMXIyRjJFcDBt?=
 =?utf-8?B?ZG84ZWRwMzlsNWVTd2ZuclRDRFFQc2pvTEF0emNVUWgyQkVZeUJpNEpaM2hY?=
 =?utf-8?B?cW5iMlZ5NXRQMENKdFJqbEQ2SlJHcWVoc0psa2FxL3VzV0RldXVVTDdMVmxr?=
 =?utf-8?B?ellpOTVHZjN1bFVrQXZuRmlpcXV0NmlWcmpsVEF5YkJIR3RNUkZMalJWRGFI?=
 =?utf-8?B?SlgyNmk4dEtQWFhMZG9JV2FoSTBOVGYxNEl4TTB0TnFndlREeEJVNTFIbG9G?=
 =?utf-8?B?b052aElVTi9oM0s0NUp4ZGVqSUtyWmtBNzgrZWxES2hqOWRKbkVROTdlTUNh?=
 =?utf-8?B?RDZsTytNZDd6T1V4QXF1M2RLMUE5a21YbXNab3pia2MzazEyVmlKT2lFMFRS?=
 =?utf-8?B?czlJeFk2blU2NEJOdXRlWHJPdWFBUWo1Q25nSjExdGtpM1VQejVsM0d5aGZh?=
 =?utf-8?Q?3sLFRdVfN5kSyGymD+yH91SSNCgI0kz1R2LNHErN8Btie?=
X-MS-Exchange-AntiSpam-MessageData-1: IWVtiBu20fLAWBYIxwcP+2Dd6wpl9qOT2GA=
X-OriginatorOrg: codasip.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 687587f2-1365-4833-403a-08df042d6142
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB0983.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 11:21:46.3981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d91ffef-bb81-4cbd-b9b8-552583685f20
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DG36TokhLJYJisWXj5k8lw2g9jQgwCVz6iu9Hrv94cT2Ar/h5PXv8zXN3aYcvwzv8xyeN8lzD1OVX3BYoPSsdfqHQLUU3Nkd2vvx42yuwRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP192MB1558

On 12/05/2026 08.33, Florian Schmaus wrote:
> The scratch buffer in module_frob_arch_sections() is currently managed
> manually, requiring explicit calls to kvfree().
> 
> Convert it to use scope-based resource management via the
> __free(kvfree) attribute. This automatically guarantees that the
> buffer is freed when it goes out of scope, preventing potential memory
> leaks. Most notably, it simplifies the kvrealloc() error path by
> removing the need to manually free the original buffer before
> returning -ENOMEM.
> 
> Signed-off-by: Florian Schmaus <florian.schmaus@codasip.com>
> ---
>   arch/riscv/kernel/module-sections.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
> index b3b11b7f7ed9..ed3be8be377e 100644
> --- a/arch/riscv/kernel/module-sections.c
> +++ b/arch/riscv/kernel/module-sections.c
> @@ -116,7 +116,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>   	size_t num_scratch_relas = 0;
>   	unsigned int num_plts = 0;
>   	unsigned int num_gots = 0;
> -	Elf_Rela *scratch = NULL;
> +	Elf_Rela *scratch __free(kvfree) = NULL;
>   	Elf_Rela *new_scratch;
>   	size_t scratch_size = 0;
>   	int i;
> @@ -168,10 +168,9 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>   		if (scratch_size_needed > scratch_size) {
>   			scratch_size = scratch_size_needed;
>   			new_scratch = kvrealloc(scratch, scratch_size, GFP_KERNEL);
> -			if (!new_scratch) {
> -				kvfree(scratch);
> +			if (!new_scratch)
>   				return -ENOMEM;
> -			}
> +
>   			scratch = new_scratch;
>   		}
>   
> @@ -184,7 +183,6 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
>   		/* sort the accumulated PLT/GOT relocations so duplicates are adjacent */
>   		sort(scratch, num_scratch_relas, sizeof(*scratch), cmp_rela, NULL);
>   		count_max_entries(scratch, num_scratch_relas, &num_plts, &num_gots);
> -		kvfree(scratch);
>   	}
>   
>   	mod->arch.plt.shdr->sh_type = SHT_NOBITS;

Friendly ping. Have the RISC-V maintainer had a chance to look at the 
patch? It's a minor cleanup.

Thanks!
  Florian
