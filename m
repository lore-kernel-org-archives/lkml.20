Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141360;
	b=jwUFozGhJftaGmRnl7lr5zR/E2UZk7djQ/OPaumr2PJD14YPDcYU2oATNJ8qwuBer+AQ
	 U0/BX/opi1SApqR6PPJyxinBJS2ANpCO/i/F1uOWmXIfHpe2xwq0erJ8PDE2KBymYh5aD
	 ZJgumDtGWxS/2N0smWShz7eMrx5AyZINrprNSjHx4RYIfUqhCysJ6Qx4sLMheBtFF5orB
	 aW+SqpmybR0ZDrrUpDSAf4+brja3lFqd6Psh7FZxknyUWjQ5z5IIqzX+GAVGS/8SzhEDY
	 LzalEk2cRiBFjJk5P3iQ3GVp3SkWMUdvrYZzsv8Ed5InsuiCtLtdnHkRkoEYGDxdo3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0siHLmY7jqw5ijMhn2w+ZHZaBh8kJXscofyY+4DEBpE=;
	b=dKsV6lEsVBfGyO0jmzXM5XLssaXOU/xc6VTIawTEVR29COVGJuKXjaGhcGYc+kPimD2I
	 0udOCnkVFYDPCjXVD+sS4DR9pMHNgmQvC4KxokxEDs/8DMRNy7KM6avLpF0CQ6tG2yHk1
	 Pl95hJIo+XKu7a+uFlJYXibuP+6qtO/t2OHH8daE6TFQe/4Ua/t5L5r1El/uEieJH4JBf
	 0m1bfahP6mvtgtabHnRvda5V+UFabcfWjSu10tP1HaZA4UkWA7LRIwTGYK6iybU4Vs8PO
	 5IJLx8jY77/jdxYLPoBl/14GE0vzWpnNKqgyr6sR+wvLtvmjoM6cO60q+rjQFcdxzgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZZV2ut1;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEE5606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CEE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VZZV2ut1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e93f266d20so4083035ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141360; x=1793746160; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0siHLmY7jqw5ijMhn2w+ZHZaBh8kJXscofyY+4DEBpE=;
        b=VZZV2ut1CVciSEcV9+PNFaIetu+19iAElwLaOb8ab1I3FLxhslzz7Ltzkel+6wWzlt
         kusVKaJEPAMD1ehX8ZoYfNoU/86+XpSTWrx0aGp2XIiO5mxaQFK4GZwQ3VtuKM1yOjGc
         zRyPE3lFt07XfWAgU9aY883oBxLTH3L+aK6QeLcVadWOIIxTeStdIedew1vmQFwfO8HP
         oyzaZ4LfdgiGY/fZk+tO2FoUsq10A9H89M1MjHmRFJz6ag77KK0om5VTLPZAyw8UGXQJ
         1FR1Vt7rPJwxhfYCOjnbWirra6VQuBwZ/s6fvBMMsLykJdgyd7a6PkklJqSPQBFxpFCk
         iEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141360; x=1793746160;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0siHLmY7jqw5ijMhn2w+ZHZaBh8kJXscofyY+4DEBpE=;
        b=KISQyYK+GiRr/I5hZdzEXmNbBHMRM2GgU8cfDUBPGHHB8xcZg7tLN+zmUJWB2YoOAB
         pi+qYPtnCsYxSvRd7MUEaQ1z1pG/2Fun5A003UPcKJk2SPyhd6nGXGhzVFs8l1UhZ6Op
         pQUIbVUYfgRlkXvlGZI2LWQ3dVFxvt+nUTe8w4jFWdfqZ5lfzc/e5cA4buowNu933dLh
         bt1Y5d/RdIZWOvVTL2AA09USq43s8yJxK5H4EHey327mc1IQr/LJvV80tiDyk+eZ2VwW
         veMleDzRVxKP0iXx4aT9K+JxbEanDF94Kq07Wqs2hG7/q12Ux518dqUteHxhVV/EfTbP
         xEiQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/iOfjrHLDjLILHdj9jb44vKU6HKqt/sBaZUkC+fAaGFsXauBNiobILWB54CTluKWg/JzzjU9z/8hkum4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw2dKVMmxFNqax9zqmw5Cn9CgiVz2m13Tk8eApfi294Hrb54/s
	1swKarhAVKo+9TrtgGqyYUVcrs9qiyUMztlJOvK2+7fi2EgKJG7eend50Ne4ZYbkajz/MMVc9Ly
	alZdBkg==
