Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DBB51E43A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789861; cv=none; b=JqRDCqWug2oVCVoHuLflUSioAzRj1qV6OduGcY4A9nXehuDkF/8PQ1alSSX3kSelPOxSkPjIi+qcMjQorUydl9WkU0+KfZbUVTLvJwXRdigR5gRaccbsmYrHF1rDUi2zhFKUZOktRNGLoDyM4jkbsQHxKbSNFb1n29LvGr6Bx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789861; c=relaxed/simple;
	bh=58f2QmNNQQdnN/JNPgV03bddp/nVFR8FI3bhho7WoiY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XrGyON752sTv9NWIBXb/tBBWNsPYPX723XWJ2RMahjBKoVs0FiavffZHufu1uOkWq4/YJ7J/RQyPxPkxXasae+2PATV1g2/5OPzRHiS9nsxSCNA1OqQe+2tw7mgrUb90MeHYIS1zkm+wTQPvsVnlVNlZo09lcJ+bTVBT1cUbGQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UZG23e4B; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UZG23e4B"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso37273595ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789860; x=1791394660; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6B/yRwv8+Wh9zmaZqZxMYcgxNWMQzfJrOwGAe00Yf8=;
        b=UZG23e4BuaA1jrms0f8tybwCKSl8eh5I1i5FDbfsKguwIwq/tD/j1b2MDCEh5BlbFX
         2Rp/NJrJ6xanpYIGgeJCrVrNdBgRLrV1j3fdCjVqgmcZx/moPhDdB6mwsWFRnu4p6A/r
         +zcxG7MkvP1YGBm4MS6MLe6buRzjr6+oQxPAsZqHA3jKeW/gzstOq3xO/Kpu3Ur4BtM2
         UbRx1wJ7wivO1mc7Z+riKYa8xuU/PPEk4pqPXYBCsLYB13rYAQfVLbvAtAjE2n1ScdsL
         NsGd73sCv6rNTe7TyM7Nip8xmKCYPy2ELnMk4e0tPAx7GZyrWLl/CRuUhQFQpV/5AODj
         ELiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789860; x=1791394660;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a6B/yRwv8+Wh9zmaZqZxMYcgxNWMQzfJrOwGAe00Yf8=;
        b=RihZA5Dd2YbPzm880tTh1+PrOzjnTostsO1mC76BU6RtjKxhWf59hC5VmxPYKmYzDi
         Q7UowbTHgymbFxH7cAngfsfpZSa2jxNxyKH8V2PSRNUD3zxTvT+CWTrSxgBIGdNsmGhG
         819qFOZFf7Gmb+WPvF92WxqFQOrbD4lBc7vMxtcXGSAYijY9f0wSeMIs4CFCWO8DTZKE
         KgWLBkOqMiW1DdLdAaPb58WT2kB0wur9ci+jJ41FoUsdxS0INHmLz6UWehp+FysIIqCI
         E90zzRxBq+rMn7ER2i71kU70isRdIwEetfzKn7qfkmz5qnL78lWGaM9saqMwZU3Q0V/P
         M9xw==
X-Forwarded-Encrypted: i=1; AKwUvByvLChhM/Er0LVdRC0MTOe+bqHp77EY0AWUZZeRsUZnaI9aJZLJTj6zMY5IUqMJR7eimncNmRlOPylxeNM=@vger.kernel.org
X-Gm-Message-State: AFuF++mfsdURmh+knqglbk8e6JbWRHSX5MazwfHNsan5KlfAIgp/VcAD
	46NtSZhlmqkLXU1HslbO2g+44EfWeEvOjBdd8WF9pLtjjYuWg+KmcucIaUI6wrz0YezVRESY5jy
	FvMj9Mw==
X-Received: from pgar16.prod.google.com ([2002:a05:6a02:2e90:b0:cc4:4327:bb52])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7d8b:b0:3da:1e7b:ea27
 with SMTP id adf61e73a8af0-3de9e6e251emr2196880637.21.1790789859619; Wed, 30
 Sep 2026 10:37:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:16 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-3-seanjc@google.com>
Subject: [PATCH v3 02/21] KVM: SVM: Fallback to the default TSC ratio if KVM
 tries to use a bad multiplier
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Explicitly WARN and fallback to the default TSC ratio, i.e. run the guest
at L0's TSC frequency, if KVM tries to program a bad multiplier value.  As
pointed out by Sashiko, leaving the MSR as-is bleeds state from the vCPU
that last ran on the pCPU into the likely-misbehaving current vCPU.

Leaking a vCPU's frequency isn't very interesting, and corrupting KVM's
cache isn't a big deal either since KVM would only refuse to try to write
the same bad value in the future, but falling back to the default value is
trivial, and explicitly WARNing ensures a KVM bug won't slip by silently.

E.g. because ex_handler_msr() only WARNs once for *all* WRMSRs, it's
possible for the potentially-fatal-to-the-guest issue to not exhibit any
visible symptoms in the host.

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260722091414.E842B1F000E9@smtp.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 0eb1623052c1..2b6888417bc0 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -533,6 +533,15 @@ static int svm_check_processor_compat(void)
 
 static void __svm_write_tsc_multiplier(u64 multiplier)
 {
+	/*
+	 * Fallback to the default ratio if KVM is buggy and tries to program
+	 * an unsupported scaling ratio, e.g. so that the guest has a chance of
+	 * surviving, so that the cache isn't stale/corrupted, and so that KVM
+	 * doesn't leak state across VMs.
+	 */
+	if (WARN_ON_ONCE(multiplier & SVM_TSC_RATIO_RSVD))
+		multiplier = SVM_TSC_RATIO_DEFAULT;
+
 	if (multiplier == __this_cpu_read(current_tsc_ratio))
 		return;
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

