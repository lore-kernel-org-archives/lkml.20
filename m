Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395292;
	b=XZrhn3h43uiaDcYDL6WKdHPtnhN0tRYOsCajdfjFjDA09nM1GZNr6A96kFK9QW2FHeTZ
	 RmKN1KW96d05QSqfUMKrd6iy1lzgkSM+0TNM2UAwfZSWUhzscfyh30Gdiml0sokOx8oKV
	 oPC5V73H3clMNG+zo586UB00xkXe2Wwgj2+DeWA1ppSKDjXeFLFHbCLVGgT34xVPupoeY
	 tg1RvzTtCfv2CKTLN9BT7bEhV6iv7CL77wVMH9ZUhBnZpx2q7ah0ZG8DRGrHNorfV5A2H
	 l0Bxpq0ViJQGXc0M3ocSyXQZYzdsGebFmZi1lYtY0MnmM6+9xP35BDovZlqQLu94O+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=cco2nkq82iuQQ+19T+wEIhTi8zWX3dqm0jybMBLyVmQ=;
	b=eyg79BVhkuM6RbZ5daZLLcn0Mgij02dRF2q4NpD2J3vno4YCnVrG6PozWk0AR0oIM7+z
	 FNDQCcgLdJNZYZqJP8HjyiOQUgOYCaPBsagD1hQRqbHdRsEC/WF8rjOF5RJI94GKh/PMH
	 ln6YlEagwArDbeBnaRmRnQYVgd5eqmzfBNFnIb5nhiGKt+WzczSuhY6hJ4Ga0RX7yfHST
	 cfdWZ+NJxH0hd969Fa7cETz3WOmo1+7nOGfzeIXycMimrwxfwYjCOIXwSFjURfTF0jwL4
	 vPcrN6tkMV8gLkQawUEguVsHuD1eTNopK4/ND3uS0lnj3LD25auEv/NG1Ccld1Haj/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lafWTZ3r;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CA860A263A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75CA860A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lafWTZ3r
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a0688a43d3so833751b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395291; x=1794000091; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cco2nkq82iuQQ+19T+wEIhTi8zWX3dqm0jybMBLyVmQ=;
        b=lafWTZ3rwfneIbpzMFY/3F+jqzgYFkE6hIaCSdll4Av1BdxKoENPt66N1/zNuFndPf
         kvdHRa5vTnRTP/LG+zXDLsvPyzGQPRN+zf4Mo2V+1M1e1SzUV23hdkrHo78d9SmhiXs1
         wME0IUUzJK68fWP0nV42AoNV1ODjJx/3vnvPgO1GXQEEo+RH5oT+3FfnN6PDTKDWeBIR
         aWi80Q/0gyN+o6k6v9ixBxlqaIrzjxpTPzV6DAOSW1BQ7pPT+qjVmCqecxcPv6sg88ts
         RZXAbkHKhTurh0zhvmTjMWeFJyb7RD57r3K9ZRVr264K6fni4sU4LqVfvod18xNos8qS
         v20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395291; x=1794000091;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cco2nkq82iuQQ+19T+wEIhTi8zWX3dqm0jybMBLyVmQ=;
        b=kggelknx6s5Z9IpVzAJYJoEGGwK91uqjMOi14mvC9yS/AykD7RllAerr4NSDAEPwsx
         D3u2u3OT5Nf23HfctVgJR39eSSu5NTopeEIZNpVTir2O9yCW5nZSWk+17ULz2gj1DJy1
         U/xKeu1Eu06TSA7HoCtKIaej2ubA87C/kKDicFPvrg9m5YSzGarLum3cmisbBvLbCBMZ
         INC0eyqAZjaykPUAlzLwuYZqiBapg68fk+h4QCwsiIzy18M4eKlBEjrMpd0I0PxhypfD
         BxKJB2VUZuPtMGgAUxxQ3FHy5qK5SRhy8e8R/KoyWvrrmiRCOW8sYBR01kktVxIj2BrA
         IWrA==
X-Forwarded-Encrypted: i=1; AKwUvByW1Ib2KIc6ovN73PzV1lvwiO2tZr5NQeQAn6RJQxjxvi2kHFG4Qp646X4T9D62rIFUaDa9SpsKPQ/YRlw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpzrrZ9ASzrjKL9RvuYt0i1ccTcCAvc4dvxCKRHRO8GGjcTIrZ
	LOzHM5mYl0en6Uff2CLiOZmfSQ61d1l0afxivzIOWZMt3tdaBNnOTGLRDnew5bXPeV9maQg4xaz
	51etdZg==
X-Received: from pjbev16.prod.google.com ([2002:a17:90a:ead0:b0:3ad:fc31:f458])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33ce:b0:3ac:450a:fa22
 with SMTP id 98e67ed59e1d1-3ae89536c44mr2992819a91.2.1793395290671; Fri, 30
 Oct 2026 14:21:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:02 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-15-seanjc@google.com>
Subject: [PATCH v4 14/23] KVM: WARN and reject guest-based uaccess if VM is dying
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

WARN and reject user accesses to guest memory if the associated VM is dying
even if the current address space happens to be the correct address space.
Accessing guest memory after the last reference to the VM has been put may
be "fine" from a safety perspective, but it's still a KVM bug.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index f3f59bdf7e18..ba8ea62b7304 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1355,7 +1355,8 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 
 static __always_inline __must_check bool kvm_can_do_uaccess(struct kvm *kvm)
 {
-	return !WARN_ON_ONCE(current->mm != kvm->mm);
+	return !WARN_ON_ONCE(current->mm != kvm->mm ||
+			     !refcount_read(&kvm->users_count));
 }
 
 #define BUILD_KVM_COPY_USER_WRAPPER(fn, to_user, from_user)				\
-- 
2.56.0.385.gac671c819a-goog

