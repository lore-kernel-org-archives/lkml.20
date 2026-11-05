Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922479;
	b=fpE8IYJirjCH8vR/oOJpz5Y8dWAaHu5D7mf0oBe0E2jQ7JJ8E8F1Zh2E0NSPCO39k7b/
	 B3BSN2Ht5GP0oOxl8IrTO5qWKWQ1eTeCZbST8AjGLQb/UVssxslAIvaJlBpR/fqE0JXYb
	 hv0dO0hPUmGdUeIa3Es8T312Xx9koYba//dYDwLVENrEmBzxbysz/KHIxfsvV+BzYd+vk
	 pYnnEfoxsjY486vXYpUyT8oq5ckRcDV51tKQZ3feg56YcIc6mJoxH0OaCB87S9PlR4wUG
	 DTeroogVzMstLhdEhWOYdEs/B9rx1P8tQdNb/7k2911ca404Nny7hawjvOPQjTsgYGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=HCScXw0AOAFb2Q/P8mOW04jv5uFJRFpztNdUDqAY+J4=;
	b=rwp25fdYxGxjZhY9fetSkS7paz5j2wBa7CeuRB77NeJ5QiwIhioekA1NPzvAYkk2wdZA
	 uBSfgjUqEBKBlHp6OxNrG582Qe//YelYCFn25Jnk1wJNkA45+Y4Ubs88P7WUGfFqru2X2
	 CL9isPoXQYzWuvS3k5wazYF7TWZT0Upx/R7SUn9rWS0+QpTb//lBhyHFBWpCs/eA7Qbdv
	 gmtBDFegYKzxmfJcgCfpQHzQ8FDX8JiaIs+l42XfyBqKyeTMt8Gva1n1TYUp+zUWcDPrx
	 ygrB4Z1Ziim6EHYaHqARXrtaG17hCTdN//J3IRb1wrO3dZPxx446s3jPBziLgsnpAMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H93ioGob;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AE7608363E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AE7608363E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wyihan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H93ioGob
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0ac277beaso87801a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793922479; x=1794527279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCScXw0AOAFb2Q/P8mOW04jv5uFJRFpztNdUDqAY+J4=;
        b=H93ioGob1uW+Qxa15m64BoFJYkkoPcWYrDJ+pctEiMRrfv+boUtBEShcI2onp08bxX
         O4RGnJ1IS5lxvtUoZcZoIBwF3i5xaJ+pwhzyzbqKRxtt92Ox6I96685MwYObHrpHaRHU
         Y9H5RIlQ29ByNmMpKPlECPl55re0Z5zDscOIVUwWjnnZaAv/KHB2GrOogHk/gs1zdnGx
         /y7P8h+yTnTy/FrXF8IpVbA0R4eDKTSNsiQi2+PFWl1Apweb0NV9U3P4GBgLEdW74GIK
         jAMjXY9TgBj/JauajBzm8zFOZmForkagOzyFvn0Pw3q5LfSZh4yJ3C6ubafU8AQ6STPe
         b1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922479; x=1794527279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HCScXw0AOAFb2Q/P8mOW04jv5uFJRFpztNdUDqAY+J4=;
        b=tG/qjIr7g7jbaS2Rt+tlhmEnfGV515zJD0NejZFjqYlodvHlMDv+b350w8f3PcIeaF
         pfVB5//MaWVd91GiLO9JVetOf7C0nMcDD8VQrCLB5DvA/BMdvL+86H1s1xNe+UjKGZXk
         W8RD2a7ulSEloM4ffmIKa0cZkv27Akkb4h1C+hwzXUPPW6/nmVigqaPRM+vI7fEM1vZZ
         loEFBJ2pli3tNR3NGtoLpmvQDM7pOsbMOoEN6w5XAW6pYiclqbg57WQVFIZoW47e4bKL
         DUn0qCtrN8iJEstFu+WkGDOuZd1cPw9Krv1XplsBMRdYNlXAVhzGWs5ABO3bPT1acFIR
         eeug==
X-Forwarded-Encrypted: i=1; AKwUvBz6/c+pLL7FU8xTXLygpsnxV7qCRLgbVe+Y/KPdjsKal7P+UE5tWL7ZI/VLvy7MQTu3hncGZGw48BNpBHc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nal90+Pb0l7SiIC49trdLJ3uvk7pU8jy0VcRupzeeYIipTfXD
	om8oP6bTQqEYdoKViNgKj1lnO2rup0NQLgExniZDGY+tb4NDDCh5GBWE4vX2B7NWQbuIGuA/EhS
	mbBHX3Q==
