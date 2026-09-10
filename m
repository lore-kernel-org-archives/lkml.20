Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402A1489FD3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048755; cv=pass; b=YJot15jCMiPKAG0pnCkaV6yh9WA7DBCeuNCY9Sn11ICKmtOotjkGJ8mccD6bJbebzbxcdSPbRGSpTP6/0hYVcJCFQfwmgrHbAuNn6EH4kx0l/+Tvs5wk2w5ipomDNz9CqtGiUxSZKBCfHUa2BYqp5KfpcqVvLQtdWNUrjQILmqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048755; c=relaxed/simple;
	bh=ZZvvuoaYfIXmr8UO0wotjAdQWitg9LH2mpC2WJGAYbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o0ixNhshioSYqjMx2fOHeC0cpLSruV/wI4BLP04cacXORTD49eyFLCxZw4uIn/yJYi7fDGRBXGkD7occDrauyOS4Haj3g32Bp7HkBjLhNVjs8fQG7PMHTk3ervE247imhKvBxvdVXn352J5fxq0RInjhRuo01NBNpYlWpZJB/K8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=ZOm+TsBW; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="ZOm+TsBW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1479250f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789048751; cv=none;
        d=google.com; s=arc-20260327;
        b=mU9K/kDSPTaV/P3DnmHoi/yAbibkM+k47AE+m6AfkKSSRYk5dR2HDSdD1jCBaaVyFZ
         qPvIyUJJ2d8P2XkxaI167M/YL2GHlGULXfvf7PskY8W0W7Os0hHcLgS+u+Jot+IdZafi
         OM1IeJ1hH6j/zAEmFq0rmwCkNXC/6xbQrHuiwHYU7PVrofuajSq8Cj/Cgv3BAGd5cScN
         +/vYSESg6lg13opImT/qtrrrRdRjjICRAV9RFHiVTEHhlb3vm0ngVsQlIX9s9VkXss91
         vmmjvsiwTw2KBS+wMcgOfdONsOaHISNANnZzjqwcUZT9KnaC4ezjm/+1HPnEPfk3AUEg
         T+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        fh=t9FMslCz5OdfoNwfAS5g6kI8Eug126wUTaIqo/gav3w=;
        b=sg3atEDLvTVvOVcCrt6/92I2V4l0TRwSpguubnpw3tRO2o7lHNHCTIVZkE0WZT7tVO
         O1y+twKzv/Kdrk6shVclgShsIXnj2xqlqmyXWdSODv8sbGkKZmEcGvuKCgJL8P+mAGUq
         Z56BFFmLqma4ZeUFdvVg2aA7osZgwySQrb5TE68/l8raXibdCf1E6aIXJ10jmADijktP
         lq+NkXhAYOukq64a+gJ+X8XtTmfnK2lfRsGaZWQGVQqi0mJUmpFXrTN4P/6IOST+hG7r
         BoD2ZD+vQDz2L83SzpBLCWEiG7MR4R/izSooIvuosD1tjkf6zbk7ywO6lEk/uLqoiGwr
         oMKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789048751; x=1789653551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=ZOm+TsBW9E6FYiIdVN4eF/oW5j+SgDOQpPiZ8tkY4wK1H4belKr2Ov1LXuAdBTv096
         Wda8bSUSbXM537LBrFoA8lT8sbV7xvjab1AqlmdDwhnaDdBoqtCDD8Hq4FxKDZKYF+KA
         UJs3ohuadmzBsiJ02927Op6M8h2dZB6IrVP97e7tMvKoJ6gYYcxGwLSHAG8VrqWhHvJi
         VgmuOP3BT0H5ofYIuVW5I7E57mMlyzvVyUmJ7JHXQlq39f/btYhsZ2bocXl+hKoxwymx
         lq+FREiVIgfiv+yrTeS92gNkhJbliOKbvlVjX1rIojxU25SPtCGshi9sczB1YDsQ2J2R
         JsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789048751; x=1789653551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntUgUOcZUM5+aK8XwHOyZhsMc69vpZvSuPPgaYDDMnc=;
        b=f4EVoKyfQ6gVqtQqKg7rd2GDhpiP/VWudBQU5ZuLEbHgP7E0NvIwc4N6KAwyvmg0Ov
         lIyoCKgRYr83BkO+8UNWaqJmYV6cMe5u7yjnXGDTtoqjf8tu8NjtnD4X5dO2yLAGGgK/
         9s1Y+iHeV7bFhiNQSsx9+D0bPrscUD33xy54SlsRFaPTn9Gl3Y6J24DFt2w3jk2smBqY
         aJoLy9PPPfyko1RoQivyoUnCSgD+STf1R/x5E+2rjHTtkUTB6JEzSSrQELIiuTM9zfSo
         yj4HtbDfRxmf/gtYd+DbClnSljeQ6XFguwptZusTUPmwQdceDCFKNJVCT4A7lWa2iEdW
         Vhrw==
