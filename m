Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792646389;
	b=he88/zY7k10BKKNwHaehisHg88DOGh6q9QPtG8cwcbXzAQexlvUXsGSxxi5L/9Ydj/8+
	 VN+cHIogl0Fq4vhmZtSe4bXPSllNN9JiXTQAHBx7XSPaE33DGbEPqMkldGJ94C+jvLxht
	 uu/Ilmn8Q6swz2hdDJkmnZDLPePBpEKuRSrjaOfjk92Pr88o3Kk8jiD/O090PibZss00Z
	 Om+TMFvHsjiCB0uxBNuS8ja+PgK/m6jPgaV2Bqw6P06JhbcJLXDkBSyhYM+NpWat6ffIX
	 7XfNcEAfjX0HqUFACmihGppWMHhqODG48Jn4IMROFW9cC4vBFP680OE8L6b3hmYefFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
	b=ETPazjJvfQikrPY6s1Yu1BZXv3xvfyu96XSgvHLalmWiquRfHO8NHkEGZTTtJQTyqd/H
	 9QSSVRjHb8r4tm//e0U5E9P7YqWHhd9DppxsHgL112TFhDGyJwRjSr/lx/L4jj2s/yk3G
	 ee649xVZvqnnhWxL56eBlbbgyZys8nNZePgCCN6G/wBu40NioBc+e7tZ8Vjtwjekre8ch
	 dHh8dB8KA2nlm/3sMe6qt3SN03+R43/z437/rIwZ1elzeHorywPmqpgz5U8nJDPHnPUFy
	 ubi/MqizX+YWv/Ay0hxIn8cubJpOXhUMynQtCXmirix05nL+62HQZSib2sSNWOaq1Pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bpvgaLo0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A465606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A465606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=bpvgaLo0
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e09aa5264so940525f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646388; cv=none;
        d=google.com; s=arc-20260327;
        b=fnpWL3Cv6ZLGEkNgYo436Sy83TbA7Ve/q66U2TFy3x0NmS0yhhv5/qlaqGEvXkJpJn
         2FovNRLOrogpPDRT+opJJorRY+OApizKwyNgjDknEWvtQnSR3Ys9lzesdVuaWxMCelse
         ZTY8UTV513pEMTHmciNuYBD4Z6T9YJRqAdWQSFolIbUCHOtGI09Qcq3tTYght0YQ726I
         gAcoMHNj1DNqok7ajkeYTjcZeajEyaZNpRFWMaXRBrJlTtvjyL8yyMMPeEDIFvCAEYH6
         aJ0yIm0HaJw84m61zWN0cs0y/+1EI0tmT6sK8YMv1t3lPhyjUkLy8kECVEtMnt8OG6Rf
         /vKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        fh=stadPKwJSzs9nYt1M+4if3ptDhxniSUSJzX87lcESMc=;
        b=d/zRlXNOxmf0+Jl43O38s3hO1u5UK8lJPXXc8SqJpjB1FhnlKlMyZ5ah3KfVS1Sb/D
         MFyXLvxVvshjw/m0LXqEDV2PyGCuFeYDUZXADufTrOxGBGFbIJ2okMERRJwmCcrHT/4l
         IMtPzb6TVN8zrV05ZqOeqz0Di9HTuL+nGL9bMAw+42irRw2sFW4IYGflcQm0OuX2xXvF
         qDeT5+3iClntioOtIbsxm8ST2HXb3luhxq4HI0lrX5XEY2uf4XSp5kOKxzvUHN6epEVz
         rj2BStzr0SPMwVKKRfTbAZUMBsvHBsTEVrHnpgaPWZCL7IicQEgqTRi0ttzAC0Tzt8ly
         I6kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792646388; x=1793251188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=bpvgaLo0EQp7fNdSdcNKNCyKGKrzEpifTwKSvwIRk/Mms67mZ/3ySVHVjUJUBZilgv
         rVN+Dr8FWdveH13hSpPijVXN2HbRnv/MYc1zMvdxdUyw6uGQSF0TokMlXxoaBajC/5mj
         2rEHCg2ymfeiiHdHejyIxqJGSg0HXzykisjRyqBS5mc45GuuPsAVOzF9fskG56Wi0/vQ
         m1LLxZRIOzr66Wzo/Lx+EHFTcY5gM4o5SrJIMChjKfixgQxtfkrjckENzyjkY+N6A7to
         TFIu/CsnY5dOYhtX2LDOyWQRPt2PvEWXWDpgC5VapC0Q3iNeLsSpj4Xvh+o+PbUbv8KW
         qCrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646388; x=1793251188;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HapPLVnPKNTi6siBORLQtk0Et4KzisGv9gkCpxoyz80=;
        b=HtH8pELDKXF+8QINmijWQix/te4cthBC/tnUeDxqXkcV3ETRZ5d6MoynFbbigTniT5
         E5EtQrvvriEv/r++0/0zTpyZKkCO5SlgD0bwBmreHFhy7CWTT3xAQzFdzMVGvp8TcuW5
         14ehlIHVTl9DFlw/ro1+axyAIxzxRBEOcZa/5IwM2kFDwAqyNE42SZe2rtuEPV0Rd6kk
         MzRJzl8ccC5fJhmn2Gp4iM8IGElXc7A8yDOfjK4pQdXgwPK0HWE7gux6lcqLWMhrbYB3
         Z3dGgdueduKotwLHqhi/WGL0RIq0PyKSSVZGMi/1I48q8MbwnSi1C7KqVwyRdIEFgKti
         R7ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyWvKBDZZQkmTxiJH8ITU7vIhX9g8PkzUz68KKTc4ijOsEaYAL3JR0JcNyrwCNuMaDBrIDpLFbRwBpfas=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN05kJoIBFj75DfNgWVoFO253UjzFVhce6jHkUsU3SghW/B2eg
	57gQYkqsEamJOBVylXW+RNZY7g8dPXJdXeCuTQe+Afwl8uiutNcpV9QOff/ZgxA/pj4Ap8Qbg2U
	p3/XlmZHBiT/Q3ywIkFUVHBx9EBUHLB8cImhSIzoNGw==
