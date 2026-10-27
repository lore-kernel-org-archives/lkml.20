Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139139;
	b=CSKHV65fyhVKwwJEokQGk9MFoBJD/7TyFx9BcGw1lRVElcDIywdktnIBg082qceuACO1
	 O4i9QYAn3MTebjMkAYWGzVqQZcRbjplRiqRYctEFhQ+meKs33vTrpX7Af3BAwwpvSWS+H
	 xuhdPlQtOrWk1OGguyP2lIZpJmYW65xOrBF7on2dCDyOnorUlOltr+ucHZRzLFcKqFbZk
	 uj7QkISkxNOLD276I8r/ZkO9kX2Gn+bbIpjEJdZnsaBECzgq1B6t/DgBMcBRsleQsg4TP
	 uEBa5ISjQT2xYf/u4idKPm1FE08d5z5N3evkDkJ98Rk9SSz5+IzWIIeIQ66c9Bvrbow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=Na27bDyEPgeDt12EX7VPW4wAyW1QKigeaVHb8mXSq+Y=;
	b=qnTnYzUoDPAfI8d/J06clpzhMQ7iibmWs4m2FUah/nXqry92WsAEzRNc8eEYy8SifmPJ
	 xMDo/nf4jqtnt5bFXaq0Yayuctp1EXb4dfQCLJGyeiFxw/TgKtxRFzHqSC3n+hbo5CBh+
	 CzxkUqOz56pzN8rf477FkbL6OEEA4UVTrWXTU8cAltWRjov1cyaMZl9C+++ZypztmJSL/
	 8sK06v42UWZWpSqaV+0WxWRdiPaqgAS9GJUEonF4eAKuu/qu7mLSI7rt39lNl8Py++Vjz
	 I8MHkMFpbl5lWDYcdOVpS0ZyKoLOC/CExo2/kDcK8i4xSHaq2u/l3mS8zdB2I2OjeMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cnDLvqpv;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DABB606A325
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DABB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cnDLvqpv
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a05c820ecbso525373b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139139; x=1793743939; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Na27bDyEPgeDt12EX7VPW4wAyW1QKigeaVHb8mXSq+Y=;
        b=cnDLvqpv2AlFcGcf+yETDVXeNTcHAyIafdS8hNDvkzqW7nwtZpQ//j85DRGLJMLhPv
         XUbiDZJe12lhy90pzYyJ0n27Oaf5mzbdzW0Iwboy0Jc53IjgYgtUWm1oq17uEC13rI0O
         MGFbsm6V7xH7BwIhhC5ZPaeL7TM6SkT9Ta3Z2eDu90isOYxfXRKtHRvDV/WsbjJNwde0
         Hfz6CvdPKhqpPL9KpsCh/IRrR/pbIuNIWpck+G5rn3vUfCl16inP0V0Tj2+lAfgENhhe
         YOFlGzvZDUuwSNrAKTquuciiuLvk7jOIsdP+pZD+od+DoV1Ehlc/BAiqCl8s6DqRPOtf
         ZVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139139; x=1793743939;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Na27bDyEPgeDt12EX7VPW4wAyW1QKigeaVHb8mXSq+Y=;
        b=1X4B1ZpwS/FynImSoGS5pqdaITRAtu0QEREKUJiIwPAytapNSr3vtocEl+H2yEBmP7
         eGKlZEZ2qNBeWNCVI/p2anLI7hN6l5mI/2YL5tEbQPUYBc49ScIOzxMHtLzltANKik+u
         Ai1f7SxEc0RZk0e6tAqAhgncOCfPJy8rvVumMAaKSPhxCjgDkngM0faBd3CG4KRnPCVx
         dK8smf4Q1VXrH5oLbNYAtDJ/rSF5J1aaJkeLNbmnisyyaYobabgZyQMQycO/jXyqzmsJ
         WAHBvvWqTUi9Pa4lxs6wxLlsbRpUCsPYasmpWTIjZryFTMAKKliDqpcbQzwYvaNhplUA
         GIQg==
X-Forwarded-Encrypted: i=1; AKwUvBxxYGkpETzf/t8aCkb+P7s7c6w6u99mrX1ta05M26ByH4jCweWkMEPkL7LciB27S3dzrunkq2bI4ZD2HlQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJGxpujbXAGkc39ZW4/8VzfE4PUvP+6ylhYdCnDfmNcCWI9Ul8Q
	k3Iav37MKGgJ4Xdh92zJdtWpLph476dU1mGXAZUAjeG8Jn3bqYmu5HLbGQTEYFfdNLKCW804JQ+
	uAZNMOQ==
X-Received: from pgbcq7.prod.google.com ([2002:a05:6a02:4087:b0:cd5:f7a5:5490])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d48f:b0:3e2:4350:1527
 with SMTP id adf61e73a8af0-3e90232b765mr412509637.24.1793139138551; Tue, 27
 Oct 2026 15:12:18 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:11:59 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-7-seanjc@google.com>
Subject: [PATCH v3 06/15] KVM: Destroy memslots immediately after
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
index e7c89861632a..1058b864d427 100644
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
2.56.0.307.g5fe7bd680c-goog

