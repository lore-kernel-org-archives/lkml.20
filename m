Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB49939936E
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792163789; cv=none; b=eXGKdwtLt+JXbL2PVgAaFll3wRmztCyvr++8NI4qW4ZV6YGe2PTthOqu4ELg0kxSGl66X/8C9lN70L/zJb9SuYHs6ZfLPL49LsYoyJKRU+1PV049WbyzAF0SmPXDfsjRzgkKEvEwWS4Mi1xhmnQqOeIIq7Epx79e0CZyPLtTQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792163789; c=relaxed/simple;
	bh=0T8nPoNMgOqdF7z5uPbMmSFDyOYIKAAk2QROrE337UI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tFzKP3P7looun5RmHOpz9dWfXK54xtSrNN0YLM8eXx4OUukRhQx4mqHn23X3JJI7MPcrx/VEIc2tJcDPPiN3jSs5EaMorQhEmdqs1Bm9oR2PK8i23yGVWSTFu6JrKbdc43XSZ5UzIw40trcpYHhMd6Q4+tGT+9+xqBtIhuoLd0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IK2mD0Ko; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IK2mD0Ko"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so115872a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792163787; x=1792768587; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kkz9qwzhE2sRNisNmhNGoIxw2/sntbeBAljOSEpieUM=;
        b=IK2mD0Kox/al9yh6kZC2rET+OcmdK6Eb4FJqNnZ3Y1EVtPIMIgE7orGo4mjY2JnieG
         A+aYFtl7nu627qIw4kwA3+YX6D6cq3Z9yC6YGueMRGLYG6RECL82+Hy3Gy2e6V2dakrU
         8/E3vo1GHiqtnqdibVMR5ZfTAHRKqlV1b2wrCGg54/AFih0fERsirG6zQe0f0LKAGE7c
         tVJtapFrxJeImB8vKvz3duKrDKLgtHPh4athoGTKLlCd6vRdtilDB+vIX6d4lQiLwjOS
         OPR/W6sxK7O7Dk0ZMPmlT5lEedSr0MrYgNFxls+SWvx+/yAnzMuDih/naw4t9UXUqrCy
         nbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792163787; x=1792768587;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kkz9qwzhE2sRNisNmhNGoIxw2/sntbeBAljOSEpieUM=;
        b=ha4q9onYlRhfZyrSBo175o7F5nGNFYqXemcI8tD/SE4d5z9hDrawmysEeQLmabdFmb
         SG2eX97a7HPg6R7g04gmI/2SC7gTsBY8HwFsCllOa7bZxbLZy94wCfbpFiwHUDsLOqZp
         aXFMp9EbbtDggM5uEJXmGznTaIkN/l+ZOF8PzXORBy4ovqMsbRhPQgz0CJyTl4r6vScS
         AIH8mE3CzlYliP+4UA2yDQBg6j60K5qQPkCJ5hHm/YYd5gweOyQLE2reMncHCZ12V4f3
         AcKgvIZwI9w0pgP79rb4yEn/peqHpVTY5+Ur+NZntAkIYFRG4WtCZ7Erv7ybkXoZwwG1
         95fA==
X-Forwarded-Encrypted: i=1; AKwUvBxOzCNxq2t/5mAW4K7u3EHTstNW0dVVz3R0c3EfHOR/vrUjdww70NxxibNqdHDdmaKXWaTif61HvmNCOSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnzVCc59oqCc7vr9T2fSOUlSVMZoyFChoU4htBTtDc85zYwj29
	1Tg6m8rhYYa3kSc+h5VOpv/KHZwrgM0bOe+b2uaX9ctwo/UV62C/gVofW0WrlIdEMcEzDton9P6
	7ZzQAsw==
X-Received: from pjyp8.prod.google.com ([2002:a17:90a:e708:b0:3a8:8e16:d986])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b90:b0:3a7:9045:fe29
 with SMTP id 98e67ed59e1d1-3acee2796e7mr161252a91.4.1792163786755; Fri, 16
 Oct 2026 08:16:26 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:16:26 -0700
In-Reply-To: <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <asP5xK4axiUk7jun@pcnci.linuxbox.cz> <aseMsMGpGPT/G548@pcnci.linuxbox.cz>
 <20261008182356.GBasffvDuTemTu1VUY@fat_crate.local> <20261009090042.39ba9c06@pumpkin>
 <aszH4vpXFAOQP1WG@pcnci.linuxbox.cz> <20261014235736.GCatAW8GD0GlYumL4l@fat_crate.local>
 <20261015172820.7961d2c0def74d41cc6c4b0c@linux-foundation.org>
 <20261016031242.GDatGWKo98YSOhEOOn@fat_crate.local> <20261015211832.45d87fab15bb3e0bbc2f47cb@linux-foundation.org>
 <20261016054954.GEatG7AgMNFRkiTo1H@fat_crate.local>
