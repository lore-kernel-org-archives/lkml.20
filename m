Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295058;
	b=nrzOSSruar2Flros+g4mA5+hkR2YU0yukGKdOapdngbQXme+pZ/ajVfo/TRqz6iZ1WL6
	 qu/xviDDKXHCkZBRHuxBrdqy4cgk5xs+SFHWego11T21E+7UMpqs25oR8bq9O6WILLAER
	 2bfpBmYiEnojUzG4f2rvMKOUBdQLX5GhiMlhsquyg05QmtYicOVkMd5A4uhRDejPzQC+h
	 lXsaNL+d+B6BDIvV/ku8sZA3Z6vm84C2Yc/Nw612f4MzX87YDoGPQIkmBcrCeusvfiYsi
	 /ZmZ+s66pm0FU8ps/VsoP97qnObns9vwAQ9HIk0e4i9eFKJFxpStzFESJq0pvLYR0SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295058;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=62v7psIL8EAQ47S6rRTJha+UTtgm3E7BPb1/D07Yo+E=;
	b=px3s2tTwOkhz9v+K42MDad0+NzXYrHs8y2629AW8t6f3p6KsxVdqjg5RVQ7bAircEsHY
	 A6KJu+jNa0RYfMx3PjMjpjaQg8mxj4euHy24yheiVtfzlBSw4sYEfCgVX54kYOThl2GeM
	 CO4H6uMdEhbyzIsRZM3Lv4zAWQKwsNrlGSjxoxa0cKRMVL12HT7BNtOrlyEdsUp5vlCb2
	 YItlZwNBz+qOdsD+EYI3xysD/CP0Gt99zfrC/NxSbNDl79tApeVf1SII0z85mkZBcPLVT
	 bUzsSqjPmX/zmHG3fynm5kLBwx9FhX3n3YpQnHdwmuuOfsIXYzrpi0AvYyz1ugtkw9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMMfsIV7;
	arc=none smtp.remote-ip=91.218.175.187
Received: from mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3654B606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3654B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LMMfsIV7
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PxCNVTb6jX0UZU4kP0/sdxuyaH5XxnIihD4Mw61jNnk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793295056; v=1; x=1793899856;
 b=LMMfsIV7/WEuySCEeQ2ahXjZrszY+S3tecdRjOn+1M62yCAFfHGHSIAKS1DEwfQK1o7OKVxb
 bz2XZ5ru3RXLaPasMWrVcUPjFWcjPvXGUeJ9AOs+lztf4LL72U/mAHJpNKfXXPY1B30JgfpTTSS
 7QgfD0efB+yaycgxYhXyGieE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdb39e29496ef9b2;
	Thu, 29 Oct 2026 17:30:56 +0000
X-Mizu-Trace-ID: cdb39e29496ef9b2
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	chenhuacai@kernel.org,
	ardb@kernel.org,
	shuah@kernel.org
Cc: ilias.apalodimas@linaro.org,
	akpm@linux-foundation.org,
	baoquan.he@linux.dev,
	ruirui.yang@linux.dev,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [PATCH v6 6/8] LoongArch: Enable kexec handover (KHO)
Date: Fri, 30 Oct 2026 02:29:53 +0900
Message-ID: <20261029172956.20791-7-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029172956.20791-1-dongtai.guo@linux.dev>
References: <20261029172956.20791-1-dongtai.guo@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: George Guo <guodongtai@kylinos.cn>

Enable ARCH_SUPPORTS_KEXEC_HANDOVER on 64-bit LoongArch with EFI_STUB.
KHO state is passed through an EFI configuration table installed by
the stub.

Disable KHO at boot if the table is missing, since the kernel cannot
pass KHO state to the next kernel without it.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig        |  3 +++
 arch/loongarch/kernel/setup.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index a21f51e5815e..d35ddd6ec540 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -685,6 +685,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_KEXEC_FILE
 	def_bool 64BIT
 
+config ARCH_SUPPORTS_KEXEC_HANDOVER
+	def_bool 64BIT && EFI_STUB
+
 config ARCH_SELECTS_KEXEC_FILE
 	def_bool 64BIT
 	depends on KEXEC_FILE
diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index dff2e0c67ea0..e1023f93460c 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -20,6 +20,7 @@
 #include <linux/initrd.h>
 #include <linux/ioport.h>
 #include <linux/kexec.h>
+#include <linux/kexec_handover.h>
 #include <linux/crash_dump.h>
 #include <linux/root_dev.h>
 #include <linux/console.h>
@@ -594,6 +595,20 @@ static void __init prefill_possible_map(void)
 }
 #endif
 
+/*
+ * Only the EFI stub installs the KHO table, on a cold boot. A kernel
+ * started by kexec from a kernel that did not install it has no table,
+ * and the next kernel would not find what this kernel preserves, so
+ * turn KHO off.
+ */
+static void __init kho_check_efi_table(void)
+{
+	if (kho_is_enabled() && !efi_kho_table_found()) {
+		pr_warn("No EFI KHO table, disabling kexec handover\n");
+		kho_disable();
+	}
+}
+
 void __init setup_arch(char **cmdline_p)
 {
 	cpu_probe();
@@ -608,6 +623,7 @@ void __init setup_arch(char **cmdline_p)
 	bootcmdline_init(cmdline_p);
 	jump_label_init(); /* Initialise the static keys for early params */
 	parse_early_param();
+	kho_check_efi_table();
 	reserve_initrd_mem();
 
 	platform_init();
-- 
2.53.0

