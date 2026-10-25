Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792957455;
	b=LHMqBATXtXc4uiXGC1RiUOj3Y63uylgqT9JSXmG6Zi6RyuJZk5ZrV9tX+idJ2Sqk65T+
	 t4gesPcbeBv6TW78ALVzB95AwYg6luhbG/He+DouvsRBchRqsouXXShFGv3AypKiwwUgK
	 ubIGK7huMxoIYh2QVIGgeLEqypyfWh6JBB+3JbVzwopB/No2BGcOXR482KkfibV9wWdf/
	 wW6YahTgiYtqSOVai1q8i6SNo6zAxwkC/iGjTLoCt78sRDVbSYtN9E3VhxNGXe1BfulQE
	 bcs7eO6S8gJbzktrTy9qwAHwdTyMhiboxdhdCrmbbR8xMJ8kHSsjncRjSkDKdomZZQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792957455;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=t8f8qyhuvy1niJGVLorepl9wBjUiaKTLfblqj2kxv0c=;
	b=QFAxgBn8OQ85q8Qe9Ld750gHA/GkCLsJNEEinIaf75aloeNa8yNl22SePd6A1qIYaP7o
	 vMgkrEXiTq2HIcgZ+AC45JwpoT7vuW+kcpgse4oj5x83O+plR/im3sqj/iAguJOCURQu+
	 jfIWljXtkcGV77kDgVuHMlfpHP1Ad+WHGIbKJIKCUzqeokoNaodlTOlxxtkWOYBPeq7Ek
	 QkLujZRwg8oN1Gj5+QR9Eu2D8BqVoi5GiH3HbVL/9+UP1FgxXfGG8+DKQb39qE8MBrJdZ
	 lkVZBp5bXGFSCaNs3sfr3DTrVxK75JQEWcTp/FdzjC2JWWzQ8Y8LK+SA3FVdhkw7Mew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4r7hstt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A93D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 19:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4r7hstt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0251F01825;
	Sun, 25 Oct 2026 19:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792957455;
	bh=t8f8qyhuvy1niJGVLorepl9wBjUiaKTLfblqj2kxv0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U4r7hstth9yI2H9ozGbe6KwjiJsa0c5mODktr3udIoIg7yHMqh0qVzPotslmUCdmR
	 9tdINqr+szbc8T3L1gP2w8ZsBed6uYI2Ovmfn0gRRbdl36LePXMkRaq+m+4j+vS84p
	 NJxOgQDbHOV8CbfdBrtlMdbcyDpBrusFDSB4zloGgPR7bq0fRufwRCjNEtCFispfaE
	 h06v9qLXnqLbyNl4PNgcfaEbvy2moi4psjXnZdccnkovJyluQSef7OPIQD/wwJJzO0
	 VfSjUGTc08Mxut3qhscCe66A4GpcY/NCs2W7vg/xTYvVpop8wR8k/q+G1WYbx5p6Lo
	 +3FAzafwhvY9Q==
Date: Sun, 25 Oct 2026 12:44:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Antoni =?utf-8?Q?Kuczy=C5=84ski?= <antoni.kucz@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating
 SSE/AVX code
Message-ID: <20261025194411.GA56787@ax162>
References: <20261025174336.8857-1-antoni.kucz@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025174336.8857-1-antoni.kucz@gmail.com>

Hi Antoni,

