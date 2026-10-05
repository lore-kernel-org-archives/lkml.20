Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F15447CA81
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 11:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198319; cv=none; b=YsqoQoyu221GVLotkruILCN55J9UcEqWKyhVei80E7GXX1jXsFukNeDpveoIDzLx+0d47MQ0tbkSxuZvdK0C7NyFlZx0jbBwZGG3KgOuBAILZ6anEBw5b2a8AGCE/Z2sDtSOGhLcJ7ZzIJLXOdHNl1F4ocpgiclLrBRk6UbBrBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198319; c=relaxed/simple;
	bh=s4tcOfzLSqsGWB9oMjcHbGvW1A5Pwmd8OAemfxWKCTE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r/o/2wsnc08FzfVYLFMbc43z1cO0pSYPgaZq9BE0NlMj+TDP9dTZj1JG1WFOr8P1lgOks0Av3hwv5BNCTlPWwQev6GJ3vV5UDX7jknzOum84PkxoPmkMah57IlawHDrrReMbwsAcF8VHK0Vp8wbxsWL0xsN+gYSweZUs0PLFPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aWVVN4w+; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aWVVN4w+"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49953abe51fso11986225e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791198315; x=1791803115; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V0QW7YwfCCedwCbC5bivdpOwWZPtSzCQDCT7zqxHUto=;
        b=aWVVN4w+y561ooF1BWzMZu8OzhMZcNeOvVqbG6ApnfJtyaIXk1tKLugemrXgEjRSUo
         zfqt8sqFULUUNObW51ywNjMAL3msCbNhqVY5YIYRqITTt0cRzJDMAdIHmAVkf+X6sg+J
         JYjlBGPlPNuIMDg1CG9wtQZtfVjB2fUJkl959DIV93epPEZahLcHmvoyFQSqjADEgUNk
         CYT+Dws6g1wiKScC6KLrVaavh3hitgbv33vt7ThjpMnshK5xfOUUUXQ5srfz4DsBaOR0
         KloAdYSLUF5bbm9XdLyndMx5rb7ACkwcZZ9+0Z+W0vgMm9lf1K76CcS1qaVWnZGGcmfm
         fnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198315; x=1791803115;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V0QW7YwfCCedwCbC5bivdpOwWZPtSzCQDCT7zqxHUto=;
        b=yVXMYCNMTla9vzDVve5eiKtTBgDM6MHJqEq+1KCctPmsPEfQcwmjKGBG9cB/ADlxPK
         LCaZWa5opMBIw2eQFvYG/Kc9E5wBXhKR5CBHT49FKgbwgOtzK+7ZDrIoCaVnlQxpJdAm
         rJzXaThghLnh0g5BJ9dq8D5QzxFNi2O4MPlWuwg+BI2r2KERli+HHpTYtXyFQkf4ZcGA
         PmewX9V4zifi4NrRLvYDiITp5sSC9IFyXXSdKas9d4PhUEIX7uUJfoy2+Qk1oXP8ozI8
         AQ04GHVKV9JmDn2b1BoJpu2yhdUgLS8TfMqkqBOC/HD2qCv0C0gtvEExPhrwj6xpMrVk
         WNhA==
X-Gm-Message-State: AFuF++kpeTAe6ISTiXZ1tyXCdLa10cOmza0N2RVlmcC/u59ItzwK10Kg
	MOv0aaoBy7lEXNEGVPNOnMJ64U+veWV11O3BKCdTakQrmMAh3QdWXN0kpOe/kyIfT8EHwaMOSQ=
	=
X-Received: from wruv9.prod.google.com ([2002:a5d:6789:0:b0:48b:1179:ca12])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1907:b0:4a0:3b9:f16b
 with SMTP id 5b1f17b1804b1-4a027459456mr185621445e9.0.1791198315051; Mon, 05
 Oct 2026 04:05:15 -0700 (PDT)
Date: Mon,  5 Oct 2026 13:05:13 +0200
In-Reply-To: <20261005110511.157016-4-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261005110511.157016-4-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261005110511.157016-5-ardb+git@google.com>
Subject: [PATCH v2 1/2] arm64: module: Emit BTI veneers for cross-section calls
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The compiler is permitted to omit BTI landing pads from static functions
that never have their address taken, but are only called directly, even
if those calls originate from other code sections.

