Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F0036E468
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139496; cv=pass; b=az4ViRzXT8eww7F8vl2xWLyfzzyho1ApCikvTH/PMIBVWdK15WzwJoiTc1zybSTcVeykJVY+Owr90ZVgD1TJ1HCmc6flun3EXb2qRWxEGaDjv6hNfPE8x7ADBtXeDXMWFEvg4b64kZDy61PMAXvsiMoNXFs/cmvImRTd+2ER/go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139496; c=relaxed/simple;
	bh=m9qc5HuzuAayd1fHr7EcANDV9LaAzl4uP76a0YriLw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjSqWULtZzmjP51+C/XBkCp0jmo979p9hbIPDkr/42dEC9Z8ch1sDd4GmGXWx8mrqW6QyYef5kR5h1UPt6Q141SxjiEcfXVsPt7hzaex97KYLrFbUMfELqFOf0cbwqVJT1bcayZpLy87038WiDDiB1NHR+Ia2KqnHPnAg93h26o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eWl29qHE; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eWl29qHE"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c29667ed561so130663066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789139492; cv=none;
        d=google.com; s=arc-20260327;
        b=NwIUlxXzNARXUoS2FcbMFhyGSWUqgT61F+aPtVBe05djO/IoO76P+93OoS4p6ldptr
         2wJ6ooC7wX8wGUIgvCHoY1h33HWduNuCmUsy1FZHfMwRJiv6PR7VcnTmXshwENtBkDiT
         vdHJ1b7dWRt+FzczBUEtjkiNfj2Gny+YPj9fOclCdn6HmgYj/k/T+U3kyZJYC6ihg6SO
         OMSAPordrlMerwC3QmVZi3AWiOeYGgzclWARgA4vJHSgXrGJd+QOrcFiYnqdPHyqoZsn
         G1l6Rxft1TQ5q3rQZlgXRXZty9K3+ueDdo0Bdn09mB/sn0NvXpMPeYfvc5P1qGQt2l4I
         Qh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rKKIGEtpzJLE2nNgx4bbSB7pUaSoifxufZ8KnOyMnzk=;
        fh=QWGJ4A/Mz01yCjV+sg2gxy7n6JVRDFsMsPSgwZSdRds=;
        b=lf0gj2rUKdvvwNNYVqFyGB2lVdym3W1FlJTQEiE5102/B3LmqiKUqzrWAtntCoNw3B
         gbkXttdApDWzwfpa3uIuLvyjfUg85W/gT1ZaC5VPrv5AGORtfbxP8Luk1laUTz6P2dpp
         Jjuu9H/MpL3PhQXJsybHFKEz8Xj7m+qRZhYSvPc2nop+/trjy8gpj2h5BJd2v6ZxEmQF
         IvkjPMFOac0lvLr7MLDbkGb1jBarYKHjlvio4lEYmk+gzlDnk4JDGTraFP/b+Fa7Rk9D
         ppemxVNvMVY9hTkUG2kLRFizmoE2jvou9mUoBRSiKlBxylXQGVntA9xLCPtWS57vR8LF
         c/vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789139492; x=1789744292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rKKIGEtpzJLE2nNgx4bbSB7pUaSoifxufZ8KnOyMnzk=;
        b=eWl29qHEU80vt3tn4Pp36byJjrR2wcdngBlb+OzJi4RJ2WxjFDgSo/dttYGn+wJ8lJ
         7zskZ2o4afYIo6gqQNOVu++JOV/f5N91MUwl/L9aLtPZ6/DiZAJ9GjjW6ocdaYSazLxj
         tnI1+MnrNADSoWXeIOVCQO9KoLQb1iZj9m3iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139492; x=1789744292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rKKIGEtpzJLE2nNgx4bbSB7pUaSoifxufZ8KnOyMnzk=;
        b=Og8MwyveQ/5v0VjUn/XSbJcCLCVSrLLJK5PDdSFAslHgAVYqUcWI4AOTD+ArfvKDJD
         N/BWWHDdKxOOiiwdmdcUwOv2uY7v67yZI2ImKr7a6NUzvnEjUAXkxoBRM7bYqVG7zGPU
         L13hZhi3MPInE6248EC1jCAEMcErY9xmtEYBICD+OnBdt1y935/weZjO4fXor3yUmSsk
         4xcqOXqq24/QUAkXTti3jKgJADOqQKUbyldh7gmFTkfmDtx9ZlYp8OLj02sLN0SViKL/
         nilE1U5dXr8oDtgj1nxoShs47ICqTDBBZR2lFaJ4NhuSpZdRyBs5/Ug8sHkR3d6P3ZgY
         H6qA==
