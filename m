Received: from mail-wr2-f32.google.com (mail-wr2-f32.google.com [74.125.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72453ED11B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923685; cv=pass; b=OOkvpI7I/m5fcM0ZNt8usyTImPzFcafaEsKRo2Iqf3nF6xmqgg08QroGo6q3xZgCbfWwM3j+yUjFWqZuh0L3YERKmuEJXx6Q9PI4zrCMxztAzD7SdW4i1/Ts+p6DpRi21vDpRGw8qBEz9RM71ej8Suqu1CfHfGuug0PzQ0FAopg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923685; c=relaxed/simple;
	bh=IfxCsQfIXOhm9duIZ5PaRvU0vF/ULsc6oL/xWYLg1cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lq45H+NhgAPgwvG/2FU+sMGbSEGbLPaYy86Wns8UM4SRF27wetPVLAcPFhi7+yaSGMAPwfk4ML8bZZzY1p2t4UqIqgKelxv1KPvFe2t0AHEQuq//34ZtGR/mY9Atg3kn45WtHtQWBHfI0WDDwPvNqN1zeRaRM7BSGn+CxoC26E0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=BHVDLLJ9; arc=pass smtp.client-ip=74.125.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="BHVDLLJ9"
Received: by mail-wr2-f32.google.com with SMTP id ffacd0b85a97d-482f6350f91so4215486f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790923682; cv=none;
        d=google.com; s=arc-20260327;
        b=V16uateRqKPBvpYugOZfoUgQ35dwotRSrPXiH5WyVVB0vItwDXXoSHkuwgYU5ibxht
         jcD+b5lVDVzT92me5hc7dub7tcizCemnYbdt1HaK6ibRrHTPrUChOGTXhzPzV4Bsdmqd
         JwigFU6aIKsH+6Tov8ldOmxtawYi/YQKHfZGxksIhsLzU1fF+9WcNIdWerL+Wz44kbWT
         x1/cz+atn0M2mvAyt0nw/X/BI3H14kHSQdDRhJHCwOOd2k8eLS4i4TE6JoDL937Xei2f
         MtfX1eTAcgua4wMlh6J4Z7Z9PFVehaa0Dvf7ZYfDv3P0hUafRHv2ges3LBEPmibVPmpr
         J75A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        fh=D5uJfl/WIv8+DkL++tu7kJOSj721PjYwBf9mNgIto2I=;
        b=K1OEdEDo1PG3+0v4SnN49GTA/A0KnBLBsWLvXaAdMxod7uoliKmkWR2T87vsEBx07i
         t3ecZSVDsmSvthYV+xZGTa8BmoZQfVSBV9z3ExQ4QCBod5tHDgC2f03G/EjpomFrYpBh
         89PHeSZROG3xzDaZPceeoUamnJHGo/PlKtLeCMyb5BTbkmU7c7iBmg/mQ0UmdcEQvKDg
         /73Cm0w2ftlUECvCOTZwrSqZpcN05W9aPiZy5f6AwhCtFGyrzaUzQKZ14tQu+NLtBtgl
         lLnljBwLnx9K1jkGGH23YJjB6u5XK0wIVhTVK1eh4m7wjKgS9q9qV9bIPO/ShWr39FXT
         Vkfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790923682; x=1791528482; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        b=BHVDLLJ98SNjt4c3210jaPmlJxRWBtB2xHenM0ZL7qPrNyzXHih8R6jD5wTy+3TW9j
         4fG0Z7EIMCdHf2vuRwhcdRFM78/NM+o+HhmHW+umZPGeQojn3T5yoBztH87ay89oWaJV
         JV53QMyu29SPbb1brDR/bsQpWXINrPpXTRFbtA+h4RblnFe7c6oBwNZ1JDLYTfov84Ve
         QXpaVJzYBWTjBLPD6fDdTeh95XY22YBg14ILhnFxQJ6Ueq6gZMwq5r4Mu4/3mSTaFbXp
         mNxpFaEfmMsBsSIPz+1wdliKcV5TAfXer9SGujP4Tml2fkLFocCXFimPHHFf6RVdyii9
         VoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790923682; x=1791528482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        b=I6wcEALiGFZsnggGr3z/c5WlFxjKC7eYsK0Xj8EzpYuGiIyN0kxVeRm2/QNuY6JLtt
         MqSlau3hBF63aVaS7AA+grjFa5ea+oGSPJQTlGtv8ITbiHWsueN5dN9QD1vAKpLMh/3X
         bh/mKIVt0od8gARc8lif9PgNCusqkNRmkNp4KJN7jPWSvgzC7HRFShKQ6F1zs0a0iqo7
         Wj4qRA7N7GHtjo+wZOJVNTtzWOvbrpRizChfIxeP1WNzkn3Mni1hyFjcSlDnLAN85o5V
         hDJh9azsYsbi81lJvUyGjn9wtlJyCaVUKYtw578T2tQZLDFDVEx3BpHphlnGXw1t2+xY
         hfIg==
X-Forwarded-Encrypted: i=1; AKwUvByk/O4eY+aGfbJ7fBp0bewG5Hh+3vbiHTWnXbw3pGpP9tNcD37a2LhjAG5/QTZ4J4L9lI4+weq3GKRqHEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjUyZa7dNZCItHLzMbsQv+le3gllz5u19febZWuoo+Y5vsDIq0
	eRzwSaSFZ+/SbLWJkzwfeSlLv9/lSgtFHErCyg1wjz6qpmBT0wbotYwkwsWyAG5zkNtiVummWjG
	7em9jELB45qFVzzJ8l3VQ9SC1i54xqQU1snwpvQNMgQ==
X-Gm-Gg: AYBFou0sb9EQS/sb9dfEphsYMUFXombZZRbJixttkVv47niazG+vkgAcXbjPWVp8ZQd
	xdzoE6DH8wjPPLJow0sdjH2GEUajg86JjE8uNJrgNBUfG1L1jCCm11K/S87YuDJFVJiqfYlCaNz
	c3gkcG58et8iwP0FupzZzDFDGo/2FbTewL9vYom5HSMd9Wnmh9SuDjQjRpijvwDA+/HsvpVjy7t
	vo1TXJQVUlOym7fLE2hZ8X2wCQzLgAuGBrJEjf61hpaoPNxb2sK1MtK6mmOBiJzxzKvYBa6dAJO
	mKQCu9n/E3HyeGUVPYyqDhaFNybnEa1Hd3az1RSYtd1VIKenPv/PonF2u5I0Y/A9WXRtewtFnRp
	3yeymLDG929T7jGYJ8HqVq9VfF+QyMEV18ZxRPFBlrnAGZMXPGH8+4OoOHQZsQ1OF4d5Xyi10UF
	pj
X-Received: by 2002:a5d:64c9:0:b0:487:91e:d8ed with SMTP id
 ffacd0b85a97d-48b12702290mr3229174f8f.2.1790923681806; Thu, 01 Oct 2026
 23:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721024236.14761-1-xb@ultrarisc.com>
In-Reply-To: <20260721024236.14761-1-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 12:17:49 +0530
X-Gm-Features: AclHuK9UOCVZ6vodJjvCC76-FwtaW02UpOlI0apEZivkAZ5yfpYjH_mX6sQE75Y
Message-ID: <CAAhSdy0fqbBTfzab1H96a5B469mzuMmi4c54opPXw1-+z8_Pvw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add SBI DBTR extension forwarding
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 8:12=E2=80=AFAM Xie Bo <xb@ultrarisc.com> wrote:
>
> The SBI headers define the Debug Triggers extension and its function IDs,
> but KVM does not currently allow a VMM to expose DBTR to a guest.
>
> Add DBTR to the KVM SBI extension list and forward its calls to userspace
> through the existing KVM_EXIT_RISCV_SBI path. Keep the extension disabled
> by default so that userspace must explicitly enable it through the SBI
> extension ONE_REG interface before running the VCPU.

Blindly forwarding SBI DBTR calls to KVM user-space will not work because
(just like SBI PMU) we will be sharing HW debug triggers between host and
guest where KVM RISC-V will have a separate path through the perf subsystem
to configure debug triggers for guests.

We (Qualcomm) are already working on a series for SBI DBTR virtualization
in KVM RISC-V so stay tuned.

Regards,
Anup

>
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_sbi.h | 1 +
>  arch/riscv/include/uapi/asm/kvm.h     | 1 +
>  arch/riscv/kvm/vcpu_sbi.c             | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_forward.c     | 7 +++++++
>  4 files changed, 13 insertions(+)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/a=
sm/kvm_vcpu_sbi.h
> index c1a7e3b40..53406b02f 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
> @@ -104,6 +104,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_e=
xt_rfence;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn;
> +extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbtr;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_susp;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_sta;
>  extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_fwft;
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 504e73305..047d82f05 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -221,6 +221,7 @@ enum KVM_RISCV_SBI_EXT_ID {
>         KVM_RISCV_SBI_EXT_SUSP,
>         KVM_RISCV_SBI_EXT_FWFT,
>         KVM_RISCV_SBI_EXT_MPXY,
> +       KVM_RISCV_SBI_EXT_DBTR,
>         KVM_RISCV_SBI_EXT_MAX,
>  };
>
> diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> index 46ab7b989..ed21239c5 100644
> --- a/arch/riscv/kvm/vcpu_sbi.c
> +++ b/arch/riscv/kvm/vcpu_sbi.c
> @@ -70,6 +70,10 @@ static const struct kvm_riscv_sbi_extension_entry sbi_=
ext[] =3D {
>                 .ext_idx =3D KVM_RISCV_SBI_EXT_DBCN,
>                 .ext_ptr =3D &vcpu_sbi_ext_dbcn,
>         },
> +       {
> +               .ext_idx =3D KVM_RISCV_SBI_EXT_DBTR,
> +               .ext_ptr =3D &vcpu_sbi_ext_dbtr,
> +       },
>         {
>                 .ext_idx =3D KVM_RISCV_SBI_EXT_SUSP,
>                 .ext_ptr =3D &vcpu_sbi_ext_susp,
> diff --git a/arch/riscv/kvm/vcpu_sbi_forward.c b/arch/riscv/kvm/vcpu_sbi_=
forward.c
> index 5a3c75eb2..8ac31b53f 100644
> --- a/arch/riscv/kvm/vcpu_sbi_forward.c
> +++ b/arch/riscv/kvm/vcpu_sbi_forward.c
> @@ -26,6 +26,13 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn =
=3D {
>         .handler =3D kvm_riscv_vcpu_sbi_forward_handler,
>  };
>
> +const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbtr =3D {
> +       .extid_start =3D SBI_EXT_DBTR,
> +       .extid_end =3D SBI_EXT_DBTR,
> +       .default_disabled =3D true,
> +       .handler =3D kvm_riscv_vcpu_sbi_forward_handler,
> +};
> +
>  const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_mpxy =3D {
>         .extid_start =3D SBI_EXT_MPXY,
>         .extid_end =3D SBI_EXT_MPXY,
>
> base-commit: b95f03f04d475aa6719d15a636ddf32222d55657
> --
> 2.54.0
>
