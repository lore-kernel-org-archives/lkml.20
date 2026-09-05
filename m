Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3D24AF69C
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621120; cv=none; b=Mc7VTwjGWLPkvtS5jrSvlnt6SV4BD8q8BrFwBb3FOaCymzYW4cJeWVP/xXdHBhU0GjbXI0B3Io7L0Ii7/okDyZkqItGQSSm4D4j0o5hQFYNZN+Xfi6w4pmTxaMaueGnKmMjkNpdUVjxNB3sJe8suDjFxdLHwLXMzfobtwmLfBQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621120; c=relaxed/simple;
	bh=cs3tMB5ZJP3WI9uIvt6r8CcZt7ukNuHK6xpdE6GGht4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6vTy6h8IX0VMB2MhNjRmPXgGr+qILIQ+fiMeR8/nxWJytikwvsOP+MIiHX7SzWSDgwf8ciBYfqOTeLDOA9STop9+Xmy7TTz67Zu3Y0++BPsLCxgBVgQU59yQ25oLAOiOiPXDTNR9zXQu+nbohBDqwshS4CbzvJ+VU5Gu3aDr4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfpQ1vfe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfpQ1vfe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696F01F00A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788621111;
	bh=bL3w34qUiq6PKrSstiPLOgFf9oEN1oR7xJDQLGR9iRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YfpQ1vfenfqwtIYla5E2kEDfvPou/1j2+HsFW0tF5CMddYYLw56AUx5gwFc/uqvq4
	 t4L9lcAJOp+Mg7jAtuIpdqyk90+5iN6qH6GtkrSujdeh/VW8dbA/KSSAgQagMnxIqQ
	 sL6B+OtfvjxyV3iEx7xCEO8xRkXpvTAT4zlNjfXdFyekC1fypo59uVDJz6KYMzIP/Y
	 tynHBx+eMmAo2DS5YxloO55IE56hEP2X8X5ma1FqOXRYLdJm8GH18xnVOFv+BrcuNK
	 0qzvG8UqXVVUehIYyPJ0MevxbUOwXcdswf7CorEj2ssKjt1P95LA3LvzUnS+psmFc5
	 j1QCH9NBCAiRg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a668cacdadso3088920a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 08:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwecPzJuglaV0RpnR4Wn+NcXYe9Tg9krT9/AzHhijS51KV9dE9c/Sz92ZnsAv42MG3YNFizDlvGqR+vkVE=@vger.kernel.org
X-Gm-Message-State: AFuF++mFNov1iE2SH7kk/NmSpxcNN2juSpXN4+wUfxO8m/jKaE0Va1V9
	cNehFJ33N+wTW0AFthOpkCjFA3kE4sGNm54LJNZDJNR5BYVH8dpgGsD8Pfk3pd413Yvz4sBM4NT
	o0KBFMfC/p3J0uBDRop7dyO6/mMsA68Y=
X-Received: by 2002:a05:6402:2752:b0:6a7:ea54:38c with SMTP id
 4fb4d7f45d1cf-6a7ea54209dmr3447413a12.29.1788621110068; Sat, 05 Sep 2026
 08:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814094738.2552440-1-cui.tao@linux.dev>
In-Reply-To: <20260814094738.2552440-1-cui.tao@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:11:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5SRTceJzKUMCH2MXJXf+h5g0e4iyFgwStStg5hJOhB-w@mail.gmail.com>
X-Gm-Features: AcwNN1VggpiIfHX09jVpMuhzax1l2O50S0Jc_dd9AH9e-iil6TqAP2EDuwdtxyE
Message-ID: <CAAhV-H5SRTceJzKUMCH2MXJXf+h5g0e4iyFgwStStg5hJOhB-w@mail.gmail.com>
Subject: Re: [PATCH v3] LoongArch: KVM: Fix TOCTOU race on pv_features
To: Tao Cui <cui.tao@linux.dev>
Cc: maobibo@loongson.cn, zhaotianrui@loongson.cn, kvm@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Fri, Aug 14, 2026 at 5:47=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> The check-then-set on kvm->arch.pv_features in
> kvm_loongarch_cpucfg_set_attr() is lockless, so two vCPUs can race
> past the validation and set different values.  Add a spinlock to
> serialize it.
>
> Reviewed-by: Bibo Mao <maobibo@loongson.cn>
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> ---
>
> Changes in v2: use a spinlock instead of a cmpxchg loop (Bibo Mao).
> Changes in v3: rename the lock to pv_setting_lock and place it next to
> phyid_map_lock (Huacai Chen).
>
> v1: https://lore.kernel.org/all/20260810081321.157258-1-cui.tao@linux.dev=
/
> v2: https://lore.kernel.org/all/20260813232542.2098930-1-cui.tao@linux.de=
v/
>
>  arch/loongarch/include/asm/kvm_host.h | 1 +
>  arch/loongarch/kvm/vcpu.c             | 6 +++++-
>  arch/loongarch/kvm/vm.c               | 1 +
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/inclu=
de/asm/kvm_host.h
> index 23cfbecebbd7..3538a199aac6 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -125,6 +125,7 @@ struct kvm_arch {
>         unsigned int  pte_shifts[MAX_PGTABLE_LEVELS];
>         unsigned int  root_level;
>         spinlock_t    phyid_map_lock;
> +       spinlock_t    pv_setting_lock;
>         struct kvm_phyid_map  *phyid_map;
>         /* Enabled PV features */
>         unsigned long pv_features;
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 20c207d80e31..e47fa463a8be 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -1165,10 +1165,14 @@ static int kvm_loongarch_cpucfg_set_attr(struct k=
vm_vcpu *vcpu,
>                         return -EINVAL;
>
>                 /* All vCPUs need set the same PV features */
> +               spin_lock(&kvm->arch.pv_setting_lock);
>                 if ((kvm->arch.pv_features & LOONGARCH_PV_FEAT_UPDATED)
> -                               && ((kvm->arch.pv_features & valid) !=3D =
val))
> +                               && ((kvm->arch.pv_features & valid) !=3D =
val)) {
> +                       spin_unlock(&kvm->arch.pv_setting_lock);
>                         return -EINVAL;
> +               }
>                 kvm->arch.pv_features =3D val | LOONGARCH_PV_FEAT_UPDATED=
;
> +               spin_unlock(&kvm->arch.pv_setting_lock);
>                 return 0;
>         default:
>                 return -ENXIO;
> diff --git a/arch/loongarch/kvm/vm.c b/arch/loongarch/kvm/vm.c
> index 1317c718f896..86ba7d54e81f 100644
> --- a/arch/loongarch/kvm/vm.c
> +++ b/arch/loongarch/kvm/vm.c
> @@ -76,6 +76,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long typ=
e)
>                 return -ENOMEM;
>         }
>         spin_lock_init(&kvm->arch.phyid_map_lock);
> +       spin_lock_init(&kvm->arch.pv_setting_lock);
>
>         kvm_init_vmcs(kvm);
>         kvm_vm_init_features(kvm);
> --
> 2.43.0
>
