Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEAB4DBD9B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451659; cv=none; b=OzFkYO8FPzIt2AT2Iy//qh0ahef/NjfnTJVwu0NeYzdcbEREdf8TBGoHzBmrqqnlX9CyimxuS28x4u084H3LZhJkt6IUL4HDAweLWLgau4incBwbA+7Ppapnsfv5zhlWWStCNssI8PoXgsTv5EuE4RJU0n3WAoW0MDuoNwJeU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451659; c=relaxed/simple;
	bh=1KHlc1wHj45U9E/CloOnejb8Z/oRbJCgq5P42bIgUC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brPtWkEYLl8S2WGRlb4dzva9DogtjRTbMPAmRWzOfEc437Q8ndyk2s+5xcgo74B+a0t+2QtzPVKmTOJM1d8FptB79siIZOo761ryF69Gu+I3C1S97BSRoNEKk3nsA6aZXeKOoeFQFmvwrxry70yTl0f3rT1aigTOdtuGwmhdwZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PTLjVu+5; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PTLjVu+5"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2225956a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788451657; x=1789056457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DQ17Gra4qRIZ9+bjeO8XFOZVaIoBgdk+Vd/GhAwUauw=;
        b=MPZWgFrmZdoeC91NMzv8ObJubDygDC4cOo/AV297Nn8sDuQrEeDxrh3YYqo0c5HZlj
         xmWlskPvy1fUAMczMiYAHTskjFP+f/0fOWhGDDk7LwLckAK9X8NdI2l+hC1zIzynI33b
         5R0dgFshDjzzoHeoAju661UZisZKYwJNAzk733iHPmeumzdbVmkwmqKtTPNSMOa0G/59
         RHzqBy7UKKX0H9yuu77hQz33jtruhetibCSVBXNQr+91hMohHBiI/hzDZ9pCd8dc2OYh
         mTmcflE7XuTJciLk83n8ecaXyIUCRPkHZiVfseyxarXYiJ4iiqd1uSd50mqAJhgP8mdO
         vrWA==
X-Forwarded-Encrypted: i=1; AKwUvBxXAZVDMlokmlfkLtoTCaaee0kVoGgYJqpmht7nCDVta6CPRxyGzDXxP0tC6zJmwSWt4FrggAm1hIGgy2w=@vger.kernel.org
X-Gm-Message-State: AFuF++mtenSwyL5EERRj8w9pjh2mnI8Wf2PJWmhTfYjXaSmxJm80wKwc
	M5LRA58u9u3EW2pQymsV0jH5OWM2mdYljry+y7g/RqmTt6BHZ1/6u5YVRjjGcubhNe79tqJ73Uv
	wTmd7AlR5C3XGzCR32cGVjpJxDGUiqLrQ0phns+RAsOKGaI6kihXcuLCWLOTEC+5Bgbq728Ox/C
	aE3ysIEzAJqyb0gpRjTwuEY3odxw5VSU+JBFMdkfBjJv2JDoVap5aGpHQONg2xfRgOgTClfMvUQ
	14rhrwGrSDV5Lu+
X-Gm-Gg: AYBFou2azKtTL0UycsfUcjv1fAigbjeCCj132dcZ+Qba8Nq80DM8MW4x3Xi6r44rId1
	GV4rRWGbRyVybae1Nn2Y5IBnAfd5T4QErSBvbD+bFHNOqafgdjFkJiZ+GJZCoWRU+u6GpblsN16
	6XvMFYRmQsVk63FVJXh+SLsvACfcP4gZ5sUonOjUueqkXPvFNxfpPdxcauWW1ZX4JPIWM6U7nIR
	GGdrIkdkja+n7p/9fC4NEtPq8mD4EePFkwX3psBelyjiKjPINPt+zP5N8otMN0cWKmyvhmV4WgG
	YrN/qRDueVwyjwAJWZ5v1iCf+2nZw7dPy78edaurRYMErrLrRWV4w454Mmm2fXPHu8nYin38jqj
	6FQArCrg/8NmSHB6sPB7SJSpBR+t09nBrNOllq1VSqx/zYWgBxw8u043at1dojQGqCBA12MF0K1
	ryODNXxGIBNJQVR2omNgLlzHuP0+DYELrv41Y=
