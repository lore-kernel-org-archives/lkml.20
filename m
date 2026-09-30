Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD6C56E04E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789880; cv=none; b=BPLvXFOb6Mil6t6Rzhe7uTI0pbBOlz2OigCNR5g7KWPHrBshmoAxLt/ltY76gXI5cO5eFb6nMWiYyrdPlzKlkHL/ZXY06FwjWt0J2SmeUaTZ3GtVT75yUcGb5r5dx5L4ThV7YjRiAN+I89vc1xDo5GjBJHy1ds3gkO+1zPKDsyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789880; c=relaxed/simple;
	bh=9hmhRh5px9luXWmWWMKOvbRjwtNqfIreNzXiuFccn5w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QxoU+IO0gsGV00rHbIGF5YVHVAhAQXp9Ah50qJrPjRA4sflMOyeSUiF/g0oNKfGbxHj6dYNCNNfxqtO+V+/3anIFNBqJe3+e/U9uFOsm/fmXKYlyeVL/aeiT73skOVwv8rlkGlqJc4l3/RGW76fkaCdktbmTRkSPf7fHsxeN2O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1cPHI4R; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1cPHI4R"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df7bc60df6so43743795ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789878; x=1791394678; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T5zTpDjweE+X8PLXaV+IjuPf3lMfM65FW6kqCOR85kY=;
        b=T1cPHI4RiPxzd+uEeTcZALDaMNM5pcNs61p9NpGYnYD3h4uJdxp86Jdhqh65BGC0zs
         Jzau/LWSuOjRoT/ky9Q4FUj2Bpc87vEWmz6d6TbIFODnBwggO69uBFTJS5KkWloqvZ/r
         Ogl9D7qCE36BySR0oGlgmN/bTZ85VaK3PBo6ddO9IJ1pIZ52PyvXs6U1cywewQmYSBF9
         u41DAy+G6062rx6X2lz1vWV9uFOANAMeHoQtHz31raNrceeSWnVpMUnvKHvGke9s/Ir6
         56SWssJ2rEuHfagPCZSdZNdy/KVKEiXFvq2AJQ/DVUeN6HdGPmS1yHE3osE7pgPJApN3
         uALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789878; x=1791394678;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T5zTpDjweE+X8PLXaV+IjuPf3lMfM65FW6kqCOR85kY=;
        b=P6N3GDCXyHbPZnf8hxEBO29RxjCHzbtvRGXjvuQnGQRisro0retOOv9UkG71oQGi7R
         83a112c+5d3xUDktQdq+bZWLienYOgS9/rh8yU0EpPGqEVDmlq4vqWMsa8CgLXZg9XC0
         rNbv7fDf+einVr9M16kdN4Ck0BiHIM+C192u8y8c754A2IzqZzWMT4uA5kVPQH1mU3pl
         HqoWDWT6hZihXynubbv5oC7XlJ5rax3mvSgdOloy7gEtZ2RtZqj/mQgvSgA+aguAn3gc
         Bk8GCW3wOyLOj21+wij0fQKLm4HuyilHfOYu9fzhAtVyA4miTaDejl5Ct+CGDwYHcEkS
         2tkg==
X-Forwarded-Encrypted: i=1; AKwUvByKrW/Xr0q6cS7oyqLjfGQoXA+AtH7m6K0s0H6UDSBVkOUzjZ63s4hV03IT99AEfYvVhtSdJJ+gFKY89fQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEgfm7pojp1EgrEitWRE2W/KO9K/epGIoS3t4JVvniodgDCyMs
	b7D/SwtBHOsT8KfMKDoHjR0X+tRy0xZehVtcSJi3LE+YtKsJgNypkhA9TbXnk72oYSDRJ2Is1dR
	f9gbHTg==
X-Received: from plbg17.prod.google.com ([2002:a17:902:d1d1:b0:2e1:90d7:c716])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e884:b0:2df:ab09:2656
 with SMTP id d9443c01a7336-2e2e4bcdac1mr17967285ad.44.1790789877508; Wed, 30
 Sep 2026 10:37:57 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:30 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-17-seanjc@google.com>
Subject: [PATCH v3 16/21] KVM: selftests: Test L1 "up" and L2 "down" in nested
 TSC scaling test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Now that the guts of the nested TSC scaling test support scaling L2 down,
validate all four combinations of scaling up/down L1 and L2.  Ideally, the
test would also validate integer+fractional scale up scenarios, but
prioritize keeping the test and math somewhat understandable.

Opportunistically drop the stale file comment about the test's name.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c         | 33 ++++++++++++++++---
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index ee8fda310e33..1d578af393bd 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -1,12 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * vmx_nested_tsc_scaling_test
- *
  * Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
  *
  * This test case verifies that nested TSC scaling behaves as expected when
- * both L1 and L2 are scaled using different ratios. For this test we scale
- * L1 down and scale L2 up.
+ * both L1 and L2 are scaled using different ratios.
  */
 #include <linux/math64.h>
 #include <time.h>
@@ -226,7 +223,21 @@ int main(int argc, char *argv[])
 	/* Sanity check the frequency reported by KVM_GET_TSC_KHZ. */
 	test_tsc_scaling(l0_tsc_freq, l0_tsc_freq, l0_tsc_freq, BIT_ULL(frac_bits));
 
-	/* Scale L1 "down" and L2 "up" at a random factor from 2 to 10. */
+	/*
+	 * Scale L1 and L2 up and down at random factors from 2 to 10.  Current
+	 * CPUs have two full orders of magnitude of "breathing room" before an
+	 * ultrafast L0 TSC frequency multiplied by 10x will encounter KVM's
+	 * signed 32-bit limit on L1's frequency, and it's highly unlikely a
+	 * CPU that supports TSC scaling will show up running at 100MHz, i.e.
+	 * underflowing KVM's minimum 1KHz frequency is extremely unlikely.
+	 *
+	 * For L2, the frequency is limited only by what hardware can support,
+	 * not by KVM's limits.  SVM provides 8 bits of integer scale up, and
+	 * 32 bits of fractional scale down, i.e. can scale up 255x and down a
+	 * comical amount, so scaling up 100x and down 1/100 is well within
+	 * hardware's capabilities (VMX provides 16 bits of "up" and 48 bits of
+	 * "down").
+	 */
 	l1_scale = (kvm_random_u32(&kvm_rng) % 9) + 2;
 	l2_scale = (kvm_random_u32(&kvm_rng) % 9) + 2;
 
@@ -234,5 +245,17 @@ int main(int argc, char *argv[])
 			 mul_u64_u64_div64(l0_tsc_freq, l2_scale, l1_scale),
 			 (l2_scale << frac_bits));
 
+	test_tsc_scaling(l0_tsc_freq, l0_tsc_freq * l1_scale,
+			 mul_u64_u64_div64(l0_tsc_freq, l1_scale, l2_scale),
+			 (1ull << frac_bits) / l2_scale);
+
+	test_tsc_scaling(l0_tsc_freq, l0_tsc_freq / l1_scale,
+			 l0_tsc_freq / l1_scale / l2_scale,
+			 (1ull << frac_bits) / l2_scale);
+
+	test_tsc_scaling(l0_tsc_freq, l0_tsc_freq * l1_scale,
+			 l0_tsc_freq * l1_scale * l2_scale,
+			 (l2_scale << frac_bits));
+
 	return 0;
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

