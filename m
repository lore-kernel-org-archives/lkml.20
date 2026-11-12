Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794462026;
	b=tKBJN3xY86vcjd71q0w05C95H3BSpyGeAiyaCmjXPo2FV3knnLpi9BvNxaBqI5yGpvEP
	 ZDgFx1kGsdzH8O/QOzEtBaLPbDh4wa4CTSbJkHoGKj7a+Nq8FTRnt1riN2F8XJDCpEtzO
	 ENX2U5vPMpN7sjgh0+o1SqnVIrJ1BsIdyab9QU09df6vFob9CO4i0CJpLw2QFZ79xRNdf
	 HTHNm3j6P+LJbzXFbP5rMyfn12EBVINQtQ9lu1yKwP2wxJQJb/gr1SyAo1ImBSeSBJrXU
	 132bzJnRmXMQ8ypfzV7OsRftlslwslNrSSgCTP+k8N+6sL/ck0xDzk3ClQDTqWKf1Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=38irPCmvvGjLk5lYC3qAN0yOb0IGyp2qLG+JcM/wS5Y=;
	b=JA5lYkOfIiBiI261wlmZNLTWJbIVatmpjXzcV/TB6uA6AjWxJ+gF9SBPwsmqnxWL5T9U
	 jwfTgK2OY4EnPvoPgtrJNR7lV7ZCurJya3+23jvmZKLwepgBCzIeXcooG8aYDvj4xnLzf
	 9ke+/ztcV4FbnKM0VpXcz8FRlN7znYNkrZMQpML/RKQUcN1/55jn9ediJlSAxtY0HIy2i
	 5izcWXf7z5F9wdyWNkWOa8/icYariXULOH14JCSENgQuWx7OyBN6hYeQGNlDXjDjpyFFh
	 PkWnwxi+cHZW4w11pm/zdo34TjqEOFL5Fg/NZxxqC0aa5OY53O72OdpoYn7daYV8ZJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wiSP1H30;
	arc=fail smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D29F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wiSP1H30
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4d581da0aaso430487366b.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:40:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794462024; cv=none;
        d=google.com; s=arc-20260327;
        b=ojZU8mPJ4gpXeMnMD+cMRPV8tZrj0rn/i/iq4fqGUu9iuykqV9jy4ajdk/WAD0A8LQ
         Q+HRpeS5xCoeFsUzR41aUTiHvLp+G4BeIKjlv2jbS8BvxjSruDBsYVzAmCY8q9+Uv+Gw
         YCQeEvIw43RqGSlEwp/q2H7e24wiN89koLeq1p+5TL92JCsdsGS6aH0yBFC4ZjI+3zYd
         wdzUdZ0zcINRLSRydNnnPaYwl+fcrhFNKzu3lAARgWAoE4dSEI5T/iwWN5pHIEgaKA/8
         7sEnZrGK1Z0Zy2nvyoVI6R6G+bNeItf1uyDNX8G3BmXDMYbpdKwwmG6Px1TljnQFyQz4
         +cRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=38irPCmvvGjLk5lYC3qAN0yOb0IGyp2qLG+JcM/wS5Y=;
        fh=/rnEdw+k8F65DqIcR1KyWcEfKxGA/ZJA/nTZPsdtsLE=;
        b=g3X26ZE/VuvJacSg55t/MVt0k0xhQDr3vbeZCL6DsmSRXe7fKoyKd23OMXyaGmYQ94
         E47J7ttffyucaje67q+yOfOLvRK9XMZ22ln2Tkzlg5EranYex6K9wfrvnBMvO/ki608s
         n77t/GuMlnFl687U4P++GKNtFUhd+S8Bxxlsd0MC+6hYYyRKGrJa6HAxGhvh/CaOAkPH
         TmxWpZL38R6c4Y6YF10K4yi1l6Srm+TNyveAZevPTUF7jruEf6Twwam4Ab1YvvxY6xix
         TXIRZSQ2NuB8ZXNlNssv8LqJaarqiqPMnRGiYiiYzxCsvKoXwIzpeL0I3ouMp1Jwoxw/
         dc+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794462024; x=1795066824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38irPCmvvGjLk5lYC3qAN0yOb0IGyp2qLG+JcM/wS5Y=;
        b=wiSP1H30N+pOIX4JU+YFc0ypLRbulh+k2VON+jINPs6ok6uM9BfppBiClRcl1rZy6a
         4h22HDJvucxbsKi8xg7w4aPL/OiUx/GARig6JPKqOgXqDVQIe4z4twpQ+yZj1VVdmW8o
         wcP0+8vYIWDqWpjcvyyuIw9ygAe372THc5FAKB2UnviV9l3okyX6Ep7aVdHDLkYOqnKK
         btf2rPI1DUOoc0qfG9FvIYCbkm6yzLboj7tlViqvCspKiSpmhwQlLVkw9WjtDh6c7Af7
         64yY/YAbTPU5KtyRVFv748eYXt9VROS3PwHKefwFoHEG3HLQUVi0DFFbUL7B0UQsYvI1
         AhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794462024; x=1795066824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38irPCmvvGjLk5lYC3qAN0yOb0IGyp2qLG+JcM/wS5Y=;
        b=EuRktlYeqNVm7FMtQrE8vHeTxN6V/lnuoAzgvTHtQAzi4jdd6ngftLFV+TTMjuS10i
         uznGXGM/EdwRFWtsCpQiHBDDgaHrL1619iU2cbV3nTee0X6fwvC4xLjqsM7ThT1ALMv7
         DTNq+jt0U0NeODXCZuDpyYWSi8Lc/dAW4aRyJvxOf0dagpk4CBOyOlCZp5dS5i2y4rrF
         JJrmRz3jRM2tIPMBnibSJWoLACaPGiFpFRAM4P9UT9yzr2B7ByPIEsB2FHT2V32ErnxN
         fbhDemAWDitCIvxYf/xp3tsqq4ljjmAwKnhUv3+na3WtXpY4Z5RktrhjNAa3Qu90thP6
         3U3A==