X-Forwarded-Encrypted: i=1; AKwUvBzJByUYPtlaYi8T974hWIt3tzc3GN6/V83lvjDk+xeyEVs6nnExmCYk2hHbURe7SNHShuF40kDWaXmY4ck=@vger.kernel.org
X-Gm-Message-State: AFuF++kozv5nVxg0MPPq01s8tlsro8MFkbuJMhseszHO2wuvZlACE2gb
	rx6Y9yYuhfz0c1/pw02RSjcuFeU0Hsa6PHaITPPBzEfDt1oytm/U2jAjnMs++IfCMVspDd0TXUz
	TPVOlVuEoaOMDFXfvZytFd661rqPcIF3Mob0bd5sS
X-Gm-Gg: AYBFou3YaOHNfoyxZpLlBmMJwBKvrfUD8mDvgi4tdovNgrBu2VGuoGxAiZqMyxbu7OA
	zXJfFfccmIpDdpSWzC0IxeHyZr0bQfeJZLnvtnVkewOl96TR8HNU1D01TKlhScER27joIR0Z3ds
	6LGuSP3b4BEpFkLth1ujdeYOn+1uM8du5kz2g4B4rhN1Eg/yenRE0n2ja2uBxfANJlJ02JNT8y2
	s2aWwQQcT7pfqrFUlfmpA3o8dewRVrSsIuz6uIVoUvMGzSaBnCihE8uxiiHTQ50w9M0w9Sg9NNd
	S6M7YBtHku2pfLRQ+hwf0UQqMvW5X44/wd3DEZ9DoUzTZ946BPBXcyILsEM2SE2h1dg=
X-Received: by 2002:a17:906:8f15:b0:c29:3c97:c994 with SMTP id
 a640c23a62f3a-c29666d69bbmr202467366b.35.1789139492557; Fri, 11 Sep 2026
 08:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910090512.1197517-1-jaszczyk@chromium.org> <5a09dd3a-7e14-4649-af53-f1da19343fab@intel.com>
In-Reply-To: <5a09dd3a-7e14-4649-af53-f1da19343fab@intel.com>
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
Date: Fri, 11 Sep 2026 17:11:21 +0200
X-Gm-Features: AcwNN1VtvIgS0hIcX67U7fYU64ZxuxH4GoaiyQZ1rv4h4hFm2C1UQZrnF_fuAaw
Message-ID: <CAGptq8Ghe7TcGV8rwoUrZaOjrp_oGDO5rAb=MKB6fNTe=PUb6A@mail.gmail.com>
Subject: Re: [PATCH] x86/apic: Switch to x2apic driver early if x2apic is enabled
To: Dave Hansen <dave.hansen@intel.com>
Cc: tglx@kernel.org, linux-kernel@vger.kernel.org, dmaluka@chromium.org, 
	vineethrp@chromium.org, chuanxiao.dong@intel.com, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet <edumazet@google.com>, Melody Wang <huibo.wang@amd.com>, 
	jaszczk@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 5:23=E2=80=AFPM Dave Hansen <dave.hansen@intel.com>=
 wrote:
