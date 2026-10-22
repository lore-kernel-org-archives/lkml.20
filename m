Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706143;
	b=NXUZpl0Z62x7yHRGYeXnPkb25nxknGVlihV65Jjco4kSE23Tp2AMnBiJIK4YSARYG3iT
	 8CikbVkCMsuk8kRnAKxTAuI9dULwhKVwfUBu86f2PCr7ygGpqHRY/EK/EUsouGzVY2pJ+
	 xFurCFNLVikbq8WyxIaXvrnoZ7yDiDUyr/rcIOeN5Vglz/j/cIRCkg+aN/rD0MJm8dFnF
	 XE+gP9CFEwzi3luEalkuiIPPlyieq0PX5wSpoE/DffIFqg80xoRt+4se1vnMnKz72DsB7
	 SvYXnUQMMY+ZdwuwQvF2RDvDy21dlZ8edyCNyrMX3rQYbRocSLAklpUaMEAiNe2Fnmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=tegwRz1xXzbYwgS4hypxT4VdLheASXK/igGbsP1RZ5A=;
	b=a80jj/W0Ee35PJ1l13RVslIQ31hfurUB3FSG7pdExdl3yddYpqvTN7oQAq3fy6MM58Yo
	 LggG+2vLwZo1OqvFPKaL0GufUIRTHiNeyt0OJ2+FYg3PulKPaS+6jyLta/+XBOzPFjtH6
	 VylIO40vsJ011xoaecWoeXLvftEtnnzQQqXS7noAWxStzXrU6Ua6dJTJQkQjRXGBdZtLw
	 9hqgK130+p5pmdeCfDd2Dk8KVQ1pfw5FQMjkvXTV+Io7g/morNhKOSGxH+h9w1Yf33fsM
	 PJtmOZITWIWUFrxM7wEns/K0ZC0FCdhhGxv26JrPUUyeXVXeRpO7EEqryLrEIdF8SBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lR6z+Kp3;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA5B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BA5B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lR6z+Kp3
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adad90c894so288663a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792706143; x=1793310943; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tegwRz1xXzbYwgS4hypxT4VdLheASXK/igGbsP1RZ5A=;
        b=lR6z+Kp3rzS2NaOU4iV1jSKT9ZgSXEq2HBMImvLfVYyvEjlPv3R4NVZG9gMYovvtu6
         Fn4bTBXzpfcGi6g7rr3I8GA2yggVGelObRxVNDo/JLZvaodNlnUi8J3SusZF9XLZfdUC
         Wgn+Xacpr0+0LgAcBYOaYDtRoqyjbNLjHpUm7zR+ldGByRNlr7EiGjJSXl422GCq1lZY
         fkV+NUkP0ZqqJkqVXGrTKWq+aTiLwTLpn28Yo1NDiNLYNGAoCSUwmJ2dch6X5Tt3fe66
         EdmYHwTEnQHYFUkFLWzxZAjmNv06g/V79UI8fe5bLoAduMFwXdRrwLe0waWv+J+UsbzP
         WNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706143; x=1793310943;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tegwRz1xXzbYwgS4hypxT4VdLheASXK/igGbsP1RZ5A=;
        b=If/Wfw/w9tenMByWh3PBIEklEIgtt8YQCsur1HPODbBD45KuZh8QQq1ZK//Ci5364Q
         89y2mnHwzZ8IO46qjVFwUfN1R7fGn5yky3UJcwCNQW86eCNw0pFHELqAWOuisAXz87mf
         TrJj22aPu62onV1gACRkCj6dn8ZCCgLE8P+5eOdxl52J1rzD+lFK4JI56/mpUXUmeFFO
         alN/IrYIuff2eAwdcmvtbRVR11XFRigwz0BR2CVFLIrDRYozi2qmuq0OnW9wRWbiLGL3
         Ed09imj4/ipkLMyQvbXJSsiEhdqeu9DkAQwT9B32V9Ex1xbwKgHZRx40UyQqUSCE1KVu
         hLrw==
X-Forwarded-Encrypted: i=1; AKwUvBwSOHq99tj7K7N4upoLtXpVVq/XiebWpgexuDrl9u4qZEvW5NP6MskGTaPGA22QnyXka4MMK20L/kuQRB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdP90feP/hUAI2IICzXh0zXSsK+f91EjUzfXV6idQ+h6TGvD9B
	Ko5WX23NykDzjX6zQ8Rv3qVLiHxcWJeDGFHzLZL9tBcO/84EpnvUdWhjKBEOc4Si//GL4qjgZob
	SMqjmkA==
X-Received: from pjuv3.prod.google.com ([2002:a17:90a:d583:b0:3ac:6f46:2983])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5743:b0:3ac:b145:8f4
 with SMTP id 98e67ed59e1d1-3adce811570mr139671a91.41.1792706142558; Thu, 22
 Oct 2026 14:55:42 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:55:39 -0700
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
Message-ID: <20261022215541.631694-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: x86: Convert all runtime WARNs to ONCE
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Convert all bare WARN() and WARN_ON() runtime usage, i.e. WARNs that aren't
strictly scoped to module init/exit, or similar, to ONCE() variants for what
should be fairly obvious reasons at this point.

Sean Christopherson (2):
  KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
  KVM: x86: Convert all runtime WARNs to ONCE variants

 arch/x86/kvm/hyperv.c          |  2 +-
 arch/x86/kvm/i8254.c           |  2 +-
 arch/x86/kvm/irq.c             |  4 ++--
 arch/x86/kvm/lapic.c           | 17 ++++++++++-------
 arch/x86/kvm/mmu/tdp_mmu.c     |  2 +-
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
 15 files changed, 51 insertions(+), 48 deletions(-)


base-commit: 814607cd40df80d5727957adaa857e0feca43497
-- 
2.56.0.257.gf7497c7d27-goog

