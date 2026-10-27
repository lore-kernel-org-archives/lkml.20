Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141363;
	b=sbWvZrzg6J+On3p7Y9cRSI+xBGFD5eKJZaYZTz+YaIce2JcFQq9ullz8kTYEMClFc6hR
	 6QqZZhESu4q9G1MVHNrlfGlq5mJKl5Llv+dFkD8YGybrPiQruCWeYjPANjPkeKn5qKqLl
	 04w3yZtSkFCMr2/sEoilwb9+tkQ4k+krqRcO8U+gD6EN6xj9TwovVLjM+qfhhw3h1YkHA
	 mmDKN8nb8USIX4W1PdbVyZCyoTZfiZmyo2npi+f71uAAqGxmanaxCQyRrdHsRI5XNEG4J
	 16C0e3e6vu4D24k+8zv/NeGCTaL/LlbO84k43JBD4/VbniSY3EbO1XR+4Qx2dgVOTdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=rPyIfNHSmQl9N0tBTc6cifxAo9r1UjJciqioG/XS4iU=;
	b=LoDsBIfAG0ItIPrpRr5UDXIYGstpv9lCpHsBGsuiCYszfcWnzXets8da7Y0OfRznTKDa
	 vbadDiX68zAmAFQdDossmoGSjfe7C5baMs7KC4YR1iHXGsoxbIpL8d8CBG9HZ6ou4AhSq
	 XMJrkxk1cbDFiUBkLmBJZ91ddDDc5F8bSbZJGnXhrZoyaK+CL3ZJwuPUrv4m+T8o+4clt
	 Z6QeRufd7IfNTPw8gmAjTxJQbUZz6vrK/naS3M1cDgbfyuYLL2snhJ+WEpnlUJN6b8TLA
	 lsIIG8pRXEItokiHp9WOKDBwv8I3G/dIv16oHjDf2NFs9vgCffa29suueW+Y9hX7e9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="U/PKBmpf";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A1C606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5A1C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U/PKBmpf
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93f67358eso2624385ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141362; x=1793746162; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rPyIfNHSmQl9N0tBTc6cifxAo9r1UjJciqioG/XS4iU=;
        b=U/PKBmpfCqkmnXXZLl2Uk9oEM7R3F9931eeybSP0vqQPGSGW82Ka3f8AD9K3IuSv2m
         VUbPtVemhr+E8MWXidmeM9QHSA7mJtWS4ne0cL+TkhW88a6b6ijPhLC51V3pGfY17uko
         BAQtAsBYFpTHawD/C9Swo0mhYPMqHHpS3Zlv5CFtVHt1Z1Wr0HDwsCy8maL4ObBD/KWx
         90NdrAkllzejG2wRRqVAN3HQ3OwjWDRiugyyqCfKhWrXlSZdOHQWYAlD2XtD6guQDUYU
         r3kvJLqW4Yi5ZZAuTq5+Nw2WcX+cfZoTNOkmVCJA87h0kC2al483WXSHCErTY/kJZyzi
         Xwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141362; x=1793746162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rPyIfNHSmQl9N0tBTc6cifxAo9r1UjJciqioG/XS4iU=;
        b=jnA1wAbL75bKHW2Hr5K+KdXLsDX3G05hC8zAjTy2YseGL0wTCa5JZ1a0RpvjEHA8OC
         pmFP9QugD1+NWaWvHrXpZK+QsjR/5nrXK9YN9ZgmiKGZT5kE6UzCkTnZdK0sSuy+J0m2
         7xogygVMGv2SEwLBGCZXz9BNcya/XP4ktiLzg0ING0GZBjymvYwHxlTqvLoKxQfOzdSr
         TdIDHxsdnNrA70r+XJHFPEnklfPsuywWq+ldwWuBDIe3kYSK2U07yx62VTu+qNyiaNkl
         8l0m3Y+ElQd87ach6fI80pTgNQrZLCWzT/ipLog73ZiRZ9l3yjuT16ngFnATL8+aQSFM
         4wxw==
X-Forwarded-Encrypted: i=1; AKwUvBxvXn2KNjlq+YjiVnSzMZrPeUeEe9N5fHXot5RAChWe5cBniHGCMg6MU0XijaNbGatmqp62B0oYGi8Zu2A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6sZRnac6lMwQ21Q0Lz5pZwKX3GPdKHnIa8j4HrUr8myP1b7O6
	L6trT6Qh2w9oZZI+aBQ7hXShUSsYORuu1R9KNFLEabC08A/CBaptu7zjzurqvcsvbziixoHqgQH
	WaMJ6Mg==
X-Received: from ploh18.prod.google.com ([2002:a17:902:f712:b0:2e6:8c1:2fb7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b25:b0:2e8:18ca:5f46
 with SMTP id d9443c01a7336-2eb00337041mr5894305ad.14.1793141361948; Tue, 27
 Oct 2026 15:49:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:10 -0700
In-Reply-To: <20261027224914.1574319-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027224914.1574319-3-seanjc@google.com>
Subject: [PATCH v2 2/6] KVM: x86: Reject clearing EFER.SVME via
 KVM_SYNC_X86_SREGS if L2 is active
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Disallow clearing EFER.SVME via KVM_SYNC_X86_SREGS if L2 is active so that
svm_set_efer() can treat yanking the vCPU out of L2 during KVM_RUN as a KVM
bug.  Ideally, kvm_is_valid_sregs() itself would reject attempts to clear
SVME while L2 is active, but the risk of breaking userspace, e.g. across
save/restore, is too high.  On the other hand, yanking the vCPU out of L2
during save/restore is already "broken" as doing so would queue a triple
fault for L1.

Link: https://lore.kernel.org/all/sashiko-outbox-182127@kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 3621f1a47d37..e53496fdeb82 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -738,6 +738,10 @@ int kvm_run_sync_regs_from_user(struct kvm_vcpu *vcpu)
 	if (vcpu->run->kvm_dirty_regs & KVM_SYNC_X86_SREGS) {
 		struct kvm_sregs sregs = vcpu->run->s.regs.sregs;
 
+		if (is_guest_mode(vcpu) &&
+		    (vcpu->arch.efer & EFER_SVME) && !(sregs.efer & EFER_SVME))
+			return -EINVAL;
+
 		if (__set_sregs(vcpu, &sregs))
 			return -EINVAL;
 
-- 
2.56.0.307.g5fe7bd680c-goog

