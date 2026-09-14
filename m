Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36B449B5CC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409558; cv=none; b=q/M8bs6R8pG9KzvkXjyTQUETzUNsqNsM5F8ZAAnYZljHE8Tk6qmzB8Bv4SVXZCgBwl/JiGVpuSMWBNusYul9OK+qNMlxAED23BZiFPXQg2saN9aN2lFMGP95aUlRHXmEW1vsabo6igAgs/HrlDrupOyqj23fqV3BznQIBPRGpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409558; c=relaxed/simple;
	bh=dJrvpB5i1rMlVAI+qV3aDnzI33qsio45lawj5JfEjHs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lRVRavCBtGrKZnL1RpSiX8x4P2O0q+Ea1E2/B7ECJ1U4dOP7EZ0AGpzquu8/mjmK/BwRo6C1O2OcBgSuCWdv6gAeuUxm7JTaYPiqO+YSJrJqgi2sdBBJEqZ7eOvvnpvFZ8tYL9TE3Yu160523v2gMj9cGKCo4e3Fzxh0ZUYDNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ll3QclfO; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ll3QclfO"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so5761868a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789409552; x=1790014352; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eILuU/ujF/gCxOipJ6aAt7TsmD8PW8XQkQA4cx27AIY=;
        b=ll3QclfObzQf89D5n0MifPRcHjYAPY8zYA1imWEzyXbIBgBF73qzGNuQny0cTx/z9V
         gJtZLdKJCLQYt9JykqMC7qt/3HYW0YBl2DYyYSB5JmdukUz026bZpY95atFn75EsV2KF
         CbUO8svIDspuK4reDoj0cNUd6EncsHvvBFKxKa+eJhyNS5aQ8Zs8wxE0+Uo+w5xiQPDe
         0s/KJKd1Ht+XUeR8xo0IZGesiy3P9gRw5G+YnG6p8B5y9JRsap2+XLKJ+jhJ+XoXr9dj
         q0in9xGGsDXmqEhjP97w9vlPXv0VQJ07dMXk0ai0/pUncWstt1n59I8tYZYyd55WJuXU
         hUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409552; x=1790014352;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eILuU/ujF/gCxOipJ6aAt7TsmD8PW8XQkQA4cx27AIY=;
        b=J148Tzdyvn9YVSoZyBDeC+5EoIraU74LExGN2KsnfdcEKyZpUV2xbA89fVdK2Mz6Bg
         h3FLRgb1t/xKf2vJCoKdxI2G05Yi1PuLjd6kQu47t708jqpTVblH58JScLTOYEzyKRu8
         lhL6JbaxqbBU4onKSFoi52v52ci0Iite68Y9fBZHxZYJ2KlVH0CqrmI8dH7EXF4roltF
         15njVn627E9RDv59togFCYY6iNqxwx2nK63roqRpOlM3hVpJfmI+j4dIkEovAJzpwGzo
         VNQRK5sXhXe15/zax15+IpsZB7PN3GCNblHI1hHwpYckhxFHYJvxeoxZDLx3PJ3VJ8L0
         I6jA==
X-Forwarded-Encrypted: i=1; AKwUvBzCWuco+3/FDd8n6Z1J6UUfZrvYHgGQ4VaSo/kHHH5KhaDS5RRYF9cS6F3vxjvE5pcPpA4Qf3HG3R1bOak=@vger.kernel.org
X-Gm-Message-State: AFuF++liV9BEsSHp/6To69mVToo3O4EBDwsnBmp+665xrZkZFzqpZpIs
	+Ugn8bDwUL9mB7E6nFPTH7hIFZkG3DLmpYJniDUZvpz4lMRMCXwNvcSYbhHC9TbpkvG0Z6LBCm7
	cSmH85g==
X-Received: from pjso8.prod.google.com ([2002:a17:90a:c088:b0:398:ba84:67d7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17c8:b0:396:65dd:4093
 with SMTP id 98e67ed59e1d1-39dec04f9d9mr6872853a91.14.1789409550513; Mon, 14
 Sep 2026 11:12:30 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 14 Sep 2026 11:12:23 -0700
In-Reply-To: <20260914181223.289061-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260914181223.289061-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260914181223.289061-6-seanjc@google.com>
Subject: [PATCH 5/5] KVM: WARN if vCPU creation is in-progress when locking
 all vCPUs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Now that KVM holds kvm->lock for the entirety of vCPU creation, from when
created_vcpus is incremented until the new vCPU is fully onlined, WARN if
the impossible happens and KVM somehow sees a discrepancy between the
number of vCPUs "created" and "onlined".

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 985af39b980a..e66d9761ee49 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1363,7 +1363,7 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
+	if (WARN_ON_ONCE(kvm_is_vcpu_creation_in_progress(kvm)))
 		return -EBUSY;
 
 	kvm_for_each_vcpu(i, vcpu, kvm)
@@ -1389,7 +1389,7 @@ int kvm_lock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
+	if (WARN_ON_ONCE(kvm_is_vcpu_creation_in_progress(kvm)))
 		return -EBUSY;
 
 	kvm_for_each_vcpu(i, vcpu, kvm) {
-- 
2.55.0.1032.g73a4cd73de-goog