X-Received: from pjyr7.prod.google.com ([2002:a17:90a:e187:b0:3b0:9c59:c0e2])
 (user=wyihan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b8f:b0:3b0:ad42:dcb3
 with SMTP id 98e67ed59e1d1-3b0db6e4166mr543934a91.14.1793922478146; Thu, 05
 Nov 2026 15:47:58 -0800 (PST)
Date: Thu, 05 Nov 2026 23:47:01 +0000
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793922452; l=3068;
 i=wyihan@google.com; s=20260319; h=from:subject:message-id;
 bh=blx9Hfl3VSYTcBkvVxCVP+EDfWWPj/zgZHQF+Xi/tns=; b=kQ33hQvPJ0lv05IJFYC0jL5F4lpRe+uOyUMUF5+VLhVu8PNgulou/sSgAx2Q6ZABhXYba4lpO
 KbQIZDtbGxtCi7skcdldvYrdSGgr6Px/DoNYKFBrFXe6nuzTi5HlbmS
X-Mailer: b4 0.14.3
Message-ID: <20261105-tdx-selftests-v16-17-2024e8fa517a@google.com>
Subject: [PATCH v16 17/20] KVM: selftests: Add a helper to issue TDVMCALLs
 from the TDX vm
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

From: Erdem Aktas <erdemaktas@google.com>

TDX VMs need to notify the host, e.g. ucall. Add __tdvmcall() to allow VMs
to issue TDG.VP.VMCALL with a single function call instead of
open-coding TDVMCALL registers setup at every call site.

The helper makes standard GHCI TDVMCALLs: the caller passes the GHCI
sub-function and up to four arguments and returns the TDVMCALL status
from R10.

Co-developed-by: Sagi Shahar <sagis@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
Co-developed-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Lisa Wang <wyihan@google.com>
Signed-off-by: Erdem Aktas <erdemaktas@google.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
---
 tools/testing/selftests/kvm/Makefile.kvm          |  1 +
 tools/testing/selftests/kvm/include/x86/tdx/tdx.h |  9 ++++++
 tools/testing/selftests/kvm/lib/x86/tdx/tdx.S     | 39 +++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 5136f49c502b..ab797c8dd497 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -33,6 +33,7 @@ LIBKVM_x86 += lib/x86/tdx/tdx_util.c
 LIBKVM_x86 += lib/x86/ucall.c
 LIBKVM_x86 += lib/x86/vmx.c
 LIBKVM_x86 += lib/x86/tdx/td_boot.S
+LIBKVM_x86 += lib/x86/tdx/tdx.S
 
 LIBKVM_arm64 += lib/arm64/gic.c
 LIBKVM_arm64 += lib/arm64/gic_v3.c
diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
new file mode 100644
index 000000000000..d41a1efc8a63
--- /dev/null
+++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_KVM_TDX_TDX_H
+#define SELFTEST_KVM_TDX_TDX_H
+
+#include <linux/types.h>
+
+u64 __tdvmcall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15);
+
+#endif /* SELFTEST_KVM_TDX_TDX_H */
diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
new file mode 100644
index 000000000000..517727d35e75
--- /dev/null
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx.S
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+.globl __tdvmcall
+/*
+ * u64 __tdvmcall(u64 fn, u64 r12, u64 r13, u64 r14, u64 r15)
+ */
+__tdvmcall:
+	push %r12
+	push %r13
+	push %r14
+	push %r15
+
+	/*
+	 * Map C ABI fast arguments to TDX GHCI payload registers
+	 * RDI=fn, RSI=r12, RDX=r13, RCX=r14, R8=r15
+	 */
+	mov %rdi, %r11
+	mov %rsi, %r12
+	mov %rdx, %r13
+	mov %rcx, %r14
+	mov %r8,  %r15
+
+	xorl %eax, %eax		/* TDCALL leaf 0: TDG.VP.VMCALL */
+	mov $0xFC00, %rcx	/* Expose R10-R15 */
+	xorl %r10d, %r10d	/* Standard GHCI call */
+
+	/* TDCALL instruction */
+	.byte 0x66, 0x0f, 0x01, 0xcc
+
+	/* Extract status */
+	mov %r10, %rax
+
+	pop %r15
+	pop %r14
+	pop %r13
+	pop %r12
+	ret
+
+.section .note.GNU-stack,"",%progbits

-- 
2.56.0.455.g6c5a503b38-goog

