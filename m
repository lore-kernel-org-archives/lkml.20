Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287466;
	b=H4BbH78ZVJrEg2/NzyNLXFAyH604/KOgpdZfOKN4IkB9jFzYrCEWpm1hq5lnCZ0UnYiS
	 naA+E4FQQCvQ6uM/uvkiaUXdLXMpOxZh4y/jj+/Dl1ZYrTwW2DzzhD/u2nIbF7A34EdKn
	 vTVj8GnarNPETFnu9lowvR0nnlPMa8PZGcACZMF8ZL/FF1X846dMKNZQSkBv12BCc39Eg
	 Doh4YtCbHEZqqJx2NQ+q0/3m7c3bKhLSO5TTwd4Na/tJD0ldZ7sEXZOqx1GEwMp68NyQD
	 XjDmbMIqAEzvMIXCzZkeh3zhxgLRXTgViG3fAS6BjNWXyfmQ1xVaApspWIwyOJwwc+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
	b=pA1bfhZCl10HCDHNXl8NCJ76g8YmWNY7Rq/FIgzf+cEjNSgdZuC5jc/B38BWvN/qI7TL
	 iGFP67uQ1HC0MLIPODpo1t0loyTch+iIMkgAWFExtqe0QQE/yaQoTHvNeLD6FOOgCYXJ4
	 yEYF8FP1h26jMJCf6ibuUO6AjJisvsBwVpyHFWggIWcs1Epj71NcZtE+gg3V+l5CvkzcL
	 0eTDHI9HuRFd1sBG+cSravKt3vNNuFrCWcv4HxFstLSpOntOgAfmeerv2daZwiMgoYWNN
	 8q1RHjDWhHcmV1dYcUZIb0YP6XJS315/sgY3dA4CwdNr+chPuVrfuIIzIBqY0slGA5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM6QC3jI;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2171C606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2171C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM6QC3jI
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so947363a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287464; x=1793892264; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
        b=LM6QC3jI1tgj22lK6Gy0qBKpgnNnhX2yvMeR62egvL8DqeZV8E/dj3BK9uQkOKO09S
         RUjK/wGTneatYkolZgEtAI0iPJ4CmndfoGfBLLbNpKhaDjMFTAZ9XdpNVadCTau7k0fH
         LL9VTOxdx97US5kAx3vLbAlTQSqV+8OAOP1mMQ2UITDAjQqgz3pRfLEbZHJkl6h9GD4f
         vvjrNWKbdrX4Ixyov3dYvASHHBkEisB3ICewF9NdxxBB5nO/t9TIExUFKcmkAX1lIF+m
         RBZMzzYWgguX13ou3inQldk8tu+cfaRstb5e6K+bsSIOxQfdSH5IrCIKiJ6hcP/syn+D
         MeWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287464; x=1793892264;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqUQbtPft1j46GYypYCN7/YQGyvs+Nf1fNrdAmWoWxc=;
        b=C/6hCo+mP8SUFiIUUxYQbP+OJBgPjyFZx4L5MeReKUTLLPYhFl4IYpSD7vy/l/vdMr
         ZrGKJCeUHSaA4LoPSC1AKvEriseAPOT6OsTiN7R/rB0E1hd/FEhMUbGQBGgUja3Snfc3
         qvZiKwcTnM7ROoY03rOM18/ssapOXxA3/ypIIBGXRMtf74cBX/uLPZCTyuHR7JAL32QJ
         bzC7m9k7y0p0EC/GTh+VP+9usJ0HIjDqNuhGZoTIXNVcBmXfHv5d9gEObFp4LNzWJF2b
         E9rJ4GTIfcTsO9a23bmEroAlIs6fmhStwAzJYJzBJ6Bsf6WyyT/pct2alp6hJM3f/34d
         eOBQ==
X-Gm-Message-State: AFq9FYKQG0CkMBjnCSU9x7K16W8w4dycgjPn+d59B/tXcfaEDmYbgPuY
	razBV88XWm2pRIm/7vzo6bdhKPwCMICUl/wxsoN67iaApB6YtTWGtH1Q
X-Gm-Gg: AYBFou3t3vJ7Y2bHxdYjqLJNm+aRqHOzBTQ9HHsGoltwBBB2M/ePy2G/QC0LX6YgN2L
	Pj7/MKLgFlJm1klH1UBw0c//vuK4v0cvXCtlPyOdAnMjl08sPb5sPc+XWqTIAbw+c3ZR/FuEO0R
	hFR1las2e1l9SPJdLYNBGccy0bViIJpi4bLqWb5aityq5mcuah9ssCfQsN/pGza1TSxYRv09QMr
	FRU8Trl2knfk1l+GYt6IQ1j4YQwn5iAvxklgD+jF43JzVEkz+icPOuil3E2my6OpnEjlubkBa5p
	WIY6wSaVfKZq1L//Ia3+C1CfuS3dWkT08qm+EsMNu9zmbVGJdUU0jBnhPsZB0kJHnysetCAMUNY
	vwFzCVanmpDmuJ8Xr1MIrh1SWreDMJf7Th+0AM93l4cgpXMG4dhsxpc+jrXjorigfHEM255MZeZ
	EAboHplff1q6Snnu0Svpa0mS99vC2+PScN1FBxxoRhQjubkWpSHWnUHD988u8PwNKvmrO2+maVa
	t7XBdAVb1WIi94Wu4DMLj27rN9TZlYURGaaiCKjqXLGQ2Q9XlKkclCLS5EP7dInXD4jq8rVdQZk
	1mJbCHTcWyPWd1/Uw/0b4gw3WEg6DRHzBKJaXeoj9wv2uouK+f/QH0WCC2esmztYDXpaXfr7gFU
	TZ4ui2ztNJyu0FYaEa6IW4YSvTdeHXjzY7g==
