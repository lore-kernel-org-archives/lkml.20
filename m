Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F290E409620
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340154; cv=none; b=tRZB/LdXu7EMH05dzkxBV3anHudHsm921KYeceR7SMqMqGrQtt91BtMso87j9LXqe1dBtykGKWYyFi9P2qbtOFXOYRdlcRdc6QMxOZ0/Y4T8MiQEfyxhOlndhAIbtDp4VoDYJ94E8oZtaHaT2qlkIQdwWOONUZTESVGZ4BXaXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340154; c=relaxed/simple;
	bh=DX0h9Kv8RfaRB4Jkrya9CrXRZqkgLHqMm8No277bvSU=;
	h=From:References:Message-Id:In-Reply-To:Cc:Subject:Mime-Version:
	 Content-Type:To:Date; b=DwugN1jbrpJz/+KQs5gSCjf3H13N+6eh0+9+lTPabC7QKvQbqgFu2/hti5DLxTp7t7KfmcDBHWa8S1H8fd188p9U1es10uWe/P406Qv0tVb2CROo/qd2I5JDcGvQoT9241VzCIQhHF4VWUKNVKERA+ObqL10FIr3jCgLilUnAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=rdkWWHNd; arc=none smtp.client-ip=209.127.231.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="rdkWWHNd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340141; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=aUR1yoU4JOYPKs/rMqqJfgyInNDV//hmTuzZfbk6yls=;
 b=rdkWWHNdH94aMaglnZ8RSidXMbenbGTGMW+ZAVXi6x4WVscyo12myfk5LHX8RFhOYHoA02
 olnSMdRMD5Mr7EDV0clW27QbVYsYL6x7Gs/NtRC4MJemOMeu+FqTTCui6/VOs38Ngz1ooa
 ofzdj0VZlwo8kpbcqJL+Co2k45j/8VbT3WVzggolczE8DyBIDqKFwI2eA0czkntKraQkgM
 Vxlj8JH6tqGNoyQoICxul50CT+9pqG34ZONPmomNGrnfJ0JxGG4pqppGDVFJ8QMUI7M74A
 VC2t9aZGbIGI0IuUCcC7BeFSPkp2uXMZqxUCk+F0S55fPzW2MGf6cNsA+9jbZw==
From: "Yufan Dou" <douyufan@picoheart.com>
References: <20260902090850.2601-1-douyufan@picoheart.com>
Message-Id: <20260902090850.2601-3-douyufan@picoheart.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20260902090850.2601-1-douyufan@picoheart.com>
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Subject: [PATCH RESEND 2/3] riscv: kexec_file: size the ELF placement search by the load extent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:08:58 +0800
X-Original-From: Yufan Dou <douyufan@picoheart.com>
Content-Type: text/plain; charset=UTF-8
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Date: Wed,  2 Sep 2026 17:08:49 +0800
X-Mailer: git-send-email 2.53.0
X-Lms-Return-Path: <lba+26a97e7ab+c68bc7+vger.kernel.org+douyufan@picoheart.com>

elf_find_pbase() searches for a memory hole to place the whole kernel
image, and the segments are then added at fixed addresses derived from
the base it returns. kexec_add_buffer() skips the memory hole check for
a segment whose address is already known.

The search is sized by the length of the ELF file, which does not
reflect the extent the image occupies in memory: a PT_LOAD segment can
have a memory size larger than its file size, so a stripped vmlinux can
end up needing more memory than the file length accounts for. The tail
of the image is then placed without any check that the memory is
available.

Size the search by the extent between the lowest and the highest
physical address of the PT_LOAD segments instead, and drop the now
unused kernel_len argument.

Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Cc: stable@vger.kernel.org
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/kexec_elf.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index 3e9a32acb8f2..d84548f9d289 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -54,9 +54,9 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
  * Go through the available phsyical memory regions and find one that hold
  * an image of the specified size.
  */
-static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
-			  struct elfhdr *ehdr, struct kexec_elf_info *elf_info,
-			  unsigned long *old_pbase, unsigned long *new_pbase)
+static int elf_find_pbase(struct kimage *image, struct elfhdr *ehdr,
+			  struct kexec_elf_info *elf_info, unsigned long *old_pbase,
+			  unsigned long *new_pbase)
 {
 	int i;
 	int ret;
@@ -64,6 +64,7 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	const struct elf_phdr *phdr;
 	unsigned long lowest_paddr = ULONG_MAX;
 	unsigned long lowest_vaddr = ULONG_MAX;
+	unsigned long highest_paddr = 0;
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &elf_info->proghdrs[i];
@@ -75,6 +76,9 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 
 		if (lowest_vaddr > phdr->p_vaddr)
 			lowest_vaddr = phdr->p_vaddr;
+
+		highest_paddr = max(highest_paddr,
+				    (unsigned long)(phdr->p_paddr + phdr->p_memsz));
 	}
 
 	kbuf.image = image;
@@ -88,7 +92,12 @@ static int elf_find_pbase(struct kimage *image, unsigned long kernel_len,
 	 */
 	kbuf.buf_align = PMD_SIZE;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf.memsz = ALIGN(kernel_len, PAGE_SIZE);
+	/*
+	 * The segments are added at fixed addresses later on, which makes
+	 * kexec_add_buffer() skip the memory hole check, so the range searched
+	 * here has to cover the whole extent the image occupies in memory.
+	 */
+	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PAGE_SIZE);
 	kbuf.cma = NULL;
 	kbuf.top_down = false;
 	ret = arch_kexec_locate_mem_hole(&kbuf);
@@ -115,8 +124,8 @@ static void *elf_kexec_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		return ERR_PTR(ret);
 
-	ret = elf_find_pbase(image, kernel_len, &ehdr, &elf_info,
-			     &old_kernel_pbase, &new_kernel_pbase);
+	ret = elf_find_pbase(image, &ehdr, &elf_info, &old_kernel_pbase,
+			     &new_kernel_pbase);
 	if (ret)
 		goto out;
 
-- 
2.34.1
