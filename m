Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212899;
	b=NYTjPpWHiV1rP8Ak6oV54RGWgSAx+x+v3TM/S3WiP4CswIYPgH2qM/n4GmvTXSuIxTQ2
	 zISnr7MAetyisyH4PWgaw86+ZeBm/G3VcGhK5DusNsiNZMWZzuuAerrjqz9eCdt2HFtMS
	 9t2P/QuvS6Y6MLUgfkK8xsBTBAi/HvjyBUXVqAbsmOA6wsiOFWseWL7PnPimry+OoJMNN
	 49h64r3Mk+IrE2/5lo8nHC6d8OI82/mIlK81lbepoquy0kbuJznkbXptvwzuwBSmeN+Wl
	 0rlZTPzUpQ3QadlwUXlPTMZXWMoXfIZn+mrKQXM9ihkztLKakEsO6haWnMqpOSZNHuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=LGiAn3+vC7k/dQuHhAIgXgOGgb19a4igxKhn9cpgVGY=;
	b=VE2Om4HUfLbm64GUynAL3e2eO0gG94E9G/lqyHkzO9SWkKD2EqzBtiLLXECtrwsdoNqX
	 KE8x1zv4ffA5dxWv1NOFG6HFu+ShdKZqUwaNNSQvjdBLIxDTsg/VEFih8rBHPSMGLeolc
	 eiWLhI5geGhlk05mBlxC2dlqcAInlnnG47I93tBUjEQLOttZRH2ogEW1Jfxe1CIff3IkS
	 TG5wuCJuqCsHmIdoSi4E01e1uExSCViPqERz5XATIYMy7W9QQQdtHXS81xHXXt+HKRCsq
	 eM6yV8BVa4OBBzABXjp1xCGeZyu0E67TKwOkpv0KKNsI2B90iywDpuAlEHXravo48pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aLW2zmsh;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B7606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6B7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=aLW2zmsh
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso1291923a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793212898; x=1793817698; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LGiAn3+vC7k/dQuHhAIgXgOGgb19a4igxKhn9cpgVGY=;
        b=aLW2zmsh/ARMyezCN+73svbBgGUvHnwglIs8kXMv9ohPv7KXdhcBBAVZSVzHaNW5gr
         UV+v6W4/NJMOIFu6+V5+Znd4fPmD89E0WDokkTIs4+9G9BaGucnhk/GnRx0hEy1IHmq4
         ccqrd+w5hTzKmFQE9PXfJHoDxVAnHIIq7UkNGh98OzN+OQxmU9cBXUSs4zHEjiXfiI4E
         gujbRbfWXRX2fv4+13XPnx2NI+d/h0EFe0emM/58RxRJJUZ9FJK3vHEH7EIwDznW2h+o
         uhvC0y8E94bxFSo0gJQFWrd3oeNhLMGIXX27OAsSsbCacdVyBUagLvf6Rm0tzoRnX6X3
         NQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212898; x=1793817698;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LGiAn3+vC7k/dQuHhAIgXgOGgb19a4igxKhn9cpgVGY=;
        b=AGmXjSZgM4A2yD1cFbB9lZ5DFMKFyJFABNbqy0iU/99AMfrqKowUYvzX4+uGdcddoM
         WIJ8DbkxSuIDrHTw5F354H2EA5xLbEgZFbDz9aZryAdOOmY6zQ4DJLCagSdKtPJvPj/i
         /odr2uMcKjZLkq8w4rQIph7Vk5thNYyWAlUmvUqpBwkWxx10Ax7bH57RRYC1apNAt6O7
         bU+3sHVspYwJ09c3zF4ZlntNlvpWVamfJwWBTB8I946nv/bGgvC1YOAFce1GBQr41fUr
         E16YtU4H3sCGldVSxFaP6NlDpr2Z0/yFPtVsNMPl3nGQg9xSHW4iL8yTp4y6E52xXqBh
         6I6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZxaZOwt8m3IM/Oxm3fABobl3vGo7IuoGCAkn9aPpU/yXpOFVWCcWlajpDfj0mrNDQR/7AtFhNjo1EgaQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDZTCxf6tfdC8YKhmmzBq9Abr2C2pd0ItbXD0rdsI1IK8qHsJ
	rFjmlIymuETcw4AgW6jQyJ3UGJWH6sxTyhTNHySvE8+iHFeGjA8meix26BrzHoSu2/QY1rGQzJ9
	pvNKZiA==
X-Received: from plhy2.prod.google.com ([2002:a17:902:d642:b0:2ea:775e:19b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a90:b0:3ac:9669:846b
 with SMTP id 98e67ed59e1d1-3ae57e47db6mr2484597a91.9.1793212897466; Wed, 28
 Oct 2026 11:41:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 11:41:34 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028184136.1803336-1-seanjc@google.com>
Subject: [PATCH v2 0/2] KVM: x86: Convert all runtime WARNs to ONCE
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that aren't
strictly scoped to module init/exit, or similar, to ONCE() variants for what
should be fairly obvious reasons at this point.

v2: Convert the WARN_ON() in kvm_mmu_uninit_tdp_mmu(). [Sashiko]

v1: https://lore.kernel.org/all/20261022215541.631694-1-seanjc@google.com

Sean Christopherson (2):
  KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
  KVM: x86: Convert all runtime WARNs to ONCE variants

 arch/x86/kvm/hyperv.c          |  2 +-
 arch/x86/kvm/i8254.c           |  2 +-
 arch/x86/kvm/irq.c             |  4 ++--
 arch/x86/kvm/lapic.c           | 17 ++++++++++-------
 arch/x86/kvm/mmu/tdp_mmu.c     |  4 ++--
 arch/x86/kvm/msrs.c            |  2 +-
 arch/x86/kvm/svm/avic.c        |  2 +-
 arch/x86/kvm/svm/nested.c      | 12 ++++++------
 arch/x86/kvm/svm/sev.c         |  2 +-
 arch/x86/kvm/svm/svm.c         | 12 ++++++------
 arch/x86/kvm/vmx/nested.c      | 12 ++++++------
 arch/x86/kvm/vmx/posted_intr.c |  2 +-
 arch/x86/kvm/vmx/vmx.c         |  8 ++++----
 arch/x86/kvm/x86.c             | 18 +++++++++---------
 arch/x86/kvm/x86.h             |  2 +-
 15 files changed, 52 insertions(+), 49 deletions(-)


base-commit: 7e60162b16f9da0d2fa83da5c1723b6853a0ac1d
-- 
2.56.0.313.g2479322e68-goog

