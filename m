Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45052B1E1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057451; cv=none; b=ATHbmmkcexv07cJOxRG4HpMvdmpxQNK168fTbpcllnmgc51dJWcW4uUQfUV6G+NUWavQEunp1mI3Dodfzx4XIbyaQKOslFdt6mz6JeeVyLpigIi7BB6w4rbHS4Dojqt4XzjUPSfLgi4nh4YKk1vcrw5d3PIJ+JTnvKQo0/h31pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057451; c=relaxed/simple;
	bh=AHvgtIL5obyEkQeMJj9TEFvDUyBEEuMsjvgCq4Ntp70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hivY6NK1hMAYwVByehCRF0GaQW4455H+UUwzFuqO1DZI0uLg3ciHs6GkCIXlEC7HHqb8+Il9DZ5j8tigi//RIWs++yTIefZgh+b94ZlWyIsH84dtC7Z707LesIPXa28kVdD8wEiCxc+dDQJikj/1fUISBkoDEFrhSj9YFsoaRj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z1fA3ekL; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z1fA3ekL"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4955e865174so16545e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057445; x=1789662245; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3WjqNYFOMqEwxR4wUCekRhwd9RX45J94sJ1enbo8buA=;
        b=Z1fA3ekLfjqyfjhKTE48Je3loqRDWXZcI308y5qa77KWwYaBmgbCxuADX2bqjm4q3r
         gTsuCQwhev5huXwKsNtyPFTTXxz5Ta+I4ZXSSBm6bbrccnyEharkhf8Kst05NmMacIIu
         5Q0dX/WtgQ9WcvNOg+MRawOcXkCDWDCGc7pqRkKw/BBOSV4EJoPttDz+gd5Bp2CWM6mT
         spe6S1/VgOhZirQc8u4lckEX6IuJR0u2YZbnQw2uoZdoUiCyPzcoBpFhipeTnytXEnnK
         lobL9ChhPIIVYwRMi8FqCq8UISzk8ckaGlvZUxVv3CicfFYDiIpBZDaPzBHxsaqZ9BOQ
         d/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057445; x=1789662245;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3WjqNYFOMqEwxR4wUCekRhwd9RX45J94sJ1enbo8buA=;
        b=Ra0Uv7rHC8IrpEAT9Gno0vDjt8JabRt8z6mDh+6v3znckU+PzUB8f+qirZghVZgli6
         wZoOPqpAtreAtuy+rPaOlhCXe7H370InMyRhcczK66noSQ2/CAyBDtqGhzIijMij7IEl
         93TpGSo+AMrG18ADPFLu7QHqf0YqNsNAzuEyd9hDAThzu2FcXUX7uvtKyws4+x4tBOmy
         7t+kP8MLdQIpC6syFFkxAWA+kTnQRvqX1/REqeIxzMXM8H/PEdisSrxuvyz1WMX/40Ur
         DhcPNDKVB3Jcm7V5Csyqa3gEo8ETEFVO1kMI6XfElMFX2PNg1CZrAIJhjyETr82oYGNC
         FdrA==
X-Forwarded-Encrypted: i=1; AKwUvBwhTx5chrLXfNNPKyPmezlZ7GqEiTSOmzEeA6A02uBFLyR1WQqDj4HEMZX+8Ra1WQVE5JiEB/7g7JA69lA=@vger.kernel.org
X-Gm-Message-State: AFuF++k211rLXs3Qa/dwD+xg35MIsQLCRI8Avq0t04eoCLwzWPH0r23i
	UQk0huGR1tvUHeGjVcJk51ZPZqYH8lXoS3AvWF7YCMIia2CpzUkM7M+le6JpIDQJZEn0Iil4IAh
	XbQ==
X-Received: from wmbb26.prod.google.com ([2002:a05:600c:589a:b0:49e:5ffd:edcc])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:5493:b0:49b:8f18:714a
 with SMTP id 5b1f17b1804b1-49cf824a6c5mr440314875e9.12.1789057444629; Thu, 10
 Sep 2026 09:24:04 -0700 (PDT)