X-Received: from plhx12.prod.google.com ([2002:a17:903:2c0c:b0:2ea:829f:27a8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d541:b0:2e9:77c0:c7ab
 with SMTP id d9443c01a7336-2eb003c917amr7068955ad.29.1793141359612; Tue, 27
 Oct 2026 15:49:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:08 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027224914.1574319-1-seanjc@google.com>
Subject: [PATCH v2 0/6] KVM: x86: More EFER.LMA vs. CR4.PAE fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Revert a change I made years ago to allow userspace to stuff EFER before
configuring guest CPUID, as configuring CPUID and feature MSRs before anything
else is now a hard requirement (though I suspect I was just a bit overzealous
at the time).  The biggest problem with that change, other than creating what
should be impossible state, is that it also bypassed this check:

	if (is_paging(vcpu) &&
	    (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
		return 1;

which was kinda sorta intentional?  I assume the idea was that userspace could
stuff CR0 vs. EFER in any order.  Except that in doing so, userspace could get
impossible state in CR0+CR4+EFER (in the aggregate, not in any one individual
register).  KVM doesn't advertise MSR_EFER as an MSR that needs to be
saved/restored, and AFAICT no VMM manually does that, they all just use
KVM_{G,S}ET_SREGS{,2} (which is what we want).

So, hit the "I'm feeling lucky!" button and simply revert the misguided
commit.

Patch 2 plugs a hole where userspace can get at the "wants_to_run" logic in
svm_set_efer() via KVM_SYNC_X86_SREGS, which is "fine" for now, but would let
a misbehaving userspace trigger the KVM_BUG_ON() added in patch 3.

Patch 3 is more hardening.  Rather than pend a triple fault, which is flawed
because (a) KVM still yanks the vCPU out of L2 without going through a normal
nested VM-Exit and (b) there's a window where KVM can do stuff, e.g. init the
MMU, before the triple fault request is handled, immediately synthesize a #GP.
The only reason I didn't go with a #GP the first time around is that I didn't
want to bleed EFER_SVME information into the common set_efer(), KVM effectively
doesn't allow kvm_x86_call(set_efer)() to inject faults, and the vendor version
is used for many flows, whereas set_efer() is strictly used for WRMSR emulation.

Patch 4 is also more hardening, to try and detect+prevent EFER.LMA from going
stale.

Finally, update the EFER selftest to match the new #GP behavior.

v2:
 - Disallowing clearing SVME via KVM_SYNC_X86_SREGS if L2 is active. [Sashiko]

v1: https://lore.kernel.org/all/20261022223052.646891-1-seanjc@google.com

Sean Christopherson (6):
  Revert "KVM: x86: Skip EFER vs. guest CPUID checks for host-initiated
    writes"
  KVM: x86: Reject clearing EFER.SVME via KVM_SYNC_X86_SREGS if L2 is
    active
  KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2 attempts to clear
    EFER.SVME
  KVM: x86: Recompute EFER.LMA instead of inheriting the current value
    on EFER writes
  KVM: selftests: Update nSVM EFER test to expect #GP when clearing SVME
    in L2
  KVM: selftests: Expect failure when trying to set EFER that violates
    vCPU model

 arch/x86/kvm/msrs.c                           | 53 ++++++-----
 arch/x86/kvm/regs.c                           |  4 +
 arch/x86/kvm/svm/svm.c                        | 15 +--
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 95 ++++++++++---------
 4 files changed, 92 insertions(+), 75 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.307.g5fe7bd680c-goog