Message-ID: <atI_yuCc4BiweBQP@google.com>
Subject: Re: hunting memory corruption bug in 6.18.x
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nikola Ciprich <nikola.ciprich@linuxbox.cz>, 
	David Laight <david.laight.linux@gmail.com>, Rik van Riel <riel@surriel.com>, ljs@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, david@kernel.org, 
	Mike Rapoport <rppt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Pedro Falcato <pfalcato@suse.de>, Kiryl Shutsemau <kas@kernel.org>, luizcap@redhat.com, 
	pbonzini@redhat.com, Tal Zussman <tz2294@columbia.edu>, 
	Matt Fleming <matt@readmodwrite.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 15, 2026, Borislav Petkov wrote:
> On Thu, Oct 15, 2026 at 09:18:32PM -0700, Andrew Morton wrote:
> > The corruption patterns strongly resemble AMD VMCB state, particularly
> > FS/GS segment data appearing at the expected VMCB offsets in unrelated
> > host memory.
> 
> Aha, ok.
> 
> > This suggests that a VMSAVE operation may have written to
> > an incorrect physical address.  Ordinary KVM performs VMLOAD/VMSAVE
> > without nested virtualization, so Boris's objection doesn't eliminate
> > this possibility.  However, the relevant assembly is essentially
> > unchanged between 6.18.55 and 7.3-rc6, and I haven't identified a newer
> > commit that convincingly explains why the corruption apparently stopped
> > reproducing.  The earlier candidate 55780d8a1dcc remains poorly
> > motivated without evidence of nested virtualization.
> > 
> > Two investigations look worthwhile.  First, test 6.18.55 with both the
> > KVM TLB-flush fix (26505e1b5b54)
> 
> Pff, we've been looking at that one recently too, trying to figure out whether
> it was really necessary.
> 
> > and tlbi=ipi;
> 
> Yeah, we checked that, it ain't that.
> 
> > the existing results don't conclusively establish whether that combination
> > was tested.  Second, examine the vmcore to determine whether the corrupted
> > host pages contain complete FS/GS state matching a legitimate VMCB, rather
> > than merely a few matching values.  If they do, inspect the VMCB's
> > VMLOAD/VMSAVE interception and virtualization-enable bits.  That could
> > establish whether a hardware VMSAVE was allowed to write to an unintended
> > physical page.  The successful 7.3-rc6/rc7 testing is encouraging, but it
> > doesn't yet prove that all the reported corruption symptoms share one cause
> > or have been fixed.
> 
> Hmm. I guess looking at and around VMSAVE handling wouldn't hurt...

@Nikola, as very long long-shot, can you try running with the below?  I don't
expect it to help or flag anything, but this is eerily similar to a known bug[*]
where KVM writes to user memory in the wrong address space (wrong process) when
tearing down a VM after migrating the VM.  But that bug (well, bugs) only affects
Intel, and I don't see any similar patterns on the AMD side.

