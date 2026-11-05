Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922483;
	b=c0VxkQQILthq+d2GqHjDfPxlYuctZIKHzNIBls7h6YdnrsBuoofU1GuzlSEYyky0yKlO
	 3FBodhtTgMWtZwsYVG8L4AOdtP8pNW1+28ZyiG1ktirUeiyjF86Fq7kajQIXvmwUibFyX
	 13w9+0FSbB5MZhkjEwP7z8mRB57B3pljxKpDXwxctO8Fuhd0DhVWmGIZbe3jaeGxVyvUO
	 3xuBQCGmZc9pMREXXqpd+dg3bM8xunnPBjwKX4tz/BB8F5iJYvTnjIBdNBgz3cpM1ObQc
	 cOcgm9sg3x81D+FHZ98rB/irZVnooXpuaVJg0ACyjrE0aF2hX4Mg6VDFgCDyXrfYcDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
	b=o2e/c//kWO1onIfgQZsHYbtaepLhAD3vA2/Zxr2oIJWz8hp800TDhfu8OVGBNMBAxVoN
	 ZPjM++EpRsa00AOt/1ESowWXHyLDD9BcIosOCD9E6AXGxzvWcrDjhKR3IarxhtSanInW9
	 OSthRaLqJgiTpzyYEjDZiPapzJRFLxUBAU+k/rh/t2CpN7rpVmDeaQ58GWPlrvTbXSX3L
	 Klvht8tGJ2BflBX0/ach7dPb6DPCR92rSvpxWeeXrfHrRoDUK4vQWVi4bsSmNBXEiSbtD
	 xmkG9sT9nHHbiSfEU9AnOqkLtiyBJifRhPAeliG1k83N3ouHgvq/DRTEhHtE6E44tyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hKoXHZop;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DE4606EEA3
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DE4606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hKoXHZop
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b32efd7ec4so30209b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922475; x=1794527275; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
        b=hKoXHZopodYJnsDJh88vcJpXxG8Df4fZkqMzTlT70bq9ex4uH6PcQ/j/4I3pIjvyWp
         sDsSccY2IKZ7VIMQLkbuvqHaYfpmrBZ9pDgi5d7maI/QKrSG10QAG88KFpb1mrpVzxTI
         UDTuDjQicNqCbTbVExb2wlF9/zytZbHiIiiJRaz6mvE+4m8qYUahepJYv0fOzthirzWx
         HgMaSnQ+C7QxIh67yTewGa0YKBP7+m40AQLq5Esgm59zm+Eo1+dCwM098HtnUTpTu8m/
         85t0fHtTkwDI2u1KTq/JEDMcCiFMDdD5fB7ABkr3wRPDf8195YElApWftrVPe8Ig+Phq
         akhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922475; x=1794527275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1QLD2xcyGVhLJbNzuWXPP2Gml3MYrb+er2GK1r6mD4=;
        b=ePwh6hfdTLKSVigLIFNnn0zOJpK+dZKWuyoPVTeV4mFDqii1FwCbabUYqD0RkDTYt9
         A/Swbs4IUmCkTMcbeGPjJ570j3v1i9RjxAFnfQO8IkNR7PBxMoQlrnmW/zPm6GVLkY7q
         3x7Clpd5RNACsjxqDezGK1SoWzH41AVKhj6Uba9JzJ5M5YF3uYrnkH5plPg2KXxYXJRR
         43sM/PrDaOaDCLe3GCvshL3tq71LB4TvlahTniGx8Zh/EEnvmmfre+LZhSnSRisq/XNL
         2MgvpsbVVTQXB3TianPDZc7rat6KSy63tYXq44eAGLo31kU1GH1yjkFlUFQFPp9eAG7X
         2xDg==
X-Forwarded-Encrypted: i=1; AKwUvBxxkfxiAl+PyLr0lE+/qVvIxQi3V7JagH8CvQhCjUlRgKe76KTgDd3QpYnbzajvevds1uLwr89G4g6JISM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FNrSATUuhaniLlIOJveCXWiszL+7ViFAp/xHK76boqJ3t9pKJ
	X+JIMhqk7LS9IDIil8PqyPLS+z4eB4F4RJJB4HhtKLwQMZU823Okm2IbpGwUGwzRj/OW4j3kYCc
	DstDubQ==
X-Received: from pfjx4.prod.google.com ([2002:aa7:9a44:0:b0:891:63bf:32])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9a8:b0:89c:6036:c63
 with SMTP id d2e1a72fcca58-8b37b862efcmr575019b3a.32.1793922474556; Thu, 05
 Nov 2026 15:47:54 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:57 +0000
In-Reply-To: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=1858;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=NM6v7ONAFm4dNOExo6KcnYRESswxRmJRZoN0Wgy5vKo=; b=rxaC7zWae+B+wvnUQ6WsS8EzDvG4JDUhu9mkJ8j0pMZd6hTfMyQSdNAu+OQERPGWCU9V6tAHa
 SdL98gWfLccB0vNbP/TFPIBxbhYs/6mQh+jYJKA0Ph6k8zpPzB7saQw
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-13-2024e8fa517a@google.com>
Subject: [PATCH v16 13/20] KVM: selftests: Load per-vCPU guest stack in TDX
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
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 1719dc1bb060..84127618f05c 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -91,6 +91,20 @@ void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm)
 	params->gdtr.limit = kvm_get_default_gdt_limit();
 }
 
+static void tdx_vcpu_load_boot_parameters(struct kvm_vcpu *vcpu)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+	gva_t esp_gva;
+
+	esp_gva = vm_alloc_stack(vcpu->vm, DEFAULT_STACK_PGS);
+	TEST_ASSERT(esp_gva < (1ULL << 32),
+		    "ESP GVA must be within 32-bit address space for 32-bit boot code");
+	vcpu_params->esp_gva = esp_gva;
+}
+
 void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpuid2 *cpuid;
@@ -100,6 +114,8 @@ void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 	vcpu_init_cpuid(vcpu, cpuid);
 	free(cpuid);
 	tdx_vcpu_ioctl(vcpu, KVM_TDX_INIT_VCPU, 0, NULL);
+
+	tdx_vcpu_load_boot_parameters(vcpu);
 }
 
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)

-- 
2.56.0.455.g6c5a503b38-goog

