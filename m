Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C247254D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932866; cv=pass; b=XtOyhvYAgn3I/6uiy3dGkGW/Tb/JN5lpERwePYOdTjWKnD2nNXPvZy8ZZXR83261f7sg/yRpMBcK7HyarUTXt/qnwm8cLFFYS5cXfYJl4n+XjUQQBf6EOeL0ZZG6Obz8WNK66gG77zHHVLXiKcPJGxyln7SqO/XS7DctoPem/Hw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932866; c=relaxed/simple;
	bh=FaITS26oz/45scjuH+qUFbKIscIfmPulC2WxU6MKA/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onrX25Ck/IitrAeXnZSLVl7N0BTXs+F2ADf8LLCPXpaJuSKkd+H/o06i0Ew3qLKkxsZJf/VgK9KyNBPzkr29NvkPGvjHwCVZhkJm/vCpklB0EDMr/Svaps1PUT0eidfmSpPprV+fsodTQd4PEYeP/5aa6xzd95mo2qwJEXZQqa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhAX9m92; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhAX9m92"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a9270162ccso4129331fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:21:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790932862; cv=none;
        d=google.com; s=arc-20260327;
        b=aLEysudeo4ug0gmFo95rX+DGn3fOBxZBkUBKdQ5b4na8geqwSXs8mkl4lRZRV3oE7+
         Ctw5WdRMOShiD2LqyCAiH/pgM9iNH4pL7MjPpl1EDYLKRKTpJuh1p0tjdEuYlA9g1oCQ
         kuzXEjcOoY48Wj7qRztZ9h5+iW4BxXWaIXsKzfk/qRSxEomwXGYJ4SX/0uPuoJWFUrbx
         nO1y16WUd4dX539KESpyAHkBs/NLg+ymn3B+P0/xBtdhqBzqbekxEKqAmaByVW8R7Ryc
         d4SRvHHLhpdW6W9aUy+4tNzOpl7c+2S67FUYJdK1b97rGQHQh9k2sQOn6cwVa9EbX8+l
         vLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G9IH4xCk3rRrdFUwhINkNKuHQIlz8TtHoguzQyTiq58=;
        fh=/vW4boshxmZrW8BvBw2X2O/f8rZgJjaf92sOqD7iKIg=;
        b=cw5s/w+7qDdh9ogeQoBoz3cr0Oe4ghSelvXGn/oPPK/0atM8mW9DlxjS2ijhScB7UF
         2JPj7SO0QKYWnjU6qy3DfsUgTbBtua5bHhAoOcmkm6+NPPCQlBbVWkyyNUQ1SnQGVyRt
         HOg/IxXXP26CuZMqZTOa/FAL65gE+Zd38GMjYYMX4suUfDdBI9fzEyp0q7UqE/VO/94l
         Zg+zaqv0lBY/VYdSKlobZSqj3TvP6VBDLS+HBl3hGK+hU3DN1bT6qoCYYhe0I+sAz4U8
         DMMMs80w+VzPtidBpDmDFDDaeXcXK7zTOdlY6mUZUVGhEUCeLgZfgsG3RL4FmybRzqqC
         gJWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790932862; x=1791537662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G9IH4xCk3rRrdFUwhINkNKuHQIlz8TtHoguzQyTiq58=;
        b=JhAX9m92f1voFvn0/aTpt19v/bWXj45AJCMKhFa5cDnSDBl7r3AMWGx8ntuNtpDpJF
         Fec13wCJcwMkj4ImSROPlhulZMa/ZLANGkIZxQnEB6quODMK1nx1BF5fYK04R9WShXbh
         nMiAMculLoLzo6ZYdspVV8i0Ls4B/Z7y8w+hmDb3bTjpTd3OU+xcYPc6jHtjhT0o281p
         O4k1NMwmTq5qlqW5bYEyDG3Cv1fUvzz/fLT7sCYDUQGuIYpQUeRkC842U5XZMmev/sKQ
         izpxiUFePNnb9Ak2bCPNA2OXcefkhmxgzSuYPN4ZDHQx4s2ThzXipDWvViJo2ti0ZprK
         pp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932862; x=1791537662;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9IH4xCk3rRrdFUwhINkNKuHQIlz8TtHoguzQyTiq58=;
        b=sPDzg0IBV+qCiiQ+f20YVkrgNb3VjbXIcAt+mD90tYPAXlbN5HrdQOpMfuckTx4gad
         NM/dI3ZOLt2MWHIBDRyh3gMHpsIlEL9DXyhaVB4AU9Uj5Pr/JBFlk22h2zqE6B48vF1y
         6GiofutiHZ/kpUBOLzBHvTvxHXj/V4FCkxZSV2JyFhbCMBzpS8W+7VFQ11brV2H2oKph
         Prn8/V0C1dIde5Glml9eng/uUa/E2zQdp5qoRCVSi2iUMA2MIQYRWh08f6S7ujUBZtCF
         e+HTJdbPlhXexRvcKa5qWyXo0VLRw2rL8Ui/n571SRG83Oe5EHSNXwy5ii0Tv6cK+qB6
         b8Rg==
