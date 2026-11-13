Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794548177;
	b=nm2MopzVRXg+iB4eA+66UizvFIn107LEiEA/7QYPMwKq/LFj1DlUr2u8Crh7wKMcx3mo
	 fkyDrK9JyydGNqsZemTQo7i5ZWTokynXkK21x3nBz0mwD3vpjPibrfH1U8i7id2y1OmTZ
	 ki+34wXuMeF1aWrlNjBJc4TePv9sAEwHbMZwuNXLvyVlyiMbi5yI6l7kWjcFrgo8/12+L
	 mGNMCFda5l/AfrLcmQvNd+t0BTKKbyoI62kZimLwhMXtiYnGT62TEDw9i43WUNqRt6F8f
	 zfcRGxlY6lNxof167YVXPCerQku71CnW/mJI8hjRd4nSuOhaRxvIvz49bjZWii0tu1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
	b=PxZKt0leV+wujXwIPZ+KfW8c6mn0R9CbEhcXSQxhAfMqAplShJyhTcPeL7ws58gNPsE5
	 TcuZOcQn0c4MnIQkjKitv24Fb72RBTz2qUX4HN/kB5kRG3hEL1f0cmhx/bCzhZlQ20frw
	 a539KcWcdq58E3rkyVdvhWU+SfZR+ZaY6BTJZOzoycPH9cJkscyp4eb60K1Syjrhd/IPS
	 d0swqcDp6cCEAqm5EU5Kms5gInrAXCQGHjvc6DEsVkW2A6oZ6wiunxnGU3/qNjloaRrey
	 ZPn9mNvoAIWk+5n5afRRK7juUASK8YMQlv4t/mfvutyqjScXb8ndbTD47nZC9WFIZiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=brainfault.org;
	spf=none smtp.mailfrom=brainfault.org;
	dkim=pass header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=QjTBOvyJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A84606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A84606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=QjTBOvyJ
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7348195e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:36:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548175; cv=none;
        d=google.com; s=arc-20260327;
        b=l2ijdcE5Ll/ASIG/2TMuiTOPECJzyisTX0mwIcNsdmg9gZLHz8MPlttDbrYyvMbZD5
         kZ6qXqY12fZI1PlJVuHOKbZ7Lgv7WP6kQA5XIV4zBGuQC76/JlX0F1d5Xng6AXlSUxAb
         uaef3eneVC4ROemmJe73JcBDN/HpK1kgWNs5uXdF4/D3pG8mszomwrJF1pc+9IR/my3o
         2fFwYIs4zn/neE4ySQyQ+6sbxkooJ3bXCZU38Vf+0xew8iOGubzb+v0KCK2d1g3psIcE
         VJgPcnmftsT71KrH0dKOLYXk6cOYsqiLq0jU2h7bFwp9Xit0sg3OHcHv0cg9JhOLvAyN
         we7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        fh=yrIwxg1mfI4bRpfUAaGDOVSRYwazcf0HvabdY9UtLsA=;
        b=WhT6vXkMLtn75LMhg1zYalq+8UCq5jzyoQ+lAZqUVUa1dfk+TG4kgAjA18Q7onWIwr
         2ZGa/hsiLbp089+Uh8ayXzejv6RazF++3El01AU8lu8m9V4dZgiBnrmj7cb5eR7p/T9V
         HWJ8PyI/TTu+ud8USn1i7ExrHD9hYJgydcmDhTM5I8ZZJqrf00Z4ZctihLVQWh1kdm/C
         MvdoB2o3lSo+B9OaJV7UdiYl9GmH/tyUiIkUfIwNp3Ami4rlFjQjI4QsQC3vVdcnggGe
         1buYGiOcBGmR6/69I5yhwkbnfnCPpqzyXQYjeIybpcxgGdlCX5OFfCLiRMYSrHqELFDX
         cbqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794548175; x=1795152975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        b=QjTBOvyJvwyTWvQ7fi5ObNrUO1Wr3gd+m3ES7oW4jzXaXXBxX9l5QSHSIPC3Kp6H4u
         z4/kLkujsOGxCPvgPxkhAg0o9G4SZbcID7VUSNZZeF83QaOM0JHWfT+CPS79Gkjy96aH
         GWWoC47j8ym5do2l9qTj1hA4NIbnbuIiQmYDGitUlr6wX87r+gQdsz4T+eMw69Ah/BBt
         IaCBgOvPmZDLJelqYV274qMHO4y9qWTVQGpOW3mSsXSs57uZPPDLq/5JeRz4cDXRW6ZM
         tnNIA06XvBV0hmbBP89yVhvaum/mA3+9IS8TpNpSvAd+xE+GKXNHtCFxLXBO8roJNp8O
         SIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548175; x=1795152975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Asn5k3wB77QNm+ii4GqJgfJg46vBWMInhGMAcW/l5U0=;
        b=DvZFn5MHF1C43l6xkItDJc19Qz8pkh2geuwMQRurStBkLZ4FOrlwd6/Y121ug64j0h
         3yYK6GDhFxu2wHiG2KeB1QNvWA6ax/SAeMDBFyRYft2G87oOs83RIspUWnHcqLqsvqbt
         jUCwB7WTQfr2o19eCR5iCzJnZ/aMJPlnCpxil193ECPTeE010QUVP5ECsrmJjEZvwZ9k
         v3c++hQRkT0R0GenX6Qc+N3KwctfihE2F2IOttPdZwB3Es5+unTTvnPXbpn5oFsAGyzG
         f/sZ+SIntLzwC7z0m+OKx8pGGvc0wwiIf8Yf1f57G1m0+607mj8FMhGDSPWNOqVW5gJQ
         wRDw==
