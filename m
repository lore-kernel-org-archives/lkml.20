Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1340845A2B8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788391235; cv=none; b=G6XHDpmXNAa1OsbOtImRpjSqY4PdbC7fy9QogsAScJJVFJbIj4tqWNIGaISv2/ssPfdBFHfE5fmDlGzo3eoKeNFqES4sFEioNLRmM5s2sANKwcHe66RtsjOCZdKhOFqYwTvLkursT5KPDBAqMn16BbFqPrL1lp7Z0f5YeLQqkPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788391235; c=relaxed/simple;
	bh=LSeczqcNX4oLR8BivFZ4NLYEJWVMgvGLhQtLV1bS2JU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RjB6jDA8NQrJrg37BxaWhDuI09YU7PbBDTIaIT9JyfINui77Tv5vvjpGsPF4soLs96xIPc8ef4mblmPUWxhHdZGh7UKrf2q8Q9+DfiPNldcgICyy2G2Ga6zvvIFjuw19TeyyaN207GydCMvFrrNX9+EQ2tqOQ+EefP6yGR0GVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OGg7ecs/; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OGg7ecs/"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so33061695ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788391232; x=1788996032; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OiiE2/S2XBAKWq1rmxArOvIbLAdbtFy6rIi0vLxRxWw=;
        b=OGg7ecs/11orytrUuzoc6pMG1/CzYuZylW58JUCXzbO8u+kRSutUgypJnEdSsreiDO
         pan85lMZZmHTGP9Wqwr2E08tSxJNjIrc9+yTQQyDEXQz1MzMsBpGyH2wbRRENzbRtZdg
         dTcNA9mpDGR3+JXE40BquJgwR1DamhIaRGBGTJ73B0nf9lWzzi56ixY6rlVAjPieBykM
         syG0GAC9rPIijy36+eQcF//z4+HkGo4n+qDSXTan/VYNEHxBaqdiLFHO9I0lL0Zs4Zlz
         /l9c0d5fkj89unqCPnbjZtQr0Te556ZT01D8uJ2ZNCmkOACuCkiWT72M2xVQhv6rQxP8
         P7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391232; x=1788996032;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OiiE2/S2XBAKWq1rmxArOvIbLAdbtFy6rIi0vLxRxWw=;
        b=Ws37WJ0E3/D6ZRwpsJyX2WdiI8H2rvzTqM/vYagay8ZLVzC8WcRTHaqT8PoauvvSM6
         wjg8bbTSQ2A/MkOg4eEa3T62YUOrIyWmGSs8E/aho/ArGW6VeTjS6UD0Zb6nWP7Ka/8f
         C1fU91Olwp28iLBTnZUzTOfI9s8xQ5fcM0b6KRnA8B57qXmg4AB6PHHs5V7KmYsQQQeX
         xCO3XSHH2qKSc1Q4Gr1/FTvwyllqCAxf6yl4i2TMyq/1t+RXknhNjUpzK1G/gW8cbiVQ
         iwnwHoW9wp0NIPchPjjpLL2CL5C8bW57iLB0euYzFlsiq4LuGie4DWwdW4xOHOjSynDS
         JeTg==
X-Forwarded-Encrypted: i=1; AKwUvBx3KmvoaEDwdoJIONT0L4owBnCijoMW//QM4FKZML4NUDqLgxgoXW5eB9Z1eiEb+qZOQYo/ZKbVl1PrYwI=@vger.kernel.org
X-Gm-Message-State: AFuF++nacKRnyHHxj96Hcn/8VhtofVPZ/MeaDJ4K37b8PyGDf+vc2A+N
	CHELW0sCZoxToaJscEOwLPOX4Mia6m+u0GYUbn18inbBo8PfcwRz+Uhk/QVgefMShkj+2Ckbe+W
	6wZ9KnQ==
X-Received: from plblb11.prod.google.com ([2002:a17:902:fa4b:b0:2d5:3395:63b9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ebc4:b0:2d9:3365:7f48
 with SMTP id d9443c01a7336-2daec703f04mr123545765ad.14.1788391232071; Wed, 02
 Sep 2026 16:20:32 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 16:20:25 -0700
In-Reply-To: <20260902232028.2767071-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902232028.2767071-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902232028.2767071-3-seanjc@google.com>
Subject: [PATCH v2 2/5] KVM: nSVM: Ignore EFER.LMA if EFER.LME=0 when
 preparing L2 state
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Force EFER.LMA=0 if EFER.LME=0 when preparing L2 state for VMRUN, i.e.
mimic real hardware's behavior of ignoring EFER.LMA if EFER.LME=0.  VMRUN
unfortunately allows the nonsensical combination, i.e. doesn't fail, but
KVM itself has an invariant EFER.LMA can be set et if and only if EFER.LME
is set.   Breaking that invariant can lead to a variety of issue,
particularly in MMU code that keys off EFER.LMA when determining whether to
emulate/virtualization 4/5-level paging versus PAE paging.

Cc: stable@vger.kernel.org
Cc: Yosry Ahmed <yosry@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 49fb10ad1f9f..23d29597d6bf 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -789,6 +789,10 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 
 	kvm_set_rflags(vcpu, save->rflags | X86_EFLAGS_FIXED);
 
+	/* SVM ignores EFER.LMA if EFER.LME=0 (instead of failing VMRUN). */
+	if (!(svm->nested.save.efer & EFER_LME))
+		svm->nested.save.efer &= ~EFER_LMA;
+
 	svm_set_efer(vcpu, svm->nested.save.efer);
 
 	svm_set_cr0(vcpu, svm->nested.save.cr0);
-- 
2.55.0.970.g62bdec98f9-goog