[*] https://lore.kernel.org/all/20261001202234.3794060-1-seanjc@google.com

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index df1d0cf769475..fc0ae4727793b 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -63,7 +63,7 @@ static void sgx_handle_emulation_failure(struct kvm_vcpu *vcpu, u64 addr,
 static int sgx_read_hva(struct kvm_vcpu *vcpu, unsigned long hva, void *data,
 			unsigned int size)
 {
-	if (__copy_from_user(data, (void __user *)hva, size)) {
+	if (kvm_copy_from_user(vcpu->kvm, data, (void __user *)hva, size)) {
 		sgx_handle_emulation_failure(vcpu, hva, size);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f65081330c8a4..2dec1463b596c 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3902,16 +3902,16 @@ static int init_rmode_tss(struct kvm *kvm, void __user *ua)
 	int i;
 
 	for (i = 0; i < 3; i++) {
-		if (__copy_to_user(ua + PAGE_SIZE * i, zero_page, PAGE_SIZE))
+		if (kvm_copy_to_user(kvm, ua + PAGE_SIZE * i, zero_page, PAGE_SIZE))
 			return -EFAULT;
 	}
 
 	data = TSS_BASE_SIZE + TSS_REDIRECTION_SIZE;
-	if (__copy_to_user(ua + TSS_IOPB_BASE_OFFSET, &data, sizeof(u16)))
+	if (kvm_copy_to_user(kvm, ua + TSS_IOPB_BASE_OFFSET, &data, sizeof(u16)))
 		return -EFAULT;
 
 	data = ~0;
-	if (__copy_to_user(ua + RMODE_TSS_SIZE - 1, &data, sizeof(u8)))
+	if (kvm_copy_to_user(kvm, ua + RMODE_TSS_SIZE - 1, &data, sizeof(u8)))
 		return -EFAULT;
 
 	return 0;
@@ -3946,7 +3946,7 @@ static int init_rmode_identity_map(struct kvm *kvm)
 	for (i = 0; i < (PAGE_SIZE / sizeof(tmp)); i++) {
 		tmp = (i << 22) + (_PAGE_PRESENT | _PAGE_RW | _PAGE_USER |
 			_PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_PSE);
-		if (__copy_to_user(uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
+		if (kvm_copy_to_user(kvm, uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
 			r = -EFAULT;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3c4e2401de072..13f44961e6e7d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1341,13 +1341,35 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 			      gpa_t gpa, unsigned long len);
 
+static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
+{
+	return !WARN_ON_ONCE(current->mm != kvm->mm ||
+			     !refcount_read(&kvm->users_count));
+}
+
+#define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)				\
+static __always_inline __must_check unsigned long kvm_##fn(struct kvm *kvm,		\
+							   void to_user *to,		\
+							   const void from_user *from,	\
+							   unsigned long n)		\
+{											\
+	if (!kvm_can_do_uaccess(kvm))							\
+		return n;								\
+											\
+	return __##fn(to, from, n);							\
+}
+BUILD_KVM_COPY_USER_WRAPPER(copy_from_user, , __user)
+BUILD_KVM_COPY_USER_WRAPPER(copy_from_user_inatomic, , __user)
+BUILD_KVM_COPY_USER_WRAPPER(copy_to_user, __user, )
+BUILD_KVM_COPY_USER_WRAPPER(copy_to_user_inatomic, __user, )
+
 #define __kvm_get_guest(kvm, gfn, offset, v)				\
 ({									\
 	unsigned long __addr = gfn_to_hva(kvm, gfn);			\
 	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
 	int __ret = -EFAULT;						\
 									\
-	if (!kvm_is_error_hva(__addr))					\
+	if (!kvm_is_error_hva(__addr) && kvm_can_do_uaccess(kvm))	\
 		__ret = get_user(v, __uaddr);				\
 	__ret;								\
 })
@@ -1367,7 +1389,7 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
 	int __ret = -EFAULT;						\
 									\
-	if (!kvm_is_error_hva(__addr))					\
+	if (!kvm_is_error_hva(__addr) && kvm_can_do_uaccess(kvm))	\
 		__ret = put_user(v, __uaddr);				\
 	if (!__ret)							\
 		mark_page_dirty(kvm, gfn);				\
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ba09b1dabc4b7..aa1564d41e7ff 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3207,8 +3207,8 @@ static int next_segment(unsigned long len, int offset)
 }
 
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
-static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
-				 void *data, int offset, int len)
+static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
+				 gfn_t gfn, void *data, int offset, int len)
 {
 	int r;
 	unsigned long addr;
@@ -3219,7 +3219,7 @@ static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
-	r = __copy_from_user(data, (void __user *)addr + offset, len);
+	r = kvm_copy_from_user(kvm, data, (void __user *)addr + offset, len);
 	if (r)
 		return -EFAULT;
 	return 0;
@@ -3230,7 +3230,7 @@ int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 {
 	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_read_guest_page);
 
@@ -3239,7 +3239,7 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(vcpu->kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_page);
 
@@ -3283,8 +3283,8 @@ int kvm_vcpu_read_guest(struct kvm_vcpu *vcpu, gpa_t gpa, void *data, unsigned l
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest);
 
-static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			           void *data, int offset, unsigned long len)
+static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot,
+				   gfn_t gfn, void *data, int offset, unsigned long len)
 {
 	int r;
 	unsigned long addr;
@@ -3296,7 +3296,7 @@ static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
 	pagefault_disable();
-	r = __copy_from_user_inatomic(data, (void __user *)addr + offset, len);
+	r = kvm_copy_from_user_inatomic(kvm, data, (void __user *)addr + offset, len);
 	pagefault_enable();
 	if (r)
 		return -EFAULT;
@@ -3310,7 +3310,7 @@ int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa,
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 	int offset = offset_in_page(gpa);
 
-	return __kvm_read_guest_atomic(slot, gfn, data, offset, len);
+	return __kvm_read_guest_atomic(vcpu->kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_atomic);
 
@@ -3328,7 +3328,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	addr = gfn_to_hva_memslot(memslot, gfn);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
-	r = __copy_to_user((void __user *)addr + offset, data, len);
+	r = kvm_copy_to_user(kvm, (void __user *)addr + offset, data, len);
 	if (r)
 		return -EFAULT;
 	mark_page_dirty_in_slot(kvm, memslot, gfn);
@@ -3466,7 +3466,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	if (unlikely(!ghc->memslot))
 		return kvm_write_guest(kvm, gpa, data, len);
 
-	r = __copy_to_user((void __user *)ghc->hva + offset, data, len);
+	r = kvm_copy_to_user(kvm, (void __user *)ghc->hva + offset, data, len);
 	if (r)
 		return -EFAULT;
 	mark_page_dirty_in_slot(kvm, ghc->memslot, gpa >> PAGE_SHIFT);
@@ -3504,7 +3504,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	if (unlikely(!ghc->memslot))
 		return kvm_read_guest(kvm, gpa, data, len);
 
-	r = __copy_from_user(data, (void __user *)ghc->hva + offset, len);
+	r = kvm_copy_from_user(kvm, data, (void __user *)ghc->hva + offset, len);
 	if (r)
 		return -EFAULT;