X-Forwarded-Encrypted: i=1; AL+hErFJyTkYnC7PFyQdjt4vnYpeLxOMkH4fmIwk4/VfLeHHMhExyOCG90dpFyeQQPihQyo/FqOkkP0ilogngiA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VPZBZPzxgWI46Q4Gn7dSw7MIEXI+/kSsNnoary4yoEjyJJFbe
	WD/8DnlgQ+Uu/ahmfez/aHRaucMhItkde1P4lZZnErgEaS779DRven3pObm7vrpSSXf7exVCFYR
	qBUC87cxj0Bv6shX7n84UOZZ9gCMp44DHmsfLYE7w8g==
X-Gm-Gg: AYBFou0aJ518HrDP4ioIqbCU0aqX5tS0ZnkA+/YmjVXGayADJExJPzpjqRZw8lCFekc
	/rKHxL9g0Y/a6FuraasIEgUjqyqZuWzf4+/79l+udx3rzS2INug5ibCs4J8sSTivQJhVg1bVceM
	7r8ON0pwDj0zqSC+UGzJwg25Ef0zB/WuB5OgYAAM8phRU5kuYCHYcDMDtbazjjBeDE5IajAbb3v
	pLuCk+Sh8YaFOfr0W8iv6kOqnJ/XIUtEjZX8HvPXCaJZ7YhqA2NE5BPygL4iSB6vVuTFwn/2RF9
	jmYtzYc7jXW2DSzCpHjVqRXstLVdXTId7KVUe901LZx2xh+NX7Ji0ehRa75M7WcCAFZ/KxoeFIk
	yIHIF97a5thcTo1YhAMMryGWAy5kIUWvHGDliUn8HYAhIgOkk+QAC6+Q4SsCtURaMS6lelsC7QR
	CD1ORJqSFczywjBmA9K2CnhLvARKU38RVYJw2PEiEeuZCDpbYtF7lwMxww
X-Received: by 2002:a05:600c:8909:b0:4a1:f720:74cd with SMTP id
 5b1f17b1804b1-4bb55a83e95mr22775035e9.24.1794548175140; Thu, 12 Nov 2026
 21:36:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260923091658.1421475-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20260923091658.1421475-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:06:03 +0530
X-Gm-Features: AclHuK-hB4uNWUkZ5GD6or_GmOhWyIPCmKZQ4zfjMNF_IuFbt8PDj-n3XQqHnik
Message-ID: <CAAhSdy0Fp5R9v1O7gEoVriBBfnSapTgQ52ZLn5+QJOMxnn1z3w@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI
 read-and-clear operation
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: xb@ultrarisc.com, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, 
	graf@amazon.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 2:47=E2=80=AFPM BillXiang
