Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F85503BD4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739447; cv=none; b=Nn+IOU5m4ZsY5dqizgQ/cjagi59gieFXNR20x8Rx9nqXQj4XUgEErAi3LiHaBnVdnDdXkuUw9CWZmHL98SC53nXAx0UZyD3p19XVZsp7QoLUIF+/bxj/pyScsVmM+eZApbQ5/dD5kpkcvJ76WcI03+/sVASGP+NDDkFeZjK4HuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739447; c=relaxed/simple;
	bh=KFbaMqbiLFRP87KR2IT5l978ib4/M2BclxnGHkZsbZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYfdBj0HUTgYH7TV2cuM7y1AcPptYellzxc9oM0PfBaRbcUa72bmzytGShWAD9dgjB/KOA0hRPfrSDSIgWXRlRQyw/WfS05VK/o56qf1PyXwyoSmHvNXOk+YUYNXLiG3Y5ZqWKmSzKthd6Y5FaeN7b2fnWTkusTADHYIPscn370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U9aPQ1W9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U9aPQ1W9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZw+s9+hNkGrvJFNAo5F/Jik+U9iZGIw5s6mYsPaxqg=;
	b=U9aPQ1W9sjdCsvqXp6dyV0ZlpkwkATxMXrNCno3Kif5O/M+Kq7T4IZ1GNZsK0ZOiDxMlj6
	sR9ucM+tBfTkH1sfMZFrvCBadCZ81JwxnaL9lCe7xKmYwlxwswIYboTn+Ky9njeqd0oVEX
	ajovX0x7TypPY89OubXqKpn30c3aZwY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-udcZgrb_Ob2l1tdBHuuR_Q-1; Fri,
 18 Sep 2026 09:50:43 -0400
X-MC-Unique: udcZgrb_Ob2l1tdBHuuR_Q-1
X-Mimecast-MFC-AGG-ID: udcZgrb_Ob2l1tdBHuuR_Q_1789739442
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6F35F1830468;
	Fri, 18 Sep 2026 13:50:42 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C7C97768;
	Fri, 18 Sep 2026 13:50:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 12/31] KVM: adjust for presence of more than one attribute
Date: Fri, 18 Sep 2026 09:50:11 -0400
Message-ID: <20260918135030.171564-13-pbonzini@redhat.com>
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

Remove or adjust code that assumed that the only valid attribute was
KVM_MEMORY_ATTRIBUTE_PRIVATE, in preparation for the introduction of RWX
memory attributes.

In particular, the optimization in kvm_range_has_memory_attributes
simply is not valid if attrs == 0 but some of the attributes are being
ignored.  The WARNs in arch/x86/kvm/mmu/mmu.c are just a duplicate of
checking kvm_supported_mem_attributes() during the ioctl, so drop it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 9 +--------
 virt/kvm/kvm_main.c    | 6 ++++--
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ba462c671f7d..77d9c62d2a07 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -8140,9 +8140,6 @@ bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
 	 * Zapping SPTEs in this case ensures KVM will reassess whether or not
 	 * a hugepage can be used for affected ranges.
 	 */
-	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
-		return false;
-
 	if (WARN_ON_ONCE(range->end <= range->start))
 		return false;
 
@@ -8218,11 +8215,7 @@ bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
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
index 9d1836382d19..85fdd33c51ab 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2436,10 +2436,12 @@ bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 				     unsigned long mask, unsigned long attrs)
 {
 	XA_STATE(xas, &kvm->mem_attr_array, start);
+	unsigned long supported_attrs;
 	unsigned long index;
 	void *entry;
 
-	mask &= kvm_supported_mem_attributes(kvm);
+	supported_attrs = kvm_supported_mem_attributes(kvm);
+	mask &= supported_attrs;
 	if (attrs & ~mask)
 		return false;
 
@@ -2447,7 +2449,7 @@ bool kvm_range_has_memory_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		return (kvm_get_memory_attributes(kvm, start) & mask) == attrs;
 
 	guard(rcu)();
-	if (!attrs)
+	if (!attrs && mask == supported_attrs)
 		return !xas_find(&xas, end - 1);
 
 	for (index = start; index < end; index++) {
-- 
2.52.0


