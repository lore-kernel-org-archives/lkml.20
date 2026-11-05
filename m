Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922477;
	b=Bh4V7kn6ikc4a7ymkfnhSvqA0a7BgIlGYEasKiHN08wW5GtMR+zkx63uHGZC9eznC7lm
	 0HgDfuXxvfNTZggjXxW5a3aIVWAaB5+6Z3DICJDA5Jn1exnvPrZ6EAO1+hTopBLudvP2N
	 waflZNHdgfb/RU/+KAZJ2vjqTnB1+f3XBxpk/OrwMRguHBhUJd6WzsENTNOlp/6UBaxOw
	 7TbFT2r7pJB6/p24GuIwZ+D7Fa/PPQFrU9kygz75Be3Z7HU9FmTQpTOQvGB3R//HyMKhv
	 /gMfqk2md24L4uE+jkEmeqUUMH0iEkMxD9vWc6SSOWfZ4+DR0nbmpZIHp/AD8tIIrdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
	b=hs+x0zG0VEr5b7FYRvwLgiEfspxLj26nDQqfhY+RUMC04HhQWY8FuU4g9CrD0393bxeP
	 HLu1b/yqfw1LfTNWapk8zRwNOBM3ZbyyAMdK2l1q4x6J6FsaXz7Ja3TsLWQ8i+C0SiNVE
	 4pDHO6LrqOW9+WAimYTK3Mzlk9c3BqgH1leuZVbV9fdU3A6rguCuJVROMg11M/2Otljcf
	 pjlmCxi0j1CX0mA1LGXTraTCag8x/fCTx+lGOOb0pXujAQrdsmlZX03Q3yJFvhO2R2A4h
	 XRJkepU9RuV49jcOrL9bhg7G2jUOs8Bu8zuWa3GeGPQgmP0gOebafcmmYEtlAgoykhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sh4xLnrP;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427216082BCB
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427216082BCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Sh4xLnrP
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so92944a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922476; x=1794527276; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
        b=Sh4xLnrPQCtkCjJNAKKgYGKKBVufKochi6YvaQF8Qf7BOz7Gk7yheW2+Sl2k5OU4Dv
         7s52UMTdVacvuKRGeFPNmVzoEfj+gVmWV0NRSTPUhVUp0EbsY8uK4t2tehYsL/m/Fuir
         iXMzwoTHs//urexz+DJxn3k53BXo2raaQwN9+4jdudlnNOR9bT4e6wgVnRpRqUF24LCm
         xETycjKqFaUlmMKRWpBObwq3PqH7U4jazIXErBcbv7cphkRY+mRmR+NP3wJZQ8QC2c1c
         BlZvivmpJzwsAJ3dvGaaOOb2dUUqbBYBtnysb8/ZDmRbVAzYloVNy4a0d2Dx8gAGOO7L
         urTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922476; x=1794527276;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBiUoB1GQ4LQL/nXuU6yhE6GYWmPG/iDNPjaG+VzZl8=;
        b=aFlNm8cc+WwMRTXG420ArF78+bFArXHMCJ0TrEd9On+IODO5x2LYqBKa7rJ8VsV+p/
         11e9GKcWCN8z7aghjKEI5o3G4UGfSqXio+W6oqG66nYBaIfhZJjX1JYMDgTNZUfmXGLv
         k5H6UcGvFkLxo2OUUkI546TY0bCImVc5QWkB8VinGDibt6AdnOcBlxyOZYwzMgKWmunC
         fBEsPAGR4PrcT2YVyI624ui/49yTkFG+njx0YIWdIXOHD0qKRdO40aLo0ckfiCrzdvFw
         +N8mKj03Q3UXTOdEYcJq5DCuGxg5dHQxznek3zHOy0ywpPEZ4RP9ha1ziYasXyNs+jcP
         kGyA==