X-Received: by 2002:a17:90b:48c7:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3ae57e346ffmr4072955a91.9.1793287463471;
        Thu, 29 Oct 2026 08:24:23 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae579c59a6sm3481124a91.3.2026.10.29.08.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 08:24:22 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Oct 2026 15:24:22 +0000
Message-Id: <DMHFCN3J36VN.2JJEE30A07C0Z@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH bpf-next v3 2/2] bpftool: Make the LLVM disassembler an
 optional runtime dependency
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <socketpair@gmail.com>, "Quentin Monnet" <qmo@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song
 Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri
 Olsa" <jolsa@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Bill
 Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Nick Desaulniers" <ndesaulniers@google.com>
In-Reply-To: <20261029-bpftool-plugin-v3-2-87af799da40a@gmail.com>
References: <20261029-bpftool-plugin-v3-0-87af799da40a@gmail.com> <20261029-bpftool-plugin-v3-2-87af799da40a@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Oct 29, 2026 at 06:05 AM Mark Korenberg via B4 Relay <devnull+socketpair.gmail.com@kernel.org> wrote:
> Move the LLVM disassembler to a plugin, $(libdir)/bpftool/bpftool-llvm.so,
> that bpftool loads with dlopen() only when disassembling JITed programs.
> Distributions can then ship it as an optional package.
>
> The plugin exports a single structure of callbacks, with an ABI version
> checked by bpftool. bpftool looks for the plugin next to its own binary,
> then in its install directory, but not in the current directory since it
> usually runs as root. "bpftool version" reports "llvm" only if the plugin
> can be loaded.

This is overkill.
The plugin wraps 7 llvm-c functions and the target init calls.
bpftool can dlopen() libLLVM.so itself and dlsym() them.
perf does that for libcapstone. See
commit b5c9bcde61b8 ("perf capstone: Support for dlopen-ing libcapstone.so").

                     this patch                  dlopen(libLLVM.so)
  -----------------  --------------------------  ------------------
  installed files    bpftool, bpftool-llvm.so    bpftool
  who finds the lib  llvm_plugin_find()          ld.so
  ABI to maintain    struct bpftool_llvm_ops     none
  Makefile           libdir, llvm-plugin-dir,    one -D
                     install, uninstall rules

v1, v2 and v3 each look for the plugin in a different way.
The bpftool that the selftests build still doesn't find it.
selftests/bpf, selftests/hid, selftests/sched_ext and tools/sched_ext do:

  make -C tools/bpf/bpftool prefix= DESTDIR=<dir>/ install-bin

  bpftool           <dir>/sbin/bpftool
  plugin            <dir>/lib/bpftool/bpftool-llvm.so
  bpftool looks in  <dir>/sbin, then /lib/bpftool

"prog dump jited" fails there with this patch.
"make install" in selftests/bpf copies only bpftool. The plugin stays behind.

In the diff below llvm-config gives the name of the library at build time.
ld.so finds it the same way as today.
The distro package recommends the LLVM libs and doesn't require them.
"bpftool version" keeps "llvm" as a compile time feature.
That's what common_options.rst says.
LLVM built with BUILD_SHARED_LIBS=ON is not handled.

Something like this (not even compile tested):

diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
index b0f7168..7a49182 100644
--- a/tools/bpf/bpftool/Makefile
+++ b/tools/bpf/bpftool/Makefile
@@ -186,10 +186,15 @@ ifeq ($(HAS_LLVM),1)
   # Makefile includes lib.mk which sets -D_GNU_SOURCE) which would cause
   # compilation error due to redefinition. Let's filter it out here.
   CFLAGS  += $(filter-out -D_GNU_SOURCE,$(shell $(LLVM_CONFIG) --cflags))
-  LIBS    += $(shell $(LLVM_CONFIG) --libs $(LLVM_CONFIG_LIB_COMPONENTS))
   ifeq ($(shell $(LLVM_CONFIG) --shared-mode),static)
+    LIBS += $(shell $(LLVM_CONFIG) --libs $(LLVM_CONFIG_LIB_COMPONENTS))
     LIBS += $(shell $(LLVM_CONFIG) --system-libs $(LLVM_CONFIG_LIB_COMPONENTS))
     LIBS += -lstdc++
