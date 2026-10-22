Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708263;
	b=lxIKaAYl62P57ND6tXExxvgciqwzLnin7PoqS3KsaWt/u++uKq0Lbx2yOKh7Ptah0NyR
	 Uo3wTAqAiiD2p9p/3Gx8us1i9JoO7OHyZYM1S/wICnIs3xIxy5iocz88Q2SOnVgGNmwOA
	 973djRho+D7Bb0XJ8XzTzixBHhYIQhCLnlq6Ta4TiQ5pB5Y3XfCabsf2sM/A/aQL1nTdO
	 JyT7SZBmULjOd3OT2iTIqns/ZSqO5DdBi4vsErTFqVhW/ypeFqOL6gwIFxgVn4YnzP97P
	 42/eTsACvNYClNpk4eCsH8gWC3sOyM9nAnQ5EXYPOyaufhj1fBl3aqDp8CV5wWavICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=yp7cvsW9FF4jZB/yRmxi3xtRDI4TkEokIlw+zMvDPUE=;
	b=mnyMqQv6LdCjL1R6u4XXNwgGX8tkbBT7cgVQLTHEb8o6MC6ik9WM9Wu8jdu2yZGsf1ai
	 967Jl4tS5HVC+56OscQNlrFgupK9ilV8RzJpK9EA17sSbT6Dqs4ybo4f/21c3b4dikkY0
	 bLMt6zmKEfYJ98+vdvNFdVilxVIsR/d7mhYNAlHJL6jdHpHXrIOCvHc4Dry34VGodNY3p
	 TfbSIQ2qzFYouy7MFa/pwkOWKJM/y3BHyI6+3hKqIHJ2L3izetHDgA7Q4d9Un1zR7NVJY
	 3GXy5sWGs0cJZZwmsTfaXJe2l3SoDh8/GdkC6d5yrDD3bzSNoKBopVeVC+WP6qlZkpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="eOZ/X8eS";
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102A8606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 102A8606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=eOZ/X8eS
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e601800e58so3133705ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792708256; x=1793313056; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yp7cvsW9FF4jZB/yRmxi3xtRDI4TkEokIlw+zMvDPUE=;
        b=eOZ/X8eSEp+IhmAPBIui8CIDly4l/AsaHdCZldR8InHBxNE4Lq85f9kzucvh38q2ms
         o5VneHekNc5zEuUPFEw+Brzz/4LYK1ZBPnEPXvUi7q2ZuMvmbdg14H9dj/yTjNQUpqk6
         y5VWhzvhxfYX8Vp7LE/7v9mh/Ud2BbYuibdo+bWDFMiIl9ixro3jgcDpKjWuT59YFn/H
         XDN2g1Gqtdz7RUYA7ssAEyvbj/rufYU945NKIp00UapkHnbXSmxbJfuuXXIrkS7JthZX
         tcx9E0h7tGuUdG5QSF3bIYPuaXN6xO4YMV4UQOQSTWPOV0aE2ngP7X15ZKU3fDIinI1u
         awzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708256; x=1793313056;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yp7cvsW9FF4jZB/yRmxi3xtRDI4TkEokIlw+zMvDPUE=;
        b=UKK5mte8v0k/7Ot174T/sTgk0ipby/TXcCtpdaLdQr/H6EVditIF/efmW+zoN9mUnn
         pgTaT6zOuCj6k2eTIV1+h0vjIkxXuo4vBg3QBZ8bJV9rFZlc5EMU8jsk/z7QdnZL/bAG
         e3rZVACLVB84Tz3PaXIZd1cMfY/Xcp5IdPrL/sd9hkuHkX5iQvNGBszHL+RS2mjag5+R
         J5QIV7arGbx1zHhDef3tPvvzUJNg+de0uvtvnHXuXkMEUYj7J1yvni+o4plRYRkm+iKn
         m/2S65wAeyMI4Q1P8wVW6L9btj94zOWIU6cSCX1ro5kWAup8s8M+cOQDsEf7kitguLAL
         585Q==
X-Forwarded-Encrypted: i=1; AKwUvBwmnC6HTN0zaBFj5FGaV5m8A6pbr0Jnn2ZuOXNO/nNHOS7zWFwbOHYIEfba4J2W916EJ1zA6ulXjlFG9RM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7dY5A9rR01K9Ti1xibh9mJmNBrWOnsa/fEyReVzk/diLUcpTz
	YRh6s80Y5lk2xxdQarkk6MGOk9DfuwW4dgPC1gYyk4wZ6V+J2/mhx/YxgADEJ40S9EMRF25BTlj
	kGs+4iA==
X-Received: from pjrs10.prod.google.com ([2002:a17:90a:ba0a:b0:3aa:f38e:cb2d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c42:b0:3a6:e99b:bbdb
 with SMTP id 98e67ed59e1d1-3adce833707mr174475a91.50.1792708256256; Thu, 22
 Oct 2026 15:30:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 15:30:50 -0700
In-Reply-To: <20261022223052.646891-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022223052.646891-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022223052.646891-3-seanjc@google.com>
Subject: [PATCH 2/4] KVM: nSVM: Synthesize #GP instead of SHUTDOWN if L2
 attempts to clear EFER.SVME
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
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
2.56.0.257.gf7497c7d27-goog

