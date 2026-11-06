Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998345;
	b=FjjOcfpQ6BO2pXzEjmtM59ygZUmdy+g8wZscn9czdzcDRMcv8lEZSwZ2d0K7uMHOpdpg
	 AHsVerIC+GR2SIIuKJ4e+++QOJ7l1BfvCwEAoeGk4MmGKbc3FYwEosSy2O9IFFfhNqW5a
	 Afmdi6VGNU1RxadfoHKh9a1NJymBrWvyX2a0dSyh7rMldrUtwhQjZm3LzyzO1OVm7tRi9
	 Q3wRxB7Fgl20km9TxZgrHinF/klBSqTCwgFurqdF1z3gfybEcFyfa//bR2t7c8+Bm/NNX
	 Bm5Qj9U8x6SaA5q0jqo+kg7cdQwj15YOKwopZq+NxK+4NyEoNXcV2Kqs/owDxvAb1YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rnRMS6NrjaAL6KS8KVB6qlnbH88zRv1HcCnzXNaTbv0=;
	b=YeqeKipQ10Ho0muoRmV9kOf1xOaCb2j7VX0/RuJB8dAIXKeh5KLsPzoa8MxHCkST+X5Z
	 pw/vCg2zPS3bfdc2cT3sptn6xCwkCBdC7fKl3+aaaZ/lIXgCCpkedXudbifBfuxxm8z+P
	 Uo0SWBeiyoimcG4MozUPZZUWQuPreUsdtTPgyWsiszsrNTSdFtjoSrDFVib9Nk7CQD+7X
	 N150Mfm3u6dbe9T9l7VZVKGdJHPWgJi7IKZm3mFF7vqEZ4Gj/GJ5Txsb3SBzYfjxV9iq6
	 zaovxvCLx5OxbZ9bOqEfnvkzEfekJV0VstjIUOCzoSJWa4FF03/IKD72GOjL7bfj/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0LjKxRI;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DAC606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7DAC606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0LjKxRI
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7850095e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 12:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793998329; x=1794603129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnRMS6NrjaAL6KS8KVB6qlnbH88zRv1HcCnzXNaTbv0=;
        b=W0LjKxRIg31sAsAp6UpbOM47kfrowESSmLcDdTW/VhA7JNhylVIJ6mjj+UIP8l18cy
         YEZgpDgt2l0q3eJk7fxZvFqTxePg65wFY03g+kGH1cRjG5Hy4Ts1uOZxd1z+/GAN7FPM
         Al/Vwf4RziyGlZPrgJ1Fvlob1cQvXvoKhxmELkXh9r7yfGDJ6Rr7p2e9tOaZAERApLVn
         tmhH8pQdvVX8j+p+GKiwSIE4DC6iVquGE3BH4OT5++t7d9u0ORnZvkjtoub+Erby2vGf
         Nptyrrc4y5LMs8EtuAGE2i7ZCyd/ctxLhfRblfP1zUyrfRb/PQjN3SPSX10v6wR6c0Ru
         oszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793998329; x=1794603129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnRMS6NrjaAL6KS8KVB6qlnbH88zRv1HcCnzXNaTbv0=;
        b=HwbP/ywHBnIYQZm2Mvrsy4lhT46m48jWepOcwfey3QfHLvj9awQXezopust6lG2Qr9
         dqw5SGerR8FcnCEies8B2Y0ZdcgqcV8j/0o4KplYj63BR4eUmsRLgKqGfHHeNM8Ttn2/
         k5tmym6bwTKlx28GwjiAE35NLeopXNN2f31sjJEZcmc5dKGzFho1eYUVq6EX8fbwzKjD
         A4e1i9wH82FN1Dqkb1NBwAr7ZoVU6Uezd3dF6dtWYqvF0Tet/2ByonFhSSqIcbXJcx5T
         oz0lJhmZzFpgpKvE3Uq3pD5mlUgkzlog44e5C2hfh+igIEfpbtkCR4h4xlXAByUVLyo2
         eD6A==
X-Forwarded-Encrypted: i=1; AKwUvByOXO3Z3ECrsw043lDrVDvMv7462SdGneZJG+OK9oWpE8RVlLCz1f/mdT3x4rMmYa9yWfBnj9wEi6evuww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gUT6JGILKso1piHWCPzqc9I+q1d2yX9xLmmnjY5My5giWgExl
	G1i85CPwvstbKmbbAa0pWdjtO4XAnNJXVbNIkTwvfb3uOC7rg3L59sDt
