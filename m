Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F8745D19F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791528756; cv=pass; b=fddkum1aGLtCGTvNryL/BUoyxY+dBwWV5V8jTzkoRA/QrqHoarizg/tBNGY7thqPPsanN3OrV5caPfM2/T0jt1OhtHHgJgU/mQwVDGAHseeMt9DxD9BFOpkrfVxVs+Hu8UN9hxR5FrWowZKYVbEKfrOwqK0WcN4WBAWrLdQoHs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791528756; c=relaxed/simple;
	bh=4NY3b/9uFqqbJNZv2e54a4GGP4HJaG4h9wCOURl2pcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDAv4IihPR47RSdqMvWYN+h+h0iLLOsuWlY8cA1B9xKDyCMKKyjBPcnfycD+wAaAkPD73pFtieg7xNRLVmvnZfKqDzVJe9R17TFVJ1ZmAv4bm1HDovKhgRHpGFQFaFmSW07JacpDk/pNQDToKEBccUFqrtdYQKwpZMW4jDLUXac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JdAMV4Ni; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JdAMV4Ni"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afe8d3980aso4598836a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:52:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791528748; cv=none;
        d=google.com; s=arc-20260327;
        b=OVc+b5fE6XdYYo3I7X4ZokqAOUT1ASCsi75DBMtAQazyRW6SnAdGw8FF7rZEA5V/Dh
         aBqx9X+Pn74VeYuMPf7DFE6nTXCQmv4v9yPBFA+fvtJnC2Oi0B1FA28A7bZVo4Rle9I1
         pgdGqH+kM/lZQ2TvqPWaEUbvqsZd/mjDfzfSJryfi9RJoqrhxMqXiG8L/hyqGyC5P85M
         pzB8IbEm6nq+jSBBQj4TzSVlMIFDyJthNX193VG7Jf6YV9BPVIhyRAPl/QGAiFKJJIpB
         1DmU0MH0gZ9VxtX7TK6I6wBpGvyeaGb6ncRoOjdm7dRCQvypGIy5lSXh+cEvd5lQOfm9
         2Ijg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        fh=5k6Owoyhd/473Sg0f66zaJqb/R0TggeruX8fvDfET30=;
        b=jpSiPXY2r+h9m/iV2w/RL6fOyADzdG3Ac8RR6hAwhK/8HpJGu8tVe/3vV8+MRTxqPa
         Wuge+3FHw9hRMq3W2oJEDRHZUMbnyjkXMg4PxiGymePP0GPk85U9YniJ//4xmdfNgMUQ
         KxDpzP1xfMXzpicRu60BjNpbb8DEzfVbw9RjvECvN5gMgcnr/ICmx0irbbOkCm+FOk9O
         yUbrG00KVGJCmBM1/aNRwBc19jO4LKu/RxMPvosw46sKiBRAC+sY2ujBjjV70reRapnU
         +uP0myD0te/7WQRDVCO4iQ2dg+4pqrR2zqZMPddAggi4PlRhwy5G6wxxP/cNVQGvJE/R
         ooUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791528748; x=1792133548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=JdAMV4NiOsNnKzodZ1REyjHh9rZxhax/u/cAmbUKdeMyaIR1WVQqMK33pFmHUGKWWT
         w4CEDkbEG6hiL+/e3UBo2iR65oNMPZsAOB2f8jGB4KEyQJduOVe94SuDO74cK6ZNbJh6
         XQMPcVq7tNvG5KZqLov5JgUtSx5+OYkh3UA6ePd+Y4ec7M3sFMCs2Ktw17qA9QbeiHKw
         epCwfJskhgIKdvANnwtSmb1t4TvjvaOfO9DXT1RdC54oQ43n6PKnkTQxR1kAc2E+dBWZ
         69EIHWDrKqZqb/7/q2WQVkY3UDPYX1pzoI62PVaqmpP0CXR1MFDXzGt+VRcereBHzpcU
         Ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791528748; x=1792133548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+dS3K8yuawIJTpHR5tebZaf9aB405AvauMGqVL4l6U0=;
        b=DKbKGEjVBJ2xxY5NSBE+jLrAzPww2tMZo/BTL8KvsxVceKiQa7DOcSFAam64y3qiu5
         phUcK1W2tmnRRVhipSIMbN3rK1oepnt4UTHUhDI+nlGeOcLAxpWpAQT0r6xNYiyTc77Y
         l/80IPh/ueN0Mv7nSNofMuR+QQkd/rVgcrdZaZArhAL2QIr9XbzJxjlElkzJY3Z/6ov7
         nD5MxTBL8QT75pwd5mQ+Qwg49LwT5OZjMd9P6QBmgVBwywoGM0ykl5IhxuG4p+wLvHPy
         aky38pi+U/+iQQe9sdVGyaJ3QKjmPO6TK9bZaU9x8FciQ7Flc9mn7K2swlKHa6K7MZaK
         Vjow==
