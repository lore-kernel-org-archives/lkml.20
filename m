Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D05492E21
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 23:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908987; cv=none; b=Z6CAEVM7KQt29ByyQS3YTcjFTlN8Y82uhKpAkRbtlKimedg/nzHqIW52lGNCKp+o8iILpIIUAoSJaZCgIDcfACWjrd+KeASqoLZEaeYkUaJ7lpUTna1EiV+FVRtOIQibMz56QQKcrbFmdTFTVf5oL63gQZERLgYXHIxr15G3PrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908987; c=relaxed/simple;
	bh=atrQOTjrNgABMsK63b7+x9nwBtP4l6gXo/MfCfGKi4s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PiT7Cs7JhrIUV3pJWfVnlgBOPJ2XAKqWV9waQxObhJfib2itHPQbRNnciWXE8uyhvUxGT+rhpbRvQ938V2fsfZDFh6r5A+p+S5IFa0ad/3+VpNxCpuOkewjdbXkZmgH1uVAPhz39hY1IMdUHN0aqiprs9DPAjm4e+rLu/u2E3eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6j3gGtD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6j3gGtD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so41799575e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908982; x=1789513782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=F6j3gGtDWuk06NJt//uFMPNqNX0Rt7/fBXc6J9pg8UKN8hi/rmm4JZoIxXmTBPr228
         6ZNhbPu4JFwkAoAtRBUImddloTtjMpiAyWTVgjgZya/zWTc6kQFFGc6oVskDZuGIMWUs
         D2akvJT5Kzsvx5oDCj79e8Hnd0/31IiTZRBAByRKogExR23wotvhe6IDfWvmbdbKTWJq
         l1wjIHbF/7byVkd67ggaGeJqieCDqcbtWJPhploQcENcamavkS6rvVfIYVtCGu/C5HzL
         Z98KA6un4wPq3dT+iYGdqcQRjO196A+1zf2iETyhL0dcCLKsTZcvvNlzwpLq4ITUb2Cd
         aXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908982; x=1789513782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=eD457MFguUvNW4uVKEVa9YeEs6WA/FxHAQTl1ksSvcf0l7qofdDJ+qOF4d5gVARbWk
         kkGFNKhKGeKlT0t9ScTXJsREloFyPgFWceAOjFZ4chqCOQeemqDM4XoetaWJrhXVv6gN
         BeRFkwJL6Uqo9pP1ohii0Juc7UbD863snEUW5nHiGLt8ekyWuiY3vqxQySciMzDSWZWs
         aOHC4gFjb3VjrIezxU8sjVlZNpyE/NHRFMm+dpZEXwxSlPFVEJBfKxSndBck/lpKySDV
         5BLDG586e4zzgDgeVJhU2R0baiR0wBIY/WWaFc9QaLPnGjFITN1MLEFtho/U2CjDf1n7
         oW4A==
X-Forwarded-Encrypted: i=1; AKwUvByYnk/mMQIGybFJ86ILvvnsWLwoG0Q04mOpX1obrfxACDW0YSbClsw1SPxlHqJMEKrtn1DySYURVKP6yHc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrn5OWzeTEcPtZyODWrHx8/9e3ff2eiEvAk1o+yICIbXyWc1rT
	/VB9ofVzFAJRYLTw4cahKzvd/O5OEIq1MGG7EqUD2fzIJx13XTZxB4sW
