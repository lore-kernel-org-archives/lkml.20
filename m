Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D351614C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739464; cv=none; b=td9l6HaRvItzmJQ3xWCfGSTFyv9yT3NyH7VZYezt86tKdDiUBMuk8C9NYpV3Ng55frT9qhiIdF+urXGNJz2q2ZeQNIinAee1zSdD7h7iCoCYu8KoOkV9aAo3jp9JNaKjLFjSmVlT6w/ez80n+9phJfOaoE5UX6/7bndahIdQq2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739464; c=relaxed/simple;
	bh=mhhDSNnA91cSUqozlkAcmrulXDJP3EmnL3z1W2aW8vM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R/ezg8t1VgN7IRRg+qhXuFPIy1CKJcOzWNBafUbu6zpb6LSQVNUv9P0zgolcJTgt6mA7cD08OLqoq50Qx16sG6ysg2J0VkyM3/u9VF4Qku7s+XpNfzaNGErco4OnIu1ia1UZo0uDlqTyzSSWvHBf4xg2nwyLwUBnsW5hLmeBovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVjtyRsX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVjtyRsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mL5mmLijL/thbWxdihkf2vlVFU83INpCJw9BHQfp/4=;
	b=OVjtyRsXVl/iMpf9IbYRLlhDhHkcBGcK3Ngh9iqhAQT2KOYTEITiUSpEzw9ea3v6WZHreD
	vctRFEFhPXPeSkhcArdSM+qTDrl1cOfeW924y6ZM6OFBX/KVV3YMJniAnhBVJdxvQuTOUw
	4HTtji67UF89WeNzF0kLi0A2iqGFRbw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-MmQOgwh9PpmA3vpCIIhl1w-1; Fri,
 18 Sep 2026 09:50:56 -0400
X-MC-Unique: MmQOgwh9PpmA3vpCIIhl1w-1
X-Mimecast-MFC-AGG-ID: MmQOgwh9PpmA3vpCIIhl1w_1789739455
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBE2C195606F;
	Fri, 18 Sep 2026 13:50:55 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2DD38433;
	Fri, 18 Sep 2026 13:50:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 27/31] KVM: let kvm_arch_post_set_memory_attributes drop mmu_lock
Date: Fri, 18 Sep 2026 09:50:26 -0400
Message-ID: <20260918135030.171564-28-pbonzini@redhat.com>
In-Reply-To: <20260918135030.171564-1-pbonzini@redhat.com>
References: <20260918135030.171564-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Ensure that mmu_invalidate_in_progress is not cleared until
kvm_arch_post_set_memory_attributes() returns.

kvm_arch_post_set_memory_attributes() runs with the MMU lock taken
exclusively, so a concurrent page fault would be blocked anyway, and
delaying the clearing makes it possible to use cond_resched() within
kvm_arch_post_set_memory_attributes().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 virt/kvm/kvm_main.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2045252bd9c9..eb4a661cd0f7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2516,7 +2516,7 @@ static bool kvm_range_memory_attributes_need_sync(struct kvm *kvm,
 	return kvm_range_has_any_memory_attributes(kvm, start, end, mask);
 }
 
-static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
+static __always_inline bool kvm_handle_gfn_range(struct kvm *kvm,
 						 struct kvm_mmu_notifier_range *range)
 {
 	struct kvm_gfn_range gfn_range;
@@ -2566,6 +2566,8 @@ static __always_inline void kvm_handle_gfn_range(struct kvm *kvm,
 
 	if (found_memslot)
 		KVM_MMU_UNLOCK(kvm);
+
+	return found_memslot;
 }
 
 static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
@@ -2603,10 +2605,11 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		.end = end,
 		.arg.attributes = attributes,
 		.handler = kvm_arch_post_set_memory_attributes,
-		.on_lock = kvm_mmu_invalidate_end,
+		.on_lock = (void *)kvm_null_fn,
 		.may_block = true,
 	};
 	bool sync = false;
+	bool found_memslot;
 	unsigned long i;
 	void *entry;
 	int r = 0;
@@ -2637,7 +2640,7 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		cond_resched();
 	}
 
-	kvm_handle_gfn_range(kvm, &pre_set_range);
+	found_memslot = kvm_handle_gfn_range(kvm, &pre_set_range);
 
 	for (i = start; i < end; i++) {
 		r = xa_err(xa_store(&kvm->mem_attrs.array, i, entry,
@@ -2650,7 +2653,12 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	smp_store_release(&kvm->mem_attrs.generation,
 			  kvm->mem_attrs.generation + 1);
 
-	kvm_handle_gfn_range(kvm, &post_set_range);
+	if (found_memslot) {
+		kvm_handle_gfn_range(kvm, &post_set_range);
+		KVM_MMU_LOCK(kvm);
+		kvm_mmu_invalidate_end(kvm);
+		KVM_MMU_UNLOCK(kvm);
+	}
 
 out_unlock:
 	mutex_unlock(&kvm->slots_lock);
-- 
2.52.0


