Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8004A0EF5
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719382; cv=none; b=jkN7Qm6OAJfGAau4Pl4RbOjta+W0JIfT8MxfI7rejv+vne2/2maGhql75oQkavYr4917yu5KJX2d0RzdH/hQhTw2CPBATONOPpKicULvBbBtCYaul7plH9Y5ihhiGuj0XwH5lMvbu0Sh/fq3Z3fepQenr7dCqylycqdcDTCgAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719382; c=relaxed/simple;
	bh=uhfwHcFTsphtgoGnq7FEk1hwkzaxHQToX+f3dsmAGd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJoCwOz+QazK1Tq2M9FjOUMM8BggHdXjYWELneH+sy8FwDw5tFDmnP/7YzM2iL4aN/JUAnPA20mHeKbT+FlUlVrvJDUa+En1mVwJlNqxDu3uTsGwq/QvBHnPjiNRZrQiXkW68aVRoNazeAGE0NXdJphSsLnMf5lFRZ2/VoIEeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KsU2t9J6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KsU2t9J6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789719372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUMowBI0tpa/MvWQQQhIIqurSd/Pmjk5XTM/6IbZmBE=;
	b=KsU2t9J6NS2GvYZ7uNarT9z0kJOh/2rInlZiriLRi8pfLXOBNdN41rmVZIDh4E/vHcYHjl
	QLaUPn9PMN14mVcK1d+VPp1gF0Wfq9jtoRYu17MUJ4Um27TPpQ2LBp2KS9CAjImiTT9bQr
	FlR1ZW2/SAL8GnpWcVJ6yTRxJ1WZeVY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-622btM0fMt6LbPq2LuuNeA-1; Fri,
 18 Sep 2026 04:16:06 -0400
X-MC-Unique: 622btM0fMt6LbPq2LuuNeA-1
X-Mimecast-MFC-AGG-ID: 622btM0fMt6LbPq2LuuNeA_1789719365
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96AAE195419D;
	Fri, 18 Sep 2026 08:16:05 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E374E3000218;
	Fri, 18 Sep 2026 08:16:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH v2 24/28] KVM: x86/mmu: Do not prefetch sptes on gfns backed by memory attributes
Date: Fri, 18 Sep 2026 04:15:39 -0400
Message-ID: <20260918081543.139871-25-pbonzini@redhat.com>
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

Prefetched SPTEs are always given full access.  Do not prefetch GFNs
that have memory protections applied.

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 3fd4cc3c57a5..097095f71d60 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3187,6 +3187,11 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
 		return false;
 
 	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
+		if (!kvm_get_memory_attributes(vcpu->kvm, gfn)) {
+			kvm_release_page_clean(pages[i]);
+			continue;
+		}
+
 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
 
-- 
2.52.0


