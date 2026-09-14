Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F669493D24
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789409552; cv=none; b=soYNkfvoXSQgIvKY4mC/4QxnZFcTAVXfEG+c1lIieGCfLO99xYZBdouOgLLH2lEr5bK6OUKtpvs3y1q5FZljpZPZFnT8ZBOzPgTctPMMPeakWQfRPS//s7gWBTDbcJOgGNTihyjetD0je8LgG0nyLOohFo+3DxtQEyvDD7AuY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789409552; c=relaxed/simple;
	bh=H4sD9NLhYyNcdEysJoW8KxDlT7mpxdzkkXtdPUFPlqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hFLkbksnXhE/edpgqX1FBCNhs7ImjyPJzaSJ3mE782QggS8YF57IWNdmubudmnW/Avkv6M6U5rYeDAfNnIf2UJ4L2gDe772OdUEy+4kSIOEdBKD7EPYr6ek04HEAKfFqfGCMIRyZ5CQdLq0dV85EXOIEYtQpSaMk4/zvAIPQXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fcmS4yQk; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fcmS4yQk"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4e0dd08f4so2420010a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789409546; x=1790014346; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rGmw5H8u8SeMzlWekJA+yxf9/caHSlRymD+gvDgsKlA=;
        b=fcmS4yQknnbr4ayLfd2G0p9/fSw1Lb9tk4COVJz0L7sGngUKHgtM7I07jqpY4pP7sJ
         DkAbVeNVSJQuEuSKLiE3Z/jDgUcc9A8BYzqvvsr/lNTZsnADDyRMu8u34h/u6INd30LR
         gM4we7lPn7XpYoVNMfEwvyRLKEXjv7jC+s4s9b7kmvJgtO3FCsFYvJPwoQdX+jZ2BWka
         psUB4tYT+M8sdJ0lyAnY3eu84ADL++WZJMshV3MQtNgGRC53+v3XvjqYaiQ5IGFgbUo9
         ud+ZIhY24HbeEuAJ65Nmz07f55FSPwyRA1RyAPw/fOXJT9tPm6rD2pP5VwW5MpzpjsHs
         Z+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789409546; x=1790014346;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGmw5H8u8SeMzlWekJA+yxf9/caHSlRymD+gvDgsKlA=;
        b=n3drkDSkVLlJek5NEjLBDQB5gJD+EgwGfDAIeWE4aV42fyQ2U06azb3Xn/oSEB0h4V
         F8AHxqttyC7MwxvmA6+J8Bvdu1rskoxmzGXuAZ00d5CksogW7KfcpFM/tcZapsY4Vb3h
         5BD0KascIVcQHhC0+sH2gbJWhJg/ZHSemh6ki1vYngrjCvXu7sksrCFMSDku7fMnYu7E
         26bVzxRBXIs+u+kuronbVfhNg8OeWgD6eakxRDCs8hE78UFCky70/Oa3L4+t5BgZQi7Z
         aGxD0tL+Q2jYJRAaRl/rnDY+dpF/J7GmkimbgjzL/CX5XEE+7IIQENzd+McW0YMfxcY5
         tCIQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7jTu2FdwqCwKbWq3RcIU2WFufwWCqD8ciIorwxNUgCVwozVki7+O+an/cV4KcVUfH0C3tQ9tNLuIZNCs=@vger.kernel.org
X-Gm-Message-State: AFuF++kz5XnuHEBsV8jFl8KP3lh7io/NQjiTsgA23+vwk45TwWondqfp
	3np+pUfNw50KlNkRBTzRNV4jV5bU1ykwI5pQPfvIZ7MscB9Mn7e8CV2Y0CBHii7eFzX4GDmO8pH
	Xt71YxA==
