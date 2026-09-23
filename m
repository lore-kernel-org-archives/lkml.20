Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4767852B1FE
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178679; cv=none; b=kSuvL7aV7hoAgzdPEXiXBuIC9abQydw/JerSdFAbRFPBbVgVN/wVTphtEQKOdh4HMVrif28C1Nh13bj4epLsVpLY9mN1oZuwYfN2PloXVXpIeGFg4JGP8mOquyCym8aVCqx/KiRSL4RdgKBNHvJCLFAfA5SfHTUGMiYQtw5dhYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178679; c=relaxed/simple;
	bh=hAGeqAtPkGOS41f5bDyMSpg3ysHNF8998MztkXzdvV0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BGUdrgXNLbq2zNNZU63NTex14vpUoWbSOpFLEOt83BZEucEHuWA+C/W+8Tw+vKMAz7YSrZ9mDVtA9CSOAt5+Lv23va6P7HjgzymkmsR+D7E7V26tmk8mmkf9747L1EZ2ZI0g3TVcTaHNERf6Q6VUU13P86hCt4Dm9S7Drlw/OW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aluaDtGt; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aluaDtGt"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so1132193a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790178673; x=1790783473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BZvXYDcMxG9QzYOllEJznxsL4DUn8KPA1psb/Zru+OQ=;
        b=aluaDtGtzecMttII5rgAmNOnwBDgPK7j7OheAHVdzhmrLZ92YPieDi3YB9lMyYmep7
         RRX8j9DlR5RTiNGe+5u5Ot75jx0554s279+YoqzBdte0gDKNkMk0NXGr6XPblIsJ2cqm
         NuyjfNlbfJ8WSas5yzJOKKp+Z8vxjZrviJ64PQx33hzEZLxZ6C4rDn3oiIRvNDt7p+S/
         GUd8pztChr7V9l3k0BxwoiGbbF4JnhyM+OPIDRBnXG1L61cescoa8/jH62DkwLMF6bNA
         KAGfZAZiYX898EcCjRlu9uP7rhoaIDD6YOkWX8zI48nHL8qXyf6820amFP7ulUDNF4vn
         2gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178673; x=1790783473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BZvXYDcMxG9QzYOllEJznxsL4DUn8KPA1psb/Zru+OQ=;
        b=iKSHEyRMzkGp08SZ802Dab7oCQKU9PBrmIlxQ45zTsSXO10ll/mDgwpQJVPCRD3pAm
         U8ZYDmC2IFqLfarQHqxNUWlTN9UYJa8SuuALHYfkzYjBS3K2VI6ZheEJy5yVjfTZwhcq
         k4+qpSgPn2sbL0V7aaD45+UtRSQV9Vvrh6ztvmSLaFqB93IFVmusMmAWyZlwV8xhUlPi
         pA2Lo0lvh/I425JfuLzf+5+4mds1owaFJV1cbIYBWpz/LUbdROa3+PD6sz7BGZsXcX5y
         ZUx3zwOlHAkvtvxc5RopE1lrIP420vm8BJMH3NBUvQlvxnSoMQ4jZVWHKOKIEWjX/CPI
         ll/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwsaKZtRwax0+0lyuZFbFuJTS/ubLcG50Tnegt1PEeDX7UkkxEoyVk3oX1zDyOLg7SZ1VkD28wJWWJzQjg=@vger.kernel.org
X-Gm-Message-State: AFuF++mP+xk3lOddWIs+r0IxrhW+f87dz72ey4p9NVJH8gf5WaqWgoSC
	DTuOHB/7MsGd6EOfBa+8ps6idQrhCGGoTZND4a1aLjytzzTMSXOzqdnNeo41QOXbmZBdJWDXmpb
	6b5FOAA==
X-Received: from pjbkw10.prod.google.com ([2002:a17:90b:220a:b0:3a0:6d58:1c3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2fce:b0:3a0:3881:eabe
 with SMTP id 98e67ed59e1d1-3a07e4ee868mr2520155a91.5.1790178672821; Wed, 23
 Sep 2026 08:51:12 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 08:51:07 -0700
In-Reply-To: <20260923155108.1550622-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923155108.1550622-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923155108.1550622-3-seanjc@google.com>
Subject: [PATCH v2 2/3] KVM: SVM: Use "is AVIC-addressable" helper to sanity
 check load()/put()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Naveen N Rao <naveen@kernel.org>, Atish Patra <atishp@meta.com>
Content-Type: text/plain; charset="UTF-8"

Use avic_is_addressable_vcpu() instead of open coding a check on the bounds
of the allocated table for the sanity checks when loading/putting AVIC
state for a vCPU.  If KVM botches the allocation, then KVM will already
have performed an OOB write in avic_init_backing_page(), i.e. being super
paranoid in load()/put() doesn't provide meaningful protection in practice.

Cc: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 0e4b5eb6ac82..4173a30dfe60 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1049,8 +1049,7 @@ static void __avic_vcpu_load(struct kvm_vcpu *vcpu, int cpu,
 	if (WARN_ON(h_physical_id & ~AVIC_PHYSICAL_ID_ENTRY_HOST_PHYSICAL_ID_MASK))
 		return;
 
-	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >=
-			 PAGE_SIZE << avic_get_physical_id_table_order(vcpu->kvm)))
+	if (WARN_ON_ONCE(!avic_is_addressable_vcpu(vcpu)))
 		return;
 
 	/*
@@ -1112,8 +1111,7 @@ static void __avic_vcpu_put(struct kvm_vcpu *vcpu, enum avic_vcpu_action action)
 
 	lockdep_assert_preemption_disabled();
 
-	if (WARN_ON_ONCE(vcpu->vcpu_id * sizeof(entry) >=
-			 PAGE_SIZE << avic_get_physical_id_table_order(vcpu->kvm)))
+	if (WARN_ON_ONCE(!avic_is_addressable_vcpu(vcpu)))
 		return;
 
 	/*
-- 
2.55.0.1082.g2b9226bbc0-goog

