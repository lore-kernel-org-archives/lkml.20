Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395275;
	b=b6dijDoRdmnMF7d//8Wv0NlHteDxbnNPPS0dx/ohy6tYWX/ylFAWSPGB8vq2gjXCs1F4
	 UdY+kaCVNc2MsRa1VIcIIUoxYDdVWmKS3EMU3HYP2Eb1O1RGez5Jqq9wYyTiLqraLWCRM
	 zlUkwF8UgZ/iFEe1ojLk8LSZnlcLrvHv3mGDGrAtt8VgA35zPXoiYPh5BO9vTq8izM2r3
	 DbFFVm6BNvNCj3bDvdm5wu/1oIYfVspaZk1Ua8UIDXtOdo6VP5PfrwQERycnXc/IEFTS/
	 AmPDGj8q1c/nHxQeBmz1/c8GcTvzJUDgxZjcDGoZFfb8x7T50v9LEuo50hEtcRZquvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=pEIWclQ1SBWM1+Z99wz5ixAlhPbNjur+F04EjDXrB30=;
	b=JeniRxCSqEheAw2yVK1pANR3XANhYj+4EqJQOOHJ/9k76Z1XbShRgx5++2h0t2KbEHeW
	 ASEO+RROQsxa3PCk9E8xSNGmnr54gmsQRjjmErbF8sMcIuU2IDm52s/RS6E+HNAr2pKSA
	 XPTMLRPDBoSQcTMvZso8JVVrDgjMtLCbNEwI+di9H8ZXYxIl92UBtTj5pdr1zPfPgBy3e
	 x7Bnc6bZx92e2LpmyqQu92mrlPYB3aNc7LEbboMBW3xrL5+hLh7YS0hzZJYhyxngGW2nB
	 CXyR/W4ntEgzAox/aADFMqk+p1c1eKHoWYIaPpT2JDcreIP+lMxZ0kqecaB8u8q9eIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=apEroW3T;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59317606B781
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59317606B781
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=apEroW3T
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eaae62796dso14056855ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395275; x=1794000075; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pEIWclQ1SBWM1+Z99wz5ixAlhPbNjur+F04EjDXrB30=;
        b=apEroW3Tuf7Lr3cANdWj+bZxjfUo5jt7RlUvH4ZaSLxkphS+VeIk7L3nTk1m4YjYN5
         iRYhsa7L1G5RkBSyAQcGp0NLmltwQW4FGC/Ybu5AfJfrC/nbW+JIjNlyluDcgZJC6lLK
         2ionylqkfF2WfCokTZZ/mC4HX2Deb25YPDnctwP8IunxNDBe19JpXAHl7r8q7PTUVIZO
         4/g9BZ9xHEoT6kQTJpL+aifrDpQsn865TUCeQ6jEybR65gLdsAHGdKhDwqAss0Eo3h1A
         GkHGaKwLoK8RTeIViG4IG8ExbH01QcyarIaKU4QtP78xMi76Ri/k5BUPmQK2aGy3vjCd
         /Huw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395275; x=1794000075;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pEIWclQ1SBWM1+Z99wz5ixAlhPbNjur+F04EjDXrB30=;
        b=q6TP98EfH6M6+tbFfHIvnaeEnuiVoNWnDndyaIfsQywCxlg+KHhkdsFWnekbdCXwGP
         rDe3TjliAAzfvkvTu5W3AL55z9vcF5/kj+7TlKFzPRXoINqsvZZf+mPa4gFj3eA4Q8HK
         dD0G0G5Qo4SFWGfxQpPGPTibvJs+KGLnVbJqvAsGRtzdH2GhQLm4EivBJLaDGtbnxjZn
         ZhdI4wicfn4cfB5GM1fGyAKcHb5qCYhWy3iWeznx9ERHkzNB20LLvvPsUjAgzaK+tB2L
         /dtUiL9mI8to6L74OO4GUikqxCPhj/n9fnV5rxOQYQJ+d7OLz4oRba7jnlvCC3tZ0oZG
         Et1Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4tc5q9uGqVDlFMu2vHEOKllc7bvRYFwDTeRzRk/z86VKLgPzWiM3sbutMk2cCqvkEPzz/kQ1VAQasvcA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeuqwBkXSuX0snZr7Iq/1FxyD9BbMIcJevA5D5ndnCMz17aJxp
	jGrK9Z2B1dkgpDGreGemv9UmPG3ij69UdHwnyHhGUGUgZO4jVrPWj74bQVtbyiOEusW4UCSe5DN
	xU8tJ7g==
