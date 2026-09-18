Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C710502576
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739464; cv=none; b=swRYZfJkUIuzBTc9XJWH8P0eRf03QJRVcIdwm7cnXTETfHH0bCJf+D3VuY1Px6pAnhf7mIoja8WRrjqs2KS9qCx6rvywe8MiSv/k4NhU2jSr3u8yQqxhswZQZq12HmxGMK4o2X3vvO3Xu0P+9rXouN5z3uXCASdcj5wWx7welBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739464; c=relaxed/simple;
	bh=bfRiqXgDCeNQNJnWYi30YmPa8Q/5PWYYWKP1ztp48hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Thc9pd0bbCQewwGWZreE/3s9HTKP4K0YV7PFHq53jeGZk72XQRiPYqZPMYPIF7Ol1lQRexH0M3kvrHoPZHrfOSOXE2xbsUBslapr9Lr85bLW8TM6/wTz+o1xW72FpP/H892gzmMkNVnOPcj30a2ieLUsAKElSjhqk3B6M/2hNbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oyg9Ghtg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oyg9Ghtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AY5/dZdaTQo8bLuAFkIFIxr6e0AVfLjYr8zjWTqUO90=;
	b=Oyg9Ghtgfyhb89xjWCUd+IjXc0sWpq4+6I2zVhQo4caR0k0kkzEjgoAVVoHkUMUuKNeVfn
	6mZt+A94VlReytuhiHqXO4k1wW1Zn5iw9SCnPycXO9h9rWQNjtOCzRSkF4WSLLbDSeF71x
	3g/So3fjJ6x6gLcle36Au99ZHlMGqIA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-498-zc5hdPVlNByuX0eVg9kL3g-1; Fri,
 18 Sep 2026 09:50:54 -0400
X-MC-Unique: zc5hdPVlNByuX0eVg9kL3g-1
X-Mimecast-MFC-AGG-ID: zc5hdPVlNByuX0eVg9kL3g_1789739453
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 644F51977680;
	Fri, 18 Sep 2026 13:50:53 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ADA14433;
	Fri, 18 Sep 2026 13:50:52 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 24/31] KVM: x86/mmu: Do not prefetch sptes on gfns backed by memory attributes
Date: Fri, 18 Sep 2026 09:50:23 -0400
Message-ID: <20260918135030.171564-25-pbonzini@redhat.com>
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

From: Nicolas Saenz Julienne <nsaenz@amazon.com>

Prefetched SPTEs are always given full access.  Do not prefetch GFNs
that have memory protections applied.

Signed-off-by: Nicolas Saenz Julienne <nsaenz@amazon.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/mmu/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1ecb3f3fe832..3c926f95f87b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3187,6 +3187,11 @@ static bool kvm_mmu_prefetch_sptes(struct kvm_vcpu *vcpu, gfn_t gfn, u64 *sptep,
 		return false;
 
 	for (i = 0; i < nr_pages; i++, gfn++, sptep++) {
+		if (kvm_get_memory_attributes(vcpu->kvm, gfn)) {
+			kvm_release_page_clean(pages[i]);
+			continue;
+		}
+
 		mmu_set_spte(vcpu, slot, sptep, access, gfn,
 			     page_to_pfn(pages[i]), NULL);
 
-- 
2.52.0


