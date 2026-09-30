Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6843DEC6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797004; cv=none; b=Cwu12iI4BPp4HynOntCPS33t/jTGBU3kDKSQNn8gP4gNB4r7/M+xtxt6h0l+IMP97F5sFhGnAXqy5GW2KLuR3Dvom8jan652oyew/ciNUkPps2aMLoEAE8XY4OCnIBNc+l5DVUmJwDu97ssNT34xAo0wXnA5eptXbKkCe9tdqp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797004; c=relaxed/simple;
	bh=ElgxEW6lOhjTcQ0sPGPYJIl4XkjO88C2Pm126cID8VQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TA4HFtZoAy7C4wOSitKsjjq0N1dCyqsqdRthfBupY3k2qcQQ3Wu7md3gIfjMrRxT5C6bWXfR8fIm3R+pvgzI8G+nhjXoaWJkhqznytTv8uAxLJQ6Qh1sSiKGaugGCN4nXAB/uXdzGGkqexSMU7RdOJ8iTvbInS3dDPPFx07bnv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cHjHWK9n; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cHjHWK9n"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfc52ddc55so54422535ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790797002; x=1791401802; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gsm0Z8tsp+/USWWrr0ezp3yOKKjCMmloBgzjcNPK3i8=;
        b=cHjHWK9ndvsrhfrWWWmLunh35M+/wH/qNQXQRwlk+LyPmBwCOpJjcQfbjWUm1YWTkj
         8OIh4RflRWEfoeqXWlDL5VnoVwHR8ipvBFgD3D5aYbm2YMqQ0HJfkbFv1QEtTLNQ1aen
         0AM8rVAseV4sStZO96lBkjDGbj9MUR3fK5jCUlGYoLll13ih+pPV7T93JvxZxnptH0HG
         2gs53ELTBarr+isejzHB41EMbVCTBZEHOqNvtJibKTBGvQOz//0hX+BMa+JUPM+pA4PT
         LVN9AuGqkun0Z8GSpxzH+AphDgdrtYpyZcsBWSdXFhtrQ6eq4bbwnKQ6uKQobXBGqRb+
         B4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790797002; x=1791401802;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsm0Z8tsp+/USWWrr0ezp3yOKKjCMmloBgzjcNPK3i8=;
        b=OYXIWve8xEQMWKXk+6Ngx12yHM0RNqYHvJyw/nb6nlXehf3Hnm2ep+M66u7dbqatT0
         X1WZnhG7+FXPMKBorNn64s1yO14X+RNBgsYACAZNbvnbwcI6ZKK/lZND+7BwAwA8drfc
         sOfX1EGiTfH5UJMRpisvJZP/Y7I+xGYs/A2s2l4ZC8vr4iyMk3bpz8qSnTvb6/RGUljN
         n3BNAOGpshcwnBusi7dPCoSRKwgASEr7wRxFXAtcrZTR1jipZ4qaG8qmYNSCB6ZofzLv
         Lxb9kpABKuaJROFNrx9ZZq21ij9tbJAvOYZNc/3zihU5fHAkU44GBlaPgRKMkYH8BSBj
         0SGA==
X-Forwarded-Encrypted: i=1; AKwUvBw/DJYNs9wjnk8uVvW13eVrwdermpGGMfufeTwWAHmONC1rj5yEtT5nWHQN6qBuKFPCqESwWmqp4bVbcFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMxmZ3YsdjkUfJSJ98vbOeR+dgZFyDEJ3YCz5XwWOU4kXceaz3
	YbMzhZoBzG/VjfFQ3DyGN/RQvRQY6d7gBgXNgR3ceXdnS6Nb8thu66sLdKor94CNaWu7y3zQl7d
	b+sxWHg==
X-Received: from plme18.prod.google.com ([2002:a17:903:4912:b0:2e1:32aa:622b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c6f:b0:2dd:c053:e0f3
 with SMTP id d9443c01a7336-2e2e4b3509dmr17949975ad.34.1790797001921; Wed, 30
 Sep 2026 12:36:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 12:36:26 -0700
In-Reply-To: <20260930193634.3415089-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930193634.3415089-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930193634.3415089-5-seanjc@google.com>
Subject: [PATCH v6 04/12] KVM: x86: Force fixed-1 bits in DR6 after
 synchronizing with hardware
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Set all fixed-1 bits in KVM's version of DR6 after synchronizing with
hardware to paper over as much of the virtualization hole as possible.
Because KVM dynamically disables DR interception, a guest can write any
DR6 bit that isn't fixed in bare metal, even if the bit is supposed to be
fixed from the guest's perspective.

In addition to providing some amount of consistency in KVM, this will allow
adding sanity checks that KVM never ends up with fixed-1 bits clear in its
version of DR6.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c | 2 +-
 arch/x86/kvm/regs.h | 1 +
 arch/x86/kvm/x86.c  | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index f74a29621661..db43ade8ceb1 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -772,7 +772,7 @@ void kvm_update_dr7(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_update_dr7);
 
-static unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
+unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 {
 	unsigned long fixed = DR6_FIXED_1;
 
diff --git a/arch/x86/kvm/regs.h b/arch/x86/kvm/regs.h
index 447f0ec3e63e..3ca5cd8a8d95 100644
--- a/arch/x86/kvm/regs.h
+++ b/arch/x86/kvm/regs.h
@@ -62,6 +62,7 @@ int kvm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4);
 int kvm_set_cr8(struct kvm_vcpu *vcpu, unsigned long cr8);
 int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val);
 unsigned long kvm_get_dr(struct kvm_vcpu *vcpu, int dr);
+unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu);
 unsigned long kvm_get_cr8(struct kvm_vcpu *vcpu);
 void kvm_lmsw(struct kvm_vcpu *vcpu, unsigned long msw);
 int load_pdptrs(struct kvm_vcpu *vcpu, unsigned long cr3);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index ea1406c3b260..99518e3265b4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8417,6 +8417,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vcpu)
 		WARN_ON(vcpu->arch.switch_db_regs & KVM_DEBUGREG_AUTO_SWITCH);
 		kvm_x86_call(sync_dirty_debug_regs)(vcpu);
 		kvm_update_dr0123(vcpu);
+		vcpu->arch.dr6 |= kvm_get_dr6_fixed_1(vcpu);
 		kvm_update_dr7(vcpu);
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