X-Received: from plhu11.prod.google.com ([2002:a17:903:124b:b0:2e9:fe74:4523])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50a:b0:2e2:de8e:7315
 with SMTP id d9443c01a7336-2eb364b6214mr32078575ad.38.1793395274491; Fri, 30
 Oct 2026 14:21:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:49 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-2-seanjc@google.com>
Subject: [PATCH v4 01/23] KVM: Reject user accesses to guest memory if
 current->mm != kvm->mm
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Reject user accesses to guest memory, which are supposed to be done only
in the context of KVM_RUN or similar operations, if the current address
space is not the VM's (host userspace) address space.  If KVM writes to
guest memory after the owning host process has exited, or if the VM is
being destroyed in the context of a different process, then writing using
the wrong address space will corrupt a different process' memory.

Reject the access but don't WARN() or KVM_BUG_ON() event though attempting
to access guest memory with a mismatched address space is a blatant KVM
bug, because unfortunately KVM is buggy.  On KVM VMX, when a vCPU is
destroyed while L2 is active, KVM synthesizes a nested VM-Exit to force the
vCPU out of L2 in order to free the nested VMX assets, and a side effect of
a nested VM-Exit is that it flushes the cached shadow VMCS12 back to guest
memory:

  vmx_vcpu_free()
  |-> nested_vmx_free_vcpu()
      |-> vmx_leave_nested()
          |-> nested_vmx_vmexit(vcpu, -1, 0, 0)
              |-> nested_flush_cached_shadow_vmcs12()
                  |-> kvm_write_guest_cached()
                      |-> __copy_to_user(ghc->hva, ...)

Fix the bug broadly even though the "real" bug is that KVM abuses the
nested VM-Exit flow for non-architectural purposes, as there may be other
such violations lurking.  For now, punt on fixing individual bugs and
hardening the common flows, e.g. with WARNs.

Opportunistically provide wrappers in anticipation of adding more checks
and hardening, i.e. growing the logic beyond checking current->mm.

Fixes: 61ada7488ffd ("KVM: nVMX: Cache shadow vmcs12 on VMEntry and flush to memory on VMExit")
Cc: stable@vger.kernel.org
Reported-by: Jim Mattson <jmattson@google.com>
Closes: https://lore.kernel.org/all/20260908132838.2116068-1-jmattson@google.com
Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/sgx.c   |  2 +-
 arch/x86/kvm/vmx/vmx.c   |  8 ++++----
 include/linux/kvm_host.h | 25 +++++++++++++++++++++++--
 virt/kvm/kvm_main.c      | 24 ++++++++++++------------
 4 files changed, 40 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kvm/vmx/sgx.c b/arch/x86/kvm/vmx/sgx.c
