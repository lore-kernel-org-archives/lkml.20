Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F3053A3B8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790883542; cv=none; b=B68RclrRz25AeZeFIf15JmktyOHWUP/gZ3vtz4SLDRMJGH9/AsTdF0BeuUlTbmNjnpyah2tNzfofu45txBkiVLsb94h4/aWoMHV6RbLwt43XCy+G3KLBSbjkLvl9NCuSCY+WNMrXdXQs3nqXVnhOKpwn+XytoTka5XHyvXJnuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790883542; c=relaxed/simple;
	bh=llNcDEvG5ONSzD4dGt4NNNxutqgk+Vh63Ml8CuMiltM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dlqR7KJuPvudbon42owui5JhAyO+H49bPzsqwZEdsOGNsxOpKV+amDalhIKB/xbbXzY1FFTtenk+bH875GrKyrvBIIYZ+DgivzassjNzn7L9r8nxzknTcfCrVKszhUOoEhSFMGfbPlf3s6yE3kPwR6fTf+7B7Cshy/TVO2ndvQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZBvWq0gR; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZBvWq0gR"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so103330065ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790883539; x=1791488339; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTS9MVYDjyZn0FMdpJO1jd26R6doN//zdf6O3PVKEHc=;
        b=ZBvWq0gRVCBRynx0RDBwizkk6kzKOxyxUG2DEPVdYL7NRACJbpoNByBoc9n2I5Ukhp
         qMbnY+sjC6kiRggWO1jTh83pBiCxhnnzMllSmALltsnGuzjPgt2+McbaWFHUcrnLbZ5d
         pbxInQJwjOOXekLyr9sAvDgwkeaD1fBkqTPg3RCwjFNr6GYepqZ6ZcMLadnd+dX82HLh
         R0RDm/7z8ST53lug9qohSaR8Oa8mo/Zsc3C1v1lxWtx9dC7SzpyVZWRlavtEQ0xSlWdm
         uUgivDQ2DTomG7vQoSRb24ABa7wVyIikryBTJpwUgGcRGrdlCeTOVrIoNHdtDpVX+stT
         UOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790883539; x=1791488339;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CTS9MVYDjyZn0FMdpJO1jd26R6doN//zdf6O3PVKEHc=;
        b=mI9YcNzlegdggk1/SoiVUjaFsioLKAGqe1a3bAXP7Rlt229uIsRCPZX9vqiiWtft/C
         3MFdIprdfr/9drybC+/R/9OEoVrYFePWTBQwfdAsaym0xqhTy8rF2a0fC2H/IFOfSBU2
         rS0V8h5hfEZawh/h7oYKK0af5FBnCwkJyyAVSIv5QMFtR7JfynEQ1LDK8XhJMdbd7Siz
         aWTFxERDlW+TTzh+by3dLGXWXSvxtxcqgZ6aamhFDCDZ+yAabor40o9dXnV6B5VF367F
         ZkLElg74WPRGMLAUnti1PJ83tVYBu530a5DqSPBPNTIDLxqE4iWdDEKheJE/dZLngC71
         YScQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqMjkXGDC4a/kSNhRLyA0VKH5pitYqz/Ni34Z5bMpfooUn+ahhyNP5MWyBC87dArjeTod4SGWrXvoV36Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lvQE2F3q+V+B4gfNKb3QHBxfC4cuT/FD4uk1NJ5/AehG8Ky4ic
	YPf8JdVjSITXeSgYhlKKQmnyR+n0gh6kfXmJuQeLCj4/PY8vzmS+tWVXm1uzPsyuSTSaBD3t2Oq
	naVVgyg==
X-Received: from pgvi18.prod.google.com ([2002:a65:61b2:0:b0:cc7:d53a:a250])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7346:b0:3dd:a196:69da
 with SMTP id adf61e73a8af0-3e0bcffdc3bmr382730637.53.1790883538817; Thu, 01
 Oct 2026 12:38:58 -0700 (PDT)
Date: Thu, 01 Oct 2026 19:37:46 +0000
In-Reply-To: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001-tdx-selftests-v15-0-7c62a5d8a992@google.com>
X-Developer-Key: i=wyihan@google.com; a=ed25519; pk=cRi0fKzS5BMxlHyHY2pJv3w/1zcgfYKr6EYGYppdMYc=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790883521; l=1475;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=dHazRHKBQXLPWxA291EnS2jS18PMgn3EB4oA4YyhfRw=; b=tgwt8HjwGicHZ76GFPLwalGPdHjLjBULDiEbZpWVQMS4MtToLYJAFVZZBQaYYAekz7/9dcVOU
 3qCled8xn9NCQz41bKF0lqBRmeb7alSlvI8zr5o0D8rThRu3XAiEemS
X-Mailer: b4 0.14.3
Message-ID: <20261001-tdx-selftests-v15-19-7c62a5d8a992@google.com>
Subject: [PATCH v15 19/23] KVM: selftests: Finalize TDX VM in kvm_arch_vm_finalize_vcpus()
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
	linux-kernel@vger.kernel.org, x86@kernel.org, Lisa Wang <wyihan@google.com>, 
	Ira Weiny <iweiny@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Sagi Shahar <sagis@google.com>

Finalize TDX VM after VM and VCPU creation and memory initialization.

To integrate TDX VM finalization seamlessly, the finalization is hooked
into kvm_arch_vm_finalize_vcpus(). This approach avoids the need for
every TDX selftest to manually finalize the VM. While it does prevent
TDX selftests from customizing memory before it is locked, no current
selftests require this.

In TDX, finalization is a mandatory step to make the TD runnable. It
also finalizes the MRTD of the VM's initial memory and state, locking
them in for future attestation and preventing any further modifications.

Signed-off-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
---
 tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
index b4b76dc505ae..e1d0fd5ed1f6 100644
--- a/tools/testing/selftests/kvm/lib/x86/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86/processor.c
@@ -1536,6 +1536,12 @@ bool kvm_arch_has_default_irqchip(void)
 	return true;
 }
 
+void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
+{
+	if (is_tdx_vm(vm))
+		tdx_vm_finalize(vm);
+}
+
 void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
 		 const void *smi_handler, size_t handler_size)
 {

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