X-Gm-Gg: AYBFou14+czxiVPItZa6cZUo3JfNou0m2XkXjKedqaU+r3QB+p4hWHCf+qo4DwYu+aZ
	qBwSfOQPgmHgawG6ULvaZ9kwa3KTAGaDqa9t0+uUgJPWEYNxrgdNEB5dgOJu6NUk4hTJfeD+p39
	DMR9Hvbggw7AzRIKmTtQHIeD6dJx05aSmeTwpYakMUbgbh7MyYJSax0Zc1tEYmdCP6Y+yfB0mpS
	vsPPKXax6zt1B9ljP9rg+Y42MeD1FmGzWOP8pF5y2emYz70MS7wEDinBP362RP6I7vdspyOesed
	chOGuDxtBgpAhYwAXtrnTfivyZpUExBGa5Ee5zizIZDokVSzH7SFPdSjQ0J9GVF1f7upW+Hz6Ax
	55vTnhlFpTqXd56gCcGsGQRP5tIgAauwOZuXsLQku0lzEFnhNTBCVO0ihdCfNfgTo0kznjNmaFs
	RYx08geJesX1IdvLeKgMCY0mfepuJo7gdsBGbCUST3QM+hydJW6+YsC9xZ2wdr6qMs+CwXJ7IaV
	NJRQLXVwRHQ9Ab32ATn2QObGTa7unGxJY+OWFnS/LuJWQa4lCTYFUNB3gBt3k/A89vpqs3Nd12b
	9iR/+vjVK/hFsIm7PtClx2lp1Q==
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr254595975e9.26.1788908982187;
        Tue, 08 Sep 2026 16:09:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm385530905e9.3.2026.09.08.16.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 16:09:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nicolas Pitre <nico@fluxnic.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-modules@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] module: reject out-of-range relocation target indices
Date: Wed,  9 Sep 2026 01:08:15 +0200
Message-Id: <20260908230815.78409-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

apply_relocations() skips relocation sections whose sh_info target index
is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
use sh_info earlier in module_frob_arch_sections(), before this check.

ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
sh_flags outside the section header table. PA-RISC uses it to index an
e_shnum-sized heap array for a read and an update. QEMU reproduced
page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
miss on the PA-RISC array read.

Validate sh_info for SHT_REL and SHT_RELA sections in
elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
architecture code can use the index.

Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
ARM32 instance in a source-identical ARM module_frob_arch_sections()
slice. Eva reported the out-of-range section-table pointer and sh_flags
access.

The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
'trace-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
the touched loop in kernel/module/main.c are identical between the two
commits.

Each A/B test changed only a relocation section's sh_info to
0x10000000. The same configurations and modules were used before and
after the change. All controls loaded before and after the change. The
fixed kernels rejected the malformed modules with ENOEXEC.

Original-kernel results with QEMU 10.2.1 TCG:

- ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
  VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
- ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
  module_frob_arch_sections()+0x110.
- PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
  generic-32bit_defconfig: Data TLB miss at
  module_frob_arch_sections()+0x11c on the stub_entries read for a
  counted R_PARISC_PCREL17F relocation.
- RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
  MODULE_SECTIONS enabled: page fault at
  module_frob_arch_sections()+0xe4.
- LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
  at module_frob_arch_sections()+0x1b8.

On x86_64, which has no vulnerable early sh_info access, the original
kernel loaded both modules. The fixed kernel loaded the control and
rejected the malformed module with ENOEXEC. The test used pc/qemu64,
x86_64_defconfig and GCC 15.2.0.
---
 kernel/module/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..30c7a05488bc 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1933,6 +1933,7 @@ static int elf_validity_ehdr(const struct load_info *info)
  * * Section array fits in the user provided data
  * * Section index 0 is NULL
  * * Section contents are inbounds
+ * * Relocation section target indices are inbounds
  *
  * Then updates @info with a &load_info->sechdrs pointer if valid.
  *
@@ -1983,6 +1984,12 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	/* Validate contents are inbounds */
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &sechdrs[i];
+		if ((shdr->sh_type == SHT_REL || shdr->sh_type == SHT_RELA) &&
+		    shdr->sh_info >= info->hdr->e_shnum) {
+			pr_err("Invalid ELF relocation section target index %u\n",
+			       shdr->sh_info);
+			return -ENOEXEC;
+		}
 		switch (shdr->sh_type) {
 		case SHT_NULL:
 		case SHT_NOBITS:

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.53.0