index 771c75a58343..52a6d0f8bb9e 100644
--- a/arch/x86/kvm/vmx/sgx.c
+++ b/arch/x86/kvm/vmx/sgx.c
@@ -64,7 +64,7 @@ static void sgx_handle_emulation_failure(struct kvm_vcpu *vcpu, u64 addr,
 static int sgx_read_hva(struct kvm_vcpu *vcpu, unsigned long hva, void *data,
 			unsigned int size)
 {
-	if (__copy_from_user(data, (void __user *)hva, size)) {
+	if (kvm_copy_from_user(vcpu->kvm, data, (void __user *)hva, size)) {
 		sgx_handle_emulation_failure(vcpu, hva, size);
 		return -EFAULT;
 	}
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b341af4c6057..d433cd846ac4 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4021,16 +4021,16 @@ static int init_rmode_tss(struct kvm *kvm, void __user *ua)
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
@@ -4065,7 +4065,7 @@ static int init_rmode_identity_map(struct kvm *kvm)
 	for (i = 0; i < (PAGE_SIZE / sizeof(tmp)); i++) {
 		tmp = (i << 22) + (_PAGE_PRESENT | _PAGE_RW | _PAGE_USER |
 			_PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_PSE);
-		if (__copy_to_user(uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
+		if (kvm_copy_to_user(kvm, uaddr + i * sizeof(tmp), &tmp, sizeof(tmp))) {
 			r = -EFAULT;
 			goto out;
 		}
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index e7fc94e2910a..be27b4e8f12d 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1353,13 +1353,34 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 			      gpa_t gpa, unsigned long len);
 
+static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
+{
+	return current->mm == kvm->mm;
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
@@ -1379,7 +1400,7 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
 	int __ret = -EFAULT;						\
 									\
-	if (!kvm_is_error_hva(__addr))					\
+	if (!kvm_is_error_hva(__addr) && kvm_can_do_uaccess(kvm))	\
 		__ret = put_user(v, __uaddr);				\
 	if (!__ret)							\
 		mark_page_dirty(kvm, gfn);				\
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index cf4cb586f140..218456372b11 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3279,8 +3279,8 @@ static int next_segment(unsigned long len, int offset)
 }
 
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
-static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
-				 void *data, int offset, int len)
+static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
+				 gfn_t gfn, void *data, int offset, int len)
 {
 	int r;
 	unsigned long addr;
@@ -3291,7 +3291,7 @@ static int __kvm_read_guest_page(struct kvm_memory_slot *slot, gfn_t gfn,
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
-	r = __copy_from_user(data, (void __user *)addr + offset, len);
+	r = kvm_copy_from_user(kvm, data, (void __user *)addr + offset, len);
 	if (r)
 		return -EFAULT;
 	return 0;
@@ -3302,7 +3302,7 @@ int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 {
 	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_read_guest_page);
 
@@ -3311,7 +3311,7 @@ int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data,
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 
-	return __kvm_read_guest_page(slot, gfn, data, offset, len);
+	return __kvm_read_guest_page(vcpu->kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_page);
 
@@ -3355,8 +3355,8 @@ int kvm_vcpu_read_guest(struct kvm_vcpu *vcpu, gpa_t gpa, void *data, unsigned l
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest);
 
-static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			           void *data, int offset, unsigned long len)
+static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot,
+				   gfn_t gfn, void *data, int offset, unsigned long len)
 {
 	int r;
 	unsigned long addr;
@@ -3368,7 +3368,7 @@ static int __kvm_read_guest_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
 	pagefault_disable();
-	r = __copy_from_user_inatomic(data, (void __user *)addr + offset, len);
+	r = kvm_copy_from_user_inatomic(kvm, data, (void __user *)addr + offset, len);
 	pagefault_enable();
 	if (r)
 		return -EFAULT;
@@ -3382,7 +3382,7 @@ int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa,
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
 	int offset = offset_in_page(gpa);
 
-	return __kvm_read_guest_atomic(slot, gfn, data, offset, len);
+	return __kvm_read_guest_atomic(vcpu->kvm, slot, gfn, data, offset, len);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_read_guest_atomic);
 
@@ -3400,7 +3400,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	addr = gfn_to_hva_memslot(memslot, gfn);
 	if (kvm_is_error_hva(addr))
 		return -EFAULT;
-	r = __copy_to_user((void __user *)addr + offset, data, len);
+	r = kvm_copy_to_user(kvm, (void __user *)addr + offset, data, len);
 	if (r)
 		return -EFAULT;
 	mark_page_dirty_in_slot(kvm, memslot, gfn);
@@ -3538,7 +3538,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	if (unlikely(!ghc->memslot))
 		return kvm_write_guest(kvm, gpa, data, len);
 
-	r = __copy_to_user((void __user *)ghc->hva + offset, data, len);
+	r = kvm_copy_to_user(kvm, (void __user *)ghc->hva + offset, data, len);
 	if (r)
 		return -EFAULT;
 	mark_page_dirty_in_slot(kvm, ghc->memslot, gpa >> PAGE_SHIFT);
@@ -3576,7 +3576,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	if (unlikely(!ghc->memslot))
 		return kvm_read_guest(kvm, gpa, data, len);
 
-	r = __copy_from_user(data, (void __user *)ghc->hva + offset, len);
+	r = kvm_copy_from_user(kvm, data, (void __user *)ghc->hva + offset, len);
 	if (r)
 		return -EFAULT;
 
-- 
2.56.0.385.gac671c819a-goog

