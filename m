Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E32495AD9;
	Wed, 16 Sep 2026 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576595; cv=none; b=m3iJ2hDYGMOSf1Utidmuv4IP1v54LbAAYh4iCne85+OgHQfiDCAXvnCEDKRTrVIO0DdIPolx7hdZKuMbcoDf8mOw3G2i6E/ZXDTMfX+yGQ19OCnXjMg+LCMfyJzV5G6NCwcxk8/LRLtkyXk774crMW0X+Gg+goCU/AyXmfSYz0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576595; c=relaxed/simple;
	bh=oYWjuGfmsScBuyuYge615HZTDVtVowFTSdVdgEhSuco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNQJDzfxrnIGVTN3pB76fM7+1E/iY4vl7plcFl+JboTxBkEQ1dBWZtlUgBVjMXsDBONkbixbEBcZiXwPBxhemrJJbveVVY+8qoBvXkg3yxsl53pcfI7axSFfdW5CuDiuYtGRcKKuKgkJjiP+/6HGr/THPPUtuujtUqyvZEDsATU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ju+gWbwX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ju+gWbwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FA31F000FF;
	Wed, 16 Sep 2026 16:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576591;
	bh=8GlyS0oZ1bCDvCIMTDc0ytG9aomVaQDco52XarL/Zl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ju+gWbwXS7tKkHfOpLEK8Zgy2UBYvkqedpZlvxTaHSf1ylxOa/pZt/rrON4PKDWzG
	 rgCrGYX/B6Kfxqi6E37zvL04Db0Yej11CQhCgYF4V6xWsMgRZjC9Qd1G0rRTk36SQ5
	 SqlDkekOdDbuddJyB9QiMflQdMVGBdQGuYnVQ3h6VmU/Afr3sOoJiH05aAG/6/f95G
	 SPD7Wxt9RLAE1aolrLi2VLS8ooFA6OwGxtV6WtONh/iuQJc9GtBhAHshCJvJwp6Jgm
	 iz8z2dl5NBPSDCwZ71Ss1U7CNZg0g8/NJi/HwpG6dp5GazG9+/5dqcrD5kNipdjJ1s
	 VBt/yRpooxyIA==
Date: Wed, 16 Sep 2026 09:36:29 -0700
From: Oliver Upton <oupton@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Mark Brown <broonie@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
Message-ID: <aqrFjUIubjzjXYV0@kernel.org>
References: <aqqap3DngKznNrSA@sirena.org.uk>
 <aqqiAbgDmfQBLPTA@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqqiAbgDmfQBLPTA@google.com>

Hey,

On Wed, Sep 16, 2026 at 07:04:49AM -0700, Sean Christopherson wrote:
> On Wed, Sep 16, 2026, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the kvm-x86 tree, today's linux-next build
> > (arm64 kselftest) failed like this:
> > 
> > arm64/vgic_its_save.c: In function 'alloc_64k':
> > arm64/vgic_its_save.c:289:21: error: too many arguments to function
> > 'vm_phy_pages_alloc'
> >   289 |         gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
> >       |                     ^~~~~~~~~~~~~~~~~~
> > In file included from arm64/vgic_its_save.c:24:
> > include/kvm_util.h:1062:21: note: declared here
> >  1062 | static inline gpa_t vm_phy_pages_alloc(struct kvm_vm *vm, size_t nr_pages,
> >       |                     ^~~~~~~~~~~~~~~~~~
> > 
> > Caused by commits
> > 
> >   36a062568ea80 (KVM: selftests: Take the memory region type, not memslot, in page allocators)
> >   6c28a0d7cf125 (KVM: selftests: Automatically pick min_gpa for allocations based on region type)
> 
> In case anyone cares, I'm woefully behind on sending "thanks".  These came from
> the prep series for enabling PPC selftests.
> 
> https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com
> 
> > interacting with commit
> > 
> >   6f182db39fb00 (KVM: arm64: selftests: Add ITS table save tests)
> > 
> > from the kvm-arm tree.  I have applied the fixup below and can carry as
> > needed:
> 
> Given that this is in "fixes", I assume the new test will land in 7.3?  If so,
> this is mostly my problem to deal with when sending Paolo the selftests pull
> (which, FWIW, I'm hoping to do this week so that it can be used as the base for
> PPC selftests support). 

Yeah, aim here is to have the selftest go with the fix which I'll send to
Paolo this week. Sorry for the churn.

> diff --git a/tools/testing/selftests/kvm/arm64/vgic_its_save.c b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> index 864da01539f3..fae8a6c45f88 100644
> --- a/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> +++ b/tools/testing/selftests/kvm/arm64/vgic_its_save.c
> @@ -279,15 +279,15 @@ static void setup_memslot(size_t sz)
>  	size_t pages = sz / vm->page_size;
>  
>  	gpa_base = ((vm_compute_max_gfn(vm) + 1) * vm->page_size) - sz;
> -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, gpa_base,
> -				    TEST_MEMSLOT_INDEX, pages, 0);
> +	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
> +			       gpa_base, TEST_MEMSLOT_INDEX, pages);
>  }
>  
>  static gpa_t alloc_64k(size_t nr)
>  {
>  	size_t pages_per_64k = vm_calc_num_guest_pages(vm->mode, SZ_64K);
> -	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k, gpa_base,
> -				       TEST_MEMSLOT_INDEX);
> +	gpa_t gpa = vm_phy_pages_alloc(vm, nr * pages_per_64k,
> +				       MEM_REGION_TEST_EXTRA);
>  
>  	TEST_ASSERT(IS_ALIGNED(gpa, SZ_64K),
>  		    "Allocation at 0x%lx is not 64K aligned, GITS_BASER cannot address it",

LGTM

Thanks,
Oliver
