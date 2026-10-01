Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74A48F015
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886175; cv=none; b=Su0giFhAr+kxhd+5rqZTC78jD4XOPDi8WmiRUPSbJkYAmGlA/TdsehqhSQuElC6mcIJdQw6MpwqhE7AcLtBxnh5C5SEWBXE8mXnL9S3+G9GFk/QRlapwPRdsV/20AIHlNV2I3CXRg0MB/TGPXKVifq0KL8U2Za/kzNnzqTNn9Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886175; c=relaxed/simple;
	bh=dfAmrsfcwcIGWF9fBsK4rzaNfgz8HL3CCj30REfQ4yM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kgAf6OPKcT/rR3hQkOyXS0TPkeX6YtiffMQcujTMk8a08w663P2jOgvNWD1IseBlYWTLEt9i0W1e83Wya2oVzsr2TlXd6j6pghCiiKG0pHKEeKh6VTaG/zwYzPq7RVRNPlh8ZfSgOaOUXgJXicCBlWeV/q7yGYt7VC/4qdCb9Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U4bfKoMX; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U4bfKoMX"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so5239605a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886164; x=1791490964; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9PdKaetrQW4UpNDi1+fjAOrwm9Lx9nK7VvLmDqJyyw0=;
        b=U4bfKoMX7VQjHGa+MbCIQciKuiAN29lpWdPdEPpPBm19EBQuu/brH4fiWZXNb8fcMQ
         39wfo9cTvZSamtir3jJm05pv+VgTxfPlzY2/FgltE08CVsxWglVTzgJUmsEH2jcoEDp0
         ilTcG7zBUPdnG/UTnQURan80ZbjARZ3rRZt7iPiqBHVg4u5MZyd7knvpPYukNNjo5OYk
         ZYYCrQmRviJivpk1G5HAYB3uktQF9+uvKGa+xHNTJ2RzKegluGaNhU+iM5uJg7FPgVs7
         cWMbcNNhSCOuTUUvImfrHCPptNgmkgukNOLOHvVWDAqHoYIsGIk9z8gnx6C85dDElTj0
         LhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886164; x=1791490964;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9PdKaetrQW4UpNDi1+fjAOrwm9Lx9nK7VvLmDqJyyw0=;
        b=gGBfJ1fuabdzocj0nKGRGexbU25Ndhz0CLHPsaBnyiupcjRRNV/Af31s7mfvbmWDzG
         zUgNfcLjsmV3L09APWk4YAMfLvml68+suDDD2cot8KWb07Jj1Y+UebIfJkUgckFxvU+X
         uyV9zim5K7hFo+EDoUYZN/UJurVCVUH7UFunNrD1OhszKHTaUdTcfpodxL1RCiK40vID
         s7XwlzJ/hzRE4z/p2f6Ew+upnLUNnT/vrt9233xR0IUyaFrPNlGc49dMSf/SRIEne1ve
         lfGLBqlk9JTqZbG1m5QWOTcllM6tpXxMu0u01Jv2mXzyQ0dEZwodz+I4YFyv729+N8sO
         LThg==
X-Forwarded-Encrypted: i=1; AKwUvBzy7Yz+ZiaI66nnwB7o/0PGgxnPCFc/OHvHUsWc2F9ptKBj/ZrpNWanYuVP/NN4RsagiPjJg/+oBvB2rtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0+hglgX0/PwcnvyLa1h14iagdY0+shy5T+rHquCDSbGDv9hcv
	RjbxVjtAGXaCHjkRw70i6ciFpxbcIDNAdPfyj6RPhZ/G3fIqOVWJjvbnfi+f2/hrqG/Qj56jzjQ
	6RC3DYw==
X-Received: from pjsc17.prod.google.com ([2002:a17:90a:bf11:b0:3a4:fe64:e6f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:58c5:b0:3a0:f559:824d
 with SMTP id 98e67ed59e1d1-3a6ce82b3fbmr576331a91.50.1790886164041; Thu, 01
 Oct 2026 13:22:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:26 -0700
In-Reply-To: <20261001202234.3794060-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-3-seanjc@google.com>
Subject: [PATCH v2 02/10] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Flush/zap every memslot in kvm_arch_flush_shadow_all(), i.e. when the
owning userspace process is exiting, as KVM must ensure all associated
memory is unmapped from the guest.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 2d139c807577..1c8d9d7360e9 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -903,7 +903,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_CREATE_DEVICE
 
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..9e9d0865c2f6 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -764,6 +764,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	kvmppc_core_commit_memory_region(kvm, old, new, change);
 }
 
+void kvm_arch_flush_shadow_all(struct kvm *kvm)
+{
+	struct kvm_memory_slot *slot;
+	struct kvm_memslots *slots;
+	int bkt;
+
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(slot, bkt, slots)
+		kvmppc_core_flush_memslot(kvm, slot);
+}
+
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

