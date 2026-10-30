Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395278;
	b=DuE0hDoBqo7y03bEQkja7xKcW1vEA9RU5H5UmVtEfMOr8jmM3eCKfE2mtagEL/4vKD01
	 Oxf2UPk3zfSK6V9GY5In8zqNj6tIls0bE2lYK6hDUKZXt+NvoRB0Qc/Yjb4kVNjY9TwPg
	 b14qNxQfJHPHSDgiJv60ArZ4EsjRYI1YS4UAHPtekb0Du/UtgFEOF2pu9oM9vxFwunfiS
	 0Waah2lT6e2NS+GOJoafuU3+4tD113Rmyqn7AtcBt3FkTzRXJyFgYpWcjBH5IYhevomjY
	 ddnt723q6EO+sh+y5vfqhqhxQs7F9SV2OVC4GJhhpJrWhfKywp5Zh5e/grLH4aTqMlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=xVLOuB5izvjqY2+yn+X5wA6bkjFEaB6u1KjQAeAFkZo=;
	b=D9KhGScZzQyI3U0gae46Ah7A9FnpIzoRmYNS0ANM31O9O2XgBV69pYO3sWpHoeKoM/P9
	 merkPYCNS8KJEOuQsfsCkqTEpT0OOHIH3nIh3tavj6QwD01KCk1GZPZiODr79pw+umJkm
	 Vp/e16l0F4n4u8PINQx1hN2NzgeHsuEO4JobVJFfkSts5EPl72WIL3WQPYCbT4jslPgdD
	 Ehzi2b6nlKq6bnsGAeIP1UpYhHQ8/oVDtZ58HRjK/s2bvSj1ABjpYFLBsjKJKaMMVqzZB
	 LEX+URViKeBoCwl3k9QFj5zM/iutfIH0H8P8yAj+A6YBE8VIow6AsfzjKVfuDQhY5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Uz//6MQN";
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4C60A2627
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC4C60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uz//6MQN
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06750c74fso915952b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395277; x=1794000077; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xVLOuB5izvjqY2+yn+X5wA6bkjFEaB6u1KjQAeAFkZo=;
        b=Uz//6MQNemp4FePqQi8GcGjSLB+vaNce72eW8KGybfE1x6DYHudA+3n2QFCg45n/vS
         cIOAPGelLY/xENU1u1moIoGJLpRpD77OYk96GgCvQqK+xoaOw7FdATQO+lmPWnDMMgx2
         FcEHxJt3w+fOzYb1TR/DUllSwqkoEohSmcLl1PxCWYZjPQmpawJy2mnk8b3mggyu+oft
         qA0rLRaMlXLeL5y/SkM+OgKtFLnb+6ZjhTv0Tk7p3zuDgXRUOLHkDlkSTL8Wsxc+vCRt
         FuUh6th827fEhRBJFTmWOM+3G403iMRh3QetYH7zhPybwT716vSOUSixP1PfmY34w1e2
         KIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395277; x=1794000077;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVLOuB5izvjqY2+yn+X5wA6bkjFEaB6u1KjQAeAFkZo=;
        b=N73ULv9UVXALukQM95faljL8Vlc1IGDL2aI+Y8VyXCgm+QUjblhmMIbZArGCKeKKLw
         UllaH+qISMT1pc32U+Xk0b/lcqPtph0I3K/gBHJWXP116QrGYaQK+Gcm6l6xfgcTLNQG
         GXJuy7eQVcW5uei3DGrPEu3QOLbHcJqF1U7aAvJvcdwdCUlNv06E5TG8x0zre1o9S3Lm
         0blmqdfxhK5Frc8uxTqYnxbTUVp2s1Lx+YlQun2Efa56HTExV3dxX7LHRaZkbmBhXcKS
         /BLtb3/3xJAhH8XLSb8gWMqBnW7tQhkrQ8waJoK3v6w6orN2Zp8llutNwnajVaVx0b8+
         F9+Q==
X-Forwarded-Encrypted: i=1; AKwUvByVwxNV/oyvrX5aFhzED/eA4hs7HkV6JzMdjODFGBkvvHaFiRXHWnbz0z/TPhMm0O11E60EBerACMSHo1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSzAlyCDtpwz76petWNo+RsC+fxVEElokwjpMEBdeRPKrPdJbh
	5AxhjOavgqagnJsi30ttJF4w47w5NqZ1MZpdHFQd01XNelYE5Pmx/1Onos+PA7DqkrbtmCTzttS
	fIukEhg==
X-Received: from pfwy10.prod.google.com ([2002:a05:6a00:1c8a:b0:89f:5522:3f42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a118:b0:89f:c441:580a
 with SMTP id d2e1a72fcca58-8a9bf339441mr2641764b3a.36.1793395276884; Fri, 30
 Oct 2026 14:21:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:51 -0700
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
Message-ID: <20261030212112.2598640-4-seanjc@google.com>
Subject: [PATCH v4 03/23] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
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
index 708a32f89776..50a42f80e5f1 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -910,7 +910,6 @@ struct kvm_vcpu_arch {
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
2.56.0.385.gac671c819a-goog

