Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F1B34CFA1
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789827392; cv=none; b=lodcghAaahUft2dDxson/uJ4MzBN+mCE9bWZgShWMTaIsRdtJTBncjyJG4+K+fwnVhykSpR0a6pMj5283G0QsoO+KBkuDYJtqo8GrHaa0OelrB1dEqwWhCgukjEsMN52kWhNjg9+jlxtJCHFbUEuS2Ej6ESh5QFYaux8UvNAPKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789827392; c=relaxed/simple;
	bh=MwccjG2+oauNamr14pby1lDkkk+/CKotarNDNX7rsMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us/kU3ApbEu7ad7Er32tbUiSMwQw772TuTqorJweoVNE666VuZWMC7wKPYoDvXm5u21yUmAdaHj9ioAGQ7yZT+926+0L0C32BqopLpmcveIfKJ6S7Wnkf+yctCYTdaE2anpACHp7lV703Wrgq3HsxyYSUqInjfemoklzHcHohbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JroN/imx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JroN/imx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC38A1F0089A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789827391;
	bh=4ZXgF5pnA3dbxbo5SIrQQKvM1Kw8+ibbd4JVf0BV1M8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JroN/imxDNgWbPOgJCFbANJHUbDd4PvTGa1MVR1sobXILfURbAHrDyiivhFkj2wbl
	 3FKwOAr4RigmKSbMuxApoQ84MRtRnp7dBoWJ59oSXSXcjNsydA7SU5LUe7W26+7Vk1
	 7M+mwzQ2cMzL/iH8ovitJ0e4HcZb64acqRDCs0i+KebHNf6rwinVTxpLOcVOg83PaQ
	 5C/IiWYly9jIlsdGP1jq5axtrl7+ANkpAQ1OjqSgLMbMV2TQetYYRSzSojverKJfnQ
	 GVq8DM6AwQEzEh7UUQcOT1A3LB4Gs3flWa0k+L2tNKyHW4pVISSGPaUrcNF7gYf0VX
	 DTP4VGwppkong==
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso1921489a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:16:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzvvJNHtibFn7eGg0KzCa/wjopMg1wq1lBcqlQO9vc7pOHFmFmTrEnE3uURqNR688ZbYqcJuGEXg44nA5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lpMlFFzcbQlXgVKrgk+VVRK6Ch7g81Zd3I1FeWigFa9150zMxA
	iOyL/6g/GGVwpmWO868uV8ujc2sBvaHYWU1n1OmmA4TQ9f/7QH8gS/k24X0mf2hW6DeDaOZlr8y
	ybI3yYxQLeEpwqWhXmQqlh2O8JEIThQg=
X-Received: by 2002:a05:6402:e02:b0:6aa:734b:1a28 with SMTP id
 4fb4d7f45d1cf-6aa734b1b2bmr1038262a12.34.1789827390361; Sat, 19 Sep 2026
 07:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909083259.1910290-1-maobibo@loongson.cn> <20260909083259.1910290-3-maobibo@loongson.cn>
In-Reply-To: <20260909083259.1910290-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 19 Sep 2026 22:16:22 +0800
X-Gmail-Original-Message-ID: <CAAhV-H53LrCzgA=4eB=2NCKp+fCHW85i09gZzESY_knViyV=gQ@mail.gmail.com>
X-Gm-Features: AcwNN1XWMmHzuwPLoxZzgjsxMxQIP7AVlzsV687nygWPRtWMa01PeGEqN6D4wm4
Message-ID: <CAAhV-H53LrCzgA=4eB=2NCKp+fCHW85i09gZzESY_knViyV=gQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] LoongArch: KVM: Remove duplicated checking with DMSI
 irq injection
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Wed, Sep 9, 2026 at 4:40=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> There are some duplicated error checking in DMSI interrupt injection
> function, also vcpu::arch::dmsintc_state is structure rather than pointer=
,
> NULL pointer checking with dmsintc_state is not necessary, here remove
> these unnecessary checking.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/intc/dmsintc.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/loongarch/kvm/intc/dmsintc.c b/arch/loongarch/kvm/intc/=
dmsintc.c
> index 79e56e330aeb..cd2cd7a5c01e 100644
> --- a/arch/loongarch/kvm/intc/dmsintc.c
> +++ b/arch/loongarch/kvm/intc/dmsintc.c
> @@ -14,9 +14,6 @@ void dmsintc_inject_irq(struct kvm_vcpu *vcpu)
>         unsigned long vector[4], old;
>         struct dmsintc_state *ds =3D &vcpu->arch.dmsintc_state;
>
> -       if (!ds)
> -               return;
> -
>         for (i =3D 0; i < 4; i++) {
>                 old =3D atomic64_read(&(ds->vector_map[i]));
>                 vector[i] =3D old ? atomic64_xchg(&(ds->vector_map[i]), 0=
) : 0;
> @@ -47,11 +44,6 @@ static int dmsintc_deliver_msi_to_vcpu(struct kvm_vcpu=
 *vcpu, u32 vector)
>  {
>         struct dmsintc_state *ds =3D &vcpu->arch.dmsintc_state;
>
> -       if (!vcpu || vector >=3D 256)
> -               return -EINVAL;
> -       if (!ds)
> -               return -ENODEV;
> -
>         if (!kvm_guest_has_msgint(&vcpu->arch))
>                 return -EINVAL;
Now dmsintc_deliver_msi_to_vcpu() is significantly simplified, please
open-code it into dmsintc_set_irq().


Huacai

>
> @@ -69,8 +61,6 @@ int dmsintc_set_irq(struct kvm *kvm, u64 addr, int data=
)
>
>         irq =3D (addr >> AVEC_IRQ_SHIFT) & AVEC_IRQ_MASK;
>         cpu =3D (addr >> AVEC_CPU_SHIFT) & kvm->arch.dmsintc->cpu_mask;
> -       if (cpu >=3D KVM_MAX_VCPUS)
> -               return -EINVAL;
>         vcpu =3D kvm_get_vcpu_by_cpuid(kvm, cpu);
>         if (!vcpu)
>                 return -EINVAL;
> --
> 2.39.3
>
