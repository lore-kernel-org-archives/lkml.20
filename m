Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECB37F8AF
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 07:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356487; cv=none; b=pjxgN1kZuoGZdx/H+hs+9H0Rt7F4HDzDZ5lj8BBY1tiXNbfU3k+EG1PcPsE5tNkZxl7AsemG5nfKoUSRl/eSrzsvOPesv+RHVgwtH3cYJ29MX5jvO0bXqc3Y0UAU3Ao5ABX56W3fcifqu3G0eBg8ntBnAa9kj+TjHZQ8+o0kZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356487; c=relaxed/simple;
	bh=BT7supmi8j9/4xEhUciiGtS2UwrxU0jcs8ZSppgVUFA=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=QvNpqOla/jO02+E4qitw0KdGZizAUqCaYoxJrZ0Juc8UjkHST8ayLy7LKKYGJKTopsKfW0w8U87HL4XfWeCguzEjN8AR1+At/0yVWnVdlCBzmLaloIGzCKiQaACg4Bej31ysA/+cr1jdtkO3AyZdglpONHiESmZQtBnF40LJ49I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwM8A/dw; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwM8A/dw"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so10597142eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791356486; x=1791961286; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oLpEQSu57uD4VcTdj38WGaIEWGG6OR3d21k199k1TPg=;
        b=pwM8A/dwgJhMm4QxF7YIeQ6cl8RDllW475VeJonwTjGNEpDmZDVw1JWServ6jdFFgZ
         ijnZ/cXrNeo22OygLf7we/eMqGfpYPSu35gx6p3qt9OyUVpjTC6QnVUKWjsNm9fJSbEh
         XCDzUUx6FGSjaSJ7jIruoO9BPDh6CIoVS7UqNnjsQX4zgMZ5mVU4VE0Ji+OST55IFQZC
         yoBprxG+OkQJzBtyneBwmdLuyTnFTnKhOgWgzfLMgd9+6J4V1l1RhkQ71QSCjdyE6cQW
         YnWDYimfAFu9II1UzPcbOJ+1ff/gs0CBf0M6TQ/3BGIdMH5ig0j00PqROV2kTgvSnRHR
         jzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356486; x=1791961286;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLpEQSu57uD4VcTdj38WGaIEWGG6OR3d21k199k1TPg=;
        b=dLThJqBOOnkOV7LY6TmHmn+RKgQkCqMtbfgoty64vuWNZUQBqF8ktHP3tNc1fvr2t7
         aIt627IokyguFkgGsDzidyVZwxWuaJDY+6Z6TT3NdXDkwWG4iLNV+7o2ftvD1NXFwNMC
         5Ct7odGNSWeIiLjiRkisRm36+nRa/9bcn+fgwFvVgkUjlO5e3S7Dgni40Vfx87bXUjiW
         6+VhVJ+fEqm8H+VOIP1Sg0C/LZExteohkgnAVM4zY/DCWFHtLU/m3hER6/CVjROdNyUQ
         DV9kcBd+WBUk735FnSmyVzpYTXBf2rtWmGvSdehqcZkmXkGbWpZ4nnhvA+NeZa9mrKJ1
         gC9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzf6VQvlt85Js5Uhx3l5JRUYweVy++nLWpy2KjZ1v4IHAHGMIgeNMRkboip8HgwKPcplyGwYR2Q6mVVGRE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKliWVOLt4MjjozRwNzP/UGGfWV+jqGhXJnyV7ts1fG+nMMEylT
	MS4JIYtaMV8q+4SlC/qasmxJLH1J/Int8exd4JeqsVcKSH5n+gZx4sDE
X-Gm-Gg: AYBFou1TIhc0SIHMYI5zkFNZcSdDr/stA0A7DQDU6cTX7MkhWU0SF+U+fYP2PtU+PwB
	5T+pnErtZRr39hmtCQNz1Uv2O6bH1OFj9dV47SVBA3jVt107PgtcpLaduzKJ5JodKoNOusKS/OR
	c0O8+FOxdZVIGDP9MSl1EgxQY+dByjh0aUyi2F+PNaSeLtAvo4xrVEOqdnXvHqruPIBJCY1lkII
	5kq8ut0Z6yVyef1/LXhovmxYTI5psf7SokX+fVhZ4xzEB+sQYTc0+gh5g1JHxigi1OMAhJyxqQS
	1g4wzJ1QshZKOt71hFdQ39VgPOeYXfIh6HxFnBxLOqkUzzCnxkoP9J27rQPsfVNiI9JaJJMaTUq
	GZF2nvVwym6jNmZXsRkYOXTqjQ3gLkVFvElYOKxHwSkUE5F9AVESrTDMNBh22oIOeW5GD+gOuTe
	PdI6G7OJUbpNT3mBd2/axl4CugrpUPF4b+D4DXQ3ZrXzefKA8JgupX48kHEhXNkbB0xx5lHP6a6
	EvJEtx4yOpO9jsZhzu0T0puTNL5mBuCLQwRwFsYLwPH6hVe1DX4IQ==
X-Received: by 2002:a05:7301:6907:b0:34c:85c:da56 with SMTP id 5a478bee46e88-3515dde8fa4mr1393173eec.17.1791356485497;
        Wed, 07 Oct 2026 00:01:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af26f10sm5850369eec.13.2026.10.07.00.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 00:01:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shrikanth Hegde <sshegde@linux.ibm.com>, kvm-ppc@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, R Nageswara Sastry <rnsastry@linux.ibm.com>, Alexander Graf <agraf@suse.de>, linux-hardening@vger.kernel.org, stable@vger.kernel.org, Avi Kivity <avi@redhat.com>
