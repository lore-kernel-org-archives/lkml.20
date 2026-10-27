Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793141367;
	b=YgLJYJYZu7Qv/nNfKEefS3ui9uF4n6WTFSpAwsQ+NPJ08vl+iSD7xPw8pMv8CLgfVXLD
	 UZ/W3lojz1jrhcXZHiRB+mQdbtm/Yh13vQv8rYw2ytucgRxfwkbZpoGMhEAqbCSPnu7ap
	 I3E9V8gguy6JJtsJtTOBiy/QpbmQCnEV+Y0N7QSEW93WSU+bsshVvxcyFsTwaeSCNHljD
	 ke98J0vjZ1dKW+byqE3AR8OLWyRySjEUBWZG8MtzjrCGND52vPThBZbgHNKHm1mJzJzFt
	 1TxHNGyfIqDH99DZkPaPfztenpTK0jTYhOZfrke1Qo1k362UfkFtbrX8Vw9L0Kwe80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793141367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=LAo1rJJbq0hs0qGWFuGYD0y3GxHx8EGe6MZyojkL/24=;
	b=L3zmajTrjXu209D/ceTbgme37EeEGi0KlRsqEmPrROjcjpx9XTbLy+dYFkmEX3Ik2pTn
	 LBJmIAnxpEi9YPnPtDvO5+BzllzS/ub0iHd/+y0ZpnBaQKNBH4VqdoKaTQYJpLfP2PrrV
	 lQrPM7zXzEGFX9p6RahE3P2O4Iwb8NFbbftT3dsWxoRuCLcRIgE1XmGbSES116yoSJXpl
	 mon6vBFDdaS5oFTq1+QutfYhEs48qdkwJam+EALOEG2VTqZ1I0DqtPJIYYIn2CSojMkvh
	 wUO1fGFoKMf9LBTAmpi80gtOO8nYlLk+4AGAYMuOZppm28Xl2vazDs6GVCjbu/+0+sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ibTFb/Sl";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89F5606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D89F5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ibTFb/Sl
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so325713a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793141363; x=1793746163; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LAo1rJJbq0hs0qGWFuGYD0y3GxHx8EGe6MZyojkL/24=;
        b=ibTFb/SleyCWc3RA1NPUAre+RhGCwzOqefQeF6FekTrfGEzftxoa1HxKCoXlj+lqSe
         WgkkKuSGY+DMSWGpHBwQ7jbcmYeRqnpFw8P/GjhC1zhQNSPOUOO8x8dVrhojvPNTleLD
         18j1UL2MBLRhHQuOZc+ZiMjlJv5YZEJU63GKHRFKuPpdRAdT5oVQ826LDob1tIv52E5o
         xEAqHU/3PVm4vAnn4HxBCukHotVXVZrBMxJIQTDe2Y9f3l3bTMJnty4Bh8RV16I+oJyW
         vEbPFuE9rpe5wyuere93Zs9xRWvRF+8hlvyDQpnZwLNoCqEs3c0ZZ9JNuQvoLmVm+i+t
         JKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141363; x=1793746163;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LAo1rJJbq0hs0qGWFuGYD0y3GxHx8EGe6MZyojkL/24=;
        b=Vv3lSd3AhjKJZeijDlKj30dBE7+YzwtY3YH4Ophzcl4qNfn2GV30ORoHELIkwv/l/1
         xBzUYNqxRLhWGHjfHpfA7Wuo3bTbkYiDtH4cDsJYVWCkjnaxmlCrRm7jW2GiT4ir0law
         AuQBXJCoHt4656gwQYwzmkt4Ih8xYP1+rNgPapzwv0ol84PG93X641/Y95xhTrsXZ0pn
         QoHOh4T53SlW8sO8NbOMs+0rYgnp5TFcn4OTAmo9mknmRrjaTCYtKmzLLTu2+911WLqO
         k+Dc80qKZ5xwqHJnjLMkG0DSfCoXGR23SLiGMgjmdWkW/ULL4AMUF58UyecfO8INCiOc
         4lJw==
X-Forwarded-Encrypted: i=1; AKwUvBwWNy1ea6uXZc+7yP+dmtlgx+O8CTMXUOjxIAfS4wbn2fixmQSbnLFoC9j5KfzEaXO1lIfc74Z/gsOPt3E=@vger.kernel.org
X-Gm-Message-State: AFq9FYKm/JJbpSdteP+UR7oUn1o5QUjMJAiubdIvQ+hAxioMtKxNl3nj
	gxdQ+c0Il0zQlSSsISGtARwhgKRZmMLCLlpiyrCcwtN21vNpKBTZi9g6Logyikp2cdGitd8NXPp
	UrOWQig==
