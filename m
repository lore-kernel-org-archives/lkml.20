Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C142EBDE9
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197603; cv=pass; b=HgkU3qj6BXwvNOdpZ2r7Zrh6z1768+z6CAxjo/QXRHGrTpxb0OJsTmClAJmIqLe6wPJBpzCnOghVvdZD5O4F18+8MI3d3DkWX14jPBdgrFcGAJbnGhedj1WXWSa+7fbL9i7Pc3jc2K4lr2tkgCyfFiBVtBe6ElqF8tG1tLqDuTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197603; c=relaxed/simple;
	bh=96QqdAH+ut3FoNAu5P8fNecmY73HgWuZtIEXkBWpqh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=enEzVzUzUpY7BlIcZFO2lIzWeJZ/nupKGuYlCqaPSPsqTqIYyI1VLHMBT5putAOjKHX37UUXTjgmCKa9n5HB2eNb121Jju7w/u+SIX3TWOosrn+Rh7LLPCZjNAFd4pikdurs6ia+SUdAEskArxjHULnIf4Jpm3NrCfdU7/OCs0w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=ppJTEwSG; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="ppJTEwSG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1553033f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 00:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789197600; cv=none;
        d=google.com; s=arc-20260327;
        b=sQqaHjkVuo+J7H24+AH37oKUwb6EyQs87BfVCDvHPb6xYsHGJNCzg4CX/LF4pcQkDX
         1PlxUQa/2y7GDfnG4k1R6o37PREFMMUDhv5gIPwSq95vVvRL5JN8nBvSHmJmliEMuLKE
         1SK7NIMbF/NdxHb1RHl8LFO1q01PBhIb4bpWu+DvnP406b7mn5ZBsURMAkUaRa4LFb/q
         33JntdWGgYmYYWD47TXB8YLyaHsqU9Jex3OxgWVDh4XLl/KRUJalTxpP3Zza+QMuQi2V
         VApv4gfy2lQIALbqERHwpYD1zWdrh9xwY+6l0Y2GJ0AWOmgdFn2wEKVK0F6Dvz7kjuaO
         aY9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        fh=je/iXtVKa0mYtqLIQzaKgQU7vn+lPc1w5ir+WaYbBJw=;
        b=hmG3lJmNklCGrkPl70FBrgYZZJhPDp6bUK//Ui7Eqrw2jaqnGlXx6+dVvSN3KB76mq
         JZ+0B7MYwumTMtzoE2BhORiGpczaZdJIpCxIyTIlmD9W184NeGJgTPVYNbKkUg9Mw70J
         c9GjUIlaF3aIggpUR+rozwuZ5CPaBgP2UayhPtU7J6aDOYY0ZbpaF6T/0etZaND+yrgm
         1gVfC6BfF+ZcEeuifF+dmIDm/6IzOPu2x9ezFIw2D6U+nocy2K/j2aeV19NC+nplnpUZ
         MSUnubSnMpPO2BOuN6YXihDAnIwgB4AubJQxy577JgKEn738BYk5mJJx+FXBLS+VuAv3
         5Z+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789197600; x=1789802400; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=ppJTEwSGUgr/ATI3/8AmaI/wzOXHMeTZiqeuiisUik103k4Iuk36bllz65KzLAtR4A
         Ns5xKxVsMblItnNY2rNwGE8nQ/EkjiUpkfOSN76BGWUx5zwFmS/Bp6ll1TCde2EpXViv
         4AItdjmAwN7Zd/bWaRfGUjIIPimTei3mrR0Cg0ybvfSi2Wj7B1LAhDFhk77Rj1OJXP0X
         sWIx+OSL01oXjZs4HI8Hhogi7/vrVqR+mFECnvX9C+1OVyRvu+e7FxX0mJS5ErIKhxiG
         dOimFqpJiMrYrSQ2BA/nTx79Mbbft0YGPBux24Zp1acD6XyeyBt3Y1TVW9sLc2a5b7je
         gjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197600; x=1789802400;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HCXtMkwPRPt0+8i1UnJyzIlexbsOaqziQRyoO3VN8k=;
        b=nKXuIKGm2pyMD+JJs7UtuKBTyo0V5Uw5uhnXtB5/PCwhX4M3KTzD49Qrfm54VW6NmH
         KQkPgVTYFlClXojLk1PIB0QWaVdMlJwFGXC94ExqaQCtqJs2oTDQg1D0688hhZmQG2tp
         IGO+lfZ5ME0fMlbG0LFTzeO11yMdPNy/EB0pVAOKeOh/XnBIVO/FqkkY5EniPApkWlze
         0kUY/mIWvbHe8RLzbOPHAVRUzIuQlCYIbj1sV0wuCUSI0YUTMaAukuoSh/EM/bmhQ/LU
         oSzo7xacBm8lQ8QadBUc8KZXlVaPOFxsr1Ky8rgDbsJ6SyW6n3i5z2X8lm+eatS2j8rM
         CeAw==
