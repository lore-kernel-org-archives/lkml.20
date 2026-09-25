Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF1E479889
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373207; cv=pass; b=R3BXnSdAo64k6Xr6/I2ixmrul4RZqS+g4H1YvFew5scCzrE4A4rx/rIqjvLwJqxBlVHYjRwtwae2SXWmMRiWTId9iAGuKSQQzg7XDYtYSDfTAGbBC7EtAYK1gUaIwRxCUVOV0b+vxqME3srPfbXASwE9+NsVaaNlSoA/LQ1b9zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373207; c=relaxed/simple;
	bh=IvIDM1gQpQElg71mfxdhwP333IjSor731C2Y5yjUqyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKcBR6M2HAnLjAioITJhBQM0JjT2NMkTGVwg0VkEjlpo/IMefnKQedVPVfJ1ApvCCx4R+pRrRRXX5aslE5KU8U0DEl6j0HGuSLIBET1vzvO9fyQfI5L1OOTJ71uq7CKZhp1njhr0dMR81OfNQUjKRZf65mdQLMfy5Z8fZ6hMmyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mAeZrXdm; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mAeZrXdm"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so970720f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:53:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373204; cv=none;
        d=google.com; s=arc-20260327;
        b=SPi9xCjzBPIjHLrpt1IR3ctNwZ4Iw7NBkG0HwfavP0MZsnYpaF6901o7sd+JIqFmF0
         gHDCphnG3Y2d2PmGhhUp1PnqVQ1a1ty7X5yPv3Fm3YeMvbSSI6Duv9SUDakMs+7leWZz
         sl76IyizUeGjrwUiqt6H5RzQ9N6IfQchifh6EoMZRJj2dOTmsE5chh7IG53W+aKABJ15
         f/XaVNxtPHRgIM8sGiHLyi8cm/s3JsTHfa8Vm2yV7NspYGzQ9/nV2LCp7SsusC6zdsqt
         5jN/uyZ3WZEO5H7AxaYijp4IQ6BbfoUKhLyB6sOl3j/Pq7lqtv3JGY71N/QtQOHkIg9J
         PyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        fh=N1J+M+B8HvwdAOTaAc8rFbHuI24EKMH5AOXO1R7HkHA=;
        b=baKgT96+N+JV1W3U3pqYzkHXyjrLMVpvKR5BMNWGlR0jWkfzsIF9OfawzQRIHX0iOo
         9EUH2zb9wxgNEHSVXf/cMOmINLdApPY+zGVWKamG0AAnmHdQi5zjgKYErpzD2j5PcE4N
         hUrF96HNAi2+6rR/P0NzxQMXxOuZJ/kO2gQT0kgNS24zNu8A3qbpDLcOz49Z9VcTtj9l
         sG/MTEq+p3q62YFEfergLX9tU0kT/QqGSIFRvdNhQS8Wog8ISEatz0mFhGssLbRvE9Vm
         oF/X5XuNYjN44W25q0pcB/bqHzhcP0n7/Ma4+FtTp0712EeLKlNoZF21krw1dcf83s8T
         hlyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790373204; x=1790978004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        b=mAeZrXdmB5n57q4q9YYE1PNXeYgdSHZl6FWzEQG8TceHHY9gd8xQU4o6KHV5Tr9zUM
         JuNsgSoJRKTf2cN40W/qijZOTY0sgDZFmlPqV7UHVjyGimq0c3HFDYVBY4fAaOXrRHXS
         um8msLpcQCyf+0keMaIwtg2Obi+jclLWWSIGsCmL4zezDTj0LtUFWRVQjir5vhnsVMI7
         Mj1AmBmb656seIQ5pH2kVkjQYGaVBzkT+EFAlY5EYY8jf1CFqXIamJt4KwsN/k9glt9O
         38QoZ2GN1EM4O1wN7ic1ghJZLP3tTnB++94OTmc9qdXCRgaDeyD5QB0pL/9kjVgns/+b
         XzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373204; x=1790978004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVV1KtWyTLSLHpIl6BWB4AgM90d4cWInAt7fjY5duR4=;
        b=LgQcHEfPpt/xObzSfCE2zaQYIxvIHiojRyrgYISGBg/4FQOF0gtA2X8Z03FjaZjQ47
         RzjtZSi0kSvlHyGe95Yo/WT0ShG7zrK00/Mb+dz8dSGxQi9LEdclHDlgvaeB5Z3pGCzN
         JiMmdHgIHuteYi1mpA0pJfIEVaa+IPoKq/ihLBt3F3HGG/k6wWnuHe3g81GfpCXqSaxw
         2aqPnE4Fu5RESpTYy6oPLDbXNljGvU3dVsKiBpCl+j2gUlMps4OoHJtORF8GQ3NLXFdt
         N8ywH35hpPvjlvq2T2+UqSyGmA+2QMIxtWImM54sMuC2qu1bBVlR7H7SSCLL98iFpdpJ
         PprA==
