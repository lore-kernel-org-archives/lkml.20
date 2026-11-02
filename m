Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641520;
	b=cbxC5PWEAhyYnLnLhkwO7vb3eu/8yOT+v0+y3jINOfC5sJEF2Oo8PVL260Bgdjn1H6DZ
	 VjBaSGz6GaTZ4HGYjlBMgEb2hCCaidSnSgdBaRectGKOgtzOFBdOTBI8Zy9TdmFPDnhps
	 lA02raElIP88MtLd0jtMHQBR0VUqBTMLgwaL0fTY+7FiPGIQKIw6/oULIQ0ZwkcdeKAEV
	 eDkCst24FMKzOwtAwxLDsm6IXpRDTfT7nSCrgWBzcMDdqqfn97y//rFRbF4C+qAbbyJPf
	 uC4elV4JC8vGxmvEDuv9DHT+g4FKZUHeCrbRm2BaGsWXlQq53BgoqEb/OMTax4iud0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641520;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ZCFslrxsWUENi7QdUYeo2A7Ui3X9hq3aD1lq/gZJXjc=;
	b=hsy1y4xr0fOvbpKNzsy+aBPpagHHxyi9ddLpHPgVUqW9lcgslR3OFeOWqTz9Uwf8z3NU
	 oUIYdkuSkmJdxtOubNqejCTD/7CueWT3bTe8fwDwjHDe5U6+TkXI9LyA6eDyAOtWsOgBp
	 +a7chRy7+yYgsUQ3jMatvXI3h1koIwKL5dYPyeZ0OqRpxMIGlO6/LN9sYh0qfVpprKkJz
	 Qym0TwYjYTS9wYJKDskYPKc1PUTDc7c+D6+mRN9Lq/i0s0jCbTqlhanWLC1++hsdb7+kB
	 E48YxtU12/qV98W+SxNkDEsulWXKfc3ih0qukG3ZqQi7IlD1my3+Ng4CAjTwzTxZVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rb3WMbxB;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E67606E00E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91E67606E00E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rb3WMbxB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCFslrxsWUENi7QdUYeo2A7Ui3X9hq3aD1lq/gZJXjc=;
	b=Rb3WMbxBlwMsA1X97ZxvNhcp5EGLnM/0zZX5wehPEcrGqbsUrVjnqfc/lb7eT7o7D1pSCo
	8xYzCyNC0bpNduYAbU0z8btL+8XD6qliP4fy0WJePXPXI+r45Ntl84/U417R5i6A8Zng8y
	8nbxVgWdzeXK/Gw7kRhCkLoa+z4HeZQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-465-U-oHoFtTNyaDw4CKU-EeOA-1; Mon,
 02 Nov 2026 12:45:15 -0500
X-MC-Unique: U-oHoFtTNyaDw4CKU-EeOA-1
X-Mimecast-MFC-AGG-ID: U-oHoFtTNyaDw4CKU-EeOA_1793641514
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B8A11800674;
	Mon,  2 Nov 2026 17:45:14 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EBA5D1956087;
	Mon,  2 Nov 2026 17:45:13 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 18/45] KVM: Include memory protections in result of gfn->hva conversion
Date: Mon,  2 Nov 2026 12:44:45 -0500
Message-ID: <20261102174512.8903-2-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

From: Nicolas Saenz Julienne <nsaenz@amazon.com>

All paths that lead to guest memory accesses now need to check whether
memory attributes allow that access.  Users of gfn_to_hva,
kvm_vcpu_gfn_to_hva and their *_prot variant can get it more or
less for free via erroneous return values, so do this first.

Note however that this is not true of the variants that take a cached
kvm_memslots pointer.  These include caches (gfn-to-hva and gfn-to-pfn)
and page faults, both of which will need specific changes; but the more
optimized functions in virt/kvm/kvm_main.c such as kvm_read_guest()
and kvm_write_guest() also retrieve the memslot high in the call chain,
and therefore they will need changes in __kvm_read/write_guest_page().

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-15-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h | 19 ++++++++++++++
 virt/kvm/kvm_main.c      | 55 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 8442fb29a1ee..3791e4290742 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2623,6 +2623,11 @@ static inline u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
 {
 	return 0;
 }