On Sun, Oct 25, 2026 at 06:43:35PM +0100, Antoni Kuczyński wrote:
> With CONFIG_X86_NATIVE_CPU=y, GCC is invoked with -march=native after
> the -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a flags
> that keep FP/SIMD code out of the kernel. The GCC driver expands
> -march=native into an explicit list of ISA options for the build host
> (e.g. "-march=ivybridge ... -msse4.2 -mavx ..."), and because these come
> later on the command line they override the earlier -mno-* flags.
> 
> As a result, on any build host with AVX the compiler is free to use
> SSE/AVX registers throughout the kernel, for instance to zero or copy
> structures. A trivial reproducer:
> 
>   struct s { long a, b, c, d; };
>   void f(struct s *p) { struct s z = {0}; *p = z; }
> 
>   $ gcc -mno-sse -mno-sse2 -mno-avx -march=native -Os -c t.c
>   vpxor   %xmm0,%xmm0,%xmm0
>   vmovdqu %ymm0,(%rdi)
> 
> On an Ivy Bridge machine (i5-3317U, GCC 14.2) a v7.3 kernel built this
> way resets immediately after the bootloader hands over control. Booting
> the same image in QEMU with "-d int,cpu_reset -no-reboot" shows:
> 
>   v=06 (#UD) IP=0010:000000000125e47b
>   v=0d (#GP) -> v=08 (#DF) -> Triple fault
> 
>   __pi_startup_64_load_idt+0xb:
>   c5 f9 ef c0    vpxor  %xmm0,%xmm0,%xmm0
> 
> The startup code executes an AVX instruction before CR4.OSXSAVE/XCR0
> are set up and before an IDT is installed, so the #UD escalates to a
> triple fault. Even past early boot, compiler-generated SIMD code would
> silently clobber user space FPU state, since the kernel does not save
> it on kernel entry outside of kernel_fpu_begin()/kernel_fpu_end().
> 
> Re-apply the -mno-* flags after -march=native, the same way EGPR use
> is already suppressed for native builds.
> 
> Fixes: ea1dcca1de12 ("x86/kbuild/64: Add the CONFIG_X86_NATIVE_CPU option to locally optimize the kernel with '-march=native'")

This option has been in the kernel for quite some time and I am sure
people are using it. I wonder why this has not come up sooner. Just
unlucky timing or configuration?

> Cc: stable@vger.kernel.org
> Signed-off-by: Antoni Kuczyński <antoni.kucz@gmail.com>
> ---
> 
> Notes:
>     Tested: v7.3 + this patch, CONFIG_X86_NATIVE_CPU=y, GCC 14.2.0 (Debian),
>     boots on i5-3317U. arch/x86/boot/startup/gdt_idt.o contains no xmm/ymm
>     instructions after the change (previously 2).
> 
>  arch/x86/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index b7e08519b8c1..2c0575fd7bbc 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -161,6 +161,9 @@ else
>  
>  ifdef CONFIG_X86_NATIVE_CPU
>          KBUILD_CFLAGS += -march=native
> +        # -march=native expands to explicit -msse/-mavx/... flags that
> +        # override the earlier -mno-* ones; disable FP/SIMD code again.
> +        KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a

Maintaining two copies of these flags (and having them appear in the
command line twice) seems objectively worse than just adding an extra
'ifdef CONFIG_X86_64' and moving the block up so that this happens in
the naturally expected order?

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index b7e08519b8c1..c18f660f6dc8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -66,6 +66,21 @@ export REALMODE_CFLAGS
 # e.g.: obj-y += foo_$(BITS).o
 export BITS
 
+ifdef CONFIG_X86_64
+ifdef CONFIG_X86_NATIVE_CPU
+KBUILD_CFLAGS += -march=native
+# Prevent the compiler from generating EGPR use. The kernel is
+# not yet prepared for general in-kernel use.
+KBUILD_CFLAGS += $(call cc-option,-mno-apx-features=egpr)
+
+# generate_rust_target.rs handles Rust APX gating.
+KBUILD_RUSTFLAGS += -Ctarget-cpu=native
+else
+KBUILD_CFLAGS += -march=x86-64 -mtune=generic
+KBUILD_RUSTFLAGS += -Ctarget-cpu=x86-64 -Ztune-cpu=generic
+endif
+endif
+
 #
 # Prevent GCC from generating any FP code by mistake.
 #
@@ -73,6 +88,8 @@ export BITS
 #
 #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
 #
+# and after -march=native.
+#
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -mno-sse4a
 KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
@@ -159,19 +176,6 @@ else
 	# Use -mskip-rax-setup if supported.
 	KBUILD_CFLAGS += -mskip-rax-setup
 
-ifdef CONFIG_X86_NATIVE_CPU
-        KBUILD_CFLAGS += -march=native
-        # Prevent the compiler from generating EGPR use. The kernel is
-        # not yet prepared for general in-kernel use.
-        KBUILD_CFLAGS += $(call cc-option,-mno-apx-features=egpr)
-
-        # generate_rust_target.rs handles Rust APX gating.
-        KBUILD_RUSTFLAGS += -Ctarget-cpu=native
-else
-        KBUILD_CFLAGS += -march=x86-64 -mtune=generic
-        KBUILD_RUSTFLAGS += -Ctarget-cpu=x86-64 -Ztune-cpu=generic
-endif
-
         KBUILD_CFLAGS += -mno-red-zone
         KBUILD_CFLAGS += -mcmodel=kernel
         KBUILD_RUSTFLAGS += -Cno-redzone=y
-- 
Cheers,
Nathan
