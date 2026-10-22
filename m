Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708255;
	b=4QpO+pjts5UG+Vjr8GnIBBGF03sg2mS/tHnWNuTP3FJwMkmomDz+ahLAW+txzJ4s8JXg
	 lSXI7b4+0774UR0KIzPvFtQpXUVJ7qvNVgIYSJ5VXPU/cvWm1FiWe0o6Xt9iziYMlsWsw
	 U6BpTomksiguzyPEf+tsWcrWIe/gU1sGTzxVuRJ4E883YbLpn843dDxrAlDFonKnMBS4e
	 ulcclZpzTc4iCf19wUt7A256qpSJGs919QupAIODMcaxciV3DS35NeMpLNDZ7l1knGXno
	 MIcoOZVcKD6b6rkxy3nngcfurcVKmiUlDVXtwAX30NFa1ctK4oqs9mwevNTuUf3qWOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=OwbTHG0BBRI44nw8ZVf7AVDBK5090sAxtsqzbNEbi2w=;
	b=38XazNcDFY58qpn+FC36jI1RyHRy/d2SDJ5JtU5mLb7G/Vg9XEM+y5cA6YSGYoyjNgjt
	 s7vVSwNlvehZazhRDkrOg211M3ipOLvQC2z5Qx0kQzW0YXsL2aH01tuJrhxAN+5zedsU0
	 BItcLO4Q+fFTvUxOF5omxp3vngYDnpUqS5OXjZ/OFdgnNwfv/qrQONLNB26FQNE0YIRLy
	 y9rrmj6aNWpv4MqjBs0UiIt8gBiqpyvptde31QDt4qlImgBkAiPuwYz7ElF0zSt/6D3yG
	 j7uEZmv1Xx7N2f6uyV/XU3v6ODWC8KRlwWEol7TLYGqmOWe7O7RCj6r2qkMwlMae1/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="iM6ZxJx/";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A1606A32F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD1A1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=iM6ZxJx/
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adad90c894so313105a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792708254; x=1793313054; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OwbTHG0BBRI44nw8ZVf7AVDBK5090sAxtsqzbNEbi2w=;
        b=iM6ZxJx/X82KYmTH5sr6PRrkGRrraNW0V1EAdgj6+Bmb78dod42ZkycrOzwjgQXD/8
         bBzpWo+1z2d6Hv7GF8CJBlUXcDdXEhutC43Etw4judCztSiry6e3wznzdph8VlGH7iU2
         bg/koucO+V/Eb4X6fI1EyjYlJiOXlMXOqFb4F7Zu0M8KzQtqIx+Z9dnuBTUqAxb/D29M
         Wog9pb027k42Q3WxMLWlOd+QgOLbk1ENRnjujbvBDRMqJcONg1TzrgfJ90gbegvILVQF
         NPCwDwMTYjGlyPrc+JzNVHkE0wPzDCv7POOlIFCBG1fgKdJNIMjRx4vMK69XGuUjBYlh
         Iatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708254; x=1793313054;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OwbTHG0BBRI44nw8ZVf7AVDBK5090sAxtsqzbNEbi2w=;
        b=yttFSTdqT3+tk7gztUKpoTLMc7AgV9gIgoW6MiNc5WXymO+N3yg8/hk7W5QlsA3vyl
         gGGLjxT+jQeAZaAvANcThodP1F8YGPfxWFeqye+pR4KRj0mC7FGQyFvxCU86yifBv+mP
         zur/wfWazDAEZai3Dh0jyah29kr6paHsM6oOF2xsyFTKGo22YChLNRSOfZRzG15Hmdj3
         Fpj0GTyd3RmEIpQzT8HSiODHfIcyaMmc60y7UmqtTLMmX3qGF9454BYoO/XtY9dvXr7P
         3ObeknzYxj4wSk/f0i3NFvwyoa3sbjk0AHszaJSk1Z3Rr3cmZHV1n0P0Vfl2oAsxBDrD
         OvWg==
X-Forwarded-Encrypted: i=1; AKwUvBzLTjZQcfQ1Frk2UrvkdH7QVMsqOgHv0XZX0nGTxKJoz+m7p+pWU5WI6KV89Lhb+wYacrBuRZPNO9tZqew=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjyJWiBHy2nnc8fXzli6J+yJT/OnoWAMp0f5gG7yiPVVVpY+BY
	qOEqkuZofF6ym8d5Lnjn5r8ORiyNh+D2SPJXKy19urpiJUro8WdxQlenplH5h0glEENBAAivadp
	dGxiW9w==
X-Received: from pjhr18.prod.google.com ([2002:a17:90a:5012:b0:3a8:316e:fcac])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:180d:b0:3ac:adce:60c5
 with SMTP id 98e67ed59e1d1-3adce7a67bamr200727a91.23.1792708253983; Thu, 22
 Oct 2026 15:30:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 15:30:48 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022223052.646891-1-seanjc@google.com>
Subject: [PATCH 0/4] KVM: x86: More EFER.LMA vs. CR4.PAE fixes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Patch 2 is more hardening.  Rather than pend a triple fault, which is flawed
because (a) KVM still yanks the vCPU out of L2 without going through a normal
nested VM-Exit and (b) there's a window where KVM can do stuff, e.g. init the
MMU, before the triple fault request is handled, immediately synthesize a #GP.
The only reason I didn't go with a #GP the first time around is that I didn't
want to bleed EFER_SVME information into the common set_efer(), KVM effectively
doesn't allow kvm_x86_call(set_efer)() to inject faults, and the vendor version
is used for many flows, whereas set_efer() is strictly used for WRMSR emulation.

Patch 3 is also more hardening, to try and detect+prevent EFER.LMA from going
stale.

Finally, update the EFER selftest to match the new #GP behavior.

Sean Christopherson (4):
  Revert "KVM: x86: Skip EFER vs. guest CPUID checks for host-initiated
    writes"
  KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2 attempts to clear
    EFER.SVME
  KVM: x86: Recompute EFER.LMA instead of inheriting the current value
    on EFER writes
  KVM: selftests: Update nSVM EFER test to expect #GP when clearing SVME
    in L2

 arch/x86/kvm/msrs.c                           | 54 ++++++++-------
 arch/x86/kvm/svm/svm.c                        | 15 ++---
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 65 +++++++++++--------
 3 files changed, 74 insertions(+), 60 deletions(-)


base-commit: 164405e8e9a0378c7e1aff2254625a6553a291f1
-- 
2.56.0.257.gf7497c7d27-goog

