Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194026;
	b=llYYTUNPbFnoa35N5HwGJuVslG33uY5NxnIvLQE/XsDLykKarK8LBYjoYkto+YZu58lQ
	 ypecLoLawqkDqKtzmE3wF+H0btVfOj/evoiwK0uTEg7zk2FLnA+NJAYJ73ymh6gdl1DVo
	 ASl8t6pHuhlH3FGvcPGiJG3t8t59tFAZJ1UAenbIQbt0KTVVylquOAR/2zF6R2diE6FLm
	 FxlBwjK4amMMLqv91paMZgaZpYdNcL8B1qoUIrMgclezGwZrF1KhqlNMwCP1z7hVDZ5nc
	 8ZbGja796w28m5MPF8IxnFWd9yHX2ggBlO0H0AJDIsDjjmjeFro/w8PslqRlC0bYnbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EleQ4DuQvqyeRIQHJ+IbAvoBHmxUKc+6S8HOtpfcYzg=;
	b=AriM0ikE8uw8Dbz1+8ysNLWjrceMHlF9GuE/d2UTN9m8hrUo4Wv6DkfY5l4aJfWPKbJd
	 zuCka2ug8/rkK1LsbRYTUMWnZ16Y65VkgL5bWm8wJY2U1cQs5jy/Us+Akt4an2JZ/rgOu
	 hLfamyQsM33nxuUxyXcVIId8hsQKTAF36UKN8kXS77uB8y5YTbJMrpDJ5to9gMJOurOYn
	 TV1pvdUtafhQ49Al7S0NSkWwqaRrWwd2vb/xC6yQpOnczi0Q29v6bDi1qnxfuWCoPZupv
	 1ekSx1L2H+DC2JE8ibbdLk2pByUNAZFKLZA6FMvARSBs4yqLftIwmtSctHM1fXdAWLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=paYgznU+;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E83606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13E83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=paYgznU+
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8dd9b9743so9933345ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793194024; x=1793798824; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EleQ4DuQvqyeRIQHJ+IbAvoBHmxUKc+6S8HOtpfcYzg=;
        b=paYgznU+zD8wUb5jfI0oqMlHcNPxhid+Cw1jqHcm23xn2ap3D6Ni2JbLxC96GLWBDl
         bo1qK2t2R1yRq3MVl19Om49xrGO0mlN3G6PlFFJ9Etz5MfymCIW43YkzSLlvoOTogcvf
         8TS5xORBFwSrIU+/FWK386IQopn6Q0oyT+O5PtO3/jCG27FIosfsKG4RNBlMjcgUiV42
         cd/ULCJ2sY8xOkBr1au6LfMjMvszfbjQnHu24+IAxrnkiGt8p2N0AjZaQmgyeuvtD6St
         y6gwewT/6qZIr3uo3VSBXFJKuJ02/gyFj1KaXnpHIKae8k7OlRiy0diaqP34n9oufmFI
         jFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194024; x=1793798824;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EleQ4DuQvqyeRIQHJ+IbAvoBHmxUKc+6S8HOtpfcYzg=;
        b=nCPV4c+z2Ws125XzsWiP3EzYp+AwVdrU69mG14DNLtsKekI79mPXI4fSTKoyjYIkpi
         3+bxBOt5VTmgddfgZXL1WDDW+TWBmlg5us84d/U9HZ+n8kYdrLi4dpSd3kd9cYVPbQyj
         BunntMJ/qNMsMKk+eyC26xVNqbrzJFNsViOlRIJ0P11uHTnhdfsJkoNvTaLxlRRks1ne
         4q2LWn0feljOB10qCyHRb14JVrrPXRYjmuHrhwXKL7Zi233MPpHIMZc/SAp/uWIRs8mF
         PGm3ngk5d8HHesiS4F/zrVtcUpi6gg44RIvFV4iI9PvGk04++GKk4hwWvBe1qQpoYTop
         lVXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzILpLQH10EQbCFvFqVAxZdk1clJb48spaTk4bpvwXGSdSPZ4Nc3/i6auhukmhtiPAD5bCUVBtLVB06MnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2m18C+jh0kcRbYNUvljNmvHUVnOmTYZOMit3B4z6bpOrzzEoU
	taqdNRydbnMRJI+WRK+2kTT12BVZXxt745spRwqldqe3HN+ZqQS1d1WFMK2zmjF0gnuFEyKVZyC
	uQFH1zCbJ0cOSxA==
X-Received: from plte1.prod.google.com ([2002:a17:902:7441:b0:2e2:f305:e980])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:32c4:b0:2e9:658f:c33d with SMTP id d9443c01a7336-2eb00085db7mr24881635ad.4.1793194024058;
 Wed, 28 Oct 2026 06:27:04 -0700 (PDT)
Date: Wed, 28 Oct 2026 06:26:52 -0700
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
Message-ID: <20261028132657.1416783-1-jmattson@google.com>
Subject: [PATCH 1/2] KVM: nSVM: Set NMI_VECTOR in synthesized NMI exit_int_info
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Jim Mattson <jmattson@google.com>, Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Include NMI_VECTOR (2) in the vector field when synthesizing exit_int_info
for a pending injected NMI in nested_save_pending_event_to_vmcb12(),
matching nested VMX's idt_vectoring_info_field synthesis and the APM.

Per AMD's APM (Vol. 2, "Intercepts During IDT Interrupt Delivery", Figure
"EXITINTINFO" and Table "Guest Exception or Interrupt Types", and "Event
Injection"), bits 7:0 of EXITINTINFO hold the 8-bit IDT vector of the
interrupt or exception, and injected events are recorded in EXITINTINFO as
though they had occurred normally in the guest.  Although hardware ignores
EVENTINJ.VECTOR on VMRUN when TYPE is NMI, EXITINTINFO records vector 2
(#NMI) if a #VMEXIT occurs during NMI delivery.

Commit 36e2e98363e6 ("KVM: nSVM: synthesize correct EXITINTINFO on vmexit")
replaced the raw copy of vmcb02->control.exit_int_info (where hardware
populates vector 2) with nested_vmcb_save_pending_event(), now
nested_save_pending_event_to_vmcb12(), which sets only SVM_EVTINJ_VALID |
SVM_EVTINJ_TYPE_NMI and leaves the vector field as 0.  As a result, L1
hypervisors that check EXITINTINFO.VECTOR == 2 for NMIs (e.g. FreeBSD's
bhyve) or inspect the vector field of exit_int_info observe an invalid
vector 0 on nested #VMEXIT.

Fixes: 36e2e98363e6 ("KVM: nSVM: synthesize correct EXITINTINFO on vmexit")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index af0ef678433d..9b62113f0cf6 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -673,7 +673,7 @@ static void nested_save_pending_event_to_vmcb12(struct vcpu_svm *svm,
 		}
 
 	} else if (vcpu->arch.nmi_injected) {
-		exit_int_info = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI;
+		exit_int_info = SVM_EVTINJ_VALID | SVM_EVTINJ_TYPE_NMI | NMI_VECTOR;
 
 	} else if (vcpu->arch.interrupt.injected) {
 		nr = vcpu->arch.interrupt.nr;

base-commit: dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4
-- 
2.56.0.307.g5fe7bd680c-goog

