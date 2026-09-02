Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD6B49C4A7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355025; cv=pass; b=JgicR8MWqZT4PHuc74p8UOO7dwydwU0Okbwrbven8Q+/rX0o595DCMTz2DMfvGSlGF8tuclita+ajE3HzML0SJIHtQ6Tg1NOGcjmHQRWPky1LnBXHzHwTXK9WL2OPKYSZS3nvVSDY8PxYxCjgUMDmX0nRCGn1o0uVsTnEw9taJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355025; c=relaxed/simple;
	bh=IZENU63Ly5JQVo5hLiulOAZ6AVvf5wr5XYbMiwH8sVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=It5rB8kiyjycgSpTgjehN40nCKqyyrLMzUnIpKWX8K5+bn2Y6E1SJ6CjCQ/lERhCXxFujombk8OvJE5N25uoxRRS4VTLhtFYG2ejZm64BnkBRVxLQUxBTu24AKYsemCw3Fe2tRoSTjmv9R7na/b7IptjBL3LP4bDDbPXGGVuWis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geXii9yk; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geXii9yk"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c1677c91969so100759266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:17:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788355022; cv=none;
        d=google.com; s=arc-20260327;
        b=aY14m2YuVrZ6C2Aok2XtNIqX6wAEzivnyzZk0YZyGBWGj/+6a4w1y6yF56RR48UXM3
         n5iqJskgW6ebiKoTSXgYFTMa27db9OdPhIL3nq5jg295fkmAGBP1aiVahT8dhRivo9e1
         ULF236YuRMyDjbvg7dL2W1N8KG2lQ+fz6NKhuGJsDpp1XCTswgyk3CJlWVYVMwFs0CaB
         Z0ulOrFElZGsF0fmgkQw6sdPhdmSz2QQUJosFhg8ljnoZArkUH5gXHW66OJ3z241ttyf
         +DjL2JcJgvph3iKsRubfFRlvcO1fTHkRtx6cxce6Ba/t9awJb9SYDYm1d0nQsoE6yC8I
         TQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        fh=rBARgvIboEbC6mwYfN+3ShMSP/lBoxslFU5Ope5TTKc=;
        b=hrJPy4FnNLxQf69B1vStd3MzwG8N6iJIkakMPJyVFsk0josRhKUPVOnWvsdhizu6V3
         JLcn070pCpfnczrYslkrXbw6hx8Jf8RY08QPC5g8P+zRuAXLp19fAX9frjwkRHydRtea
         OuXpPqQmb4AwCJrkC4BUwva6+lWzK16ipE6SbOmnvQDxtAdMJWL+gIx8HcV0u7/MKPIJ
         fPI5BA7nH4obyweBzh7p4M2bHLURELJoTFQiYR7wVzydUTXprMuzYt/+7PlwH3RNzSuP
         EUsYhW0vgqFGfQcOUcBsEIiyYJt8Y0pAdw4JMluu40b4vC5SpW3LEn3YzOetct8BzOrQ
         iABQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788355022; x=1788959822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        b=geXii9yk2kLTGQjYovQkftfwP32hENqPU/dNeBzBbtw95GKzArpqo2QBuxzdC1bIhu
         ZmsZ7d86Ozx+KCrANIsqR/klTR/0MXietdRcja0kfRM+zfSJMhTrlbvuQOQjeWGCJynf
         iZLNxj7Ty1dmCNUcmk1PmVAp8ekEM+8kPTtLi9iZWrKcF25zBcuX2vvpgGdr17vR3MJQ
         tlkk3+vpa5aulC+7W7fUuOvnTMpJJmWmgNrBSLnvNyNVOpx5incJfA6e3Q9xYa83c8tX
         IRnYM+pkfc3z5Pk+cehtdgz1MVgMmAgFoRqTGG1CExN8jFhHWm3gxxF/VK9WtbY4HTpI
         y3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788355022; x=1788959822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZHue06ttO7W/vGqVbXWmhoXrVl0ujlXMWK0E0DYjQQ=;
        b=fsIlpfaKD8Lbm0CXrXb2hV2O+Yi+aybKLR6frpZLIUTAiHpmWLg4eNFY+h13KGtoTt
         Z/x18QS9nXqfMRotbtcP/HyYVHJQZNg3xTtywip91QYYW4UjSWqkPIfHq+xSRiDBp/F7
         0BUAM8EoiizZZseJc82mAE1/fef2Yp2r60glLnp40CD31F1QsJNLTKYac0C9Fw4scM+E
         6qxumjRXAvpPqG8anTTBzm1j8CZsvulYueOGXQd3X//0+DLc/IQYHCMXV4O8kcdu0CmA
         5xateixI4Em7AINyTZ848+b+CqcK8YMcoDDkj6kgq1zAOAR5unHVCnt65Kg/Y40cjGHe
         ZYKA==