X-Forwarded-Encrypted: i=1; AKwUvByhbWvkw9NMruL7V+O+Cxj8lqOwI8OZAXgajLs83siNRqz75zCHzW4aykdHd14P39Q0At+uMkGy4Aewz4c=@vger.kernel.org
X-Gm-Message-State: AFuF++nTGIQYOtw2cUogXfA7PkcXfRqBr19Ie9Hjk9VtL37EYUHF8aoG
	bViEg7Q/G5bPzGpkHJ9uyweGtyz/Ixg5RMYWgp/RzFA77fQeJCp3n7TGVAHyDFpD+IKhoiAeojD
	mzNyBU1n22Y4zDJs/orVw/DfBl62ZbzqwQDDa+zFU
X-Gm-Gg: AYBFou02hYLejsHiWQcGiGV3cgDyW3kR3Zis6ilDZ7fR3LqHGRBLP4HVo4+mjVHlFkB
	+cX0/86TbM1IKgjB0dj76LV3COtDeVtRi+eGgTcR819Scnp3pyVPOZlwXwy4MCmlqNTLET8Lbmo
	u8pCLTMyTk6ZY2AZmsAj6mHi/t0FXtnxXtGILvoO65OAgtA9sqOHO0o/mPsyCUjG0+/7Un2m6cI
	rxQY27SlbAbbDopiqc2TcnOgRVu6PNNtLgX+It87ojtmmRCtPzN2PZ3QeFJ7gGz3MNZNTA9Blgd
	tD5Esa5IEWG4k1OqVPi8JOoYxtkoQ0PJ6KFc/+c32o/rbp7mt09XGk8k/TdcyTnkqnIjGVyYPlM
	eNJLXi+5dO/o9FQfqtAW5Dkwebny07jDQhc+e6+8nYEqqVqzlrL+ukNHOi99OeUwpWbzUBg==
X-Received: by 2002:a5d:59c9:0:b0:488:8232:d16e with SMTP id
 ffacd0b85a97d-4888232d398mr4215448f8f.45.1790373203169; Fri, 25 Sep 2026
 14:53:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
