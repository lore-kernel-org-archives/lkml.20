Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2635F5452A1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181461; cv=none; b=u0fC8xgUuQ2hj4AKEoDJTwZlA7HidA43UOHsXXKTrLtnncFJqhS0jE09pZdDgps3INvZMhplHiLR05XSHnar76XaSYg835hJDPCFwOqzRnKvl0129LS23KRhF42WkAolQkkZ2enEzc2aViPkDs0Ndi5O2fcc5hz/L7eHRhF9q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181461; c=relaxed/simple;
	bh=l92mD18fSNLpCYLPJHZVS7PRAzNZbkw6femw0wFQAng=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aOkYe2GoN47qgAdM5KLdHtHqCyJbcK02rRJQrvkXfRsV8wHDKBCEkZj7yx3hHORjGrKV5QHquf7hw7mXWP1Z3B4K2lcSynwkFRJzlwOrBQsFv8rDRkUa1ohaVVLeGtO6T0cHgEeXzOZKUbyG2qD6fbOJDpUkqmBmxADIz1l6t3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uGr7pXIR; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uGr7pXIR"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso1470075a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790181444; x=1790786244; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v5iTeCVol8w3KZ0quMKIDJmrpriPxbZxm1zt2zphWwM=;
        b=uGr7pXIRFdfOJItuORNDDu6f2P2uq5O8UBqu7ssI4c6uVmH0WJ96/NN7HJpjm5lkW8
         4bS1z9IX0ztoPu+BbCQh3O91td/U//XAvZzVs3Rq2B0KHqXZ+v62XnQ8RHP6kfxPmnHO
         UjrdBbQifKYO3gElk2X9yx+8w/N7B1ykc7GpUzXpeF170CqOjl3Kr6pqddou3bkbssIZ
         OxBXPruEi7abJNKSQFBSxoVGuhsZqz9vbGKdjeuV4RN4Yzb1+Kn5SqF4I8VlzHErFR7a
         XScZBJU3k9YI/FCK7+iIm6XAFZMmwGZtzZ79bSHa4ArH0e057fUUmIhQgYWlp140xuUC
         HD8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181444; x=1790786244;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5iTeCVol8w3KZ0quMKIDJmrpriPxbZxm1zt2zphWwM=;
        b=OK7D190qbaMTirnjdBbzT1Mto/VYi2zLtCLb4ZFdYMyq4sjEoFfwb19pUi4V6mZ1jw
         ec+jSie8NTBX8gxofr/qXa+j2JRNpPtHO5/F2MGvdniKi1yUMg88aIIjde565KojUW3F
         mmMTgO5xJ8Wm0n3bsrZiB2ptbnhrkZnAOIjOA9cpPtrKrb3yj1IZGAF4dzy40w5T2CO2
         Jrowt4EALpesjuG2VbswS08oCooNZcCh/jchMCKNjCYqdNhIdLkUmiv+Pjj0GEtI5iuG
         r8Uxcu55LmYTI0tLbwwh1HxZWLZn2Jktz4jYrC0rvY+XJt5uHY/JIkKMSNfDlYOLU/s8
         MHGw==
X-Forwarded-Encrypted: i=1; AKwUvBwH+7Y5NOa0LctmLuablsa+JF7XVAMpo7LFlZ38zTTOX6FakSwZe96LarUaWEt7U8IZZYCLmPMdXtiY2Hs=@vger.kernel.org
X-Gm-Message-State: AFuF++n2tDM4Z0ikGUrpK0Ic7+km+ynYQDd126H7YgAL3+Vl2aCmPG6b
	KZTJFseCdM2zbqUjYKLw7A6nIoxaO/gNPrTbHoJJ/653ghLiUT7Jc7ybeQc2IlQGdsGGnrbc0xy
	knSEL4Q==
X-Received: from pjtl23.prod.google.com ([2002:a17:90a:c597:b0:39d:c134:415])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d92:b0:39e:6a7e:ee1b
 with SMTP id 98e67ed59e1d1-3a07e654dacmr2590578a91.39.1790181443894; Wed, 23
 Sep 2026 09:37:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 23 Sep 2026 09:37:20 -0700
In-Reply-To: <20260923163721.1584779-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260923163721.1584779-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260923163721.1584779-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: SEV: Free have_run_cpus during VM destruction even
 if VM is no longer SEV
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Unconditionally free SEV's "have run CPUs" cpumask in the VM destroy path,
i.e. even for what appear to be non-SEV VMs, as an SEV VM becomes a non-SEV
VM if its state is intra-host migrated.  Alternatively, the mask could be
freed in sev_migrate_from() when "converting" the source VM, but that gets
annoying because ideally KVM would nullify the mask to guard against UAF,
and nullifying the mask would need be conditioned on CPUMASK_OFFSTACK=y.

Freeing the mask during sev_migrate_from() is also not robust against other
KVM bugs, though that's kind of a moot point since any such bugs would show
up even if sev->active is never set.  I.e. KVM must get that side of things
correct.  But, that's not a great reason to add more code just to make
things marginally less robust.

Fixes: 6f38f8c57464 ("KVM: SVM: Flush cache only on CPUs running SEV guest")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 63e8cfa9bf55..c9242c936a40 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -2981,13 +2981,17 @@ void sev_vm_destroy(struct kvm *kvm)
 	struct list_head *head = &sev->regions_list;
 	struct list_head *pos, *q;
 
+	/*
+	 * Free the mask even if the VM is not *currently* an SEV VM, as it may
+	 * have been an SEV VM prior to intra-host migration.
+	 */
+	free_cpumask_var(sev->have_run_cpus);
+
 	if (!sev_guest(kvm))
 		return;
 
 	WARN_ON(!list_empty(&sev->mirror_vms));
 
-	free_cpumask_var(sev->have_run_cpus);
-
 	/*
 	 * If this is a mirror VM, remove it from the owner's list of a mirrors
 	 * and skip ASID cleanup (the ASID is tied to the lifetime of the owner).
-- 
2.55.0.1082.g2b9226bbc0-goog

