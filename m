Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CEE4AF14B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719374; cv=none; b=iA6QuncASulQ5FuziqBd4I5mCocMhk2Xb1wF79lnqXvAFKWY5Hyo1uADP+bhI+Vc1ZnWHhukaEFvq6mCuqL5wjvRc8iwZ7No4ungK43bfhzKY2Ftw89pZg16oaGK8VRz8mXBUpKIuFLdi8/IyDjb5sFuBIa+ibJK5WJZeWKIW8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719374; c=relaxed/simple;
	bh=3fY4WlcZJ6wOE2Ax39CGRJ/RSbNMWT2vQvLgD0k4WK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WUWm+VbUbEIn5iol3nGkGjdF8E7x5pPzX8M96RInh44CYOm0mkOBhVTGHcXTtdqJe4+5X2sLNF03KszaFrPU3bKeF4EVjmtXAqf6oA4PZCKBoHkOi+gyTzg8Eqo6w00g25X9nnX0VhU9qq3Gp04upWvKf5dljk3SKT3+AXHTz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d086OQ/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d086OQ/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789719367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Jol8ennk1TZbPIOM6O5ZAfPzLlJYocGjoT0OUGC9e2Y=;
	b=d086OQ/88NXU+QNaLtoZ4mjnQFo/gixB0QxXytK1isBOSB2LqPY/nPucWZPVQ90AllIgiV
	s9+u7Jhcrk33K6s/eDHTIF5hhbpkTEQKecGr2xrbKpec/j+h2BZ9I3a7S9O5EpQ4vt59uc
	a93LS9458q1ir+x4goEu+sVwOfhR5tI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-649-VtmDwBMrPVymEKG1956PdA-1; Fri,
 18 Sep 2026 04:16:05 -0400
X-MC-Unique: VtmDwBMrPVymEKG1956PdA-1
X-Mimecast-MFC-AGG-ID: VtmDwBMrPVymEKG1956PdA_1789719364
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BD5DC1944DE2;
	Fri, 18 Sep 2026 08:16:04 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1598B30001A2;
	Fri, 18 Sep 2026 08:16:03 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH v2 23/28] KVM: x86/mmu: Do not update accessed/dirty if guest PTE is read-only
Date: Fri, 18 Sep 2026 04:15:38 -0400
Message-ID: <20260918081543.139871-24-pbonzini@redhat.com>
In-Reply-To: <20260918081543.139871-1-pbonzini@redhat.com>
References: <20260918081543.139871-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

From: Nicolas Saenz Julienne <nsaenz@amazon.com>

In this case do not go all the way out to userspace and just stomp out
the write.  This is consistent with the way KVM handles read-only
memory slots during emulation, though admittedly inconsistent with
everything else: NPT for example always wants nested page table entries
for the guest page tables to be writable, and will fault.

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index d2836a327bc9..2ff655edd57c 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -419,6 +419,9 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 			goto error;
 		}
 
+		if (!kvm_mem_attributes_may_write_gfn(vcpu->kvm, gpa_to_gfn(real_gpa)))
+			walker->pte_writable[walker->level - 1] = false;
+
 		ptep_user = (pt_element_t __user *)((void *)host_addr + offset);
 		if (unlikely(get_user(pte, ptep_user)))
 			goto error;
-- 
2.52.0


