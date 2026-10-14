Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B7A4A6881
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014608; cv=pass; b=SUI0Hs/s3UESqHk1rnM7Opxty8PDG3eM76mbBV4bZ3hfgVY7A1kb4FmDEml2BMithJOwzrAvDKg8jfvEbD5sAEV+9X7fT8otrVS2Gei8uhDRMd+JUEXgah2qlvFy/y68F3ScwQJQMM//oQX7QtuVpveFS1Gmqo+ALvTxRVk6vcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014608; c=relaxed/simple;
	bh=Sb/58QriJWaMhTgvU3eln2zuouYG3sux3/AAyVRoQ2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VlxS3IDgQq9LpEMwsRxZKMdHcYrkKlHK4pzPvUYU6PFlg+D+urBIVN/vJfuSIU2JAGkN6Sn7iOPZINazm2izhvZaOtJuv49N4evW2bbHIINg3u0iZgSwQjr38uoxmTMqZ7NQ8vmDmSO4yVIQbcZef8ZcAOmXcC3dXx3888pZ+fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BoPayPDh; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BoPayPDh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso219a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014604; cv=none;
        d=google.com; s=arc-20260327;
        b=jcjVzj8rzxdP13FfieNhsHycs9jv3oFgiN1PExDbD3ZJzMS+GL7MnYVkvs8xPxB0ZM
         WXkZalujjlef6b2hyM3J8BuLc2WN0g5eDsSRApb29FQaoXi/eejGhxIt8WOZsdKUZpRl
         C6jLExyz9u1L3OC214BMe5z+/+nlDsEy6CQAq3Q9aMUxFnjrLArYoJNmKP8jsWqhBo7a
         bRysp7xApkaY7U7HbuqLGRIq+GhrXfyrKqS1mORFSim9JbX+VxHGGxCyKPNr96ojDJ76
         5WK5l6e1pGiZqDQGfxsaxc/sfK7s5vkU3keQ/WJOaOUvihqmPqJ42r0VSwGVcbgY9fON
         ndgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cqDh6SSAdrnUIksW3iYI4C7alV8nfaKKDKs+g1eoZic=;
        fh=i8x6YIq3CWPjjayC1WI4+55aCqIWhtbjh2jJ8n/54Kk=;
        b=fO9wnU8Ls4ah/BF2dTe+6KaRmIaKMLcsRa9HEyWEaMfPU+fT1kHiiaX9wjCfZVZ46E
         tsTcjPtpE5bM0W/DsJvDgWDC7tLet9IOIoUGpZgTNcn525eb2lDkaNgUrnADKo9mE6/p
         51UiEbtoWBXk89KpkCAtM7CMeQW4fcyeelwe0ntCNVqbxRTncm+lz64wYVdO0lOXN8uY
         x4MViskLFvR4lPqluR+vUJ2TmsevKrxQ654yXCTjlti83TnDoddXgW491Z8n4/1tEq+u
         DBSCrlEpX+iuIRjxw4jNSjMoGdgjfixZ/DR+d4Y/zVGFqrlybywC9tD/vwo5JC1cLQ+h
         d7Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792014604; x=1792619404; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cqDh6SSAdrnUIksW3iYI4C7alV8nfaKKDKs+g1eoZic=;
        b=BoPayPDhQaQmsd5UCdguiouW6b7guO9FNW01cc84QQ4wWkZJHONvrzpSIiV6VPbBe1
         NkP+Qt2145gDpkm2htpwatOWkXQs2dPW2/hyUHn9bP3Rg+eQiJARBgPyWNzfZ57YCcQw
         RmAF2kS3jtSvf0bgkD/uu4Bw4pJHj154nbcwaI14dNo0apJN+a/aWgCheyCq7FjVXY/e
         z5OjUxMSIk6gX8+kYaVwrXrdBbTg5AlPFSZTxWpq31QdcC5vUj5MFyCyMoS7akBWjPo3
         PtWs2DZtCFd0ykbPPij17ehwCCVGf7sjQ4j0Xh5O2ithP1AJGQpBeG2jlCsHxkCzRoHL
         mVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014604; x=1792619404;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDh6SSAdrnUIksW3iYI4C7alV8nfaKKDKs+g1eoZic=;
        b=1G7Co7lu7ybXs8vmMdJgY1iNaYz2N/1YCEgI+UuiM18wtDCdSRkNqMdoJmAjwzkxnv
         H+UQE+73sZ2t+Vbsg41w+3sONbXxKj7By+9DDCVnap2IB7VR3QW1Vb9GqsFZ38Wr2gOT
         FwVUw0M3NrFNIPrfZPkB/Zlsda2E2o9Qa7Ei3KyWOeySQ+srtGXPZ9v4Ba2cDwKYTklZ
         2CGsSRuGsg1qUwfhpq/SuCRtDY9qCE6GRIAlfY7xP2DlPaog1L3HsseY3qFQrJzZ8w8s
         pUZzuI/HgxCNpyWreLjL7H2AGzufTtubceqLh54euwEYfQOab+Vk8JEt0S6HgkIgZGW0
         KfOQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0vEIhLtypUeDbnms5d0qTPE82SnO9L8nOY0ZX8P9P2A5DiS+x4uxnKLoQrrq9SjU4hRahrk3CatMGyOA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpmsNgh2KPW4Z+KNeRJjGo8UFobNBMvnO/kIezlniyj4cDgF+C
	0nARwjjn7KHlxP5ChGlg6eo7Hn8mhJ2vLVkOExYqJi+KXh4eKRZR9yqiw/YQV1IjponqjM6J4Ai
	CO3GsKiP+TqHBI/qYUymrLGAQ7688qRVJ1ZoizM5k