Date: Thu, 10 Sep 2026 16:21:41 +0000
In-Reply-To: <20260910162343.4092060-1-elver@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260910162343.4092060-1-elver@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260910162343.4092060-9-elver@google.com>
Subject: [PATCH RFC 08/10] KVM: Add guarded_by to members in struct kvm
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add __guarded_by annotations to a subset of members in struct kvm where
the protecting locks reside in the same struct scope. Members protected
by locks across nested or parent struct boundaries are omitted due to C
lexical scoping limitations.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kvm_host.h | 12 ++++++------
 virt/kvm/eventfd.c       |  4 ++--
 virt/kvm/kvm_main.c      |  3 +++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 12f241304228..36edf0a59107 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -771,7 +771,7 @@ struct kvm {
 	/* The two memslot sets - active and inactive (per address space) */
 	struct kvm_memslots __memslots[KVM_MAX_NR_ADDRESS_SPACES][2];
 	/* The current active memslot set for each address space */
-	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES];
+	struct kvm_memslots __rcu *memslots[KVM_MAX_NR_ADDRESS_SPACES] __guarded_by(&srcu, &slots_lock, &slots_arch_lock);
 	struct xarray vcpu_array;
 	DECLARE_BITMAP(vcpu_ids, KVM_MAX_VCPU_IDS);
 	/*
@@ -787,7 +787,7 @@ struct kvm {
 
 	/* For management / invalidation of gfn_to_pfn_caches */
 	spinlock_t gpc_lock;
-	struct list_head gpc_list;
+	struct list_head gpc_list __guarded_by(&gpc_lock);
 
 	/*
 	 * created_vcpus is protected by kvm->lock, and is incremented
@@ -801,11 +801,11 @@ struct kvm {
 	int last_boosted_vcpu;
 	struct list_head vm_list;
 	struct mutex lock;
-	struct kvm_io_bus __rcu *buses[KVM_NR_BUSES];
+	struct kvm_io_bus __rcu *buses[KVM_NR_BUSES] __guarded_by(&srcu, &slots_lock);
 #ifdef CONFIG_HAVE_KVM_IRQCHIP
 	struct {
 		spinlock_t        lock;
-		struct list_head  items;
+		struct list_head  items __guarded_by(&lock);
 		/* resampler_list update side is protected by resampler_lock. */
 		struct list_head  resampler_list;
 		struct mutex      resampler_lock;
@@ -826,9 +826,9 @@ struct kvm {
 	/*
 	 * Update side is protected by irq_lock.
 	 */
-	struct kvm_irq_routing_table __rcu *irq_routing;
+	struct kvm_irq_routing_table __rcu *irq_routing __guarded_by(&irq_srcu, &irq_lock);
 
-	struct hlist_head irq_ack_notifier_list;
+	struct hlist_head irq_ack_notifier_list __guarded_by(&irq_srcu, &irq_lock);
 #endif
 
 	struct mmu_notifier mmu_notifier;
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 6701390336f6..6051fec5ec90 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -1046,8 +1046,8 @@ void
 kvm_eventfd_init(struct kvm *kvm)
 {
 #ifdef CONFIG_HAVE_KVM_IRQCHIP
-	spin_lock_init(&kvm->irqfds.lock);
-	INIT_LIST_HEAD(&kvm->irqfds.items);
+	scoped_guard(spinlock_init, &kvm->irqfds.lock)
+		INIT_LIST_HEAD(&kvm->irqfds.items);
 	INIT_LIST_HEAD(&kvm->irqfds.resampler_list);
 	mutex_init(&kvm->irqfds.resampler_lock);
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2f22d5439d39..871acc3aebbd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1111,6 +1111,7 @@ void __weak kvm_arch_create_vm_debugfs(struct kvm *kvm)
 /* Called only on cleanup and destruction paths when there are no users. */
 static inline struct kvm_io_bus *kvm_get_bus_for_destruction(struct kvm *kvm,
 							     enum kvm_bus idx)
+	__context_unsafe(/* destruction */)
 {
 	return rcu_dereference_protected(kvm->buses[idx],
 					 !refcount_read(&kvm->users_count));
@@ -1120,6 +1121,7 @@ static int kvm_enable_virtualization(void);
 static void kvm_disable_virtualization(void);
 
 static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
+	__context_unsafe(/* constructor */)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
 	struct kvm_memslots *slots;
@@ -1276,6 +1278,7 @@ static void kvm_destroy_devices(struct kvm *kvm)
 }
 
 static void kvm_destroy_vm(struct kvm *kvm)
+	__context_unsafe(/* destructor */)
 {
 	int i;
 	struct mm_struct *mm = kvm->mm;
-- 
2.55.0.1003.g10538fe699-goog