X-Received: from pjzd3.prod.google.com ([2002:a17:90a:e283:b0:3ad:ce3e:c303])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510f:b0:3ac:7378:be04
 with SMTP id 98e67ed59e1d1-3ae57ba6c8emr378928a91.0.1793141363121; Tue, 27
 Oct 2026 15:49:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:49:11 -0700
In-Reply-To: <20261027224914.1574319-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027224914.1574319-4-seanjc@google.com>
Subject: [PATCH v2 3/6] KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2
 attempts to clear EFER.SVME
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

If L2 attempts to clear EFER.SVME (because L1 neglected to intercept writes
to EFER), synthesize a #GP instead of a triple-fault SHUTDOWN for L1, as
yanking the vCPU out of L2 and mixing the new (invalid) EFER with L2's
current state is unnecessarily risky for KVM since the TRIPLE_FAULT request
isn't fully handled until KVM attempts to enter the guest, and nothing
prevents userspace from ignoring the SHUTDOWN exit and continue running the
guest.

Apply the restriction to both guest and host (a.k.a. userspace) writes, as
unlike kvm_x86_ops.set_efer() => svm_set_efer(), set_efer() is used *only*
for targeted MSR writes, e.g. not for KVM_SET_SREGS{,2}, and KVM does NOT
advertise EFER as an MSR that needs to be saved (because it's handled via
sregs).  I.e. there is far less chance of breaking userspace that manually
restores EFER with SVME=0 while L2 is active, because in all likelihood no
such VMM exists.

Keep the sanity check in svm_set_efer() that handles the KVM_RUN case, but
escalate it to a KVM_BUG_ON() + -EIO, as it should now be unreachable.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c    | 12 ++++++++++++
 arch/x86/kvm/svm/svm.c | 15 +++++----------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index 2df42276fd82..c3cb1575fe66 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -626,6 +626,18 @@ static int set_efer(struct kvm_vcpu *vcpu, u64 efer)
 	if (is_paging(vcpu) && (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
 		return 1;
 
+	/*
+	 * Architecturally (per the APM), clearing EFER.SVME while a guest is
+	 * running yields undefined behavior, i.e. KVM can do literally
+	 * anything.  Synthesize a #GP as that is the safest option for KVM,
+	 * as mixing the current vCPU state (from L2) with L1 and the new EFER
+	 * (if KVM simply forces the vCPU out of L2) may yield an unexpected
+	 * end result.
+	 */
+	if (is_guest_mode(vcpu) &&
+	    (vcpu->arch.efer & EFER_SVME) && !(efer & EFER_SVME))
+		return 1;
+
 	efer &= ~EFER_LMA;
 	efer |= vcpu->arch.efer & EFER_LMA;
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 487897ef11dd..a6ff9635677a 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -227,17 +227,12 @@ int svm_set_efer(struct kvm_vcpu *vcpu, u64 efer)
 	if ((old_efer & EFER_SVME) != (efer & EFER_SVME)) {
 		if (!(efer & EFER_SVME)) {
 			/*
-			 * Architecturally, clearing EFER.SVME while a guest is
-			 * running yields undefined behavior, i.e. KVM can do
-			 * literally anything.  Force the vCPU back into L1 as
-			 * that is the safest option for KVM, but synthesize a
-			 * triple fault (for L1!) so that KVM at least doesn't
-			 * run random L2 code in the context of L1.  Do so if
-			 * and only if the vCPU is actively running, e.g. to
-			 * avoid positives if userspace is stuffing state.
+			 * KVM is supposed to synthesize #GP if L2 attempts to
+			 * clear SVME.
 			 */
-			if (is_guest_mode(vcpu) && vcpu->wants_to_run)
-				kvm_make_request(KVM_REQ_TRIPLE_FAULT, vcpu);
+			if (KVM_BUG_ON(is_guest_mode(vcpu) &&
+				       vcpu->wants_to_run, vcpu->kvm))
+				return -EIO;
 
 			svm_leave_nested(vcpu);
 			/* #GP intercept is still needed for vmware backdoor */
-- 
2.56.0.307.g5fe7bd680c-goog