X-Gm-Gg: AYBFou2g9Tc45dm/RhonkNsQju4DvGRw5BTtL2Q0ssPTg8Hlh5Zv+x4RY37EfF23j0f
	Fwsp45YHT23v62YyUQ5ubfHJF6WIPgvuwXMBrNixYTGWKZcMq1RADEVSFKTXfrLAX1TuWC9L6a/
	b7Gaet9RFyiQcSXUS6KhJnYBAuVQtrph1Cx1H2W9SemxCrfpa7oJAy7mDpntvMMP8TUbzWmWYQp
	PxndNofyZU7TJI4Vjr4tXxQ9xZCenWLk6RZeM+tckeESomD/Stzw7DYLvkno97XpgRnZ8G5fzfv
	NFQw33Ll5QsH/Kpb0UEQovZ2if2b68UyvcH5V7+CNIR6SKbxMuPADVB74VnlhbGgpjBBxNnq+ZF
	+RP0lu7fV/nrIJ4iOl2WjSi/ZVXyf8+H8U1ESogyVrbBn/fqNHYc8S4GmwOSf7ORB1LIuAgjYDM
	AgmRnZX1qbL19Fc5Iiy3/tqToZJkC12QuLZLzc93f6fMa336ySXEZXyclh+5oPli/y/mwUzcHAp
	lOLG89Xt8tw5NH8F/sMk2NTaWWZ7lPqV1WLnMRcQRQyhifFCII1twZoBKlqJPlCMoxNru+p1SaO
	Q6Pg7D+C/67D99b0Empu2oQXI0LQYsCWe/T39ZvmI7kMHd8=
X-Received: by 2002:a05:600c:46d1:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4b6dfe8f492mr65228495e9.34.1793998329247;
        Fri, 06 Nov 2026 12:52:09 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm9075425e9.1.2026.11.06.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 12:52:08 -0800 (PST)
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
Subject: [PATCH v1 bpf-next 08/18] bpf: Add the bpf_scan_ir LLVM plugin
Date: Fri,  6 Nov 2026 21:02:57 +0000
Message-ID: <20261106210314.1767267-8-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: 20261106205523.1765622-1-a.s.protopopov@gmail.com
References: <20261106210314.1767267-1-a.s.protopopov@gmail.com>
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

Add a new bpf_scan_ir.cpp LLVM plugin selected by the new
CONFIG_CLANG_PLUGIN_BPF_SCAN_IR option. The new plugin depends on
DEBUG_INFO_BTF, as the information it produces eventually ends up in
kernel/module BTF. It needs LLVM 19 or later and supports only x86_64
and arm64. For now LTO_CLANG is not supported. It is a planned
follow-up. The new pass runs after optimization over the IR of the
kernel and modules.

The purpose of this plugin is to gather information about functions,
which can be targets for BPF fmodret programs (have paths without side
effects which return errors). The records about functions are stored in
the new .BTF_fmodret_candidates section which is created by plugin and
later is processed by the resolve_btfids tool. The actual plugin logic is
added in the following commits.

Keep .BTF_fmodret_candidates and its relocations in the temporary BTF
link and discard it before the later links, so the build-only function
references do not create runtime relocations. Keep it in modules until
their BTF is generated and remove it then, also when BTF generation is
skipped. Without module BTF, discard it at the module link. Let modpost
accept the section. Let objtool skip its relocations in IBT validation:
a record has the address of its function, which is not an indirect
branch target. The vDSO, the EFI stub and the early boot code are built
without the plugins, so position-independent startup objects do not
contain the absolute function pointers of the records.

The record format and the linker script are in scripts/bpf, so a future
GCC plugin can share them.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 MAINTAINERS                          |   7 ++
 include/asm-generic/vmlinux.lds.h    |   3 +-
 scripts/Makefile.llvm-plugins        |   2 +
 scripts/Makefile.modfinal            |   1 +
 scripts/Makefile.vmlinux             |   3 +
 scripts/bpf/fmodret.lds              |   6 ++
 scripts/bpf/fmodret_metadata.h       |  29 ++++++
 scripts/gen-btf.sh                   |   4 +-
 scripts/link-vmlinux.sh              |   7 ++
 scripts/llvm-plugins/Kconfig         |  16 ++++
 scripts/llvm-plugins/bpf_scan_ir.cpp | 126 +++++++++++++++++++++++++++
 scripts/mod/modpost.c                |   1 +
 scripts/module.lds.S                 |   5 ++
 tools/objtool/check.c                |   1 +
 14 files changed, 209 insertions(+), 2 deletions(-)
 create mode 100644 scripts/bpf/fmodret.lds
 create mode 100644 scripts/bpf/fmodret_metadata.h
 create mode 100644 scripts/llvm-plugins/bpf_scan_ir.cpp

