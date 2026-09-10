Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB4D2DEA89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051654; cv=pass; b=HejAyQ8xjsdst0esVaD32BHd51O9PdglHkv03PuL9X8RAOgDxo3kFAqtWU2SZsuaT2Ft/FjCbiNLTlfpAwJHOpvYScyTvoWvMAGlpRwzdYdi482EB+T6bQw+rpvDWKfkVZpoYTdC2DlN9MuGu6tXK1etgHd4tGJbg78fZZJmML8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051654; c=relaxed/simple;
	bh=Okm/jzRAvTBw58BaCq0sxyEyxRDfCrz26IinG233cnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZsS0lPSFJW0vDenCP06xlFQ0X2zBIOU73KBcdyFefQTddKlY1eiSzKPBlB/un38TCluZdmAOaclg+KC++yffB+8AutVCiiQDPCE4DKLKKEGgkbKbagz64aIJSrZy/wAqEnTjFZ6a1IEMmMUUXe5499tkSK+NTwGo61uYh3ETt4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=u+Vz9SeE; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="u+Vz9SeE"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso1262491f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051651; cv=none;
        d=google.com; s=arc-20260327;
        b=Lx+2Ej0dlLtacNPoF77P1/J9Fc9YkXxG1IVIVWapacs874YJHXfxtqNB3N4EgfaXNd
         XGrIaU5rvxKMmTg/g7u1JxwCQ8vOiBiWlIQvbvX4UgNQciABuS/ykQe9MjLdviNsxNNl
         dDDesJa203xM4tylM5MkW6c+SdsM35Ac+qTkmnsL42JGEb9KvhpR/ztbFovtRMApxpoV
         zyapemR02hmY4G53YEDSOvHYARZy3dCN1P/FDGbzY8ocw1mHGXpcfL1Aa+kdPZa2mNrO
         WL0sJgDsxOSHsfC/28B9RdF2JXoD2NGRK4E2jqOUBczfjuZdelrpzKgvP22I066wQS0Q
         xbjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        fh=YIWmZ7NO4rqyiEo6py8IxR1JsaU9aASBPUX3tHXxrf8=;
        b=fuieZ1WDToGLYv5JLJL1QvHxXiYEm5ll7jDTacqi5iOQjiYgu+4TjpOS5nh8SyYOYY
         m1wpN3iKvDGhKE9Nw8WRB5LJXL1Z6/hCWkOC4Sj9Muvi8W9IHkSEkQr+8pQzSMWATT4b
         WEZInXAsPG0OB412C63uND60MpQKNRaFFetWNVzqXsg1yTGF3Sdmp98rk1gZAastsDGS
         4j8AsPj3gVhJftdaVXyCxMebGxokxOYELk8Sqk7Aymn5c6WBwX6ptizpgVYdszsm5dgK
         11LYonfUXZoDiPlBYNyNYRTDdA0auW0VV5WzcCmrO0kqxHcPfAX+Fx0K7ItLiMUHTFvY
         a6UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789051651; x=1789656451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        b=u+Vz9SeEUFgLgqvkphmPxt2MBqMzqo2OxbN7B8UqfxONUYOQJVwXeVIKa9IK4JcOzk
         MTb6s46WtcMwqEH1r9xVKf+NL/Wy+ZYsHO5Hq4zKo2zX6mZ64vN7m3OTv4UgNJf0pwsi
         8KnOFF4ujhBHIaHVOH+UeGooqTgFWB6Vw+FzHX+MTClIAfp/rpzhD+lO16m7jRQkzfAK
         VJg+npsIOwqMNuvHNtKrVNdHTibNcVYECxP5VhMrXQ54WQ3TSdvauiHYb6clYzBcZSAw
         wg2WRlFlw/Yi1vXq/f4rEDaIknr9jT4lQtSgqUtTxTkTyq1SurOkFKm//0VnAUm6S8BM
         q3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051651; x=1789656451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Fj+UUPwjPg1SwSshTqSVQg8NUJ6uD77121d863dA0c=;
        b=lY7aO09tijffaW7yHehsu+fVj1iJoqbPrlU5K2NjaDNH0gM5DiqdXPdGuD+wfMPbdu
         iZMDiUI0GYNyX/ZY7iazB1CbRwWGvc64B/a4iFnpMXzFqrXF71wyw9mWTD6eiGNlG2w2
         jrvW4hratzrNqpMXImWRdUyoglAg9tn/mvzHb5tfAnMv+o4jkTrhTfjpgyFigZtFZa9/
         wQRRLBLtIL0jJzPcWyvQYKTuO56BdbS20lD25ZmqRhJcZYj5nbLN5HagkMmEJL2PMUk+
         MFo/UB7EqNFRFo5/GopT5bA6IpFEIkyuegZ32FuT/xGYgEw04dzBO2V/oAjKgGdlRjDh
         U04Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+f/tXAf8gGgqtsQ3PBIW84FpzHfSW+pI8werhJRTqRhS0C0az9vhZMuOa/39p84mtmu5J48Q3hOKlEi8=@vger.kernel.org
