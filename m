Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140242;
	b=aNL+2SBMlHGEZsYpII464MXCckjzqKFygQkLWfA3blrTjKn8IASEeTjDvqpnUNfmrZJb
	 +Qw66MK58iy4fZvLiD6NcLfEqLFjjidkVh/Yr1nHlh7ykej8g5SsXE29Bk8vQKSy3angF
	 Ua3hAP7ohBG35Nfcl8nr71o2k2SI2mQ5r05Ng7nQBgi7z8iAhfecBC9KoP2Ho0iZ8TqZ+
	 4F7NuYv8Kv5b4LG7W8Ftn5xfYgsrOxhZUIkVEJyEYDhoCPoobqhLZSpPMEAQNiHdtobaR
	 Mq4t1ewykRPHp/4WQjLAh294sCCg8awqGVA5WAgwjz/LAuoG+BWCD9milt1Yzv/Ulzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=T1tgnVjlE87FNHg73Z1vtF92TtTUQ4flw2mkfx4tQv4=;
	b=BOTPiIf87b47sy3ZjHCyU5DEoqeUHlgp5gEwyBD71Wx6FRVyJTs/k9czG5PUvc7ADcsP
	 gN1upv7zdZ5cl1mPq2vIB5gnOeUt6hzsyN4o8ysp9C4mI+HVgXcA8YUDFd9nFDC4mSn7E
	 R1tbZLBm5bp7PPdzLKxWyfH4jUvQpSdwDHDT0lmUDDzpes9PCinP22vHpN94Kso0aMVN1
	 3gPS5FOHn/uQWU4YThQlboG9Subb5CpRglyjoV/wk3+PhrkTKdWIWM2vXP+BJcfxujEE0
	 X7DSetv3cRrnxlXxxa8t/uMeuXk26CP74uZV4VuvERl3IvwlBcTNSn1Pmtduf5N16RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YPmfm4mK;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B89606A323
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B89606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YPmfm4mK
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd8b7226694so188105a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140241; x=1793745041; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=T1tgnVjlE87FNHg73Z1vtF92TtTUQ4flw2mkfx4tQv4=;
        b=YPmfm4mKa2hkqpLu5vcyPPJSgCxAT77KK/LzK3iFxSVZziHXDQAVTlVylRJx0qSRF3
         lCLeB4KfbAlNS6PZ/doNT4dAB2aC6UhTVOMN7ZPoFCZMxSedt4bzlVYrQ1RRu9wSfxOF
         MhkEbzxmURmiecELA6i+DsAIyvR6C2J2CbYqJtzmHTmPLHqOeksvdptz1X8ebCF3wzW7
         xzDLlHXCtVPzv9T/R6ik7ZsCLC0Oh2VSao5C8+XWmn6ksUqWHAVIdIXbRsFTEsH3xEfV
         XypvuL0Xs/O6M310hStJpNyNKTGkOGEHQxc/QQOVIufi1Fk+pBkJzZP5e4+JY8zvpjtd
         H9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140241; x=1793745041;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T1tgnVjlE87FNHg73Z1vtF92TtTUQ4flw2mkfx4tQv4=;
        b=GpJdD1G6mgjjYC/epmac276vefB1Dz9sJWAtXUTy+MwkboRGPqqXWo4xXUDTfBEPIz
         h6CGAc1hxYIzs6ZUlA5Q6atzWhgh8pee7Q4lWCJ+qHj4VK4FYKkYc0FPzZNUjVt9HNvQ
         RBHyuk8kGBhaiRDTEb0f9paiiI5jYdOdHH4FKbpLoI14+IcUQOPGqqPWeGLt8PyFOdaU
         15Y8Ry9ZlsCKJB3oTgLdfLI3AVIDya5ub6+gYZ7slXVwVn1qMKI5l6cyBcZb5ZygvWBn
         r444o1dqE2zWX39wMMf6HxTA3W2Zj+b4Lt0S9W8ZFSXjaCx4tQD9CTLtbCcohuAwZHxE
         b8ow==
X-Forwarded-Encrypted: i=1; AKwUvByBsTVxDKcyaJVtTdhqCdBRJ0C1EwMrBABlJ7g4nvgSyJlZxljeBREABDThyfnAHsf21ZU4AEm6wB3Gm0s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTZiEo1EpGNc/JgsmERQ4E3qlkJvvPnNqGE8KCW0BE/NwunBUB
	hzHc++xVJwZQZUI0yaU7X6ENAp8SWoHavxdy0hqojbNef7EFlinSX4p+II+9lYGCw+4kqpJLrf8
	vNQvo+g==
X-Received: from pfaf7.prod.google.com ([2002:a05:6a00:a117:b0:89e:bd5e:725d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0c:b0:3dd:d729:c62c
 with SMTP id adf61e73a8af0-3e9023a34c7mr439304637.54.1793140241314; Tue, 27
 Oct 2026 15:30:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:30:35 -0700
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
Message-ID: <20261027223038.1566931-1-seanjc@google.com>
Subject: [PATCH v3 0/3] KVM: x86: Drop deferred updates of EOI bitmaps
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

Stop deferring EOI bitmap updates.  As pointed out by Amirmohammad, I missed
this one when removing all the other cases where KVM defers an update until
vmcs01 is active.

Patch 1 fixes a pre-existing bug Sashiko pointed out where KVM doesn't update
the EOI bitmaps if APICv is temporarily inhibited.

v3: Add the aforementioned patch 1. [Sashiko]

v2: https://lore.kernel.org/all/20261022022813.303978-1-seanjc@google.com

v1: https://lore.kernel.org/all/20261017093016.32348-2-amirmohammad.eftekhar@cispa.de

Sean Christopherson (3):
  KVM: VMX: Update EOI bitmaps even if APICv is (temporarily) inhibited
  KVM: x86: Switch to vmcs01 to update EOI exiting bitmap on-demand if
    L2 is active
  KVM: x86: Consolidate invocations of kvm_x86_ops.load_eoi_exitmap()

 arch/x86/include/asm/kvm_host.h |  3 +--
 arch/x86/kvm/regs.h             |  6 ------
 arch/x86/kvm/vmx/vmx.c          |  4 +++-
 arch/x86/kvm/x86.c              | 27 +++++++--------------------
 4 files changed, 11 insertions(+), 29 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.307.g5fe7bd680c-goog

