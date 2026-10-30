Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395289;
	b=Otq7nzPJ8o6pUTpzfzwYjtWgfu5ZuJsJ396A0Qv37x2rYxLyPjEil6foEMOKKtHd0KxD
	 Mna01yUhdMYab+k5fEJ/RHoueybhpcfK3ihiUH3PGdKdIEG3ZhB6vMCz3mIQESdpasIxv
	 LNvL4S84wpPOQW04K6FOpL3DCPizE49XOndyWn/UNkjIdkeTHDOt1bP/zrtp2X3c27F7k
	 +gqYZiJ16zlh3id2/t5EDW1DAzaoqOrHjmRlaDwmzCrYw3Wv0kW8rL9RakMss/NNPiFgT
	 SG4c/u3Zvsf6/ftzBUTnjo8r+E8xCgDSoKav+8+ck0UNnihmKJV0pzLCFdzy8dnJTYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=RcX2YZRJWHg2bC94YnzCHmgguqsUuMXALdhLJOO1CSU=;
	b=2as9Sak8gXRh2Mot0h8JbjAAfhqA1nqzYRmhnC2FLueNMCiw+AO6/o32opclzki9AkMh
	 8LtqNRO6VYWVqUArFQZY4DOefNMKC+6rQEw7VUGFA9VJJna/PG9Nen+O38MgcoMCekVMT
	 wtDeDJLY9j/unCRANRJFnm30x2NxJwq/htPyw8z5CUbB2pAjWAJMSrK8B9NB2c5XemqpF
	 fub2drqwvrZ/EsGUDNP5OVatvAHsRdDC33SEO8ljrqqURTuhYgJPIXBuTrTrWuZFm5Q8J
	 5JcydD3euys+V8SEcAsBbmj3qSZGDn1932FxWBGg8vOlI5Xmjqcf4PLbCPe9RvOU8WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3SqJh5H;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DF1606C319
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1DF1606C319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o3SqJh5H
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e954d87b48so18522085ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395288; x=1794000088; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RcX2YZRJWHg2bC94YnzCHmgguqsUuMXALdhLJOO1CSU=;
        b=o3SqJh5Hj0Oct0vOoPUFXVsVMU3yye10P9R91YGVOyvMkxcAzuSMT4IK8Ui+bOYkL5
         MoLjf5r01aYWMjShUBCeFCECcxaSGb8xAjCaEVomZVeEVcdHla0zZVF/AMLPJRHb9ONt
         SS2s6iIAznd/vthvXVGTVXKidB1ek5aUSvqEUF0K2jBcxjSXeeknzYCOB2wTHXBOkYje
         +ouxxhGXK8HUaqEbBWQkDMdOuwuxOIV0Oo4WYhBU/r82BhIzCpamhYCeINS26Sl01Ncv
         L1yjKv0JrmZfaK0JPkkh7bnxU9wA9Y/LyRBEcxyeTdEV//gyRBrwPpHXtSP1pN4gzyJH
         q0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395288; x=1794000088;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcX2YZRJWHg2bC94YnzCHmgguqsUuMXALdhLJOO1CSU=;
        b=cm50bpLSkrsOhnEKSfVCbBczjcOptrgG2nC7pHx2SSbGPwFbuYDDlEkFAT06cL6JXO
         j6JecY6+SdFLDCIJ8a4/tTotaqkYLeEpm/jfq48hCqlfuymUcjjtPco5tlAI+I/8wEsr
         RiMv7aRW0/g3HAJtBW9ZE7X7GCIR5mKGGvEZUXPKvmeRGo0wvSe1DB3Nl1eRuWTrtJdI
         BfOAMNi58N/HyDAXcGAJ1xgPjq6ZIjPS6upWIzTJfQp53qkpEiiY9KKWKZOiCrngv6Pw
         nnDuU9iOCSTqqtk9UVp2DprJzHugIPQZOneJBEX6BPjMNzS4tj0h34OPRM00ChjixTG+
         3x8g==
X-Forwarded-Encrypted: i=1; AKwUvBwCD01D8jkywPYjELsAN4kts3VrVfZhaiTYu7VPTk9NGlkjSpY49YySBZDP/uV1mM4BzstVMEHdVqZBWNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLP2ewP+8F+Qe1cn5lJKkU7IxVFpQwQ1Ja1XUa+9o8YuisrAEkf
	BedkgwL8kUAZao2YdpTSwUJ/5XMbb5yymp/iakrCxuOVJzCE/W57x/LaiZHY6z9Nrqkb9g+4I4E
	IcaRPnA==