diff --git a/MAINTAINERS b/MAINTAINERS
index 02b6c8963c63..dfbb45ecc716 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5064,6 +5064,13 @@ S:	Supported
 F:	arch/x86/net/
 X:	arch/x86/net/bpf_jit_comp32.c
 
+BPF [COMPILER PLUGINS]
+M:	Anton Protopopov <a.s.protopopov@gmail.com>
+L:	bpf@vger.kernel.org
+S:	Maintained
+F:	scripts/bpf/
+F:	scripts/llvm-plugins/bpf_*
+
 BPF [CORE]
 M:	Alexei Starovoitov <ast@kernel.org>
 M:	Daniel Borkmann <daniel@iogearbox.net>
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index f8254a88e05d..4e18758b5ffc 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -886,7 +886,8 @@
 		KLP_SYMID
 
 #define MODINFO								\
-		.modinfo (INFO) : { KEEP(*(.modinfo)) }
+		.modinfo (INFO) : { KEEP(*(.modinfo)) }	\
+		.BTF_fmodret_candidates 0 (INFO) : { KEEP(*(.BTF_fmodret_candidates)) }
 
 #ifdef CONFIG_GENERIC_BUG
 #define BUG_TABLE							\
diff --git a/scripts/Makefile.llvm-plugins b/scripts/Makefile.llvm-plugins
index e18f4907b015..9ff364f4db59 100644
--- a/scripts/Makefile.llvm-plugins
+++ b/scripts/Makefile.llvm-plugins
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+llvm-plugin-$(CONFIG_CLANG_PLUGIN_BPF_SCAN_IR) += bpf_scan_ir.so
+
 LLVM_PLUGIN := $(llvm-plugin-y)
 LLVM_PLUGINS_CFLAGS := $(strip $(addprefix -fpass-plugin=$(objtree)/scripts/llvm-plugins/, \
 	$(LLVM_PLUGIN)) -DLLVM_PLUGINS)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b9..042c31e3bdfb 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -42,6 +42,7 @@ quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
 	if [ ! -f $(objtree)/vmlinux ]; then				\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
+		$(OBJCOPY) --remove-section=.BTF_fmodret_candidates $@;	\
 	else	\
 		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 95b523fe4f9e..c8651454c3d3 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -73,6 +73,9 @@ vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD
 ifdef CONFIG_DEBUG_INFO_BTF
 vmlinux.unstripped: $(RESOLVE_BTFIDS) $(srctree)/scripts/gen-btf.sh
 endif
+ifdef CONFIG_CLANG_PLUGIN_BPF_SCAN_IR
+vmlinux.unstripped: $(srctree)/scripts/bpf/fmodret.lds
+endif
 
 ifdef CONFIG_BUILDTIME_TABLE_SORT
 vmlinux.unstripped: scripts/sorttable
