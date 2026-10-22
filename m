Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708258;
	b=wpSIqhq6F2yR6BCYC4/5DIO+5dKfyVsKAv9y/h1rBWSkugDruz3/qkiWvADntJoTaW1b
	 2E9pNG1eERuOTw52HJvaMSSCrIkIBwLNt2TABykJudO4zWesIkb7S8DAXtWFbdVG0JQXy
	 Gb+RkR0c76dyO9oEEIOYTmvHT0RYT0polvOesYciuefGM9kFdWeTaTlIccUmRt5N/eVFF
	 qcUw4lgiVmr+CSBAopFJTwArf1n94ZQ3HSyuPAnDXBTjgP1ZWOP4BtK0iYW1nOvESHWB4
	 8Nk8657nvTy3FlQk7V8FRAMmr7ocSp3PQ0hUXxXyIbXlHACBNNT8zGVFjqqqR/jo/Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=2bQnvowAK96XJBMT+TQureQmj260BxIC7J5qxK72Tvk=;
	b=hsGkg9X07QbJf3lO3Kx8EKio59EIYOV1R++KYiR664yZw4XipZU4W92hC/IxwYTCtFFk
	 no2t6j7Fp2NcANIw2PLbD9Nr3YtNOTFy9+BbbvWqu4QHIZpXi4N1Iuv1XNDlv0qr65yVZ
	 oPOEeVRyIIrEgEjh4V+70uqKWJIBDnIPWvFaH7H5qE6m3yRPpPceChPlQByLECxNQ3lRi
	 UUkxEmxYSii0zjN0wbme07QWh4w3lZjki68vzMx6LLwpwhsXh4/HTyNSLSkWTrVwuaWds
	 2KN6/LF1Jsl3Qv9N8lxBT71kQkkLnqICBPLJfizsYyzbAe9GAwCzBZ6ki/JtCbvo2eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="v8j/GZ+M";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D49606A33E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40D49606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=v8j/GZ+M
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adbc9a47fbso251708a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792708257; x=1793313057; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2bQnvowAK96XJBMT+TQureQmj260BxIC7J5qxK72Tvk=;
        b=v8j/GZ+MorZsPWvTTNc/7/V5m6ckYN0RwurfQT8/YttzOLCPH9nSpPrVgdwQD6FNrt
         QZCQliYDhb+uil8J38NwyLuXyWbtTnYuWe69c6YDdybpsU6/JEw5KXF2/OsUoSeYryfZ
         KW6hXmwBui00LvCD0czdDF2gC4T96nRT8iTm8LJbz1dq0lAwyut2CXuK6ZSP/wrcs0SX
         /Y6g0LlMpYAlQbzlMx9XVd8MVbWZkhpfyFhnkhnlEzFgScwn+Qqa/ywIWChKe6AGMHvR
         USqjApM7ecazVWsOwH8tL6XEZaLVLh27nrr13A2ujK+GRk0yln+gy5zVKQ2GiOXKx9m6
         5zOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708257; x=1793313057;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2bQnvowAK96XJBMT+TQureQmj260BxIC7J5qxK72Tvk=;
        b=B/r3GehGD/+Vunxv3JTrVGhfqmd3D6kvg2jNb7FhqtZePByngdYxdjLifCMGrJob/H
         S+sDt+h1jCiTy4QYo5OszPaeTrFsPj1q1nXbqxp/ro0kROrNd2LJDrRWAcfKB/qfN4DJ
         ZUsZ3O3vxHSkt/NbXEjQb+zlSpxZI2htzzEZZ+9/VDtrzu+YHHVy+qEJ9DvqAJ+Z3fYy
         Gkk8K/skn5A8t6BCdUiIp/BcPdbY5VTDEDCWSMpfWrb9wpDzywTfgFBHKn+O2VVdpM1c
         U6buNpcsKlnfQMTX9Cw3QFNmronjI0oX3iJozkIKn5yga6o1936LaHXcaiLIaaUUfUQn
         vvhw==
X-Forwarded-Encrypted: i=1; AKwUvBzqrQ+38rWhXf1NM55+gucQi8x0ilVUzL0L4RTDyM9ro0bDlzFPVWnF1V+W5V7qENwK9LoRt76WjTaMnAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvHAyXNj/TNVxjHFutNlxLHLL6SawITsBcyAyNhCxxB3DsAy3J
	XB4LWJf4noMsBhCvRU6VS4rkmLN/PqPn6XjxKvY3vVI7vsOF23gv2d7R00+FWnM4EgFGDxrcDND
	/8hNYMw==
X-Received: from pjbcp7.prod.google.com ([2002:a17:90a:fb87:b0:3a8:837d:95c7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3810:b0:3ac:80dc:f40a
 with SMTP id 98e67ed59e1d1-3adce5ebc38mr195879a91.16.1792708257349; Thu, 22
 Oct 2026 15:30:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 15:30:51 -0700
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
Message-ID: <20261022223052.646891-4-seanjc@google.com>
Subject: [PATCH 3/4] KVM: x86: Recompute EFER.LMA instead of inheriting the
 current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Recompute EFER.LMA on bare writes to EFER (via WRMSR or KVM_SET_MSRS)
instead of carrying forward the current EFER.LMA.  While it _should_ be
impossible for EFER.LMA to end up in an inconsistent state on such a write,
KVM has had a rash of exactly those bugs, mostly because SVM is quite lax
when it comes to consistenty checks, which in turn bleeds into KVM's nested
SVM implementation.  Retaining the existing EFER is also rather confusing,
as understanding why keeping EFER.LMA is correct requires a lot of a priori
knowledge of both x86-64 and KVM.

Keep the core concept of the existing logic as a sanity check: WARN and
reject the write if the computed EFER.LMA would be toggled, because as
described above, that _should_ be impossible.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/msrs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/msrs.c b/arch/x86/kvm/msrs.c
index c3cb1575fe66..41f3ec6eb286 100644
--- a/arch/x86/kvm/msrs.c
+++ b/arch/x86/kvm/msrs.c
@@ -638,8 +638,18 @@ static int set_efer(struct kvm_vcpu *vcpu, u64 efer)
 	    (vcpu->arch.efer & EFER_SVME) && !(efer & EFER_SVME))
 		return 1;
 
-	efer &= ~EFER_LMA;
-	efer |= vcpu->arch.efer & EFER_LMA;
+	if ((efer & EFER_LME) && is_paging(vcpu) && is_pae(vcpu))
+		efer |= EFER_LMA;
+	else
+		efer &= ~EFER_LMA;
+
+	/*
+	 * Toggling EFER.LMA on a bare write to EFER should be impossible, as
+	 * it means KVM allowed architecturally invalid state at some point in
+	 * the past, i.e. allowed EFER.LMA=1 && (!CR0.PG || !CR4.PAE).
+	 */
+	if (WARN_ON_ONCE((efer & EFER_LMA) != (vcpu->arch.efer & EFER_LMA)))
+		return 1;
 
 	r = kvm_x86_call(set_efer)(vcpu, efer);
 	if (r) {
-- 
2.56.0.257.gf7497c7d27-goog

