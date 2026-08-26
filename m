Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8E548875D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780007; cv=none; b=TgTR3TBYHI96BlI3KtnS7sSlxSgoOsLpQkW0uwkOe/NtgAbq3aZ+A5SYkUXibW45SrSJ+YFOMBcXHO4KilL4MdBfhsSBNuRq3GjNk6JWsKWIU2s8oiEiXfuzM/rxOcHb3/QxMCd92f8YfVYioRU6hVFJwnWZYPrKSdy/gyyMdUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780007; c=relaxed/simple;
	bh=HjzfaZn7iMtm1a+7Rn0/BRb39wt8D8ryTBsWCam3NPc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RxbHAm517Sf4sfK0ilCYQG/N61BmA4crS+42Jtu1XPTu9t5RljReU0hR8mZZaw9b/dOjCkpEtkoxZhvDmsyxvM8wMjFpPDime4juv7YjjzD7IvrUY9cGFh2cKDhuubNL7RLkrxGim1Vrk5Do9i41DdPbK/7B0KjIyaK4DO3WiPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=epVsk11b; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="epVsk11b"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so17067935ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787780000; x=1788384800; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=brsNxXs+z/LAPT3lGQq+uK9uE3dmP7i0Bl49SpdLG/o=;
        b=epVsk11bPDVoP8V12aCESMuGxIXRylWmW/lFgzmUuw33YzFXY2FnS67l7ywE9i4y5m
         PhvE8s0c9bdca5KnpQV6Oo0mXpzsGJseuqeEyihVCqjimDmolywKRpNrb9q8tLO9ZD6N
         ZPmoYIK97BoQVHMIMaz+oH1QxLnfoWcJrmb6AszIDlo/dhuVQ0VYWfWCdMzP2ClzCJJ3
         WhUj3CGmobodtIcrSOofZuPP22k3JQRZYcGN2VWLcl88/XcEMlILlj0GseaNZVkKXkfy
         Ih8VVD53DG6OPHTRNR/PfL+2MU8T5HzBFsDJQ3czfROHyWIKYg2ZQzzCXcwWwdWh9K0W
         Pd/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780000; x=1788384800;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=brsNxXs+z/LAPT3lGQq+uK9uE3dmP7i0Bl49SpdLG/o=;
        b=bMshv9uTGtUyRgCPamrnGc4BNmskIavGb/U2q7PMCHhpb/0JtAuzVg71VW0XRUpmO6
         mMmO09T7zsxX9eSw6qae6s8pLyNimYcCj/nLqeyPDxt62jNMvOKfnMJqbN1g/nNk6N47
         WRg6809wfOw4N7Weuc/Rw23eiV59R3Y26cBnW8MdwJm2k7xVwE/006vfDq+eRSnldihY
         60pMsCUa8nCGXkHgyFJhQgmZHGlF4e9og7kgNQCa2Y/YaBrKE1Xv/RiHNKlcono0AX0K
         1PvQHdpBxHDtXbwa0T57/b+HoxfTg+ffVPxIQLKMJnL8gkB61MtEkoTb+dri2vQ9+WEm
         7a8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpdIj/q+gPgowrFX1PHZU7T6k2DpMp3cStwIQEztfWn3CXsC5JhI2tMXci5M4T6QFkdMiU/Gpe2OH4Z4Y8=@vger.kernel.org
X-Gm-Message-State: AFuF++mbxx18TzlpsntD625dOdYMO+WGSgmRI1+AGY0GVAgboizWdLtY
	eQTZy1XvMXfahRRYXk7JK/yatEWcUPipwClwGwRpARUFHb1izZMnqBWKzdSN02fGIVUr8XiBHSm
	CCrhMog==
X-Received: from plbkh12.prod.google.com ([2002:a17:903:64c:b0:2d3:7c58:b100])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:950:b0:2cc:777f:d67c
 with SMTP id d9443c01a7336-2d707c07e9cmr181434615ad.13.1787779999707; Wed, 26
 Aug 2026 14:33:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:53 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-14-seanjc@google.com>
Subject: [PATCH v10 13/21] KVM: x86: Fix compute_guest_tsc() to handle
 negative time deltas
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

The compute_guest_tsc() function computes the guest TSC at a given
kernel_ns timestamp. When the master clock reference point
(master_kernel_ns) is earlier than vcpu->arch.this_tsc_nsec, the delta
is negative. Since pvclock_scale_delta() takes a u64, the negative
value wraps to a huge positive number, producing a wildly wrong result.

Handle negative deltas explicitly by scaling the absolute value of the
delta and applying it to this_tsc_write with the appropriate sign.

This is believed to be unreachable in practice; no path has been
identified which invokes compute_guest_tsc() with a timestamp from
before the vCPU's TSC generation was established. Fix it for
robustness, in the spirit of defence in depth.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b9b7ae965d6d..09435f153b5b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1056,11 +1056,15 @@ static int kvm_set_tsc_khz(struct kvm_vcpu *vcpu, u32 user_tsc_khz)
 
 static u64 compute_guest_tsc(struct kvm_vcpu *vcpu, s64 kernel_ns)
 {
-	u64 tsc = pvclock_scale_delta(kernel_ns-vcpu->arch.this_tsc_nsec,
-				      vcpu->arch.virtual_tsc_mult,
-				      vcpu->arch.virtual_tsc_shift);
-	tsc += vcpu->arch.this_tsc_write;
-	return tsc;
+	s64 delta_ns = kernel_ns - vcpu->arch.this_tsc_nsec;
+	u64 tsc;
+
+	/* Handle negative deltas gracefully (master clock ref may be earlier) */
+	tsc = pvclock_scale_delta(abs(delta_ns),
+				  vcpu->arch.virtual_tsc_mult,
+				  vcpu->arch.virtual_tsc_shift);
+
+	return vcpu->arch.this_tsc_write + (delta_ns >= 0 ? tsc : -tsc);
 }
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.887.g758fc8c411-goog

