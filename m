Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A94582BB3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790194533; cv=pass; b=dz3xRoKG1bOPMS6RS8kwQC9tjX0wPqMjNt78Ch3Zuz50eULjRX8jf3YUcMkrGnAtW9S/EBhitfX1Cqto92fRswEBUnexTw9+HeX8uYJ9sEeip7BmVYH1noBRu6ptV8uCTSohfy6lIa+B4c5LEYD2YCf66TekVnJ2PRPP1pHc7cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790194533; c=relaxed/simple;
	bh=AG+velq+P1x1sJHq2Eyj+yYuHBfJGE1bCcGBCBjr5A4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V20b42nJ+LPoZ1gTQ1sGUH22O9LzTLSp3t7CNoDkQISkVd6SZCrVyipmz+iAzjsf8aGWWUgBiEfmXhctBfJetblyRYHuFPt5p5nVX/RGLmuUtSHjUzbs4YRUIGwQf5rum/vn/Da7YfB7sckTXramAYRZ8/W5kAoSAzmh9kcNaJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n+WEfao5; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n+WEfao5"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so1106934f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790194526; cv=none;
        d=google.com; s=arc-20260327;
        b=euLHtUf2jRQ7zpyV7nEc2K1EfUFCIf11YGtV8ZEecwvALrKI9YC0yRwH6RtjUEez9g
         CCIN5cPuILkkTmFcmlictfNwFmh9Kd0m4MtvBjuTu30Co1hKNeoTv0yAPbCPeePFjqEe
         vlmiihjdFet1YWJ4HqiWBTZm5SXqhhSXay8ZozZljdfedyLfO6GuW/P2QB7CFuIwj/v7
         x5kATSxU0DiOHni0VGNh+wPuceKJRYlr3dDiEi4/UaPOqn6opN5p2+6m213MWwoBhUdR
         bzU8m6gKmGP1vPbLA1aHqecrYLMLyl+Q7f0HvjJpiKTLmQAl0FM5v7lP9OvToAj5zG2j
         b2Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        fh=YHHpf6YAXWdcgQcRJD3HtKdSZYCXorhpvbLquoCQAFc=;
        b=C4FO0qx19VQ39smqu4OLe42SogPlS04e8WcxFvszN53t24u2fdoX7IKOl5PtW/VzWS
         yvIBkFyn5tv68iVrQX3QyhpMsZHOnYzXVvD4iOsSxHgNOZqXmnhSyoJEFAehEbPcJI57
         +E5sJft/FegvZOWUtH1rESUFX1/8YvgN+vFhLWAvYUr3HitE8fCaXjlVw2Lfox16Syhl
         IbNpJjTBJTueBkYkwov5VctJPkOvBJjMmGtTsLvMsJaGGNds1MxMcrsajC7Ocer5iBf4
         IVIsLOndKm0y+90xzEpK13ngmValyuvM4vWClBKoJ3/U+P/SJsd5MgZrfLm2HE1hcJAH
         P0nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790194526; x=1790799326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=n+WEfao5P/6A0L77Syn7fH0Vim/5CSlg0pYLAbSFzH1//7tDD9D/BeEd3Rb0VAPv76
         YtRbfWB/XHTEokC2HJC/zSjZdxwdCVHiaw+M3PKD6HPn/ofbo+xffA1xgnWKSm8E8FFm
         G7cuDW78UFof42Dvof0D/hLdt0ZPexYmaYbrT4/WJ3ASJAfBC1Fd4YgJIA4SWIx0A446
         nXk2KhTM64a4kPQxvE1l4/RQaOV+Eix7ZenidKmFT0BeZ2XsuayE0I5mfoaJ9gFJxg8L
         FhlJP+/Fin93pSOt/uyrFWqeGo29d4WokcWgUnfi3rc3a0NVYSbkZCAP2ysDoP0jTeAj
         U4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194526; x=1790799326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kOoYO2x0ceYQoltgnReOSIDMz30qflbKcG3KVK6oiAM=;
        b=W+/VaMhPlx3mVlRoKDRRKCrXTAF+WEfSLcAi7b0cAEp1yTFRy9e7629pjeQ4o03pgs
         sl2f69AZrAXZu6OF+/THr3jcjpJzbW42EY+3Z7mlGnV1RlfwqPrvBJvu5YWfh0or9Okk
         V22cynlvF0rihqEg1l3wIdBktsfAkFqH/AaSA8A7qFERAKgXQ6ZaWR1ilUJ8vQ+eyYJE
         +AwIpiulU+3KHk/ZDGKngYhZ8eXklWFe7nJTB26N3uqfbjdvlBcnmzCmOWyLjrWQ9nd8
         n/nm+fRGdJ0xEHpJD1ycGuV9goWQlpbDVgag0qTuJ6WrxhSLU/i9KGpy8xZeI+lJqbCd
         lmAg==
X-Gm-Message-State: AFuF++ncHvwvf/wGi7mot3491vQCJjD5SD5V9M05bZ+4t5qs/zdWQ0H/
	00yNHRNE/8byC4mt93R58kSMwImwJiqIJY4NNCWKptddEbOStgyNYc+iCznnegnZp9Nl4qHJZPe
	v6kxLzwOqpYMw9r9+wzlZfXEX2hgoW2j3wTzBhF0K
