Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834154F85D1
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776603; cv=none; b=RpYkSM5njJJ1jtg/vnYoFTy0bIF0//R2sXQvr3AoKYpLOrJy4eJxFEvAC6O4UdvmqAttRd274U+bcScVMehNn9F8nor33cuzf8KhmS80Dwu1ZU2w2EqJe5wXxTK5WUpytMeh5WWQKTuYsZ/eEeCEG5BEo2GV6xWYufrltxu/DlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776603; c=relaxed/simple;
	bh=Qs3MYLZvUpQX5nYy6gS9UAuuZFuepVGUHzIMpVHy/NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qtfzICoAAkMRPrT6mVrbrIRiQ1y4ztE0SQRZWUKihoxNAvCoA6jBW2fs1JCNl+JjxD6cBmbvOuoXAbz3C3BXAeTC4YnPLRm8JNrbXbCr+RLK8yjwLlRJmo0qK0k1rKvz+Boa849WZozGMx9dKrgljpOTU0mP/kA2JcFhB5VUL4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jM4pPLaF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jM4pPLaF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EEC1F0089C;
	Wed, 30 Sep 2026 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790776589;
	bh=Wulg3Hwxs05fEFwgUhtvauPw2J8ajR6C2Nn1SZG5koY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jM4pPLaF47PPEljELQLH0V5icxsd4tJWbpmVNhjtQ1a+vI3KDDr+51wdgyinprsa9
	 FTKS8qNJOVIyfwUZmoKBe3OJoMXbOSHUNiYKvKHxhbS0sUXpRIwAZZaMe+aAG9zjsx
	 QxbZAMAwsxk0HftifvpQGx/vATHQDZrq6OdWQPYVdKV/NaCCjFm94lgJU7ad7+W3YM
	 796kQWLDzBwetdOe8ptwVooU+JPeqqBo/n4gdkJinh9VvpVDiWXSKDuiTLS2IaavnH
	 DooLe4Iog+ny58cKbQeKw68uZtqACS5nN/tkC89VrK/aQgiCv2iEvF+GpLxyqogK1e
	 /xB3Wlb5hmNew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/5] riscv: remove RISCV_ALTERNATIVE Kconfig option
Date: Wed, 30 Sep 2026 21:36:24 +0800
Message-ID: <20260930133628.22093-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930133628.22093-1-jszhang@kernel.org>
References: <20260930133628.22093-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

riscv always selects RISCV_ALTERNATIVE now, so we can remove this
Kconfig option and enable RISCV_ALTERNATIVE code unconditionally.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig                          | 23 --------------------
 arch/riscv/Kconfig.errata                   |  5 +----
 arch/riscv/include/asm/alternative-macros.h | 24 ---------------------
 arch/riscv/include/asm/alternative.h        | 10 ---------
 arch/riscv/include/asm/cpufeature-macros.h  | 10 ++-------
 arch/riscv/include/asm/cpufeature.h         |  6 ++----
 arch/riscv/include/asm/vendor_extensions.h  | 18 ++++++----------
 arch/riscv/kernel/Makefile                  |  2 +-
 arch/riscv/kernel/cpufeature.c              |  2 --
 9 files changed, 12 insertions(+), 88 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index f8e26c4bed2b..13b7bb77087e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -218,7 +218,6 @@ config RISCV
 	select PCI_ECAM if (ACPI && PCI)
 	select PCI_MSI if PCI
 	select RELOCATABLE if !MMU && !PHYS_RAM_BASE_FIXED
-	select RISCV_ALTERNATIVE
 	select RISCV_APLIC
 	select RISCV_IMSIC
 	select RISCV_INTC
@@ -539,17 +538,8 @@ config RISCV_COMBO_SPINLOCKS
 
 endchoice
 
-config RISCV_ALTERNATIVE
-	bool
-	help
-	  This Kconfig allows the kernel to automatically patch the
-	  erratum or cpufeature required by the execution platform at run
-	  time. The code patching overhead is minimal, as it's only done
-	  once at boot and once on each module load.
-
 config RISCV_ALTERNATIVE_EARLY
 	bool
-	depends on RISCV_ALTERNATIVE
 	help
 	  Allows early patching of the kernel for special errata
 
@@ -578,7 +568,6 @@ config RISCV_ISA_SUPM
 config RISCV_ISA_SVNAPOT
 	bool "Svnapot extension support for supervisor mode NAPOT pages"
 	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  Enable support for the Svnapot ISA-extension when it is detected
