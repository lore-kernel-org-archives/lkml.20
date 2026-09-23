Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA413BBA01
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181210; cv=none; b=oCenaAolpxxioztfzwWf8D75fHl9v+6wYEK9OUQkjZY+M8lVrDHUOID/VLKMFxtXfUuT545uOc56awJsq8RJmhvBa+3EFkemFRNtFkWfT1cXuJ7l41fj3JRLSgZoVPOnvXobroMKANJ6CBHThXjs3NPwEPbry5K5PEu2iU7hKSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181210; c=relaxed/simple;
	bh=UmEqer6UG9O3E6DIbEIr7SZYSphsfnJwtmb/wPRplb4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jeUIuiLr6Tgr69pGSLyKtfhDNJPyTRoiaqi75gS9/YZYV7zcNS2LUBrdCjl0vhKCqBWjETLuWxsTX51T1xikKUBbIFIuCKu00/8s55RsC9Zmbs+BWR5K7HuUfnE4ywRbF+N3ifGC2dEVwgtLzkVf0FCll1bKWTWU24lJyEBhkWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hh3oQ+i+; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hh3oQ+i+"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d959904658so11131195ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790181204; x=1790786004; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eXmgICAmgo6FOUU/+FNDCUIVBGaQ+4Ki2nli9SL6tEk=;
        b=hh3oQ+i+slcRSq+KidKbqa6iBrKX+GmoEsGQN1ileRhW1w4kBQDb4FzW8VJ/tzSJy5
         LKuJzbt83l98/QfYF8Sjg89rMPSmTRTUhy1EY6SfjZulK5t45bB4y1oGgpcbPs8riOwC
         HEtCUMz5yY4nPjtmlwTQgbb5l+xgLaUJYlNMxWikLP3oR8Z0Z243OjhbM6Ta9z9hnos1
         cks0eEzZDICGfZXNGLCMYmuWJbRJDFbnVD2UHVN/VgMZwKjM6MOGkTYWxJiS82jFUUnS
         aPCiyjw9T51RTN0ZGbClsNwWbw2P314o2TnAYKG/jFXnDSN4iAzEkXtjyTJn2O87v1Mu
         dZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181204; x=1790786004;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eXmgICAmgo6FOUU/+FNDCUIVBGaQ+4Ki2nli9SL6tEk=;
        b=XfXSx56F8UX8v9S2WlSs5YBVzFA4s7dWY46bTtk8D9XmeEPy46Vt2CtP3/3zcFU4+u
         1rRPYNvyxgef46UkdSkDR7el9VJnn2Wx2NUJf8aZYL4DaVWzYaCL04beTTE9RsCS6Y/T
         gRkBCG3rXbv+qvyOpQsfaw37WT9HdYCqdZkw13V3P1VjejZdwx/hP45ZYgx67+cq304+
         /jKCUnb4+9ZXaQ1rMlQM4u9o3t3I70rZYT+84J3YIkxCrWUCjj5VFGi3c0xlRAWJ3Q9h
         0V6i4EOw/VNyeECgqlLnllT2RsQdzwEt8D18NqIwG2LZlOkd/9NAcQOMYd2qkHpb9cI2
         Vk7A==
X-Forwarded-Encrypted: i=1; AKwUvBy/N3mNOdw/lrpfLTz0ZVkNCEqlW0sRYtvw8/GGzOOwBI43TtM2ASLjRH5vwjQzbCsQyjEWhWFlzTXcOQw=@vger.kernel.org
X-Gm-Message-State: AFuF++mQRSHH4lM+SSCS1pqU0G8xsJFBfOwXW+vrvVs+VPQkZqta8WI1
	Xfq0HAkaNwhjKb3SbvRiIPqoA+OG1wjI0Qk1aOkUm60fWT1TOovhhkvB3PbmFSc8BGocJhAuUPI
	TW8rXkA==
X-Received: from pjsc3.prod.google.com ([2002:a17:90a:bf03:b0:3a0:8ea7:1935])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d10:b0:3a0:8050:2ec7
 with SMTP id 98e67ed59e1d1-3a08050315amr1517256a91.13.1790181202701; Wed, 23
 Sep 2026 09:33:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 09:33:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923163315.1580860-1-seanjc@google.com>
Subject: [PATCH] KVM: TDX: Synthesize SHUTDOWN instead of returning -EIO on
 unhandled EPT violation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Ackerley Tng <ackerleytng@google.com>, Vishal Annapurve <vannapurve@google.com>
Content-Type: text/plain; charset="UTF-8"

Synthesize a triple fault, i.e. exit to userspace with KVM_EXIT_SHUTDOWN,
instead of returning -EIO from KVM_RUN if KVM encounters an EPT Violation
due to a guest access to a pending page.  Returning -EIO implies KVM is
buggy, and most VMMs will respond by completely terminating the VM, versus
rebooting the VM in response to KVM_EXIT_SHUTDOWN.  I.e. give the VMM the
option of trying to keep the VM (from the end user's perspective) alive.

Ideally, KVM would probably exit with KVM_EXIT_MEMORY_FAULT, but KVM would
need to extend run->memory_fault so that userspace knows the fault can't be
handled.  This scenario specifically occurs when the guest has deliberately
disabled #VEs on unaccepted memory for security purposes, i.e. the guest
literally disabled the mechanism that tells it it screwed up.  But, because
this is fatal, and the whole point is to NOT try to fixup the fault,
jumping through hoops to return MEMORY_FAULT instead of SHUTDOWN doesn't
make a whole lot of sense.

Fixes: e6a85781f783 ("KVM: TDX: Detect unexpected SEPT violations due to pending SPTEs")
Cc: stable@vger.kernel.org
Cc: James Houghton <jthoughton@google.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Ackerley Tng <ackerleytng@google.com>
Cc: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---

Compile tested only.

 arch/x86/kvm/vmx/tdx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 7173ef3fc398..eb82f739a7c0 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1938,8 +1938,8 @@ static int tdx_handle_ept_violation(struct kvm_vcpu *vcpu)
 		if (tdx_is_sept_violation_unexpected_pending(vcpu)) {
 			pr_warn("Guest access before accepting 0x%llx on vCPU %d\n",
 				gpa, vcpu->vcpu_id);
-			kvm_vm_dead(vcpu->kvm);
-			return -EIO;
+			kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
+			return 1;
 		}
 		/*
 		 * Always treat SEPT violations as write faults.  Ignore the

base-commit: 30b5175943e709911702d8a9364145e911f57e3f
-- 
2.55.0.1082.g2b9226bbc0-goog

