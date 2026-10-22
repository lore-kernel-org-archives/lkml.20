Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792635150;
	b=cKXQzX4T7uek0KGleQ/13JR8n4AkgUt92+J2RBT3WRU7WMDkmE8uPmO2SdM8J8To+vNw
	 U7XopDkjaqWlADYzdm/SKSpC+tl9CBqOCgRVAigjrlBkqLBhQAAKjeG78BxrcgM5JwbnG
	 /v65C3sLq+ONWAHft/ZQgWMpS8jByEy/zGvXrAvVW2Akc5AKaAjsJTf89hCEAkaZRyHR8
	 9pd9VqWvFhDI+i6ApQnjuuKiYc1Ng+vbh+pFAhz3X+TqVuPVOsBSZgqgdvP4G+8sic6Jh
	 jfRZy99gbeasku6BaC68u9J5kfWgaBiUVQvIt75uVjt1M+rRnLDFs7bjFmbw/0SLquw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792635150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 Mime-Version:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=F6RPqsYmIYaB9md8HBgOWfKW5EE+1fjGEEB48wFSvxw=;
	b=k39RzGSv5fVgdBCNK+VvqX5T/JVT40VWJxMElsZys/2rVcsIyxbLF1iYlsERW1NjqqZ0
	 3Tdeq4lWbUOJ/N7/4+CwQKRw0DcqwtmLRRLxwlDFXS5Ia9bQolgN1JSx+WedOyP6Ka617
	 kYImecu9+aOZWBkxY29DboBvVSNquUlixRkSdFIu1Qj3/FajQbWaLFnKgrV0rOJhtIKun
	 Tbo8/PV9JimKdByhTezaY0RB79kf7tj2usgolQAFeQRBbvUPVrGQJIvIlvT6IfL4urtEl
	 YL3i3iUo3Aqg/3XW+nMMNE9oEdCronmgHtF0RXrmPQBVGX9llovKOgiOO7CPECAMtAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jWP1mS3Z;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B269606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B269606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jWP1mS3Z
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso1448262a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792635149; x=1793239949; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6RPqsYmIYaB9md8HBgOWfKW5EE+1fjGEEB48wFSvxw=;
        b=jWP1mS3ZrEbM75axaIPKuXagPBAwhfk+cKUThFGFMqaFKvj/Bk+1epwt8bEpBH5iQQ
         L4cdx79QORaDBSoK0yURjjS/uP6O37oRUJAeV5ZX/JcRtV9X/vpiGWJYtpPfSeyo8a9k
         BsE4uwkyI0MZgViooR0JZHuzo8Q7dbN+AsjxAa3kMu/mwmUpjda/n0Gl4ND9WWPCStXl
         NhY/Z01X+p0Vnb+n847p9frX94pj93zkAhJ6RFvBt8K8e67gDpQPbWNvZc83qweKFx9n
         TffRb4m9iIx+wptS4cI9m9Jy4We4BkFmLlDEmPpzlUYrl/hSKnaktQItKsrqY+oeuTJz
         fEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792635149; x=1793239949;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F6RPqsYmIYaB9md8HBgOWfKW5EE+1fjGEEB48wFSvxw=;
        b=WmE8+oNf1HPFFb6WlFBowNSI/5cEnSm0IgWn2078Kit/nruWCRm9CHOwYtbtTMgtDh
         7PtiXa4CAYxPDw9TC6ZG817crCgvhK9M/MBAqqh/i+RC4Uv+QT6UV/p2AqEJVm59IJNI
         dGic3byF7/uYXl5l9V9JgKFYPRWpPP1npfyKamfcRSd+ZSOjbEAL2Ep30T6QTtq+FJjT
         3WlJt+94e3C2AIwm7rxUmgng/gAFq6HgOFv8CN93BQaLaescMQ4kwcAygteuP3m9ZwOj
         8CN+cHLoYQxqlaqcfzGdXVyTAisdp1KLE9J4MrRT134K+MYCVnz1cdcEvPTneWMNXrwd
         D8jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEW7RHRzlJLVKv4eHvVtkjuVdxYg0ljTAGvf0TSEx9mq3xmuB3GS4x2M1UpazzENbzC9Va8JGH7Qes9bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDZBnt1K3Ue+OdYUt/Ao4Ivo6W9nO8Sznv4J1x4+RvurBIFOAQ
	IbtXKnvBNiTiTP5xlfRZcN21t8RBRbJGQO1UUmN1jSk2SDOknqYebcCj+BaswWoj8NsCb0bncHY
	hjPBS5w==
X-Received: from pjwx12.prod.google.com ([2002:a17:90a:c2cc:b0:3a8:cbf9:5e52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:582f:b0:39d:efa9:cd1a
 with SMTP id 98e67ed59e1d1-3ad86b0bc8amr3360752a91.4.1792635149221; Wed, 21
 Oct 2026 19:12:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 21 Oct 2026 19:12:27 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022021227.295495-1-seanjc@google.com>
Subject: [PATCH] KVM: x86/hyperv: Explicitly reject VP Assist Page reads if
 cache was clobbered
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Content-Type: text/plain; charset="UTF-8"

Don't try to read the VP Assist Page if the shared PV EOI cache has been
reconfigured via KVM's actual PV EOI MSR, as trying to read 624 bytes of
info when the cache is setup for only 1 byte will trip the sanity check
WARN in kvm_read_guest_offset_cached().  Ideally, KVM wouldn't use shared
state to track the VP Assist Page, but in practice no sane guest enables
both KVM's PV EOI and Hyper-V's Assist Page at different addresses, i.e.
not allowing both to co-exist independently is "fine".

Fixes: b63cf42fd1d8 ("kvm/x86: implement hv EOI assist")
Cc: stable@vger.kernel.org
Reported-by: Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>
Closes: https://lore.kernel.org/all/20261017093016.32348-7-amirmohammad.eftekhar@cispa.de
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/hyperv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 5d2e3617c952..c08eeaac8bb7 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -949,6 +949,15 @@ int kvm_hv_get_assist_page(struct kvm_vcpu *vcpu)
 	if (!hv_vcpu || !kvm_hv_assist_page_enabled(vcpu))
 		return -EFAULT;
 
+	/*
+	 * KVM reuses its own PV EOI feature to emulate Hyper-V's EOI Assist,
+	 * and rather stupidly reuses the same MSR and cache storage.  Treat
+	 * the assist page as inaccessible if the shared state is configured
+	 * only for PV EOI's single byte of data.
+	 */
+	if (vcpu->arch.pv_eoi.data.len < sizeof(struct hv_vp_assist_page))
+		return -EFAULT;
+
 	return kvm_read_guest_cached(vcpu->kvm, &vcpu->arch.pv_eoi.data,
 				     &hv_vcpu->vp_assist_page, sizeof(struct hv_vp_assist_page));
 }

base-commit: 814607cd40df80d5727957adaa857e0feca43497
-- 
2.56.0.218.g1ec904b173-goog

