Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4894EDCCF
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790012696; cv=none; b=uO1avVdG9nxi8rEXx/zay1hItwdF8s6/WJ0a6zIjiIVdsHJQksyc9OIyvHGQCCOzhUiRIvEyc48uSRgHYQ2XFNgWFjdR4i+kLHBZvKYdlS1I4t49SFaR4/jO07bxTR1otZ36kNkOrjta/9IUsPC4UpsLBcyOnSSDXR4vShsOGss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790012696; c=relaxed/simple;
	bh=ZDfXvDacTET7r9tcukRk54MywQ4no29qxUUGATskm7w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q943NAllL7ByJRjMotY/Rc/vih4b63riOhVANHp4wBjHY87c5rycocvYujK3bFZALff+Z7AX5GZl1kn4GBdrwJkN2/uSyfXpv9CYpE1SVJL21aJFLLy5Yl6wTFxsL9MTnWNzWv+HtqLF4gaqUFnH5tzXv0cxIThgwCp5NP0jQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LXiMJw6A; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LXiMJw6A"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc44d708055so517072a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790012693; x=1790617493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QYiGmxrgAXU1trJ4S0lv2S3WvlXO7vDS7xlQ1HDVynU=;
        b=LXiMJw6A8Tzz/1EryXmvX+JnXBUSozVDbj5asA1QESKMdDoASTeNze+wxAezArHvqz
         kYBmtNabltlxMt9+q/NplqVUO2kGRM4yLLqbrTw3XI88sVa8xJ3pJl60yHvqfF0ZGLs4
         k3+k6S1WCNwA7pVplxIaX9cP2Q/TDDX6HfW3ztz9BMT6Cd5o4/IzdMTjlb3cSn+jnDTJ
         tbQgs7k5o5TGV0x1lsZjOWSgQjOIWCVqPXjohRRGdpxGv5PLRsOAD1+pGy7iojk7ped8
         qNxqGomWN4ghDirIraF/Eo/Gh4ZGBtoZnlpx4NTJXVzsiuwSBFOOBjJkLlcCGU107klp
         rRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790012693; x=1790617493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QYiGmxrgAXU1trJ4S0lv2S3WvlXO7vDS7xlQ1HDVynU=;
        b=TdrTEeyCh4jA74L35sS2HSDS6zMnJfMu4P8jFz0358hOG+qVncJaN7RYLT45OByUBR
         vRccj/mhY+rAFOxrLnQKsvVlMMGigh3Nc1RgdkvprEh7xnNkqul0Xkqz1aOX+F1zZOET
         pqhR3eY6MV2vkhWbktSTNdM/T1umJC+awPvV8GUR28COOny4OAjplvfdocNj/sKXoBLP
         mQTon5dO6n1nNbKj3tzklaYWtH8A4UecW/OFamJZEszksPQslcBqhq5a/F1A9xiMw1TE
         TPR1Hb9ANrwI+XR4pPo1AcmR6rfhJ4ANpVi6TB6NDuhX8PijZM3IbnXPQYhxe5hoDZK0
         vLPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBpGJ1eJSP2XtrjmLBUzu/mcJClxwTngNKfwyXfWtYQKhB7DJI9obntbayEzhV+Yn8rnMmzrQIms4aIFk=@vger.kernel.org
X-Gm-Message-State: AFuF++mO/mHgHaiMbdwrbWam3GGGmmt305DNprxBPxSruEnJ3z4Cl8DP
	ifOO7ybBm3ra8uw4mPItaskv63HujUCdmS+GMwnDeoatLL3jZqkDJ9zEqgVQK6UiU+56OcDhtUz
	p8PRFVQ==
X-Received: from pfbhu19.prod.google.com ([2002:a05:6a00:6993:b0:879:55dd:922d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ad89:b0:85f:3d78:79cc
 with SMTP id d2e1a72fcca58-874dc4ed21dmr15528120b3a.9.1790012693049; Mon, 21
 Sep 2026 10:44:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 10:44:43 -0700
In-Reply-To: <20260921174445.911676-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921174445.911676-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921174445.911676-6-seanjc@google.com>
Subject: [PATCH v2 5/7] KVM: Move check for existing vCPU ID to the top of
 vCPU creation
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
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
2.55.0.1082.g2b9226bbc0-goog

