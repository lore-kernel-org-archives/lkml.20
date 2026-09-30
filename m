Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20B5208C1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789865; cv=none; b=cgvMNf/LyRADThcK/oANeLa/BE1egas5FKOxq5pqUNsMVPHFhPqQpk0KVqDazKsR1EU0DTCHtRf/9o/iNJA81pbTJkha3JTJUCDaph3I7updDuIffX0p5jyW5Rt4Pn6h9+uVHr3hqjyp+ODi4bNgXxJoCPYYa0wgeqTrvLxAhbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789865; c=relaxed/simple;
	bh=EtqsL1+vNDxs29Q9F7tVM8xdGOx1NMnji7TIBUq28tU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d+YzHRTjYaxEoUStg6wXj3gnTBjndBEypYbAKY94KZFuoLz22/1sdWS1aEIWEBncwslqDHA49Wer7rlDS2PdaJHrgZAu/eqSiQh6dLAG4IFB/K1tIPmVABgt6Q+flm+1I3tG7XQ8kYOB1d1lEfqoJPqHq1h/ADgW9WeEsrMrcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GLYvATP/; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GLYvATP/"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso59229795ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790789863; x=1791394663; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wJP9NO4MIplXFkPX2lQCT+TBKVBKXNt0aHtY948KD5E=;
        b=GLYvATP/lD9XQe7vzFo9gpCqUEcdCKfcrfO7T9bJlVYtbRtTwv0X61pFvvKDzZCSC3
         jjL/A5AkXO+5XJ7GyxM15OuICtBwgfUjx4NFIwNKdrE3Vc8hw2A86d57hsa8POPwPIBF
         ZoIjJzljwQzHNHIxhwpdwxkh6lKZT7B5Mz+zkmuwPIYQhWVd1ZmBQwmpXQiACDhxr/mT
         BGBWuoIuzPUNfku3Tt3bXl6/GIVduEuA0674emom+CDliNN6EKYqEzK3P9QFQb1NkeYk
         2gFeYz0k9PSoEvOo6L5nQpvLFMyVkwpfzUr4bJKnWzh+hNfDHmpuikrYunilPT5+aodi
         ORjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790789863; x=1791394663;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJP9NO4MIplXFkPX2lQCT+TBKVBKXNt0aHtY948KD5E=;
        b=eKnrK/oLYA50BPQ9BxizRj7WKMkN6FqVqSbRcvtWy64jjF7fj6lsUIMV9rztWRr5ku
         yfJd5xfr1PJM02kTh8JT339rF9smm7jAWIDMtv6c52p3em4Qi01gw9OcrojefiXBoUqr
         yfC5qCydKH4/n0J+EuffGB2PTxivpKfUWm+2xICZcfBeE3AjPNAD7d/YZ2FqNTZdj9Kp
         JEMCxKVNNz7njNY547P843Ip93CWLYRBqK/d9JpDyTg93OcTHxJl3FGOXPeFs5IIqkes
         cp2Wn01z2leC+qZeajDUJUkyNuwNunXxsxapVnWlnWCB9UCpeVsifupRj0XtCeFG1aJb
         F0Eg==
X-Forwarded-Encrypted: i=1; AKwUvBytf59/f/u2yHbGvgT7AcuWOgclzTEoTkNJjfEOMOrDJLw7XL6MlK49Ox9pUEzCU/jImWBBg7Se9CY51Ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwgWYYJI0wNn08a5M5Xfaa8GYYMF2GKeZFmguHIPZL4eXLUw5A
	i8RxX1DiT1+OphPNlBkhPSDXJ7qw9/uhDVa50k2nZq13pIlEDZDG1lSAnl7fMK0fkAJLHM+YuE9
	S+BovOQ==
X-Received: from pldu5.prod.google.com ([2002:a17:903:1085:b0:2e2:dc47:ec95])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce90:b0:2df:9eb0:761a
 with SMTP id d9443c01a7336-2e2e4a25a1bmr16802785ad.25.1790789863012; Wed, 30
 Sep 2026 10:37:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 30 Sep 2026 10:36:19 -0700
In-Reply-To: <20260930173635.3362655-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930173635.3362655-6-seanjc@google.com>
Subject: [PATCH v3 05/21] KVM: selftests: Drop redundant VMWRITE of TSC_MULTIPLIER_HIGH
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Amirmohammad Eftekhar <amirmohammad.eftekhar@cispa.de>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Drop a redundant VMWRITE of TSC_MULTIPLIER_HIGH in the nested TSC scaling
test.  KVM selftests are 64-bit only, i.e. the full 64-bit multiplier is
always written by setting TSC_MULTIPLIER.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
index 65de46f80a3e..052ddd61482d 100644
--- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
@@ -122,7 +122,6 @@ static void l1_vmx_code(struct vmx_pages *vmx_pages)
 
 	vmwrite(TSC_OFFSET, TSC_OFFSET_L2);
 	vmwrite(TSC_MULTIPLIER, TSC_MULTIPLIER_L2);
-	vmwrite(TSC_MULTIPLIER_HIGH, TSC_MULTIPLIER_L2 >> 32);
 
 	/* launch L2 */
 	vmlaunch();
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

