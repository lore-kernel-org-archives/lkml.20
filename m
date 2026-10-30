Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395644;
	b=uqCOsTJJoZ2YYkipJi+XkS/WtuP7h3BdAoCvMmu4xNTeTv7DjqJCL7VJD7c1bIO2NZRK
	 0mVNxbrjKrWIEFqC8FrIeNB9aXuWhCLMw4z5cN6yKs0tjvkcH4IUd0zzW3VBSEOxyb/NE
	 4V8S5F/NaQT2+1lEAkRPjlARXjcSl9FD1/d6cQlprGQuzlPl1yk01iNmW5lzlfkM5AX4a
	 0eS8oi+kh3AfKDZCNOJtSVGeIvq5x7+LdoXg9rO19qKiid8iDV26aEDG/J9VxKyAMmUwt
	 UVRjHCEwoUuDnZSstl62OyS863zO/0vT3kaSeKkGKZqwPXMBCrFIskKor8PszBCL4qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7Ob7KYJItudywiOa9GHKXXoVLHL0NZzME1xZdaLq2EI=;
	b=JVnmsJHWZOnRei3tBcvbJDx/JibUJt+8CamE8MfYd31JJeMMXDJ9kNXDv8h9MQX2p3Bm
	 MmoCJcadLHOJ3/wSIs9YTvkR1/cQ2NGabcB5fDyK9ZpywqwRV1zpJvHbc6ga6qz+89pbi
	 /rDwhNANO54IHzMNVi8G0uzE/sYalbzv5msU7qNFWHnA2xqa43n2fi95sV9egEH1aCEWV
	 rCCQBLK98+Xu1VeiUZW8hi4agOzbPdNcxGLGk5L9YiHoUQlRBJJ/XTPYFeE7CA+0nm6ab
	 PpStBWAl7xhWtUJ4NfhKPN0kutEcEGwOQoG7Svm1SsGPi7gzkDa2uKetYZlste0iimw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kc0d3K0U;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02D8606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02D8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kc0d3K0U
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso1440440b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395643; x=1794000443; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Ob7KYJItudywiOa9GHKXXoVLHL0NZzME1xZdaLq2EI=;
        b=kc0d3K0UPTQ8DRPZG2fjRZTYPhaAP1Kydbh4D8TaLgJbPZjE33Pld89hghWGtVXtay
         FiFB6b542LOTRVwNN6UW2hoy+iBuyTfzg5+ahNY7K5MyL7GafW2cqXqE2zvqrutAKI8G
         fsw8PVsRFXdMVtcHYJkUczWI/aCqBCo9rki/YNOkZnMO26M8sAKM7mk3DgFT9PqdkClo
         PZwkvZttnNM/uYXS7ps9PIvNoRjGnyyCJl+YpWxPkuG0qcSuDtTShE113+/V2wra18SN
         11MLqcxAmL1NmT6pFGb6MuCdVuCBlw9TNcNIXmFqC6jg2uFiTtctT4Z7Vc5/j6+s1+uw
         F94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395643; x=1794000443;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Ob7KYJItudywiOa9GHKXXoVLHL0NZzME1xZdaLq2EI=;
        b=pQFOaw2h4HS6P26IArVJlLnssZvYnNTN7OVsXeY9jB7qT+ypjXlKdYYQvZFc7+dwZ3
         JUExoMZeX08ldAkM+PUwPaPnqTC+AvS/+UYKMutc2OIVEiHq2W8GAr28V0ISgyK8WAur
         qeNlhtK4076oYg6dWeRXEvhU5zxjJi+OwbTv7RWJHJzEEJoyLEPjh66cVXqNs4u8OceD
         FeeoSOzPTptO/Hc2oyFwPeNAhv39p1Sxj9VggEL2qY/5OVn8lNRBMRaWr7P7lugG477h
         G9jPhGNAsBWx9g5tAUGPyqMCPmdjc08DSGi8wjLj1UjDR8yKj8z+epHkA4hXmveh1jmz
         9C7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwDsgT1xaCkHno5JQOnYSqKfmM8FcjviOxKHGYkSDrOUUB5T4ysbGTW+T2KMtyfRwaz1cD+1qFF87WBaXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe8nzEFx0NWXP3IuhNovffkY825D81npz/ZmXVAPzaQ61G8v2B
	YeOtPcWXgVm7X2zgzvEETcWoxj5HNg/0zKeLWqj+eVtZocRoUFFIg7D2ltN67ZIy5uaXxrLc1Y4
	CvDhs9w==
X-Received: from pfiu22.prod.google.com ([2002:a05:6a00:1256:b0:88f:2ad7:b21c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:17a5:b0:89a:19ae:10e9
 with SMTP id d2e1a72fcca58-8a9bf336b49mr2945778b3a.38.1793395642680; Fri, 30
 Oct 2026 14:27:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:14 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-1-seanjc@google.com>
Subject: [PATCH v3 0/7] KVM: x86: More EFER.LMA vs. CR4.PAE fixes
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

v3:
 - /s/LME/LMA in MMU role bits. [Sashiko]
 - Restore an unintentionally deleted vcpu_sregs_get(). [Sashiko]
 - Massage the KVM_SYNC_X86_SREGS changelog. [Yosry]

v2:
 - Disallowing clearing SVME via KVM_SYNC_X86_SREGS if L2 is active. [Sashiko]

v1: https://lore.kernel.org/all/20261022223052.646891-1-seanjc@google.com

Sean Christopherson (7):
  Revert "KVM: x86: Skip EFER vs. guest CPUID checks for host-initiated
    writes"
  KVM: x86: Treat EFER.LMA, not EFER.LMA, as an EFER MMU role bit
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

 arch/x86/kvm/mmu.h                            |  2 +-
 arch/x86/kvm/msrs.c                           | 53 ++++++-----
 arch/x86/kvm/regs.c                           |  4 +
 arch/x86/kvm/svm/svm.c                        | 15 +--
 .../selftests/kvm/x86/svm_nested_efer_test.c  | 94 ++++++++++---------
 5 files changed, 93 insertions(+), 75 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.385.gac671c819a-goog