In-Reply-To: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 25 Sep 2026 14:53:11 -0700
X-Gm-Features: AclHuK_Ft21uXDV_iMRtDzCCVqU8DQdapOlwM8X7gfzinGS8ws8kiw9mFw7TZZY
Message-ID: <CAKwvOdmuvn0LZkYEsH84hnOGTYhTtzuWs3wMARtWdTeL6dD9sA@mail.gmail.com>
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 2:46=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After a recent change in LLVM [1], builds with the random vDSO
> implementation, such as PowerPC and RISC-V, fail when checking the vDSO:
>
>   arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not sup=
ported
>   arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not support=
ed
>
> memset() is now generated when zeroing params->reserved for some builds
> because LLVM has an optimization (now run in more instances) that can
> recognize at compile time when it is assigning a static value to a
> contiguous area of memory and turn that into a call to memset(). Both
> clang and GCC assume memset() is always available [2].
>
> clang provides a builtin, __builtin_memset_inline [3][4], that can be
> used to ensure an external function call is not generated when zeroing
> this memory. Use it when it is available.
>
> While GCC has no issues with the current code, it has generated memset()
> before, as seen in commit b7bad082e113 ("random: vDSO: avoid call to out
> of line memset()"). GCC 14 provides '-finline-stringops=3Dmemset' [5][6]
> with a similar guarantee to the clang builtin, so use it and
> __builtin_memset() when available.
>
> If no option is available, provide a simple memset_inline() like the one
> from lib/string.c to avoid adding an ugly ifdef.
>
> Link: https://github.com/llvm/llvm-project/commit/90cebef1411617fc3eedd35=
9bdf00cb44b1c2439 [1]
> Link: https://gcc.gnu.org/onlinedocs/gcc-16.2.0/gcc/Standards.html#index-=
ffreestanding [2]
> Link: https://github.com/llvm/llvm-project/commit/38637ee477541370a90b37f=
149069d8e5c0c2efd [3]
> Link: https://clang.llvm.org/docs/LanguageExtensions.html#guaranteed-inli=
ned-memset [4]
> Link: https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1ff6d9f7428b066=
8cd8ab0b3e3ab94f1d733124d [5]
> Link: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-finl=
ine-stringops [6]
> Suggested-by: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Changes in v2:
> - Switch approach entirely (Jason, Nick)
>   - clang: use __builtin_memset_inline() to avoid external call
>   - GCC 14+: use __builtin_memset + -finline-stringops=3Dmemset (hence th=
e
>     massive CC list increase)
>   - GCC < 14: no issues currently but avoid ifdef with simple memset
>     implementation
> - Link to v1: https://patch.msgid.link/20260916-vdso-getrandom-avoid-mems=
et-llvm-24-v1-1-80a92f2e225a@kernel.org
> ---
>  arch/arm64/kernel/vdso/Makefile     |  2 +-
>  arch/loongarch/vdso/Makefile        |  1 +
>  arch/powerpc/kernel/vdso/Makefile   |  1 +
>  arch/riscv/kernel/vdso/Makefile     |  1 +
>  arch/s390/kernel/vdso/Makefile      |  1 +
>  arch/x86/entry/vdso/vdso64/Makefile |  2 +-
>  init/Kconfig                        |  7 +++++++
>  lib/vdso/getrandom.c                | 19 +++++++++++++++++--
>  8 files changed, 30 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Mak=
efile
> index 7dec05dd33b7..f6619e1cb2ce 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -41,7 +41,7 @@ CC_FLAGS_REMOVE_VDSO :=3D $(CC_FLAGS_FTRACE) -Os $(CC_F=
LAGS_SCS) \
>                         $(CC_FLAGS_LTO) $(CC_FLAGS_CFI) \
>                         -Wmissing-prototypes -Wmissing-declarations
>
> -CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables
> +CC_FLAGS_ADD_VDSO :=3D -O2 -mcmodel=3Dtiny -fasynchronous-unwind-tables =
$(CONFIG_CC_OPT_INLINE_MEMSET)
>
>  CFLAGS_REMOVE_vgettimeofday.o =3D $(CC_FLAGS_REMOVE_VDSO)
>  CFLAGS_REMOVE_vgetrandom.o =3D $(CC_FLAGS_REMOVE_VDSO)
> diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
> index 9c9181bb4071..0b84892d084b 100644
> --- a/arch/loongarch/vdso/Makefile
> +++ b/arch/loongarch/vdso/Makefile
> @@ -16,6 +16,7 @@ ccflags-vdso :=3D \
>         $(filter -m64,$(KBUILD_CFLAGS)) \
>         $(filter -march=3D%,$(KBUILD_CFLAGS)) \
>         $(filter -m%-float,$(KBUILD_CFLAGS)) \
> +       $(CONFIG_CC_OPT_INLINE_MEMSET) \
>         $(CLANG_FLAGS) \
>         -D__VDSO__
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso=
/Makefile
> index 368759f81708..0d1a49529885 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -43,6 +43,7 @@ ccflags-y :=3D -fno-common -fno-builtin -DBUILD_VDSO
>  ccflags-y +=3D $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  ccflags-y +=3D $(call cc-option, -fno-stack-protector)
>  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
> +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ccflags-y +=3D -ffreestanding -fasynchronous-unwind-tables
>  ccflags-remove-y :=3D $(CC_FLAGS_FTRACE)
>  ldflags-y :=3D -Wl,--hash-style=3Dboth -nostdlib -shared -z noexecstack =
$(CLANG_FLAGS)
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Mak=
efile
> index 8dbf2532a573..c023046a3fd7 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -36,6 +36,7 @@ endif
>  ccflags-y :=3D -fno-stack-protector
>  ccflags-y +=3D -DDISABLE_BRANCH_PROFILING
>  ccflags-y +=3D -fno-builtin
> +ccflags-y +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ccflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
>  ccflags-y +=3D $(CFI_FULL)
>  asflags-y +=3D $(KBUILD_BASE_ISA)$(CFI_MARCH)
> diff --git a/arch/s390/kernel/vdso/Makefile b/arch/s390/kernel/vdso/Makef=
ile
> index 35c834b895ec..54bcf2984ca1 100644
> --- a/arch/s390/kernel/vdso/Makefile
> +++ b/arch/s390/kernel/vdso/Makefile
> @@ -29,6 +29,7 @@ KBUILD_CFLAGS_VDSO :=3D $(filter-out -munaligned-symbol=
s,$(KBUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO :=3D $(filter-out -fno-asynchronous-unwind-tables,$(K=
BUILD_CFLAGS_VDSO))
>  KBUILD_CFLAGS_VDSO +=3D -fPIC -fno-common -fno-builtin -fasynchronous-un=
wind-tables
>  KBUILD_CFLAGS_VDSO +=3D -fno-stack-protector $(DISABLE_KSTACK_ERASE)
> +KBUILD_CFLAGS_VDSO +=3D $(CONFIG_CC_OPT_INLINE_MEMSET)
>  ldflags-y :=3D -shared -soname=3Dlinux-vdso.so.1 \
>              --hash-style=3Dboth --build-id=3Dsha1 \
>              $(call ld-option, --eh-frame-hdr) -T
> diff --git a/arch/x86/entry/vdso/vdso64/Makefile b/arch/x86/entry/vdso/vd=
so64/Makefile
> index 7c0790065b5e..c2353a065279 100644
> --- a/arch/x86/entry/vdso/vdso64/Makefile
> +++ b/arch/x86/entry/vdso/vdso64/Makefile
> @@ -14,7 +14,7 @@ vobjs-$(CONFIG_X86_SGX)                       +=3D vsgx=
.o
>  vobjs-$(CONFIG_FUTEX_ROBUST_UNLOCK)    +=3D vfutex.o
>
>  # Compilation flags
> -flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmodel=
=3Dsmall
> +flags-y                                :=3D -DBUILD_VDSO64 -m64 -mcmodel=
=3Dsmall $(CONFIG_CC_OPT_INLINE_MEMSET)
>
>  # The location of this include matters!
>  include $(src)/../common/Makefile.include
> diff --git a/init/Kconfig b/init/Kconfig
> index 8583d9f06c52..ff3f8475dd2f 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -173,6 +173,13 @@ config CC_HAS_ALLOC_TOKEN
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>         def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring=
__)) =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>
> +config CC_HAS_OPT_INLINE_MEMSET
> +       def_bool $(cc-option,-finline-stringops=3Dmemset)
> +
> +config CC_OPT_INLINE_MEMSET
> +       string
> +       default "-finline-stringops=3Dmemset" if CC_HAS_OPT_INLINE_MEMSET
> +
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>         # ld.lld prior to 21.0.0 did not support KEEP within an overlay d=
escription
>         # https://github.com/llvm/llvm-project/pull/130661
> diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
> index 2851afa9154f..f5cad5641985 100644
> --- a/lib/vdso/getrandom.c
> +++ b/lib/vdso/getrandom.c
> @@ -29,6 +29,22 @@
>         }                                                                =
       \
