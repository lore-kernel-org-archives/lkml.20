Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641522;
	b=pCTDGI5EHVPrFHfTi5y5pWQCsH0VgEiIeflyhYq9XAl9PgZcDTzQDdNL/2GAGdsfwIZm
	 XiwL4L0DCDhXUQWI5Kux++6/V2+KVdPaZzL+xFT6YcdPklsNvCFoUVtNcBbjU1DNKpNW2
	 1WGT/BeQV7/EqY/vq0wL+5vDfa+uwwGagcFx9sAj6N9THUnNl0xOJBmb8bqOspCkKd8Cb
	 uqVNDWkz8m1Y/WYjeANQ7TskYQH7saVOe89hZSuOTSLu+A8dRjhej1uI33JT2xp5gzuln
	 hnEx83P5ja9ZR0Ye1GmOlZtXBva/auHga8EHLp1/aT1PvLoCC0KLG1gU/nfHHYnfJeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641522;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ZdzEyx8d7UubAXIFiaMm72yx6z7MQX7R1Kxv+wonI/4=;
	b=3+PpX9mdoMbGsm4Vvjpk9+NnrTFvLTVA3Rj9Gi9yr921Rr5MHF14NoZhaC8IYJ7TvBP+
	 x5dRust5I9HukMpyXCXomObmFudi/wtdyOG5/q7iV2wI4y38l/pT3POLoikSIMYsXgFp9
	 kgOjo1dYXfAxNCusUGj7lDm7d5czwcTJ7oNkpb+FIlLIioNReKPf1smuu4sZjaODNI54j
	 FBukyg76DwUE2mjGEfLpq1wUXuVMmlir83FCYN2V+2c5/1TK2jPWQ71fjc/mnGOQalWgB
	 FXSz5azHnpkLelt28JsquJ9T2MDaVbvKkOSJRKxiFzKYLP78jGTWUyUFmwNCGpTQy4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FjAINmnL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E662608760A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E662608760A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FjAINmnL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdzEyx8d7UubAXIFiaMm72yx6z7MQX7R1Kxv+wonI/4=;
	b=FjAINmnLpKoGwmqQvY3pSZe+khTaaLw2EPaOWSjd7MSQ/g+cwFR8XsW/e5Xo8I+8mkB4xw
	rcjrP41eTcPrOiZWTqHxoSjlGTgz4wTajtNblE0fwhzd+K/QpF2K8o/iKHBkKW8228VQeJ
	zQW+6cOvZD9yBkFQQ8vXrMITjSEjkq4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-XMt5cOZXN_qTrmaB05UcmA-1; Mon,
 02 Nov 2026 12:45:19 -0500
X-MC-Unique: XMt5cOZXN_qTrmaB05UcmA-1
X-Mimecast-MFC-AGG-ID: XMt5cOZXN_qTrmaB05UcmA_1793641519
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D951A195605A;
	Mon,  2 Nov 2026 17:45:18 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6611B1956087;
	Mon,  2 Nov 2026 17:45:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@amazon.com>
Subject: [PATCH 25/45] KVM: Take memory protections into account for accesses with cached gfn->hva
Date: Mon,  2 Nov 2026 12:44:52 -0500
Message-ID: <20261102174512.8903-9-pbonzini@redhat.com>
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

Account for memory attributes when accessing guest memory through
kvm_get/put_guest().

This requires tracking the memory attributes generation as part of
gfn_to_hva_cache's data, invalidate the cached information if the
generation changes, and failing to refresh the cache if restrictive
memory attributes are found within the GPA range.

Similar to how gfn_to_hva_cache disallows caching gfns mapped within
read-only memory slots, gfns marked as read-only by memory attributes
will also fail to initialize. Unsurprisingly, the same behaviour applies
to gfns mapped as non-accessible (NR/NW), while non-executable mappings
are okay.

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-23-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/linux/kvm_host.h | 19 +++++++++++++++++--
 virt/kvm/kvm_main.c      | 15 +++++++++++----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 2c854aaab92a..de540af1fa24 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1371,7 +1371,8 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
 	int __ret = -EFAULT;						\
 									\
