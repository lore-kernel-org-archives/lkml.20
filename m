Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328174;
	b=2vtPGV5qHXa/x/kLnvqvPMNdu21W1iFg+UfMgB7iuVXvQ5LlJg7zuKdw8UsjZQuKYOS2
	 89dCv2TY3s/dm3EAmjH2sMRIWToF36dQZSGON+e0nvZHSfkmbJK5uUIRPGrX9W17di2vN
	 89gAzoamNgsv0W7tIGCa3TaR/WDO0xqFFRfUw1O9LpDOo7vvj3a8zfotpDcs7PHQytjqu
	 HJIa/Ai4/XSYw+137y2NbygZ4LbolM8GHNUwjeeep7aQYF2ruNhHSc1nOQgWJRyYsozPB
	 Cjf5BMqnYlLXgCHylCol5Z/yiSU0Cd/DdKssttnYUoM6fCrJ3uSPQwMvkBa1KcC/BWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
	b=JHCPagliVNkZ6cUrl0YfdB0tdST405CH36JY0soksre2gkipRyvqGYoRdlPF/HXeChmJ
	 A91KOPKup6o3d3TSvMJFg2nuekUbZ8F4Of5+C5NHdV3V1HkbWLGRf6yuQ90y/SJDLmSpK
	 ojdtr8IQuvdZM/qLYrjsGpj6uKXoFReKR40dDKKpk8LvZIFqFg0bpJaX+iQ1qk6C5eIwx
	 wSpPstK6CCuKtaYxP0wd7+tk68iy1t6BL6acrNipXWRiPmJiNELQcmyCJ/BeIyA3b7ku6
	 zjXxa+O5FehNUjGYdViPgm6Yi9D6ba+XXkhyVHNhhbWdwfY8nvrlPZX7BCq4LyrTw6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM6FUPqG;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024CE60A3802
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024CE60A3802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WM6FUPqG
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490a0e72588so1237878f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328172; x=1794932972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
        b=WM6FUPqGln4pFS0+y1vuDeHQMJOw/brbWunWvSrCo7QW5VJGQdTqId0JkcMYRQxyb2
         OmCuPU4i0+nYc4LT7aPxc95n24vZGuUIOETuZ9ZqHSuOXoc9jAxPkjTBt94yQu2yr79q
         T/ra+ve9wzdFkUiXNrNO7Ayv4bmwF0VqY0ZaZC14b3dNLtOInuxJwGUv22+HhKlT4Jwn
         sG81NNYp7SBZ9ufPsKV56yR8KANsYywJ8/kxeXdQL7VyYKr1qN0zq+yY/8PgVsAAOwBQ
         mlxnzCrHMZCyNf72wPYI+U7Laf3mwood26P8UAYvLZHkoyLZ4Ou+EysHxPUhZTe182nC
         oviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328172; x=1794932972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
        b=QRegCE1uVIlUeE2G1HUfpbqme5ntZ70VMQOXdmRCAVtS+KfwsSWlRz8B4G1SA5h11w
         jalJ0XLjv3iLB7T0cLBC7hac37CzQwCr2q8L2wnCt7zS5I4bYBFUlPdS3AmWZ1wRqTmp
         UxGUDcfrtqsqUI9YV8aaw+O43VSTIx1B66sATa7LrNW0kz2zjrYYVj0aILYMz87tGiqM
         jU6gl4ewOhaXx2FK1Z9xl3WLzijeeueR+tcB4Wino8h1foW5LZ6brAbxx6AuusbLFdtA
         IEkZM7UWNLW9QkytFAIsos1W/t1tG0P8hHsmLpAd8yGWFDfvNkhLUVofhOkWCG/uQVk+
         BEyw==
X-Forwarded-Encrypted: i=1; AL+hErHXjhfGxDYDxc0c+dNgSRh36e9SPVQwMUhrEspHtGx+R0C668JMoEPEHpNMnaH2F/Ta5sSyaYWhkZMyxRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xj+UyWGaU0X8/1kYEwMaINYjAMA+dDTr9eZqf77zwsAOXFE5N
	NWqKjJcUDuy/fUgrfUiSbLuS1lTYgrsNRhGbCgVvIl0agFY5mEu2U/lk
