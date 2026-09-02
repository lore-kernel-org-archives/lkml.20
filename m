Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB54CCDFC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788340151; cv=none; b=OELgwpWO3G15oHLQPd1R1l+aqxYnaQnpzQ7GVGLsC/mCJO3qZTNvy5J5TdV0R0ccHx/1yFAz93raTlru6KQXGJ+dhxWXyyNnONJatwkK0b8fA2RRRO3xASUaJu+p55dzMgHVaHeGYJLEjHKpkf9tC7m4PCpcfMK1N4xj0tKgWz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788340151; c=relaxed/simple;
	bh=pD+9laa4E7WkYT99IPB3WFVAXsL8rzxMBi3kdhtqGpQ=;
	h=Cc:Date:Message-Id:References:Subject:From:Content-Type:To:
	 Mime-Version:In-Reply-To; b=qqhu1UyxELen0uLtD+DdlWXb6TIswUfZeouPHtJhRwsbrq3eeHeMncImVk8uTvPTEmS85xF9XdWUGCmKDaRfs8ZyPkeDaGbAtHqRIht2hZPpqWA1mns9VeqE3l0kiZAksSdHcBhmwVyOq2YSZnciEtDwqvy/pPQMlE8faUHUn+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com; spf=pass smtp.mailfrom=picoheart.com; dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b=AtkO+zDb; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=picoheart.com header.i=@picoheart.com header.b="AtkO+zDb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788340144; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=lfe3yVyViIS9QqUrO1FybHOjTXn3fmtNC6AuZnCPPzk=;
 b=AtkO+zDbwLHbqHZ4a7vKzChKqTVswWTXORYE3jIgxNovZnRz55nVPtRftH57Lbz0sNl59j
 blBYHXhzARNqmfe0ybj3M04bBQdK2MnjIfPAk6S5SgxVznRVLr3G100s6Be+rfLt4N6NGx
 DVJJlMWHXUFnvHvRnv1fMlNqr3brTUR7hQuPh8j7uLoZgtpZb4g1U21TpmVgsXgpH03aJI
 H+CtdA20moZKwI7WgVRioswgv4VUG3/COD+MOisA/z1rlTJk6IyW5Rft3ZkujJgiv/2uN+
 AkdmehHW4dqMSLZSuYirgRHJ9Fx5TNDI9XxwToWSoihXaDCnNHWFh/dUDwFzSg==
Cc: <alex@ghiti.fr>, <leitao@debian.org>, <akpm@linux-foundation.org>, 
	<ajones@ventanamicro.com>, <lizhengyu3@huawei.com>, 
	<liaochang1@huawei.com>, <songshuaishuai@tinylab.org>, 
	<bjorn@rivosinc.com>, <gaohan@iscas.ac.cn>, <douyufan@picoheart.com>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yang.yicong@picoheart.com>, <weidong.wd@picoheart.com>, 
	<geshijian@picoheart.com>
Date: Wed,  2 Sep 2026 17:08:50 +0800
Message-Id: <20260902090850.2601-4-douyufan@picoheart.com>
References: <20260902090850.2601-1-douyufan@picoheart.com>
Subject: [PATCH RESEND 3/3] riscv: kexec: reserve the PMD-aligned kernel image range
X-Lms-Return-Path: <lba+26a97e7ae+16ab78+vger.kernel.org+douyufan@picoheart.com>
Content-Transfer-Encoding: 7bit
From: "Yufan Dou" <douyufan@picoheart.com>
X-Original-From: Yufan Dou <douyufan@picoheart.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from 5CG30262N9-QAP.localdomain ([120.234.49.250]) by smtp.feishu.cn with ESMTPS; Wed, 02 Sep 2026 17:09:01 +0800
In-Reply-To: <20260902090850.2601-1-douyufan@picoheart.com>

When strict kernel permissions are enabled, the next kernel extends
its image reservation from _start to the PMD-aligned address following
_end. If kexec only reserves the exact image range, a later segment can
be placed in this aligned tail and overlap the next kernel's
reservation.