X-Forwarded-Encrypted: i=1; AKwUvBxJyFF3r/lxs86IwdIaxciGV24cO2Y66Eqr2ciqXSVbifa3KVmGj/EBT03UDLzXP3yEp0AytQeUq9TPpOs=@vger.kernel.org
X-Gm-Message-State: AFuF++nLSiFC9wyaMpCNrO4VfgvP05rIM9qcss4rEROgdThGRHkFCeRd
	UCFlfnBqA7jQAjuFgjhP6qUDNUnnpDCliapp1QSctTcs+Chf8xkkEWuKzfLju2pTMOohWfE9YSt
	qYkbvBYayIr09B6r4Bh+SqX+TJnUa992zO2Z1Wyobxg==
X-Gm-Gg: AYBFou2Z5HTnVPnhaQNfkdzvUOZCu+Nw0auzC2PGHMPWZvtTNTrQgSgqcBPFYMDCVYL
	DWk89wk7agO7LtLvKx6DjOW1cuzJQzudoK50yxku+T+CBzMnDPrTBGX17ZCNgRZ1PxzpRhmjHFB
	+//yJUaOCBr1swDFCA+Kj31faPs6w1yiNNNJSX+xdvZcgOtLtbBAWlec7fXGKMCktq9Ge98ViF3
	nvnnXxgQxPZsCwMJJmfRVfEbMwo/sstGW+xDk2+ATlLC5gQ/XpdGuEJmB64JqmlU/MVWGebwVf8
	AcR5kRlfVDjth9mNHDM5ZCLC1bKLB4vEOjw20NCDteUt2vjIvaaXjtw2UJH33judlZcheO8wWtY
	YGD3Em0dtKcgT9AypPgtL8EqowjEVyCBCRuG3Th2/B+bqA1J5OnuMYcSjaYCOFf0=
X-Received: by 2002:a17:907:d38b:b0:c25:8c74:71ea with SMTP id
 a640c23a62f3a-c25d5287112mr273668066b.4.1788355021756; Wed, 02 Sep 2026
 06:17:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
In-Reply-To: <20260828-b4-arm64-trans-pgd-va52-v1-1-a66644372673@debian.org>
From: Yury MonZon <yurymonzon@gmail.com>
Date: Wed, 2 Sep 2026 15:16:49 +0200
X-Gm-Features: AcwNN1VtfmfTbIoiDKjqPuoUjg950MVEE4mAz3ATKtFCufnsCk6vjiJLDipjCqY
Message-ID: <CAKJryhb6Ey2tmTLPnPgB+PCA+0tDKX3fR=chH+BYijjeDjr38A@mail.gmail.com>
Subject: Re: [PATCH] arm64: trans_pgd: clone only the linear map that exists
 at runtime
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I was trying to optimize that exact spot when I ran into your patch.
Thanks a ton, huge help!

Tested on Rockchip RK3576 (no FEAT_LPA2), 8GB, VA_BITS=3D52, 4K pages, load=
ing a
39MB image with kexec_load():

  trans_pgd_create_copy()    2.231s -> 0.132s
  page table pages                51276  -> 4110
  whole kexec -l                     2.65s  -> ~0.42s
  memory held while loaded ~300MB -> 87MB

I did 5 kexec jumps, including images whose device tree is assembled from a=
n
overlay so the segments land elsewhere, all booted fine.

before  2.416 2.428 2.466 2.635 2.693
after     0.408 0.414 0.414 0.417 0.419

Tested-by: Yury Smirnov <yurymonzon@gmail.com>

Thanks,
Yury


On Fri, Aug 28, 2026 at 11:28=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> kexec_file_load() fails on arm64 if we have CONFIG_ARM64_VA_BITS_52 but
> it runs on a !FEAT_LPA2 host (such as my loving Grace machine).
>
> That is because trans_pgd_create_copy() uses the compile time
> PAGE_OFFSET (VA 52) instead of the actual VA size (48 -- due to the lack
> of LPA2). With the fifth level folded, pgd_none() is always false, so
> the walk cannot skip the 15 extra PGDIR_SIZE slots, and they all alias
> back to the same table: the whole kernel page table gets cloned 16
> times, KASAN shadow included. Without KASAN it does not blow up, it just
> wastes ~RAM/32 in page tables.
>
> Fix it by copying the linear map that is the actual one, not the
> compiled one.
>
> Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of p=
aging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/machine_kexec.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machin=
e_kexec.c
> index c5693a32e49b0..8f9bc2327dc85 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -129,7 +129,8 @@ int machine_kexec_post_load(struct kimage *kimage)
>         }
>
>         /* Create a copy of the linear map */
> -       rc =3D trans_pgd_create_copy(&info, &trans_pgd, PAGE_OFFSET, PAGE=
_END);
> +       rc =3D trans_pgd_create_copy(&info, &trans_pgd,
> +                                  _PAGE_OFFSET(vabits_actual), PAGE_END)=
;
>         if (rc)
>                 return rc;
>         kimage->arch.ttbr1 =3D __pa(trans_pgd);
>
> ---
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> change-id: 20260826-b4-arm64-trans-pgd-va52-0bb9b44dd896
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
>
>