X-Gm-Gg: AYBFou0hxCXWWETIE5y79Imqje7CbeG3qoaG6VID8L3owSbrg4tKbxuHUrTvHiQpGhG
	VUWRho095fO5VW5mCJ1m32rWJ3RMzRbmbhlMk4yTTnZO4wXh9x68tEdSAcw87v9vbXUijW2Mw/5
	SiMzSs3rpWRFFXft7lM6epB2Lp3UXfuBqE9/l0jGagQReCFIWomJAQxD9wcy2t8bL7LC18+etBE
	qZxqx17HfLwAgq4UxeKEfQMrXtXi2SyVOeeJ21pZ/q28ApC6jb489uz9b2/aC0Z4/FN6b025xbM
	nYgorqa42DcoQb6YSeXOpHGREVw7OQoiWYwO+KY00xvukVPWX2mt3Ppd4th3TNc992Eu3KGpsEv
	0V4I0IP6KJh2SB9qg9NufsxfbQfP9PNpNd0JJbM0aYO3tmWL7GEYKbzoqThRbqzJ+l3H7R3sB+o
	xarYJcqv0+wr2AgZVGbJYAqYy5WeEOFvunl+SiVcN8uuiwM1g22u8Vkk04FBgv2W+lES9tzBEQn
	Ig7NQi3M7w018GN7K6HDKvLGUZNQwjibCqFik/1fs1aGuQiaK4AjXFJNUT0leRb9djA8QqhBt+O
	S2Jio/RYssdbhpqgmPckLUAYWjZ2yIYZq7vqRiWBlVFucCw=
X-Received: by 2002:a05:600c:3486:b0:4a1:e250:b191 with SMTP id 5b1f17b1804b1-4ba023418ddmr56850095e9.17.1794328172212;
        Tue, 10 Nov 2026 08:29:32 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:31 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v3 bpf-next 07/18] scripts: Add LLVM plugin infrastructure
Date: Tue, 10 Nov 2026 16:40:27 +0000
Message-ID: <20261110164046.454431-8-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

Add scripts/llvm-plugins and the corresponding Makefiles and Kconfig for
LLVM IR passes loaded with -fpass-plugin, similar to the GCC plugins.
Individual plugins register their configuration and shared objects
separately. No plugin is added yet.

Use LLVM_CONFIG to obtain the host compiler and linker flags. Require
llvm-config of the same major version as clang, which loads the plugins:
unlike GCC, clang does not provide the headers for its plugins. Require
also a host C++ compiler which accepts the headers and flags of
llvm-config.

Build plugins without linking LLVM component libraries; their LLVM
symbols are resolved by the compiler loading the shared library. Include
a generated header so objects are rebuilt when enabled plugins change.
Track the headers of a plugin, LLVM ones included, with a dependency
file, as the GCC plugins do.

Export LLVM_PLUGINS_CFLAGS so vDSO, EFI stub and early boot builds can
exclude the plugins, as they exclude the GCC plugins.

Add the plugin infrastructure to the CLANG/LLVM BUILD SUPPORT entry in
MAINTAINERS.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 MAINTAINERS                           |  2 ++
 Makefile                              |  6 +++++-
 arch/Kconfig                          |  1 +
 arch/arm64/kernel/pi/Makefile         |  1 +
 arch/x86/boot/startup/Makefile        |  2 ++
 arch/x86/um/vdso/Makefile             |  2 +-
 drivers/firmware/efi/libstub/Makefile |  2 +-
 include/linux/compiler-version.h      |  5 +++++
 lib/vdso/Makefile.include             |  3 +++
 scripts/Makefile                      |  1 +
 scripts/Makefile.llvm-plugins         |  8 ++++++++
 scripts/llvm-plugins/Kconfig          | 17 +++++++++++++++++
 scripts/llvm-plugins/Makefile         | 21 +++++++++++++++++++++
 13 files changed, 68 insertions(+), 3 deletions(-)
 create mode 100644 scripts/Makefile.llvm-plugins
 create mode 100644 scripts/llvm-plugins/Kconfig
 create mode 100644 scripts/llvm-plugins/Makefile

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..02b6c8963c63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6562,7 +6562,9 @@ C:	irc://irc.libera.chat/clangbuiltlinux
 F:	Documentation/kbuild/llvm.rst
 F:	include/linux/compiler-clang.h
 F:	scripts/Makefile.clang
+F:	scripts/Makefile.llvm-plugins
 F:	scripts/clang-tools/
