Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794473394;
	b=RGVe9guJcMpbIqjXnocE2ZcDxaoqYqAyQHfgB6Oewqsl0cv+8iFkoeqmzJCZ4NWC04GI
	 SgkGKNI+j7L6ceSjwT4xF3zOXtjEKkw4+wT9L3sqtVxi7S437kv0Ni35YVnkw8SoxIDGO
	 f8OAY7GtCscYWggAEBGuwdsR/Yqlj/S+wAQyTXOZMIjhQPlAxp8hmD/aOyfex7L/JXLxr
	 mo2ZfcxCH35PbtvXCXGmIsL1pOd82Y8AsgGTogL1o49/5oQrxHR6MelAIFdT61lkVtBMj
	 ltNrROLNUULnCe/KlV0L5CGPLu1o9E9VGykTgakvVXaM1bRS24geMzkSysniZMD3RGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473394;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=OGChezwGEAs5VmxdKN/i88B/dah14lbYLutkEhF0lOY=;
	b=CGQ68Zm+le1rKai4yVbxdo2gUPWWN3KY06fOaxkxNffHYfWKoGRucwd4AwgCuVB9v+7i
	 QSfPj90s/UV+/qHXEAKZ38cnKfJlEiN4H06ESYNHEKiKZrNMZfvqD5r2oET09B0VhtTSF
	 SkB5xK56QIrJTvg4IQcWmMMuwOuL6OdD0wGZMr52eNN2iaRy1p7gcOhWgwfzel3FNDLdp
	 2PX7xRu2UJJIUpVvpxs5i/fyjOhRv46MdVHw1iCKLXLPbFVSrh7YgOu5+djKWP0X8/BAK
	 RS8702bLl+E4gc4PgsDct+Uq2SDs1kK37NzcJVfPzbrBskAmB0U8TKG2A60K0uorDRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blR2ZZkc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A0606A8B6
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blR2ZZkc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7AE1F00A05;
	Thu, 12 Nov 2026 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473393;
	bh=OGChezwGEAs5VmxdKN/i88B/dah14lbYLutkEhF0lOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blR2ZZkcc/vDDO96F1pNxo2m29Sm1eEE58wpJKJVkHYo/oXT8bnVVxwZZly5gZt9q
	 WjKhsecawJUo7hwiLqoB1tVNvATaSKrnCQij9ms9i4j046DyigYLVgzKpPVW/Tm32u
	 DFsGgSAhvGZFpD7jZe6hMTEs8q6xFGpoAsvodr12hfkgt1d+rnYLrT4Zo91RMnmygO
	 0yruuXkzYrHRiuER+joOHfZNGA23QqvNVf/8ozCvJuVQ3b+UfYkf9kKtv/5ozkNjEA
	 SJWrIn3UVe4emvFMOq5MsjJhsAU82JyD7Ikm8arKDsaA71v1lyHUIdzvm0qEtUhFC4
	 NtcmR0wFZxi0g==
Date: Thu, 12 Nov 2026 10:49:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Chen Pei <cp0613@linux.alibaba.com>,
	George Guo <guodongtai@kylinos.cn>, Kexin Liu <liukexin@kylinos.cn>,
	Sourabh Jain <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
Message-ID: <avV9qoaPMBLCNOXD@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
 <990cc079-70ab-4fcf-9974-679aaf07849e@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <990cc079-70ab-4fcf-9974-679aaf07849e@redhat.com>

