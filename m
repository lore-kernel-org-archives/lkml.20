Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48AF4D7965
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579051; cv=none; b=gLk2O8J4nFI76Ez+Dd4dC2TVUBb2HL3MWFRWRV+WXsY51fJGzzBjmwuNXNGUrOz1GMAOdH3JvEKUyTEjWVqvLV/K0a+YULqL7Y6kTt7W81i6tLWxP6F+cLipNoO7sOFCmOokcxydupUZZ8uIdDzTn9JyhLpmq1JhqUPvTkHNSfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579051; c=relaxed/simple;
	bh=8Gs1d740/WG62XMlf0EOI35ECZVTTmQ0jDWyGyhy+FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hHO/dqZoVF6WzL/fjKckzt2wEehVWrDZqxDIYoMRc9BMAPhRBvPTW9Oo7jKvkjfipxqSaRon63qDoKAHJ/l+w7FOzM46hjkvDSXNVbuir30cpZNPEujriiSPkb8yn0GAKnj8UriHxRkBTCrBfsRs8IgYWC4Wh+LM/87dO52urRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGvJeoPA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGvJeoPA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791579045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goJ42vVa/6g/ckeQD9hR1HE5AR+RatDSYAG7UDCyL6U=;
	b=aGvJeoPARIruRZ5Z9jjOYI2IjyDZzSEgPu4YbygRz8+1msgOfkQcF3U5XEXMeAmk62fElt
	At3QYaHVdmsUDZbIi9oKGXHWxd21h1poMRWEjfDd6JPbeASrufnkDTV+jK1ww3sOu/VRXN
	sUJtNCnXkeR4gSFAjUGUkrQ9dwPJwTg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-HFsqf8mNMJy1kjSxIem0uA-1; Fri,
 9 Oct 2026 20:50:42 +0000
X-MC-Unique: HFsqf8mNMJy1kjSxIem0uA-1
X-Mimecast-MFC-AGG-ID: HFsqf8mNMJy1kjSxIem0uA_1791579041
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3FA3719540FC;
	Fri,  9 Oct 2026 20:50:41 +0000 (UTC)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3ED6E18004D4;
	Fri,  9 Oct 2026 20:50:40 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: kvm@vger.kernel.org
Cc: x86@kernel.org,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-kernel@vger.kernel.org,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [PATCH 2/2] KVM: nVMX: avoid losing the posted notification interrupt when exiting L2
Date: Fri,  9 Oct 2026 16:50:36 -0400
Message-ID: <20261009205036.672523-3-mlevitsk@redhat.com>
In-Reply-To: <20261009205036.672523-1-mlevitsk@redhat.com>
References: <20261009205036.672523-1-mlevitsk@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

While delivering a nested posted interrupt notification
(see vmx_deliver_nested_posted_interrupt), KVM assumes that,
as long as the target vCPU is in the guest mode, KVM can send the
special POSTED_INTR_NESTED_VECTOR, which will either trigger APICv ucode
to inject all interrupts into L2 or cause a VM exit, after which
vmx_complete_nested_posted_interrupt is supposed to finish the job.

However, a third case is possible: if the target vCPU is about to exit
to L1, the posted notification interrupt must be instead injected
to L1' APIC, but KVM doesn't do this.

Detect this case in the nested VM exit path and act accordingly.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 arch/x86/kvm/vmx/nested.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 2142e25c9b6c..4d8bb7f7fcd4 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -2445,7 +2445,7 @@ static void prepare_vmcs02_early(struct vcpu_vmx *vmx, struct loaded_vmcs *vmcs0
 			 ~PIN_BASED_VMX_PREEMPTION_TIMER);
 
 	/* Posted interrupts setting is only taken from vmcs12.  */
-	vmx->nested.pi_pending = false;
+	WARN_ON_ONCE(vmx->nested.pi_pending);
 	if (nested_cpu_has_posted_intr(vmcs12)) {
 		vmx->nested.posted_intr_nv = vmcs12->posted_intr_nv;
 	} else {
@@ -5162,6 +5162,14 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm_exit_reason,
 	kvm_clear_exception_queue(vcpu);
 	kvm_clear_interrupt_queue(vcpu);
 
+	if (lapic_in_kernel(vcpu) && vmx->nested.pi_pending) {
+		vmx->nested.pi_pending = 0;
+		if (!WARN_ON_ONCE(vmx->nested.posted_intr_nv == -1)) {
+			kvm_lapic_set_irr(vmx->nested.posted_intr_nv, vcpu->arch.apic);
+			kvm_make_request(KVM_REQ_EVENT, vcpu);
+		}
+	}
+
 	vmx_switch_vmcs(vcpu, &vmx->vmcs01);
 
 	kvm_nested_vmexit_handle_ibrs(vcpu);
-- 
2.54.0