+F:	scripts/llvm-plugins/
 K:	\b(?i:clang|llvm)\b
 
 CLK API
diff --git a/Makefile b/Makefile
index f895752d4b05..2fcad8109572 100644
--- a/Makefile
+++ b/Makefile
@@ -457,10 +457,13 @@ endif
 
 HOSTCC	= $(LLVM_PREFIX)clang$(LLVM_SUFFIX)
 HOSTCXX	= $(LLVM_PREFIX)clang++$(LLVM_SUFFIX)
+LLVM_CONFIG ?= $(LLVM_PREFIX)llvm-config$(LLVM_SUFFIX)
 else
 HOSTCC	= gcc
 HOSTCXX	= g++
+LLVM_CONFIG ?= llvm-config
 endif
+export LLVM_CONFIG
 HOSTRUSTC = rustc
 HOSTPKG_CONFIG	= pkg-config
 
@@ -1211,10 +1214,11 @@ include-$(CONFIG_AUTOFDO_CLANG)	+= scripts/Makefile.autofdo
 include-$(CONFIG_PROPELLER_CLANG)	+= scripts/Makefile.propeller
 include-$(CONFIG_WARN_CONTEXT_ANALYSIS) += scripts/Makefile.context-analysis
 include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
+include-$(CONFIG_LLVM_PLUGINS)	+= scripts/Makefile.llvm-plugins
 
 include $(addprefix $(srctree)/, $(include-y))
 
-# scripts/Makefile.gcc-plugins is intentionally included last.
+# The compiler plugin Makefiles are intentionally included last.
 # Do not add $(call cc-option,...) below this line. When you build the kernel
 # from the clean source tree, the GCC plugins do not exist at this point.
 
diff --git a/arch/Kconfig b/arch/Kconfig
index 1163736de1f9..4f1f36d3e82d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1772,6 +1772,7 @@ config HAVE_GENERIC_TIF_BITS
 source "kernel/gcov/Kconfig"
 
 source "scripts/gcc-plugins/Kconfig"
+source "scripts/llvm-plugins/Kconfig"
 
 config FUNCTION_ALIGNMENT_4B
 	bool
diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index a273ab5af805..5813bb75c992 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -10,6 +10,7 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -D__DISABLE_EXPORTS -ffreestanding -D__NO_FORTIFY \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(CONFIG_CC_OPT_NO_ADDRSIG)
+KBUILD_CFLAGS	:= $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 
 # this code may run with the MMU off so disable unaligned accesses
 CFLAGS_map_range.o += -mstrict-align
diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
index 5e499cfb29b5..7036e939097e 100644
--- a/arch/x86/boot/startup/Makefile
+++ b/arch/x86/boot/startup/Makefile
@@ -12,6 +12,8 @@ KBUILD_CFLAGS		+= -D__DISABLE_EXPORTS -mcmodel=small -fPIC \
 # disable ftrace hooks and LTO
 KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS))
 KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS))
+# LLVM plugins may add data with absolute addresses
+KBUILD_CFLAGS	:= $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 KASAN_SANITIZE	:= n
 KCSAN_SANITIZE	:= n
 KMSAN_SANITIZE	:= n
diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index 7664cbedbe30..0e32c9ae2b5a 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -37,7 +37,7 @@ CFL := $(PROFILING) -mcmodel=small -fPIC -O2 -fasynchronous-unwind-tables -m64 \
        $(filter -g%,$(KBUILD_CFLAGS)) -fno-stack-protector \
        -fno-omit-frame-pointer -foptimize-sibling-calls
 
-$(vobjs): KBUILD_CFLAGS += $(CFL)
+$(vobjs): KBUILD_CFLAGS := $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS)) $(CFL)
 
 #
 # vDSO code runs in userspace and -pg doesn't help with profiling anyway.
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index bbab12b8eb4b..6f69d5d67731 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -6,7 +6,7 @@
 # enabled, even if doing so doesn't break the build.
 #
 
-cflags-y			:= $(KBUILD_CFLAGS)
+cflags-y			:= $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
 
 # x86 links the stub into the decompressor rather than the kernel proper, so
 # drop the kernel's code model, calling convention, and stack alignment, and
diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index ac1665a98a15..e6a5a9f3fbcd 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -24,6 +24,11 @@
 #include <generated/gcc-plugins.h>
 #endif
 
