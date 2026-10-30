Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396270;
	b=An3n6ez0uyun2I0w+3AQTZcN5F+yHZX07Qzg8FSXqZlmsGaKNYhQnfNrRDmjC7PYO1hu
	 ogXIUUo6iVPKpWoLFzd7tV/Cy97TgaKWJRUcuAoxngW+3RcQD1kpu0enKc+kYeStA2MYI
	 HSaTHHQpa6OlgxhVcIDkmduIv6zPcQeuz7sNvH/CdGFg6m5cvIUu2NYAJfMhiwGjwCfsW
	 mo+sat1ogbRTxSi+OQ9VUe0AYojdXXcIg4peTDZ70cuTJnBEva8AxnQd3CtAywi3qedyW
	 45EPWrGRpuMIuCvEzXtFsS4z5iwLAhjmd47G/OwJ7FU2td84RYl/IF9AJ2+kNEbJBDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396270;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cr3OrkM+aity3hrb+5Hsv+59qXtSShSDqGA7ToffXLU=;
	b=U+/5pu3QRF7JGXwPLv75VpUZh6RTq01y2cvigkNHKUerhLbQB+tosmbg84cGi2bsWW0Y
	 EfRZAyNyPNIKnLpz5nLP/gcY40enfBvkMLE8pbOQOMbRRnnF8hYE+e4sbd7qTYNjPlJL+
	 ASTNq5TfJOymKfVOyZjIOxUDTJKmvO+3+x00STVTKBCcYM2FNSAP3L777aVQ3j2vsfBDI
	 eV/pgAzWxjyk1nU/0aBShMAPQNhbGhhBz6DVGaK7rcuAIias5EIwijwbDWkrtgFu5BeRx
	 WoXjQy6nKrbpvPF0UWUFSeJ7GB/lUE8lET6wn+C1Q0Ya1azJObS4DxZKIOzj2N6/oCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mx2wLU5M;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289B6606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 289B6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mx2wLU5M
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0619b1fe5so907551b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793396269; x=1794001069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cr3OrkM+aity3hrb+5Hsv+59qXtSShSDqGA7ToffXLU=;
        b=mx2wLU5M2o0Xs0vCMPqwYt0TDTbo25RoGYtImFzGNGspDAYfvmXP6iloOMySlKUNAY
         jCerf+xzq37b6u+MH0Pr12rd1SnwxADUGNuKHLq1ekM1QHYGntP6UpmTnTtD1bgevHQs
         Z/Hr6NHwN8rmRpjg+WDk2RifT+jE3Ium94Q2UxK8wDPNyUZAW3gBDPBIh1ULJ4rb7Ef6
         47ytUs02ec1VOv/Iq+gb8MNnDaC+0ALM+Y7K2rM99b2xnPoELOywGNx2ImYoW+QCH070
         zHvJMED8RKC9/vigH+gOx1J2qWXkddANuw52t6lmFzk4cqStg5bPccxMF5BYnlRgpiOg
         Spxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793396269; x=1794001069;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cr3OrkM+aity3hrb+5Hsv+59qXtSShSDqGA7ToffXLU=;
        b=Opyj84js5hUmrZCafG8Ntn4Twx+SOwEm7cfh5jnPkzK9mIP0OiU0FKuFUnyWi2prQZ
         sMHJQO1uoNCMzMJYMVqelyHiTJZHrsvCg1cS1/lsyndX9j4NPcZy6C0Ndi6G/Ssi52Q3
         UapIcd6QAF1IoDdMhU+ETiwNpshGrwYhMp7fc6PSWgUWCIZQ5qJ8ZHrYFB1IbwjBqv4n
         yWzytNLR/BFkXAZ2kzoT0ax+bPirsAGC0HZtvRBEfAR93dgkNPyksc6RRSgAvMiqJtMS
         pbwHnPA2gcKZ9Szs2WlXru6XFL4JZeLuH6vrrShvaqayFDHfaCZbh1AfV+lCAUSM0PTX
         RZNw==
X-Forwarded-Encrypted: i=1; AKwUvBwFZ6k0E7ZxIkBwNcuRWoP4UQAS1t4czVGTPZWp6ghEd/35RFqV+4MF1NCMb5nBjFALIlx2urG2U9UMDqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfkAq+blA6oyHs4BZQ3SfzENSkAVagn39t+E/o/Z24mdTGSzgf
	3CJpSnCd30e2x7dKYmmqxlmsEWrV6fxus5HegC6VN6YZuD0Y3HC/FexGkEHuFogACPEc8Wt3ock
	vMvJMqw==
X-Received: from pfak13.prod.google.com ([2002:aa7:92cd:0:b0:887:8dda:c9e4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:349b:b0:8a0:70ff:ab28
 with SMTP id d2e1a72fcca58-8a9c04ae65bmr2819645b3a.60.1793396269157; Fri, 30
 Oct 2026 14:37:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:37:42 -0700
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
Message-ID: <20261030213747.2611815-1-seanjc@google.com>
Subject: [PATCH v3 0/5] KVM: nVMX: Honor L1-owned CR0 bits for LMSW
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahmoud Abumandour <ma.mandourr@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Fix a bug where KVM ignores vmcs12's CR0 guest/host mask when emulating an
LMSW from L2, i.e. an LMSW tha exits to L0 but not to L1.

v3:
 - Handle the read_shadow in handle_set_cr0() (and for CR4, because why not).
 - Kill off kvm_lmsw() entirely.
 - Add a bunch of comments to the selftest to explain the dangers of running
   with CR0.TS=1.
 - Test MOV CR0 as well as LMSW.
 - Add a patch to take full ownership of the must-be-1 CR0 and CR4 bits.

v2:
 - https://lore.kernel.org/all/20261030032937.2813-1-ma.mandourr@gmail.com
 - Patch 2: order the CR0 store before FNOP and check L2's whole CR0.

v1: https://lore.kernel.org/all/20261029235040.12013-1-ma.mandourr@gmail.com

Mahmoud Abumandour (3):
  KVM: nVMX: Honor L1-owned CR0 bits when emulating intercepted LMSW for
    L2
  KVM: nVMX: Synthesize #GP if L2 writes a "bad" CR0 value via LMSW
  KVM: selftests: Verify KVM handling of L1-owned CR0 bits on writes
    from L2

Sean Christopherson (2):
  KVM: nVMX: Preserve L1-owned bits in CR{0,4} read shadows
  KVM: nVMX: Take full ownership of the post-VMXON CR{0,4} must-be-1
    bits

 Documentation/virt/kvm/api.rst                |  9 ++-
 arch/x86/kvm/regs.c                           |  6 --
 arch/x86/kvm/regs.h                           |  1 -
 arch/x86/kvm/vmx/nested.c                     | 30 +-------
 arch/x86/kvm/vmx/vmx.c                        | 40 +++++-----
 .../selftests/kvm/include/x86/processor.h     |  5 ++
 .../selftests/kvm/x86/feature_msrs_test.c     |  2 +-
 .../kvm/x86/nested_exceptions_test.c          | 73 +++++++++++++++++++
 8 files changed, 106 insertions(+), 60 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.385.gac671c819a-goog

