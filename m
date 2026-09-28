Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737BE4E1C96
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610412; cv=none; b=HWkZCIGJ37XsMoPQawpcw5XokjPfFTHOCz0GyqnhXq0Q8aZxJvBCQyhuJEiHw18TuKjiBqrYLgEbLOz7UzROg4kkmt0jk2SyNXtAqN70r1kqTE3MFqK6zWNt8qM2TOP9N83PZQOLBmSz8H7/jr9IXpEqMy/t/vFyQ7DVqsNNqPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610412; c=relaxed/simple;
	bh=Sbs4Xf0e9m7SoerfEp1EvKViUdAxyyqIdBhnAmQZ/rY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eMWDg4t/Tz5b+S4y3XaGsC9/mbOz1fHMThe8erMDris2avXaxBDx+GYfUw/al1fa5fIv8d7J61uWC8l/yCBxIJUhiXUXkK6Rr3DbK2DZddCnIoH9NIujSLLKLwiSD8hQKmcQJy1d3vyMk46yQk80Lq3GFcBF6iBEH8W4QaSBK5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pf6m1f0X; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pf6m1f0X"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so1532384a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790610408; x=1791215208; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TEqwe7dtJN15PbJBz8C+RfbeR3PLAduy8H3fTioMshQ=;
        b=pf6m1f0XO2aVPsDhevJrCaPuU23XWj9DKrU3wS/a5BVgFXEYwcppLEcaU5n5M8/oYg
         bev6VoVTr5pBNWIbUpvck/pUFojhTrxJOdT3IrCgWV9TqqxH2ndazZLcQWRRmdQBBtXT
         nkCprV0AfiZZH64roUCxbb1J/8qiEH9sBhK//Qlfrlv9HVhvaEYy5TfVX6kAJgPd/GUl
         FGboZxMvO66WBRJD3NuiJTKAenzo6//EbIvuvwUw7G1qjyvCrfvdyixfm5JqP8s45ZMY
         1BeVW7ZF5oTKzS0EFbsUtn0v1foXJrItUrfXJzVD7tJVH7tAX6vQ/Qvs0hv4e7g5iAgC
         WwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610408; x=1791215208;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TEqwe7dtJN15PbJBz8C+RfbeR3PLAduy8H3fTioMshQ=;
        b=uHDf7d98W28C/UmlLAdwZi1eJz8prIOeqrECP8rFzT+cba04QPAuG81vtMHur3hPRV
         0BU6pvzQS4ZHGfK+F9Ol1QwLiWlEDsOvKZH3zw7/wmXBl2H43bKPQ0AAgu10h9wSyBi/
         KaazuS5uMFLcx/JznqM2SHRvnlC5tXrupGhDDz/eZAUK73R7Kcxw9QwnA/1mjuetE/pD
         UWhKxae4RtRVROeNpDNUUrfen7YwI9YOHr0AICJ8zlgY/Bz05rS/cIYQT2K2Uv6cibGK
         s6ly9nwi9OmcV7iEc89l5PRBeMV/GBhWm2p0WLxHFu8wYswFwD9EpEQQ7KpNgWtCVDsB
         AiPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV8/AZsFNryQg2mQBCQud1agHnUF6iW8w8ONv3DNpFhVsWOivMNeA5ExL94icpNrpfWgv5c4a4zuYWBAw=@vger.kernel.org
X-Gm-Message-State: AFuF++mbVpyzvKm2RIYHtfrv9jwDDQwvRHfnW5JdkClw+PKJbIh6v8B6
	V4T7Nzcx+Plx3kgvqFKu9PAPlX1lHZ/xIPVahrx3W8VDvPXNNRa3Asy7XLOAn2TWNZ85S23+8ar
	iIlh15w==