X-Gm-Message-State: AFuF++l+Xr7mnNqj7KLAKAmSLGInKCALGw1HLI8rSrnodAeLXciRVTXH
	4iaLjtUZnR97Dbj3ax+Pk4Mcoo1gX6HPmiNLkFg2WKrmp/KYU0GLt+3N8RWhyFrS3SjKW2xht0i
	Z94vSZgBPj+C0P9DoWlICmY+1aYQNU5Yh8MA98fbphg==
X-Gm-Gg: AYBFou3gB8bZKAwsQgIcZ0T5jGOaKOY3KDEo2itgf8olXPcumRJUNPfsWp9bZ906f8y
	9NrUxuoAUHIN/sHhabPpL8g32wZypdPm1LC15/MvdoZDsCDmavMEJarFPN+UZzYEKzAIXoLAKoN
	I8uiEFuga1kLQ3u3Foqe3BHDZ05Bcd9bzKEr9fBgQLrg7aCyYyrlfqU2swwkiHhk+IYVkR1ktzf
	LFwg5uslYWwZ58df3aoC0JqPKmcpZvs1ouKDZ2KYHzbrN4xr/F9RkE3nrNkFTbZ56E1QyaKv2pF
	Jz+I95E5WuXX7vdeOPEDIBG1hZRPSl8V+FA3gCJO0lmppgJEAwwm97WSLh+1N3u+J9Y8E1SQD9B
	tC/f7RnxEtpYq+zGnGUJFndjJHyQ0NCX2nZYLskt6ycYsV7EgHIx1Tbo9iF2JluXxRVRm5+7jMD
	c=
X-Received: by 2002:a05:6000:4801:b0:482:f61c:7cdd with SMTP id
 ffacd0b85a97d-485ba5ac39bmr18503655f8f.4.1789051650755; Thu, 10 Sep 2026
 07:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826075009.68952-1-min_halo@163.com>
In-Reply-To: <20260826075009.68952-1-min_halo@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 20:17:18 +0530
X-Gm-Features: AcwNN1XuamBEFO0Lo4789f27od5JxTL3ZDB6v9YGVoHyrw05uNbK6gYYJBs_SaA
Message-ID: <CAAhSdy3dymMWApBRrSw4YveTC8we8d2QaQ_3MHM0rp=BeP+AZg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Fix NACL hfence entry update order
To: Zongmin Zhou <min_halo@163.com>
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:20=E2=80=AFPM Zongmin Zhou <min_halo@163.com> wro=
te:
>
> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
>
> The SBI v3.0 specification (section 15.1.2) requires a nested HFENCE
> entry to be populated as follows:
> 1) find an unused entry with Config.Pending =3D=3D 0
> 2) update the Page_Number and Page_Count words
> 3) update the Config word with Config.Pending set
>
> __kvm_riscv_nacl_hfence() writes the Config word first, so the SBI
> implementation (or NACL hardware) can observe a pending entry with
> pnum/pcount values left over from the previous use of that entry,
> resulting in incorrect TLB flush ranges.
>
> Write pnum and pcount first and the Config word last. Since the
> consumer is an external agent on coherent shared memory, use
> WRITE_ONCE() to stop the compiler from reordering the stores and
> smp_wmb() to make the parameter words globally visible before the
> Pending bit is set.
>
> Fixes: d466c19cead5 ("RISC-V: KVM: Add common nested acceleration support=
")
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch as fix for Linux-7.3-rcX

Thanks,
Anup

> ---
>  arch/riscv/kvm/nacl.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
> index 9aff03c4f667..a5cda9a65156 100644
> --- a/arch/riscv/kvm/nacl.c
> +++ b/arch/riscv/kvm/nacl.c
> @@ -42,12 +42,24 @@ void __kvm_riscv_nacl_hfence(void *shmem,
>                 }
>         }
>
> -       entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
> -       *entp =3D cpu_to_lelong(control);
> +       /*
> +        * Per SBI v3.0 section 15.1.2, the Page_Number and Page_Count
> +        * words must be updated before the Config word with its Pending
> +        * bit set. WRITE_ONCE() stops the compiler from reordering the
> +        * stores and smp_wmb() makes the parameter words globally
> +        * visible to the SBI implementation (or NACL hardware) before
> +        * the Pending bit is set.
> +        */
>         entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
> -       *entp =3D cpu_to_lelong(page_num);
> +       WRITE_ONCE(*entp, cpu_to_lelong(page_num));
>         entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
> -       *entp =3D cpu_to_lelong(page_count);
> +       WRITE_ONCE(*entp, cpu_to_lelong(page_count));
> +
> +       /* Ensure the parameter words are visible before the Pending bit =
*/
> +       smp_wmb();
> +
> +       entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
> +       WRITE_ONCE(*entp, cpu_to_lelong(control));
>  }
>
>  int kvm_riscv_nacl_enable(void)
> --
> 2.34.1
>
>
> No virus found
>                 Checked by Hillstone Network AntiVirus
>
