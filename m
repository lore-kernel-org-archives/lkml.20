Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F031250128A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739443; cv=none; b=K7dnQI0iEKjebJTdtb0vky70qwb+UJf1LdvL13mr57B1SMCMcrTsnWqNPYYLNwzXATmimztkTn9CCiQv6GErQs8lxAGEhgvGr5t4F7lGSY5u4w0o7ShQO6JCJ7ZDrN8mkDvlHA8NXZE86QTvFVoC72LiKleRrsZGNOjh38goDWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739443; c=relaxed/simple;
	bh=Tuh97MeyjRVDz9bvq+FuTIyczjz1aG61XUKvmZL7z9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPFwbaPhAhzKfgxAeC+nZ1uRJNuGZJfvGGctlh9n0YucWdwR8cgJwi0oCOurtrVLDr5Nh6jXkgILSGmvwdwOZi48Q2HPXAvCPSfF+1jUdORDk+JWJXx9WcLtCOrjSvhqywIxk3Zkp+7aCKe3gJbtUyiDahZhEXdDoRfmQq9h46U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CtEeKbYb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CtEeKbYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789739440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BUh0dGnjo2aioE2Eoymn6yY6XaVUVY1s/w71Tv+xfxc=;
	b=CtEeKbYbmx/ZBN6ta0PY60jK9fCKGco1Vc64irgNd/9W1kBRkwrHDWOObE4XiIst6z6t8V
	PZVkRoOGBIiIrBxiifXcexzzyePv0UEauFS8bNhLEsEmlwZEOhzpC9K2RCH3CwTSLHU0nZ
	4OUo+fVeQhv6yFNG1cAIKr0HhBwRFWk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-hfCtXSUfOR2DlEXgzBSOyA-1; Fri,
 18 Sep 2026 09:50:37 -0400
X-MC-Unique: hfCtXSUfOR2DlEXgzBSOyA-1
X-Mimecast-MFC-AGG-ID: hfCtXSUfOR2DlEXgzBSOyA_1789739436
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 753541964CDF;
	Fri, 18 Sep 2026 13:50:36 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB0E31956042;
	Fri, 18 Sep 2026 13:50:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: nsaenz@amazon.com,
	vkuznets@redhat.com,
	snambakam@linux.microsoft.com
Subject: [PATCH 05/31] KVM: apply nGPA->GPA translation to KVM_HC_CLOCK_PAIRING
Date: Fri, 18 Sep 2026 09:50:04 -0400
Message-ID: <20260918135030.171564-6-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

KVM_HC_CLOCK_PAIRING writes to a guest physical addresses.  Treat it
as an L2 address when running nested, which is consistent with the
Hyper-V TLB flush hypercalls for example.

This is technically backwards incompatible, but it should be extremely
unlikely to happen in the wild and thus we can treat it as a bugfix, I think.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/x86.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4b3681796c75..0fbe2d4e685f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7195,8 +7195,8 @@ static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
 {
 	struct kvm_clock_pairing clock_pairing;
 	struct timespec64 ts;
+	size_t offset = 0;
 	u64 cycle;
-	int ret;
 
 	if (clock_type != KVM_CLOCK_PAIRING_WALLCLOCK)
 		return -KVM_EOPNOTSUPP;
@@ -7217,12 +7217,20 @@ static int kvm_pv_clock_pairing(struct kvm_vcpu *vcpu, gpa_t paddr,
 	clock_pairing.flags = 0;
 	memset(&clock_pairing.pad, 0, sizeof(clock_pairing.pad));
 
-	ret = 0;
-	if (kvm_write_guest(vcpu->kvm, paddr, &clock_pairing,
-			    sizeof(struct kvm_clock_pairing)))
-		ret = -KVM_EFAULT;
+	while (offset < sizeof(clock_pairing)) {
+		gpa_t gpa = kvm_translate_gpa(vcpu, &vcpu->arch.gva_walk, paddr + offset,
+					      PFERR_WRITE_MASK | PFERR_GUEST_FINAL_MASK, NULL, 0);
+		size_t len = min_t(size_t, sizeof(clock_pairing) - offset,
+				   PAGE_SIZE - offset_in_page(gpa));
 
-	return ret;
+		if (gpa == INVALID_GPA)
+			return -KVM_EFAULT;
+		if (kvm_write_guest(vcpu->kvm, gpa, (u8 *)&clock_pairing + offset, len))
+			return -KVM_EFAULT;
+
+		offset += len;
+	}
+	return 0;
 }
 #endif
 
-- 
2.52.0


