Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395646;
	b=jlxobiKcZ6Ti3T7MpCcICpOUg84Cy7giWqrX54oAWK15ilXfvY4PkLFaSBxvRntmJqoZ
	 wbWf4KQmGlsotZCvIdSB47Nr3Yghu6UgO99I+3nrsP/NqLrPVyaAe3cxeSemITHLSjYDh
	 9NXvpdvhRfkI2f/UcqCvUAg1AVU3WdKj9+Qn6gZ3MG/cZaonkpE/SoIO2jM/cqjA9Fhc3
	 e9MVov3oofUan7uKnag47uJsl+e7ZzGm31ntUtq2gbC613G0TLdRlJzzu7uvVU1YoqAuQ
	 p5E/2nucHpiIWKPO+ubq1CWYjqojAByi5d9LPo2+q5aiGE8Ba7JW3zFMQq7ZtOCz94A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=W5zoDi+lqoWp4CLBy/QM3flMWtfsfcrQPm2tl0mqVEc=;
	b=JDZbI6DwTqkqVcTIz+y5tQT7mxsPvkbTmykXZfe6agcgujuNSTFDFpTkkSMwVQDA5l4p
	 q30iSYa4P0mS1+l5tG2yKR74Wms/6BJQnL76Psj0s1v2G3/IsV0JkpScZ09xkHxE30pAK
	 AZmUvd+u0NU/VUYyV8tWn4/jXv3d60Z8WtQ2pCHTetWODLT41Y0WJ1JqmLo9Te8LD90JZ
	 GZFr9xMA8Q+c79icasTdEKEOpR+fNcZuyYBU8XzrhHD6528BZtee9GfBnBZaIY8yojJfI
	 B/Nuz7shj8g/AOivGCZvjqgmH/zJDEcu9nnP0gADZ0iq1g+kCbrN2CDzxOlnlOnZBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qw1935dI;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A9660A2602
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3A9660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Qw1935dI
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso12637115ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395645; x=1794000445; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=W5zoDi+lqoWp4CLBy/QM3flMWtfsfcrQPm2tl0mqVEc=;
        b=Qw1935dIWvunHPAzysmMCqH0fVyqmM2NklGUJyoZtgtLGyI3lKoMyGVjUO7axIe7/3
         1fpL8vFv9VItXfCECwjLHwLmFWAGVAmYnH0Co4xfjL865DdhExD3dIN0gItUGKSgTTZM
         NLKJ5gVmKpDdWrjO646sDbbQvVWAWiHjMiNsaGHbAlc6vQd+rbEvIJWWtHfdnvCp6Dcl
         qb4kHjY6UCQ8xnnFdUTF2JD6g4OT6lPddjLwLwXCOh+j5AyJvY/YngCDDH4UwaCw7Tr3
         P1WlErBPTpqOoNTVjNmRceW+5e7+G1sGIP9vP7oYewPpTIRXdcDTpkxs1PhK/c4XPWJt
         9vlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395645; x=1794000445;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W5zoDi+lqoWp4CLBy/QM3flMWtfsfcrQPm2tl0mqVEc=;
        b=uGJzIpR9PKocgu+mMk+j5iy2afVEdeXqOc4JfmL8bKtf1vZ3p8yk2PENOseasNh7Kt
         J2iia798qfQuF41hSAgAIMrig4/AMJY/Bml2OexjhwWpzZsEzByqT1HQXqUIZDzuP2f9
         xqnPWrLMtmTBCy7m6QkPsATpqrEUK8ZaiQdqncwHN+vvQAeLcUj1UXCxjCRxwdkHXAeV
         Jef0ctS0NlEXoMyQJzzAUk5bX4SkwH+aoP4Uq2KyypWTqU3MiVKXtmqGqxkr/nCeyA7l
         v0DJaf4B1YGKKmsHxMFZ1YgrEfUKAz3KjZdAydkKifj5BmsyStRSMP+ol+bpm1Y+Ba3C
         JGZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzl0Zvn5AtfKL2wzyAqNFLTljZLXYry+o6v9wbjOzFab1xJGlpgrVXj9GdvWsb1SghkcJTpZNY7ujwybBk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIq6TcTD2VI2nuDppNdS48axDbjgoj3SIzMWZqid91goxPUmq54
	NN1TAFZpEukzCZ3j4Cw7xx/Bd/V9AX9/+2kYFdV4Iw2VI7C2HXXC0dfTxUxx6ytu5wMA+gtb/XW
	XER8Aag==
X-Received: from plbnb8.prod.google.com ([2002:a17:903:15c8:b0:2eb:15a2:31f2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e74f:b0:2e9:4175:3073
 with SMTP id d9443c01a7336-2eb364a2804mr36189935ad.28.1793395645207; Fri, 30
 Oct 2026 14:27:25 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:27:16 -0700
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
Message-ID: <20261030212721.2606393-3-seanjc@google.com>
Subject: [PATCH v3 2/7] KVM: x86: Treat EFER.LMA, not EFER.LMA, as an EFER MMU
 role bit
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Now that KVM now longer lets userspace violate the architectural rules when
stuffing EFER, treat EFER.LMA instead of EFER.LME as the relevant EFER MMU
role bit to ensure that the MMU context is reinitialized if EFER.LMA is
toggled without EFER.LME also being toggled.  EFER.LMA is the actual bit
that is consumed by e.g. kvm_calc_cpu_role().

While the _current_ code never actually toggles EFER.LMA, that is a flaw
that will soon be fixed.  Furthermore, checking EFER.LME was essentially a
hack to fudge around the now-reverted, misguided commit 11988499e62b ("KVM:
x86: Skip EFER vs. guest CPUID checks for host-initiated writes").

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-187201@kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
index 2ae7f9ed4cf8..2c3f777f78d6 100644
--- a/arch/x86/kvm/mmu.h
+++ b/arch/x86/kvm/mmu.h
@@ -61,7 +61,7 @@ extern bool __read_mostly eager_page_split;
 			       X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_PKE)
 
 #define KVM_MMU_CR0_ROLE_BITS (X86_CR0_PG | X86_CR0_WP)
-#define KVM_MMU_EFER_ROLE_BITS (EFER_LME | EFER_NX)
+#define KVM_MMU_EFER_ROLE_BITS (EFER_LMA | EFER_NX)
 
 static __always_inline u64 rsvd_bits(int s, int e)
 {
-- 
2.56.0.385.gac671c819a-goog

