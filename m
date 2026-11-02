Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793641297;
	b=Bn7upYRUGMbutxhnDx586R5ra6PfATa8YsbOhI4WZkKNF4Q1wu/SZjmErl8XvohOjqfD
	 Aazwzhzj1hL83Lur5DkYrUSa75Io8vL5nROtYOFuDmxfKuElnDWMSXAcfa7rZ6XWbF6RH
	 gIqcgPwo4Ia977yQ0XBxR2KkmHzETasdaYNSil0pTgZsAjzwZ+Xg4h8/GZ0f5o7Tm/LsE
	 Mg/qd8mPC3FqWBXk3yt0RpKiqccSNcPgHTodam4BAOKFqTerEO/NPee1zqn4svapy5AAZ
	 D6k0VviWRhD1ZgqREz7vt5vKPY72LVrjupgOBOAlo6AfrX76a3dqefblfQBd3zC0fcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793641297;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=72RIaK6aXLHgfma0uiOrirWKKCJa/+350CoGr5VmFLw=;
	b=PjJ/Z8bOrYdsgLU9cWSbnokH72SrUjF7Il6zwNmeCiI2SDqI+HOM+NubhRzTsFdgzUf6
	 qZXEpBAqGvnFgqT+Mvmtc1wpuIWqSuSYdgLDCmOJXi1y3/AaZmRtCXsJIw6FlOzcT5SJ+
	 e8hSh/LBIWd7syf2g/33dSYiDsJgXvy1zwhmkMNe2x3zMccuL410tRgWFocn1vzC7ou+T
	 JbhMVbXM/cZyr0Xks3wpmeIU2cNxHHzS2O5faeSLeuVtt1sPfLgfbJLQgcqA09epeNWV0
	 /sWYzfVCrI5waW8oJpjcK1blvk2HbksJmNzB90gSI3hiDIiu/kB0zSt01YQ5RFDoYdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P9IYylFR;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B4E6070C87
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33B4E6070C87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P9IYylFR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793641296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=72RIaK6aXLHgfma0uiOrirWKKCJa/+350CoGr5VmFLw=;
	b=P9IYylFRRniy1+6UGaNU3K6fcp5b61iW5oee8QipFlEaWNIUMzeOyIic/sLQnc4PVwLcPf
	0zQ29LDHsF3tTYSMnR6hdSVxgiaiRMr1Leo9x9RONbmXDnJCkCu7dabzCVz9Zv/uclpH7k
	2zdwZ9+Oc8nxZp3nFRbv5tEN6SU7iNk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-0J1UfUYlPYG_6y8CqGFdAQ-1; Mon,
 02 Nov 2026 12:41:35 -0500
X-MC-Unique: 0J1UfUYlPYG_6y8CqGFdAQ-1
X-Mimecast-MFC-AGG-ID: 0J1UfUYlPYG_6y8CqGFdAQ_1793641294
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 160FA1956070;
	Mon,  2 Nov 2026 17:41:34 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AB2DA30001A2;
	Mon,  2 Nov 2026 17:41:33 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 05/45] KVM: loongarch: do full validity check on the gfn-to-hva cache
Date: Mon,  2 Nov 2026 12:40:49 -0500
Message-ID: <20261102174130.8779-6-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

If the HVA or the memslots are invalid, reinitialize the cache.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Link: https://patch.msgid.link/20260918135030.171564-20-pbonzini@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/loongarch/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 4026b9bf9f2d..059a6d605de7 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -165,7 +165,8 @@ static void kvm_update_stolen_time(struct kvm_vcpu *vcpu)
 
 	gpa &= KVM_STEAL_PHYS_MASK;
 	slots = kvm_memslots(vcpu->kvm);
-	if (slots->generation != ghc->generation || gpa != ghc->gpa) {
+	if (unlikely(slots->generation != ghc->generation || gpa != ghc->gpa ||
+		     kvm_is_error_hva(ghc->hva) || !ghc->memslot)) {
 		if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa, sizeof(*st))) {
 			ghc->gpa = INVALID_GPA;
 			return;
@@ -1820,7 +1821,8 @@ static void kvm_vcpu_set_pv_preempted(struct kvm_vcpu *vcpu)
 	gpa &= KVM_STEAL_PHYS_MASK;
 	ghc = &vcpu->arch.st.cache;
 	slots = kvm_memslots(vcpu->kvm);
-	if (slots->generation != ghc->generation || gpa != ghc->gpa) {
+	if (unlikely(slots->generation != ghc->generation || gpa != ghc->gpa ||
+		     kvm_is_error_hva(ghc->hva) || !ghc->memslot)) {
 		if (kvm_gfn_to_hva_cache_init(vcpu->kvm, ghc, gpa, sizeof(*st))) {
 			ghc->gpa = INVALID_GPA;
 			return;
-- 
2.52.0


