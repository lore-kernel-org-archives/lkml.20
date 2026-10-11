Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA7136351
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791677601; cv=none; b=tYCVS9ui31IhuB1Q5A8wBH2HsD3O8XeDN4XaCFT5oYyZJrMyfr5Ak3N+cTQj0t45NteCXQAeeiw3+SPetAaNYMeT+yJ6786DDhlKJWJRJTqRlUSVgMyzKfz596CT+7MMHs3GJByIHsRARzECAg0hjZS1AJew2ZKAqfOL6C6N3/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791677601; c=relaxed/simple;
	bh=v9hbG2TaNgDl8Rr4jAG+b+GBPvNFBa4z7yYJrvhVWSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VOlxCsPi9fvsG6ivamnh+MV3Z/Y5fand2+/Ccs2ZJ9jRkS/7PSPvszh0gS8f0zmrMaDJIlYYrKaOYCWsRY+kPDUg6kNmMl0ycxKlAJgSu6OeKWWfcRybDBLH5WyYF3IyniC2JK75CFYc8u/HLyN2EFOfb/mYfsCmcy4Uw20So9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGJ6faSJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGJ6faSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791677597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogTZTmvJ2qvD7NtV4U1V+1mC1ykwnoEHDet1F3Kc2nM=;
	b=IGJ6faSJkOOEAqykLDpXaGjzAQXxYJGtNzexZhT3D1TdelVue95MOJk/U5YiAl4lVqh0be
	VdNxoTACkhGnPiSM4m4v8TL1TLEyBiNi4oehh+QShjXOHbYGuDS+QhGolLYpspP+OMi8AM
	6U4KmYoQD/POr9pLd+E8BQ7Ns6rIvKY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-HUv9xa_wONejjzfzmTKIKA-1; Sun,
 11 Oct 2026 00:13:09 +0000
X-MC-Unique: HUv9xa_wONejjzfzmTKIKA-1
X-Mimecast-MFC-AGG-ID: HUv9xa_wONejjzfzmTKIKA_1791677588
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4A1A31955EA2;
	Sun, 11 Oct 2026 00:13:08 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3183D1800351;
	Sun, 11 Oct 2026 00:13:07 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH v2 2/2] KVM: nVMX: avoid losing the posted notification interrupt when exiting L2
Date: Sat, 10 Oct 2026 20:13:03 -0400
Message-ID: <20261011001303.723721-3-mlevitsk@redhat.com>
In-Reply-To: <20261011001303.723721-1-mlevitsk@redhat.com>
References: <20261011001303.723721-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

While delivering a nested posted interrupt notification
(see vmx_deliver_nested_posted_interrupt), KVM assumes that,
as long as the target vCPU is in the guest mode, KVM can send the
special POSTED_INTR_NESTED_VECTOR, which will either trigger APICv ucode
to inject all interrupts into L2 or cause a VM exit, after which
vmx_complete_nested_posted_interrupt is supposed to finish the job.

However if the target vCPU was about to exit the L2 when
nested posted interrupt notification was delivered in this way,
it is possible that it will be lost.

Fix this by running vmx_complete_nested_posted_interrupt just before
nested VM exit.

Detect this case in the nested VM exit path and act accordingly.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/vmx/nested.c | 7 +++++++
 arch/x86/kvm/vmx/vmx.c    | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 8504a2c12d9d..1b2f55a13993 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5114,8 +5114,15 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 	if (enable_ept && is_pae_paging(vcpu))
 		vmx_ept_load_pdptrs(vcpu);
 
+
 	leave_guest_mode(vcpu);
 
+	/* pairs with barrier in vmx_deliver_nested_posted_interrupt */
+	smp_wmb();
+
+	if (vmx->nested.pi_pending)
+		vmx_complete_nested_posted_interrupt(vcpu);
+
 	if (nested_cpu_has_preemption_timer(vmcs12))
 		hrtimer_cancel(&to_vmx(vcpu)->nested.preemption_timer);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 612ab07d4100..21f2f8e4c4f0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -4381,10 +4381,15 @@ static int vmx_deliver_nested_posted_interrupt(struct kvm_vcpu *vcpu,
 	 */
 	if (is_guest_mode(vcpu) &&
 	    vector == vmx->nested.posted_intr_nv) {
+
+		/* pairs with barrier in __nested_vmx_vmexit */
+		smp_rmb();
+
 		/*
 		 * If a posted intr is not recognized by hardware,
 		 * we will accomplish it in the next vmentry.
 		 */
+
 		vmx->nested.pi_pending = true;
 		kvm_make_request(KVM_REQ_EVENT, vcpu);
 
-- 
2.54.0