X-Received: from plbkn11.prod.google.com ([2002:a17:903:78b:b0:2dd:54fd:8640])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b10:b0:39d:e54c:a28a
 with SMTP id 98e67ed59e1d1-39debf9b35dmr6973791a91.8.1789409545861; Mon, 14
 Sep 2026 11:12:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 14 Sep 2026 11:12:19 -0700
In-Reply-To: <20260914181223.289061-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260914181223.289061-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
Message-ID: <20260914181223.289061-2-seanjc@google.com>
Subject: [PATCH 1/5] KVM: Reject attempts to lock all vCPUs if vCPU creation
 is in-progress
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, 
	"=?UTF-8?q?Pawe=C5=82=20S?=" <spawel523@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Reject locking of all vCPUs if vCPU creation is in-progress, i.e. if the
number of "created" vCPUs doesn't match the number of "onlined" vCPUs.
It's simply not possible to guarantee that KVM has truly locked all vCPUs
if one or more vCPUs are actively being created.  Holding kvm->lock does
prevent in-flight vCPUs from being fully onlined, but it's infeasible for
common KVM to know whether or not that provides sufficient protection.

In practice, this is likely a minor bug fix for the ARM and RISC-V usage of
kvm_trylock_all_vcpus(), and a glorified nop for everything else.  E.g.
ARM's kvm_timer_vcpu_init() can race kvm_vm_ioctl_set_counter_offset() with
respect to observing KVM_ARCH_FLAG_VM_COUNTER_OFFSET.

Opportunistically drop all existing manual checks on vCPU creation being
in-progress as all such checks immediately precede or follow locking of all
vCPUs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 10 ----------
 arch/x86/kvm/vmx/tdx.c |  5 -----
 virt/kvm/kvm_main.c    |  6 ++++++
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 5705723f1f41..068f8a236a35 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -1125,9 +1125,6 @@ static int sev_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	if (!sev_es_guest(kvm))
 		return -ENOTTY;
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
-		return -EBUSY;
-
 	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		return ret;
@@ -2115,10 +2112,6 @@ static int sev_check_source_vcpus(struct kvm *dst, struct kvm *src)
 	struct kvm_vcpu *src_vcpu;
 	unsigned long i;
 
-	if (kvm_is_vcpu_creation_in_progress(src) ||
-	    kvm_is_vcpu_creation_in_progress(dst))
-		return -EBUSY;
-
 	if (!sev_es_guest(src))
 		return 0;
 
@@ -2510,9 +2503,6 @@ static int snp_launch_update_vmsa(struct kvm *kvm, struct kvm_sev_cmd *argp)
 	unsigned long i;
 	int ret;
 
-	if (kvm_is_vcpu_creation_in_progress(kvm))
-		return -EBUSY;
-
 	ret = kvm_lock_all_vcpus(kvm);
 	if (ret)
 		return ret;
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index b272c20586a7..58c255256e4c 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2728,11 +2728,6 @@ static tdx_vm_state_guard_t tdx_acquire_vm_state_locks(struct kvm *kvm)
 
 	mutex_lock(&kvm->lock);
 
-	if (kvm->created_vcpus != atomic_read(&kvm->online_vcpus)) {
-		r = -EBUSY;
-		goto out_err;
-	}
-
 	r = kvm_lock_all_vcpus(kvm);
 	if (r)
 		goto out_err;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a0520d..78cc090435be 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1363,6 +1363,9 @@ int kvm_trylock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
+	if (kvm_is_vcpu_creation_in_progress(kvm))
+		return -EBUSY;
+
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		if (!mutex_trylock_nest_lock(&vcpu->mutex, &kvm->lock))
 			goto out_unlock;
@@ -1386,6 +1389,9 @@ int kvm_lock_all_vcpus(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->lock);
 
+	if (kvm_is_vcpu_creation_in_progress(kvm))
+		return -EBUSY;
+
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		r = mutex_lock_killable_nest_lock(&vcpu->mutex, &kvm->lock);
 		if (r)
-- 
2.55.0.1032.g73a4cd73de-goog

