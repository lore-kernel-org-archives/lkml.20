Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793917805;
	b=i+ZLRUbsv1cwn2gFRkKr4GZb+/aMTnWUG7PlySd/U45c4wvxoIvHvJw8NdQ9VZFeq0KS
	 ocMLZSTQyZ4sYnVQ8ewGHhE3FzeGGVISPv5Y98R0ODFwTWpwtG5tNdrx66R2/HkZnjcyI
	 vVNGh1H+KFpgbRjnzDtZJ7ahRdexkVKH2GRegINhd8Erz4jFw3HgRDijFXKdF5KuBN4s8
	 NawHe2VyI04MUyFav+09ND/figNWFbKUnL+NakHywanGzKqro01IhS7BfAjnqFsyH5Zl2
	 HGS9wx8gSTlM39EvalmH4alCKgP7RgDfjKu5G/amdl5+CYfRP4h7KrktDY56UcU6ZXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=6RccBScqvox0PQtK6ljXaLC+8XlIbIU61+oRhrEpvwc=;
	b=JC2O9rddgB6+8PW2LQOE1ySev33A41M5LXq/L1auACM5Suu3WpeN7XzkcyRd170YR/Tg
	 zRRcVHPWJPdAPsVym1IWvAqFt/mwtWg+pshv9RpBYcGeNihvt7ZDpXZeHVE298WkGVkSN
	 kVxcCutGWXG4/fqGBAWj6hx/eJShrAHqPR376IfjHsPKCJM7BOngbsXDCbJKUPIKVirM9
	 LN5/PtyiCbglAlqZYZGqLiE0TQmKkWKKSCPd2XM5pO8owiREf4aOb+lhE6aixbyONmc3f
	 l2apHdb2dzJxUT2BShKq53RuSp/dvgeEubOxmPuX63D08GTSw+ed2GlL0qbveXzgluA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OvqWLWR1;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EA7606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83EA7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OvqWLWR1
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8520e83f715so92122a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793917804; x=1794522604; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6RccBScqvox0PQtK6ljXaLC+8XlIbIU61+oRhrEpvwc=;
        b=OvqWLWR1KNUYYP0/8bQc2nDQaeuku4ZkjK4RHbXf827VqQ1GGHTVkpWnoghHBNUJDD
         q1ItZf2QrGLBb1POwB7jMCuxvRlcYqcfOaEPguBn+MFym4U38XSCGtIDMXlgmdJ3HYVK
         jBenfWhBJe8ForsxJHb+Gp6V0hz3q1ncAnuT6Bri4JHzeVRyr6Q0LmRukZKa5hOld0sK
         rl7DPLP7KDMImQIRbYdb0gHVGhJnDJrB6Xs+XTXNg6wpp1L4FbDIuaI2UPruWI+Ehs5n
         cvSeK9+UVu0w2X8TSG8rvd8wGKAMzY2PRgqXRUsg6cY4MyDP5CJkzxf11UWJStgpVtdf
         r20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917804; x=1794522604;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RccBScqvox0PQtK6ljXaLC+8XlIbIU61+oRhrEpvwc=;
        b=ONTgFUlfE2BuisvMbvGa5Gujm1CTL9ZhcZ9qDD3izM6OhsndUGV9vDxKm6IpxHndwT
         GPe61YY+tpTYN8q7MkkYRNJTUIrlPFhb3/tv3XyUwQXspubynNx6ihz/FGtvHkYMziKc
         A0mENyPMX68ZbtYYX68UyPd0HPDYTFRKdopg0FIAMYnfiaTqz3bTzxyeG0GUbqdTN8AP
         1ZOFqNiwd68QYxG2NsAYZFjr+EZx8ozz2x56EP53vOry7JhawTdyP69Rh2YqFuwj9SxO
         eku8zLVh++yRZXAV2QGOqncILzbsWRl96NPpRqmkZm6S2b+LvRLe/BlKSFHFLLdTxpbi
         evrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUj3L/mSy0WngZlbqMTeZoDKW0RdcWchbXhii0CoUS97Tgg64I+4cqSCIaPBHzWrygcCylHP8YApX7xT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ROC8mmrC/E0oW7hr+gQU/6xTl3yfcWxcyBLG0+kCBCo4avYeR
	f0E6kPntHgrt62ORZaBDzReTcUKlWPBkwZKPfH6tSYaIro7UceQwZlMyP2gFK/3u70Y97zWtPMI
	5sIDeY4oHsuXWYQ==
X-Received: from iobn15-n1.prod.google.com ([2002:a05:6602:c6cf:10b0:9e0:f302:3530])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:198f:b0:4d6:93e2:5bc1 with SMTP id 5614622812f47-567e1a16c8fmr547852b6e.66.1793917804196;
 Thu, 05 Nov 2026 14:30:04 -0800 (PST)
Date: Thu,  5 Nov 2026 14:30:00 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261105223000.3036448-1-jmattson@google.com>
Subject: [PATCH] KVM: nSVM: Mark all of vmcb01 dirty when restoring nested state
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When restoring a vCPU in guest mode via KVM_SET_NESTED_STATE,
svm_copy_vmrun_state() updates L1's save state in vmcb01->save directly.
Stale clean bits may result in the loss of these updates.

Mark all of vmcb01 dirty after svm_copy_vmrun_state() in
svm_set_nested_state() (cf. svm_leave_smm()).

Fixes: 7ca62d132250 ("KVM: nSVM: do not mark all VMCB01 fields dirty on nested vmexit")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 07554089ec05..0d1e4d624cdf 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -2091,6 +2091,7 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 	svm->nested.vmcb12_gpa = kvm_state->hdr.svm.vmcb_pa;
 
 	svm_copy_vmrun_state(vcpu, &svm->vmcb01.ptr->save, save);
+	vmcb_mark_all_dirty(svm->vmcb01.ptr);
 	nested_copy_vmcb_control_to_cache(svm, ctl);
 
 	svm_switch_vmcb(svm, &svm->nested.vmcb02);
-- 
2.56.0.455.g6c5a503b38-goog

