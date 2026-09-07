Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FCB17557E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756162; cv=pass; b=s9DEIzitxeAr9kKIqZlGx+3mHvS/NySOF+Dra8LpTsDpUqvb6rq9k2J+BHoWEcK/PgpHK4JsRgz5vFRz1XhB84WCzl1HwiTItKLlJixUJ+NJo0SwafYu3mNl9o8S6WyHfOB41rrL0fjMV4lZhvGJB4CmR4ldTjKDyzqXiBeNvQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756162; c=relaxed/simple;
	bh=5b15TWitPaTKveFATERpTvz5aWJPuBSMBQiiYbwQeSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFhrLcNOhp3mUQtLo+mVIow5zEmdke7D0xBZToXeP5MdyGiYfQhiJR4gorJrn5XD4QW/Pef4QQq+jk8IOJjLsZKS76j5rk48lZqPzeWV8KgW7jCSsb7dhRcJpdC/UzPdvJhFYKzpDx7RaPuUK3Hd7bjErEpJHPYHTwV6si1l3qM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fRqGcE3p; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fRqGcE3p"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so32001541fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:42:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788756158; cv=none;
        d=google.com; s=arc-20260327;
        b=mHB4WG21co8WpkXGRgMG/wHkDPflfLm2YYiZH+p+/1g1f7Y7cHm65aNLvxUDrkzJF1
         ZUJQc+ZND7ugZulSZ/mtdIhr4RWehdtKESjpWpeqtc7EBqhzI3iWzUE6g9udrJJPuzGh
         OZ5GytCNWyiRHfls86KBHON5Y0r9sHsojcrUyE9tjgcrK4eliCj8sz3IeJVd/0krS2ax
         u9TjB/NKTYRNm8DOROd47wZnVcp4jwiZY74ckp6te7olrnCDxl5aCAEuykI/6Pha7bYl
         fXhzWLM/qdFsGPHoo+F4qc8ZcVZEroKahNlF308dGcEpg0YZvaebBDpWgXFxgROj3YyQ
         RZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CSusZvCrdCFZf7SPpy0xHMhy2Jts9A1KvNNSnOpLMr4=;
        fh=jIodrbJDBWOcpLzNzvp/wKO0YnSkRAEm1VNCu/DJzw0=;
        b=D3InrhXPwfRj6cvGTfvGZ6iZtSb5SWBCL++Rme6Il2X8H5MRbSoqfPSKgteZ5iBmfD
         TkPMljJfkrQ3KBMr+zmcib1frNipKsCvoHG152vbSfUxIoLRcbN1j3J5YF6K8+NJ1XmQ
         TWDEm2an2X8pmNsGAbqYUNOxLlbblloAIFJV5Xjeva6JtGCxoD8VO+Za71CRxZ96XOxj
         legUYpnoGbE1Y5fMjIHuRQgFBvf9SiTjUmoq5xNU4szpHdYX7a7FIeXlBpcUplE8mQlU
         efVkYY6z2IGy48RMTkHg5snK/CQSixKc3YU/P1BAcu7R33iIIxRCFWyrxyDf4iFRRmpt
         H2Og==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788756158; x=1789360958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CSusZvCrdCFZf7SPpy0xHMhy2Jts9A1KvNNSnOpLMr4=;
        b=fRqGcE3pBtBkkgLpM+oU3FLDxnjlqlK1zzEgTCEt1uhmt/i6zCnVJI9pNaHsxti64r
         bnjEd5r9Ygu7fvD3JF0C6c287+He7C8HkVeVvknO5swU/6N+VH6sSNm83D+fs+uPOHHd
         Qip7NaqMIcitIrwYaou4rSYmO42OvVHHoPaX9Ues9MiJOXVKmfndNbWCKozII8KQvqEa
         cPlvrgg/Rw3a+tNAntmPNWWupWQhnYjdXcwk64y0OcmDQmozYLIpLwpop6mkKn7KWtCW
         WTFtRM5tl8QA1czyzBJrupbLouDXSC6cPYkUZRRFRCOLbzTSnM7RxfxB8WnGJZACC/uR
         i3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788756158; x=1789360958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CSusZvCrdCFZf7SPpy0xHMhy2Jts9A1KvNNSnOpLMr4=;
        b=HBeJPgtTw9U4CeqTfxpDMlzzi0rA60hmu5To/ESgkOjbauSCmoIOY80BbtPIdBouhX
         yojBtzzJpdeICHe+8dgP8smxTq7h3ZlUk4RtCj+2ZaVHNcK/yLpJBDRViz1jZ6RDPncI
         x2JcaQahZdzVF28zTyjErNHOBX1oHBN26IlOSB6ma3m3C40lV7oCZ7qED5uVaxhRh9FQ
         S/ARTLQ20uRazyMnQlYIlYz5C9DdKvHh4SyE3UVJnJJqxkIbWIdYpNFDhf2YH3Mz5Hdm
         uJArkqtxiEqxe3pBHEin/M0Oa5qQFkkFvxCt655S5+wXXPxcTQ5AkZZDa1ykyTKo5HKq
         E4kA==
