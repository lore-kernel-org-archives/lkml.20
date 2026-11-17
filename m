Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794879503;
	b=a/HF7MVcQl+ILOEeyLaj+HN5dWiuceV5Y8JHZJ2fxiAY6mIG34IfN8UJl3jRTcS38kMq
	 ixpESfkjOlsKINHLaw8XlnrsFzaWZ2Ykvj+JM6jkXEPT9ZRMfGT5WQdgOhmOc+Lbv20SI
	 bHLFiMMnbW9A5Bs9Ig6+/lryGiMpIhM+sAGXPZyG4z6/vcfcVY9mW1/G/zuEHk8lxLGVV
	 u6+OVaq0TENghHpQ1bUE6OWPKTcw7HWSalx6LIKlV7Yz+S/YW0j2MuCURKmYiRgLXIhXt
	 MGDVGaLhj2i73822uCbutN4lLfmFChjKwQgyXnaPy+ObXyI9KfMh6ji/igfG2GOAucg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
	b=v2w7D6E4UypqRWIwtkqlQZxwbbfThjAim5mgoVhpQb6NlmLvf1aoXT7+37PuCHJKal64
	 ieIv1xEbF38CL7MXFHuBXsS49chM6QbU9ycyqfuiGahgq3wejhcI0q37mY/2BCmYkvCCx
	 JIbOFo59BR4Aht5l3g7Jv+rKq72GAGnNmj8uaJHNU11pJtiLYLFeihP44FLnwDRynh2te
	 ck+nu7BrA3z4DjHHe5+nZb5A+auZH7sLsLCBs/iPMjOu8op3HukkJDGzwf0M8u8WjVJow
	 7kWCkdZOcXBOUqio9DD/+WPKv4YpaGJU+5Mqn0+5IKpt7jHsSvbVmSAW88qD+BfPyIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RhlOi8QW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58942606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58942606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=RhlOi8QW
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b85d0d0d52so358964a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794879501; cv=none;
        d=google.com; s=arc-20260327;
        b=EZiWadO+xvTurV9obnlGVmB0ZPgkJedA/bA81wpSsOUrs9lIqaynzV/MCtALk3V78x
         DNIljmffnxFfpLZQLQ03RynPv8O3hl5Rxuj3sPy8P64pr6n5eajit7QnQ0WV9URMP81o
         lAGJHGybAi5eZsSAvzSrkqfF7P+zWNnuw3xu6UdF7Ueu1G7wNcUJGgqQywFsidDesUeA
         Y1y1J9QhsmK2PeI6FV1OST4YjEz16bKHkYtAN4Wb9yNK7GsV3EXjDze3jNNT+LGdXrcF
         yMdrXmuZWtany+GncqQQidvTzOkOIKybkPIuRgLcxUSwxmeglvPxPf7sCtGU5hhVz0Ud
         sjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        fh=zmgixpmkjO6BLPop6bCyLW3RCI95wq9qCp01v/jne80=;
        b=fpSKNqvx9XwqqMMQ/CGaEqMjE1GigkF5i8Vnn7O8pjhoKVqrv02qZaHUMsCE/hDZyc
         45V2rzmgQo4IBwQwNIJ4JciTA6lmBICyRVZMmAiYX6AIIqhkVdvbRrw0VZfCzHn4GqJo
         Vtw6Atl53p3IrnUYthjL4kZUeJd8TRvWf1in9T2viRzWggJCQz0pC6BhTr4rDnd49+RZ
         Uro6HKrX4EHGnVJ0ywAykZf/Ha3Ffl71lXxrJgQr2pJ8umwbb+3S+Vl0ZBwgZTKOiiPj
         Ay//jqTScbitCGGUtDVCidgmr7pTFaVds8tRxKv7gq436BgdDkq6z2YqwNzugknQU+Oa
         FL9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794879501; x=1795484301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        b=RhlOi8QWyh21VjrO2LT0cD97QvORnYSXe/cGylc2+u3klSB8eeDrMsC5BYfdWkcpcB
         x8IDEJF1VaRAv7Oa9z0xFBuLqaIC0zUng5fKa+RbagHo6auFFQfyG7AMx1bM8CmunLnn
         RtM7rWsnPqHZtnicGNqUpmCWFVHn5Ai3LDNu9jtAqnL467LSxvFx51DpcyH0fT2S8GEL
         NTvjnpkmpHxGT6YyRZp2n0ZD6TRbKQerBJ5rMR/W3kMrmICRn+XZOxy62loGU0T5m/BX
         Y7jeZ++g6cSwf9pVx1ktaamLFA6oNGTwrpri5KtU1ofomqg4UGSsk9B9D0n0Au1UIIo1
         v3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794879501; x=1795484301;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWuVGtbUvc3uHiwRjOkpDlCbQglip6he3IdzYkVcH6c=;
        b=XxqX8TwHjtStHArUMMY8Y3kWhyhgk/k2ywTZp80DqZtU6X3uVHCQalLcpSotUAShhZ
         dbDCWvw+Mi/mE0h6vyk/2VTbQ06KZLBRO5q3ojnYgC8HrO/dMyE4pJJMCKGC1IJaiu9z
         ZR+qHKfVVS4To6OEVr9BFQkkWSWRq7dap2L5xRFp7KQNrNItjW9zXP06sB9bfJMiAizv
         j0biB7l/OKJXsnhYvkIyD/O4LbUCikoVxtkyQbuUb2o+s7wDo0J+V0iu5kzDutVaOyDj
         mNOnaRnZ7xVSwUkv8Dc4K8xAuK1ezmW3P1TvVZgxLQvmCyz0ftudGH+GKp54Xd8f8lRf
         odNQ==
