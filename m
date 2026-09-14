Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CAE3B14B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384953; cv=none; b=TA1kdPI6keWpKTsfcD4ZWsTcFcnod/YnhL5UUEOguyIBzaLo6bwFxld4ravxAhqSHdc9EsvHKzBbSxPmVjS+ol8wdagG2W8WMmUk6FNVEBKfohmvilVQBXBsuAf45khvruDwkvfhpplqS4Y3+qgnCeXWbB/dxoYKpWQDNOxu8yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384953; c=relaxed/simple;
	bh=QQFSvxFWSgliUKfFMytDsbNvvxV+i6xT34GC/iP7I+8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=d/YQF6375B/X5qVjjICPcpik1WkmSvEOtiRtENLwJI7qiZDnS0v0o7a+z/6/4VWv8T6WSzoyDPZaSWjmylJYlcwjYAbAHTp/ZSin41UUwhRBCNs2Fq7Quip6c0fHetQshdA0Dcjh3IFj9h3v4LO1em5tQMEKGMCgUJxl7eoBgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=cy74yz1Y; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="cy74yz1Y"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=2ydmnqg3HzMcYUZI2KHG3VyDjXAqFDQPhoUDoniAetY=; b=cy74yz1Y2/+YbLAzf8335Y1wM1
	1qLgLIt0fU9HO16yeqOoAy75tO5s7AnypubeO87+oGmwMGKg6q/MUoFSq/tZGgTz3sgbEqxG4vc06
	zP5qqCPG2YgXWFEm/jscvjKnYZqQADeVQe6vHEZwKPPqvss9nk2fDZVgKLv8YLmEjIjHVWeRlSwW2
	WcYalKf39RPww+iHWTzwYX2w9xtZlPVx5pqbT5wAQEq6eQ1cloAxLY//PvcnaFRV8H/pR1T5tVApd
	0JemAXv1ZInZf4KodOETfh6hsN1r8ePc9cSgp/7sirQgvLogFgLm4GzTF7q6H4HXrK+Il1qrPcrRb
	rLAiSyAQ==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x64lG-001qu6-1K; Mon, 14 Sep 2026 13:22:09 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x64lE-005S9L-IM; Mon, 14 Sep 2026 13:22:09 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x64lE-00000001lBc-2bZU;
	Mon, 14 Sep 2026 13:22:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Sep 2026 08:22:08 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
In-Reply-To: <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
 <20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
Message-ID: <6113f06c790cfe1141d2dc09b68937b6@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-11 01:38, Borislav Petkov wrote:
> On Sat, Aug 22, 2026 at 03:33:20PM -0300, Mauricio Faria de Oliveira wrote:
>> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
>> index 82eddfa2347b32b76c2ea9b85f005ca5416ac71f..2d9f3d4d63de6e721f275d9e80d372edbdfedf30 100644
>> --- a/arch/x86/include/asm/cpuid/api.h
>> +++ b/arch/x86/include/asm/cpuid/api.h
>> @@ -204,7 +204,7 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>>  		 * from PVH early boot code before instrumentation is set up
>>  		 * and memcmp() itself may be instrumented.
>>  		 */
>> -		if (!__builtin_memcmp(sig, signature, 12) &&
>> +		if (!__inline_memcmp(sig, signature, 12) &&
> 
> Dunno, did you not think of simply doing it by foot and save yourself all
> those gymnastics in patches 1-3?

In the review of the original patchset (fixed by this series) it is
mentioned that a compiler might turn it into a memcmp() [1] -- and thus
revert back to the same issue.

[1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/

Thanks,

> 
> IOW, something like this totally untested thing below:
> 
> diff --git a/arch/x86/include/asm/cpuid/api.h b/arch/x86/include/asm/cpuid/api.h
> index 2d9f3d4d63de..a2db83d17940 100644
> --- a/arch/x86/include/asm/cpuid/api.h
> +++ b/arch/x86/include/asm/cpuid/api.h
> @@ -192,9 +192,10 @@ static __always_inline bool cpuid_function_is_indexed(u32 function)
>  #define for_each_possible_cpuid_base_hypervisor(function) \
>  	for (function = 0x40000000; function < 0x40010000; function += 0x100)
>  
> -static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
> +static inline u32 cpuid_base_hypervisor(const char *__sig, u32 leaves)
>  {
>  	u32 base, eax, signature[3];
> +	u32 *sig = (u32 *)__sig;
>  
>  	for_each_possible_cpuid_base_hypervisor(base) {
>  		cpuid(base, &eax, &signature[0], &signature[1], &signature[2]);
> @@ -204,9 +205,12 @@ static inline u32 cpuid_base_hypervisor(const char *sig, u32 leaves)
>  		 * from PVH early boot code before instrumentation is set up
>  		 * and memcmp() itself may be instrumented.
>  		 */
> -		if (!__inline_memcmp(sig, signature, 12) &&
> -		    (leaves == 0 || ((eax - base) >= leaves)))
> -			return base;
> +		if (sig[0] == signature[0] &&
> +		    sig[1] == signature[1] &&
> +		    sig[2] == signature[2]) {
> +			if (leaves == 0 || ((eax - base) >= leaves))
> +				return base;
> +		}
>  	}
>  
>  	return 0;

-- 
Mauricio
