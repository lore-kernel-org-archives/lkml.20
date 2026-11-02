Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641542;
	b=e85bZ0Qj7OBHsa1RLEVwYx3Tml8dlQFcQPHjw9UZvNFdkmjvRkr2kvdOjVd1lpNJrcAT
	 a98XhWawerCpVl+VbgY3jOlMqaUpITP58ukOiqhjqEFaXap8KguVQDKdO2omc+6imyErX
	 QTlaYjs3vtzGeVvhL52zOfIx0ASrIq+BCOsXba7rNXUaODczLC4YJNpAx/Y1bwW7DQ4u0
	 pr7STZkzalvXyOdO1wPAJWeE4CRm7HlQx4h88iQ5/0NsnELp58MpGI79gMZMXp6hs/HYK
	 M66ikV49kiyzKqhFJUqoqdoNEdNxHtWe4o/jOuMKoFK0CWqu2K3TC1uad4kYGvbOMcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641542;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=EXTQ5AqXDTIz2Git+dZ8kbBSI2stT6HVcz62n73LotU=;
	b=KYv0rRXigTa0KAUVpUFvBK9nGwx/p+O4bzQ5tpO7aoX3I+TSkH/XWT95qnFjK6r89Neh
	 Xob6mDTyPOaXQGZ/Lgc56jMXPndbyLiCmgGIVfXAOrq+QGmv5KaohqFg5/t9ovvDzkBOx
	 LKttWYlFK4g/l/5QWm0GlADHRNcpBe4ok3aIJZBAUUUPUoYSk6mpH8DGxc5GSadQZ75j9
	 tljDfRtON3YEsRr3RBH6mN2LbxJuBWNJT2tmY8zN8bQzietBtEBvUyvgRouTZLqV6uUzE
	 M6Wk71HfJg1MguM7FjBs5fG3x94CFjSWEByciLa5YCNOGNU4aKBpJiktht2t/KWwnlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dznwkrPN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DCB607DA9E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1DCB607DA9E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dznwkrPN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EXTQ5AqXDTIz2Git+dZ8kbBSI2stT6HVcz62n73LotU=;
	b=dznwkrPNOzQm9d0+m1SFhWPd+7wf4kx1MOmjGXQJCARf7i+qx60C19vrdrVPNHya2iHi1v
	hgyn8USPMTDxSa9XiTXNc7OnJv1c6wSHHjV/KukXK4fQwPlYHIVN/oorDf8+w5z9j0NsBg
	IeZINMcLdQqzi6wmSp0kRJR//eZ5CGg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-dGja3AERMcyx3M19JlyKYQ-1; Mon,
 02 Nov 2026 12:45:30 -0500
X-MC-Unique: dGja3AERMcyx3M19JlyKYQ-1
X-Mimecast-MFC-AGG-ID: dGja3AERMcyx3M19JlyKYQ_1793641530
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DFEFB180134B;
	Mon,  2 Nov 2026 17:45:29 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6EC421800347;
	Mon,  2 Nov 2026 17:45:29 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 41/45] KVM: x86/mmu: Obsolete all roots if memattr contains gPTEs
Date: Mon,  2 Nov 2026 12:45:08 -0500
Message-ID: <20261102174512.8903-25-pbonzini@redhat.com>
In-Reply-To: <20261102174130.8779-1-pbonzini@redhat.com>
References: <20261102174130.8779-1-pbonzini@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Note that the zapping of obsolete roots needs to happen after
mmu_lock is dropped, so introduce a separate kvm_arch callback.
The two map neatly to the "front" and "back" halves of
kvm_mmu_zap_all_fast().

Co-developed-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-29-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c   | 30 ++++++++++++++++++++++++++++++
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      |  1 +
 3 files changed, 32 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c08168595732..1cee8c3f07af 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -8359,6 +8359,7 @@ bool kvm_arch_post_set_vm_memory_attributes(struct kvm *kvm,
 {
 	unsigned long attrs = range->arg.attributes;
 	struct kvm_memory_slot *slot = range->slot;
+	struct kvm_mmu_page *sp;
 	int level;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
@@ -8414,9 +8415,38 @@ bool kvm_arch_post_set_vm_memory_attributes(struct kvm *kvm,
 				hugepage_set_mixed(slot, gfn, level);
 		}
 	}
+
+	/*
+	 * There are special considerations when applying an memory protection
+	 * attibute against a page containing guest PTEs, because virtual
+	 * addresses that requires traversing that page need to fault.
+	 *
+	 * When using shadow paging, the PTEs that the CPU actually walks
+	 * do not have any information about attributes (unlike TDP where
+	 * the attributes become part of the TDP permission bits).  Since
+	 * this should be a rare occasion, just invalidate all the mmu roots
+	 * if shadow paging is in use and attributes do cover a guest PTE.
+	 */
+	for (gfn_t gfn = range->start; gfn < range->end; gfn++) {
+		for_each_gfn_valid_sp_with_gptes(kvm, sp, gfn) {
+			__kvm_mmu_zap_all_fast_front_half(kvm);
+			return false;
+		}
+	}
 	return false;
 }
 
+void kvm_arch_post_set_vm_memory_attributes_unlocked(struct kvm *kvm)
+{
+	/*
+	 * This may also be called if no zap was done in
+	 * kvm_arch_post_set_memory_attributes().  It is not an issue because
+	 * __kvm_mmu_zap_all_fast_back_half() is cheap when it does not do
+	 * anything.
+	 */
+	 __kvm_mmu_zap_all_fast_back_half(kvm);
+}
+
 void kvm_mmu_init_memslot_memory_attributes(struct kvm *kvm,
 					    struct kvm_memory_slot *slot)
 {
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4128cdb71869..c5defda4d9d4 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2624,6 +2624,7 @@ bool kvm_arch_pre_set_vm_memory_attributes(struct kvm *kvm,
 					   struct kvm_gfn_range *range);
 bool kvm_arch_post_set_vm_memory_attributes(struct kvm *kvm,
 					    struct kvm_gfn_range *range);
+void kvm_arch_post_set_vm_memory_attributes_unlocked(struct kvm *kvm);
 bool kvm_range_has_any_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 					    unsigned long mask);
 u64 kvm_supported_vm_mem_attributes(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2d5d45e4ee71..061e952ea080 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2773,6 +2773,7 @@ static int kvm_set_vm_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		KVM_MMU_LOCK(kvm);
 		kvm_mmu_invalidate_end(kvm);
 		KVM_MMU_UNLOCK(kvm);
+		kvm_arch_post_set_vm_memory_attributes_unlocked(kvm);
 	}
 
 out_unlock:
-- 
2.52.0