X-Forwarded-Encrypted: i=1; AKwUvBzCV8CbGm/wfqP4jqZAb06S/TF9G4DghERm8BLs+SsW7oqIQ6iKhFNJngRDLQbLL7hC5T4BVQMMbpJE3So=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJGyWL1cp1EGHkrxAmSEAHpZ8iOu6BbC3pvzsN6nTchijJ1qc+
	vaqoJCYoU7uM4Dy/hrzeyTlj8KQr89mVIhuO27i0UanK/c6k4EqBApO9AAXfCld3QMPt5QWvzm+
	+aWqsP/RMrE/bEHNMjzBOt8RpfjR4cCI=
X-Gm-Gg: AYBFou1Zl6qgBgaal5P9V4efSeWMwIGs7Og5Ib8zz88DVJj8uoqLAEZPBjPUzSQmwm/
	X7uWRfxecmBrFIy1Sew4dnSYdCNef3VM9nazNALgKE/NYvjeznkHyXAdOUBtp0sfjwNN6u/Cgw7
	09OmDUMwcoOomeEQj0Q+G68I9kLyt/kkhQKvt+3OjQyPg8+yud3nLMKTh7T1TpSKOXCbQUBhQr/
	VSGWLxoHONTy13LyiWl8ufhbNk8JMABYv6zmJ0tIRf7BF9LGMwDa+txlyrtmgdyHoFXQE8agDlg
	5tTpm8Tid+LpxvWFc2taVk6Oec7eFGfwwWFfZeFcZGJNYc7J98EJVwNgI7b+iaERmtM5+7rxvVi
	m2cmzdJx7JdgD58mNl6iYTqFyFZF5E/mAWqq3Tc8Z3Q==
X-Received: by 2002:a17:907:a089:b0:c2d:cbc9:3529 with SMTP id
 a640c23a62f3a-c31a9ffd78amr101019566b.20.1791528748116; Thu, 08 Oct 2026
 23:52:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com> <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-8-83e8245761a2@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 08:52:16 +0200
X-Gm-Features: AclHuK9oTCyjIBQo-KDpBuWM_JxhK4IiThl5vFb7lnINqfE-VDcwwfdZ-Pom2sQ
Message-ID: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/22] alpha: select ARCH_SUPPORTS_INT128
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Kees Cook <kees@kernel.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Sat, Sep 5, 2026 at 9:29=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> gcc supports __int128 on Alpha, and the 64x64 to 128-bit multiply that
> the users in the scheduler and in lib/ care about maps onto mulq/umulh
> rather than an out-of-line libgcc helper.
>
> Gate the select on CC_HAS_INT128 as the other 64-bit architectures do.
>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> Tested-by: Magnus Lindholm <linmag7@gmail.com>
> Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> ---
>  arch/alpha/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
> index 2672971b83f3..bed3f1c8d9d2 100644
> --- a/arch/alpha/Kconfig
> +++ b/arch/alpha/Kconfig
> @@ -16,6 +16,7 @@ config ALPHA
>         select ARCH_NO_PREEMPT
>         select ARCH_NO_SG_CHAIN
>         select ARCH_SUPPORTS_ATOMIC_RMW
> +       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
>         select ARCH_USE_CMPXCHG_LOCKREF
>         select FORCE_PCI
>         select PCI_DOMAINS if PCI
>
> --
> 2.54.0
>

The kernel test robot reported undefined references to __ashlti3,
__ashrti3 and __lshrti3 with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy.

Alpha doesn't currently provide these helpers. CC_HAS_INT128 confirms
support for the type, but doesn't guarantee that the generated code
can link without libgcc.

I suggest dropping "alpha: select ARCH_SUPPORTS_INT128" for now and
bringing it back once the required helpers are implemented and tested
with size-optimized builds, including UBSAN. Removing the select
eliminates the missing references in the affected objects.

There are no functional dependencies on this patch in the rest of
for-next. I tested rebasing without it: the page-table-check and
hugetlb patches each needed a small Kconfig context conflict resolved,
keeping their own selects and omitting ARCH_SUPPORTS_INT128. The
remaining commits replayed cleanly, and the resulting tree differs
only by that one-line removal.

Magnus