+/* Rebuild objects when an LLVM plugin changes. */
+#ifdef LLVM_PLUGINS
+#include <generated/llvm-plugins.h>
+#endif
+
 /*
  * If the randstruct seed itself changes (whether for GCC plugins or
  * Clang), the entire tree needs to be rebuilt since the randomization of
diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index cedbf15f8087..848d58296ba2 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -1,5 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
+# vDSO code executes outside the kernel.
+KBUILD_CFLAGS := $(filter-out $(LLVM_PLUGINS_CFLAGS),$(KBUILD_CFLAGS))
+
 GENERIC_VDSO_MK_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
 GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 
diff --git a/scripts/Makefile b/scripts/Makefile
index d7fbb7ca098b..bc5dacc29207 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -66,6 +66,7 @@ hostprogs += unifdef gen_packed_field_checks
 targets += module.lds
 
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
+subdir-$(CONFIG_LLVM_PLUGINS) += llvm-plugins
 subdir-$(CONFIG_GENKSYMS) += genksyms
 subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
diff --git a/scripts/Makefile.llvm-plugins b/scripts/Makefile.llvm-plugins
new file mode 100644
index 000000000000..e18f4907b015
--- /dev/null
+++ b/scripts/Makefile.llvm-plugins
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+LLVM_PLUGIN := $(llvm-plugin-y)
+LLVM_PLUGINS_CFLAGS := $(strip $(addprefix -fpass-plugin=$(objtree)/scripts/llvm-plugins/, \
+	$(LLVM_PLUGIN)) -DLLVM_PLUGINS)
+export LLVM_PLUGIN LLVM_PLUGINS_CFLAGS
+
+KBUILD_CFLAGS += $(LLVM_PLUGINS_CFLAGS)
diff --git a/scripts/llvm-plugins/Kconfig b/scripts/llvm-plugins/Kconfig
new file mode 100644
index 000000000000..37db99159b9c
--- /dev/null
+++ b/scripts/llvm-plugins/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menuconfig LLVM_PLUGINS
+	bool "LLVM plugins"
+	depends on CC_IS_CLANG
+	depends on $(success,$(LLVM_CONFIG) --version)
+	# The plugins are built against the headers of llvm-config and loaded
+	# by clang, so both must come from the same LLVM release
+	depends on $(success,test "$(shell,$(LLVM_CONFIG) --version 2>/dev/null | cut -d. -f1)" = "$(shell,$(CC) -dumpversion | cut -d. -f1)")
+	# The host C++ compiler must accept the LLVM headers and flags
+	depends on $(success,echo '#include <llvm/Config/llvm-config.h>' | $(HOSTCXX) $(shell,$(LLVM_CONFIG) --cxxflags 2>/dev/null) -x c++ -fsyntax-only -)
+	default y
+	help
+	  LLVM plugins add compiler passes to kernel and module builds.
+	  Building them requires LLVM development headers and llvm-config
+	  of the same major version as clang. Each plugin has its own option
+	  below and is built only if that option is enabled.
diff --git a/scripts/llvm-plugins/Makefile b/scripts/llvm-plugins/Makefile
new file mode 100644
index 000000000000..a1f8503c8bcd
--- /dev/null
+++ b/scripts/llvm-plugins/Makefile
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+always-y += $(LLVM_PLUGIN)
+targets += $(LLVM_PLUGIN)
+clean-files += *.so
+
+# Run llvm-config only to build a plugin, not when this Makefile is parsed
+llvm_cxxflags = $(shell $(LLVM_CONFIG) --cxxflags)
+llvm_ldflags = $(shell $(LLVM_CONFIG) --ldflags)
+
+quiet_cmd_llvm_plugin = HOSTCXX $@
+      cmd_llvm_plugin = $(HOSTCXX) -Wp,-MD,$(depfile) $(KBUILD_HOSTCXXFLAGS) \
+		$(llvm_cxxflags) -fPIC -shared $(KBUILD_HOSTLDFLAGS) -o $@ $< \
+		$(llvm_ldflags)
+
+$(obj)/%.so: $(src)/%.cpp FORCE
+	$(call if_changed_dep,llvm_plugin)
+
+$(obj)/../../include/generated/llvm-plugins.h: $(addprefix $(obj)/, $(LLVM_PLUGIN)) FORCE
+	$(call if_changed,touch)
+always-y += ../../include/generated/llvm-plugins.h
-- 
2.43.0