This means that calls into a module's .text section from .init.text,
which may need to be routed via a PLT if .text is out of direct
branching range, may result in BTI exceptions due to the indirect calls
performed by the PLT veneers. (Note that calls to .init.text from .text
are not allowed.)

The 'solution' is to emit yet another veneer - this is what the ELF
psABI for AArch64 mandates in this case.

So derive an upper bound for the number of veneers that may be needed in
the core module region to ensure that any call from init code that ends
up needing a PLT can be directed at a veneer with a BTI landing pad, and
allocate the additional space.

Then, emit these veneers as needed, i.e., only when emitting a PLT entry
for a call from an init code section to a normal code section in the
same module. In practice, this only occurs when a module's .init.text
happens to be allocated far away from its .text section, which might
happen when the initial 128M 'near' module region runs out of space
between allocating the core module and allocating its init region.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig                  |   7 +-
 arch/arm64/include/asm/module.h     |  12 ++
 arch/arm64/include/asm/module.lds.h |   3 +
 arch/arm64/kernel/module-plts.c     | 128 +++++++++++++++++++-
 4 files changed, 140 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a695f5..23879cb05d6b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -210,7 +210,8 @@ config ARM64
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
-	select HAVE_LIVEPATCH
+	# https://lore.kernel.org/all/20260812162058.612202-5-ardb@kernel.org/
+	select HAVE_LIVEPATCH if !ARM64_BTI_KERNEL
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
@@ -2198,10 +2199,6 @@ config ARM64_BTI_KERNEL
 	depends on CC_HAS_BRANCH_PROT_PAC_RET_BTI
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94697
 	depends on !CC_IS_GCC || GCC_VERSION >= 100100
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106671
-	depends on !CC_IS_GCC
-	# https://github.com/llvm/llvm-project/issues/215547
-	depends on !CC_IS_CLANG || CLANG_VERSION < 210000
 	depends on (!FUNCTION_GRAPH_TRACER || DYNAMIC_FTRACE_WITH_ARGS)
 	help
 	  Build the kernel with Branch Target Identification annotations
