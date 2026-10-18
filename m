Received: from gwu.lbox.cz (gwu.lbox.cz [62.245.111.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074622ECD32
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.245.111.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342421; cv=none; b=aX5L8C/ySl4YIsA2x8X3gNZw75mzaPkcaW1I+tCzWb3y+cyyhIxpgaeVe7dmRDYVQMtI9UzCEdJEQ71dcsJD818mZsBgqOBViBno00nU5IAN0NKh5/xgHlNtYqNxvtXGr7NIUhr0LsPy38/xMGEEPVCgqmJ0qwyXWwg/qvr24fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342421; c=relaxed/simple;
	bh=3Qs9VFBrfJ22fEFOqfmLKQ6ErQPr2LkSig1A1qurrcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAMIamrC2WkiCTXj2Mq7sBAPAlPEeujyfj+5yElu/166EYfvmvJB6iNfjnXcpuu5OlxVQKV5InB039W5WmwVb8DoklUEOSFnNDkuvbW7tu3JhMzfBfrj8x4TP8gRBJvs6eYzdZ5Bt7dyBOwaVM+W3WaJpBy2BLlaCjeMU9tTeuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz; spf=pass smtp.mailfrom=linuxbox.cz; dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b=JVessS2R; arc=none smtp.client-ip=62.245.111.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxbox.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxbox.cz header.i=@linuxbox.cz header.b="JVessS2R"
Received: from linuxbox.linuxbox.cz (linuxbox.linuxbox.cz [10.76.66.10])
	by gwu.lbox.cz (Sendmail) with ESMTPS id 69IGqanD1091127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 18 Oct 2026 18:52:36 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 gwu.lbox.cz 69IGqanD1091127
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxbox.cz;
	s=default; t=1792342357;
	bh=04K1XWtuV3X33sgYJ/vH8S9+3XQC8lVkjSB9505KyUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVessS2RxHUeJkGFl8SPVnWHq5IUr3hSCd38JkUfDYfgapnzTdu57hmkRCJk1DpSW
	 CThaGmZEjrXdXHTbV2K3MAyJcFLXW2+TMmjAlXnm/Bspn4GgP8Kjt6jD5E7zVp+ZTi
	 RnvbEeQQmcVdLdlDcGVt6ncxHjhBvGGl/JbDlmZQ=
Received: from pcnci.linuxbox.cz (pcnci.linuxbox.cz [10.76.3.14])
	by linuxbox.linuxbox.cz (Sendmail) with ESMTPS id 69IGqZiZ004275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 18 Oct 2026 18:52:35 +0200
Received: from pcnci.linuxbox.cz (localhost [127.0.0.1])
	by pcnci.linuxbox.cz (8.18.1/8.15.2) with ESMTPS id 69IGqTuU3136419
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 18 Oct 2026 18:52:31 +0200
Date: Sun, 18 Oct 2026 18:52:29 +0200
From: Nikola Ciprich <nikola.ciprich@linuxbox.cz>
To: Sean Christopherson <seanjc@google.com>
Cc: Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
        David Laight <david.laight.linux@gmail.com>,
        Rik van Riel <riel@surriel.com>, ljs@kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, david@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>,
        luizcap@redhat.com, pbonzini@redhat.com,
        Tal Zussman <tz2294@columbia.edu>,
        Matt Fleming <matt@readmodwrite.com>,
        Nikola Ciprich <nikola.ciprich@linuxbox.cz>
Subject: Re: hunting memory corruption bug in 6.18.x
Message-ID: <atT5TYyLapHO5ZoX@pcnci.linuxbox.cz>
References: <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local>
 <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz>
 <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local>
 <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
 <atI_yuCc4BiweBQP@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atI_yuCc4BiweBQP@google.com>
X-Scanned-By: MIMEDefang 3.7.1 on 10.76.66.3
X-Scanned-By: MIMEDefang v3.7.1/SpamAssassin v4.000002 on lbxovapx9 (nik)
X-Scanned-By: MIMEDefang 2.86 on 10.76.66.10
X-Antivirus: on lbxovapx9 by Antivirus 
X-Spam-Score: N/A (trusted relay)
X-Milter-Copy-Status: O


Hello Sean (and others),

I think I've finally found the (at least) one missing piece needed to reproduce
this. At first I wasn't paying much attention to nested virtualization, because
 we don't use it much (or so I thought), but I was still wondering why
 why all of this seems to be tied to Windows guests. So I dug into advanced
Windows security features and found out that newer Windows versions use
something called Virtualization-Based Security (VBS), which relies on
exactly that: SVM/VMX, i.e. nested virtualization. (I'm not a Windows guy,
so excuse my ignorance here.)

So I enabled Secure Boot as well as VBS on my lab test guests, checked
msinfo32 and tried migrating them and voilà, the guest crashed almost
immediately.

After a few more attempts, it looks pretty easy to reproduce: it usually
doesn't survive more than 3-5 migrations (often 1-2 are enough).

So far I've retested 7.3-rc7, and it seems to be rock solid (60 migrations
and no issues).

I'll give your patch a try, and if it doesn't help, I can try bisecting.
Now that I have a reliable reproducer, that should be doable.

I'll report back soon.

thanks,

nik

PS: of course this can still be something different that memory corruption
bug I'm hunting, but still it'll be worh backporting to LTS 6.18.


On Fri, Oct 16, 2026 at 08:16:26AM -0700, Sean Christopherson wrote:
> On Thu, Oct 15, 2026, Borislav Petkov wrote:
> > On Thu, Oct 15, 2026 at 09:18:32PM -0700, Andrew Morton wrote:
> > > The corruption patterns strongly resemble AMD VMCB state, particularly
> > > FS/GS segment data appearing at the expected VMCB offsets in unrelated
> > > host memory.
> > 
> > Aha, ok.
> > 
> > > This suggests that a VMSAVE operation may have written to
> > > an incorrect physical address.  Ordinary KVM performs VMLOAD/VMSAVE
> > > without nested virtualization, so Boris's objection doesn't eliminate
> > > this possibility.  However, the relevant assembly is essentially
> > > unchanged between 6.18.55 and 7.3-rc6, and I haven't identified a newer
> > > commit that convincingly explains why the corruption apparently stopped
> > > reproducing.  The earlier candidate 55780d8a1dcc remains poorly
> > > motivated without evidence of nested virtualization.
> > > 
> > > Two investigations look worthwhile.  First, test 6.18.55 with both the
> > > KVM TLB-flush fix (26505e1b5b54)
> > 
> > Pff, we've been looking at that one recently too, trying to figure out whether
> > it was really necessary.
> > 
> > > and tlbi=ipi;
> > 
> > Yeah, we checked that, it ain't that.
> > 
> > > the existing results don't conclusively establish whether that combination
> > > was tested.  Second, examine the vmcore to determine whether the corrupted
> > > host pages contain complete FS/GS state matching a legitimate VMCB, rather
> > > than merely a few matching values.  If they do, inspect the VMCB's
> > > VMLOAD/VMSAVE interception and virtualization-enable bits.  That could
> > > establish whether a hardware VMSAVE was allowed to write to an unintended
> > > physical page.  The successful 7.3-rc6/rc7 testing is encouraging, but it
> > > doesn't yet prove that all the reported corruption symptoms share one cause
> > > or have been fixed.
> > 
> > Hmm. I guess looking at and around VMSAVE handling wouldn't hurt...
> 
> @Nikola, as very long long-shot, can you try running with the below?  I don't
> expect it to help or flag anything, but this is eerily similar to a known bug[*]
> where KVM writes to user memory in the wrong address space (wrong process) when
> tearing down a VM after migrating the VM.  But that bug (well, bugs) only affects
> Intel, and I don't see any similar patterns on the AMD side.
> 
> [*] https://lore.kernel.org/all/20261001202234.3794060-1-seanjc@google.com
> 
> diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
> index df1d0cf769475..fc0ae4727793b 100644
> --- a/arch/x86/kvm/vmx/sgx.c
> +++ b/arch/x86/kvm/vmx/sgx.c
> @@ -63,7 +63,7 @@ static void sgx_handle_emulation_failure(struct kvm_vcpu *vcpu, u64 addr,
>  static int sgx_read_hva(struct kvm_vcpu *vcpu, unsigned long hva, void *data,
>  			unsigned int size)
>  {
> -	if (__copy_from_user(data, (void __user *)hva, size)) {
> +	if (kvm_copy_from_user(vcpu->kvm, data, (void __user *)hva, size)) {
>  		sgx_handle_emulation_failure(vcpu, hva, size);
>  		return -EFAULT;
>  	}
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index f65081330c8a4..2dec1463b596c 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -3902,16 +3902,16 @@ static int init_rmode_tss(struct kvm *kvm, void __user *ua)
>  	int i;
>  
>  	for (i = 0; i < 3; i++) {
> -		if (__copy_to_user(ua + PAGE_SIZE * i, zero_page, PAGE_SIZE))
> +		if (kvm_copy_to_user(kvm, ua + PAGE_SIZE * i, zero_page, PAGE_SIZE))
>  			return -EFAULT;
>  	}
>  
>  	data = TSS_BASE_SIZE + TSS_REDIRECTION_SIZE;
> -	if (__copy_to_user(ua + TSS_IOPB_BASE_OFFSET, &data, sizeof(u16)))
> +	if (kvm_copy_to_user(kvm, ua + TSS_IOPB_BASE_OFFSET, &data, sizeof(u16)))
>  		return -EFAULT;
>  
>  	data = ~0;
> -	if (__copy_to_user(ua + RMODE_TSS_SIZE - 1, &data, sizeof(u8)))
> +	if (kvm_copy_to_user(kvm, ua + RMODE_TSS_SIZE - 1, &data, sizeof(u8)))
>  		return -EFAULT;
>  
>  	return 0;
> @@ -3946,7 +3946,7 @@ static int init_rmode_identity_map(struct kvm *kvm)
>  	for (i = 0; i < (PAGE_SIZE / sizeof(tmp)); i++) {
>  		tmp = (i << 22) + (_PAGE_PRESENT | _PAGE_RW | _PAGE_USER |
>  			_PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_PSE);
> -		if (__copy_to_user(uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
> +		if (kvm_copy_to_user(kvm, uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
>  			r = -EFAULT;
>  			goto out;
>  		}
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3c4e2401de072..13f44961e6e7d 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1341,13 +1341,35 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
>  int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
>  			      gpa_t gpa, unsigned long len);
>  
> +static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
> +{
> +	return !WARN_ON_ONCE(current->mm != kvm->mm ||
> +			     !refcount_read(&kvm->users_count));
> +}
> +
> +#define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)				\
> +static __always_inline __must_check unsigned long kvm_##fn(struct kvm *kvm,		\
> +							   void to_user *to,		\
> +							   const void from_user *from,	\
> +							   unsigned long n)		\
> +{											\
> +	if (!kvm_can_do_uaccess(kvm))							\
> +		return n;								\
> +											\
> +	return __##fn(to, from, n);							\
> +}
> +BUILD_KVM_COPY_USER_WRAPPER(copy_from_user, , __user)
> +BUILD_KVM_COPY_USER_WRAPPER(copy_from_user_inatomic, , __user)
> +BUILD_KVM_COPY_USER_WRAPPER(copy_to_user, __user, )
> +BUILD_KVM_COPY_USER_WRAPPER(copy_to_user_inatomic, __user, )
> +
>  #define __kvm_get_guest(kvm, gfn, offset, v)				\
>  ({									\
>  	unsigned long __addr = gfn_to_hva(kvm, gfn);			\
>  	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
>  	int __ret = -EFAULT;						\
>  									\
> -	if (!kvm_is_error_hva(__addr))					\
> +	if (!kvm_is_error_hva(__addr) && kvm_can_do_uaccess(kvm))	\
>  		__ret = get_user(v, __uaddr);				\
>  	__ret;								\
>  })
> @@ -1367,7 +1389,7 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
>  	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
>  	int __ret = -EFAULT;						\
>  									\
> -	if (!kvm_is_error_hva(__addr))					\
> +	if (!kvm_is_error_hva(__addr) && kvm_can_do_uaccess(kvm))	\
>  		__ret = put_user(v, __uaddr);				\
>  	if (!__ret)							\
>  		mark_page_dirty(kvm, gfn);				\
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index ba09b1dabc4b7..aa1564d41e7ff 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3207,8 +3207,8 @@ static int next_segment(unsigned long len, int offset)
>  }
>  
>  /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
> -static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
> -				 void *data, int offset, int len)
> +static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
> +				 gfn_t gfn, void *data, int offset, int len)
>  {
>  	int r;
>  	unsigned long addr;
> @@ -3219,7 +3219,7 @@ static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
>  	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
>  	if (kvm_is_error_hva(addr))
>  		return -EFAULT;
> -	r = __copy_from_user(data, (void __user *)addr + offset, len);
> +	r = kvm_copy_from_user(kvm, data, (void __user *)addr + offset, len);
>  	if (r)
>  		return -EFAULT;
>  	return 0;
> @@ -3230,7 +3230,7 @@ int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
>  {
>  	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>  
> -	return __kvm_read_guest_page(slot, gfn, data, offset, len);
> +	return __kvm_read_guest_page(kvm, slot, gfn, data, offset, len);
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_read_guest_page);
>  
> @@ -3239,7 +3239,7 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
>  {
>  	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
>  
> -	return __kvm_read_guest_page(slot, gfn, data, offset, len);
> +	return __kvm_read_guest_page(vcpu->kvm, slot, gfn, data, offset, len);
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_page);
>  
> @@ -3283,8 +3283,8 @@ int kvm_vcpu_read_guest(struct kvm_vcpu *vcpu, gpa_t gpa, void *data, unsigned l
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest);
>  
> -static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
> -			           void *data, int offset, unsigned long len)
> +static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot,
> +				   gfn_t gfn, void *data, int offset, unsigned long len)
>  {
>  	int r;
>  	unsigned long addr;
> @@ -3296,7 +3296,7 @@ static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
>  	if (kvm_is_error_hva(addr))
>  		return -EFAULT;
>  	pagefault_disable();
> -	r = __copy_from_user_inatomic(data, (void __user *)addr + offset, len);
> +	r = kvm_copy_from_user_inatomic(kvm, data, (void __user *)addr + offset, len);
>  	pagefault_enable();
>  	if (r)
>  		return -EFAULT;
> @@ -3310,7 +3310,7 @@ int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa,
>  	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
>  	int offset = offset_in_page(gpa);
>  
> -	return __kvm_read_guest_atomic(slot, gfn, data, offset, len);
> +	return __kvm_read_guest_atomic(vcpu->kvm, slot, gfn, data, offset, len);
>  }
>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_atomic);
>  
> @@ -3328,7 +3328,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
>  	addr = gfn_to_hva_memslot(memslot, gfn);
>  	if (kvm_is_error_hva(addr))
>  		return -EFAULT;
> -	r = __copy_to_user((void __user *)addr + offset, data, len);
> +	r = kvm_copy_to_user(kvm, (void __user *)addr + offset, data, len);
>  	if (r)
>  		return -EFAULT;
>  	mark_page_dirty_in_slot(kvm, memslot, gfn);
> @@ -3466,7 +3466,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
>  	if (unlikely(!ghc->memslot))
>  		return kvm_write_guest(kvm, gpa, data, len);
>  
> -	r = __copy_to_user((void __user *)ghc->hva + offset, data, len);
> +	r = kvm_copy_to_user(kvm, (void __user *)ghc->hva + offset, data, len);
>  	if (r)
>  		return -EFAULT;
>  	mark_page_dirty_in_slot(kvm, ghc->memslot, gpa >> PAGE_SHIFT);
> @@ -3504,7 +3504,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
>  	if (unlikely(!ghc->memslot))
>  		return kvm_read_guest(kvm, gpa, data, len);
>  
> -	r = __copy_from_user(data, (void __user *)ghc->hva + offset, len);
> +	r = kvm_copy_from_user(kvm, data, (void __user *)ghc->hva + offset, len);
>  	if (r)
>  		return -EFAULT;
> 

-- 
Ing. Nikola CIPRICH
technický ředitel

+420 591 166 214
+420 777 093 799
nikola.ciprich@linuxbox.cz

www.linuxbox.cz