On Thu, Nov 12, 2026 at 12:02:05PM +0530, Mukesh Pilaniya wrote:
> Hi Mike,
> 
> On 04/11/26 10:20 pm, Mike Rapoport (Microsoft) wrote:
> > kexec_add_buffer() users may depend on the order in which memory holes are
> > searched. For instance, arm64 places the kernel bottom-up and then
> > requires the DTB to be above the kernel.
> > 
> > kho_walk_bootmem() walks the bootmem areas in the order they were
> > reserved, so if the kernel lands in a small area at the top of the memory
> > there is no room left for the DTB and kexec fails. For example, on an
> > arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
> > reserved first at the top of the memory, the kernel image takes most of
> > it and kexec fails with
> > 
> >   kexec_file(Image): Could not find any suitable kernel location!
> > 
> > Sort the bootmem areas by address and walk them in ascending order, or in
> > descending order for top-down searches, like kexec_walk_resources() does.
> > 
> > Fixes: 3bdecc3c93f9 ("kexec: add KHO support to kexec file loads")
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  kernel/liveupdate/kexec_handover.c | 57 ++++++++++++++++++++++++++++++--------
> >  1 file changed, 46 insertions(+), 11 deletions(-)
> > 
> > diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> > index 6f1f55fe31819..2ac5d94f33fd4 100644
> > --- a/kernel/liveupdate/kexec_handover.c
> > +++ b/kernel/liveupdate/kexec_handover.c
> > @@ -26,6 +26,7 @@
> >  #include <linux/list.h>
> >  #include <linux/memblock.h>
> >  #include <linux/page-isolation.h>
> > +#include <linux/sort.h>
> >  #include <linux/unaligned.h>
> >  #include <linux/vmalloc.h>
> >  
> > @@ -820,6 +821,14 @@ bool kho_bootmem_overlap(phys_addr_t phys, size_t size)
> >  	return false;
> >  }
> >  
> > +static int __init kho_bootmem_cmp(const void *_a, const void *_b)
> > +{
> > +	const struct kho_bootmem *a = _a;
> > +	const struct kho_bootmem *b = _b;
> > +
> > +	return cmp_int(a->addr, b->addr);
> > +}
> > +
> >  /**
> >   * kho_reserve_bootmem - Reserve a contiguous chunk of memory for kexec
> >   *
> > @@ -904,6 +913,9 @@ static void __init kho_reserve_bootmem(void)
> >  	 */
> >  	kho_bootmem_cnt = i;
> >  
> > +	sort(kho_bootmem, kho_bootmem_cnt, sizeof(*kho_bootmem),
> > +	     kho_bootmem_cmp, NULL);
> This only covers the case where this kernel allocated the areas itself.
> On a KHO boot the array comes from the previous kernel. A kernel with
> this series that is handed over from one without it therefore keeps
> walking the areas in reservation order for every following
> kexec_file_load, and the arm64 failure you describe comes back until the
> next cold boot and vise versa because the ABI string is still
> "kho-v4".

If we were able to kexec from a kernel with no reservation ordering, the
issue is not there, isn't it?

And after a cycle of KHO boots to newer kernels we anyway can get to the
point when bootmem is not large enough.
 
> > +static int kho_bootmem_walk_top_down(struct kexec_buf *kbuf,
> > +				     int (*func)(struct resource *, void *))
> >  {
> >  	int ret = 0;
> > -	int i;
> >  
> > -	for (i = 0; i < kho_bootmem_cnt; i++) {
> > -		struct resource res = {
> > -			.start = kho_bootmem[i].addr,
> > -			.end = kho_bootmem[i].addr + kho_bootmem[i].size - 1,
> > -		};
> > +	for (int i = kho_bootmem_cnt - 1; i >= 0; i--) {
>
> kho_bootmem_cnt is unsigned, but the reverse loops in
> kho_reserve_bootmem() and kho_bootmem_walk_top_down() start an int
> counter at kho_bootmem_cnt - 1, which for a zero count is UINT_MAX
> converted to int.  That conversion is implementation-defined; with the
> current compilers it yields -1 and the loop body is skipped.

We never get here with kho_bootmem_cnt == 0.
 
> How about using this one.
> 	for (unsigned int i = kho_bootmem_cnt; i-- > 0;)
> 
> Reviewed-by: Mukesh Pilaniya <mpilaniy@redhat.com>

Thanks!
 
> -- 
> Regards,
> Mukesh Pilaniya
> 

-- 
Sincerely yours,
Mike.