+
+static inline unsigned long kvm_get_vm_memory_attributes(struct kvm *kvm, gfn_t gfn)
+{
+	return 0;
+}
 #endif  /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
 
 #ifdef CONFIG_KVM_PRIVATE_MEMATTR_VM
@@ -2653,6 +2658,20 @@ static inline bool kvm_is_private_gfn(struct kvm *kvm, gfn_t gfn)
 }
 #endif /* kvm_arch_has_private_mem */
 
+static inline int kvm_mem_attributes_may_read_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	unsigned long attrs = kvm_get_vm_memory_attributes(kvm, gfn);
+
+	return kvm_mem_attributes_may_read(attrs);
+}
+
+static inline int kvm_mem_attributes_may_write_gfn(struct kvm *kvm, gfn_t gfn)
+{
+	unsigned long attrs = kvm_get_vm_memory_attributes(kvm, gfn);
+
+	return kvm_mem_attributes_may_write(attrs);
+}
+
 #ifdef CONFIG_KVM_GUEST_MEMFD
 bool kvm_gmem_is_private_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 717d7aec9a6c..d3f074d7fd6f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2874,13 +2874,38 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(gfn_to_hva_memslot);
 
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn)
 {
-	return gfn_to_hva_many(gfn_to_memslot(kvm, gfn), gfn, NULL);
+	unsigned long addr;
+
+	addr = gfn_to_hva_many(gfn_to_memslot(kvm, gfn), gfn, NULL);
+	if (kvm_is_error_hva(addr))
+		return addr;
+
+	if (!kvm_mem_attributes_may_read_gfn(kvm, gfn))
+		return KVM_HVA_ERR_BAD;
+
+	if (!kvm_mem_attributes_may_write_gfn(kvm, gfn))
+		return KVM_HVA_ERR_RO_BAD;
+
+	return addr;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(gfn_to_hva);
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn)
 {
-	return gfn_to_hva_many(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn, NULL);
+	struct kvm *kvm = vcpu->kvm;
+	unsigned long addr;
+
+	addr = gfn_to_hva_many(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn, NULL);
+	if (kvm_is_error_hva(addr))
+		return addr;
+
+	if (!kvm_mem_attributes_may_read_gfn(kvm, gfn))
+		return KVM_HVA_ERR_BAD;
+
+	if (!kvm_mem_attributes_may_write_gfn(kvm, gfn))
+		return KVM_HVA_ERR_RO_BAD;
+
+	return addr;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_gfn_to_hva);
 
@@ -2906,15 +2931,37 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot,
 unsigned long gfn_to_hva_prot(struct kvm *kvm, gfn_t gfn, bool *writable)
 {
 	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
+	unsigned long addr;
 
-	return gfn_to_hva_memslot_prot(slot, gfn, writable);
+	addr = gfn_to_hva_memslot_prot(slot, gfn, writable);
+	if (kvm_is_error_hva(addr))
+		return addr;
+
+	if (!kvm_mem_attributes_may_read_gfn(kvm, gfn))
+		return KVM_HVA_ERR_BAD;
+
+	if (writable && !kvm_mem_attributes_may_write_gfn(kvm, gfn))
+		*writable = false;
+
+	return addr;
 }
 
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable)
 {
 	struct kvm_memory_slot *slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
+	unsigned long addr;
 
-	return gfn_to_hva_memslot_prot(slot, gfn, writable);
+	addr = gfn_to_hva_memslot_prot(slot, gfn, writable);
+	if (kvm_is_error_hva(addr))
+		return addr;
+
+	if (!kvm_mem_attributes_may_read_gfn(vcpu->kvm, gfn))
+		return KVM_HVA_ERR_BAD;
+
+	if (writable && !kvm_mem_attributes_may_write_gfn(vcpu->kvm, gfn))
+		*writable = false;
+
+	return addr;
 }
 
 static bool kvm_is_ad_tracked_page(struct page *page)
-- 
2.52.0


