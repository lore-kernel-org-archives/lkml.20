Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED1502562
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743186; cv=none; b=ddREIRX0ecv/gpP3ZN5spGXHjl5x6Qp4Pl2FSUlYVVsBuZmm+xnU0IMYsnBNA/tBW1pGCL37PkJGJpFDG/Pqx90TKLOj4UGHXYTl5MkTgT2BOVf1rOtLP0z2jPCutR+xOwOTNY0f0Q94M+Hit/HD8iUxdS3XjHYAm2PHmdn5W0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743186; c=relaxed/simple;
	bh=DsLJ8Qa+QCZQf5fgSJC7h+SpO76RZsp8tU+Js6vj1ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMBncedPMFzB+jaBPTTGBJXyEGiwxyNyMNT9TwlwfGawZQFF31BnRmKoyiPqyaEnC/BXefjVYMm4XBLVL4VYE+5sozx8l3aZD8+dtBJtDgXGy/FabLdTaMvfNx8f59f119QQvRjzuRTRDiFkiQ9fCP4T1vAinYQZQzYb7XnPW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jo01Md8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jo01Md8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CAE81F00898;
	Fri, 18 Sep 2026 14:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789743182;
	bh=LulIGN7292GTiMIEws/TfczRl4FN5PF77P6YQjIWumE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Jo01Md8S83N0kd6jIfpRnTqfQ+ej/NJCAID17mZKo+NWxOWn4QZhIWwXx4r57kxvV
	 notw/V5VyH7DM2niFgZLTNXp2mnkOyOxgfYxn7i8fo2pqpKFBGkPVHM4Ix4F7Ojtec
	 oVw0R9WG99Zu7GJTAzA5WyU2qJfNDMw8Xr+PdYZqFogMKRISB/K/6BbVfaEmGrblZx
	 Imv0vwu/MhbTQ5z8HZ3lRE+75UfILVS7c+gFDzb8zfuMwUIL8nWC5EOWhw9n5zV4hL
	 aDaRKYI3Nruo0fS6Pwr1EfAhsBOKHiOkDGOESpZ2AqRE6gBbom+Mj3l3YugqoEDkii
	 czlj8Viw0oh5Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v3 12/13] arm64: Kbuild: Remove vestigial big-endian support
Date: Fri, 18 Sep 2026 15:52:14 +0100
Message-ID: <20260918145217.1669-13-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918145217.1669-1-will@kernel.org>
References: <20260918145217.1669-1-will@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend on
BROKEN"), CONFIG_CPU_BIG_ENDIAN has depended on BROKEN for arm64.

Remove the last traces of its existence and unconditionally force a
little-endian kernel build.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Marc Zyngier <maz@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/Kconfig  | 35 ++++-------------------------------
 arch/arm64/Makefile | 12 ++----------
 2 files changed, 6 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5a51b0ef944..766410827f3c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -73,7 +73,7 @@ config ARM64
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
-	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
+	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_ATOMIC_RMW
@@ -224,7 +224,7 @@ config ARM64
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select MMU_GATHER_RCU_TABLE_FREE
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_ARM64
+	select HAVE_RUST
 	select HAVE_STACKPROTECTOR
 	select HAVE_STATIC_CALL if CFI
 	select HAVE_SYSCALL_TRACEPOINTS
@@ -263,10 +263,6 @@ config ARM64
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
-config RUSTC_SUPPORTS_ARM64
-	def_bool y
-	depends on CPU_LITTLE_ENDIAN
-
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_CLANG
 	# https://github.com/ClangBuiltLinux/linux/issues/1507
@@ -1596,28 +1592,6 @@ config ARM64_LPA2
 	def_bool y
 	depends on ARM64_PA_BITS_52 && !ARM64_64K_PAGES
 
-choice
-	prompt "Endianness"
-	default CPU_LITTLE_ENDIAN
-	help
-	  Select the endianness of data accesses performed by the CPU. Userspace
-	  applications will need to be compiled and linked for the endianness
-	  that is selected here.
-
-config CPU_BIG_ENDIAN
-	bool "Build big-endian kernel"
-	depends on BROKEN
-	help
-	  Say Y if you plan on running a kernel with a big-endian userspace.
-
-config CPU_LITTLE_ENDIAN
-	bool "Build little-endian kernel"
-	help
-	  Say Y if you plan on running a kernel with a little-endian userspace.
-	  This is usually the case for distributions targeting arm64.
-
-endchoice
-
 config NR_CPUS
 	int "Maximum number of CPUs (2-4096)"
 	range 2 4096
@@ -1855,7 +1829,6 @@ config KUSER_HELPERS
 
 config COMPAT_VDSO
 	bool "Enable vDSO for 32-bit applications"
-	depends on !CPU_BIG_ENDIAN
 	depends on (CC_IS_CLANG && LD_IS_LLD) || "$(CROSS_COMPILE_COMPAT)" != ""
 	default y
 	help
@@ -2319,7 +2292,7 @@ menu "ARMv9.6 architectural features"
 config ARM64_LSUI
 	bool "Support Unprivileged Load Store Instructions (LSUI)"
 	default y
-	depends on AS_HAS_LSUI && !CPU_BIG_ENDIAN
+	depends on AS_HAS_LSUI
 	help
 	  The Unprivileged Load Store Instructions (LSUI) provides
 	  variants load/store instructions that access user-space memory
@@ -2524,7 +2497,7 @@ config EFI_STUB
 
 config EFI
 	bool "UEFI runtime support"
-	depends on OF && !CPU_BIG_ENDIAN
+	depends on OF
 	depends on KERNEL_MODE_NEON
 	select ARCH_SUPPORTS_ACPI
 	select LIBFDT
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..04e1a0d12f8f 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -119,20 +119,12 @@ KBUILD_CFLAGS	+= -ffixed-x18
 KBUILD_RUSTFLAGS += -Zfixed-x18
 endif
 
-ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
-KBUILD_CPPFLAGS	+= -mbig-endian
-CHECKFLAGS	+= -D__AARCH64EB__
-# Prefer the baremetal ELF build target, but not all toolchains include
-# it so fall back to the standard linux version if needed.
-KBUILD_LDFLAGS	+= -EB $(call ld-option, -maarch64elfb, -maarch64linuxb -z norelro)
-UTS_MACHINE	:= aarch64_be
-else
 KBUILD_CPPFLAGS	+= -mlittle-endian
 CHECKFLAGS	+= -D__AARCH64EL__
-# Same as above, prefer ELF but fall back to linux target if needed.
+# Prefer the baremetal ELF build target, but not all toolchains include
+# it so fall back to the standard linux version if needed.
 KBUILD_LDFLAGS	+= -EL $(call ld-option, -maarch64elf, -maarch64linux -z norelro)
 UTS_MACHINE	:= aarch64
-endif
 
 ifeq ($(CONFIG_LD_IS_LLD), y)
 KBUILD_LDFLAGS	+= -z norelro
-- 
2.55.0.1082.g2b9226bbc0-goog