X-Forwarded-Encrypted: i=1; AL+hErGOzHSS83fmZzAr44+h2M74NmLs+mjI/F1W3Yix+FO0bbI0UxjYwsCl9Kku/EoJkWvGijcwTmGxKX6RxJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uxo4hqdh0OHQtiboGTXzyYNuOpJoQnHE8FxXAvK3Ea812SlNf
	4vh0rLxInnO5ktkJluYTsQGTZWdjDTeWs8xA01Vfb7JJjVfYh6oGd0QYP2aVyxkxMNvjeQOxkNR
	0cCEPnZXf3XdS7DFQ2R3da0xycffIShY=
X-Gm-Gg: AYBFou0RPUZCTAw0sC3nnDyN+Y+i94jJYC8OrW9R8rkgsjlCxQHnR5iMcGgDzIteMlc
	ufd7tDwnrsZwxb/GZBpkI8jAtbLBgSWvCMSi/lC8RxT7MnDlylnsyHkXFiVhrRq6zYsWz+9Hpwk
	TP6Uj8vBKdAuKhHFOtaUZaETzEMYTeh9AJJBpN+A0Ia3pcbL+wnA6dARuKbUZd1f530tDj6B7Ng
	g3YjZRaQeSYxXI9M6EFVC7xh0XlHuRo1i4ZGBDsjyH8NjY3LcBq/kiTEOPF0s6cB0a8iSIbo2l6
	2b5UtiMPpYXN+CijKRbmFtT0Nm7r+uzRN4JnrHQZgKuMuFBUVnAMgbCU7lTQjuduJwZGCUJMBs/
	ywjvol9V/EPxRV8ifw6BNWvTI7cUa5pGLAvxtVQjYDk8wJbO46iof7xiTbFeUaNYhojGP
X-Received: by 2002:a17:907:3e1e:b0:c40:f89f:d91d with SMTP id
 a640c23a62f3a-c5066c9b92dmr321953966b.28.1794462023595; Wed, 11 Nov 2026
 21:40:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110114623.2659197-1-yasuakitorimaru@gmail.com> <179431155869.488859.10143317051771395220@kernel.org>
In-Reply-To: <179431155869.488859.10143317051771395220@kernel.org>
From: Yasuaki Torimaru <yasuakitorimaru@gmail.com>
Date: Thu, 12 Nov 2026 14:40:11 +0900
X-Gm-Features: AclHuK_FTK64i6rz-dgQu9pXZ051Du56rXiAeB66ytOoSbASfD_csh6txxR6a1w
Message-ID: <CAA2s7u4sfe8J2EXtmEtPmcV4N61B32Zn1E82EMaN7VpVtG-njA@mail.gmail.com>
Subject: Re: [PATCH ipsec] xfrm: account XFRMA_MARK in xfrm_sa_len()
To: netdev-bot+sinfo@kernel.org
Cc: steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. Here is the information the series is missing.

Discovered by manual code inspection: xfrm_notify_sa() sizes its message
with xfrm_sa_len(), while copy_to_user_state_extra() appends XFRMA_MARK
whenever the state carries a mark, and xfrm_sa_len() does not count that
attribute.  The issue was not triggered on a running system.  There is no
syzbot report and nothing was observed on a machine in real use.

It was then confirmed by instrumenting xfrm_notify_sa() on an x86-64 KASAN
build under qemu: adding a marked state raised the accounted length by
exactly 12 bytes (348 -> 360), matching
nla_total_size(sizeof(struct xfrm_mark)).  The shortfall itself was not
reproduced as -EMSGSIZE, because the skb allocation has slack and
km_state_notify() discards the return value; the commit message states
this.

On testing: the change only alters the computed length, so it was tested by
building and booting the patched kernel with the same instrumentation, wher=
e
the accounted length includes the mark.  No selftest covers xfrm_sa_len(),
and this is core networking code, so no hardware was involved.

Yasuaki Torimaru

2026=E5=B9=B411=E6=9C=8810=E6=97=A5(=E7=81=AB) 20:52 <netdev-bot+sinfo@kern=
el.org>:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