X-Gm-Message-State: AFq9FYIVYgj2CitJXK7RvxEEGflix90gCnrWzTMlr4cHrwecU3wMD6u9
	8NcqsxAL1F6r9kVWiGYcZ+VnzvmMG7GXSFVWyoEfHnE9ODE/dJfve922vf+Rt5FgsXNZU/wyz18
	xLK6l+SXR/WSXleu+KryaI1OvpcbtYOs=
X-Gm-Gg: AYBFou3iRXBQGatKDbHIKEXOv1Bxfl0nzaJOxpQjpukT5QQuYjS4VGP/1M5VYSfAAsx
	tqi2LTWMhA+hrJOQvRMgHOIVOvI8b2u7jPu7hIvjrJ/bi5TS/hWigNMIK27JDGlfv4/ib3tKd76
	7ctsdV9ov6UfhmK18X70EQ1SAdIx9WdA6LHbnFgtBCLM4WYmL5782yhyA0uTB3fBqBgHsWCn5W5
	kR3veCR57XCaJeCPCQpVTvulbfVGabXYUfJLlT9Jx5zcVMKxlQkdTKmyEfnbqhdeGk2eL34D+9w
	qNIgK8MuSsn8RXOZoVX4HtEKVl1GtDTYisqITziEyJN7E6N/vxWplTy7NJTGlUkjeKdwaN4KiVN
	eZEuuW5+WtObOH4hH5mtF7UR6ZKtBxnSSgsA2xe5mg7TM
X-Received: by 2002:a2e:a987:0:b0:3a6:6efb:a0e3 with SMTP id
 38308e7fff4ca-3a8877e6a71mr5199941fa.5.1790932861897; Fri, 02 Oct 2026
 02:21:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001201952.ACC7B6D6@davehans-spike.ostc.intel.com>
In-Reply-To: <20261001201952.ACC7B6D6@davehans-spike.ostc.intel.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNQVJJRS1KT1NFUEg=?= <fredericmariejoseph@gmail.com>
Date: Fri, 2 Oct 2026 11:20:50 +0200
X-Gm-Features: AclHuK9uHJkFeDKOy-SxfwtE3eqik_flT5GZMoQN-KF-Eb2eJ97kfjdOk2XyKfo
Message-ID: <CAHD2OOc5-Hd6fLp_idt8X3hH-vKnQsRPV1j=zv8JZ9NRAuijAw@mail.gmail.com>
Subject: Re: [RFC][PATCH] x86/mm: Disconnect RWX module checking from execmem
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, Aaron Tomlin <atomlin@atomlin.com>, 
	Borislav Petkov <bp@alien8.de>, Daniel Gomez <da.gomez@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 10/1/26 13:19, Dave Hansen wrote:
> Link: https://lore.kernel.org/all/20261001-x86-fault-spurious-rw-v1-1-7fe=
1189b5efd@imperva.com/

Thanks for turning this into a patch. Not sure about the link.
It points to Hitesh Murali's spurious_kernel_fault_check() patch;
In case of typo this one is my report:
https://lore.kernel.org/lkml/CAHD2OOfP=3Dh=3DqS6nP4dtn7RTQqMEqOvXD+iURXJ7Rg=
c5KFjgi5A@mail.gmail.com/

Regards,
Frederic