@@ -615,7 +604,6 @@ config RISCV_ISA_SSQOSID
 config RISCV_ISA_SVPBMT
 	bool "Svpbmt extension support for supervisor mode page-based memory types"
 	depends on 64BIT && MMU
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Add support for the Svpbmt ISA-extension (Supervisor-mode:
@@ -685,7 +673,6 @@ config RISCV_ISA_V_PREEMPTIVE
 
 config RISCV_ISA_ZAWRS
 	bool "Zawrs extension support for more efficient busy waiting"
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  The Zawrs extension defines instructions to be used in polling loops
@@ -704,7 +691,6 @@ config TOOLCHAIN_HAS_ZABHA
 config RISCV_ISA_ZABHA
 	bool "Zabha extension support for atomic byte/halfword operations"
 	depends on TOOLCHAIN_HAS_ZABHA
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  Enable the use of the Zabha ISA-extension to implement kernel
@@ -721,7 +707,6 @@ config TOOLCHAIN_HAS_ZACAS
 
 config RISCV_ISA_ZACAS
 	bool "Zacas extension support for atomic CAS"
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  Enable the use of the Zacas ISA-extension to implement kernel atomic
@@ -766,7 +751,6 @@ config RISCV_ISA_ZBA
 
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Add support for enabling optimisations in the kernel when the
@@ -791,7 +775,6 @@ config RISCV_ISA_ZBC
 	bool "Zbc extension support for carry-less multiplication instructions"
 	depends on TOOLCHAIN_HAS_ZBC
 	depends on MMU
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Adds support to dynamically detect the presence of the Zbc
@@ -813,7 +796,6 @@ config TOOLCHAIN_HAS_ZBKB
 config RISCV_ISA_ZBKB
 	bool "Zbkb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBKB
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Adds support to dynamically detect the presence of the ZBKB
@@ -827,7 +809,6 @@ config RISCV_ISA_ZBKB
 config RISCV_ISA_ZICBOM
 	bool "Zicbom extension support for non-coherent DMA operation"
 	depends on MMU
-	depends on RISCV_ALTERNATIVE
 	default y
 	select RISCV_DMA_NONCOHERENT
 	select DMA_DIRECT_REMAP
@@ -843,7 +824,6 @@ config RISCV_ISA_ZICBOM
 
 config RISCV_ISA_ZICBOZ
 	bool "Zicboz extension support for faster zeroing of memory"
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Enable the use of the Zicboz extension (cbo.zero instruction)
@@ -856,7 +836,6 @@ config RISCV_ISA_ZICBOZ
 config RISCV_ISA_ZICBOP
 	bool "Zicbop extension support for cache block prefetch"
 	depends on MMU
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  Adds support to dynamically detect the presence of the ZICBOP
@@ -871,7 +850,6 @@ config RISCV_ISA_ZICBOP
 config RISCV_ISA_SVRSW60T59B
 	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
 	depends on MMU && 64BIT
-	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	  Adds support to dynamically detect the presence of the Svrsw60t59b
@@ -1204,7 +1182,6 @@ config RISCV_USER_CFI
 	bool "riscv userspace control flow integrity"
 	depends on 64BIT && MMU && \
 		$(cc-option,-mabi=lp64 -march=rv64ima_zicfiss_zicfilp -fcf-protection=full)
-	depends on RISCV_ALTERNATIVE
 	select RISCV_SBI
 	select ARCH_HAS_USER_SHADOW_STACK
 	select ARCH_USES_HIGH_VMA_FLAGS
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 3c945d086c7d..1a66e5b6f7d1 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -2,7 +2,7 @@ menu "CPU errata selection"
 
 config ERRATA_ANDES
 	bool "Andes AX45MP errata"
-	depends on RISCV_ALTERNATIVE && RISCV_SBI
+	depends on RISCV_SBI
 	help
 	  All Andes errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all Andes errata. Please say "Y"
@@ -23,7 +23,6 @@ config ERRATA_ANDES_CMO
 
 config ERRATA_MIPS
 	bool "MIPS errata"
-	depends on RISCV_ALTERNATIVE
 	help
 	  All MIPS errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all MIPS errata. Please say "Y"
@@ -46,7 +45,6 @@ config ERRATA_MIPS_P8700_PAUSE_OPCODE
 
 config ERRATA_SIFIVE
 	bool "SiFive errata"
-	depends on RISCV_ALTERNATIVE
 	help
 	  All SiFive errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all SiFive errata. Please say "Y"
@@ -98,7 +96,6 @@ config ERRATA_STARFIVE_JH7100
 
 config ERRATA_THEAD
 	bool "T-HEAD errata"
-	depends on RISCV_ALTERNATIVE
 	help
 	  All T-HEAD errata Kconfig depend on this Kconfig. Disabling
 	  this Kconfig will disable all T-HEAD errata. Please say "Y"
diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 9619bd5c8eba..629d884578da 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_ALTERNATIVE_MACROS_H
 #define __ASM_ALTERNATIVE_MACROS_H
 
-#ifdef CONFIG_RISCV_ALTERNATIVE
-
 #ifdef __ASSEMBLER__
 
 .macro ALT_ENTRY oldptr newptr vendor_id patch_id new_len
@@ -108,28 +106,6 @@
 	__ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, patch_id_1, IS_ENABLED(CONFIG_k_1),	\
 				   new_c_2, vendor_id_2, patch_id_2, IS_ENABLED(CONFIG_k_2))
 
