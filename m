Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641305;
	b=x4HeQfugIaWkM4/x15Ps7b6wLJe11ngSTCWJNIZC7zK9eO3HNE5w9pAeHlPvizHP9vI6
	 xZIUiHwzvNcwCvYfDYZI+cd5I5QtXnOrxmkpjoWMCPQlo+d7eQQzNS2CB7tk2xDiQYmeK
	 NFjwrSeCBZoyhUU0G0ewlL7Cjlfl2SbIR72AsvGPKSQc7IJ6azjBUCcLu+rCmXBu218DH
	 CZDbvjmjyqV7aDEexLoaXYTDkI4B0scZuJbEwdtVFKbf3Q+mWzvAax8kzZXEcAKipYj99
	 c9QiHaK6txn12sNjTr6V9OUXPCHqHFwBhIDcEj75dYJoExhNeT8HRcyBkAwMlUqO8pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641305;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=J+uoOmdsyT7Y59WUibZwa2+9b5UjAPfLGzqJypecDMY=;
	b=H6eIuKWr7tPDlrB24Jm2p2XKn/vHpFI61EQu3d4HRse2edamvxf4xZo7PrW2u2JLipAS
	 YoVUbKGbMceg72Bv0kLhh0uxJpVccVqhhlRXCC/wcgmZp4OEjS04Hgu5v1Mr4vS94O4+U
	 Ub2jFM1u0xT7xqKCSd6MztInP9lngWs+TplESj8rNYEKrnNbT+lJIcAXC8tNJ389K9GlG
	 X1cBXrZi2levr+mdM+8ORE5l573D/GzCgk1yWxPYAuSExuywcbOPPs0OBJpL0cp00w2Mj
	 JAYkZLRNnX4zalZAq3mIZQFh5svWM3tFlTdpAjeU2tLIef7xs/vIbS5XJopETEgwccQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpY9ccqE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8492960752B2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:41:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8492960752B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GpY9ccqE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J+uoOmdsyT7Y59WUibZwa2+9b5UjAPfLGzqJypecDMY=;
	b=GpY9ccqEPqgOW0ZDTctBCuRaY7U/9ehWGFLGCWXN86OvsY28LmVCy/xqIwLebJT8mFeQV/
	EldqKsRZgcrBmgGRJoDWZyDj8FJGPHvyATo+U1PXxaRWGOmTsqk1o5p3aGAKoACbIbKvfq
	Ru08qzUdIRMa9eC0FGuY8WF2iV1LZ0c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-315-B-mnpGYeP1ugisUy313-Hw-1; Mon,
 02 Nov 2026 12:41:42 -0500
X-MC-Unique: B-mnpGYeP1ugisUy313-Hw-1
X-Mimecast-MFC-AGG-ID: B-mnpGYeP1ugisUy313-Hw_1793641301
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 278021955EB5;
	Mon,  2 Nov 2026 17:41:41 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A91A418005B2;
	Mon,  2 Nov 2026 17:41:40 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 16/45] KVM: adjust for presence of more than one attribute
Date: Mon,  2 Nov 2026 12:41:00 -0500
Message-ID: <20261102174130.8779-17-pbonzini@redhat.com>
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

Remove or adjust code that assumed that the only valid attribute was
KVM_MEMORY_ATTRIBUTE_PRIVATE, in preparation for the introduction of RWX
memory attributes.

In particular, the optimization in kvm_range_has_memory_attributes
simply is not valid if attrs == 0 but some of the attributes are being
ignored.  The WARNs in arch/x86/kvm/mmu/mmu.c are just a duplicate of
checking kvm_supported_mem_attributes() during the ioctl, so drop it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-13-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c |  9 +--------
 virt/kvm/kvm_main.c    | 10 +++++++---
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3755393de4ca..b89517794034 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -8226,9 +8226,6 @@ bool kvm_arch_pre_set_vm_memory_attributes(struct kvm *kvm,
 	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
 	 * a hugepage can be used for affected ranges.
 	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
-		return false;
-
 	if (WARN_ON_ONCE(range->end <= range->start))
 		return false;
 
@@ -8304,11 +8301,7 @@ bool kvm_arch_post_set_vm_memory_attributes(struct kvm *kvm,
 	 * can't map memory PRIVATE.  KVM mustn't create a SHARED hugepage over
 	 * a range that has PRIVATE GFNs, and conversely converting a range to
 	 * SHARED may now allow hugepages.
-	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
-		return false;
-
-	/*
+	 *
 	 * The sequence matters here: upper levels consume the result of lower
 	 * level's scanning.
 	 */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2fd595a901bd..17341c689d11 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2490,10 +2490,12 @@ bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 					unsigned long mask, unsigned long attrs)
 {
 	XA_STATE(xas, &kvm->mem_attr_array, start);
+	unsigned long supported_attrs;
 	unsigned long index;
 	void *entry;
 
-	mask &= kvm_supported_vm_mem_attributes(kvm);
+	supported_attrs = kvm_supported_vm_mem_attributes(kvm);
+	mask &= supported_attrs;
 	if (attrs & ~mask)
 		return false;
 
@@ -2522,8 +2524,10 @@ bool kvm_range_has_vm_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	 */
 	for (index = start; index < end; index++) {
 		do {
-			entry = attrs ? xas_next(&xas) :
-					xas_next_entry(&xas, end - 1);
+			if (!attrs && mask == supported_attrs)
+				entry = xas_next_entry(&xas, end - 1);
+			else
+				entry = xas_next(&xas);
 		} while (xas_retry(&xas, entry));
 
 		if (!entry)
-- 
2.52.0


