Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DD48CD68
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787780006; cv=none; b=KLVlUjErBp5sHHFYGpALZVPSvJe7D070vtiI8hEtGAItiC8uMsJbRRLMGcL8Qq6oybzLkkDGwz/4xbf5ylvBLt2wJqERTwiFTrjhVAxOQeqWSg7o1nex7VZGYQ28k1d6mSWPC5y/hZ4FUqN4uG2WgsOiJdqo5Xy3fNUX6jmvZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787780006; c=relaxed/simple;
	bh=NmC/TIbNurvkOqlVrSByb0DS/AOuda9r/vWVO+SbpRg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UyQfzpMj/KMf6kvCA6C8PGNSc2pWuAvzxraZ4l32v2W4YboRZHugvp2wij6nL/e5LJ0pIQXdjU11DuucSUxRxIYdK6YQgik2P5tswdGtVKmiuxsOJBJPjEx4c274sNMbSynsuGNaEvVYCGhxlrIAEQ5RLtsiJguWj3xFqE6jCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gGoiNIQS; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gGoiNIQS"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso544805ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787780003; x=1788384803; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Et98QGpcgzG8rtiMrYGDfYUkbdGZQe7+45/h5KmEwG4=;
        b=gGoiNIQSjRKvABofi8EUGwc84Y2nudGIrpt/fRdUMr8Qd1ce+z1BzRM77CtKwj3xLC
         YRIWEPCqqCO/QYtOWIlmZ+F0JyxXdzxP83VMsikL/dt2SuDJVnbz5au3/L4Ju9QxfX/9
         fxXQjcDMtD/p6/EiQB55n/ZtIElTNjxgcGV8dlLrj2kaEGDv+N7fInkWS82xukzuLI17
         yIUz2Se6hoX4HWSXPnK59cp2NDvBX5Z/y8QVtCVyivzURqwCvawgwkdXeQ/IommE6Kbl
         Cbxdlpfv4Q3bl98v5qU02JSK2+DL4ax34uu7U6w+BKZFLxykx0codvl/ka1SwzHzggF7
         R70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787780003; x=1788384803;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Et98QGpcgzG8rtiMrYGDfYUkbdGZQe7+45/h5KmEwG4=;
        b=oVzuGfCOb/gMFBJQIL9CDK9qe9pdsVzgcvAUBACGToKz7LtsmT3K8lRdBzGtm5hv+g
         c+tgk1k8vrpqmbsKQLEJHYkyj6hDG6PwSaOATRTCgffkk+LYHv3t6DpqFeKdvbPaqMtn
         YLve3BR+PwasyuU4Jm5/BflTFj8IRbBWBGyaFX8sb0HMsg5SaL1buQM9/lNU/eIEZwRW
         2ZA45g+0NEkedV7UxfZQiO2ZWw1Eg7u1p5aHxusXyFLYZm7QUzzpm0f5PHiqOZBIgGKk
         JOhVkCIqRdG5Ep4R4ubfv/2Z8WAgBBxMY2QOFazroD1UPNtu5bIrjy5xn5e/WErpUw7o
         hixA==
X-Forwarded-Encrypted: i=1; AHgh+RoetHNKfCmH+nlpuUpV80lDC38aDypHIEbt7zzgQbkm6FJKT+Cp+HojnPk/vAnfLzUnBvaPOkDyWVKYE1s=@vger.kernel.org
X-Gm-Message-State: AFuF++kQWlRXqiPjJh+fRuTCN65nHjkfKrgRxFZ2j3C9xNZBBlmO9dJ3
	zZQec9iBpvwpENZMlvkWoSiCvkAs2tyYYx1rdz2YiLaeZ4bpOSOt603s9+vrzMPvewroijwKwNY
	lArt0tw==
X-Received: from plblc14.prod.google.com ([2002:a17:902:fa8e:b0:2d5:62cd:db79])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f786:b0:2c9:bf82:dd11
 with SMTP id d9443c01a7336-2d707a70d9fmr186756105ad.7.1787780003027; Wed, 26
 Aug 2026 14:33:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:56 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-17-seanjc@google.com>
Subject: [PATCH v10 16/21] KVM: x86: Upscale TSC to "now", not master clock
 when updating PV clocks
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

When doing TSC upscaling in software, e.g. when the guest TSC frequency is
configured to run faster than the host without hardware support, always
advance guest TSC to "now", not to the master clock's reference values,
which represents some time in the past.

In master clock mode, there are two points of time which need to be taken
into account. First there is the master clock reference point, stored in
kvm->arch.master_kernel_ns (and associated host TSC ->master_cycle_now).
Secondly, there is the time *now*, at the point kvm_update_guest_time()
is being called.

With software TSC upscaling, the guest TSC is getting further and further
ahead of the host TSC as time elapses.  So at time "now", the guest TSC
should be further ahead of the host, than it was at master_kernel_ns.
Not taking that into account means KVM was advancing the guest TSC only by
the amount appropriate for the snapshot taken in the past, *not* to the
current time (which is what RDTSC is supposed to return).

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1614718a7d0b..6d9ff7eafa5c 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1798,12 +1798,11 @@ static void kvm_setup_guest_pvclock(struct pvclock_vcpu_time_info *ref_hv_clock,
 
 int kvm_guest_time_update(struct kvm_vcpu *v)
 {
+	u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
 	struct kvm_arch *ka __maybe_unused = &v->kvm->arch;
 	struct pvclock_vcpu_time_info hv_clock = {};
-	u64 tgt_tsc_hz;
 	struct kvm_vcpu_arch *vcpu = &v->arch;
 	s64 kernel_ns;
-	u64 tsc_timestamp, host_tsc;
 
 	/*
 	 * If the host uses TSC clock, then passthrough TSC as stable
@@ -1816,10 +1815,16 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 	do {
 		seq = read_seqcount_begin(&ka->pvclock_sc);
 		use_master_clock = ka->use_master_clock;
-		if (use_master_clock) {
-			host_tsc = ka->master_cycle_now;
-			kernel_ns = ka->master_kernel_ns;
+		if (!use_master_clock)
+			continue;
+
+		if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
+			use_master_clock = false;
+			continue;
 		}
+
+		master_tsc = ka->master_cycle_now;
+		master_ns = ka->master_kernel_ns;
 	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
 #else
 	const bool use_master_clock = false;
@@ -1885,8 +1890,18 @@ int kvm_guest_time_update(struct kvm_vcpu *v)
 
 	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
 	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
-	hv_clock.tsc_timestamp = tsc_timestamp;
-	hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
+	/*
+	 * If the master clock is NOT in use, the reference time placed in the
+	 * hv_clock is "now".  If master clock is in use, the reference time is
+	 * the master clock's snapshot from some time in the past, not "now".
+	 */
+	if (use_master_clock) {
+		hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
+		hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
+	} else {
+		hv_clock.tsc_timestamp = tsc_timestamp;
+		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
+	}
 
 	/* If the host uses TSC clocksource, then it is stable */
 	hv_clock.flags = 0;
-- 
2.55.0.887.g758fc8c411-goog

