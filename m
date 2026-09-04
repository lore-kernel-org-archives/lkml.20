Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230C7248F7C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788481478; cv=none; b=GdaHt0fv2HhXCAHPW8/jHeIVPmBGw2Un03/G6xuwJ/mYsGBYVC6XaUpAMzy6e1zCzlLmRbFl23Q0JT7dtUNwxMA5yxSqteWyppFoCwCOHauZXK3NNl+6mAUflNJPDtQ7133q/Ici3J1dQkXtYRDoadPZj7ptNnZTmVXzWDWAYpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788481478; c=relaxed/simple;
	bh=zXd5X55+TiJnkrJw6tJzRxUAJwCp93n+SWxvi5/Zx/E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=N1ga7USEbEFag9vSrfVxuvgBqTv3s+kYy/fxmdqggjjHnpTsNYiX1P6svKnYURLQUuxkGnYngtO/1F9+1mHWRLsTkAEOfiAmWir/O7AC4YgRDcbBB2WCNy1ZwhCxrebwrpcFPfqUlf3qENelX6fxQOoBr5nUloEtymenXDZo300=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d/xhtsIf; arc=none smtp.client-ip=209.85.216.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d/xhtsIf"
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso723623a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788481475; x=1789086275; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=907we4nZ8HxvlT+POuzPHkcKY9uyEq/810sd3j/s3UI=;
        b=d/xhtsIf12jSgcDeDr+ygm5tQ+mLVA/z61lVc1REfIvsSA4pAV1EOkHTs4kqRFb9De
         zflYvDonYVj0H1Zol/99oOUZNpyI4jeYfTOaZ+TENc0ies4MYmqhbRYbTnzv1wwkcmqa
         PxgXMT9nRCkRPfWoq579jldUvnpft7vHfLiy0wJPs2w+fpPywROFOzXzrLhQIm9JzskS
         /RVBkqy0mx/3Z5forDOauEqKWkVPIINMmqKRB/HzYvCQxWVthL1bHorsH1Td/EhSlfZv
         kNM1QtlyduC26ZLli4hoFr2XNuFrR2OKXw/APKYzPR0EROgu9cxvURBtB8NIijskJqE1
         J/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788481475; x=1789086275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=907we4nZ8HxvlT+POuzPHkcKY9uyEq/810sd3j/s3UI=;
        b=r1F/BoZDNBf8VoTQawOnJAwBRlXaSStPZhFh1QqAGQhx8MpyYYreKHHs8Ngmf8FZuv
         N8/4/uYQdAaTn6VOuZNLiYdScnQqCu4/XR25EtA37Ke/kHl05Ybsd2pI3rBcoLJt0c5I
         sqBYvy3SDnHAtviDntxVTAR4hpaoySS4vRHcb6N0TpqA7meOW+o35nrgAlwtGN9iGLG7
         TQiCAmJwNYusyYU9KICxluoYNG31cpkyQ5BWuPUcO0RrVwu0CuhQB3h92oAetyIM8lz9
         ugum0hEJccSbjmJI+IQRlNDD0cEQ+WHSVsTuy55TLJE6wJsh+TeWM+nY5SQ3QaMI9li2
         LbWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzduO/ZrNOxu1vF1hOR8Y/NvTUdRByAsCTnWBEVJciP3AZrV+mY0OURbic145bTnAkOeJMryfW+bj1SHeA=@vger.kernel.org
X-Gm-Message-State: AFuF++lIricqfEGMGUllBSME1IZ6J2fQ6Kv0SFAAC5+qJyU+Vfy40zjZ
	io94PrWVDcFyaqleDU6dDFwzDJucOvVtsyRy8jJxMfznYiKFXgoIbpt0j2CAO3sGqRbX2qzvKiq
	fxune0g==
X-Received: from pjli19.prod.google.com ([2002:a17:90a:7e13:b0:38d:b62f:5045])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51c7:b0:398:e73e:5a0c
 with SMTP id 98e67ed59e1d1-39b2609f34bmr3601202a91.1.1788481475060; Thu, 03
 Sep 2026 17:24:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:24:14 -0700
In-Reply-To: <20260904002423.3154436-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904002423.3154436-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904002423.3154436-9-seanjc@google.com>
Subject: [PATCH v4 08/17] KVM: selftests: Always assert that vmclear() succeeds
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, f734222792@gmail.com, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Sashiko Bot <sashiko-bot@kernel.org>, 
	Yosry Ahmed <yosry@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Continue removing dead error "handling", and assert that VMCLEAR
succeeds instead of forcing callers of load_vmcs() to assert success.

For all intents and purposes, no functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/x86/vmx.h | 4 ++--
 tools/testing/selftests/kvm/lib/x86/vmx.c     | 6 ++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
index f7ca6646dfbe..cf37a03a93b9 100644
--- a/tools/testing/selftests/kvm/include/x86/vmx.h
+++ b/tools/testing/selftests/kvm/include/x86/vmx.h
@@ -326,7 +326,7 @@ static inline void vmxoff(void)
 	__asm__ __volatile__("vmxoff");
 }
 
-static inline int vmclear(u64 vmcs_pa)
+static inline void vmclear(u64 vmcs_pa)
 {
 	u8 ret;
 
@@ -335,7 +335,7 @@ static inline int vmclear(u64 vmcs_pa)
 		: [pa]"m"(vmcs_pa)
 		: "cc", "memory");
 
-	return ret;
+	__GUEST_ASSERT(!ret, "vmclear [0x%lx] failed\n", vmcs_pa);
 }
 
 static inline int vmptrld(u64 vmcs_pa)
diff --git a/tools/testing/selftests/kvm/lib/x86/vmx.c b/tools/testing/selftests/kvm/lib/x86/vmx.c
index 03d61b1159f8..57a8287de0d2 100644
--- a/tools/testing/selftests/kvm/lib/x86/vmx.c
+++ b/tools/testing/selftests/kvm/lib/x86/vmx.c
@@ -170,16 +170,14 @@ bool load_vmcs(struct vmx_pages *vmx)
 {
 	/* Load a VMCS. */
 	*(u32 *)(vmx->vmcs) = vmcs_revision();
-	if (vmclear(vmx->vmcs_gpa))
-		return false;
+	vmclear(vmx->vmcs_gpa);
 
 	if (vmptrld(vmx->vmcs_gpa))
 		return false;
 
 	/* Setup shadow VMCS, do not load it yet. */
 	*(u32 *)(vmx->shadow_vmcs) = vmcs_revision() | 0x80000000ul;
-	if (vmclear(vmx->shadow_vmcs_gpa))
-		return false;
+	vmclear(vmx->shadow_vmcs_gpa);
 
 	return true;
 }
-- 
2.55.0.979.g7e5102b832-goog

