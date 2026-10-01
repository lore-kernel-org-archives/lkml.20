Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906F949CF34
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886174; cv=none; b=QVXtuSYyivQLXCXpefk+4ucVMcBIm5oEaWnWfjanrNm1Mfw8qH/MQocWwE1UbEmM/h8TysHf4oNI/MsIellvL5Tw8MMshlilSdTgV1HrtqYtD5rEfkPyPb0b28PHCZMI673jBSyjqoLSMeyN6G89sH+CCIQGIHIbGq6+6G4WL9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886174; c=relaxed/simple;
	bh=WQb40a97ROmFqjiNKo3SgQ6E9gFV/eXSZB9E31DVrDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tNHTLJzxPOds1hMDfifMT+2MbH+q0gR9XjGqRqneq2c+f8H+UbUbNA9TNN8piejJ86LLao+xOcn8vAVAdNWqj1WEPHi9vMPE6T6q0XvRTCtpPALXxLe0PePspMLoabDN1f002Ox0Uq1mqL45iW2q/jtq7tHpqyDX4tPQnWZL1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lYZFA25P; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lYZFA25P"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88078ca8725so2502119b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886166; x=1791490966; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ymfeYEmvW6bR4RRG+DI7t0UxyoSVGW7KhY3QEGj26Qs=;
        b=lYZFA25PuQHWc1asBBH0KvT+kJTFYu857r5N7rVCAs+nGLK+zghmW2PTubPbC43r/e
         Fvtk9Vs2OngTtwtkr/tVDDNHZ5KdsCHPhqOE3EeIY+m9gXz+9nIZMG8RZdErs2eZYOD2
         oGWzyFnfdUtqs5kWNrvwV45fNWTXYzh9GJRLEM03xyQrolA0VEePfQDXcmJ3YXSBFQKx
         39ubhsudnrwOX1CidV5a4V3dRyC2MyrXBhZ7wXtWPSEAzMfTJ6d/Q831Y/0ELpRiPW2Y
         FzWVKEy3zjzlNkhkJPxngLdru/mzWz0HvKaEsV1vf65y1uNIgjNcOpsFjtYnnngtrJ92
         wBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886166; x=1791490966;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ymfeYEmvW6bR4RRG+DI7t0UxyoSVGW7KhY3QEGj26Qs=;
        b=OdlBMbF7gJ7C5XiROHW4K5WKzS65dvW1+N/18uYByWynmR6hZwtf9pkWm4c44uV4e7
         CnMAhIzMdUw7Q/d6xQ6WZzqny1yEAIIJFFnRbfm2tBX+SAeXk+UXBLCIcM/uuFoX5S1c
         AOLlVAZqWkb6ZRI7FyNrLAR2az8LPR1bfxEZJHhKNgDiZubmMQ+7RtzwoEV8VYDwt6P1
         BSGubhLeEgEGBn3bF12j3JDxiiN/9ibxZCDSmgdtv4kxCsJnOr7lg2rEwURcEtEEdZdJ
         YaRgph4JE3sya1LZSWJN1P83IgV3NC7eU4S4y/ybK2HR0HTrWL6QeSqUxtofTnMb/B7L
         4wIw==
X-Forwarded-Encrypted: i=1; AKwUvBwGqhodQW9Zdc+53qHyWoCThSfgNqzn9BCnm2tGPth+/o4ZEg6TUtU/etkPudBpz9S4IWeBWALnOgngOwo=@vger.kernel.org
X-Gm-Message-State: AFuF++nV9gOISJrIdkjZqSONh82D8O+xW0tknUZSNZaANDZj0spvUten
	uiuWxwZNDnij2R86RyvJuxR6XhhyaaUdMOA1PQRV6skgu6xEMMvX3d8hD29bYC/WJs0kwfzm55z
	W9XEFyQ==
X-Received: from pgbfq17.prod.google.com ([2002:a05:6a02:2991:b0:cc7:9b89:2a72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:a518:b0:3d3:ae40:51e5
 with SMTP id adf61e73a8af0-3e0bcf27ea4mr485150637.25.1790886165277; Thu, 01
 Oct 2026 13:22:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:27 -0700
In-Reply-To: <20261001202234.3794060-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-4-seanjc@google.com>
Subject: [PATCH v2 03/10] KVM: x86: Unmap VMAs for KVM-internal memslots when
 the memslot is freed
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Unmap KVM-created VMAs for KVM-internal memslots when the associated
memslot is freed instead of unmapping via x86's internal API.  This will
allow deleting/freeing all memslots before kvm_arch_destroy_vm() without
leaking VMAs, and in general is a net positive as it makes it far less
likely that KVM will leak VMAs, e.g. in the unlikely scenario some other
flow deletes KVM-internal memslots without going through
__x86_set_memory_region().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 36 ++++++++++++++----------------------
 1 file changed, 14 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 79468ddfe473..e91bd79dd3cc 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9925,7 +9925,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
  * @size > 0 to install a new slot, while @size == 0 to uninstall a
  * slot.  The return code can be one of the following:
  *
- *   HVA:           on success (uninstall will return a bogus HVA)
+ *   HVA:           on success (uninstall will return a NULL HVA)
  *   -errno:        on error
  *
  * The caller should always use IS_ERR() to check the return value
@@ -9938,10 +9938,10 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				      u32 size)
 {
-	int i, r;
-	unsigned long hva, old_npages;
 	struct kvm_memslots *slots = kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	unsigned long hva;
+	int i, r;
 
 	lockdep_assert_held(&kvm->slots_lock);
 
@@ -9965,8 +9965,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		if (!slot || !slot->npages)
 			return NULL;
 
-		old_npages = slot->npages;
-		hva = slot->userspace_addr;
+		hva = 0;
 	}
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
@@ -9982,9 +9981,6 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 			return ERR_PTR_USR(r);
 	}
 
-	if (!size)
-		vm_munmap(hva, old_npages * PAGE_SIZE);
-
 	return (void __user *)hva;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(__x86_set_memory_region);
@@ -10013,20 +10009,6 @@ void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 
 void kvm_arch_destroy_vm(struct kvm *kvm)
 {
-	if (current->mm == kvm->mm) {
-		/*
-		 * Free memory regions allocated on behalf of userspace,
-		 * unless the memory map has changed due to process exit
-		 * or fd copying.
-		 */
-		mutex_lock(&kvm->slots_lock);
-		__x86_set_memory_region(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT,
-					0, 0);
-		__x86_set_memory_region(kvm, IDENTITY_PAGETABLE_PRIVATE_MEMSLOT,
-					0, 0);
-		__x86_set_memory_region(kvm, TSS_PRIVATE_MEMSLOT, 0, 0);
-		mutex_unlock(&kvm->slots_lock);
-	}
 	if (kvm->arch.created_mediated_pmu)
 		perf_release_mediated_pmu();
 	kvm_destroy_vcpus(kvm);
@@ -10066,6 +10048,16 @@ void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 	}
 
 	kvm_page_track_free_memslot(slot);
+
+	/*
+	 * Free memory regions allocated on behalf of userspace, unless the
+	 * memory map has changed due to process exit or fd copying.  Leak the
+	 * mapping on failure, e.g. if the task is killed, worst case scenario,
+	 * the page(s) will be reclaimed when the process exits.
+	 */
+	if (current->mm == kvm->mm && slot->id >= KVM_USER_MEM_SLOTS &&
+	    !WARN_ON_ONCE(!slot->npages))
+		vm_munmap(slot->userspace_addr, slot->npages * PAGE_SIZE);
 }
 
 int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