X-Forwarded-Encrypted: i=1; AKwUvBzZIJlpFUF1AI6yIj9iMxEttVEMWVaOwwjkAjsc6znaUb6IYBWUR4HqAgEKkZq7mDNme5H47Q4L+T2ewrY=@vger.kernel.org
X-Gm-Message-State: AFuF++ly/t2cQyUkoA5YpV2o1qxpDByd34ZFSKesxaJJpLCF93ucDoHO
	C+FIwfBy5T3czV+j9a4nknj8srS0GfoV/a0Ib+s7xtqHwM6SKyr4NA8E7OHLldg0xIvXQtUqvtk
	9zq78jZ3GPHOFZ/I9WDpfo5FN7S4IurXsAuTtl9k=
X-Gm-Gg: AYBFou3rAi0cE4i3tR0M0UGYZhpWH+5162TbYjms6du8EIeZK60h5e2aNKGb/RGasiZ
	lpFAVxe3D9OUX0RguIeG+NMNLVVb1JBXJZDHbp9ADWkmlmvzIpqm/wP19T4wG+6X+4vgHNdiPib
	oGUkylqrNXJTY/9q9kDsYKSqE6R3/Vajgbr1vW5b65MLB9NRERMdprWlqU7d/iiDIXExwsKR8op
	U5g5yRXAJkZlboEHwmMxDSdzuKBNHGMGy8CFMLW13zGYwfpON/cvfzdd7SQ1/zIY7yAYe7M0Mvp
	JZg4mwcYlxUm7Z6ddyG8RUlJ1yWIim7rxk8HtIJ4Ao5FwJfAYtY5yWEfOSS6/evQfMBf6CnP3xB
	I6tylxZgtjth4WSAkrh/d5gQ395b8r8eWACmxTWp2LEAQsC/HCxOvleF+cFX0B61oIb95cs/XEb
	cGbE/GzEp023D9l/OZnQ==
X-Received: by 2002:a05:651c:19aa:b0:3a3:2550:d76a with SMTP id
 38308e7fff4ca-3a372ccb3b8mr19730511fa.6.1788756157976; Sun, 06 Sep 2026
 21:42:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906183942.103011-1-ubizjak@gmail.com> <fe6933ae-5684-4c5a-8c99-1d80f583a101@zytor.com>
In-Reply-To: <fe6933ae-5684-4c5a-8c99-1d80f583a101@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Mon, 7 Sep 2026 06:42:26 +0200
X-Gm-Features: AcwNN1XS9Uu5kgP_zPPBPSrB1_HqhtAiPlulYi7Y6meIu0LNK31JSJ_FQzHT9hQ
Message-ID: <CAFULd4ZU-Ui3QErP9NwEqpos2L9dX9B75cB+tm+kvdr0SpBScg@mail.gmail.com>
Subject: Re: [PATCH RESEND] x86/kexec: store segment registers directly to
 memory in crash_setup_regs()
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:33=E2=80=AFAM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> On 2026-09-06 11:39, Uros Bizjak wrote:
> > crash_setup_regs() currently moves segment registers (ss, cs, ds, es)
> > into pt_regs via a general purpose register (%eax). Update the code to
> > avoid the intermediate register and store segment registers directly
> > to their destination fields. This reduces the generated code from:
> >
>
> > diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.=
h
> > index 5cfb27f26583..ad7ef567452b 100644
> > --- a/arch/x86/include/asm/kexec.h
> > +++ b/arch/x86/include/asm/kexec.h
> > @@ -106,11 +106,11 @@ static inline void crash_setup_regs(struct pt_reg=
s *newregs,
> >               asm volatile("mov %%r14,%0" : "=3Dm"(newregs->r14));
> >               asm volatile("mov %%r15,%0" : "=3Dm"(newregs->r15));
> >  #endif
> > -             asm volatile("mov %%ss,%k0" : "=3Da"(newregs->ss));
> > -             asm volatile("mov %%cs,%k0" : "=3Da"(newregs->cs));
> > +             asm volatile("mov %%ss,%0" : "=3Dm"(newregs->ss));
> > +             asm volatile("mov %%cs,%0" : "=3Dm"(newregs->cs));
> >  #ifdef CONFIG_X86_32
> > -             asm volatile("mov %%ds,%k0" : "=3Da"(newregs->ds));
> > -             asm volatile("mov %%es,%k0" : "=3Da"(newregs->es));
> > +             asm volatile("mov %%ds,%0" : "=3Dm"(newregs->ds));
> > +             asm volatile("mov %%es,%0" : "=3Dm"(newregs->es));
> >  #endif
> >               asm volatile("pushf\n\t"
> >                            "pop %0" : "=3Dm"(newregs->flags));
>
> Why not use "=3Drm"? "=3Da" seems odd in the extreme.

"=3Drm" will produce assembly using an intermediate register due to GCC
PR124209 [1]. clang also has issues with "=3Drm", please see the
definition of ASM_OUTPUT_RM in compiler-clang.h. Using "=3Dm" will
always create optimal code on both compilers.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D124209

Uros.