X-Forwarded-Encrypted: i=1; AKwUvBzJMGOAM9402AtpmjEpm9cWvT5YedDHsQXCcvkNSvau7c0czk+6C14fMT96+ZyQvStXxBYB0WAObWisHLg=@vger.kernel.org
X-Gm-Message-State: AFuF++lFJnRLv2O4EeO5qZQW8P6jpYsf1Q/oYo5f56JBnJLnWvlavBW7
	CGAFp2K5XdCx8QtyAscxnCBG2NXOjdWrVeFHO12qCxxTkmyFxOdaopxvfaH+kN/bZCXKb4yHKLk
	5viOtGqvjZerTEC3A1hV/ZSUVaXQWlLvEkuzbFzjfsA==
X-Gm-Gg: AYBFou2U1wUlHaIsLDPufKGbhAcANV5ZSz8mS4qWGnUhUwzBdsVkpeT0AqF9aoEA/1G
	rN6uTqtTnmzgOKWnG5YFY0clrd8hArDRyuxzPgRlwQe61YVX9dHIMEBaExv32EgbaE8Dt2cksJ2
	8KzoMFwqkr2ene1CaQY7L7PVygkPWXQb3KKx+wE7bL+hLxQLALhwPJ8AMkOCg5PnhSHjz2ydp7u
	je0Efpmpc8CTswsCe/jdWv1Qnxp7L4qcLhASPNfX7a0bDXj92m2GoCuZvoXpOKY+90pXTO654rP
	lDoAErtC4vuurmyibmouufxKCcGLhNA2e5wnv6L+DU5o4zXnDpGlNa0d/GaLCHH/FoGtxttl77l
	iDaNKZz6j97iBOjEMw8tEqo8pu/Jt/tlSpAaxfg2yqmym+cjEmn9UptMDERIPKUzEuJmkVMfaDw
	==
X-Received: by 2002:a05:6000:402c:b0:485:acfd:4fa2 with SMTP id
 ffacd0b85a97d-485acfd572dmr20259573f8f.28.1789048750919; Thu, 10 Sep 2026
 06:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810051544.3953925-1-xb@ultrarisc.com> <20260810051544.3953925-2-xb@ultrarisc.com>
In-Reply-To: <20260810051544.3953925-2-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 10 Sep 2026 19:28:58 +0530
X-Gm-Features: AcwNN1VoynwwDilW3Qq5_YgkFrLdSifis-TkUfgosx4SiSWNhFsAD_CF6I0IGk8
Message-ID: <CAAhSdy16n_zWBudDS0_E8xK=mhKBOvLMz00SRWnY0ArDkJF=qw@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] RISC-V: KVM: Release unused page after MMU invalidation
To: Xie Bo <xb@ultrarisc.com>
Cc: kvm-riscv@lists.infradead.org, Atish Patra <atish.patra@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 10:46=E2=80=AFAM Xie Bo <xb@ultrarisc.com> wrote:
>
> If an MMU invalidation races with a G-stage fault, the fault handler skip=
s
> installing the page but leaves ret set to zero. As a result,
> kvm_release_faultin_page() treats the page as used and can unnecessarily
> mark it dirty.
>
> Track the invalidation retry separately and release the page as unused,
> while preserving the existing return value so that the vCPU retries the
> fault.
>
> Fixes: 2ed90cb0938a ("KVM: RISC-V: Retry fault if vma_lookup() results be=
come invalid")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xie Bo <xb@ultrarisc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this as a fix for Linux-7.3-rcX

Thanks,
Anup


> ---
>  arch/riscv/kvm/mmu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 6035b5e..d189fd5 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -627,6 +627,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>         int ret;
>         kvm_pfn_t hfn;
>         bool is_hugetlb;
> +       bool unused =3D false;
>         bool writable;
>         unsigned int vma_pageshift;
>         gfn_t gfn =3D gpa >> PAGE_SHIFT;
> @@ -719,8 +720,10 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>
>         write_lock(&kvm->mmu_lock);
>
> -       if (mmu_invalidate_retry(kvm, mmu_seq))
> +       if (mmu_invalidate_retry(kvm, mmu_seq)) {
> +               unused =3D true;
>                 goto out_unlock;
> +       }
>
>         /*
>          * Check if we are backed by a THP and thus use block mapping if
> @@ -743,7 +746,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>                 kvm_err("Failed to map in G-stage\n");
>
>  out_unlock:
> -       kvm_release_faultin_page(kvm, page, ret && ret !=3D -EEXIST, writ=
able);
> +       kvm_release_faultin_page(kvm, page,
> +                                unused || (ret && ret !=3D -EEXIST), wri=
table);
>         write_unlock(&kvm->mmu_lock);
>         return ret;
>  }
>
