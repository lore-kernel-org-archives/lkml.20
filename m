Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CAE531610
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883540; cv=none; b=qaxV/Wlqeits5pxz4w7gXb6S9/qroftSynRiS0yImj6ynaZGpZso9HAMvGxyUnYse0So1g3wzjmUABG8z5sOkY250LW/URlds7r6V4ycb5vN3Fk8WL6JiSymNzF7vNR1NM0a95eD6G1RdHCYtpVSzAiA7+BKOqB59D035pvd1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883540; c=relaxed/simple;
	bh=bvvMms5Mq0V0ojOMhq/1KL/irCbrmagZq2kHnu+JWJ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JBjFUA7WiXW2aVFIF5RQ3E5xKX/IYk8wtnwsfBbiF3DXJPk8Ue9bFtuBqQRotnNBmORyujqyZz7724gY2/OHg/L9wsbu28cyk0guCKPfgdeVokzaIF8EspvyvhX7/SVHtCF05lS7YutmJQ2vbss6d/Pt4J25ZBMKdSnZCgY3xaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y/z7NINN; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y/z7NINN"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2e064b7a6so20346765ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883536; x=1791488336; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6DHx4mVjUCF68ITps8fQJ3UYYtBbDCCWLiPyDIDzxk=;
        b=Y/z7NINNi+oPvSjyifJ+ckuAjwYRwIjKOiz8TblsbzYD4UrsqX3NmvuOHWujTVUhrw
         XOL9sO+k6Am/U6qqt5BtlwsCm+pUJ2uFrHTBRJeVm8s7/TG5UylEvZFkHxQDP1i4a8Ea
         dtxORiL+nA7Wy6dGDCvNez8y46d+UBL/jpL7EnCwhb8XHlazz7D7SjuCi+/97LIbyzFn
         Zo+A/WCk4Y3KB8SbkK1n55kS50/7JTMzmfCvClig7ql8dLCXsEtHVPRn3JY0FDQdr82l
         prEKs1aoodHYilfOV/55PEMyfznGMRfKLtZkx1apiKWtzNQUVZGetVpbNv5M0QTnxOjK
         VmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883536; x=1791488336;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6DHx4mVjUCF68ITps8fQJ3UYYtBbDCCWLiPyDIDzxk=;
        b=Up3qs0PJx5yWkyDp22sXlrpHgApwPqD2pOPy9KFjsK0s8/IXL0l/mDjHJhURdupZ2E
         Luj1DM1Vj57mQN438y05P04xFHRcjiNuwfL4FrYciRmFaxxmTLlrzITopTt3u28GvyG2
         jglov1CPmphzTMp2GH6igwiJ1hwD5oyvd5iAiUuOy1QuTW0OJvFpNEMHhwDHmF8d42i3
         3CpvHbSTENeLos3Gmf+7AuntPxAfqJBY4ym2rgEMeDt9p2xtMk5ADsRJWfWkQE9AZfaX
         xCkmyZxfP5U4b2azSf8S4lNULKREOY6HiEEn1nadFnbTakl+9C1Ww57XGzgCOBj1u69k
         lOWg==
X-Forwarded-Encrypted: i=1; AKwUvBzZjmZUGVKFTjC6M7c6jtcU9vjqpOLBnfNELM0yRTZpCjfVaYqyZvgtPYrTMtZ/iTKUkGgKrrZ8SBQQeP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0QdX4hvILTHfXCpiJjucOuGxKdfPwF7eV8lsJGfJnYLMCkxhh
	ABEEesE67R8XgF1c/rP3ByZc22a3+th1fR6znGSoBfTMFc+IaRRh4h84vgvmV4bbAFYFMnnJC3w
	FeZZG9w==
X-Received: from pljg24.prod.google.com ([2002:a17:902:fe18:b0:2e1:2a93:3745])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f685:b0:2dd:c100:b2c5
 with SMTP id d9443c01a7336-2e49b7fdca8mr3329635ad.48.1790883536152; Thu, 01
 Oct 2026 12:38:56 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:43 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=2986;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=7IIE0zsKtDI6/O9FzsIrIrODoz41LwlvaBTgumYAjkM=; b=9wjJH4QxYzM4d9NEij4Ug8ef4a2EaOZ0ZJrc7Py8IIz9kgg15VKA+1kqDMli0dYaAx5s/j/uY
 Kc/xcTAiLtCAJUNm0NvR+BfY/jnoEtW4Cb071KSEydNxSp+GmYSTYpc
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-16-7c62a5d8a992@google.com>
Subject: [PATCH v15 16/23] KVM: selftests: Load per-vCPU guest stack in TDX
 boot parameters
From: Lisa Wang <wyihan@google.com>
To: Andrew Jones <ajones@ventanamicro.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Allocate a guest stack for each vCPU and record the GVA in the TDX boot
parameters region to allow proper vCPU initialization.

Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        |  2 ++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 12 ++++++++++++
 3 files changed, 15 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index f5b2f32f2118..72497724a2ee 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -70,5 +70,6 @@ void tdx_init_vm(struct kvm_vm *vm);
 void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
+void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 4af9cbf3fabb..2d2160d68b9b 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -888,6 +888,8 @@ static void tdx_vcpu_init(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	vcpu_init_cpuid(vcpu, cpuid);
 	free(cpuid);
 	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+
+	tdx_vcpu_load_boot_parameters(vm, vcpu);
 }
 
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 40ee9b1951c2..270a4ee1b7eb 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -90,6 +90,18 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
 		    "gdt must be within 32-bit address space for 32-bit boot code");
 }
 
+void tdx_vcpu_load_boot_parameters(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->esp_gva = kvm_allocate_vcpu_stack(vm);
+	TEST_ASSERT(vcpu_params->esp_gva < (1ULL << 32),
+		    "ESP GVA must be within 32-bit address space for 32-bit boot code");
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

