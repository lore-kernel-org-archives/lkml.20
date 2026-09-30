Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D85218B0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789866; cv=none; b=VqpRSqZ/Y1G6guva4LNnbEkIpyNvxbhew8hDW9duO170hzTSWXRqAw7DU/Amswca03ABzSUf5cfzm9YnEevowrmxQ14otshCMGUSFFHZajwHWifPmHLQwJRb4jcCtMKXL3B49LN88uQLADrmjbA0ExErc1Adt0n2k906UhudNRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789866; c=relaxed/simple;
	bh=0JOwBc99J9/9qmxWmTiXCeWNmLRggQ1H5uYAvG+hNl0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GAZ4pU+LsVKy0fOsVehHH6+23Iqm3spANaEFAaTcFu901XOXjRJO9D9ZhcL01sWuzmq9IodFwSl/KcPaQ3uxVJ1+LnthrQd2W6a+8/S5tKalfYi5lFJBNMeRsqYz4dsGDaiAq7CrXndBjabXegflgr9rjQl1hZ0HI0U4lWlHoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YL48TYCC; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YL48TYCC"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8c152622so37315725ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789865; x=1791394665; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GmNmDWcyjlu/BQcLFlm+7ZVraxBuV3+MA+EDK8nxdQU=;
        b=YL48TYCCGPNMV9yQcipy213jFeu7gVdDVJtUpoJiUGDjNe36R5dGnmAQk6KkIj46o7
         P6Gdoj+WeRKzBB6ojgw3m0hC/StxaPQgp4IL/wc6dA3pY4ALflm2lEfE0oiW/6X67egt
         PFMcN7zjMx+BnpMTzr18nRGktQT+W5onYvRgXbk5MnYXrKem9b0oow5ye8c4RIgk03DB
         D4rOpeqkHQW9ZKTVYw6ahEItKIQ4dfhvMC8xxT4REm4pX1GE/SATdYlCxk/Ar9tpr6Yy
         arPWhywlu1x6WDUS2ZV2uVlcZvm5NCXzV4ZVYpofvn8kexERcUxqOMyrSteHjywuCNSL
         qkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789865; x=1791394665;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmNmDWcyjlu/BQcLFlm+7ZVraxBuV3+MA+EDK8nxdQU=;
        b=B3i1Qmn0IERQGuf1ru0u6oiuSQN8q2ElVJ6l9Xrak8wcDt6oHyTw+OjQai3gRa2bOZ
         zPTNXPEKaJftpC7mHo4wEmxz0NOs5NQPhxQ5oPQl3+yz6795L76lze1kYjVAo/jHCqJA
         gPSFewTnuKtzjN3spurSSPG4Cez1dVbtM5KEH33E0lBqwi+NwXA/lQcSPwUtpbfNCiXr
         ZzIoMwfv2hnvGyecDX3rgC+I97yU50ReFEYKdLwGYQDQsjQ/hgqY/mGXvOfS5zzJ7gQO
         a0WeCvlIPWCeBqExn/BrqFZSnlKTgATQUFHfeaec/g4FtPyqnE/oSkSL58nWPKONNt8X
         9uDw==
X-Forwarded-Encrypted: i=1; AKwUvByG2Vb5x9sQ8/zAY+q36myqAXp2HXgIdSzcd4+bTj3bIreRqLc27F8IBfDbTRPDIM6ZxzgQRl6sK6jNAh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJaZws+ZvC2FZxouAdyo6eFaXdSt5S7XsHjX/A0bGTZNZyGTwQv
	4YNLA9kvt1i4Xebsxvi06GNPdQhITQVsqmcPXzAnZaYeA9usJ9z/iPswTUL+amGF1RULnbiKrF3
	YSSJXrA==
X-Received: from plde18.prod.google.com ([2002:a17:902:d392:b0:2e2:b642:f52b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b66:b0:2d8:d4cd:dc8f
 with SMTP id d9443c01a7336-2e2e4a0114bmr16404135ad.18.1790789864215; Wed, 30
 Sep 2026 10:37:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:20 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-7-seanjc@google.com>
Subject: [PATCH v3 06/21] KVM: selftests: Drop unnecessary use of PRIu64 in
 nested TSC scaling test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use a plain "lu" instead of "PRIu64" to print u64s in the nested TSC
scaling test, as KVM selftests are 64-bit only (and supporting 32-bit x86
selftest would be an absurdly large lift, for something absolutely no one
cares about).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/x86/nested_tsc_scaling_test.c         | 21 +++++++------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index 052ddd61482d..b8b2217b9efa 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -41,14 +41,9 @@ static void compare_tsc_freq(u64 actual, u64 expected)
 	thresh_low = expected - tolerance;
 	thresh_high = expected + tolerance;
 
-	TEST_ASSERT(thresh_low < actual,
-		"TSC freq is expected to be between %"PRIu64" and %"PRIu64
-		" but it actually is %"PRIu64,
-		thresh_low, thresh_high, actual);
-	TEST_ASSERT(thresh_high > actual,
-		"TSC freq is expected to be between %"PRIu64" and %"PRIu64
-		" but it actually is %"PRIu64,
-		thresh_low, thresh_high, actual);
+	TEST_ASSERT(thresh_low < actual && thresh_high > actual,
+		    "TSC freq is '%lu', expected to be between %lu and %lu",
+		    actual, thresh_low, thresh_high);
 }
 
 static void check_tsc_freq(int level)
@@ -166,7 +161,7 @@ int main(int argc, char *argv[])
 	 * variable does not work.
 	 */
 	l1_scale_factor = (kvm_random_u32(&kvm_rng) % 9) + 2;
-	printf("L1's scale down factor is: %"PRIu64"\n", l1_scale_factor);
+	printf("L1's scale down factor is: %lu\n", l1_scale_factor);
 	printf("L2's scale up factor is: %llu\n", L2_SCALE_FACTOR);
 
 	tsc_start = rdtsc();
@@ -174,7 +169,7 @@ int main(int argc, char *argv[])
 	tsc_end = rdtsc();
 
 	l0_tsc_freq = tsc_end - tsc_start;
-	printf("real TSC frequency is around: %"PRIu64"\n", l0_tsc_freq);
+	printf("real TSC frequency is around: %lu\n", l0_tsc_freq);
 
 	vm = vm_create_with_one_vcpu(&vcpu, l1_guest_code);
 
@@ -207,16 +202,14 @@ int main(int argc, char *argv[])
 				break;
 			case UCHECK_L1:
 				l1_tsc_freq = uc.args[1];
-				printf("L1's TSC frequency is around: %"PRIu64
-				       "\n", l1_tsc_freq);
+				printf("L1's TSC frequency is around: %lu\n", l1_tsc_freq);
 
 				compare_tsc_freq(l1_tsc_freq,
 						 l0_tsc_freq / l1_scale_factor);
 				break;
 			case UCHECK_L2:
 				l2_tsc_freq = uc.args[1];
-				printf("L2's TSC frequency is around: %"PRIu64
-				       "\n", l2_tsc_freq);
+				printf("L2's TSC frequency is around: %lu\n", l2_tsc_freq);
 
 				compare_tsc_freq(l2_tsc_freq,
 						 l1_tsc_freq * L2_SCALE_FACTOR);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

