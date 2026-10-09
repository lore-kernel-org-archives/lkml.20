Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A114BE43B
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546347; cv=pass; b=tGAkOugQVlrBSaLoakHVl1fcEoAs2GMvc3YGa392n+nTOjHd8iutSbDHAOWoOHswcDCUG0RNgdkjGBaPdsZ4gvuyIWwgyXaZgb6ejx6PZpMnISvPnRUpFyb44hWNeq/6eQ3ao8nRE+X6hoM4V7ryD7bZYWidvbU+dqNFGWcJtpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546347; c=relaxed/simple;
	bh=TOfNGwFqaSy91Kspj+7ZYb7uFuFlJpfQkRhy9CLGxCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCmf7YsM43AvF/r5f1ajPX8fjx37NeEZOCuO+hp7Qz1l2w47J9+RHvxaZbvSCyJZaOZy0Fhmwf6q8LybTCpRnBU3Wn6uQTx2MYJdXNT1sxS84Ij33UB0xTpzmZE2m1SutwScdgqMtztAKjG2nykLYez7QumVPo/wXflEix6ZMKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=u8gSMaDd; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="u8gSMaDd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48afe0081a6so2021993f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:45:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791546333; cv=none;
        d=google.com; s=arc-20260327;
        b=aO/mElhwGHt9sym2uNIcNwv25Gclt7CXN2oNY6C/fU4tCWMu17HPhlC6vIqZZD93S9
         yB7Fg5zS6W0+oMH6IaYVt4jaEdEuHbgqInNwFaKs4MyAC5Bwezt5WRrfFfwdGwazMzXf
         hKT/sdaYxa73VhJDp1+cpivKG/kcEZ7uYArKiII0IMjJmnOAQi1Pp0lpim9LdIRDt9Xp
         6zWaMuNOKeVg87f5XxkZeS4+FQpxDjugVA6qDKe22NlMHaTyW3w02NOCFWqWa/1KlgYk
         AqAkmwuJYiajOVTUBIOlZWu2a/vuTNbz72vb+PcmGf7rZcltPiqZHDCGXuhj7kfONWif
         9y8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        fh=gVC30guzYgJ5DmboudA6tjcpYEeIFEiomgfsaaJxRAY=;
        b=cb0oo00A1bPVT0IKTXgsZBUeJDUuMhVmlKVP3hETVRwIXLK+HwgsZ8H2SS5NOE3uBY
         T3h6JUih3Dq6loeClmglq1KYy1hjPG2MD3ihtnm7xuIgtAbPxeVtfdDrEDit2Ddbh4Ha
         rTEBNwYXrbY++7Jx0WI1fERgglzbBhtx5+W5IAI7xIbRB6UEx03ADGZRlvBgJ2m5FRQn
         jaGAIlNrY+DtmCukhU3XESmJ5f9R2vFUT4JOQgcNFYB+1v1P2g+xvn6vBwjeti0P9RjB
         kpf/MID1pUa0o6pvydslsG5UhZDzBabcjOK8WycvkfPuuTM6oSSsz5CZyZEPue9pZqsm
         P4Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791546333; x=1792151133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        b=u8gSMaDd5aX5pz6DW9qlPcfr0QnwLzwg0OBgc5+IP9MlvhEALLTcqNZDy9ijtLZi8n
         R07Hu2DgU2NadN8sXlN0yM8c7EpvpyXpYwPvcBLqdoIYV+hZa/xCtg0xpmCEJItUOFJi
         uORpCiayRtEUWcPHhSjbmur4tgW84iDGGek+KZ8DB2p+jNTaPdqEOoNrsI6OwTThVwb1
         5wHW1CbxCJNVD39r7s2tmX4V2Tc7jcrRC6LbJ/spMC4j1XxyF50/B7zO5JVg6iylEHpW
         M6wWcXpuJ7FtOo9l0njcCKNokMdvpatk57ts9FIxMWhRLKesHcQ4OXJJmwSZsORVBbua
         Z4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546333; x=1792151133;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MO9vjywSNkYUu5MtJSespV1dEQA8yEju3SiQ+MpGec=;
        b=j134oP1lrttZQJAgmeEp5yZgsr705wwGmL17AMZSzKxN/qpXeUcmM+DVtNZd0Z7OjV
         wpzR+gxW0n2EsySD+4KtSmLO9EViwJniipN9f5yloBCrSOV1+8DdNrtR29Jve0gjtA4q
         SkOQX16/9irogh5SxhJkkhoeTScmhqAcwUikz3jiYjk8CFeOSJ9eMzCir9fMkPK5YeyS
         yfq47X2SEzfT9rEzoNQskq2I13oSZTeh+gOliy2wKdFppgg1QTa1sPALlFzX972CxGdt
         LE4TBrUIr/zVdZHIiO+090V6z2g58/bW9zO9Slq2EIcy5Jqp9BFzgs77ukeKM1+ML0D+
         6b+w==