X-Forwarded-Encrypted: i=1; AKwUvBwBTfA1uBX+MLuv2ZCrEf2wU/auFlyV1S72OhYajgISPxQ6eR7Sq7DtxrW/kh2f3HxNvdURp+kprUSWg4s=@vger.kernel.org
X-Gm-Message-State: AFuF++mK8SD7Ml6hAOh9fxu8Xge6fDPQiVrgVrJUuD31tdMfngFCUmMN
	FCt+E+Q/OWux//dZimsC6N6tLJlCrOQBOmdJJYT8h5DlJ43bDrIp8NfaanwA/zNZYdCIieLLJpS
	wo3K9uS0kWv7y3CmApkdtTHM71vdvZhWbTyvQl5GLOw==
X-Gm-Gg: AYBFou3GZVScCgIM9UgoTLQiJUKdLjqgI4zttUda1wh6s1K6ybXXZniMyRXgF6KJmQ0
	xK6yIhCcVxjXikGe3ul/1a/QSfXW04IcuHXoPvyiSxg+SWfr4Ie1a61oTecA8VxndVZ0AiYbZOJ
	TNUhnCGwieZhEJIH1uCCWwgnzuQTV1a6kJ80EFUoAC21KrTtyYGnKU5cAz0RPXkpbcj5lQ162Hv
	DnYwFE68PQvZU2YZHFyDFdCC/Taw7/S7oGHatsbcOBDl74c7NzrPoDceTGopete73ZN4sgQTTvk
	gqxtObNF4Rm5NXG5gfdANnxlL1QoUtKYMG4YdQthqEGymMrhE5UUSEnRCO0mS4xxwiqXKTMJH9Q
	0EHDo7LUG7OEpsHFe2iC9CJ4z0PzEPuvuWxsmRSlGoppcHS4gmvo19UsdlQ+o4dtiMwSrjgXMAw
	==
X-Received: by 2002:a5d:5f44:0:b0:486:ed36:bb8 with SMTP id
 ffacd0b85a97d-486ed360ceemr8264961f8f.29.1789197599622; Sat, 12 Sep 2026
 00:19:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
In-Reply-To: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 12 Sep 2026 12:49:47 +0530
X-Gm-Features: AcwNN1VonCRcgUOPNOO0ybAk3-QpJzTjEpr8-CCE2ai98LUN-VM9a568vF76B6w
Message-ID: <CAAhSdy0cnHwfs5hRfZdq6WAzrEobqcjYMuv1oAmvRk2pi2zkPA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Publish NACL HFENCE configuration last
To: Pengpeng Hou <hppiscas@163.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:37=E2=80=AFPM Pengpeng Hou <hppiscas@163.com> wrot=
e:
>
> The SBI NACL interface requires software to write Page_Number and
> Page_Count before publishing an HFENCE entry with Config.Pending set.
> __kvm_riscv_nacl_hfence() currently stores the pending configuration firs=
t.
>
> Write the payload first and order those stores before publishing the
> configuration word with WRITE_ONCE(). Use a write barrier that also
> applies to UP kernels, since the consumer is outside the Linux SMP
> domain.
>
> Keep nacl_hfence_mkconfig() unchanged: setting Pending in a local value
> does not publish the entry. The shared-memory store is the publication
> point.
>
> The issue was found by our static-analysis tool and manually reviewed.
>
> Fixes: d466c19cead5 ("RISC-V: KVM: Add common nested acceleration support=
")
> Assisted-by: GPT-5
> Signed-off-by: Pengpeng Hou <hppiscas@163.com>

There was another patch from Zongmin Zhou which is relatively
more complete hence I have merged that one.

Regards,
Anup


> ---
>
> diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
> index 9aff03c4..c5c4907a 100644
> --- a/arch/riscv/kvm/nacl.c
> +++ b/arch/riscv/kvm/nacl.c
> @@ -5,6 +5,7 @@
>
>  #include <linux/kvm_host.h>
>  #include <linux/vmalloc.h>
> +#include <asm/barrier.h>
>  #include <asm/kvm_nacl.h>
>
>  DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
> @@ -42,12 +43,15 @@ again:
>                 }
>         }
>
> -       entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
> -       *entp =3D cpu_to_lelong(control);
>         entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
>         *entp =3D cpu_to_lelong(page_num);
>         entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
>         *entp =3D cpu_to_lelong(page_count);
> +
> +       /* Publish the payload before setting Config.Pending. */
> +       wmb();
> +       entp =3D shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
> +       WRITE_ONCE(*entp, cpu_to_lelong(control));
>  }
>
>  int kvm_riscv_nacl_enable(void)
>
> base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c
>