diff --git a/arch/arm64/include/asm/module.h b/arch/arm64/include/asm/module.h
index fb9b88eebeb1..0bdac3db5719 100644
--- a/arch/arm64/include/asm/module.h
+++ b/arch/arm64/include/asm/module.h
@@ -16,6 +16,7 @@ struct mod_plt_sec {
 struct mod_arch_specific {
 	struct mod_plt_sec	core;
 	struct mod_plt_sec	init;
+	struct mod_plt_sec	bti;
 
 	/* for CONFIG_DYNAMIC_FTRACE */
 	struct plt_entry	*ftrace_trampolines;
@@ -43,6 +44,17 @@ struct plt_entry {
 	__le32	br;	/* br	x16				*/
 };
 
+struct bti_veneer {
+	/*
+	 * Functions with static linkage may lack BTI landing pads if their
+	 * address is never taken. E.g., a direct call from .init.text to a
+	 * static function in .text may need an additional veneer at the target
+	 * end if it is routed via a PLT entry.
+	 */
+	__le32	bti_c;
+	__le32	b;
+};
+
 static inline bool is_forbidden_offset_for_adrp(void *place)
 {
 	return cpus_have_final_cap(ARM64_WORKAROUND_843419) &&
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index 603f92a8a73e..52bd10766803 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -1,6 +1,9 @@
 SECTIONS {
 	.plt 0 : { BYTE(0) }
 	.init.plt 0 : { BYTE(0) }
+#ifdef CONFIG_ARM64_BTI_KERNEL
+	.text.bti_veneer 0 : { BYTE(0) }
+#endif
 	.text.ftrace_trampoline 0 : { BYTE(0) }
 	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-plts.c
index 7afd370da9f4..e2c009cce96c 100644
--- a/arch/arm64/kernel/module-plts.c
+++ b/arch/arm64/kernel/module-plts.c
@@ -66,12 +66,48 @@ static bool plt_entries_equal(const struct plt_entry *a,
 	       (q + aarch64_insn_adrp_get_offset(le32_to_cpu(b->adrp)));
 }
 
+static u64 module_emit_bti_veneer(struct module *mod, const Elf64_Shdr *sechdrs,
+				  u64 target)
+{
+	struct mod_plt_sec *pltsec = &mod->arch.bti;
+	struct bti_veneer *btiv = (void *)sechdrs[pltsec->plt_shndx].sh_addr;
+
+	/* Look for an existing entry pointing to 'target' */
+	for (int i = 0; i < pltsec->plt_num_entries; i++) {
+		u64 dst = (u64)&btiv[i].b +
+			  aarch64_get_branch_offset(btiv[i].b);
+		if (dst == target)
+			return (u64)&btiv[i];
+	}
+
+	/* Allocate a new veneer */
+	if (WARN_ON(pltsec->plt_num_entries >= pltsec->plt_max_entries))
+		return 0;
+
+	btiv += pltsec->plt_num_entries++;
+
+	btiv->bti_c	= aarch64_insn_gen_hint(AARCH64_INSN_HINT_BTIC);
+	btiv->b		= aarch64_insn_gen_branch_imm((u64)&btiv->b, target,
+						      AARCH64_INSN_BRANCH_NOLINK);
+
+	return (u64)btiv;
+}
+
+static bool target_needs_bti_veneer(struct module *mod, const Elf64_Sym *sym)
+{
+	if (sym->st_shndx == STN_UNDEF ||
+	    ELF64_ST_BIND(sym->st_info) != STB_LOCAL)
+		return false;
+
+	return !within_module_init((unsigned long)sym->st_value, mod);
+}
+
 u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 			  void *loc, const Elf64_Rela *rela,
 			  Elf64_Sym *sym)
 {
-	struct mod_plt_sec *pltsec = !within_module_init((unsigned long)loc, mod) ?
-						&mod->arch.core : &mod->arch.init;
+	bool is_init = within_module_init((unsigned long)loc, mod);
+	struct mod_plt_sec *pltsec = !is_init ? &mod->arch.core : &mod->arch.init;
 	struct plt_entry *plt = (struct plt_entry *)sechdrs[pltsec->plt_shndx].sh_addr;
 	int i = pltsec->plt_num_entries;
 	int j = i - 1;
@@ -80,6 +116,16 @@ u64 module_emit_plt_entry(struct module *mod, Elf64_Shdr *sechdrs,
 	if (is_forbidden_offset_for_adrp(&plt[i].adrp))
 		i++;
 
+	if (system_supports_bti_kernel() && is_init) {
+		/*
+		 * Check if the target is a function with static linkage within
+		 * the same module but in a non-init section: if so, point the
+		 * PLT entry at a BTI veneer instead.
+		 */
+		if (target_needs_bti_veneer(mod, sym))
+			val = module_emit_bti_veneer(mod, sechdrs, val);
+	}
+
 	plt[i] = get_plt_entry(val, &plt[i]);
 
 	/*
@@ -277,11 +323,66 @@ static int partition_branch_plt_relas(Elf64_Sym *syms, Elf64_Rela *rela,
 	return i;
 }
 
+static int count_bti_veneers(const Elf_Ehdr *ehdr, const Elf_Shdr *sechdrs,
+			     const char *secstrings, const Elf64_Sym *syms,
+			     Elf64_Word cur)
+{
+	int count = 0;
+
+	if (!system_supports_bti_kernel())
+		return 0;
+
+	/*
+	 * BTI veneers must be emitted within direct branching range of the
+	 * target function, so that PLTs emitted to perform calls that exceed
+	 * that range can use indirect calls as usual, even if the target
+	 * function lacks a landing pad. This is needed between init code
+	 * sections and normal code sections, which can be loaded far away from
+	 * each other. It should never be needed the other way around, given
+	 * that normal code cannot call init code.
+	 *
+	 * So go over init code sections, and find call/jump relocations
+	 * referring to symbols in the current section. If the symbol has
+	 * static linkage, allocate space for a BTI veneer.
+	 */
+
+	for (int i = 0; i < ehdr->e_shnum; i++) {
+		if (sechdrs[i].sh_type != SHT_RELA)
+			continue;
+
+		const Elf64_Shdr *dstsec = sechdrs + sechdrs[i].sh_info;
+
+		/* Ignore relocations that operate on non-exec sections */
+		if (!(dstsec->sh_flags & SHF_EXECINSTR))
+			continue;
+
+		/* Only look at .init code sections */
+		if (!module_init_layout_section(secstrings + dstsec->sh_name))
+			continue;
+
+		Elf64_Rela *rela = (void *)ehdr + sechdrs[i].sh_offset;
+		int num = sechdrs[i].sh_size / sizeof(Elf64_Rela);
+		for (int j = 0; j < num; j++) {
+			const Elf64_Sym *s = syms + ELF64_R_SYM(rela[j].r_info);
+
+			switch (ELF64_R_TYPE(rela[j].r_info)) {
+			case R_AARCH64_JUMP26:
+			case R_AARCH64_CALL26:
+				if (s->st_shndx == cur &&
+				    ELF64_ST_BIND(s->st_info) == STB_LOCAL)
+					count++;
+			}
+		}
+	}
+	return count;
+}
+
 int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			      char *secstrings, struct module *mod)
 {
 	unsigned long core_plts = 0;
 	unsigned long init_plts = 0;
+	unsigned long bti_veneers = 0;
 	Elf64_Sym *syms = NULL;
 	Elf_Shdr *pltsec, *tramp = NULL, *init_tramp = NULL;
 	int i;
@@ -295,6 +396,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			mod->arch.core.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".init.plt"))
 			mod->arch.init.plt_shndx = i;
+		else if (!strcmp(secstrings + sechdrs[i].sh_name, ".text.bti_veneer"))
+			mod->arch.bti.plt_shndx = i;
 		else if (!strcmp(secstrings + sechdrs[i].sh_name,
 				 ".text.ftrace_trampoline"))
 			tramp = sechdrs + i;
@@ -305,7 +408,8 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 			syms = (Elf64_Sym *)sechdrs[i].sh_addr;
 	}
 
-	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx) {
+	if (!mod->arch.core.plt_shndx || !mod->arch.init.plt_shndx ||
+	    (IS_ENABLED(CONFIG_ARM64_BTI_KERNEL) && !mod->arch.bti.plt_shndx)) {
 		pr_err("%s: module PLT section(s) missing\n", mod->name);
 		return -ENOEXEC;
 	}
@@ -335,12 +439,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		if (nents)
 			sort(rels, nents, sizeof(Elf64_Rela), cmp_rela, NULL);
 
-		if (!module_init_layout_section(secstrings + dstsec->sh_name))
+		if (!module_init_layout_section(secstrings + dstsec->sh_name)) {
 			core_plts += count_plts(syms, rels, numrels,
 						sechdrs[i].sh_info, dstsec);
-		else
+			bti_veneers += count_bti_veneers(ehdr, sechdrs,
+							 secstrings, syms,
+							 sechdrs[i].sh_info);
+		} else {
 			init_plts += count_plts(syms, rels, numrels,
 						sechdrs[i].sh_info, dstsec);
+		}
 	}
 
 	pltsec = sechdrs + mod->arch.core.plt_shndx;
@@ -359,6 +467,16 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 	mod->arch.init.plt_num_entries = 0;
 	mod->arch.init.plt_max_entries = init_plts;
 
+	if (system_supports_bti_kernel()) {
+		pltsec = sechdrs + mod->arch.bti.plt_shndx;
+		pltsec->sh_type = SHT_NOBITS;
+		pltsec->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
+		pltsec->sh_addralign = L1_CACHE_BYTES;
+		pltsec->sh_size = (bti_veneers + 1) * sizeof(struct bti_veneer);
+		mod->arch.bti.plt_num_entries = 0;
+		mod->arch.bti.plt_max_entries = bti_veneers;
+	}
+
 	if (tramp) {
 		tramp->sh_type = SHT_NOBITS;
 		tramp->sh_flags = SHF_EXECINSTR | SHF_ALLOC;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