diff --git a/scripts/bpf/fmodret.lds b/scripts/bpf/fmodret.lds
new file mode 100644
index 000000000000..6bdfde9e7679
--- /dev/null
+++ b/scripts/bpf/fmodret.lds
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+SECTIONS {
+	/DISCARD/ : {
+		*(.BTF_fmodret_candidates)
+	}
+}
diff --git a/scripts/bpf/fmodret_metadata.h b/scripts/bpf/fmodret_metadata.h
new file mode 100644
index 000000000000..209f266f89a3
--- /dev/null
+++ b/scripts/bpf/fmodret_metadata.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef FMODRET_METADATA_H
+#define FMODRET_METADATA_H
+
+/*
+ * The records which the BPF compiler plugins write to .BTF_fmodret_candidates
+ * for resolve_btfids, one for each function with values and for each weak
+ * definition. If a function has two weak definitions, the record of the one
+ * which loses the link would describe the body of the other, so both need a
+ * record to make the function ambiguous. A record is packed, target-endian and
+ * aligned to the target pointer size:
+ *
+ *	u32 magic, version, size, flags;
+ *	ptr function;
+ *	u32 nr_values, reserved;
+ *	s64 values[nr_values];
+ *
+ * The values are the errors which clean paths of the function return, sorted
+ * and unique.
+ */
+#define FMODRET_META_MAGIC 0x46524d32U
+#define FMODRET_META_VERSION 1U
+#define FMODRET_META_HEADER_SIZE(ptr_size) (24 + (ptr_size))
+#define FMODRET_META_VALUE_SIZE 8
+
+#define FMODRET_FN_WEAK (1U << 0)
+#define FMODRET_FN_RET64 (1U << 1)
+
+#endif
diff --git a/scripts/gen-btf.sh b/scripts/gen-btf.sh
index b17f1189298a..5bca864631e0 100755
--- a/scripts/gen-btf.sh
+++ b/scripts/gen-btf.sh
@@ -120,7 +120,9 @@ gen_btf_o()
 
 embed_btf_data()
 {
-	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF ${ELF_FILE}
+	# resolve_btfids has consumed the compiler plugin records of the module
+	${OBJCOPY} --add-section .BTF=${ELF_FILE}.BTF \
+		--remove-section=.BTF_fmodret_candidates ${ELF_FILE}
 
 	# a module might not have a .BTF_ids or .BTF.base section
 	btf_base="${ELF_FILE}.BTF.base"
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index d5710e900bd4..f39e2d1f1400 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -89,6 +89,13 @@ vmlinux_link()
 		ldlibs=
 	fi
 
+	if is_enabled CONFIG_CLANG_PLUGIN_BPF_SCAN_IR; then
+		if [ "${output}" = ".tmp_vmlinux1" ]; then
+			ldflags="${ldflags} ${wl}--emit-relocs"
+		else
+			ldflags="${ldflags} ${wl}--script=${srctree}/scripts/bpf/fmodret.lds"
+		fi
+	fi
 	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
 
 	# The kallsyms linking does not need debug symbols included.
diff --git a/scripts/llvm-plugins/Kconfig b/scripts/llvm-plugins/Kconfig
index 37db99159b9c..c4d62ae5f65d 100644
--- a/scripts/llvm-plugins/Kconfig
+++ b/scripts/llvm-plugins/Kconfig
@@ -15,3 +15,19 @@ menuconfig LLVM_PLUGINS
 	  Building them requires LLVM development headers and llvm-config
 	  of the same major version as clang. Each plugin has its own option
 	  below and is built only if that option is enabled.
+
+if LLVM_PLUGINS
+
+config CLANG_PLUGIN_BPF_SCAN_IR
+	bool "Scan optimized LLVM IR for BPF"
+	depends on X86_64 || ARM64
+	depends on DEBUG_INFO_BTF
+	depends on !LTO_CLANG
+	depends on CLANG_VERSION >= 190000
+	help
+	  Find the functions which return errors on paths without side
+	  effects and describe them in .BTF_fmodret_candidates for
+	  resolve_btfids. The section is discarded from the final kernel
+	  and modules.
+
+endif
diff --git a/scripts/llvm-plugins/bpf_scan_ir.cpp b/scripts/llvm-plugins/bpf_scan_ir.cpp
new file mode 100644
index 000000000000..6700896749d4
--- /dev/null
+++ b/scripts/llvm-plugins/bpf_scan_ir.cpp
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* bpf_scan_ir: optimizer-last LLVM IR analysis for BPF. */
+
+#include "../bpf/fmodret_metadata.h"
+
+#include "llvm/ADT/SmallVector.h"
+#include "llvm/Config/llvm-config.h"
+#include "llvm/IR/Analysis.h"
+#include "llvm/IR/Constants.h"
+#include "llvm/IR/GlobalVariable.h"
+#include "llvm/IR/Module.h"
+#include "llvm/IR/PassManager.h"
+#include "llvm/Passes/PassBuilder.h"
+#if __has_include("llvm/Plugins/PassPlugin.h")
+#include "llvm/Plugins/PassPlugin.h"
+#else
+#include "llvm/Passes/PassPlugin.h"
+#endif
+#include "llvm/Transforms/Utils/ModuleUtils.h"
+
+using namespace llvm;
+
+namespace {
+
+/* The errors which clean paths of a function return */
+using ReturnValues = SmallVector<int64_t, 8>;
+
+struct FunctionDescription {
+	Function *Fn;
+	unsigned Flags;
+	ReturnValues Values;
+};
+
+static void emitDescriptions(Module &M, ArrayRef<FunctionDescription> Functions)
+{
+	auto *I32 = Type::getInt32Ty(M.getContext());
+	auto *I64 = Type::getInt64Ty(M.getContext());
+	unsigned PtrSize = M.getDataLayout().getPointerSize();
+	auto N = [&](unsigned V) -> Constant * { return ConstantInt::get(I32, V); };
+
+	for (const auto &F : Functions) {
+		unsigned Size = FMODRET_META_HEADER_SIZE(PtrSize) +
+				F.Values.size() * FMODRET_META_VALUE_SIZE;
+		SmallVector<Constant *, 16> Fields = {
+			N(FMODRET_META_MAGIC), N(FMODRET_META_VERSION), N(Size), N(F.Flags),
+			F.Fn, N(F.Values.size()), N(0),
+		};
+
+		for (int64_t V : F.Values)
+			Fields.push_back(ConstantInt::getSigned(I64, V));
+		Constant *Record = ConstantStruct::getAnon(M.getContext(), Fields, true);
+		auto *GV = new GlobalVariable(M, Record->getType(), true, GlobalValue::PrivateLinkage,
+					      Record, "fmodret.function." + F.Fn->getName());
+		GV->setSection(".BTF_fmodret_candidates");
+		GV->setAlignment(M.getDataLayout().getPointerABIAlignment(0));
+		appendToUsed(M, {GV});
+	}
+}
+
+#if LLVM_VERSION_MAJOR >= 24
+class BpfScanIRPass : public RequiredPassInfoMixin<BpfScanIRPass>
+#else
+class BpfScanIRPass : public PassInfoMixin<BpfScanIRPass>
+#endif
+{
+public:
+	PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM)
+	{
+		// Avoid emitting duplicate descriptions if bpf_scan_ir runs again
+		// on the same module.
+		if (M.getNamedMetadata("bpf_scan_ir.done"))
+			return PreservedAnalyses::all();
+
+		SmallVector<FunctionDescription, 32> Descriptions;
+
+		for (Function &F : M) {
+			if (F.isIntrinsic() || F.isDeclaration() || F.hasAvailableExternallyLinkage())
+				continue;
+			Type *Ret = F.getReturnType();
+			unsigned Flags = 0;
+			ReturnValues Values;
+
+			if (!Ret->isIntegerTy(32) && !Ret->isIntegerTy(64))
+				continue;
+			if (F.isWeakForLinker())
+				Flags |= FMODRET_FN_WEAK;
+			if (Ret->isIntegerTy(64))
+				Flags |= FMODRET_FN_RET64;
+			/*
+			 * Nothing finds the values yet. A weak definition always
+			 * has a record, see fmodret_metadata.h.
+			 */
+			if (!Values.empty() || (Flags & FMODRET_FN_WEAK))
+				Descriptions.push_back({&F, Flags, std::move(Values)});
+		}
+		if (Descriptions.empty())
+			return PreservedAnalyses::all();
+		emitDescriptions(M, Descriptions);
+		M.getOrInsertNamedMetadata("bpf_scan_ir.done");
+
+		PreservedAnalyses PA;
+		PA.preserve<FunctionAnalysisManagerModuleProxy>();
+		PA.preserveSet<CFGAnalyses>();
+		return PA;
+	}
+
+	static bool isRequired() { return true; }
+};
+
+} // namespace
+
+extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo()
+{
+	return {
+		LLVM_PLUGIN_API_VERSION,
+		"bpf_scan_ir",
+		"1.0",
+		[](PassBuilder &PB) {
+			PB.registerOptimizerLastEPCallback(
+				[](ModulePassManager &MPM, OptimizationLevel, auto...) {
+					MPM.addPass(BpfScanIRPass());
+				   }
+			);
+		}
+	};
+}
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 75374c64b8cc..3bae98549228 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -772,6 +772,7 @@ static const char *const section_white_list[] =
 	".llvm.call-graph-profile",	/* call graph */
 	"__llvm_covfun",
 	"__llvm_covmap",