X-Forwarded-Encrypted: i=1; AKwUvBzXPCAy31gpU3qMLnwTwtuL/g72oMkOkusqk/fghx9o+3PSEZuryVV1Xp1A4+3b0j99pirCglgeIfMr+vY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xd0CKrwyDvjLoRfTlip0IyMWckWzC0rvLCRDAVyYPzFU0LUm7
	TzqXRaYYRq1runsfV9devZxuzGVFW5X5TEPrF2pxGtQl53UaXPQgLaruNyceZ0K7VUPiWtK82JV
	60mxZYg==
X-Received: from pgly13.prod.google.com ([2002:a63:180d:0:b0:cd6:1e1f:43b])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5390:b0:3a4:8c41:fab6
 with SMTP id 98e67ed59e1d1-3b0db700909mr672764a91.46.1793922475543; Thu, 05
 Nov 2026 15:47:55 -0800 (PST)
Date: Thu, 05 Nov 2026 23:46:58 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3040;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=zQXICDUfkyOEjaQ9E9JzE6XP0PgFJvrAcKjCLLRv2PE=; b=++6VzU7tL+aM9iRm8j00/5V85eUN0JZ0BcvHYqocl+buUFvfNvnydmWJLpoiJC7HCuRMpkMxR
 x50Ds50F24LDNDjtcclc41/SVXvHrQHGmmELVCo9jjrlTVl90UlLMh6
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-14-2024e8fa517a@google.com>
Subject: [PATCH v16 14/20] KVM: selftests: Set entry point for TDX guest code
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

Since the rip register is inaccessible for TDX VMs, we need a different
way to set the guest entry point for TDX VMs. This is done by writing
the guest code address to a predefined location in the guest memory and
loading it into rip as part of the TDX boot code.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h |  1 +
 tools/testing/selftests/kvm/lib/x86/processor.c        | 10 +++++++---
 tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c     | 10 ++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
index 9d951f67b3b5..1cc876891589 100644
--- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
@@ -72,5 +72,6 @@ void tdx_vm_setup_boot_code_region(struct kvm_vm *vm);
 void tdx_vm_setup_boot_parameters_region(struct kvm_vm *vm, u32 nr_runnable_vcpus);
 void tdx_vm_load_common_boot_parameters(struct kvm_vm *vm);
 void tdx_vcpu_init(struct kvm_vcpu *vcpu);
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code);
 
 #endif /* SELFTESTS_TDX_TDX_UTIL_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index 110d23e50bcc..11db6a3b0366 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -853,9 +853,13 @@ void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
 {
 	struct kvm_regs regs;
 
-	vcpu_regs_get(vcpu, &regs);
-	regs.rip = (unsigned long) guest_code;
-	vcpu_regs_set(vcpu, &regs);
+	if (is_tdx_vm(vcpu->vm)) {
+		tdx_vcpu_set_entry_point(vcpu, guest_code);
+	} else {
+		vcpu_regs_get(vcpu, &regs);
+		regs.rip = (unsigned long)guest_code;
+		vcpu_regs_set(vcpu, &regs);
+	}
 }
 
 struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm, u32 vcpu_id)
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index 84127618f05c..324f3c41aa61 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -118,6 +118,16 @@ void tdx_vcpu_init(struct kvm_vcpu *vcpu)
 	tdx_vcpu_load_boot_parameters(vcpu);
 }
 
+void tdx_vcpu_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
+{
+	struct td_boot_parameters *params =
+		addr_gpa2hva(vcpu->vm, TD_BOOT_PARAMETERS_GPA);
+	struct td_per_vcpu_parameters *vcpu_params =
+		&params->per_vcpu[vcpu->id];
+
+	vcpu_params->guest_code = (u64)guest_code;
+}
+
 static const struct kvm_tdx_capabilities *tdx_read_capabilities(struct kvm_vm *vm)
 {
 	static struct kvm_tdx_capabilities *tdx_cap;

-- 
2.56.0.455.g6c5a503b38-goog