For a flat Image, extend the decoded image size to the next PMD
boundary.

An ELF image contains multiple PT_LOAD segments. Extending every
segment can make an intermediate segment overlap the following one.
Find the PT_LOAD segment with the highest physical end address and
extend only that segment to the next PMD boundary. Align the extent
searched by elf_find_pbase() as well, so that the expanded tail stays
within the range validated against the available memory.

This reserves the range expected by the next kernel without changing
the layout of intermediate ELF segments.

Fixes: 6261586e0c91 ("RISC-V: Add kexec_file support")
Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary file")
Cc: stable@vger.kernel.org
Co-developed-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
Signed-off-by: Yufan Dou <douyufan@picoheart.com>
---
 arch/riscv/kernel/kexec_elf.c   | 21 +++++++++++++++++++--
 arch/riscv/kernel/kexec_image.c |  7 ++++++-
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/kexec_elf.c b/arch/riscv/kernel/kexec_elf.c
index d84548f9d289..da5679bf1d0c 100644
--- a/arch/riscv/kernel/kexec_elf.c
+++ b/arch/riscv/kernel/kexec_elf.c
@@ -28,6 +28,15 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 	int ret = 0;
 	struct kexec_buf kbuf = {};
 	const struct elf_phdr *phdr;
+	unsigned long highest_paddr = 0;
+
+	/* Find the highest physical end address of the kernel image. */
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = &elf_info->proghdrs[i];
+		if (phdr->p_type == PT_LOAD)
+			highest_paddr = max(highest_paddr,
+					    (unsigned long)(phdr->p_paddr + phdr->p_memsz));
+	}
 
 	kbuf.image = image;
 
@@ -41,6 +50,13 @@ static int riscv_kexec_elf_load(struct kimage *image, struct elfhdr *ehdr,
 		kbuf.buf_align = phdr->p_align;
 		kbuf.mem = phdr->p_paddr - old_pbase + new_pbase;
 		kbuf.memsz = phdr->p_memsz;
+		/*
+		 * The next kernel aligns its image reservation on PMD_SIZE, as
+		 * explained by a comment in setup_bootmem(). Reserve that tail
+		 * so subsequent segments do not overlap it.
+		 */
+		if (phdr->p_paddr + phdr->p_memsz == highest_paddr)
+			kbuf.memsz = ALIGN(kbuf.mem + phdr->p_memsz, PMD_SIZE) - kbuf.mem;
 		kbuf.top_down = false;
 		ret = kexec_add_buffer(&kbuf);
 		if (ret)
@@ -95,9 +111,10 @@ static int elf_find_pbase(struct kimage *image, struct elfhdr *ehdr,
 	/*
 	 * The segments are added at fixed addresses later on, which makes
 	 * kexec_add_buffer() skip the memory hole check, so the range searched
-	 * here has to cover the whole extent the image occupies in memory.
+	 * here has to cover the whole extent the image occupies in memory,
+	 * including the PMD-aligned tail of the last segment.
 	 */
-	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PAGE_SIZE);
+	kbuf.memsz = ALIGN(highest_paddr - lowest_paddr, PMD_SIZE);
 	kbuf.cma = NULL;
 	kbuf.top_down = false;
 	ret = arch_kexec_locate_mem_hole(&kbuf);
diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 51dc89259f16..52678b3044fd 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -69,7 +69,12 @@ static void *image_load(struct kimage *image,
 	kbuf.buffer = kernel;
 	kbuf.bufsz = kernel_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf.memsz = le64_to_cpu(h->image_size);
+	/*
+	 * The next kernel aligns its image reservation on PMD_SIZE, as
+	 * explained by a comment in setup_bootmem(). Reserve that tail so
+	 * subsequent segments do not overlap it.
+	 */
+	kbuf.memsz = ALIGN(le64_to_cpu(h->image_size), PMD_SIZE);
 	kbuf.buf_align = le64_to_cpu(h->text_offset);
 
 	ret = kexec_add_buffer(&kbuf);
-- 
2.34.1
