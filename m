Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793661280;
	b=peD53GUB4U2e1zYoSMj2p8bhbh3IyJ0OS6FeRMvgMoIW1TE9TQOxYft8nvTgmJSpCDcd
	 taHWnQYIegY08NjLATJAYTuAEyuxdmJYvGP0/pvcSy10b0S/pqtdj1YWpidQaaiki0W5d
	 +042Edar9obwKncxmIj50eEoe4apzAATUTaBPWbhH/mWGEXLRywnbtwJIJ7wft2mnCewp
	 2VaxU/s1AZXLwV9Feg6z0Bu1dEsLoeZQfwPMlZFqgJ2021YmRz59/OxG5cPiD8WmBe5OA
	 XcfQA8kDTvne3k3o9PzqTwHNgreEcIlaR7nu2RNS8wdiHClx9/BMQWJ3jY3J0Yk5Yng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661280;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Dpgu43PluQhmidL1+OiMat/XHlPZOfkRXaB+xajzqbU=;
	b=nBcuM4VmZQwl5Rw5gsMJNvt2Nlh0iAydpHMwgrrxOzQMq2fp5sZYs0EKFbQkccsWiuH6
	 01XcG5pYjwIORYMN7BNnezT7QLjkwvDOYQI1AjaV/jtF4UN0vunm8AKmUebSUQ/37baJS
	 Inu8AmTlKo7k0qrYXqUpLL9JyTSiXcLraeWcTRkOeBFoQ0gSix7TIG5lPfAVFWTlO8dEy
	 9K0Pk4+xDmW+mjh7JvJNGO5L3dMo0ffbtQ/McqvUK2eWXX8stPLgs2ZNS7iT2KYxok5lB
	 35F8UK9qay0S4JGwJmZdp4htjLUbh7J1mQ6AtkctPjNy6rdejR33dDFLa92M/O0Ht4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwIDQ6gM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05267606D82A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05267606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iwIDQ6gM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793661279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dpgu43PluQhmidL1+OiMat/XHlPZOfkRXaB+xajzqbU=;
	b=iwIDQ6gMgKG8OQCttuVdOfeOT3xh5cwwS05nJaxhmuz6Ys4N5T+0eF0RuuAUaZIqYDklem
	HvWawS8B8zQmWYhwZc6Y669Gih41sqHCR7u3djJwFyi/0Be92WySKop3NsDvssiS5Ouy8a
	zUi8+rooobnj/E34opr4lXuAXY2/zZc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-520-KW5uyDlnN52UOKS-oFDcVQ-1; Mon,
 02 Nov 2026 18:14:37 -0500
X-MC-Unique: KW5uyDlnN52UOKS-oFDcVQ-1
X-Mimecast-MFC-AGG-ID: KW5uyDlnN52UOKS-oFDcVQ_1793661276
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE787180065B;
	Mon,  2 Nov 2026 23:14:36 +0000 (UTC)
Received: from virtlab1023.virt.eng.rdu2.dc.redhat.com (virtlab1023.virt.eng.rdu2.dc.redhat.com [10.18.48.26])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B34A26C;
	Mon,  2 Nov 2026 23:14:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>
Subject: [PATCH 7/7] KVM: x86: Flush guest TLB when emulating a RESET to strictly honor the spec
Date: Mon,  2 Nov 2026 18:14:28 -0500
Message-ID: <20261102231428.13523-8-pbonzini@redhat.com>
In-Reply-To: <20261102231428.13523-1-pbonzini@redhat.com>
References: <20261102231428.13523-1-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

From: Sean Christopherson <seanjc@google.com>

Flush the guest TLB when emulating a RESET even though such a flush should
be completely unnecessary since KVM only performs a RESET when creating a
vCPU, and so it should be impossible for the vCPU to have any accrued TLB
state.  Making the flush unconditional aligns KVM's behavior with both the
SDM and APM (ignoring that both specifications contradict themselves), and
avoids having to worry about hypotheticals like "what if KVM did provide a
way to emulate RESET after a vCPU is created?".

Signed-off-by: Sean Christopherson <seanjc@google.com>
Message-ID: <20261022015407.279870-3-seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kvm/x86.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 09c6df00ebb6..26e7beaff8a0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -9731,9 +9731,6 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 	kvm_x86_call(set_efer)(vcpu, 0);
 	kvm_x86_call(update_exception_bitmap)(vcpu);
 
-	if (old_cr0 & X86_CR0_PG)
-		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
-
 	/*
 	 * Unconditionally reset the MMU, even though super strictly speaking,
 	 * a MMU reset is only necessary if and only one of the page role bits
@@ -9750,16 +9747,16 @@ void kvm_vcpu_reset(struct kvm_vcpu *vcpu, bool init_event)
 	kvm_mmu_reset_context(vcpu);
 
 	/*
-	 * Intel's SDM states that all TLB entries are flushed on INIT.  AMD's
-	 * APM states the TLBs are untouched by INIT, but it also states that
-	 * the TLBs are flushed on "External initialization of the processor."
-	 * Flush the guest TLB regardless of vendor, there is no meaningful
-	 * benefit in relying on the guest to flush the TLB immediately after
-	 * INIT.  A spurious TLB flush is benign and likely negligible from a
-	 * performance perspective.
+	 * Intel's SDM states that all TLB entries are flushed on INIT "as with
+	 * a hardware reset", and AMD's APM states the TLBs are flushed on
+	 * "External initialization of the processor".  Flush the guest TLB for
+	 * both RESET and INIT, regardless of vendor, even though both the SDM
+	 * and APM contradict the above statements in other tables.  There is
+	 * no meaningful benefit in relying on the guest to flush the TLB, and
+	 * a spurious TLB flush is benign and likely negligible from a
+	 * performance perspective (especially for RESET).
 	 */
-	if (init_event)
-		kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
+	kvm_make_request(KVM_REQ_TLB_FLUSH_GUEST, vcpu);
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_vcpu_reset);
 
-- 
2.52.0