Le jeu. 1 oct. 2026 =C3=A0 22:19, Dave Hansen <dave.hansen@linux.intel.com>=
 a =C3=A9crit :
>
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Fr=C3=A9d=C3=A9ric reported:
>
>         x86/mm: Checked W+X mappings: FAILED, 7 W+X pages found.
>
> errors on a build with modules disabled. There are some build
> dependencies in play:
>
>  * ARCH_HAS_EXECMEM_ROX depends on STRICT_MODULE_RWX
>  * STRICT_MODULE_RWX depends on MODULES
>  * execmem_restore_rox() is a stub without ARCH_HAS_EXECMEM_ROX=3Dy
>
> execmem_restore_rox() is what the x86 "ITS" code uses to zap its
> W+X mappings during early boot. The error message comes from
> CONFIG_DEBUG_WX which is independent from any of the other options.
>
> But the nutty part is that there is any connection at all between
> ARCH_HAS_EXECMEM_ROX and STRICT_MODULE_RWX.
>
> Restore a functional execmem_restore_rox() to all 64-bit builds by
> eliminating the STRICT_MODULE_RWX dependency.
>
> Then, turn our attention to execmem. 47410d839fcd "x86/Kconfig: only
> enable ROX cache...") was trying to make module memory access more
> permissive unless STRICT_MODULE_RWX is in play. For execmem, never
> consider module memory to be ROX except under STRICT_MODULE_RWX.
>
> This seems to fix Fr=C3=A9d=C3=A9ric's issue, but I'm a bit worried that =
it
> has other implications in the execmem code. For instance, the
> module_enable_text_rox() loop is now rather weird mem->is_rox is
> now directly dependent on STRICT_MODULE_RWX.
>
> Mike, do you see anything bad happening on the execmem side if we
> do this?
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Tested-by: Frederic MARIE-JOSEPH <fredericmariejoseph@gmail.com>
> Reported-by: Frederic MARIE-JOSEPH <fredericmariejoseph@gmail.com>
> Link: https://lore.kernel.org/all/20261001-x86-fault-spurious-rw-v1-1-7fe=
1189b5efd@imperva.com/
> Fixes: a82b26451de1 ("x86/its: explicitly manage permissions for ITS page=
s")
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: x86@kernel.org
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Aaron Tomlin <atomlin@atomlin.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-modules@vger.kernel.org
> ---
>
>  b/arch/x86/Kconfig     |    2 +-
>  b/kernel/module/main.c |    3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff -puN arch/x86/Kconfig~x86-STRICT_MODULE_RWX arch/x86/Kconfig
> --- a/arch/x86/Kconfig~x86-STRICT_MODULE_RWX    2026-10-01 07:11:50.44359=
5828 -0700
> +++ b/arch/x86/Kconfig  2026-10-01 07:11:50.454595751 -0700
> @@ -85,7 +85,7 @@ config X86
>         select ARCH_HAS_DMA_OPS                 if GART_IOMMU || XEN
>         select ARCH_HAS_EARLY_DEBUG             if KGDB
>         select ARCH_HAS_ELF_RANDOMIZE
> -       select ARCH_HAS_EXECMEM_ROX             if X86_64 && STRICT_MODUL=
E_RWX
> +       select ARCH_HAS_EXECMEM_ROX             if X86_64
>         select ARCH_HAS_FAST_MULTIPLIER
>         select ARCH_HAS_FORTIFY_SOURCE
>         select ARCH_HAS_GCOV_PROFILE_ALL
> diff -puN kernel/module/main.c~x86-STRICT_MODULE_RWX kernel/module/main.c
> --- a/kernel/module/main.c~x86-STRICT_MODULE_RWX        2026-10-01 07:11:=
50.449595786 -0700
> +++ b/kernel/module/main.c      2026-10-01 09:47:20.842360625 -0700
> @@ -1355,7 +1355,8 @@ static int module_memory_alloc(struct mo
>         if (!ptr)
>                 return -ENOMEM;
>
> -       mod->mem[type].is_rox =3D execmem_is_rox(execmem_type);
> +       if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +               mod->mem[type].is_rox =3D execmem_is_rox(execmem_type);
>
>         /*
>          * The pointer to these blocks of memory are stored on the module
> _