+  else
+    # Don't link with libLLVM.so. "prog dump jited" loads it with dlopen().
+    LIBLLVM_SO := $(shell $(LLVM_CONFIG) --libfiles $(LLVM_CONFIG_LIB_COMPONENTS))
+    CFLAGS += -DLIBLLVM_SO='"$(notdir $(realpath $(LIBLLVM_SO)))"'
+    LIBS += -ldl
   endif
   LDFLAGS += $(shell $(LLVM_CONFIG) --ldflags)
 else
diff --git a/tools/bpf/bpftool/jit_disasm.c b/tools/bpf/bpftool/jit_disasm.c
index 0454115..cca02cd 100644
--- a/tools/bpf/bpftool/jit_disasm.c
+++ b/tools/bpf/bpftool/jit_disasm.c
@@ -25,6 +25,7 @@
 #include <bpf/libbpf.h>

 #ifdef HAVE_LLVM_SUPPORT
+#include <dlfcn.h>
 #include <llvm-c/Core.h>
 #include <llvm-c/Disassembler.h>
 #include <llvm-c/Target.h>
@@ -47,6 +48,88 @@ static int oper_count;

 typedef LLVMDisasmContextRef disasm_ctx_t;

+#ifdef LIBLLVM_SO
+/*
+ * libLLVM.so is big and only "prog dump jited" needs it. bpftool is not linked
+ * with it. disasm_init() loads it.
+ */
+#define LLVM_FUNCS(F)			\
+	F(LLVMCreateDisasm)		\
+	F(LLVMCreateDisasmCPUFeatures)	\
+	F(LLVMDisasmDispose)		\
+	F(LLVMDisasmInstruction)	\
+	F(LLVMDisposeMessage)		\
+	F(LLVMGetDefaultTargetTriple)	\
+	F(LLVMNormalizeTargetTriple)
+
+#define F(fn) static __typeof__(&fn) p_##fn;
+LLVM_FUNCS(F)
+#undef F
+
+static const struct {
+	const char *name;
+	void *ptr;
+} llvm_funcs[] = {
+#define F(fn) { #fn, &p_##fn },
+	LLVM_FUNCS(F)
+#undef F
+};
+
+/* The functions that LLVMInitializeAll*() in llvm-c/Target.h call */
+static const char * const llvm_init_funcs[] = {
+#define LLVM_TARGET(t) "LLVMInitialize" #t "TargetInfo", "LLVMInitialize" #t "TargetMC",
+#include <llvm/Config/Targets.def>
+#define LLVM_DISASSEMBLER(t) "LLVMInitialize" #t "Disassembler",
+#include <llvm/Config/Disassemblers.def>
+};
+
+#define LLVMCreateDisasm		p_LLVMCreateDisasm
+#define LLVMCreateDisasmCPUFeatures	p_LLVMCreateDisasmCPUFeatures
+#define LLVMDisasmDispose		p_LLVMDisasmDispose
+#define LLVMDisasmInstruction		p_LLVMDisasmInstruction
+#define LLVMDisposeMessage		p_LLVMDisposeMessage
+#define LLVMGetDefaultTargetTriple	p_LLVMGetDefaultTargetTriple
+#define LLVMNormalizeTargetTriple	p_LLVMNormalizeTargetTriple
+
+static void *llvm_sym(void *lib, const char *name)
+{
+	void *sym = dlsym(lib, name);
+
+	if (!sym)
+		p_err("%s is not in %s", name, LIBLLVM_SO);
+	return sym;
+}
+
+int disasm_init(void)
+{
+	void (*init)(void);
+	void *lib, *sym;
+	size_t i;
+
+	lib = dlopen(LIBLLVM_SO, RTLD_NOW);
+	if (!lib) {
+		p_err("failed to load %s: %s", LIBLLVM_SO,
+		      dlerror() ?: "unknown error");
+		return -1;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(llvm_funcs); i++) {
+		sym = llvm_sym(lib, llvm_funcs[i].name);
+		if (!sym)
+			return -1;
+		*(void **)llvm_funcs[i].ptr = sym;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(llvm_init_funcs); i++) {
+		init = llvm_sym(lib, llvm_init_funcs[i]);
+		if (!init)
+			return -1;
+		init();
+	}
+	return 0;
+}
+#endif /* LIBLLVM_SO */
+
 static int printf_json(char *s)
 {
 	s = strtok(s, " \t");
@@ -135,6 +218,7 @@ disassemble_insn(disasm_ctx_t *ctx, unsigned char *image, ssize_t len, int pc,
 	return count;
 }

+#ifndef LIBLLVM_SO
 int disasm_init(void)
 {
 	LLVMInitializeAllTargetInfos();
@@ -142,6 +226,7 @@ int disasm_init(void)
 	LLVMInitializeAllDisassemblers();
 	return 0;
 }
+#endif
 #endif /* HAVE_LLVM_SUPPORT */

 #ifdef HAVE_LIBBFD_SUPPORT

Keep patch 1.

Also pls don't respin in 22 minutes only because a bot said something.

pw-bot: cr