-	if (!kvm_is_error_hva(__addr))					\
+	if (!kvm_is_error_hva(__addr) &&                                \
+	    kvm_mem_attributes_may_read_gfn(kvm, gfn))		\
 		__ret = get_user(v, __uaddr);				\
 	__ret;								\
 })
@@ -1391,7 +1392,8 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	typeof(v) __user *__uaddr = (typeof(__uaddr))(__addr + offset);	\
 	int __ret = -EFAULT;						\
 									\
-	if (!kvm_is_error_hva(__addr))					\
+	if (!kvm_is_error_hva(__addr) &&                                \
+	    kvm_mem_attributes_may_write_gfn(kvm, gfn))		\
 		__ret = put_user(v, __uaddr);				\
 	if (!__ret)							\
 		mark_page_dirty(kvm, gfn);				\
@@ -2640,6 +2642,12 @@ static inline u64 kvm_mem_attributes_generation(struct kvm *kvm)
 	return smp_load_acquire(&kvm->mem_attrs.generation);
 }
 #else
+static inline bool kvm_range_has_any_vm_memory_attributes(struct kvm *kvm,
+			gfn_t start, gfn_t end, unsigned long mask)
+{
+	return false;
+}
+
 static inline u64 kvm_supported_vm_mem_attributes(struct kvm *kvm)
 {
 	return 0;
@@ -2698,6 +2706,13 @@ static inline int kvm_mem_attributes_may_write_gfn(struct kvm *kvm, gfn_t gfn)
 	return kvm_mem_attributes_may_write(attrs);
 }
 
+static inline bool kvm_range_has_rw_memory_protections(struct kvm *kvm,
+						       gfn_t start, gfn_t end)
+{
+	return kvm_range_has_any_vm_memory_attributes(kvm, start, end,
+			KVM_MEMORY_ATTRIBUTE_NR | KVM_MEMORY_ATTRIBUTE_NW);
+}
+
 static inline bool kvm_memslots_check_gen(struct kvm *kvm, u64 slots_generation,
 					  u64 attrs_generation, struct kvm_memslots **p_slots)
 {
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6aa6a0a55b07..8283b2415adc 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3664,15 +3664,22 @@ static int __kvm_gfn_to_hva_cache_init(struct kvm *kvm,
 	 * If the requested region crosses two memslots, we still
 	 * verify that the entire region is valid here.
 	 */
-	for ( ; start_gfn <= end_gfn; start_gfn += nr_pages_avail) {
-		ghc->memslot = __gfn_to_memslot(slots, start_gfn);
-		ghc->hva = gfn_to_hva_many(ghc->memslot, start_gfn,
-					   &nr_pages_avail);
+	for (gfn_t gfn = start_gfn ; gfn <= end_gfn; gfn += nr_pages_avail) {
+		ghc->memslot = __gfn_to_memslot(slots, gfn);
+		ghc->hva = gfn_to_hva_many(ghc->memslot, gfn, &nr_pages_avail);
 		if (kvm_is_error_hva(ghc->hva))
 			return -EFAULT;
 	}
 
+	/*
+	 * RW memory attributes are incompatible with GHC. The RW protection
+	 * check has to happen after storing the generation number.
+	 */
 	ghc->attrs_generation = kvm_mem_attributes_generation(kvm);
+	if (kvm_range_has_rw_memory_protections(kvm, start_gfn, end_gfn + 1)) {
+		ghc->hva = KVM_HVA_ERR_BAD;
+		return -EFAULT;
+	}
 
 	/* Use the slow path for cross page reads and writes. */
 	if (nr_pages_needed == 1)
-- 
2.52.0