<xiangwencheng@lanxincomputing.com> wrote:
>
> The TOPEI read-and-clear must be atomic with respect to
> interrupt injection (set_bit in EIP). Otherwise an
> interrupt injected between the topei read and the
> clear_bit could be silently dropped.
>
> v3:
>  - fix undefined eflags
>
> v2:
>  - fix patch file curruption
>
> v1: https://lore.kernel.org/kvm-riscv/20260923070332.1376132-1-xiangwench=
eng@lanxincomputing.com/
>
> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> ---
>  arch/riscv/kvm/aia_imsic.c | 42 +++++++++++++++++++++++++-------------
>  1 file changed, 28 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index c1af23e79ae0..c440088651ec 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -607,26 +607,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsi=
c)
>                 kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
>  }
>
> -static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
> +static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
>  {
>         struct imsic *imsic =3D vcpu->arch.aia_context.imsic_state;
>         struct imsic_mrif *mrif =3D imsic->swfile;
> -       unsigned long flags;
> -
> -       /*
> -        * The critical section is necessary during external interrupt
> -        * updates to avoid the risk of losing interrupts due to potentia=
l
> -        * interruptions between reading topei and updating pending statu=
s.
> -        */
> -
> -       raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
>
>         if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
>             imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
>                 kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
>         else
>                 kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
> +}
> +
> +static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
> +{
> +       struct imsic *imsic =3D vcpu->arch.aia_context.imsic_state;
> +       unsigned long flags;
>
> +       raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
> +       __imsic_swfile_extirq_update(vcpu);
>         raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
>  }
>
> @@ -912,12 +911,15 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *v=
cpu, unsigned long isel,
>         struct imsic_mrif_eix *eix;
>         int r, rc =3D KVM_INSN_CONTINUE_NEXT_SEPC;
>         struct imsic *imsic =3D vcpu->arch.aia_context.imsic_state;
> +       unsigned long flags;
>
>         /* If IMSIC vCPU state not initialized then forward to user space=
 */
>         if (!imsic)
>                 return KVM_INSN_EXIT_TO_USER_SPACE;
>
>         if (isel =3D=3D KVM_RISCV_AIA_IMSIC_TOPEI) {
> +               raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
> +
>                 /* Read pending and enabled interrupt with highest priori=
ty */
>                 topei =3D imsic_mrif_topei(imsic->swfile, imsic->nr_eix,
>                                          imsic->nr_msis);
> @@ -934,16 +936,20 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *v=
cpu, unsigned long isel,
>                                           eix->eip);
>                         }
>                 }
> +               if (wr_mask)
> +                       __imsic_swfile_extirq_update(vcpu);

The __imsic_swfile_extirq_update() also calls imsic_mrif_topei() so it is
better to pass topei value to __imsic_swfile_extirq_update().

> +
> +               raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, fl=
ags);
>         } else {
>                 r =3D imsic_mrif_rmw(imsic->swfile, imsic->nr_eix, isel,
>                                    val, new_val, wr_mask);
>                 /* Forward unknown IMSIC register to user-space */
>                 if (r)
>                         rc =3D (r =3D=3D -ENOENT) ? 0 : KVM_INSN_ILLEGAL_=
TRAP;
> -       }
>
> -       if (wr_mask)
> -               imsic_swfile_extirq_update(vcpu);
> +               if (wr_mask)
> +                       imsic_swfile_extirq_update(vcpu);
> +       }
>
>         return rc;
>  }
> @@ -1050,9 +1056,17 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcp=
u *vcpu,
>         if (imsic->vsfile_cpu >=3D 0) {
>                 writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
>         } else {
> +               /*
> +                * Serialize the EIP set + external-irq update against th=
e
> +                * TOPEI read-and-clear path so that an injected interrup=
t
> +                * cannot be silently lost when the guest acknowledges a
> +                * different (or the same) interrupt concurrently.
> +                */
> +               raw_spin_lock(&imsic->swfile_extirq_lock);
>                 eix =3D &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
>                 set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
> -               imsic_swfile_extirq_update(vcpu);
> +               __imsic_swfile_extirq_update(vcpu);
> +               raw_spin_unlock(&imsic->swfile_extirq_lock);
>         }
>
>         read_unlock_irqrestore(&imsic->vsfile_lock, flags);
> --
> 2.53.0

Regards,
Anup