X-Received: from plbkn5.prod.google.com ([2002:a17:903:785:b0:2e9:6e08:e249])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a30:b0:2e3:598:75b8
 with SMTP id d9443c01a7336-2eb364b0dc1mr36320905ad.27.1793395288251; Fri, 30
 Oct 2026 14:21:28 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:00 -0700
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
Message-ID: <20261030212112.2598640-13-seanjc@google.com>
Subject: [PATCH v4 12/23] KVM: Destroy memslots immediately after
 mmu_notifiers are unregistered
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Instally dummy, empty memslots immediately after unregistering KVM's
mmu_notifier during VM destruction to harden against accessing memory from
the wrong address space when tearing down a VM.  Because kvm_destroy_vm()
often runs when the associated VM's file is being released, current->mm is
often no longer kvm->mm, i.e. using the memslots to access userspace memory
is inherently broken/dangerous.

While KVM's APIs to read/write guest memory explicitly reject accesses if
current->mm != kvm->mm, taking away the memslots adds another layer of
defense and helps guard against rogue accesses that don't go through KVM's
standard API, or that do GUP+kmap().

Note, simply hoisting memslot destruction above kvm_arch_destroy_vm()
without installing dummy slots is not a viable alternative.  Doing so would
require auditing all the paths of kvm_arch_destroy_vm(), which is nearly
infeasible, and missing even one case would result in a NULL pointer
dereference and/or use-after-free, neither of which is a substantially
better outcome than the status quo.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index fa548b12228f..2eda12a52bf4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -963,23 +963,42 @@ static void kvm_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
 	kfree(slot);
 }
 
-static void kvm_free_memslots(struct kvm *kvm, struct kvm_memslots *slots)
+static const struct kvm_memslots kvm_empty_memslots = {
+	.generation = -1ull,
+	.hva_tree = RB_ROOT_CACHED,
+	.gfn_tree = RB_ROOT,
+	.id_hash[0 ... (ARRAY_SIZE(kvm_empty_memslots.id_hash) - 1)] = HLIST_HEAD_INIT,
+	.node_idx = 0,
+};
+
+static void kvm_destroy_memslots(struct kvm *kvm)
 {
 	struct hlist_node *idnode;
 	struct kvm_memory_slot *memslot;
-	int bkt;
+	int bkt, i;
+
+	/*
+	 * Install empty memslots to guard against memslot lookups while the VM
+	 * is being destroyed.  Consuming memslots at this stage is a KVM bug,
+	 * but "gracefully do nothing" is a much better outcome than "crash the
+	 * host" or "corrupt random memory" when there inevitably is a bug.
+	 */
+	mutex_lock(&kvm->slots_lock);
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++)
+		rcu_assign_pointer(kvm->memslots[i], &kvm_empty_memslots);
+
+	synchronize_srcu_expedited(&kvm->srcu);
+	mutex_unlock(&kvm->slots_lock);
 
 	/*
 	 * The same memslot objects live in both active and inactive sets,
-	 * arbitrarily free using index '1' so the second invocation of this
-	 * function isn't operating over a structure with dangling pointers
-	 * (even though this function isn't actually touching them).
+	 * arbitrarily free using index '1'.
 	 */
-	if (!slots->node_idx)
-		return;
-
-	hash_for_each_safe(slots->id_hash, bkt, idnode, memslot, id_node[1])
-		kvm_free_memslot(kvm, memslot);
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
+		hash_for_each_safe(kvm->__memslots[i][1].id_hash, bkt, idnode,
+				   memslot, id_node[1])
+			kvm_free_memslot(kvm, memslot);
+	}
 }
 
 static umode_t kvm_stats_debugfs_mode(const struct kvm_stats_desc *desc)
@@ -1310,12 +1329,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
 		kvm->mn_active_invalidate_count = 0;
 	else
 		WARN_ON(kvm->mmu_invalidate_in_progress);
+	kvm_destroy_memslots(kvm);
+
 	kvm_arch_destroy_vm(kvm);
 	kvm_destroy_devices(kvm);
-	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
-		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
-		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
-	}
 	cleanup_srcu_struct(&kvm->irq_srcu);
 	srcu_barrier(&kvm->srcu);
 	cleanup_srcu_struct(&kvm->srcu);
-- 
2.56.0.385.gac671c819a-goog

