Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465136;
	b=ysZ0R7hO2UQqBg/9WmRrTn7BRaNg9uoAR2PQEPgX6qX6jbCd1IoZ0w6/ssIR/9AblHej
	 yA0IysyacC9zFSbVd+Pos09TwR8LKuyKjDneLIW/ExSWa3z4BYzJEVKsCyQN3tggAtiF8
	 RnbsZt1jrN/UE8Jd1XqR+BqYK1fDEbnGgqKrt1nTTCJFQWX10Y9NXBp/xWbuayLzldIFL
	 PihXunWUhf4q1O2P93K9QErSU6RETTX+Z8+/V9XgKxy/WVWW7oQKBa29Y4pSJihIh2bRv
	 xDe0ngcfeYwGr3iHFsFaX3fJVTJTp/qanessbbyl+aTnEcE07ARv7LarLDdgzoSGyjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465136;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=lNjzCkgXtfexLjozyq2Y9l2D4DehQKcLgP4hhpEJaxk=;
	b=g6jnKQJ3jtj2lNs2RRhaohNC3YCTk6Dc/1UtuxP1NgOSdOKky4s1Odnr3TmxS8q21jvF
	 rZ7tGbg7b3IGnIHe5YADvMMkgRCzeQQlYWI7Es7WPzeldlbDH+s4m0uQFB2L5DY1R/YGr
	 gwyYjm452lHSLR2RY2AwGSG9/+qjNfuXOed6ymGvrXvGd1ImCdrncMJj5gDEtukwYtJmx
	 6H0sXL0BEklVGgeg3CUzdXX98NdWZOAzNQSXge5lU5NN722FuI8BY5z1OpF9xo4B5Zmad
	 YhQH1iMILXKWtDwG9+JuwVIUlsMfDCdJgtKgXLzbouaqCKmX3K/Mri/cPHmooCF5F5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EiRz0mJG;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m+B3CNLd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E76C606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E76C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EiRz0mJG;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m+B3CNLd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794465135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNjzCkgXtfexLjozyq2Y9l2D4DehQKcLgP4hhpEJaxk=;
	b=EiRz0mJGQCB3AlumGLarDCSSjb2e9Dg7ocBk+JVriOYSc4nhRmIwxTRCTOURxM1au2fyF4
	JM25U7uKtWRb0QwQ0Lc9ZUja/KA0/H3hSf9dMNaQsJkQ4DTrLzP+dm6ktyEWk12ySg23lG
	0FpmELz/sQIY7T8iO28PJm4FxhwOgBE=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-mg9vmDvENuSt2YQHy8UNTA-1; Thu, 12 Nov 2026 01:32:13 -0500
X-MC-Unique: mg9vmDvENuSt2YQHy8UNTA-1
X-Mimecast-MFC-AGG-ID: mg9vmDvENuSt2YQHy8UNTA_1794465132
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad91787a1aso2999773a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794465132; x=1795069932; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lNjzCkgXtfexLjozyq2Y9l2D4DehQKcLgP4hhpEJaxk=;
        b=m+B3CNLds7L1u7+hO8GwVfvo7SVNJPZ8zWnlgO2kFdkUI5HV5vdlei49PDGl/p0Sl6
         EwmMO3+EOLKuo/wE87sHx+gQ7wzYC1/SmsJfw6VmlPg27r4Jq/LfwaxeUBqFwpPaWKpY
         rh05IRvlmzGHTHRvX7W+LehoQFhbr3Y/MN44P1FAFh/kP7y+PcajOl/BKXcN4OgHWX+Z
         EfOkUndpWGsUsq3qHI+o/ZecT1e496qw9pG3o0K+0Jpx4SjRJs9BPmP3y02AQsZdPn08
         Fx5ykP+fu+YjuuUjFPZYtPZC2cm37lgWDxeahxzyzBFIHg5hGv1vv/AQS+Wa+SyAKzuf
         FVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465132; x=1795069932;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lNjzCkgXtfexLjozyq2Y9l2D4DehQKcLgP4hhpEJaxk=;
        b=p/KPXEzpNATw15y0FJ+gus/GB3JnufNCH4RsS3MKr7VVMEFgSGPJCWCXnf0HmXdOMj
         sljTZRTbBaekPLImrkwKINm2zn53MHeNiH6LUtmgLEuSuAXiNlxxyWKu6oifo7aEe2fP
         1K49qrEglsK9GcRESAhw7Oy8TTJAdKT3aDYjf2xsXcfB1uTg7rNSHNmo5dbkUmxi0gNG
         Lff+OKluY6DzybM4heaCKdbRLFxvmauaK+uW4jKwhM3to1IzDak1Lh+XrL3XltTY5bHA
         5AHSV8tnoXpOToiOYjRSkY6K5NgE6wkQRy2mkUNfNy3QG1iSLtwBiVMhFXWnDcXBmRhW
         pqIQ==
