Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B743537F1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790730820; cv=none; b=O0/pLLEo3+qGyDONVe4Mqx9esYNS1p2QJkJAbVxppyM95D0c/LudzP82lv7dfzECCezYQdluJpT2ys0Bk6mdTUeNCffZJb0kFhdzdMPE44QrbkJ/mvc6Lt+4aQJMSl29m2nLbWCzKwHMENkndvc5HrAxYzupTagX9ZFOMudbmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790730820; c=relaxed/simple;
	bh=6Aco7EOhkiIqZeH5bR7d9zgidb7xSicYOKVcT78vcZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uEEs+eyTZ1cz4q7rnfhYWDegALMel11+OXoJICHvYyzaCw/S5kYyYWu7ElITzKRlwUCzoqinD0M84abU/fo4V965pYRQr+lrylQw1ONWsIn0c9d7aufDwUHIYyBSPY4tljjdwLa42eyl+xsFqKvdvJZTnGJEfFVsocVkusetfUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PGoReOWe; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PGoReOWe"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so37708795ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790730808; x=1791335608; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8l2LQZ/K3M62HHlaD3N2qkeE9h03hcQIsVix5OsuQN4=;
        b=PGoReOWe/cz9npaFVrGRFXVFLc2s8iDcDjcUVSOh/EyUM1Kv5O6bvF2BaNZ/WcWJS0
         XtFI94RrY/sGPz3SXXQAboxsX36hPYkJHbSIj6g4FkOxhoir4hlaKwBOQuK15OEfsBCn
         9CYmxShN4zzdriFdpHSmYTKNWthfnQasa7CKKSOm7PGv01cl3Hk5vb8apD92ERJvIO15
         nlcKAnlqRmXR+VIZ+7kT9YBer58w5OGD+eSCxxixxKnVuTQEYjwSMzdIeDG87yTv6+7b
         USoTKnvf7pQZHhR7i3JrpWvs0jiPeqaKnl4CMDE51w981RtiVeZNTNgifkik1iDZDCl5
         uVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790730808; x=1791335608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8l2LQZ/K3M62HHlaD3N2qkeE9h03hcQIsVix5OsuQN4=;
        b=lUsEW2dFlh+KuLzS2/BATf6uO8Zb9zomv7dcbwiYN1rEW9TLax9le093tfSM4bmq3h
         JCDanrUA/3LmgNohRUPVDVPhg9XgwIs+IxJTQgrTqO8B+B0UHM/cFLLqzx1VXIB7e2Hr
         f4DZqLgYJUF9vID4/d3zhJtjhX4Mcce275CvQnjLXyduxRSN0qjcRud8QiQRk0CPX8w+
         LCPTWIlkGE70F9hzE8/Jhihh2w8SG04SqmYJ4NXq6FQf99HAS/n/sXZotnKU3DOJ7qv2
         WeoTyA8OBOh+zD+KsUiOq8+vIE3OkKuNSRfKf2r2AgeUkmTCNhIYRBSQaKBzX2MgIoH0
         IF1w==
X-Forwarded-Encrypted: i=1; AKwUvBz10Yj2a198L4sbnML7dy2nfDleSCwb8rS8CnBDbAjhk0z3jch+47t2qvXX4iFdxGaY5H7nGmCjWP8Sook=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJtZOlCsPLJSFeXtF1AjYNBSwi5/B6XIiXm0kTmK7vsNU5w2cS
	wO+NKVriJakAeTFxdPgH4v8y74g+0x/pvTS4Nli/zIfwe1H/2IL7SC2+jWlQaJ9H0QQIjb+J5nz
	0KKe2iA==
X-Received: from plqs20.prod.google.com ([2002:a17:902:a514:b0:2df:a554:8274])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cccd:b0:2e2:b00f:564f
 with SMTP id d9443c01a7336-2e2de52a888mr6581745ad.18.1790730807329; Tue, 29
 Sep 2026 18:13:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 18:13:11 -0700
In-Reply-To: <20260930011313.3197688-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011313.3197688-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011313.3197688-11-seanjc@google.com>
Subject: [PATCH v5 10/12] KVM: nSVM: Don't assume all active-low bits DR6 are fixed-1
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Shivansh Dhiman <shivansh.dhiman@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Ravi Bangoria <ravi.bangoria@amd.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

From: Shivansh Dhiman <shivansh.dhiman@amd.com>

When preparing vmcb02 for nested VMRUN, force only the actual fixed-1 bits
instead of setting all active-low bits.  The flaw is currently benign, as
the only active-low bits supported by KVM are RTM (Restricted Transactional
Memory) and BLD (Bus Lock Detect), neither of which is currently supported
on SVM, but that's about to change.

Signed-off-by: Shivansh Dhiman <shivansh.dhiman@amd.com>
[sean: massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/regs.c       | 1 +
 arch/x86/kvm/svm/nested.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/regs.c b/arch/x86/kvm/regs.c
index 0c76cf17e884..3621f1a47d37 100644
--- a/arch/x86/kvm/regs.c
+++ b/arch/x86/kvm/regs.c
@@ -784,6 +784,7 @@ unsigned long kvm_get_dr6_fixed_1(struct kvm_vcpu *vcpu)
 
 	return fixed;
 }
+EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_get_dr6_fixed_1);
 
 int kvm_set_dr(struct kvm_vcpu *vcpu, int dr, unsigned long val)
 {
diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index d3f249cd0f2d..c7a69e309a36 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -808,7 +808,7 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 
 	if (unlikely(new_vmcb12 || vmcb12_is_dirty(control, VMCB_DR))) {
 		vmcb02->save.dr7 = svm->nested.save.dr7 | DR7_FIXED_1;
-		svm->vcpu.arch.dr6  = svm->nested.save.dr6 | DR6_ACTIVE_LOW;
+		svm->vcpu.arch.dr6  = svm->nested.save.dr6 | kvm_get_dr6_fixed_1(vcpu);
 		vmcb_mark_dirty(vmcb02, VMCB_DR);
 	}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

