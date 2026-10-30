Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395303;
	b=ydxq0UtPOC3rEIHjkJ5CSxrrzhk6pyq04jzIVAqm/D7fYts9svBSe9DMQZYQ6XdfI7UY
	 U+0ZwFta2a4xLKFQ2uR0KXJeiI9fy455USeGTqA5HfvYH1/BvjttgFmr87yjBJ4r8BnNr
	 gTKZwiWUWwEiC6pjT56LKFRytEQBfNdxa8E5Bf8SMcsXPXd2FCpXuNqGDZ+RLxn4TtFiJ
	 gWQwAQKeFICl4QoHcT1eQKI18vihzEovrVo2XblRc+Xc/AVCMiB8yD/dCiJqSGVZUxcqk
	 rG9Vag/tqG92zhhj1gZwEIB317iU/8Znd48ypgY6ELUgrozuWRLXyLFN2ntVz2eXTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=QOulOknncDj+wvkIw4OOGY1O6DdQV3bVqwj3fNEp63M=;
	b=dqEdr7zFiezpu8Ft02bIgw/4DUmb5oOjZOdETTyxXIKlG47dQw6jstqvTnpS0KdGp0Nv
	 /LEpb/PcGdLBIPLU7EOYB+bMGkQLNmIoJxjcUvHWMqh8yjIaJkxYTYfV1gWsDDBX3M8JE
	 FyovZJCgR7vP/alX7HAzmz8eRd4WtFUXbQy9EYXE1J/OTH2vAWjxHHSPe8oUzUk6tWsVG
	 y16WTOuB4xgVElWngAe3p4qe1A8mZ3zeJI9y6bJ9MUc8OhkQZS2tSIpiCCLXa1akhJmmA
	 nd0tHgc9m6M+aBg3nArCp3UiIppWlCBWKPL5V2Lu9vJggclCRYZ26aMW/r9//pNiT7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOoqCSXE;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EBC60701F0
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0EBC60701F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BOoqCSXE
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so987057b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395302; x=1794000102; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QOulOknncDj+wvkIw4OOGY1O6DdQV3bVqwj3fNEp63M=;
        b=BOoqCSXE9ZPDiFh2POxPx+Ow6FvMl6K9ztXpQUAPLKIL0GBQ0DYZmZCNIxqrKUfJvx
         cwtACtI9dx8I1ZeqaW6/viuj5ikI+ztSgGdUxffrH+nmTGV4wbQs5VoSKczn3nFmCQZx
         l+kDnt9N8XEmIbYm78rFxbgW/8lV18+qNBTM5QdVhFQWYwJYNLBibkn0rc2RblOYjGln
         nhsX0M73RxwDf7812tFeg6I1cKps/4TCvIMPqky3MmtJRsTY8W6VfQ5AMWy9zh7HGRNi
         Sf6hchA0qhpzON5ofg6rBNNQhOSYCJY6bQAK4gTM+3G8vWYKvbn2SsbePrUsqj3RUlYa
         MLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395302; x=1794000102;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QOulOknncDj+wvkIw4OOGY1O6DdQV3bVqwj3fNEp63M=;
        b=tjVZsvTD4pG0dQIT1I3ZrWRfGrNgK23yBjx1Y3u9uHy1ZXrdbxRndmZ8kYD2EkmyI3
         mNqtt4Lu7XblCmF9vM2Fh6MeN2b5mLnVXkjvoGFkxDV20QIOgYyxgbj2ez9aZwFJQg3g
         4Pq8blaXrR3xqdlQrFDTFN6fk6i3WTNYN3qlN9CTD3v3ETjF9FBplMXRtkt55feyBFLS
         dfpGW2D0exCTaijYCf92XuQDb7SRQdaafCIBpCQqEQiZVc9dpO4xgr6yo9k7iFOwcwZ7
         vbwKQ2bMFbbyDo+ZroMW0DjRNrHi5W0LSioV9JT9r10fMeOKLntEwLUfnOv8HBNVZAYM
         eG9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/GExduUbR+GfOCo5N29qiuavJkl0n4Qe/kSSf17ad6AeTmRrmi6XXlvR0+4SyBjTLfkNe4mXHOuIQ4V4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrg0tVgv+e66CCdsmnYQ4LTrQp7UB7Lz5Yve60C6NZSPJ+7TtG
	7ShHpPs7jgGbcRHMEpsW4QTmtA0CcktIZ5+2x6MwLLqxMhCLpEdj99ySSolKQScSKWGolyfRFck
	RIE9KOA==