>
> On 9/10/26 02:04, Grzegorz Jaszczyk wrote:
> > During early boot, the generic x86 kernel defaults to the MMIO-based
> > APIC driver (apic_physflat). However, if the kernel is booted (e.g. via
> > kexec) when x2apic is already enabled in hardware, the MMIO interface t=
o
> > the APIC is disabled.
>
> There's also some new hardware that locks the hardware in x2apic mode. I
> wonder if it has a similar problem.

You are probably referring to "x86/apic: Don't disable x2APIC if
locked" - if so, it seems it will have the same problem whenever ACPI
MADT probing doesn't run early (e.g. in CONFIG_ACPI=3Dn crashdump
kernels).

In both cases (locked by hardware/BIOS or handed over via kexec), the
CPU starts with x2APIC enabled. As Intel SDM section "11.12.2 x2APIC
Register Availability" states: "In x2APIC mode, the memory mapped
interface is not available and any access to the MMIO interface will
behave similar to that of a legacy xAPIC in globally disabled state."

>
> > Normally, ACPI MADT probing would install an x2APIC driver early.
> > However, if ACPI is disabled (e.g., CONFIG_ACPI is not set, as in
> > crashdump kernels), x86_64_probe_apic() does not run until late_time_in=
it()
> > via apic_intr_mode_init().
>
> Is this "default_acpi_madt_oem_check()" that uses apic_install_driver()?

Yes


> >  apic_driver(apic_x2apic_phys);
> > +
> > +void __init x2apic_phys_early_init(void)
> > +{
> > +     if (x2apic_enabled()) {
> > +             apic =3D &apic_x2apic_phys;
> > +             if (apic->x2apic_set_max_apicid)
> > +                     apic->max_apic_id =3D x2apic_max_apicid;
> > +             pr_info("Switched default APIC to: %s\n", apic->name);
> > +     }
> > +}
>
> This seems to be a subset of what apic_install_driver() and
> apic_x2apic_phys->probe() do, down do the pr_info().
>
> Even if those are overkill for this, it would be nice to use them for
> consistency if they function.

Ok, I can use apic_install_driver() instead. When it comes to
apic_x2apic_phys->probe() it can't really be used in current form
because at this early stage x2apic_phys_probe() will return 0, since
x2apic_mode is set quite late in setup.c (check_x2apic()).

>
> It also seems like some of the more obscure apic drivers depend on
> x2apic_mode. They also seem like they might be selected by the MADT
> search. Could this end up overwriting those?

It should be the other way around: MADT is called after
apic_setup_apic_calls() and it will overwirte it as normal: just this
time instead of overwriting apic_physflat it will overwrite
apic_x2apic_phys.

>
> Maybe this is too much work for the task at hand, but this does seem to
> show that there's some information missing from 'struct apic'. Say
> apic_physflat had an ->initialized() that was false until its MMIO was
> unmapped and apic_x2apic_phys->initialized() pointed over to:
> x2apic_enabled().
>
> apic_setup_apic_calls()
> {
>         // Search for an APIC driver that is initialized:
>         for_each(drv) {
>                 if (!drv->initialized())
>                         continue;
>
>                 apic_install_driver(drv);
>         }
> }
>
> Basically, I'm wondering if it's worth continuing to special-case x2apic
> handling or whether it should just be a part of the apic driver
> infrastructure.

Yeah, something like this will work. Following your suggestion I was
thinking about something like this:

     void __init apic_setup_apic_calls(void)
     {
    +    struct apic **drv;
    +
    +    for (drv =3D __apicdrivers; drv < __apicdrivers_end; drv++) {
    +        if ((*drv)->early_probe && (*drv)->early_probe()) {
    +            apic_install_driver(*drv);
    +            break;
    +        }
    +    }

and as apic_x2apic_phys.early_probe() we could use existing
x2apic_enabled(). And in apic_physflat, an early_probe returning
!x2apic_enabled(). But I see that Thomas also responded, and I think
he is looking into a different approach.

Thanks,
Grzegorz