X-Gm-Gg: AYBFou2m+gGVN7ydjdU2RoGtSNMyj9Hhjstcw5KEi4N5IuaJpKJh5OzZCZgALkCbk29
	7lr/rkqR5u+srBXkxnE5D9dAx8l1qf36WmHeaO7Rne0h5v/cy/Xx2Yf6m/NQGs14zTGQ5Vba9go
	yYXY4+OELP5DtHUZYQLNpKXpJNUctS4u0iqCnewrs+zlfAq9lT+P094PzHLXZUQ96OfEhWjoLhS
	HWW/QadzJIVu5nbRDb/tfp/odXNoCkDzQlbdBTymy6mG5yZKKyJm2NcdZaN4mECCj8bB5i8SfPo
	1ZTha3Vx/hPRICUsBuQeI1a3uETjmE7t5qebLz7Z8JrdyDkPPFdB5QNtV4rb7x16ny1YSmeKJIk
	ybYi7i++6f0D4nrlGs2ZSx0zTIwGqwmUXFJSb19n5ylqC6HLLrD7L66qP2CFIauyRWPC12Q76X2
	meS1Oo4BWcc2dsnRcbkEwokMG0H/j+CVeEPL68mbtirG+xrz3vsg/x9YGr
X-Received: by 2002:a05:6000:2312:b0:48d:fa9c:7838 with SMTP id
 ffacd0b85a97d-48e2644efc7mr9279274f8f.2.1792646387426; Wed, 21 Oct 2026
 22:19:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 10:49:35 +0530
X-Gm-Features: AclHuK8p_QSaWeBtSoMEm3xKUDsy3StFk9vUIaP-8tnRvRCPH9rhzXhcbhlL-gk
Message-ID: <CAAhSdy1gh64bxcg_OpdWpCwHj3nb0V2Ub0AYXNeSOCnq08=o4g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 9:21=E2=80=AFPM Andrew Jones
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
>
> Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC vir=
tualization")
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

I have renamed hgei_lock to vsfile_hgei_lock at the time of merging.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup

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
