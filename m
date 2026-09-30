Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902AC522F0B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789873; cv=none; b=FBHzRqMCU3zzYe9GE3Wy2Je7G1yswqcIW8MGoHrygpsuNT9qA3Ef36lZbpfXxjnUxuzJwwA3eFBDfBidboDqLeS//qqZ3SVC9TDPVNdouTyJjEMMF7vQfbxifoOQz4+E6M3xsBVZBkMgrCa0bRF9LsYpsuf/OUIdFwLmJ6NgUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789873; c=relaxed/simple;
	bh=kjukZolD96KuDd0nY/5GHT2SfgYd//WfgyCmV9qqfeI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DE9WsU8AR4NvRR+2aEQM4lTi+XvSyxEiXJFgMki/JJ72F1Y1k2U9P7cuxR5U3+To/6iSzoJLY+lqyiOOMxNuPTRb3VQB7JESy8/6rPqxCAPtiT0lAEiFwLJnbh/UA7TNiBcZtSJMzOOA5ko3xK+0cjvF1XR0yK2V04W+gt9IrcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AaIaJTck; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AaIaJTck"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db8e9fe9c7so57474225ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789871; x=1791394671; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KmZF8/8HksdBy6O3B1XNuw1zQJhADjplpyH5XbFzpnc=;
        b=AaIaJTck6R0WZ9QDLXj+A2YLwicXWI59ewG2gD8hnwFym6+H52klfhZWojaA9gV4y2
         Odr7dfZSfkt38l1NDEaLxMOsaZ9Stpxt6UkzxmABhNXx3wYdfB3/LVfP/8Qhxn7q4FYu
         fwBNypxHO3U5qQ910qwHXGvJqCuzxb/i20mIa70dOBrH+K2WZvG/r62KdRNvvxKQKQeu
         qwymV9abdDtoYwCMRFayZqHCPivJfyjTYlB0hFE7IPigtiMOVWnK1J1t02u6i+KZGUyh
         sGTrtqRp5vMpQPvD+6h/Vp85oAFkYPUYFoi0zwb3BJi/DF106Al7zJmbaSbn1JV5k9/4
         vjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789871; x=1791394671;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmZF8/8HksdBy6O3B1XNuw1zQJhADjplpyH5XbFzpnc=;
        b=Nxh/GK0PBQClfa4ZsggOrgw5HXmyhC0SZJNMyaZh+GkHYblAXBoduBZZ6bmkesuPcQ
         b0j/UCSYotBH5YqJOSFMKA5MEK9EQFQ3W+wbWHZtpuLC3E8zaU6xXu8HGXJQHABcNqN8
         7nAXm9ujvecpEyyJ8vAvqP836HxcGHSVUNTkbOzKqmwcIVPgnm33OaGdj/rzu9V7UWS/
         uY+jfkSEvxfV4PK/YW9UpK5mTJJ3GzcSsckV4vOdit+aZ+cTzw4j4RDegxorJ7OeGu3U
         1Qj4XAhY5WjTBtiHJvEKlOL5PjajdVLC8IK61LCkuBO5JPrEToBocA3k2lnvZio9cgeY
         O6OQ==
X-Forwarded-Encrypted: i=1; AKwUvBz373kbKhK1Hjl1Lgp1VI8McYC3BcH7ms/jKJi2xYgclFLkR2a/q97heh4UK3BV1+XOyuJZMG+Sy91kTCI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDCFdsW43kJMllwd5MQFfOhKwFMMDbw3gKasB+yJhqA0py8Uv2
	O8wTbjdjOr6UICOSwP93NnNJqI1NjXC+ciOSUQChTUW1DUrrcQDD4tZhzOV48Jc03Oa+xZZtQt8
	8N8w7Bg==
X-Received: from plhv3.prod.google.com ([2002:a17:903:2383:b0:2e2:dd23:fd42])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f712:b0:2e2:dff2:a37b
 with SMTP id d9443c01a7336-2e2e4a10968mr19037175ad.50.1790789870744; Wed, 30
 Sep 2026 10:37:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:25 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-12-seanjc@google.com>
Subject: [PATCH v3 11/21] KVM: selftests: Print out the failing L{0,1,2} level
 in nested TSC scaling test
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Print out which one of L0, L1, or L2 TSC frequency checks failed if the
nested TSC scaling test detects an out-of-bounds frequency.  Triaging test
failures without the level information is unnecessarily painful.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/x86/nested_tsc_scaling_test.c        | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index af85fd469ef4..8c96b8e501f9 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -32,7 +32,7 @@ enum { USLEEP, UCHECK_L1, UCHECK_L2 };
  * measurements, a difference of 1% between the actual and the expected value
  * is tolerated.
  */
-static void host_check_tsc_freq(u64 actual, u64 expected)
+static void host_check_tsc_freq(int level, u64 actual, u64 expected)
 {
 	u64 tolerance, thresh_low, thresh_high;
 
@@ -41,8 +41,8 @@ static void host_check_tsc_freq(u64 actual, u64 expected)
 	thresh_high = expected + tolerance;
 
 	TEST_ASSERT(thresh_low < actual && thresh_high > actual,
-		    "TSC freq is '%lu', expected to be between %lu and %lu",
-		    actual, thresh_low, thresh_high);
+		    "L%u TSC freq is '%lu', expected to be between %lu and %lu",
+		    level, actual, thresh_low, thresh_high);
 }
 
 static void guest_check_tsc_freq(int level)
@@ -186,14 +186,14 @@ static void test_tsc_scaling(u64 l0_tsc_freq, u64 l1_scale_factor, u64 l2_scale_
 				l1_tsc_freq = uc.args[1];
 				printf("L1's TSC frequency is around: %lu\n", l1_tsc_freq);
 
-				host_check_tsc_freq(l1_tsc_freq,
+				host_check_tsc_freq(1, l1_tsc_freq,
 						 l0_tsc_freq / l1_scale_factor);
 				break;
 			case UCHECK_L2:
 				l2_tsc_freq = uc.args[1];
 				printf("L2's TSC frequency is around: %lu\n", l2_tsc_freq);
 
-				host_check_tsc_freq(l2_tsc_freq,
+				host_check_tsc_freq(2, l2_tsc_freq,
 						 l1_tsc_freq * l2_scale_factor);
 				break;
 			}
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

