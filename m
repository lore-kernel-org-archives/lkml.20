Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995225B08A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727710; cv=none; b=HnH48jolOQGQjUgygb9MzfcQ/+gsT1VqbpKmiJx72WucZvRzrG7c02dCGiXWzXI4FU3aCROpUnAUL/2n/73OYL8ijjmkKiZVKmEbSH4osYN0kp0nOPW24Av7idEebPfW4zIjF1/kbZVRVJBQVbQBLiX6wEdIgt9UTRoI/Q6tZ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727710; c=relaxed/simple;
	bh=o8YuGeZTqc4uKvOlE+dlI0uZX3Lct804oSuY08Z7z28=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Uw1xaiRpGB9qua8c6oplAA3z/hpJ93QBqORKmI++2sX2LqNKsjmCWMxaRRTUpug1JJdPgOdiUx71+qXihiGTFKtQ6VdRBgJPXVRonFS5B5wM8esUuQv+SudjYJG+6sHul0O7lVu+niL9lmFGAV6NzenY1fc6W38Rko4F+gOEuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tnnnfaql; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tnnnfaql"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so4888247a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790727708; x=1791332508; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/C2rA4jh4NWCKxvQT8VZ/BtYcYs6LrKHwl+IuAQW+cM=;
        b=tnnnfaql2zCj4dYP4T3yFUbXq0SmYGLpRndyZ53x8R8aPCsKfDM8BkvJhmYRi3dNng
         HWlkKdUyIk5xSaL//nmUOi0zkC2Uzjo40mA0oV1GsABhUeuWRpFG8Cl9jeWzqllun60b
         Qf9LtLDwu97SeuNIBxS71DmfLs9tBo9SYFIEG0p3xSRlqopXSWc5Ax6p7dwDGBnR3Hb+
         5uq3aajIRzWwKTniJP1kdoruLFpJaJ7Sq/JBvmnSLSetQ4sBzPWhFaf7lDF3YzK7+UbE
         uGrXXw8F8biheKv3XvH89wscvDn6C752IpIrN4oACZj65N8vqjfUh4e/JMuyF/TIWH1A
         a8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790727708; x=1791332508;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/C2rA4jh4NWCKxvQT8VZ/BtYcYs6LrKHwl+IuAQW+cM=;
        b=EWL7EDV3NF2GrV6fUoEDLMYqaElmKT/523v3xBHgxS8l+c+f/uJFT3Ca88XNOdrUa4
         vOpFyS4JoGGCOV8ljLFv5vQUOKp9aV1OLQhO4e8O+raHYkept619PFgkNyjoHDsx94o3
         gjjtf2OsyAUFlJW8qegSbyl2o3+N8hoBmHpS3lj3RBOoxeXxdrG1lEaye8FFUWWpWDlX
         lQNNBfFMcYWS++geqq3ki3YG2z7n9HCkhJN5gCRkY+t3wxhFa8yvn+dqYYn7nMM/sb3Z
         CJKtsRXc+TO+V3Xn5CsT5ncGk9fWXqkzaRzYJBKyN2MCrsQjpW/mVGRctpXDs9gMi3wy
         2V4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxYoqN56Y6vrjUHyrHjg211oEZmdcyQ4c9Sw8x/fMcnaiYBWoqkpGuiKzSL0w9R/LqbE4p0hWKmFjhrYmk=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1kzBf/AeVE0Vu+I2YacCaFW2mVhhmOvazQEMGuxJQ5qx/PPTf
	O/0MFdMqQmd3QASvoAC+tCEVzSUwHwlRmZGn2NmF9BL/8HqKYZIejHLNQXAl4KKetqT2teUk/R4
	babv0hw==
