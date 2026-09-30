Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6951E42D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 21:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803118; cv=none; b=lXAd3I7vXtc7Fto1zPIDK1Ya3Vr9W0RCKSSrKvRjtt+H7H7d0Oujcm1uleV8pItH+c2Pr9KmrIMdPFySUTAjDXUGGRE4o8DEr2vXoD9JNlhTWf2lPjRhrogu4R4rphBsMBaof+ywtNmhh5KdSnm/8GW+VHpBYbjzCmUqPeNLRY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803118; c=relaxed/simple;
	bh=1zpGeqQhQHL87M4JhAi1mEkbl1rvBkOkkOhj9EwgPFM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eRKEbRJK23rm+h4H27e2RQPZB8byP91Ec1h39VlO1yRxF16GfJ6E7enqNZVOmtLZmkSexgVyx1S5U0XpZWvxGEPuZLEQhCjmzZGDXKJclk6u+SxyAAnKkyfqlymQGOkr7S1/81HddYox5NkeghVWmX90uEtmtn55SnesShS8EFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CrYxZnEf; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CrYxZnEf"
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso9108238b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790803116; x=1791407916; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvNQ4tIxSouECNeVr4s6zto6hS9KDqxG0yViEXlduVY=;
        b=CrYxZnEfYm+l1P/2utU8zz+ySYiUCCdIPg6XDUIoF3RnpM8/DcBXFHaRW0uVC4uBkG
         AChKuUdwpS0+5cLAvu+hUuBHjnvU5QMh0CaOiSiaH6/UC8WQGiK+ZuBhj2yrE9kSbqDU
         TEzL4oAcd/ZSzs7HW0d4pjevM/r4VC4G1pYKM6agE63fzSVw/bQBUSXsWymXM8jWqu4Y
         kH3QP+DiSDM9BNpyc+4dx4CvNoVFLEXWd+Co7Ufv6RXP2ny8PHRJEawLTeMAoZeHf9yc
         OwXoBE6VP8G7QMACkDPOnLAQ1J/nBzBA5B9vxlXlpUGU7GzCKYALNxs/kp3ymVYfCZ1m
         +AwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790803116; x=1791407916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvNQ4tIxSouECNeVr4s6zto6hS9KDqxG0yViEXlduVY=;
        b=nZRmT04II9I/NYwuluALESgCbkx/Rbcro6jbcQpaY6k/Dv54sK3KBE7FqAQoeApEVy
         B9NaEalQSz0L/JEaMVJ/P43T00pTfcg560rDr35X7AeEi4FOfrUddWihz4PQtn9el++K
         zlk70m+O7x24t7R5rYXXNHzOhBECwdo/RJAGmRjRBHqRG0IarFwFpIwey59FtmkLmW98
         xoYapxyDLSin/efXjN+mkAWrU1bl+PjERMmPM4DCUQf1mB7M3WSODlWhMZllJdPHq8mk
         vIvHBMaUhcG7qv9ihPBf1yQ2J1vByxQXU3oR+RSxb2Mk3YkqtnKjcpJXx3TeMZsmPJna
         UGoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4v1P/4wk5zOtAkhbpjVwFWke7GxqKyUe5YsDX8jXS2fePlzu3/4fs0mva8mNaHgaz/H9uK4xqQX+4sE0=@vger.kernel.org
X-Gm-Message-State: AFuF++nkQZGUvVdYb1RuAzxFLAUEGVZwjL1x8bxD7N15NfanBtUJSAty
	Qy7c4qn6dun5hEDdu+uaGbC4qhkmzG4kB5AnIA1u6KD5nbOluIwfErw/dPWSq51hxpk92Vfa59/
	JxAXgL+E2Hat05iZ78y8F3M9AnA==
X-Received: from iljm9.prod.google.com ([2002:a05:6e02:de9:b0:50d:b61e:e6c3])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1190:b0:4d6:9153:295e with SMTP id 5614622812f47-4f1ba4fc340mr2480554b6e.47.1790803115577;
 Wed, 30 Sep 2026 14:18:35 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:18:33 +0000
In-Reply-To: <20260930211834.2773546-1-coltonlewis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930211834.2773546-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930211834.2773546-2-coltonlewis@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Handle ID_AA64DFR0_EL1.PMUVer == NI in __kvm_pmu_event_mask()
From: Colton Lewis <coltonlewis@google.com>
To: kvmarm@lists.linux.dev
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"

When userspace initializes a vCPU with KVM_ARM_VCPU_PMU_V3 but sets
ID_AA64DFR0_EL1.PMUVer to NI (0) or IMP_DEF (0xf, which is sanitized to
NI), resetting the vCPU invokes reset_pmevtyper() and calls
kvm_pmu_evtyper_mask(). Because __kvm_pmu_event_mask() does not handle
ID_AA64DFR0_EL1_PMUVer_NI, it triggers a WARN_ONCE("Unknown PMU version
0").

Explicitly handle ID_AA64DFR0_EL1_PMUVer_NI in __kvm_pmu_event_mask() by
returning an event mask of 0, and drop the redundant kvm_vcpu_has_pmu()
check in reset_pmevtyper().

Fixes: bc512d6a9b92 ("KVM: arm64: Make PMEVTYPER<n>_EL0.NSH RES0 if EL2 isn't advertised")
Suggested-by: Oliver Upton <oupton@kernel.org>
Assisted-by: LLM
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu-emul.c | 5 ++++-
 arch/arm64/kvm/sys_regs.c | 4 ----
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 5b1af7e2176fa..e2b28dbc0451b 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -50,8 +50,11 @@ static u32 __kvm_pmu_event_mask(unsigned int pmuver)
 	case ID_AA64DFR0_EL1_PMUVer_V3P5:
 	case ID_AA64DFR0_EL1_PMUVer_V3P7:
 		return GENMASK(15, 0);
-	default:		/* Shouldn't be here, just for sanity */
+	default:
+		/* Shouldn't be here, just for sanity */
 		WARN_ONCE(1, "Unknown PMU version %d\n", pmuver);
+		fallthrough;
+	case ID_AA64DFR0_EL1_PMUVer_NI:
 		return 0;
 	}
 }
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a2f4e769a4282..e4ad9c171c7ca 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1059,10 +1059,6 @@ static u64 reset_pmevcntr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 
 static u64 reset_pmevtyper(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r)
 {
-	/* This thing will UNDEF, who cares about the reset value? */
-	if (!kvm_vcpu_has_pmu(vcpu))
-		return 0;
-
 	reset_unknown(vcpu, r);
 	__vcpu_rmw_sys_reg(vcpu, r->reg, &=, kvm_pmu_evtyper_mask(vcpu->kvm));
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