X-Forwarded-Encrypted: i=1; AL+hErEb/wQgXBh8PWNeMy6oK77eKdYRh78pAaNQixKYaWnVI6t3sc6iRY2PG7Pir+C6iep/vIpQlCnNsxI9SOY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8I9PsRXvZnO6X0TYm88rd8E33NqCuvNbjeFKWoH/wRBneUO59a
	hd/86vLjxT/LzZWdhZeBrmZNsZ5HxPErpe7B1OlGissYajCIvuPjmyHEkNC0PA2u5SEyhWXhrI0
	tSNAu0JwrWsXKcHAZ/lc2FJQBJTpK28Wlev2IBVxoyA==
X-Gm-Gg: AYBFou2PUtJurjOYQQQPaonWqM/joyAMje0K1TJjaiaQxlIreQg73U0bqjM36u0TdYp
	pS72xi46MX+VNLs4fmxg+/a3Zhpz6O5dyVg5gmyGFRooRtSsvNFRCjsVCJki4WXLRaDsHxItV+T
	x3khQzElMvybysG5/Ef12/T2dTOle1AYD/+aetA7sRjmNqMJu5XDzu70mFaDhf6zTiAbI+GEbeC
	P1otlXEBGhfMwyljhq+WrmWdexZcRjM+dOIZ1tVzIq6EBMOFEWHWnxbVMdffmjW4NkbY96IpZnF
	zKAibiVcccTFZSEKfvHBPT/4PPnhib2+yGLXI0CczeidV1X10cDS4tKax5Ls95xhiQX6jNXMOzG
	T6GzjeVRz9ZLdOyuNxFaJZgWqLlaEV9Fn8hivaak=
X-Received: by 2002:a05:6402:a6ca:20b0:6b4:5a9c:4e44 with SMTP id
 4fb4d7f45d1cf-6b7c0ce8d7cmr6473180a12.37.1794879500747; Mon, 16 Nov 2026
 17:38:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116032558.130928-1-zong.li@sifive.com> <avrwLtiPQWedXpY_@xhacker>
In-Reply-To: <avrwLtiPQWedXpY_@xhacker>
From: Zong Li <zong.li@sifive.com>
Date: Tue, 17 Nov 2026 09:38:10 +0800
X-Gm-Features: AclHuK9yBmULwVXZtlSgZp0r9jbpNOgjaKqPlZntGAUIz5bi6JHwDornmBn_XXE
Message-ID: <CANXhq0r1TcyD2KHyKMLc97+PGgPD2Nkx0eR623SRQXYBVAn8mg@mail.gmail.com>
Subject: Re: [PATCH] riscv: usercfi: Don't inherit parent shadow stack for
 user workers
To: Jisheng Zhang <jszhang@kernel.org>
Cc: ivanrwcm25@gmail.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, debug@rivosinc.com, 
	samuel.holland@sifive.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 8:19=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> On Sun, Nov 15, 2026 at 07:25:58PM -0800, Zong Li wrote:
> > User-space background workers created through the copy_thread() args->f=
n
> > path (such as io_uring io-wq/SQPOLL threads and vhost workers) share th=
e
> > parent's memory space (CLONE_VM) but never return to userspace.
> >
> > Currently, these workers inherit the parent's user_cfi_state bookkeepin=
g
> > via dup_task_struct() (e.g., enabling shadow stack and pointing to the
> > parent's live shadow stack base). When such a worker exits, mm_release(=
)
> > invokes shstk_release(), which incorrectly executes vm_munmap() on the
> > parent's active user shadow stack. This triggers a fatal SIGSEGV
> > (SEGV_MAPERR followed by SI_KERNEL) in the parent process during its ne=
xt
> > function return check (sspopchk).
> >
> > Fix this by explicitly clearing the inherited shadow stack bookkeeping
> > (setting base and active state to 0) in the user worker branch of
> > copy_thread().
>
> + Ivan,
>
> I think Ivan has fixed this issue in
> https://lore.kernel.org/linux-riscv/20261028154315.1272705-3-ivanrwcm25@g=
mail.com/
>
> Besides the issue, he also fixed another bug in riscv. The only
> difference is whether set_active_shstk(p, 0) is needed or not.
>
> And in the same series, a selftest is also added. So IMHO, we'd better
> take Ivan's version.
> Just FYI, arm64 has merged the fixes into linux-7.4-rc3

Thank you for the reminder. I didn't notice that patch. I will drop my
patch. Thank you so much

>
> >
> > Fixes: 61a0200211d3 ("riscv: Implement arch-agnostic shadow stack prctl=
s")
> >
> > Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  arch/riscv/kernel/process.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> > index 34c1d498d1ca..4bc95acc5462 100644
> > --- a/arch/riscv/kernel/process.c
> > +++ b/arch/riscv/kernel/process.c
> > @@ -261,6 +261,15 @@ int copy_thread(struct task_struct *p, const struc=
t kernel_clone_args *args)
> >               p->thread.s[0] =3D (unsigned long)args->fn;
> >               p->thread.s[1] =3D (unsigned long)args->fn_arg;
> >               p->thread.ra =3D (unsigned long)ret_from_fork_kernel_asm;
> > +
> > +             /*
> > +              * User workers (io_uring io-wq/SQPOLL, vhost) share the =
parent's mm
> > +              * but never return to userspace. Don't inherit the paren=
t's shadow
> > +              * stack bookkeeping, otherwise shstk_release() on their =
exit would
> > +              * vm_munmap() the parent's live shadow stack.
> > +              */
> > +             set_shstk_base(p, 0, 0);
> > +             set_active_shstk(p, 0);
> >       } else {
> >               /* allocate new shadow stack if needed. In case of CLONE_=
VM we have to */
> >               ssp =3D shstk_alloc_thread_stack(p, args);
> > --
> > 2.43.7
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
