Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E1E44CF37
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764386; cv=none; b=uYFplTfUkPzWZm0MWeTcI2LISwFcDNRUVb5fuuFovo7SapKWgkBDNq+QsykO/IfNcuJskmgWeMkGtLt+4YfXHNRrxn+BWBtOEtC2tdByCK4jHzsqmifrAiOB927rEoJ+0eKpzbQz3we9+FhdTZvfB2s6R9T7kVCwVTJeROwL4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764386; c=relaxed/simple;
	bh=cKAhG59+Iq84FY0AbDSTajeiuMFZn2chwTWn175Vj/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=slsmkabM7wYrrEYHcSjkzFV+LR6jmiofVJxIkJbPToD+ufiy1TC9gPkeIhe6Qw7BEOzDf6jH8pTCST1M9jqbxfXaJO07++AG2ubkKGK0gwzUmIyg8kRNHYyLam+4Q8+M26s3iX6oECu9OVix15F+3bEOBv9ArQa+GzrG+JAT3O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PiAX40uW; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PiAX40uW"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1513106a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 10:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787764373; x=1788369173; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dhx91tSB6ociAKcQKQZdcjUCezd51Vy1x/2McQZk6Qc=;
        b=PiAX40uW4NQBCMnGivNybQdTm5BvwREYNPVXbIRgoGitLTQbeMBAFqcxVDkes5Y0nA
         bXSLU8hrIGWvdxIH4YMNkz/sBFoHsL0FehbjSJsUamAZGfwBN8QI8n2UuJOaYZijFODi
         DNt6GQeNYWyRemjZKG/EP3D9aCuyvZOPQmw/qQc0ppL1cDOw7nhP/d+U9bP8acnPC4n+
         kDy+Q0VeFY3VJZ2vJIP8HFLBkWMklATjA60QDzJiAEnCPkW03RtfRjxeSgY8STTEG2Lo
         6e+aruHxACNBkMm1wlTR7/nUZZ8q/Tpux27tsZpXH+tnWRvWaDkPNpD9ucZrE9qLeO5c
         2hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764373; x=1788369173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dhx91tSB6ociAKcQKQZdcjUCezd51Vy1x/2McQZk6Qc=;
        b=GdOq1pU1COGwNcznRba+Qa+WTqa6UXBKMB9j6J74l0XhCRgjCqfBxmCuJE2/r5uDnM
         jZ5XE8loBG+yiUo1WN2B47OkFUewhVlpiEvUdp8lC3BO6OwqHuF1S+F+aAQ6sUo/4Hv4
         yu5BMDLTMepseCo4ogqgUV5QsQQfpfpNwIzJ9u1OXKvF5S3IM5pE3tsOq4MqUnhFxGTX
         aJqVH0mcry5KCesBKiWS6HTFiG5wZNB4pbyslLao+DIcYpoH5Yw5I4sUtWUoCzBGEBQr
         BxgGS6TyrAb1GpAVMg9nxhWyM3967ipyfWG9EbGjttZmxlPt1x3Qp5Orl+buPuE2/59y
         EA/A==
X-Forwarded-Encrypted: i=1; AHgh+Ro0/pBfW4C5pE6w6ujU62267v24FZrNtPzzx5qRNKty4MS1YtUibc2r977Dg4dzHYbyJhCNdH6fN1Xf0cA=@vger.kernel.org
X-Gm-Message-State: AFuF++mXOD/C9LI4N+RE/JZ1dcReQhbKQ2hv4nBj9ZO5uHT+oFPBA9K6
	k/8HhPOWsbus4GPx6syJZ14FnHKooJaqgbgJgAHmpIGK75rmjEjEW4RH6wC4F9MxUfbyJmDZobd
	OWkvamA==
X-Received: from pfaz6.prod.google.com ([2002:aa7:91c6:0:b0:852:3a88:2817])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4289:b0:83e:b443:965e
 with SMTP id d2e1a72fcca58-85371ba8271mr16961098b3a.3.1787764372164; Wed, 26
 Aug 2026 10:12:52 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 10:12:41 -0700
In-Reply-To: <20260826171246.777729-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826171246.777729-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826171246.777729-4-seanjc@google.com>
Subject: [PATCH v2 3/8] KVM: VMX: Disallowing using to_vmx() in common VT code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Poison to_vmx() in main.c and posted_intr.c so that attempting to interpret
the vCPU as a VMX vCPU will fail at compile time, as opposed to failing at
runtime, or worse corrupting state without outright failing.

Note, to_tdx() is buried in tdx.c, i.e. isn't broadly reachable, and so
doesn't need the same treatment as to_vmx().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/main.c        | 2 ++
 arch/x86/kvm/vmx/posted_intr.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 684b87692864..b1069a8e30a7 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -11,6 +11,8 @@
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
2.55.0.887.g758fc8c411-goog