>  } while (0)
>
> +#if __has_builtin(__builtin_memset_inline)
> +#define memset_inline(dst, value, size) __builtin_memset_inline(dst, val=
ue, size)
> +#elif IS_ENABLED(CONFIG_CC_HAS_OPT_INLINE_MEMSET)
> +#define memset_inline(dst, value, size) __builtin_memset(dst, value, siz=
e)
> +#else
> +static inline void *memset_inline(void *dst, int value, size_t size)
> +{
> +       char *d =3D dst;
> +
> +       while (size--)
> +               *d++ =3D value;
> +
> +       return d;
> +}
> +#endif

Does this work?
https://godbolt.org/z/Tx6EaGMfb

(Sorry, I _should_ have replied to Jason on V1. I'm not ignoring him,
just way behind on my code reviews. Sorry!)

> +
>  static void memcpy_and_zero_src(void *dst, void *src, size_t len)
>  {
>         if (IS_ENABLED(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)) {
> @@ -83,8 +99,7 @@ __cvdso_getrandom_data(const struct vdso_rng_data *rng_=
info, void *buffer, size_
>                 params->size_of_opaque_state =3D sizeof(*state);
>                 params->mmap_prot =3D PROT_READ | PROT_WRITE;
>                 params->mmap_flags =3D MAP_DROPPABLE | MAP_ANONYMOUS;
> -               for (size_t i =3D 0; i < ARRAY_SIZE(params->reserved); ++=
i)
> -                       params->reserved[i] =3D 0;
> +               memset_inline(params->reserved, 0, sizeof(params->reserve=
d));
>                 return 0;
>         }
>
>
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260916-vdso-getrandom-avoid-memset-llvm-24-74d45fa6031e
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
