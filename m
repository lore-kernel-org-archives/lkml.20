Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139152;
	b=smj7KVU4VZh2eZsb4t3Ne/OHK67EQqMvGTPdpE9aLWdt/EguGae1ORViQJrB4nAXKECb
	 z1ZzbjTLe5+LW2xETy3ztFuX7AMO5HvuWopHwm0FrUkp/PuNqxhq5zFj5aOL0KUrPMMQO
	 gx1D1yEoZeLqfsTZ671MCKf6zIGUIohxIfKyHL0VzDzhjQp7FvM5O2RSfRF3YTdYzSH7b
	 4gzFDL30eHBWqeUb55N1uN2WVdEm4rBdM5AgwCba+IsSYpOWLJIvgF1uCmJn0CE7JTx9q
	 6R4MeB8cHpWWE+gFIvlQj72nuTaOqN87oLb7JanQb2gYlvZ1e5UEDl7zT7QgEEeejNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=LqllTjpYQ11cpzSrufXwFEGHtiXKk3/xQbrtXOylGNw=;
	b=Fe4izN+H0oDuUSiJY9mvGh/ZRKZyUjoX6ImsXh1rdlYdEvWVIC50QpAwt41ClyzryGim
	 jxUeH5g27qhmR4MUx125fZe09xZ+ELT1jwlXzVqh5xDQRo+dyvi69KqyRysWUW4no+/ig
	 FfHPHB9kGjUpxDwOGw9cz4yNLvCUSaH7zcIe8dP3UH973d9ZSWPIEa1EkhUKCeMqG3aqc
	 e33la8809qjuNpd20I4XB4e97TrGK1UOV4JCXwOX4Gw3URCkAZSniCQvUk1b/G1gjgU5n
	 HK/8vAv2khaqXaOOopDwn8vyCcv27eOh6Xd5PzydHeUZHoIc+TzAUpAtsS7PXUAjsrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d19UgqAD;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EE860A3811
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56EE860A3811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d19UgqAD
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so4515345ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139151; x=1793743951; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LqllTjpYQ11cpzSrufXwFEGHtiXKk3/xQbrtXOylGNw=;
        b=d19UgqADgC6U2cESx5MzU+hCmxDBdWJ3uEjVLoJGeG2L15dxk1qNRLy2px6bnFxpKI
         RKlBo4+tlFlKaensG5eSh9wHStNUDypfAmxIfSHiZDJrIo5Q3ACfnhGtYKRFomD9cXVE
         Z4vUHw/pkzlBxL0YCG67aFuiDUoAE5nDJZPh+AL/EM0k4A4PfeHhu6hlm5vAFT4DW1tZ
         CiCkT5cAPeDLeEtJP13/XIw2UrWkpjQbk5/yBdKPzDAzcEGWgTGJkAkDqyeZyoSrOYEv
         bTNFx1fO9j+fn9y8RALukhSIZX7ToRb3llkEZs2/lwsl8n8ffTCy1VwswwQFhn5zcJYa
         d8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139151; x=1793743951;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqllTjpYQ11cpzSrufXwFEGHtiXKk3/xQbrtXOylGNw=;
        b=2u4gkDkyRHdo2r2PciOneIIKEras3ySP/2U4OyLF1Me0Z82J7QehNN3OIp3tyraO0C
         U+PfSNJX+f78U1eiqnuPFPlQlHtEyRfunW0wEPdN8S+nS+/n3XSS/ZG3XThLP1Q754Wx
         MnNq5uWZLfOfI9QC2JAytkGN9OW5wwXnrw7w7IXZrD4taZmGyhfPtcsOd01tHCLDOZV8
         6/OQU2NWQ7iiaybyLJehPkonR2hI53NHJrbr/Peu9tmu2/kQ7NJOysSEaNH2Tshju1Sg
         Yfnd9D8MbXYO04SUNSGg+MJfZ7i9MYec5kVi+SpfsdOIO4P1ELt0LQvuuAAh1d9Vc1Ym
         gAtg==
X-Forwarded-Encrypted: i=1; AKwUvBzSp/isBKXhyJ39yKEbBtArywM/hwEt5GHL/YmkEuTYW+tq+znvTBl7h1rEGyyzup21Tv3a3a/gfItnc2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLn567FI4T+nInriyB+eXhNpMUFINXljspghU4XVXdYPFaxuz4n
	UaWE+1J+XBMNP/QKHk9NLbdUeUvNonKIj5jEEQ6YFUCe78rVhWDzbFFFPtpPUkQYBRZRdYwx85z
	uYvm/bA==
X-Received: from pjni9.prod.google.com ([2002:a17:90a:8389:b0:3aa:ee30:1a72])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e83:b0:3ac:7556:8eec
 with SMTP id 98e67ed59e1d1-3ae580dd96bmr289174a91.39.1793139150524; Tue, 27
 Oct 2026 15:12:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:07 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-15-seanjc@google.com>
Subject: [PATCH v3 14/15] KVM: nVMX: Don't switch to vmcs01 when freeing a vCPU
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Now that neither free_nested() nor vmx_vcpu_free() relies on vmcs01 being
the active VMCS, don't bother switching to L1 and thus vmcs01 when freeing
nested state.

Temporarily keep the vcpu_{load,put}() pair even though the only reason the
vCPU needed to be loaded was to be able to do vmx_switch_vmcs(), as there
was at least one *known* side effect of doing vcpu_load() that KVM was
subtly relying on (taking the vCPU off the PI wakeup list).  I.e. defer
dropping the superfluous load+put to a separate patch so that there's a
dedicated bisection point if there are more lurking dependencies.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 553915015a75..4a8f57eb3277 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -393,19 +393,9 @@ static void nested_vmx_do_vmxoff(struct kvm_vcpu *vcpu)
 	free_nested(vcpu);
 }
 
-/*
- * Ensure that the current vmcs of the logical processor is the
- * vmcs01 of the vcpu before calling free_nested().
- */
 void nested_vmx_free_vcpu(struct kvm_vcpu *vcpu)
 {
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-
 	vcpu_load(vcpu);
-	if (is_guest_mode(vcpu)) {
-		leave_guest_mode(vcpu);
-		vmx_switch_vmcs(vcpu, &vmx->vmcs01);
-	}
 	free_nested(vcpu);
 	vcpu_put(vcpu);
 }
-- 
2.56.0.307.g5fe7bd680c-goog

