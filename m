Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BFA49B200
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409554; cv=none; b=GIcMcmx5kyeoo41oo6774nDag7WN1J8lvitW0ElY+r7K/mLkObG3YXpAa2Extlg8q/93B5iQSHk9OfrXEe6esGmfl+kUnaswpsQFRnZkDHajo+0Tu8A10sNtC1RO/WJavKcvnh7coMOHWSWHQ8pXfRHzV3q5W0R4iqfYps8pt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409554; c=relaxed/simple;
	bh=/IdUyLNiMdGu0jrgGR9Q1GZN+1EphXX7mT7YjuCIqIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Kaw1hE1fBmX3dGw5TmwHl+fp+PyAFEJ1Nathdqw2nS/5scLFwrOmgLEaQCF8cEGo9LOFkFSJ5yN4mta+TQ13B9o/VHd5qZQR2gMaFKdA6Mrb4S7eD/FGARx1ETe+Q1pwmYvxAop33xw6NHPy81KVFO6BbdR5j9wCZx1sgpQLYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mOugi3ZT; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mOugi3ZT"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso3167102a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789409548; x=1790014348; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZO1urm4Fark0kk4FfGgKDyyN0dzql0DO01I8NkWQ2as=;
        b=mOugi3ZTM5REKyYD+tE/9Q04x+mflskhf479f69cTl7Yr6Nyv+PWK3CMeK9UGmx2bP
         1n8no7kk9inVZcah97wDhRyQbeSoYa4Q/pcARGYpbFCBPRbXLB7ggxHuIbd/BPicP6EK
         0GKRIQp5Ij4RIXgy0kxTj82aklzOj7Ttjq+lryAPBzZkk3RNX66Ucdbf9LuO8V3UIsdo
         2WAi8bcWnPb8VSlIct6/A73YvLU6Hg6ENRC78biexQFPceRKistP5zCtwpzqGFX44TnF
         KdJ0Mwi2mR+OvpHKuV93EwBUEOfJQN84kxg5C7Bompyp5qkcN+e4fTaj/TTUoiWKcb8b
         KxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409548; x=1790014348;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZO1urm4Fark0kk4FfGgKDyyN0dzql0DO01I8NkWQ2as=;
        b=fUYb95RFlkNnqczaKa9CsVAFLDZZ7IW/vHewMq8Lr7SSFNaj6Tx7B3BRaHaW55d1g4
         E9CDUZQZ/5qntHKz057wCRH9OnMvLOBqHCmNcEQuZmeEKXz1X9sIowZEM3qyPD7g+Kw6
         bzyu6B04wMHgAWkQWVnICEDu7OvTu/G58yuKnCLL5Zmh8o+czd2rnO3c6pxkNcFEqpk8
         FPTRWnejnlTAf9aTexLu6izU7M0MpqDmkJZdfhtuktGZI2knGEJ4PqR7AkQeXMWAp+YJ
         st1Npe0yi55GGRnauwFmDbH0ZL1l9ON68d6+4i34kzYbDjID1EyQlxw4vg5bbJ/WDfMm
         RQSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOs2kYFaoEvAmcj/KCZe3CZj1UAB/MiwQ1mMbD669aQLVDylkUX906WwLYPd2erugeDr12xbNQRLhcHwg=@vger.kernel.org
X-Gm-Message-State: AFuF++kolkfdA0fBoSH3dA7S9JPIgpnrEdsZqJUi0xAgftmwpGSq0JV4
	8PJNjU6BiSEOHGN/Vml+f4nuRWY/yT+qycayXw6jJep1Cji/ZgWiMqviyldqTWzce43k0uW8AxI
	vUXyfFQ==
X-Received: from pjbkx24.prod.google.com ([2002:a17:90b:2298:b0:39d:c134:415])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc1:b0:39d:fce7:f63a
 with SMTP id 98e67ed59e1d1-39dfce7f7fbmr1445324a91.6.1789409548252; Mon, 14
 Sep 2026 11:12:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 14 Sep 2026 11:12:21 -0700
In-Reply-To: <20260914181223.289061-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260914181223.289061-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260914181223.289061-4-seanjc@google.com>
Subject: [PATCH 3/5] KVM: Move check for existing vCPU ID to the top of vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Now that kvm->lock is held for the entirety of vCPU creation, check for a
conflicting vCPU ID at the begnning of vCPU creation, before the arch
precreate() hook is invoked.  This will allow reverting commit 97d65b544f48
("KVM: Check for duplicate vcpu_id as early as possible").  For now, keep
the redundant vcpu_ids tracking as a sanity check.

No functional change intended (absent KVM bugs, checking vcpu_ids and
walking kvm_get_vcpu_by_id() should yield the same result).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c17cc8dd371b..d5524ac8c5cf 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4182,7 +4182,10 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	if (kvm->created_vcpus >= kvm->max_vcpus)
 		return -EINVAL;
 
-	if (test_bit(id, kvm->vcpu_ids))
+	if (kvm_get_vcpu_by_id(kvm, id))
+		return -EEXIST;
+
+	if (WARN_ON_ONCE(test_bit(id, kvm->vcpu_ids)))
 		return -EEXIST;
 
 	r = kvm_arch_vcpu_precreate(kvm, id);
@@ -4221,11 +4224,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 			goto arch_vcpu_destroy;
 	}
 
-	if (WARN_ON_ONCE(kvm_get_vcpu_by_id(kvm, id))) {
-		r = -EEXIST;
-		goto unlock_vcpu_destroy;
-	}
-
 	/*
 	 * Set the vCPU's index *before* the vCPU is reachable by other tasks.
 	 * Unwind the index back to -1 on failure so that KVM can use the index
-- 
2.55.0.1032.g73a4cd73de-goog