X-Forwarded-Encrypted: i=1; AKwUvBwxHNYASwKyb/e9yWqYMJCAZ0ibGvged4kgdw6zDJ740fOnijVF3yuOWsw79AysUrngqnb15akKwN1adnI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1jEXs7DzRnBtR/s1o6y5koHajyVXMn1zLuVvqZutT+pD6fg2P
	hjN8nN+fQYutq5dJFOiI0/SuB2hjrtH4YDOlm+qVDXn17OD0d76BSpGGra+G/sC7NLVI4f5xRl6
	rq9VYf2kl7r3aoTmzs6aSBSAXE7ILJ7iz/V8Bc5Sz3Q==
X-Gm-Gg: AYBFou0tIuKn6lIsbpNzqgegB4vuW05++DMZYaaYar3DHXfSuZ/ylVl6WD0c6XXtZEh
	gr07Apiu7N1qui4V9fJPqfwhuh0SRVF97nxJ4s+j8AEUAUbgod4hk5aiS2uuOkwl/Kyo38haI3q
	eB4hkDEyJ/6BXKT3A9vCSKef4ycNctBjUs9X/ZMSLJnMuiZW8dOeEyXF74DULnSZ60PDANkoRk3
	vnRi4o4eiaIZ3xZ8GLV/Nhf8kYjvIEgmvS5pLbP7Qz7Vfcudx8w6c6d/XqdBLCuSBwBdjTFKv3w
	2mczDCJxvDOyx4EzwdS4B8YZK2tXkVISiv3ic1CQ/mc3f9ns3v9Flh3rvJ5TemDDwIGG7I+XqcV
	jP877ti1V7DApZTQAl5xPZvNMYKs8kgp8sxTjH2lSQ59n1CV2DpzjwJRyCYDXvZGbQ0ZIvJkejg
	==
X-Received: by 2002:a05:6000:4687:b0:487:36b:1816 with SMTP id
 ffacd0b85a97d-48dba7877f0mr2127579f8f.7.1791546333358; Fri, 09 Oct 2026
 04:45:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 13:45:20 +0200
X-Gm-Features: AclHuK8rgBU1gbsBmEn-K4KM8bdu2PbHz2NOesu5k9NjQJGHum_Uocj_Q34IYFc
Message-ID: <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 5:51=E2=80=AFPM Andrew Jones
<andrew.jones@oss.qualcomm.com> wrote:
>
> kvm_riscv_vcpu_aia_imsic_put() can run from the scheduler preemption
> notifier while the raw runqueue lock is held. Taking vsfile_lock, an
> rwlock_t, there violates the lockdep wait-context rules.
>
> Protect the CPU/HGEI pair with a separate raw spinlock. All updates to
> that pair retain vsfile_lock and take the new lock, while scheduler-out
> uses only the new lock around the HGEIE update. This keeps the wakeup
> setup serialized with VS-file publication and release without bringing
> wider IMSIC operations into a raw critical section.

Instead of introducing another lock, why not replace
read_lock_irqsave(&imsic->vsfile_lock, flags) with
write_lock_irqsave(&imsic->vsfile_lock, flags) in
kvm_riscv_vcpu_aia_imsic_put() ??

Regards,
Anup