-#else /* CONFIG_RISCV_ALTERNATIVE */
-#ifdef __ASSEMBLER__
-
-.macro ALTERNATIVE_CFG old_c
-	\old_c
-.endm
-
-#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
-#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
-
-#else /* !__ASSEMBLER__ */
-
-#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
-#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
-
-#endif /* __ASSEMBLER__ */
-
-#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
-#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
-
-#endif /* CONFIG_RISCV_ALTERNATIVE */
-
 /*
  * Usage:
  *   ALTERNATIVE(old_content, new_content, vendor_id, patch_id, CONFIG_k)
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 8407d1d535b8..688c7d1a9ae3 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -10,8 +10,6 @@
 
 #ifndef __ASSEMBLER__
 
-#ifdef CONFIG_RISCV_ALTERNATIVE
-
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
@@ -61,13 +59,5 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 void riscv_cpufeature_patch_func(struct alt_entry *begin, struct alt_entry *end,
 				 unsigned int stage);
 
-#else /* CONFIG_RISCV_ALTERNATIVE */
-
-static inline void apply_boot_alternatives(void) { }
-static inline void apply_early_boot_alternatives(void) { }
-static inline void apply_module_alternatives(void *start, size_t length) { }
-
-#endif /* CONFIG_RISCV_ALTERNATIVE */
-
 #endif
 #endif
diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
index a8103edbf51f..adaf9e3fb25c 100644
--- a/arch/riscv/include/asm/cpufeature-macros.h
+++ b/arch/riscv/include/asm/cpufeature-macros.h
@@ -47,20 +47,14 @@ static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
-
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
 }
 
 static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_likely(STANDARD_EXT, ext);
-
-	return __riscv_isa_extension_available(NULL, ext);
+	return __riscv_has_extension_likely(STANDARD_EXT, ext);
 }
 
 #endif /* _ASM_CPUFEATURE_MACROS_H */
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b..37c9f2a0fb54 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -134,8 +134,7 @@ static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsign
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_likely(STANDARD_EXT, ext))
+	if (__riscv_has_extension_likely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
@@ -145,8 +144,7 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_unlikely(STANDARD_EXT, ext))
+	if (__riscv_has_extension_unlikely(STANDARD_EXT, ext))
 		return true;
 
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 7437304a71b9..b00149be2627 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -54,11 +54,9 @@ static __always_inline bool riscv_has_vendor_extension_likely(const unsigned lon
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
 		return false;
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_likely(vendor,
-						    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+	return __riscv_has_extension_likely(vendor,
+					    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
 
-	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
 }
 
 static __always_inline bool riscv_has_vendor_extension_unlikely(const unsigned long vendor,
@@ -67,11 +65,9 @@ static __always_inline bool riscv_has_vendor_extension_unlikely(const unsigned l
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
 		return false;
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
-		return __riscv_has_extension_unlikely(vendor,
-						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+	return __riscv_has_extension_unlikely(vendor,
+					      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
 
-	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
 }
 
 static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
@@ -80,8 +76,7 @@ static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
 		return false;
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+	if (__riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
 		return true;
 
 	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
@@ -94,8 +89,7 @@ static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsign
 	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
 		return false;
 
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
-	    __riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+	if (__riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
 		return true;
 
 	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ebe1c3588177..91353c94bfab 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -48,7 +48,7 @@ always-$(KBUILD_BUILTIN) += vmlinux.lds
 
 obj-y	+= head.o
 obj-y	+= soc.o
-obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
+obj-y	+= alternative.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d2ec96843456..9915121e9438 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -1217,7 +1217,6 @@ void __init riscv_user_isa_enable(void)
 		pr_warn("Zicbop disabled as it is unavailable on some harts\n");
 }
 
-#ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
  * the old instruction sequence with the new. These bits are broken into a
@@ -1306,4 +1305,3 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 		mutex_unlock(&text_mutex);
 	}
 }
-#endif
-- 
2.53.0