X-Received: from pfbay8.prod.google.com ([2002:a05:6a00:3008:b0:89f:6242:b2d2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3e01:b0:3e2:5d77:4bf3
 with SMTP id adf61e73a8af0-3e92884d686mr2608559637.0.1793395301941; Fri, 30
 Oct 2026 14:21:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:11 -0700
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
Message-ID: <20261030212112.2598640-24-seanjc@google.com>
Subject: [PATCH v4 23/23] KVM: x86: Rename __x86_set_memory_region() => x86_set_internal_memslot()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Rename __x86_set_memory_region() to x86_set_internal_memslot() and add
double-underscores to the existing x86_set_internal_memslot(), so that the
x86 APIs better align common KVM's kvm_set_internal_memslot().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c   |  6 +++---
 arch/x86/kvm/vmx/vmx.c | 12 ++++++------
 arch/x86/kvm/x86.c     | 14 +++++++-------
 arch/x86/kvm/x86.h     |  4 ++--
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index c20e2a25834f..b4a7f02f5c48 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2917,8 +2917,8 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 	    kvm->arch.apic_access_memslot_inhibited)
 		return 0;
 
-	hva = __x86_set_memory_region(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT,
-				      APIC_DEFAULT_PHYS_BASE, PAGE_SIZE);
+	hva = x86_set_internal_memslot(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT,
+				       APIC_DEFAULT_PHYS_BASE, PAGE_SIZE);
 	if (IS_ERR(hva))
 		return PTR_ERR(hva);
 
@@ -2943,7 +2943,7 @@ void kvm_inhibit_apic_access_page(struct kvm_vcpu *vcpu)
 	if (!kvm->arch.apic_access_memslot_enabled)
 		goto out;
 
-	p = __x86_set_memory_region(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT, 0, 0);
+	p = x86_set_internal_memslot(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT, 0, 0);
 	if (IS_ERR(p)) {
 		kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
 		goto out;
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 1f9e43c5b4c4..00fb9459de59 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4055,10 +4055,10 @@ static int init_rmode_identity_map(struct kvm *kvm)
 	if (!kvm_vmx->ept_identity_map_addr)
 		kvm_vmx->ept_identity_map_addr = VMX_EPT_IDENTITY_PAGETABLE_ADDR;
 
-	uaddr = __x86_set_memory_region(kvm,
-					IDENTITY_PAGETABLE_PRIVATE_MEMSLOT,
-					kvm_vmx->ept_identity_map_addr,
-					PAGE_SIZE);
+	uaddr = x86_set_internal_memslot(kvm,
+					 IDENTITY_PAGETABLE_PRIVATE_MEMSLOT,
+					 kvm_vmx->ept_identity_map_addr,
+					 PAGE_SIZE);
 	if (IS_ERR(uaddr)) {
 		r = PTR_ERR(uaddr);
 		goto out;
@@ -5295,8 +5295,8 @@ int vmx_set_tss_addr(struct kvm *kvm, unsigned int addr)
 		return 0;
 
 	mutex_lock(&kvm->slots_lock);
-	ret = __x86_set_memory_region(kvm, TSS_PRIVATE_MEMSLOT, addr,
-				      PAGE_SIZE * 3);
+	ret = x86_set_internal_memslot(kvm, TSS_PRIVATE_MEMSLOT, addr,
+				       PAGE_SIZE * 3);
 	mutex_unlock(&kvm->slots_lock);
 
 	if (IS_ERR(ret))
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8cb58040dd81..85dd52c6beca 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10007,8 +10007,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 	return ret;
 }
 
-static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
-				    gpa_t gpa, struct file *f, u32 size)
+static int __x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
+				      gpa_t gpa, struct file *f, u32 size)
 {
 	struct kvm_userspace_memory_region2 m;
 	unsigned long hva;
@@ -10038,7 +10038,7 @@ static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
 }
 
 /**
- * __x86_set_memory_region: Setup KVM internal memory slot
+ * x86_set_internal_memslot: Setup KVM internal memory slot
  *
  * @kvm: the kvm pointer to the VM.
  * @id: the slot ID to setup.
@@ -10059,7 +10059,7 @@ static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
  * address, i.e. its accessibility is not guaranteed, and must be
  * accessed via __copy_{to,from}_user().
  */
-void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
+void __user *x86_set_internal_memslot(struct kvm *kvm, int id, gpa_t gpa,
 				      u32 size)
 {
 	struct file *f __free(fput) = NULL;
@@ -10081,12 +10081,12 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	}
 
 	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
-		r = x86_set_internal_memslot(kvm, id, i, gpa, f, size);
+		r = __x86_set_internal_memslot(kvm, id, i, gpa, f, size);
 		if (!r)
 			continue;
 
 		for (i--; i >= 0 && size; i--)
-			x86_set_internal_memslot(kvm, id, i, gpa, NULL, 0);
+			__x86_set_internal_memslot(kvm, id, i, gpa, NULL, 0);
 
 		return ERR_PTR_USR(r);
 	}
@@ -10097,7 +10097,7 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 
 	return (void __user *)(slot ? slot->userspace_addr : 0);
 }
-EXPORT_SYMBOL_FOR_KVM_INTERNAL(__x86_set_memory_region);
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(x86_set_internal_memslot);
 
 void kvm_arch_pre_destroy_vm(struct kvm *kvm)
 {
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index cfe96962a4e4..c467d7347145 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -529,8 +529,8 @@ static inline void kvm_inject_gp(struct kvm_vcpu *vcpu, u32 error_code)
 void kvm_inject_nmi(struct kvm_vcpu *vcpu);
 int kvm_get_nr_pending_nmis(struct kvm_vcpu *vcpu);
 
-void __user *__x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
-				     u32 size);
+void __user *x86_set_internal_memslot(struct kvm *kvm, int id, gpa_t gpa,
+				      u32 size);
 int memslot_rmap_alloc(struct kvm_memory_slot *slot, unsigned long npages);
 
 bool kvm_vcpu_is_reset_bsp(struct kvm_vcpu *vcpu);
-- 
2.56.0.385.gac671c819a-goog

