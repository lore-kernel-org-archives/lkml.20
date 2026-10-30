Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395648;
	b=EmPZTbeX9em4MGX6Zkb3W7d5YpWzk5+sz77P8/WfQcnVtiWc1NUb8KpxQW7yClCrzoTZ
	 ol4D/mDMeCUFEDhb9/s4lMPHvxalm1rc28uTOYNs8heUyTyC7wAjkz6ntG6TADqYkujH1
	 +SKedKlPWBOESg6tLiS0EMm7HcAGJMncc/5LqOLCdyozDkgk9UZlR+qJREPvO6Sd9/KEj
	 Nw+vJZoBEVyuPi3IolzIzqw+HW6145WoYZ7iRlLWdCPK7wTluPF7cHuaekcM8mDsIMYAV
	 1cllMVpWEmwOl05Eg65A43O9xlsr8RrK1Fgc6ArpbmgWd1aY/8Sobwl1nl/aLjz6dfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=WCuJ30mnsJiahpujsd+/JbSot3kCKCozDFDV0GhWtL0=;
	b=YDV+ntSvTIfQ2Xwu08ayuD2GeCoMtQYWEvVGE4Z+JMMv4hG0+DPVcFc72WeHxNDCQ4kg
	 EZ4+XtMb0wEm9h4XwUE2rROJ0WYwe2+J3VqQi7CLhp7FUNmVGEZTp4UhHcomS0ztoEGGi
	 6YLcXCeY+nDluArpljVTfZwQjS1g178PgMGzaMkZXlmmfEBrUxc8wspZon0WZb6+rSPpS
	 VCTnSranLi6BSBPnjV/rAAj+mixKQutuk0hMKhAHQIsbJ/u+cU1mKTJtRTCrYj8aJy7EY
	 1ZY4RmwubFwJZYZsYGH91JZn8BIlNaGZDJ0YR2p/hxBCiiUBoMk245foOIKzhzTNXHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDfv9IpY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F398606A320
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F398606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IDfv9IpY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so1510586a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395648; x=1794000448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WCuJ30mnsJiahpujsd+/JbSot3kCKCozDFDV0GhWtL0=;
        b=IDfv9IpYXaq0P84LPcp0VYrWfxYtIBnj6RRvmBV/JtN3N23tXTXrJyXnSQLid3z2rM
         EBAjYyC7PYs3kdJY0d02lurUaoegBB2HeNhLk+3VDb6z//yt1ehDpwNJklFcocGzVjw1
         sIBTKAp5ARrf2Anrg8VyeWeGgw85MYHewaWyHnzXFCyNdyQNmtGkdrwEhUZJdQiIRgob
         0QmfUEEmoEhfX2aOEbuENjGsARwZIHS8l8E3b/4+BWhLbUBGloX31x3VG9aJ0F4gD2x5
         mgLmYLltWYS8+AW/R5cFH2S43jPTJ52NyAFDNU+3lo/WlxYuUezDQk1Rgj6bae/gMpAH
         dOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395648; x=1794000448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCuJ30mnsJiahpujsd+/JbSot3kCKCozDFDV0GhWtL0=;
        b=Pv1TBss7R7QFVwbGPj6HpVpl3dkms9GJa63pv4gUB94iCNhwT+mk1vX4peBGV4bgcp
         OkqRA33VrGLkmkENnxSd/nE+N17fzpZtLTbuicTOFHo28rZyJKyQ9c2IHuQPBIG/QG9U
         lDWRwVpJNC5eaW7vizeIeXVsESq6RxRKo6cjo4cPDe+pXtk8sX4nfg138X0GLsU0loIB
         XhFHTDhbbX2UCtqGCza8TH6c1hsSVD20aTfbCF3lPbszp3t8jtdidfiTUUjsrsnVXaFL
         4tHClGvCSCvsNbw2uktPvr253Nupz92CKQfo17T9cMPxePL7BN+h3GbTdQLXWU0OKkfv
         ZcGg==
X-Forwarded-Encrypted: i=1; AKwUvBwbRI0sWNZFXumujbkC7yEAqVD2q2+u0lPm85o6imyelgEgl5+X87Mygz5637VNb7+MpW291JR24Fz9WuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVK6ZRPJT8sOobhBMgx5KDr3UQl+FW7Y7L4/LaC1oXrLytFUMP
	4yxWEy11T2zSkbuEM5H36WtZJbJNpCtn00cITZV9ZVI5TH4vEkCklu158A/6QYnNwYHx52iHJnu
	jIMrJYg==
X-Received: from pjqc8.prod.google.com ([2002:a17:90a:a608:b0:3ae:5572:c4d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c1:b0:3a8:59d3:5317
 with SMTP id 98e67ed59e1d1-3ae89751035mr3002809a91.32.1793395647611; Fri, 30
 Oct 2026 14:27:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:18 -0700
In-Reply-To: <20261030212721.2606393-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212721.2606393-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212721.2606393-5-seanjc@google.com>
Subject: [PATCH v3 4/7] KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2
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
2.56.0.385.gac671c819a-goog

