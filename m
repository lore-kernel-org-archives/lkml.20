Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243294;
	b=uf6sT4j0f+QItOOdjfjimQbQwzcWWvdq3ll3yWJVNw+d6vuKUJKKJT2F5d905HP1GzJU
	 4/S23Ul122by/wIxocLMdEkygSxA5MsOeHay4WtAMR38qmYS70+OtMAkZsOpwkOC8gh/P
	 FXULoTm0vLLdkEo2sx6STtb8lL6hzi/+RXPeAIWe4X21djipQcvQZZ9M+ANUNBL3VoPYy
	 rmjA23124ifCWcQTdREQRK65dcwh5ybjL47ZokewT3JrR1WIIf1sbXIVRXOn9yjlcj0EQ
	 8UDTdVsej7moC6ThfSB4RFAXZwe/1q1g5QVAmlmlTVTvGIuQGoRvHMqEz4v/pDlEk6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
	b=Emh42nKM38H9YioS6Q7CAlPNENHxB6wcHT1DUzDQbmGWtPaWsKV2Q5L6KJBdkJZcjkGd
	 4eWm+XDd67xlurhMGd6mkj//Sb5/XqcJGPoEE75CUWK8r+OVeAc/RHg/cPwuSoiCWTHfN
	 PSHY8Ay5Itxto9lCzwWZHAKXnPBPNKPQ/elriReXZF02niQQZT/jiIpxrzXY/ik2tQ9Lp
	 uWJpHvgqPhVlqAQPYIyUBeIZgZsTUf62WMhfjQh8crlssvQrDLa+8142Ac/BcNMZnvbyj
	 6siZepiTb9aOSYz+4SN9P/uAKjBwePiBx3B2tfwK5H+4it1FBKsLYITjSH1jAt+gh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kME19FVa;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD26606EEA5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD26606EEA5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kME19FVa
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e10a70540so701190f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243292; x=1794848092; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
        b=kME19FVaTVwdWY8fdQNMapNF/JGxR5zo8C3XfCvB+CJFcOdTUySKC5kypj1ZBJTu79
         aR5Yhmp7NDTfoQupqNEOXKB7nuuEMn/58j8LjCgjFUhqpnD8yH2+SeUUypC+Wo7zdnpW
         K96ICFC05mJG7I5Odh3oWraPGieDvSV/bzmJWPH5xobk1TZoon6vFFBKL5qUqv8ae1D2
         LjyaJRii+dn9lRJOMWQTjXor31AWHrK/y3TCsHj9x0qUI10rUj+JFDXkalNQPQvbGo0F
         /iab5hX0qgqCkHFNBcS1OdMQJMWrgjLg7ehFepu4Q3nl29iCsvKi/nSJTyBonj7zzV/w
         KZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243292; x=1794848092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyl271xS4NaUQkQEDfJP7TOW84m77rHK/njFeThb4gM=;
        b=rKEEk+MuZka/XKOaQITIpxVl9viysbBEz+IaqmKMmS5FRSHr2QgZmZEpsGIRSDy5VS
         a2MLZ1gP4KLKtnw/kdP8jRsTyw/TyCdWOVD3GYW67E/rsjaPEBslWCtxSQuIUQFuWgys
         dnkTtQBgNNd9DKBQ+R9QSWorAkE+tKUIt26DcyaqwGXAz2h5ka+JDiV+tuUrcXWjHZ+e
         rZL/jYHjyAHrjYnK8L+HL4M03+df30nfPuLFYURxWDVfXckyNt4lusucArqj0/JsbHRf
         awmpX/iN+0phEjmljsYeJLfAHvwjEMgbwfhOuRnPvPSmqAvAjvnDux3KGtYeOaCgZsrv
         mpRw==
X-Forwarded-Encrypted: i=1; AL+hErGcyfL6XiBo3g/Dzsq1/RZPuCSIebrzJ2CeKUS9TKm9ODjY4MLQAx4BA56329HCYNaXbv4vJRU+XaEKKpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uFO367fHcg8EkN7MbkGRz8G6Z4GnJCLuuZAz1wuT43zXNkcf+
	6p0ymDN/AhFxzXXclMHKwOooiC4wkbC69ATQVNLhFqzEYH4OeHJ8Twrr
X-Gm-Gg: AYBFou0tOh52ZF7Dy+JSxb3H/ge1K7/uylknIsyucdhcB+ejOnVfijlVDN7SyrURMNl
	qcJwGcinpyqOAzSopPC/3l+9uspGI07rZWXKKR0E7/oKSkZzKufFsBhH6U+1Xaud+Pm5WvqBEyM
	trnEv8uo7glss1qDGt2lh1AM4DobE1mwASAhmqUz+4OhegUmW/l1U57s7jC0XnhFgZ6pE3Enq02
	WuQLT4qqf6VBzy2BadmmDQDhVjf3tAv1BjCD6VDDQAd7tT+jPo5OnCQzJ2KLt6QVnNMZEzKC+u3
	IkbUWNP1dUI+Luv16tH5FMY1QN+W+kh36PgykMvX+iQ4S5FY9yKmwbDiCh34g/Lpl7XzzaNScyo
	p5i7Kx5QvE37S+5+4677w6X2DYGvcE0gsG8H1PKljbQtltMlRPtaaA+ljFzh0vlBxdSy5sf4OqM
	zzfq0xZzk54H/gpqHc3dRNHqIU0rDldXgaCOA7TdMCTdjcDTcXm0OHeOZshSVygNihUpAqAGp/R
	tkzxM6lvOswxUtV8b2p+5rjA5H9VXybwhx6rNOFEOstYxEZmf+YdDJ8ISKHtx4zK/rrssoFS3HD
	SsPOywOFFuhXsyUeJExFORy5ZQZCvAIMdZY8Y+nacGb00Io=
X-Received: by 2002:a05:6000:15cb:b0:491:7ede:60e5 with SMTP id ffacd0b85a97d-4982f2b4ad3mr79955f8f.20.1794243292208;
        Mon, 09 Nov 2026 08:54:52 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:51 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 07/18] scripts: Add LLVM plugin infrastructure
Date: Mon,  9 Nov 2026 17:05:27 +0000
Message-ID: <20261109170550.141443-8-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

