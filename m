Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510123;
	b=gEe8DNqDLCOUTrtYpQvDMpNYsXjrED94yJmdKAYMdyM0LjGzuDHKzp0yhDVz5OCP6SIG
	 7Hazc+7IPcE2HQP2/lVEbig2mz3jPbeoN56/JGgKvnZ0qda1/lC/X5YNK+YT+BfyyQnpc
	 4ZD+Uo3jBHk0T44DTE+7uLiVYYfvOelqqJXLn+U7HXHz+f/D4SZrb9CDGNKWOK1KpMzXx
	 hX/Kwf2UrcitsuPXI+TyNY09A0S9TK5+FoWsdVxc3bgga4vJNnCNWsWJFK2oZgaiwN0Dw
	 bbE6gADZixvHky0167sbaxJGTFOwqdDXAGxpN7IHIAdu7XZcvILuZ0CiTHh5mJwWBVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=0BWRXYU90cf54hfF6Vi8cEaIhhQPo+XnQGMy56cYcVI=;
	b=khvHmycnbkkLxIwoxi63AgY2MtQ6UhZ7F6B5/ReIDsnXj3lUfdpQfooN26B1EGBukYCi
	 +GNGxMsRnISElJ8rdpBrrKpfEcEML73D84TzIhoajTKboa2Ox0EpyqYDeHImdnwi3VEgX
	 bApbeo2ekHDfc61Q5RhzPrC0faY2am9neq+xz6ba/i34FrJgOJAIByR5DGN2OuyNd5H5k
	 xZeTQ1AIoBwhhGx9vzJd+9bO2x8wTjZO9I19wZVWaxx7NbtrlCYbFZ+EtcP61hV4m4MQ0
	 xr8wQnXL5b5hgk2KXLeWxQlmqyTvfd+SjV4g4H7U23WvHDqDSGDTGJV58zTxen8cb8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=koq6v1Uk;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC5606A334
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FC5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=koq6v1Uk
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a68926c8c4so114370fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794510122; x=1795114922; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0BWRXYU90cf54hfF6Vi8cEaIhhQPo+XnQGMy56cYcVI=;
        b=koq6v1UkHrE2RUIVTilRGCkuyFhhD4dRyOUijul96GP561xavot25rMkohlunoIyTG
         m0mjjrL27uMbJnlW58By1WWdHWi51tWC9M5vRA1pChMJQSYqMuFgTP2FbMo8F2YAKoRI
         0OoTAxy8pIMpw4a2aQUH1yhhEJ5Oo4/ez+ltr8LHLZquWRp0EdAjBSg90fnox37smHfQ
         eHhkJ8iFdclTwJeLT6Ce3Z/B4bya1rgdpiDSj2Z1USzL3W4r+Jwe1CQ6tOVCdtE0D/EN
         hw/CMyKeq+G18nITQIbltERzcQz2klRFCN9VtgA/zZjZOx21wj4fkpe/tRbUOQZjoKKw
         oxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510122; x=1795114922;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BWRXYU90cf54hfF6Vi8cEaIhhQPo+XnQGMy56cYcVI=;
        b=Bc+kKe/ijKy2uktkSH192MMA2xkHz+XjF7poRHJl6lHjNG20uwCvdVYfAGizu/+BCC
         amYRFKl4P5dt24/6QNyyq+oIH8JiIk079d1vBppY7M9xQ1CyGBIgCg5PL/NB+RSvrXWn
         PWaJa/y2yHDnp4kjcwmDYiknSJJLkYgYB+KB0OBiVOw8jMoYJ+fAiDyHarQWsnC5HMFZ
         bp8+wLT8zv5+hedMsx7WUSRr+/bHNKFhaAJJY0JBulV4QbP/65jtbWQ0nwbvMDhQJG0t
         ksjBK/oruas9230qOQEA75A5XbwR+6r2zXhyFYSEKws7y+8RWug9WR1xbcFIo4l6DdAN
         7FpQ==
X-Forwarded-Encrypted: i=1; AL+hErGJLWbC5erTELufk94snsFKIvHhJaZetBY/DcFWQvLaoEazbRBS/9LS/ys0Yd2F5l4yuXglPkqZNooAEIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zwf8spnfFVuL0ooZkgwYiVFoaYTdaSKve9DO7OZPz4OPyg4Rh
	LpSPuQtkNaxNikAw9lzOWvAhnqHQgYY3nv7WpUDg5fLFFCEwVUWasj5uyoR77fvJUIzM3JNTYa5
	pyMbP9Tch+wl7tA==
X-Received: from ilej14-n1.prod.google.com ([2002:a05:6e02:620e:10b0:518:96aa:6d6a])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:1b08:b0:4ad:5ca8:dbf7 with SMTP id 586e51a60fabf-4afded4d142mr577391fac.0.1794510121626;
 Thu, 12 Nov 2026 11:02:01 -0800 (PST)
Date: Thu, 12 Nov 2026 11:01:58 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261112190158.103091-1-jmattson@google.com>
Subject: [PATCH] KVM: nSVM: Add CET shadow stack MSRs to merge_msrs[]
From: Jim Mattson <jmattson@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Yosry Ahmed <yosry@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When shadow stack is enabled for a vCPU, svm_recalc_msr_intercepts()
disables interception of MSR_IA32_U_CET, MSR_IA32_S_CET, and
MSR_IA32_PL{0..3}_SSP in vmcb01's MSRPM. However, because these MSRs are
missing from merge_msrs[] in nested_svm_init_msrpm_merge_offsets(),
their MSRPM bits are never merged into vmcb02's MSRPM, and L0 continues
to intercept L2 accesses to them even when L1 disables interception.

Add the CET shadow stack MSRs to merge_msrs[] and bump the size of
nested_svm_msrpm_merge_offsets[] to accommodate their MSRPM chunk offset.

Fixes: 38c46bdbf998 ("KVM: SVM: Pass through shadow stack MSRs as appropriate")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 6298160458bc..1299fdadeb73 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -209,7 +209,7 @@ void nested_vmcb02_recalc_intercepts(struct vcpu_svm *svm)
  * Hardcode the capacity of the array based on the maximum number of _offsets_.
  * MSRs are batched together, so there are fewer offsets than MSRs.
  */
-static int nested_svm_msrpm_merge_offsets[10] __ro_after_init;
+static int nested_svm_msrpm_merge_offsets[11] __ro_after_init;
 static int nested_svm_nr_msrpm_merge_offsets __ro_after_init;
 typedef unsigned long nsvm_msrpm_merge_t;
 
@@ -238,6 +238,13 @@ int __init nested_svm_init_msrpm_merge_offsets(void)
 		MSR_IA32_LASTINTFROMIP,
 		MSR_IA32_LASTINTTOIP,
 
+		MSR_IA32_U_CET,
+		MSR_IA32_S_CET,
+		MSR_IA32_PL0_SSP,
+		MSR_IA32_PL1_SSP,
+		MSR_IA32_PL2_SSP,
+		MSR_IA32_PL3_SSP,
+
 		MSR_K7_PERFCTR0,
 		MSR_K7_PERFCTR1,
 		MSR_K7_PERFCTR2,
-- 
2.56.1.703.gf848ed807c-goog