>
> Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC vir=
tualization")
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> ---
>  arch/riscv/kvm/aia_imsic.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index c1af23e79ae0..1ccb7eac9f45 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -48,6 +48,8 @@ struct imsic {
>
>         /* IMSIC VS-file */
>         rwlock_t vsfile_lock;
> +       /* Writers hold both locks; scheduler-out only takes hgei_lock. *=
/
> +       raw_spinlock_t hgei_lock;
>         int vsfile_cpu;
>         int vsfile_hgei;
>         void __iomem *vsfile_va;
> @@ -582,6 +584,17 @@ static void imsic_vsfile_local_update(int vsfile_hge=
i, u32 nr_eix,
>         csr_write(CSR_VSISELECT, old_vsiselect);
>  }
>
> +static void imsic_vsfile_set_hgei(struct imsic *imsic, int cpu, int hgei=
)
> +{
> +       unsigned long flags;
> +
> +       /* Serialize the CPU/HGEI pair with scheduler-out's wakeup setup.=
 */
> +       raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
> +       imsic->vsfile_cpu =3D cpu;
> +       imsic->vsfile_hgei =3D hgei;
> +       raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
> +}
> +
>  static void imsic_vsfile_cleanup(struct imsic *imsic)
>  {
>         int old_vsfile_hgei, old_vsfile_cpu;
> @@ -596,7 +609,7 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
>         write_lock_irqsave(&imsic->vsfile_lock, flags);
>         old_vsfile_hgei =3D imsic->vsfile_hgei;
>         old_vsfile_cpu =3D imsic->vsfile_cpu;
> -       imsic->vsfile_cpu =3D imsic->vsfile_hgei =3D -1;
> +       imsic_vsfile_set_hgei(imsic, -1, -1);
>         imsic->vsfile_va =3D NULL;
>         imsic->vsfile_pa =3D 0;
>         write_unlock_irqrestore(&imsic->vsfile_lock, flags);
> @@ -727,10 +740,10 @@ void kvm_riscv_vcpu_aia_imsic_put(struct kvm_vcpu *=
vcpu)
>         if (!kvm_vcpu_is_blocking(vcpu))
>                 return;
>
> -       read_lock_irqsave(&imsic->vsfile_lock, flags);
> +       raw_spin_lock_irqsave(&imsic->hgei_lock, flags);
>         if (imsic->vsfile_cpu > -1)
>                 csr_set(CSR_HGEIE, BIT(imsic->vsfile_hgei));
> -       read_unlock_irqrestore(&imsic->vsfile_lock, flags);
> +       raw_spin_unlock_irqrestore(&imsic->hgei_lock, flags);
>  }
>
>  void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
> @@ -747,7 +760,7 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu=
 *vcpu)
>         write_lock_irqsave(&imsic->vsfile_lock, flags);
>         old_vsfile_hgei =3D imsic->vsfile_hgei;
>         old_vsfile_cpu =3D imsic->vsfile_cpu;
> -       imsic->vsfile_cpu =3D imsic->vsfile_hgei =3D -1;
> +       imsic_vsfile_set_hgei(imsic, -1, -1);
>         imsic->vsfile_va =3D NULL;
>         imsic->vsfile_pa =3D 0;
>         write_unlock_irqrestore(&imsic->vsfile_lock, flags);
> @@ -861,8 +874,7 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *=
vcpu)
>
>         /* Update new IMSIC VS-file details in IMSIC context */
>         write_lock_irqsave(&imsic->vsfile_lock, flags);
> -       imsic->vsfile_hgei =3D new_vsfile_hgei;
> -       imsic->vsfile_cpu =3D vcpu->cpu;
> +       imsic_vsfile_set_hgei(imsic, vcpu->cpu, new_vsfile_hgei);
>         imsic->vsfile_va =3D new_vsfile_va;
>         imsic->vsfile_pa =3D new_vsfile_pa;
>         write_unlock_irqrestore(&imsic->vsfile_lock, flags);
> @@ -1112,6 +1124,7 @@ int kvm_riscv_vcpu_aia_imsic_init(struct kvm_vcpu *=
vcpu)
>         /* Setup IMSIC context  */
>         imsic->nr_msis =3D kvm->arch.aia.nr_ids + 1;
>         rwlock_init(&imsic->vsfile_lock);
> +       raw_spin_lock_init(&imsic->hgei_lock);
>         imsic->nr_eix =3D BITS_TO_U64(imsic->nr_msis);
>         imsic->nr_hw_eix =3D BITS_TO_U64(kvm_riscv_aia_max_ids);
>         imsic->vsfile_hgei =3D imsic->vsfile_cpu =3D -1;
> --
> 2.43.0
>
