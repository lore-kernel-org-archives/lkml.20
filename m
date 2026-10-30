Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395648;
	b=iKN2zAf4hib/NRgATSq7lfo+ujlXbTD9Rk2ldkXgipaMwwWbHzIzynXfL5kTP4gEm08X
	 oNMNTtkGxYwLM2pCfMM7xCvR0Z5+/oPk5Rh8NIrf9mKTzx2zinopy4BLHwVxnLuj2PhXS
	 cd4WPFJHU1uP/dEVqAnl8BmDx9erZlRMZzl+lijCLTlCxD/GToiiYaEZ8zgF35anFrhlU
	 kvted9muCUB3MD/G5HC2OEyNUWYS31eF0lYvm8LbqfQtCoxeabTxbSCR0dI3AojjzU3PF
	 UXk2SFljpYcsVb4HQ3dF2yocNbvrl59LRHTtsYRoWRfswgm/fTm7GPN/N91knF6tQBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=G8AaUzWd+RntU6ZruI0f6pIRIF5esO/31qYJFDLLq7g=;
	b=w0xjSNDOgz+P5DzZrVhpNqPQppsLNAWvz+eyEbKAvKNi5kTyO5Be/uTKsd73q3JuxxEG
	 uExYCmv2TqIvcubgclwu3HqfSP41LYTsUhmOp9LeVo0CVoqhbd0BBI387KnGQdRjjbGlB
	 ofxgPLWOpcXdBGjop/4VFtrFK3rul3g0d9dCWPvURUSqcY/LkvUts2Ianf9d0V7qW0X1t
	 XXcpmtCsWXcPUpvhtYUOE/gLiO54TBrQit+zrCCwP9Jq/Kigpt8Dubs7YhgDLIJSNtI8L
	 r/rHL/XkIKRHBAbNg9RvHmCpKPfOFvUIptqeymISG60nibX69rCdJ/76u2sxw10HOEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgjvSJNd;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435B860A2621
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435B860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LgjvSJNd
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adad90c894so1236326a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395646; x=1794000446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G8AaUzWd+RntU6ZruI0f6pIRIF5esO/31qYJFDLLq7g=;
        b=LgjvSJNdEoUQbY2y//TLdv3+r3Vhu73F63BlTLvHievYa5EcuNSQ4Ms8pqUwVKGX0j
         STGmmCfGIvW55+VauoLxfRrQiXtR7Xth0e/KGk5Khg81pMrAqqx+BcUE+TcUUUvsr/Mf
         GujRm532izCh2N5WXGxrsjvLGTX2BuEeeI8qh+8V/84JueWWeSUn3D4lcgPZ8veRafUO
         +DNRY7eo3UcWMYfxoibzSntyDN+E5Csr3RVR8Pg1kHQO0mFnTVS4tEyzy552HrBt/5X/
         FvUZdQSyEKxOksHYiPKvma1P8LwKaHvBhqMnh2RZQSjqLFfTHKtZrdNoDtcOsHyN5OZW
         BEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395646; x=1794000446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8AaUzWd+RntU6ZruI0f6pIRIF5esO/31qYJFDLLq7g=;
        b=sgH7hcCV2a89FD00JC6mO4qXWPdVojN+lXn4Px1Ru+prFnXEUAi8Zli0vlHCfmyU9q
         wHwhePYU5Ki2kc7b8tc8O7DC7AY6bNY55+M0O0/pI9vbOicvQjAI/1FcJmOrLtZSn5q7
         JNBjdw7HfrPSM/nf4lOT0tJ2xFNxGT+kCLkdiKX3YukEPgXllatCyykExVLQ8x25zxlk
         Tss51UiIBxMARaGGn+BYz3cWNjO0LfXg2wexlfpl664DQyu6TxcqmIaJseGGABODHTL2
         YipyrwRUQjOkCCkeEnq8B2KAOdOaIUUfaOs/Gp2mAp8cROFTcLbdCZ2EzFataVPrExPj
         yklw==
X-Forwarded-Encrypted: i=1; AKwUvBzasUbjSKvw2oB+9pktkMyfF0QKha2VXYRwDUi2nIhJu0Hxe2LPXNqxv4p9RFQPQ9G4MkhdqvlupIdIDvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBaCmsLWBStxVJXNtdSxpoTQk8jy4A8pvDTak4O9qcG5q0Tc10
	FBFWZf2mcWIc6Pjy379lXgh0olkaDyM7VX/oyIPS6McVCGCpqz4fj6VKsiKso3NTStj+yxq288W
	ADUoKnA==
X-Received: from pjbfz24.prod.google.com ([2002:a17:90b:258:b0:3a6:f777:b24c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:268d:b0:3a5:147a:3b63
 with SMTP id 98e67ed59e1d1-3ae895a5bdemr2713871a91.8.1793395646388; Fri, 30
 Oct 2026 14:27:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:17 -0700
In-Reply-To: <20261030212721.2606393-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-4-seanjc@google.com>
Subject: [PATCH v3 3/7] KVM: x86: Reject clearing EFER.SVME via
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
save/restore, is too high.

On the other hand, yanking the vCPU out of L2 via KVM_SYNC_X86_SREGS is
already "broken" as doing so would queue a triple fault for L1 (because
"wants_to_run" will be true).

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
2.56.0.385.gac671c819a-goog

