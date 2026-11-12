Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490491;
	b=X4byEJGTllo63jKKYVzz+gsTbuW4b3NjZg3YeZHGAMU5fowKhDOkBHO1FJOM6jLTmxXg
	 jfVpPc2OmDTpZkEjP6cD3oSD9MmcisALkrn4UI3QldMZhJyhbpmAzbeTjvZ5wTql0Rwab
	 OEm1G6CEQHMaqzQiDc1kcvdZvuxWUYYABxh1aNsKJBVYrnNhH4tN4Y0rDWfOG9MwoKt9L
	 uVlqMzYPHek0P1WdtHSy1huXdKmB17+PVcYOhYRITNs3yEC54nWpgKOqvy26aU/RrwU0N
	 mCZaIQyG6nqKjM0gXxQu3c4Ea7t466HvAC28lqVneG8EJUageaw8pr6j+qNa1YbndNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490491;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=VAYr9WX92dg3SvFjZudKbj8hGUmjBf0kHQsMj3Huy2A=;
	b=Apy0rVWMXMo0+qwzTD1P8BvBQr4pNIZrGrD0pnGdBzhpypbP5HG7AOkiwPZFmxy0Xsrv
	 UWehmoJeCOxAJKk7NgQRsPsH331IY2mkzcuYPf1OxKwRievjDEcIWSJ8cs5w+7gy4+ibl
	 9WuvHFe8EWdkAAEUb1uz1scobliCrMxCTwFt8a4XzIJEhvEPyhS6JiXu2QVnLHyNNQA1H
	 BkKsNwkF9UwQhl5bgZnOpWL6dZM3HppPfudVfvUIzEmaDjsH2cPIsJ4nTPMN/r8dp45OZ
	 6RRQW+6LrlENksdCTyFmIcksknZIQ6+Vs3HaNNtC98SpjlIDXEO0S+jUBjlWwVSlk6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gxvGi8l5;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D892D606A8BF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D892D606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gxvGi8l5
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=VAYr9WX92dg3SvFjZudKbj8hGUmjBf0kHQsMj3Huy2A=;
	b=gxvGi8l5GYdAixG1QRWsiSMLXXsHyOINqSPUArEqcmmeWhWDwV6nk3CkHtY7MDp+FMWYyzx6n
	HOBPUbx0XU/w94jHsTYt7dspTnSwdWfKEmGxB/qdyl9efuTCs2wvrwlVEjkDtbQfNn79EZnH2fE
	I8C2D6gS4O3csk5lTZtUg8E=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jQLwW62KXz12LD4;
	Thu, 12 Nov 2026 21:34:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4125240575;
	Thu, 12 Nov 2026 21:34:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 12 Nov
 2026 21:34:44 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruanjinjie@huawei.com>, <leitao@debian.org>,
	<yeoreum.yun@arm.com>, <mpilaniy@redhat.com>, <robh@kernel.org>,
	<coiby.xu@gmail.com>, <Yeking@Red54.com>, <prudo@redhat.com>,
	<brads@mainlining.org>, <sourabhjain@linux.ibm.com>, <mkchauras@gmail.com>,
	<blum@kernel.org>, <adityag@linux.ibm.com>, <qirui.001@bytedance.com>,
	<hui.wang@canonical.com>, <sohammetha01@gmail.com>, <guoren@kernel.org>,
	<gaohan@iscas.ac.cn>, <ionut.nechita@windriver.com>,
	<vishal.l.verma@intel.com>, <seanjc@google.com>, <ardb@kernel.org>,
	<richard.lyu@suse.com>, <arnd@arndb.de>, <tzimmermann@suse.de>,
	<rick.p.edgecombe@intel.com>, <kai.huang@intel.com>, <kas@kernel.org>,
	<piliu@redhat.com>, <thuth@redhat.com>, <shradhagupta@linux.microsoft.com>,
	<ebiggers@kernel.org>, <jbouron@amazon.com>, <me@linux.beauty>,
	<mclapinski@google.com>, <graf@amazon.com>, <tangyouling@kylinos.cn>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v8 07/11] powerpc: kexec_file: Use the common segment helpers
Date: Thu, 12 Nov 2026 21:34:14 +0800
Message-ID: <20261112133418.4044428-8-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112133418.4044428-1-ruanjinjie@huawei.com>
References: <20261112133418.4044428-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

load_elfcorehdr_segment() builds the elf core header from the powerpc
crash memory ranges and places it as a segment.  The header needs
powerpc specific post processing, so keep building it here, but use
kexec_add_elf_core_header() to place it.

elf64_load() also loads the initrd by hand, use kexec_add_initrd()
for it.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <chleroy@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/kexec/elf_64.c       |  9 ++-------
 arch/powerpc/kexec/file_load_64.c | 14 ++++----------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index d9a466cd602e..1ef444494641 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -96,18 +96,13 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 
 	kexec_dprintk("Command line: %s", cmdline ? cmdline : "");
 
-	if (initrd != NULL) {
-		kbuf.buffer = initrd;
-		kbuf.bufsz = kbuf.memsz = initrd_len;
+	if (initrd) {
 		kbuf.buf_align = PAGE_SIZE;
 		kbuf.top_down = false;
-		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
-		ret = kexec_add_buffer(&kbuf);
+		ret = kexec_add_initrd(image, &kbuf);
 		if (ret)
 			goto out;
 		initrd_load_addr = kbuf.mem;
-
-		kexec_dprintk("Loaded initrd at 0x%lx\n", initrd_load_addr);
 	}
 
 	ret = get_reserved_memory_ranges(&rmem);
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 0cf03cee35a7..77652db7d1ca 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -416,9 +416,8 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	/* Fix the offset for backup region in the ELF header */
 	sync_backup_region_phdr(image, headers, false);
 
-	kbuf->buffer = headers;
-	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-	kbuf->bufsz = headers_sz;
+	image->elf_headers = headers;
+	image->elf_headers_sz = headers_sz;
 
 	/*
 	 * Account for extra space required to accommodate additional memory
@@ -427,13 +426,9 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
 	kbuf->top_down = false;
 
-	ret = kexec_add_buffer(kbuf);
-	if (ret) {
-		vfree(headers);
+	ret = kexec_add_elf_core_header(image, kbuf);
+	if (ret)
 		goto out;
-	}
-
-	image->elf_load_addr = kbuf->mem;
 
 	/*
 	 * If CONFIG_CRASH_HOTPLUG is enabled, the elfcorehdr kexec segment
@@ -442,7 +437,6 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	 * memory in the FDT prepared for kdump.
 	 */
 	image->elf_headers_sz = kbuf->memsz;
-	image->elf_headers = headers;
 out:
 	kfree(cmem);
 	return ret;
-- 
2.34.1