X-Forwarded-Encrypted: i=1; AL+hErHSzkidrLAYKVnXvfBAEsBAApn2cD0ushJGRRs/KAZ+nEQQ69YqSvLFlGKLvDdXL1j2W0y55w905Y+xqvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vDuiBwF+vzaphjgVXgK410+BviBI3TsYo8nLsxUXrClXoD5DD
	8iWmqq/7oJdk156Gyyey3n1UMNqixu3uHXd0CSznOVT038FBvX4mASd70TPeMyxuZ86udP7vtZU
	Fqsje8M8TVrPo74MyNc4LHO0wuI93udJTcgZ4MCRJH2QSK+JDoSNcUa95qhBZxrTb11atbjn8vw
	==
X-Gm-Gg: AYBFou1YsRf3YYHV3KNdgsqtdkxYAG3cEwlHqTypbmrRu3BpFq3mYBwI+aSc4hlSgq+
	MqSlmOfLQjbEKvHPk1BclSFUiYq6ezq+uVi3P/fRlXpQlJbx48sgXdJhwtYXFvCmyZNKDpKTzqL
	G/DQBBTpStq9g1AqbKddHyfu4KgUnCBjKuVNyrRrefbeeKuyCIyKAjUZAN3KymjLNc13ODleJGE
	pKLZKbpWHnD06K2Ad3sJsTfru3oOUr65kkxlvygrZ6xielpg0NlkUDl6EVhcMuGUVBnGzzOuFEV
	PkLoMgMtaUQ5N6VBR3S2zq7bdn5P1o/TSEanlaQABC2TONmS92lIwf6Wnb8UMO+ZqsWFPLptdb7
	unL9h62idYSYoRHZ9BpZ2bF8h5ctq9HMUEP7na5QjAHg6iiJwjkaJonFj+5u3AhbN/pwzY6X5wL
	XvM2wvynxEfOj2M1pKwEoU3mgcSjz5zecT0KCayVzZ83bgGQ==
X-Received: by 2002:a17:90b:37c3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b182ee2462mr4497394a91.37.1794465132353;
        Wed, 11 Nov 2026 22:32:12 -0800 (PST)
X-Received: by 2002:a17:90b:37c3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b182ee2462mr4497373a91.37.1794465131889;
        Wed, 11 Nov 2026 22:32:11 -0800 (PST)