X-Received: from pgdj8.prod.google.com ([2002:a05:6a02:5208:b0:cc7:9685:757a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:b78a:b0:3dd:85a8:4c67
 with SMTP id adf61e73a8af0-3de0e88d225mr10746033637.46.1790610407869; Mon, 28
 Sep 2026 08:46:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 28 Sep 2026 08:46:43 -0700
In-Reply-To: <20260928154644.2559454-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260928154644.2559454-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928154644.2559454-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: SEV: Nullify "have run CPUs" mask pointer when
 freeing it
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Nullify have_run_cpus when freeing the mask, particularly in the error path
of __sev_guest_init(), so that KVM doesn't have to subtly use sev->active
to track whether or not the mask has been freed.  As pointed out by Sashiko,
blindly freeing the mask in sev_vm_destroy() results in a double-free if
the mask is freed if __sev_guest_init() fails.

Throw the logic in a helper as nullifying the pointer is frustratingly
difficult and weird due to have_run_cpus being a single-entry array when
CPUMASK_OFFSTACK=n.  Deliberately don't use CPUMASK_VAR_NULL, as it's not
directly assignable when the cpumask is on-stack, e.g. requires using a
local variable and a memcpy(), which is beyond ridiculous.  Furthermore,
while clearing the on-stack bitmask is an unnecessary and arguably unwanted
side effect, KVM absolutely relies on '0' being the "null" value given that
the struct is zero-allocated.

Opportunistically add an alloc() helper to pair with free(); there are just
enough call sites to make doing so worthwhile.

Fixes: 12c1f6e03f94 ("KVM: SEV: Free have_run_cpus during VM destruction even if VM is no longer SEV")
Cc: stable@vger.kernel.org
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260923165349.CAAF01F000FF@smtp.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/sev.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 3448d56520c6..d3a2e6a51efc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -488,6 +488,20 @@ static void snp_guest_req_cleanup(struct kvm *kvm)
 	sev->guest_resp_buf = NULL;
 }
 
+static int sev_alloc_have_run_cpus(struct kvm_sev_info *sev)
+{
+	if (!zalloc_cpumask_var(&sev->have_run_cpus, GFP_KERNEL_ACCOUNT))
+		return -ENOMEM;
+
+	return 0;
+}
+
+static void sev_free_have_run_cpus(struct kvm_sev_info *sev)
+{
+	free_cpumask_var(sev->have_run_cpus);
+	memset(&sev->have_run_cpus, 0, sizeof(sev->have_run_cpus));
+}
+
 static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 			    struct kvm_sev_init *data,
 			    unsigned long vm_type)
@@ -545,10 +559,9 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	if (ret)
 		goto e_free_asid;
 
-	if (!zalloc_cpumask_var(&sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
-		ret = -ENOMEM;
+	ret = sev_alloc_have_run_cpus(sev);
+	if (ret)
 		goto e_free_asid;
-	}
 
 	/* This needs to happen after SEV/SNP firmware initialization. */
 	if (snp_active) {
@@ -566,7 +579,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	return 0;
 
 e_free:
-	free_cpumask_var(sev->have_run_cpus);
+	sev_free_have_run_cpus(sev);
 e_free_asid:
 	argp->error = init_args.error;
 	sev_asid_free(sev);
@@ -2191,10 +2204,9 @@ int sev_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	 * does not, i.e. KVM could skip flushes if memory is reclaimed from
 	 * the old VM but not the new VM.
 	 */
-	if (!zalloc_cpumask_var(&dst_sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
-		ret = -ENOMEM;
+	ret = sev_alloc_have_run_cpus(dst_sev);
+	if (ret)
 		goto out_source_vcpu;
-	}
 
 	sev_migrate_from(kvm, source_kvm);
 	kvm_vm_dead(source_kvm);
@@ -2888,10 +2900,9 @@ int sev_vm_copy_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	}
 
 	mirror_sev = to_kvm_sev_info(kvm);
-	if (!zalloc_cpumask_var(&mirror_sev->have_run_cpus, GFP_KERNEL_ACCOUNT)) {
-		ret = -ENOMEM;
+	ret = sev_alloc_have_run_cpus(mirror_sev);
+	if (ret)
 		goto e_unlock;
-	}
 
 	/*
 	 * The mirror kvm holds an enc_context_owner ref so its asid can't
@@ -2984,7 +2995,7 @@ void sev_vm_destroy(struct kvm *kvm)
 	 * Free the mask even if the VM is not *currently* an SEV VM, as it may
 	 * have been an SEV VM prior to intra-host migration.
 	 */
-	free_cpumask_var(sev->have_run_cpus);
+	sev_free_have_run_cpus(sev);
 
 	if (!sev_guest(kvm))
 		return;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