+	".BTF_fmodret_candidates",
 	".klp.symid",			/* objtool --klp-symids */
 	NULL
 };
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index d0f200428957..e6ba499dc876 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -27,6 +27,11 @@ SECTIONS {
 	__ex_table		0 : ALIGN(4) { KEEP(*(__ex_table)) }
 
 	__patchable_function_entries 0 : { *(__patchable_function_entries) }
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	.BTF_fmodret_candidates	0 (INFO) : { KEEP(*(.BTF_fmodret_candidates)) }
+#else
+	/DISCARD/ : { *(.BTF_fmodret_candidates) }
+#endif
 
 	.init.klp_funcs		0 : ALIGN(8) { KEEP(*(.init.klp_funcs)) }
 	.init.klp_objects	0 : ALIGN(8) { KEEP(*(.init.klp_objects)) }
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 931c5c412f15..e6120bee4505 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4657,6 +4657,7 @@ static int validate_ibt(struct objtool_file *file)
 		    !strcmp(sec->name, "__jump_table")			||
 		    !strcmp(sec->name, ".init.klp_funcs")		||
 		    !strcmp(sec->name, "__mcount_loc")			||
+		    !strcmp(sec->name, ".BTF_fmodret_candidates")	||
 		    !strcmp(sec->name, ".llvm.call-graph-profile")	||
 		    !strcmp(sec->name, ".llvm_bb_addr_map")		||
 		    !strcmp(sec->name, "__tracepoints")			||
-- 
2.43.0

