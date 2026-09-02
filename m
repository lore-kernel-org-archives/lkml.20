Received: from sg-3-27.ptr.tlmpb.com (sg-3-27.ptr.tlmpb.com [101.45.255.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E51930C606
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340190; cv=none; b=VTbucbp0DjZGb2VHVHs23lv/xO39iJZ8Q3hZTcMOEuizlQNR3I5qPnYEaHgzbe+rK9MfOfr9GKRC8s/gL6PAVbPWSta+v+M5mpCPxKFoVSj5mPVCT0A7V29xAFBANBvuNnvaHc754jXQu4yxygZv+3l+zoXRjwarmqouW+g6LLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340190; c=relaxed/simple;
	bh=xDcl2IzrUmdFBAk/D7YGSp5x4q5rTB0jmTqOmetd1cY=;
	h=To:Cc:Content-Type:From:Mime-Version:References:Subject:
	 In-Reply-To:Date:Message-Id; b=VXiIUQq3X2l+bJGR+pwRM1FppohQ8ZWpNsFywXuddLKWQlOzJmmbFR8XGI83mrbqMWRyWA/fCBaLaaO7MMEKTWE0EVwCVHY+Q1FXdsoCKH2C/bv5RAXt/bpVGLg5DpcHr2EcvvmO435l0I/nBN0XOb1dkODNsQoJIrnupRo0KAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=HWXaBiVj; arc=none smtp.client-ip=101.45.255.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="HWXaBiVj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340138; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=C50quJcwO5XVGyYBcmo1hG+o10dNM+2wEjOwukPtWwY=;
 b=HWXaBiVjdiuaIE60TfJ0uL5CZSkuKEf91ukIJA48qPEUONASvLZW1AbDXyUtES6gVLqyKc
 9kunO4rCl25aCi3e7TJJrYjhsGMXjM0m+FCdnC4/H1yEGz8Z2KAq52NL97PYAl6URbiTKP
 J6MfXxW0vs7hoRRHG5bjMvMiEZRH9rNllujVlEIHtTZjSxHSSujLv321cC4Gcu5X0wEoP7
 TnM4XptPqV5hh+83MBuMO1B1w2TyD93jImZO8eRMGsikujtkoDLMw5z1vCbVyp0ZSmZ3KW
 zcz9zi0ygH61yJ6Q8wN1CqL4/onDBDsBRJG1fIZDEf/wyr+wzGlJ7gZjDA932Q==
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:55 +0800
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
From: "Yufan Dou" <douyufan@picoheart.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902090850.2601-1-douyufan@picoheart.com>
Subject: [PATCH RESEND 1/3] riscv: kexec_file: constrain extra segments to the Sv39 direct map
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26a97e7a8+ca87f3+vger.kernel.org+douyufan@picoheart.com>
X-Original-From: Yufan Dou <douyufan@picoheart.com>
In-Reply-To: <20260902090850.2601-1-douyufan@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:48 +0800
Message-Id: <20260902090850.2601-2-douyufan@picoheart.com>

When an Sv48 or Sv57 kernel loads an Sv39 kernel, top-down allocation
can place the initrd and other extra segments above the direct-map
range supported by the next kernel.

During early boot, setup_bootmem() limits usable memory to
phys_ram_base + KERN_VIRT_SIZE. Any segment placed above the Sv39 limit
is therefore unreachable by the next kernel. In particular, an initrd
outside this range is disabled during boot.

The max_low_pfn limit only reflects the direct map of the loading kernel
and is insufficient when the next kernel uses a narrower address space.

The paging mode of the next kernel is not known at load time, so apply
the Sv39 limit unconditionally. On a machine with more than 128 GiB this
also constrains a next kernel that would run in Sv48 or Sv57.

Limit extra segment placement to the smaller of the loading kernel's
direct-map limit and the end of the Sv39 direct map. The next kernel
derives its direct map from the start of the memory it is given, which
is the crash kernel region for a crash image, so use that region as the
base in that case. A NOMMU kernel has no direct map and keeps the limit
of the loading kernel.

Fixes: b67a1ee0db00 ("riscv: kexec_file: Constrain segment placement to direct map")
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 26cd2a8bd0cd..15a3c180c558 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -239,6 +239,29 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 }
 
 
+/*
+ * The next kernel may run in Sv39 even when the current kernel runs in Sv48 or
+ * Sv57, in which case the direct map of the next kernel is narrower. Any
+ * segment placed above it is unreachable by the next kernel during early boot.
+ * The next kernel derives its direct map from the start of the memory it is
+ * given, which is the crash kernel region for a crash image. A NOMMU kernel
+ * has no direct map, so only the limit of the current kernel applies.
+ */
+static unsigned long kexec_segment_limit(struct kimage *image)
+{
+	unsigned long limit = PFN_PHYS(max_low_pfn);
+#ifdef CONFIG_MMU
+	unsigned long base = phys_ram_base;
+
+#ifdef CONFIG_CRASH_DUMP
+	if (image->type == KEXEC_TYPE_CRASH)
+		base = crashk_res.start;
+#endif
+	limit = min(limit, base + BIT(VA_BITS_SV39 - 2) - 1);
+#endif
+	return limit;
+}
+
 int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			    unsigned long kernel_len, char *initrd,
 			    unsigned long initrd_len, char *cmdline,
@@ -252,7 +275,7 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 
 	kbuf.image = image;
 	kbuf.buf_min = kernel_start + kernel_len;
-	kbuf.buf_max = PFN_PHYS(max_low_pfn);
+	kbuf.buf_max = kexec_segment_limit(image);
 
 #ifdef CONFIG_CRASH_DUMP
 	/* Add elfcorehdr */
-- 
2.34.1
