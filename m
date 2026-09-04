Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79547175A8A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 01:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788483838; cv=none; b=h7zBNcEIBX5mcTfLRgnfG+7SM5HupvdF0d3DIvG4YGe3Gb4pgAH6CH1DbdDzde5Dsbaj6In/wKHxYrUU5tAi8/WYLzfakmQxA1VWcDIa+J5fFWENH1AFNqNB0JZC6sMzlTd0OBIkQVtEN0K3phg2ROxtZXCPqSk+fKmq3F891HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788483838; c=relaxed/simple;
	bh=vdDOmhyTdL3/T+cUm/B+tgP10dz8metO6J41MD514SE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s2BArWnVfMKUBc6QKooeWMm53ZBdEEi6E3A51JwzB/SSf9GBEE6amPKBbeXZoymFM67Y1065SimYpA6/4q0InwIZ++n1fHn2dTZdmaY948OPaz+DwJs76mhqt+5ExyTLAAroszK3C7MqoX37EueBBlB7GOI91vLFC5Ho8WI97p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t6vNVbgJ; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t6vNVbgJ"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-854f274dd69so239071b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 18:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788483837; x=1789088637; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TgaSozLRQmRkdK8Evd2A6YoYaj7A8H5aikOfjM35Ajs=;
        b=t6vNVbgJlTSx3U/JBUjDsbfo4RQ4f2JfMueVDIRWTtwVVYh5bxzX1WNhnvtewHamhM
         PlhYGoY/epStSC8uoG+H9Y13B59eNx5K6F5052xlvOCKy5JhMSsx0nVEpiD9lHMgZGEO
         mm4nyZqtGXCkHkLItjIN0bzqd1orBZf3cFNbRuRz9LUWA0h9NX5r/Vu3+WzhVmCR3G+5
         BDRBNhKIJGpNJ9aV957ZTWmnVLAAPo1KDvY+Dk2/iG1i0qm0nJihDB5shD6brhwGnl7H
         ur2qctLin2aU0FwBDpLs3OjsArQ99fj40HpvB19MTFQyJR4wana+1iI1QWIoRgad9Jcu
         idsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788483837; x=1789088637;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TgaSozLRQmRkdK8Evd2A6YoYaj7A8H5aikOfjM35Ajs=;
        b=T5SMJ0V9aGbSp5OBBOURB61XE/jVko3J0NAKu1Yb6diRliRoJd6vtehpZ8ysPjKnxc
         3WKZXR59zOjy1GHcm+ueicEUY/7F9Ui4fyf4w+uBrQ/fIAFj28D4lFOu0rysVML70Ubc
         ZfSbSz8y0HqgNMCFCk+pdwgN+KRuZjpb4xBkhdNBg7snJBG4zWrNja8SGDtda6b4l+DV
         b+KjoOHBgwgbuwrpNncuyQm9LbE+avLCiKb1/eRNe/wYntOBgbwPxVs8uzVHiaj1z2EQ
         Q9UZQhAkgpgPyJJtR7j+DTtKkmUj0AxogN1tu89QqTpD2Q6CPHmoNv2x0dJDlT3aXi5L
         mCvA==
X-Forwarded-Encrypted: i=1; AKwUvBxvRrwd3Fg4/QD+ohoUpmkBpStW7YXkAtjs16ZrP6+xQrlBbVp3au4pMI/EzXlCO65pWbJuWwLvAs6R1Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++m//em6qjuhOOtRyUK7et0GWlbfN1syuVflRnXNSUiyosEn/XwV
	LuzgqDKWbdKWp4s5f5G2LPOLddoRdv9V9G0nU3a24xDw5QaQUcQ6DQv2Ku9niwZpsv+AvFG+Nhs
	pPWU0sg==
X-Received: from pfbfo2.prod.google.com ([2002:a05:6a00:6002:b0:848:569f:3464])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1151:b0:85d:84a5:b7bb
 with SMTP id d2e1a72fcca58-86168d8c2fdmr3602732b3a.18.1788483836443; Thu, 03
 Sep 2026 18:03:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 18:03:46 -0700
In-Reply-To: <20260904010353.3175819-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904010353.3175819-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904010353.3175819-2-seanjc@google.com>
Subject: [PATCH v3 1/8] KVM: VMX: Disallow using to_vmx() in common VT code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Poison to_vmx() in main.c and posted_intr.c so that attempting to interpret
the vCPU as a VMX vCPU will fail at compile time, as opposed to failing at
runtime, or worse corrupting state without outright failing.

Note, to_tdx() is buried in tdx.c, i.e. isn't broadly reachable, and so
doesn't need the same treatment as to_vmx().

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Tested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/main.c        | 2 ++
 arch/x86/kvm/vmx/posted_intr.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 4c52ab8d0786..ea0d825e556d 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -10,6 +10,8 @@
 #include "tdx.h"
 #include "tdx_arch.h"
 
+#pragma GCC poison to_vmx
+
 #ifdef CONFIG_KVM_INTEL_TDX
 static_assert(offsetof(struct vcpu_vmx, vt) == offsetof(struct vcpu_tdx, vt));
 
diff --git a/arch/x86/kvm/vmx/posted_intr.c b/arch/x86/kvm/vmx/posted_intr.c
index 4a6d9a17da23..24221ba553be 100644
--- a/arch/x86/kvm/vmx/posted_intr.c
+++ b/arch/x86/kvm/vmx/posted_intr.c
@@ -14,6 +14,8 @@
 #include "vmx.h"
 #include "tdx.h"
 
+#pragma GCC poison to_vmx
+
 /*
  * Maintain a per-CPU list of vCPUs that need to be awakened by wakeup_handler()
  * when a WAKEUP_VECTOR interrupted is posted.  vCPUs are added to the list when
-- 
2.55.0.979.g7e5102b832-goog

