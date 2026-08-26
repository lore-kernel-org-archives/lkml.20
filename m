Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2248848C412
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787779999; cv=none; b=Nh6ne2h2MvlqBJJFKg6TLEyfRkgcf9UuM0oNC7H7TqWbQ5xazRcbzyP/OZgtwc69ECriOKMs/NLFtuniFZ9d5ZmbG7hdrEzktz3AZQO6SIa6KMF8YrOzyjXjZjSen3nUZVRQxnsEkUqZQbM5Z55bwiUOGIFV40qfyRn0Bytamqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787779999; c=relaxed/simple;
	bh=1dubEWiH+wDpaRTr6xDH5FSSCgfhV3tA2a7yb409fro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EasHG/SAbrIIu5AaQL+3hr/ASFohP4psyIPeVFA0MNgIuoiIPWm9QZmWAigfKofGbcQyl+14GrFYycscFHqlFAYQsfVENkinRpZF+W1OSugrLFAIID7EphkeFHfs0PBbhoul6D8MLNKk3p4WKtbvQ5xw4TtaE3YA6ltfI/vR2KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rvp5AY2S; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rvp5AY2S"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so4620945ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787779995; x=1788384795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iaeGWHwlG+AWk9QHVwY9V6qXxKpEzxckDrOJKqWFOA8=;
        b=rvp5AY2SqLRucYy7MFVva3mw9Zl9G3aLWfuJouawTo1NwwhJLPALb4wkkOnClPIYT0
         FRl8ihJQmHzjKHcR7limoh7n6Ql7snRhviz6Afz5/zGeMBao6ZuSJ1EPaVsMWFBUMtGP
         iXaLICt8ucwFsEKfVuj25AUQCJ19e9MXnAvZKQ5h1d+Xe0NfiuKwcaFd7Qc0azlfBrQH
         HJgxtl+wuDwvPROgsFPZmgFeexyTCQjWzdaysgRqJmWso3VMyXz1h1mo4YmD/gEmCi97
         MtlXp7Hip17f5cicXEV76DT5ZbzeEhwkj5Mu8r+GhSkg/5q0C74NdOHjhwFu5m0oa0uz
         YVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787779995; x=1788384795;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iaeGWHwlG+AWk9QHVwY9V6qXxKpEzxckDrOJKqWFOA8=;
        b=gigkagZefi40UWP9+1DUq0TUQEuqdYbd3V2jIGhDG8CWYdJ3MisYoV4pBZOga2XBRT
         XpzrF+4C1g1ERdzOE8Kg3nMvLsiyZe7tTqwNh9+NGS5239WY8hEvX8yioOKeim2sE82U
         +Y8rnKLZs3VMWSy5vocynqswH0+0fStO1GHWSTyLBFDMzv5tcPimP22Ouzvdg8gE4xd+
         fTUjQm3Y8+3ZR511jLuZ52aKngE2dSl1nly+XEI0UOpXCc6+DmmR6n5aT2EFznxera/u
         rTkwcg/e1/PzBmg6Bg6WFIskZY5GIKCcTmOkoZjK//32vHcdR4zpUv6XZ/+PsY3gbk3g
         6juw==
X-Forwarded-Encrypted: i=1; AHgh+RpKfVo6v0WXP7flnNYHeLfpdb4agIxKDDXCXXN0edjfwb4kCc1w9iJVSlIUj27m08UXAVhYxkZlik33zLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mG7p1zwDL3nKChzK46ygPcsJZNAe3Li4WAYLtkT2QCXxmo1IPQ
	nKofeIeYR18R7aVGytJjYMvvBUBDqvi3s6q4nsDaUgPUPDMuj1cR0N8x+ksqgTK7GuOCDM/ZT2x
	TmXdTpg==
X-Received: from plbmq13.prod.google.com ([2002:a17:902:fd4d:b0:2ca:cf09:91ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:120c:b0:2c6:90ec:f601
 with SMTP id d9443c01a7336-2d707aaad36mr147369515ad.8.1787779995135; Wed, 26
 Aug 2026 14:33:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 14:32:49 -0700
In-Reply-To: <20260826213303.914988-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826213303.914988-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826213303.914988-10-seanjc@google.com>
Subject: [PATCH v10 09/21] KVM: x86: Wrap all of __get_kvmclock_master_clock()
 with CONFIG_X86_64=y
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <paul@xen.org>, David Woodhouse <dwmw@amazon.co.uk>, Dongli Zhang <dongli.zhang@oracle.com>
Content-Type: text/plain; charset="UTF-8"

From: David Woodhouse <dwmw@amazon.co.uk>

Wrap the entire use_master_clock block in #ifdef CONFIG_X86_64, since
use_master_clock is never true on 32-bit (host_tsc_clocksource is only
set under CONFIG_X86_64), and declare hv_clock inside the block so it is
not left as an unused variable on 32-bit.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: keep only the CONFIG_X86_64 ifdef, update changelog accordingly]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 33 ++++++++++++++++-----------------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 4f98cc71a671..64df8da3aad4 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1656,8 +1656,10 @@ static unsigned long get_cpu_tsc_khz(void)
 static bool __get_kvmclock_master_clock(struct kvm *kvm,
 					struct kvm_clock_data *data)
 {
+#ifdef CONFIG_X86_64
 	struct kvm_arch *ka = &kvm->arch;
 	struct pvclock_vcpu_time_info hv_clock;
+	struct timespec64 ts;
 	u64 tsc_hz;
 
 	if (!ka->use_master_clock)
@@ -1674,27 +1676,24 @@ static bool __get_kvmclock_master_clock(struct kvm *kvm,
 	if (!tsc_hz)
 		return false;
 
-	{
-#ifdef CONFIG_X86_64
-		struct timespec64 ts;
-
-		if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
-			data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
-			data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
-		} else
-#endif
+	if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
+		data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
+		data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
+	} else {
 		data->host_tsc = rdtsc();
-
-		data->flags |= KVM_CLOCK_TSC_STABLE;
-		hv_clock.tsc_timestamp = ka->master_cycle_now;
-		hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
-		kvm_get_time_scale(NSEC_PER_SEC,  tsc_hz,
-				   &hv_clock.tsc_shift,
-				   &hv_clock.tsc_to_system_mul);
-		data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
 	}
 
+	data->flags |= KVM_CLOCK_TSC_STABLE;
+	hv_clock.tsc_timestamp = ka->master_cycle_now;
+	hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
+	kvm_get_time_scale(NSEC_PER_SEC,  tsc_hz,
+				&hv_clock.tsc_shift,
+				&hv_clock.tsc_to_system_mul);
+	data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
 	return true;
+#else
+	return false;
+#endif
 }
 
 static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
-- 
2.55.0.887.g758fc8c411-goog