Received: from ?IPV6:2001:4490:489d:4213:2481:b5a5:59e1:8f87? ([2001:4490:489d:4213:2481:b5a5:59e1:8f87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197ce49d6sm3019469a91.4.2026.11.11.22.32.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 22:32:11 -0800 (PST)
Message-ID: <990cc079-70ab-4fcf-9974-679aaf07849e@redhat.com>
Date: Thu, 12 Nov 2026 12:02:05 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Content-Language: en-US
From: Mukesh Pilaniya <mpilaniy@redhat.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mike,

On 04/11/26 10:20 pm, Mike Rapoport (Microsoft) wrote:
> kexec_add_buffer() users may depend on the order in which memory holes are
> searched. For instance, arm64 places the kernel bottom-up and then
> requires the DTB to be above the kernel.
> 
> kho_walk_bootmem() walks the bootmem areas in the order they were
> reserved, so if the kernel lands in a small area at the top of the memory
> there is no room left for the DTB and kexec fails. For example, on an
> arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
> reserved first at the top of the memory, the kernel image takes most of
> it and kexec fails with
> 
>   kexec_file(Image): Could not find any suitable kernel location!
> 
> Sort the bootmem areas by address and walk them in ascending order, or in
> descending order for top-down searches, like kexec_walk_resources() does.
> 
> Fixes: 3bdecc3c93f9 ("kexec: add KHO support to kexec file loads")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  kernel/liveupdate/kexec_handover.c | 57 ++++++++++++++++++++++++++++++--------
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe31819..2ac5d94f33fd4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -26,6 +26,7 @@
>  #include <linux/list.h>
>  #include <linux/memblock.h>
>  #include <linux/page-isolation.h>
> +#include <linux/sort.h>
>  #include <linux/unaligned.h>
>  #include <linux/vmalloc.h>
>  
> @@ -820,6 +821,14 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
>  	return false;
>  }
>  
> +static int __init kho_bootmem_cmp(const void *_a, const void *_b)
> +{
> +	const struct kho_bootmem *a = _a;
> +	const struct kho_bootmem *b = _b;
> +
> +	return cmp_int(a->addr, b->addr);
> +}
> +
>  /**
>   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
>   *
> @@ -904,6 +913,9 @@ static void __init kho_reserve_bootmem(void)
>  	 */
>  	kho_bootmem_cnt = i;
>  
> +	sort(kho_bootmem, kho_bootmem_cnt, sizeof(*kho_bootmem),
> +	     kho_bootmem_cmp, NULL);
This only covers the case where this kernel allocated the areas itself.
On a KHO boot the array comes from the previous kernel. A kernel with
this series that is handed over from one without it therefore keeps
walking the areas in reservation order for every following
kexec_file_load, and the arm64 failure you describe comes back until the
next cold boot and vise versa because the ABI string is still
"kho-v4".

So, sorting once in kho_memory_init_early after kho_bootmem is
mapped would make the invariant independent of the producer.  When the
previous kernel does have the sort this is a no-op, but the consumer
cannot tell which kernel recorded the array, because the ABI string is
the same.

> +
>  	return;
>  
>  err_free_bootmem_areas:
> @@ -2081,20 +2093,40 @@ int kho_fill_kimage(struct kimage *image)
>  	return 0;
>  }
>  
> -static int kho_walk_bootmem(struct kexec_buf *kbuf,
> -			    int (*func)(struct resource *, void *))
> +static int kho_bootmem_walk_one(struct kexec_buf *kbuf,
> +				const struct kho_bootmem *area,
> +				int (*func)(struct resource *, void *))
> +{
> +	struct resource res = {
> +		.start = area->addr,
> +		.end = area->addr + area->size - 1,
> +	};
> +
> +	/* Try to fit the kbuf into our KHO bootmem region */
> +	return func(&res, kbuf);
> +}
> +
> +static int kho_bootmem_walk_top_down(struct kexec_buf *kbuf,
> +				     int (*func)(struct resource *, void *))
>  {
>  	int ret = 0;
> -	int i;
>  
> -	for (i = 0; i < kho_bootmem_cnt; i++) {
> -		struct resource res = {
> -			.start = kho_bootmem[i].addr,
> -			.end = kho_bootmem[i].addr + kho_bootmem[i].size - 1,
> -		};
> +	for (int i = kho_bootmem_cnt - 1; i >= 0; i--) {
kho_bootmem_cnt is unsigned, but the reverse loops in
kho_reserve_bootmem() and kho_bootmem_walk_top_down() start an int
counter at kho_bootmem_cnt - 1, which for a zero count is UINT_MAX
converted to int.  That conversion is implementation-defined; with the
current compilers it yields -1 and the loop body is skipped.

How about using this one.
	for (unsigned int i = kho_bootmem_cnt; i-- > 0;)

Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

> +		ret = kho_bootmem_walk_one(kbuf, &kho_bootmem[i], func);
> +		if (ret)
> +			break;
> +	}
> +
> +	return ret;
> +}
>  
> -		/* Try to fit the kimage into our KHO bootmem region */
> -		ret = func(&res, kbuf);
> +static int kho_bootmem_walk_bottom_up(struct kexec_buf *kbuf,
> +				      int (*func)(struct resource *, void *))
> +{
> +	int ret = 0;
> +
> +	for (int i = 0; i < kho_bootmem_cnt; i++) {
> +		ret = kho_bootmem_walk_one(kbuf, &kho_bootmem[i], func);
>  		if (ret)
>  			break;
>  	}
> @@ -2110,7 +2142,10 @@ int kho_locate_mem_hole(struct kexec_buf *kbuf,
>  	if (!kho_enable || kbuf->image->type == KEXEC_TYPE_CRASH)
>  		return 1;
>  
> -	ret = kho_walk_bootmem(kbuf, func);
> +	if (kbuf->top_down)
> +		ret = kho_bootmem_walk_top_down(kbuf, func);
> +	else
> +		ret = kho_bootmem_walk_bottom_up(kbuf, func);
>  
>  	return ret == 1 ? 0 : -EADDRNOTAVAIL;
>  }
> 

-- 
Regards,
Mukesh Pilaniya

