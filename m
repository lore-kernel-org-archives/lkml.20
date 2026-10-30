Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395296;
	b=W3Cj/saw6IoHGMQAFKCBWZq/uL3qbNnT9HTl2qTMp9x5Z8ZDHwAjgXx3AgawXlEN6vjc
	 Rd1qpub2RvLkQYuoolrECs0WmFh38W3TunaJyIlNUojV45wCTHKRQ6oHVmb/eQ9UIRmaJ
	 uFeysUSThVOtNPPY3whWCkACdgrokqK7BO6WWua1bHAjjyFGXN4SJG3mlpDaRxOD+hqZ2
	 Qxsd7avcBIMXjNCwZRNZKliyjnG5euzJQrOKUzhD0oG+OT1T4Ok0vlLVtrVo8i85GTQ2+
	 Rvua+0WXkWtM2Gt8WOYWuwOCg6fth1vClBBQouEb7KEZ15SllwQKWi+J2dt46TKjA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=5bp4E318lJOU9KTeZ4/sgGBHaMDL7s7CdLDZqDaaPsA=;
	b=wGCqZmwV3Ms9QPJaoEs3coWeTiVNbk+Qbzkf6duFTwlGVnqstzqPnYcTSsKRkPCFZ6AR
	 hjS/+2XbxvKl1cDRY60Be1WXX7U3zVZy6UjdrcPjxioM3D/vv4v7oxZLj4V4uimsRi/GW
	 GBQjhOlBWLoABmlv6kQOgAiq0mrEi2e6nWj0GiDsLTO0gb6Y5FlGP5Q6X9in4G/+vMkzv
	 oaPzDFcsttSRDiZ7uJBfHwYe518j1wdVVfgI2E+vNJy2TWAC74pKkKIKSxVZeNluZR55H
	 ja/JP4GyaXtVT2OVi6H5O9NXOWRCRv3TXpS89SpeMPdU2dRn8yAn6CKlmvXG11Wlsrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+PQngeS;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C100606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C100606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R+PQngeS
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a59717b0c0so883449b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395296; x=1794000096; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5bp4E318lJOU9KTeZ4/sgGBHaMDL7s7CdLDZqDaaPsA=;
        b=R+PQngeSOkCIs8w+1oDbMZaW7MkHUlsuY7FNbNw7TIre9Em2V58dH7bsp5TUvYBWtT
         3yVvUWlnjcQoxgbq8dZKijcCqmKKB78cgjoyaFtnuAerVV6SGpi/UrzK7r6YUuyDCVqb
         AU5hU5Iw5j4NaX41ayczTXDIO0nBf1fkfTm/9jZivD+9ZvdGwGu4+cy98PEtSxXv6uB6
         QHfBq8yXqnYAMQdPFSUXSl9/DOq6UvKV0zoem8jv8qfpYjgV4xcDUTVismp8V+IF8edC
         TBiSi8QJdmXq4Y0BuWCP8h4onoCZlz1OVhUZKOZMXEI+1uTJr8BifBiPa/gRVWRYcvWb
         foWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395296; x=1794000096;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bp4E318lJOU9KTeZ4/sgGBHaMDL7s7CdLDZqDaaPsA=;
        b=rOr0xVUzWKG/H7zyubseZexvhqejfF3nPi3EEPdWb0Q4hmwUVXFtKRYrHGpfDBmFS7
         LCFVNBe96W1OuXJS9AAK4foRQCCzyzNY1w/4N8JlsB2Lj+gAGme/VNCunJi6Si18WgJ2
         Rw3EhziSArRfSHTQZhW2GCH70LDkFePveoa6O+A0SZyMjvJ7Z53fl6gBQlzDaYdLKfpk
         Ft2yQAALUfCR+pcyNmmLgm5kgk9jssYQZH+rSh5ak9kd2aWSLHjr1Iyqo/DYYn7HEr1g
         qO4l26i7OX34GiRpS8Uptwr8+9GFt8o5smF3nQQ5QK+T04kTDu2pflyok63IumymHLcF
         RpNw==
X-Forwarded-Encrypted: i=1; AKwUvBzTjFO7D0E12T4GYToluNmm9ryHbTxJ/v0p9MYamZJMnOU8PcSF/t7P8j3VwHf//aZl0wRZ6u35sPv9FpE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyFhP5/zfcQBIBT1qTzS8mdZtoeEdLEP/yIqfttQG9YeEVQJ23
	+vMxZstIJxCPo3ySIKCABUUVJ79m4GSH8u7M0ct4BCsXZvi9KtAN70L9boYKjvr7wEmLc6BBWLq
	qZqgBzg==
X-Received: from pgdo11-n1.prod.google.com ([2002:a05:6a02:620b:10b0:cda:ea8c:c389])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:8201:b0:3e2:7643:30b2
 with SMTP id adf61e73a8af0-3e928a7a901mr3766488637.3.1793395295633; Fri, 30
 Oct 2026 14:21:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:06 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-19-seanjc@google.com>
Subject: [PATCH v4 18/23] KVM: nVMX: Cancel the nested VMX Preemption Timer's
 hrtimer in free_nested()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Cancel the hrtimer used to emulate a VMX Preemption Timer for L2 when
freeing nested state instead of precisely canceling the timer if and only
if the vCPU is/was in L2.  hrtimer_cancel() bails early if the timer isn't
running, and KVM initializes the timer when allocating nested state, i.e.
canceling the timer even if it's not fully in-use is a glorified nop.

Canceling the timer even if L1 is active will allow KVM to leave the vCPU
in L2 without having to retain an "is_guest_mode()" check just to cancel
timer.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 1b30ad7731ee..553915015a75 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -339,6 +339,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 
 	kvm_clear_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
 
+	hrtimer_cancel(&vmx->nested.preemption_timer);
+
 	vmx->nested.vmxon = false;
 	vmx->nested.smm.vmxon = false;
 	vmx->nested.vmxon_ptr = INVALID_GPA;
@@ -401,7 +403,6 @@ void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 	if (is_guest_mode(vcpu)) {
-		hrtimer_cancel(&vmx->nested.preemption_timer);
 		leave_guest_mode(vcpu);
 		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
 	}
-- 
2.56.0.385.gac671c819a-goog