X-Gm-Gg: AYBFou2f0EPRgLJo6qQVZNyhOAahdRaNdgn+1gGMyeLFxZtIldBRhSCy3hr3yXKCUNA
	R4Wde33RSmDexJfv9eJ4122km7xmf46S0achXJcDTEGyGqstzcy9Z0COhz/m3BY/zOdZq3GqpI5
	OOF2owinNR4fTko9JIZEkWWMlvmRp1K9wnDgAHezQLFzuNgqoZrtS/szjZCdj0C+wdJw2pM+lI+
	ZUmeWBnPWxBcDGbaVnnUWNcmcxV3SQOdZCV8YW5/zTflHi/ZWQIlnpSblDNzadkciW0SVJaCXqg
	v65yWc6MHNAniDEm9FQ9d0rYyiBrma9fBmFZuOv4hBJvFC40g5s1t+DZkYgEj02qgknn4+OD76o
	/m5qvVLHjdgeDhhb8dvptiQrlG1UTtZnkv//ZPVsGDKCGDtNE2mjPIZrumIYVlh/kEgq3n8FcTd
	B7jw==
X-Received: by 2002:a05:6000:2383:b0:485:ad55:208d with SMTP id
 ffacd0b85a97d-488716c8d48mr511088f8f.18.1790194525443; Wed, 23 Sep 2026
 13:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911084211.3149957-1-jgross@suse.com> <20260923193619.1408940-1-shreshth.srivastava@intel.com>
In-Reply-To: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 23 Sep 2026 13:15:14 -0700
X-Gm-Features: AclHuK-BmScte-vitIZ7FKAidjIiegIYr2tRDSSJKsz3-ZO8Fal-vgtzUYiiixY
Message-ID: <CAKwvOdnKS+E9R3QaFk98dPNNh7uW=8yuJpYWGPHbY7k40Fk=rw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
To: Shreshth Srivastava <shreshth.srivastava@intel.com>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, llvm@lists.linux.dev, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	xin@zytor.com, nathan@kernel.org, jpoimboe@kernel.org, peterz@infradead.org, 
	boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 12:36=E2=80=AFPM Shreshth Srivastava
<shreshth.srivastava@intel.com> wrote:
>
> On 11.09.26 10:41, Juergen Gross wrote:
> > When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> > infrastructure will always use functions for reading or writing MSRs,
> > even when running on bare metal.
>
> Hi Juergen,
>
> This doesn't build with CONFIG_PARAVIRT_XXL=3Dy. 16/17 and 17/17 are wher=
e
> it breaks, but the cause is the .byte fallbacks: ASM_WRMSRNS_IMM from
> 08/17 and ASM_RDMSR_IMM from 10/17 don't end in a separator, unlike the
> .insn variants above them.
>
>   #define ASM_RDMSR_IMM                         \
>         " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
>
> That worked while they were only ever the last argument of an
> ALTERNATIVE(), which appends its own newline. 16/17 concatenates them
> with ASM_CLRERR:
>
>         ASM_RDMSR_IMM ASM_CLRERR, X86_FEATURE_MSR_IMM,  \
>
> so the .long operand runs into the xor. From
> make arch/x86/kernel/cpu/common.s:
>
>         .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long 266xor %rdx,%rdx
>
>   paravirt-msr.h:165: Error: junk at end of line, first unrecognized char=
acter is `x'
>
> clang reports "error: unexpected token" in the same place. 71 objects
> fail, the same 71 either way, no vmlinux.
>
> msr.h chooses between the .insn form and the .byte fallback with:
>
>         #if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >=3D 24100
>
> Two kinds of toolchain end up on the .byte side of that test:
>
>   - GNU as older than 2.41. RHEL 9 and CentOS Stream 9 ship 2.35, and
>     Documentation/process/changes.rst sets the minimum at 2.30, so this
>     is a supported configuration rather than an old outlier.
>   - clang, any version. CONFIG_AS_IS_GNU is never set for clang, so the
>     && short-circuits and the version comparison is never reached. Your
>     08/17 comment already notes that clang has no .insn support.

Indeed, looks like we're missing support for .insn for x86.
Filed https://github.com/llvm/llvm-project/issues/225916.
(Please do file bugs against the toolchain when you encounter issues
like this, and cc someone from kernel development).

>
> gcc with binutils 2.41 or newer takes the .insn path, where both macros
> do end in a separator, and is unaffected.
>
> Reproduced on v7.3-rc2 with your v3 00/13, v2 0/5 and v5 00/17 applied in
> that order, x86_64 defconfig plus HYPERVISOR_GUEST, PARAVIRT, XEN and
> XEN_PV. gcc 11.5.0 with GNU as 2.35.2, and clang 21.1.7.
>
> Terminating both fallbacks fixes it, and both toolchains then build
> vmlinux with no errors or warnings:
>
> diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
> index eba325ecfe4c..529c13553c63 100644
> --- a/arch/x86/include/asm/msr.h
> +++ b/arch/x86/include/asm/msr.h
> @@ -78,9 +78,9 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int=
 failed) {}
>   * form MSR access instructions reference %rax as the register operand.
>   */
>  #define ASM_RDMSR_IMM                          \
> -       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
>  #define ASM_WRMSRNS_IMM                                \
> -       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
> +       " .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
>  #endif
>
>  #define RDMSR_AND_SAVE_RESULT                  \
>
> ASM_WRMSRNS needs no change, _ASM_BYTES() already emits a semicolon.
>
> The WRMSRNS line belongs in 08/17 and the RDMSR line in 10/17.
>
> Thanks,
> Shreshth



--=20
Thanks,
~Nick Desaulniers