X-Received: from pldu15.prod.google.com ([2002:a17:903:108f:b0:2e1:28e2:3b2c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d06:b0:2db:539c:b7c7
 with SMTP id d9443c01a7336-2e2de4f6c43mr5081585ad.20.1790727708339; Tue, 29
 Sep 2026 17:21:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Sep 2026 17:21:39 -0700
In-Reply-To: <20260930002140.3174449-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930002140.3174449-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930002140.3174449-5-seanjc@google.com>
Subject: [PATCH v3 4/5] KVM: selftests: Add module param API to check if
 nested virtualization is enabled
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add an API to check if the nested virtualization module param is enabled,
e.g. so that tests can verify KVM's own enumeration of the corresponding
CPU feature.  Provide a big warning above the API to make it as obvious as
possible clear that tests should use "kvm_cpu_has(X86_FEATURE_VMX) ||
kvm_cpu_has(X86_FEATURE_SVM)" when checking for nested virtualization.  It
doesn't really matter which method tests use, as KVM is supposed to keep
"nested" synchronized with VMX/SVM enumeration, but make the comment super
scary to try and prevent KVM selftests from having two different ways of
doing the same thing.

Opportunistically provide helpers to get vendor params that are common to
both Intel and AMD, mainly to avoid having to copy+paste more code every
time a new param comes along, but also to create a more blatant conflict
with an in-flight series to add support for Zhaoxin CPUs, which will add a
host_cpu_is_intel_compatible flag.

Link: https://lore.kernel.org/all/20260910115414.3015260-2-ewanhai-oc@zhaoxin.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86/processor.h     | 31 ++++++++++++++++---
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tools/testing/selftests/kvm/include/x86/processor.h
index 6e6f70035508..1608ddb91b6e 100644
--- a/tools/testing/selftests/kvm/include/x86/processor.h
+++ b/tools/testing/selftests/kvm/include/x86/processor.h
@@ -1429,6 +1429,14 @@ static inline bool get_kvm_amd_param_bool(const char *param)
 	return kvm_get_module_param_bool("kvm_amd", param);
 }
 
+static inline int get_common_kvm_vendor_param_bool(const char *param)
+{
+	if (host_cpu_is_intel)
+		return get_kvm_intel_param_bool(param);
+
+	return get_kvm_amd_param_bool(param);
+}
+
 static inline int get_kvm_intel_param_integer(const char *param)
 {
 	return kvm_get_module_param_integer("kvm_intel", param);
@@ -1439,6 +1447,14 @@ static inline int get_kvm_amd_param_integer(const char *param)
 	return kvm_get_module_param_integer("kvm_amd", param);
 }
 
+static inline int get_common_kvm_vendor_param_integer(const char *param)
+{
+	if (host_cpu_is_intel)
+		return get_kvm_intel_param_integer(param);
+
+	return get_kvm_amd_param_integer(param);
+}
+
 static inline bool kvm_is_pmu_enabled(void)
 {
 	return get_kvm_param_bool("enable_pmu");
@@ -1446,10 +1462,7 @@ static inline bool kvm_is_pmu_enabled(void)
 
 static inline bool kvm_is_mediated_pmu_enabled(void)
 {
-	if (host_cpu_is_intel)
-		return get_kvm_intel_param_bool("enable_mediated_pmu");
-
-	return get_kvm_amd_param_bool("enable_mediated_pmu");
+	return get_common_kvm_vendor_param_bool("enable_mediated_pmu");
 }
 
 static inline bool kvm_is_forced_emulation_enabled(void)
@@ -1472,6 +1485,16 @@ static inline bool kvm_is_lbrv_enabled(void)
 	return !!get_kvm_amd_param_integer("lbrv");
 }
 
+/*
+ * Do NOT use this to check for nVMX or nSVM support.  Querying kvm_cpu_has()
+ * for either of X86_FEATURE_{VMX,SVM} is the idiomatic way to check for nested
+ * virtualization support.  Use this *only* to validate KVM's own enumeration.
+ */
+static inline bool kvm_is_nested_virtualization_enabled(void)
+{
+	return get_common_kvm_vendor_param_integer("nested");
+}
+
 u64 *vm_get_pte(struct kvm_vm *vm, gva_t gva);
 
 u64 kvm_hypercall(u64 nr, u64 a0, u64 a1, u64 a2, u64 a3);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

