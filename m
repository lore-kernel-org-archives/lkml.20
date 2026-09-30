Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE30E579810
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789886; cv=none; b=tCZcE7Rt5oyNfPiLKTmdkYqVfnlyXF2ApNxkfjQR+yXSjHOD+rup+BUAbLeBO6cftr2xbrOfan8hFHZa+ZA52ZA0YnwtOZrthmbc6CtMy1vfhLT4yMZlK9biS1ww9VN5LfeUop2pK+XnFKOSdpLdyIWKMNt1MCV8ziC7VrpHOBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789886; c=relaxed/simple;
	bh=PCsAes9YduMhzed8wkdNcMKAaJf82bjX/v1w5HQ4Yro=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qz0MDw4+ShOlIgT1Hw8YGxUPTtP0K3tyoslgqYkJNyaZadO1sp4IlCjjvJy3aFGqQAJWIfRZJU8a74+mVdbF3PLhqXiydC5QtuxypgydEeVUoitJCs0hTtZmLA53fwfrB21XfMMt8fd2OcId/NgnbSQb2wxdjj9l7ZWJtH4XKfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uITgf89n; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uITgf89n"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so6629662a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789884; x=1791394684; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=i6I+iTzs4XJq8YgwYXk7euKBuLqtuWEuYafyq3RrSa8=;
        b=uITgf89naUvOE6YbV7LArDsC8CWEJ+USft8MHHoRjkuQbk3QQh2S7YWbIHQmbWV7ji
         4Mjksb3V9jSOR49C9hl2htmltu83uGBtlk2z+dTyqj+MfJrcioE5k/3dSWAbabjb6rXI
         dWVGnJNL7ENTdCRbozhYL8HMwBZgZ8upRCx//6e0fzcdPD7AZozgABW3zbZmy3PXzh6S
         NXO/ZMSvv8o62DMAqpBDZzdFt5EXrJgg7tAuOTBF5f0fWVr53/+roNopsBMxbEAEr4x0
         r/KwA1tJ0rQdu8wz48KDKZvi+d6X4CMqQrTCVJjapeyZ+PXOwAkarNAbqhgVsNNipX/C
         jshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789884; x=1791394684;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i6I+iTzs4XJq8YgwYXk7euKBuLqtuWEuYafyq3RrSa8=;
        b=LtTqXCB6WZTNWUZmTScnDcxjipy1unNGQdSMfbVIcNbRr7F8qcLhlnxhiYE6reyr6t
         wO0TlkRLQgbFhbhgB7Auj+rc4kUkna+p24qleBoYX6TMt1r4TfynZty9Ng2pyuptzLPn
         5j+1rJqwJbtbyFXHXy1eiYLgumORDBbmQzn3H6V8r7dIqlGYMJVmSUmWKJ06hHFBiOzl
         4Km0YUrd0UEITG3TEUzDKYMObZ7y52G4nipzJwYZN7j4g5uxPsl1KZDhd7bWdOSVttjb
         QpJgOBrM8Oj0YBPb+EdLIPK1X+4E58nZY6SaY97w0le37kFGpnr811c/fGVDaDl++C6K
         g3qA==
X-Forwarded-Encrypted: i=1; AKwUvBynP1/dHQu3FVtxKGLqOUrZXX2583SK7SFw73Jm0RMpcAttJPvCfk0icRypjMxPvJ9eW0bx1v6AUbmsZeQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl9ESqiEM7bFuOPI7ZM4g96w7eeeGr50+Wpu1e2C06B7hEsvkk
	mFz4zrnZ/4UFLGMfYIXBdqF+mg48hhYWg8MVghCCfnK5O8hPWYUmvBYXqzo2JylTMuwDZfcz6Fh
	X12zFtQ==
X-Received: from pgbdo5.prod.google.com ([2002:a05:6a02:e85:b0:cc6:d405:8595])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c8d:b0:39e:6a80:b793
 with SMTP id 98e67ed59e1d1-3a4d18a6242mr1882260a91.35.1790789883769; Wed, 30
 Sep 2026 10:38:03 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:34 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-21-seanjc@google.com>
Subject: [PATCH v3 20/21] KVM: selftests: Use GUEST_SYNC2() in nested TSC
 scaling test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Use GUEST_SYNC2() instead of open coding equivalent functionality using
raw ucall() invocations in the nested TSC scaling test.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index be6246c20d7b..b21f79e9ec71 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -18,9 +18,6 @@ static u64 l2_multiplier;
 static u64 l2_offset;
 
 enum { USLEEP, UCHECK_L1, UCHECK_L2 };
-#define GUEST_SLEEP(sec)         ucall(UCALL_SYNC, 2, USLEEP, sec)
-#define GUEST_CHECK(level, freq) ucall(UCALL_SYNC, 2, level, freq)
-
 
 /*
  * This function checks whether the "actual" TSC frequency of a guest matches
@@ -52,12 +49,12 @@ static void guest_check_tsc_freq(int level)
 	 * be good enough for the purposes of this test.
 	 */
 	tsc_start = rdmsr(MSR_IA32_TSC);
-	GUEST_SLEEP(1);
+	GUEST_SYNC2(USLEEP, 1);
 	tsc_end = rdmsr(MSR_IA32_TSC);
 
 	tsc_freq = tsc_end - tsc_start;
 
-	GUEST_CHECK(level, tsc_freq);
+	GUEST_SYNC2(level, tsc_freq);
 }
 
 static void l2_guest_code(void)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