Subject: Re: [PATCH v3 2/3] KVM: PPC: Book3S HV: Add preempt_disable() around virtual-mode HPTE bit-lock users
In-Reply-To: <20261006122404.99358-3-amachhiw@linux.ibm.com>
Date: Wed, 07 Oct 2026 11:48:24 +0530
Message-ID: <33uirq33.ritesh.list@gmail.com>
References: <20261006122404.99358-1-amachhiw@linux.ibm.com> <20261006122404.99358-3-amachhiw@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Amit Machhiwal <amachhiw@linux.ibm.com> writes:

> kvmppc_hv_find_lock_hpte() requires virtual-mode callers to run with
> preemption disabled, because it can return with HPTE_V_HVLOCK still held
> until the caller later unlocks the HPTE.  Existing virtual-mode callers
> in book3s_64_mmu_hv.c already follow that rule, but several paths do
> not.
>
> kvmppc_handle_exit_hv() calls kvmppc_hpte_hv_fault() for hash-mode
> data-side and instruction-side faults after guest exit with preemption
> enabled.  kvmppc_pseries_do_hcall() executes virtual-mode HPT hcall
> handlers via kvmppc_pseries_do_hpt_hcall() with preemption enabled; the
> handlers for H_ENTER, H_REMOVE, H_READ, H_CLEAR_MOD, H_CLEAR_REF,
> H_PROTECT, and H_BULK_REMOVE all spin on try_lock_hpte() or lock_rmap().
> H_ENTER also reaches kvmppc_do_h_enter(), which uses arch_spin_lock() on
> kvm->mmu_lock.  That raw lock choice is intentional because
> kvmppc_do_h_enter() is also called from real-mode paths, so the correct
> fix is to establish the proper preemption context at the virtual-mode
> caller boundary.
>
> On the host side, kvm_unmap_rmapp(), kvm_age_rmapp(),
> kvm_test_clear_dirty_npages(), and resize_hpt_rehash_hpte() also acquire
> HPTE_V_HVLOCK via try_lock_hpte() in process context with preemption
> enabled, serving MMU notifier callbacks, dirty-log harvesting, and HPT
> resize respectively.
>

I was going over all the callers of lock_rmap() and try_lock_hpte() on,
and I see that we might have missed kvm_htab_write() path...

... after spending sometime looks like we need this diff for
kvm_htab_write() path as well, since it calls kvmppc_do_h_remove() which
calls try_lock_hpte() and lock_rmap(), although the race window is much
narrower and maybe very hard to hit.

But still, could you kindly look into this and if needed please take it
forward too. Please note that this is not tested, so hoping that you
could take care of that too.


Thanks!
-ritesh


diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 908495f2b001b..916db7ceb51a9 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -47,6 +47,8 @@
 static long kvmppc_virtmode_do_h_enter(struct kvm *kvm, unsigned long flags,
                                long pte_index, unsigned long pteh,
                                unsigned long ptel, unsigned long *pte_idx_ret);
+static void kvmppc_virtmode_do_h_remove(struct kvm *kvm,
+                               unsigned long pte_index, unsigned long *hpret);

 struct kvm_resize_hpt {
        /* These fields read-only after init */
@@ -308,6 +310,19 @@ static long kvmppc_virtmode_do_h_enter(struct kvm *kvm, unsigned long flags,

 }

+/*
+ * Virtual-mode H_REMOVE.  kvmppc_do_h_remove() is also called from real
+ * mode, where preempt_disable() is not usable, so the guard stays here.
+ * The helper takes HPTE_V_HVLOCK and the rmap bit and does not sleep.
+ */
+static void kvmppc_virtmode_do_h_remove(struct kvm *kvm,
+                               unsigned long pte_index, unsigned long *hpret)
+{
+       preempt_disable();
+       kvmppc_do_h_remove(kvm, 0, pte_index, 0, hpret);
+       preempt_enable();
+}
+
 static struct kvmppc_slb *kvmppc_mmu_book3s_hv_find_slbe(struct kvm_vcpu *vcpu,
                                                         gva_t eaddr)
 {
@@ -1878,7 +1893,7 @@ static ssize_t kvm_htab_write(struct file *file, const char __user *buf,
                        nb += HPTE_SIZE;

                        if (be64_to_cpu(hptp[0]) & (HPTE_V_VALID | HPTE_V_ABSENT))
-                               kvmppc_do_h_remove(kvm, 0, i, 0, tmp);
+                               kvmppc_virtmode_do_h_remove(kvm, i, tmp);
                        err = -EIO;
                        ret = kvmppc_virtmode_do_h_enter(kvm, H_EXACT, i, v, r,
                                                         tmp);
@@ -1907,7 +1922,7 @@ static ssize_t kvm_htab_write(struct file *file, const char __user *buf,

                for (j = 0; j < hdr.n_invalid; ++j) {
                        if (be64_to_cpu(hptp[0]) & (HPTE_V_VALID | HPTE_V_ABSENT))
-                               kvmppc_do_h_remove(kvm, 0, i, 0, tmp);
+                               kvmppc_virtmode_do_h_remove(kvm, i, tmp);
                        ++i;
                        hptp += 2;
                }