X-Received: by 2002:a17:90b:5606:b0:398:9be6:f996 with SMTP id 98e67ed59e1d1-39aee1115e0mr21683347a91.21.1788451656406;
        Thu, 03 Sep 2026 09:07:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b1694a832sm1147975a91.6.2026.09.03.09.07.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 09:07:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso63995a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788451654; x=1789056454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DQ17Gra4qRIZ9+bjeO8XFOZVaIoBgdk+Vd/GhAwUauw=;
        b=PTLjVu+5fOA10pCqLLl291csqa4WhxeOB/TQqoUxEXRj2iFDwxU+pb4N0XoZVk7t9u
         58rGZEjVpZylJQhQDXHQn+QVpIxuoZ+o3zp3GAbBPzA4JL83lVecezpb8ZqR4Qyuk+pe
         0Zq9jPVFg8b8TgolIidQsBOFz5gNuAfVNt+Rw=
X-Forwarded-Encrypted: i=1; AKwUvBzHPHgtohzFz14EVdFI92fBcoiqfkj3QnN0kUVPyzQJK+yCHmfV4rRfyoULSXnhnfcCVhW2X4S9MZ2Qauk=@vger.kernel.org
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr21433232a91.18.1788451654203;
        Thu, 03 Sep 2026 09:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39aee10890cmr21432860a91.18.1788451652514;
        Thu, 03 Sep 2026 09:07:32 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083e7167sm6172054a91.5.2026.09.03.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 09:07:31 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	llvm@lists.linux.dev,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1] x86/vmware: Fix i386 high-bandwidth hypercall arguments
Date: Thu,  3 Sep 2026 12:07:20 -0400
Message-ID: <4ab10678a8f50053934b62b56af81f881c1d3798.1788414669.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The high-bandwidth hypercall helpers push %ebp before loading the in6
operand into it. On i386 without frame pointers, both GCC and Clang can
address the memory-constrained operand relative to %esp. The push then
moves the stack and the helpers load the wrong value.

Typical i386 configurations use the frame-pointer unwinder and happen to
address the operand through %ebp. However, UNWINDER_GUESS is available
with EXPERT and permits the affected frame-pointer-disabled configuration.
vmwgfx is also available on i386 and calls both helpers.

Stage in6 through %eax before changing either stack register, then save
%ebp and copy the staged value into it. Load the VMware magic immediately
before the string I/O instruction. Mark %eax early-clobber so it cannot
also provide in6 or an address register for it. Use the same sequence on
x86-64, where the full-width register preserves in6.

Fixes: 34bf25e820ae ("x86/vmware: Introduce VMware hypercall API")
Cc: stable@vger.kernel.org # 6.11+
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---

Notes:
    Built on v7.3-rc1 with W=1 on i386 using GCC and Clang, with frame
    pointers enabled and disabled. Disassembly in all four cases loads in6
    before changing %ebp or %esp.

 arch/x86/include/asm/vmware.h | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 4220dae14a2d..fb011cef01e7 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -276,20 +276,22 @@ unsigned long vmware_hypercall_hb_out(unsigned long cmd, unsigned long in2,
 
 	asm_inline volatile (
 		UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
 		"push %%" _ASM_BP "\n\t"
 		UNWIND_HINT_UNDEFINED
-		"mov %[in6], %%" _ASM_BP "\n\t"
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
 		"rep outsb\n\t"
 		"pop %%" _ASM_BP "\n\t"
 		UNWIND_HINT_RESTORE
-		: "=a" (out0), "=b" (*out1)
-		: "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (cmd),
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
 		  "c" (in2),
 		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
 		  "S" (in4),
 		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT (in6)
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
 		: "cc", "memory");
 	return out0;
 }
@@ -304,20 +306,22 @@ unsigned long vmware_hypercall_hb_in(unsigned long cmd, unsigned long in2,
 
 	asm_inline volatile (
 		UNWIND_HINT_SAVE
+		"mov %[in6], %%" _ASM_AX "\n\t"
 		"push %%" _ASM_BP "\n\t"
 		UNWIND_HINT_UNDEFINED
-		"mov %[in6], %%" _ASM_BP "\n\t"
+		"mov %%" _ASM_AX ", %%" _ASM_BP "\n\t"
+		"mov %[magic], %%eax\n\t"
 		"rep insb\n\t"
 		"pop %%" _ASM_BP "\n\t"
 		UNWIND_HINT_RESTORE
-		: "=a" (out0), "=b" (*out1)
-		: "a" (VMWARE_HYPERVISOR_MAGIC),
-		  "b" (cmd),
+		: "=&a" (out0), "=b" (*out1)
+		: "b" (cmd),
 		  "c" (in2),
 		  "d" (in3 | VMWARE_HYPERVISOR_PORT_HB),
 		  "S" (in4),
 		  "D" (in5),
-		  [in6] VMW_BP_CONSTRAINT (in6)
+		  [in6] VMW_BP_CONSTRAINT(in6),
+		  [magic] "i" (VMWARE_HYPERVISOR_MAGIC)
 		: "cc", "memory");
 	return out0;
 }

base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.53.0