X-Gm-Gg: AYBFou0hkvE8f00FcBIKZaztFoNrqqNfMov1QDef91cd20SpK12tqo0I8ccXqTl3wgg
	pBzy3MyV6lYaNmo6YSd8ccKQW5FcLPBJkxy5q17jGjqQPCUQFC7l70wQaBM98I8uogsUGFQ71ho
	iQUImH6JWK7MNTT0ahYiPihPPYu/XDcfZ042kox8EMQKSnuX1LWMSDt55cnT/j3t5Fzlo4WE84K
	IVV+4svLD+ONIWoOvw4uNDsCQEIcHlWwKA8v7+37uZTZYizFbIP254Sl69/MqC8FbUzt8vecqRs
	GBgW+ZEZLeiP6KJLwSs5lzoUOIxsQ75trRDvbtKUxMvAZcxy9Z6pZCU=
X-Received: by 2002:a05:6402:20c2:10b0:6af:b196:68bf with SMTP id
 4fb4d7f45d1cf-6b20aacf5c4mr61458a12.7.1792014604097; Wed, 14 Oct 2026
 14:50:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-5-yosry@kernel.org>
In-Reply-To: <20261012233638.2546339-5-yosry@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 14:49:50 -0700
X-Gm-Features: AclHuK_GlqQIdJcNkjsjv88poiBSqZFim_xtLDMo54MUoTLrqyASHXUTHJYwihU
Message-ID: <CALMp9eQEEKVQT33t=UNDdGLotZWiUpznoM6Jxdc4u0W4vfcv1g@mail.gmail.com>
Subject: Re: [PATCH v3 04/27] KVM: x86/mmu: Support specifying reserved TLB tags
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> In preparation for using the TLB tags allocator for SVM, which has a
> range of ASIDs allocated for SEV/SNP, pass in the number of reserved TLB
> tags when initializing the TLB tags allocator. The bitmap is
> conceptually shifted such that bit=3D0 corresponds to tag=3Dnr_reserved.
>
> Specifying the minimum value during initialization also makes the API
> clearer, as tag=3D0 is now explicitly reserved by the caller.
>
> No functional change intended for VMX as VPID=3D0 was already implicitly
> reserved.
>
> Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> ---
>  arch/x86/kvm/mmu.h     |  2 +-
>  arch/x86/kvm/mmu/mmu.c | 42 ++++++++++++++++++++++++++++--------------
>  arch/x86/kvm/vmx/vmx.h |  2 +-
>  3 files changed, 30 insertions(+), 16 deletions(-)
>
> diff --git a/arch/x86/kvm/mmu.h b/arch/x86/kvm/mmu.h
> index de79e002edf8f..b443a5083bfb0 100644
> --- a/arch/x86/kvm/mmu.h
> +++ b/arch/x86/kvm/mmu.h
> @@ -413,7 +413,7 @@ static inline bool kvm_is_gfn_alias(struct kvm *kvm, =
gfn_t gfn)
>
>  typedef unsigned int kvm_tlb_tag_t;
>
> -int kvm_init_tlb_tags(unsigned int nr);
> +int kvm_init_tlb_tags(unsigned int nr_total, unsigned int nr_reserved);
>  void kvm_destroy_tlb_tags(void);
>  kvm_tlb_tag_t kvm_alloc_tlb_tag(void);
>  void kvm_free_tlb_tag(kvm_tlb_tag_t tag);
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 97d49247d9d82..c096c1a2b4684 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -8182,9 +8182,17 @@ static struct {
>         spinlock_t      lock;
>         unsigned long   *bitmap;
>         unsigned int    nr;
> +       kvm_tlb_tag_t   start;
>  } tlb_tags;
>
> -int kvm_init_tlb_tags(unsigned int nr)
> +/*
> + * Initialize @nr_total TLB tags, where @nr_reserved of those tags are r=
eserved.
> + * Reserved tags start at 0 and are contiguous. Hence, usable tags are
> + * [nr_reserved, nr_total). At least one reserved tag is required, as 0 =
is the
> + * host TLB tag on both VMX and AMD, and is the value returned on a fail=
ed tag

Nit: VMX and SVM -or- Intel and AMD

> + * allocation.
> + */
> +int kvm_init_tlb_tags(unsigned int nr_total, unsigned int nr_reserved)
>  {
>         /*
>          * Limit the number of TLB tags to VMX's hardcoded maximum of 0x1=
0000
> @@ -8194,7 +8202,12 @@ int kvm_init_tlb_tags(unsigned int nr)
>          * need a solution that works for both Intel and AMD.
>          */
>         const unsigned int MAX_NR_TLB_TAGS =3D VMX_NR_VPIDS;
> +       unsigned int nr;
>
> +       if (WARN_ON_ONCE(!nr_reserved || nr_reserved > nr_total))
> +               return -EINVAL;
> +
> +       nr =3D nr_total - nr_reserved;
>         if (!nr)
>                 return 0;
>
> @@ -8208,13 +8221,8 @@ int kvm_init_tlb_tags(unsigned int nr)
>         if (!tlb_tags.bitmap)
>                 return -ENOMEM;
>
> -       /*
> -        * 0 is the host's TLB tag for both VMX's VPID and SVM's ASID, an=
d is
> -        * returned on failed allocations (e.g. no more tags left).
> -        */
> -       __set_bit(0, tlb_tags.bitmap);
> -
>         tlb_tags.nr =3D nr;
> +       tlb_tags.start =3D nr_reserved;

Can you also clear tlb_tags.start in kvm_destroy_tlb_tags()?
