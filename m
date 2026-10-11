Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0B4570D8
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791727120; cv=pass; b=fwIDAPV0KRrSsrPHQCt2kmu0gv0qD7lghBPXPx1VC0xEeZZoy90sQ12p44+QcYDr0sgYx7/JFeS0NQItWl4P/mpmzYpedfPppXVMS/avKfmFtLfgAt+QLzU579PkZ9hZ3jKD992Zx/BMzBaOVoFJRGVjLmc0P60kPhs1fi/tSlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791727120; c=relaxed/simple;
	bh=PQqTMWasXUN28OiYIu8PyJtOpiaTPczvB6SNcoFhwqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL7W3LIG0NRCiVPsZQhNdgHzG6w39vO225RJFRTLrpI1Sxc1tx5k+vv9OxFsBv/YN5b3uzutwNN++7lCj/NVahYN6PJb0gtBZR423ncc69J0NXqHow3mKrnxXBnZ+AdHcF3Z2rspUU8BBmvxFXNff9pUX4qfhWvBYuwH7NxXzn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YbGJZtXi; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YbGJZtXi"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3599178221dso10323eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791727118; cv=none;
        d=google.com; s=arc-20260327;
        b=TpuU8r6BlmRvuvwyDbUfIDOpFe/+T03OapazghFJHPCZUEDyCNFyx5lCIlUT9Y1qbt
         XVmxhC9+0dFRY+2amLXXkhvfrMm2dyApumG7tn/EsYS3JcrOvzQpFzFpV3l7NFehjupn
         1skLA0EsQP8AmFf4YEY8rjKgAmJY73wcaPUXGpkiU7zn1anFmfq/ERH56TInzfDIhOVh
         GyeTAndBP9UXNlvYFIxy0w8aljY5mxcDI5Xc6TnsdZTPkvfJyOcUedifF+Zsr6n1jho8
         dl0F69q2Or+cF4k4Eq3yKPBx1To9ZUNFBI7+iImraG8qggd8c0LQp4Fl8OQ3s3sr0ZmE
         LWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        fh=7oZtKTYk4ST3ztj6F3Lf9qCiXtfsE77PDf862zAl7JI=;
        b=oLrhedAEirHmo4KIOPXVt9fPjKpCElhJW0ur16CdLJZScBHleGLhmVMkTe2pTRvMzj
         YP1p639JtjvGonI97PuCfAIK7zhZpnlA6thLKXQm8oRHcAHCWiIvnm34qrdsCTZwtOix
         Hl4BVzm7BfYX7TQN6GipzrCu6qeX3cozmXHlLHXAGgFDliwlf8i2BaNJKrr+G664gdZQ
         55r2YPpzSfOEM1TU1n0yUbZizEiOc1/hzi65r5xfy6m3784YERJfn73GxDz6XGhsJ5CQ
         VhPV7Fc+bknWWcZMZMq4dqzTpUxwdZcquL1nnGe6GwkQC3UrMkYURDjhq8mw+V6e57wy
         eKKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791727118; x=1792331918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=YbGJZtXiShcJultAFQjN7MmEYC2ftBD/VF7UMrxMK2EKoN5Egcwk644i4RQ7HYdJTR
         7aHUS8rWhKCeGxGPThOe0XElPS+0grbEtc0bV5kt3x5rCdtI0fGWJCF5mV5BKRtYCNAg
         905T3ECtkRTCOETtMbb2JmCP9EiY8vj1rF7rNfQ5p0K30KqwrGDYQHIbK40r45hjTUR6
         YVLIm3ecynTjdkOzsJFTBkVmiGyQBNHv6X4W/1E2DC/VkC2/iGfCfX1czJjtI0Ia0nOY
         MpcEXN11xaE/vg20ONZ+nsdsT3eleqy8m0Dkm8y4Gn1wECK8G35GyCmxPTn6kb8O7RhT
         m8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791727118; x=1792331918;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKxUeoIO3zwwN+w8pgZrVpsaKx7RfbD1o2NJXlZe97o=;
        b=iltOp2U+PvFGsubTBEmesb3eGDJ6p17/8ltHkJVuDhqDZm77nISkUUmBbQE5VIvfNT
         Lnnn044AwUGPo5FAvtE8YPioq6ICyMh5beQHKy2IAV5GApK0/JRIIzznaCTCr+7EKJ3d
         sYjZXUlTbNuOx1zR4GK/yn05PD55Y0hYiCZtIHFXjQyxPLe7wr4gnW4z7oQfBL98v1wy
         nfXLxJUCJTq6VJV8IoOelZQgIKbjJZw3iphaKYHBzZhxsaA6AMw8B+M/r0VmFjprGCzZ
         RMPA3kyHRcF33+jK8blRCQI9tDPDMXAoV9srW/yQhxUL31LBeGpnmhllNu0frpwjOLOX
         k+vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEf+TTfWL7NGbkJsHXrYge9F65Geo+xJQFSQPFgfTddeyS5+7NhHUf51Wlp6wZbcCZ9L/g+MnU08ZcR4E=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVWJcBEpiyvOxDhCp35lqFDYlBus+Y6I4qzDdWFJrLXT5FM9+n
	tZ9yH1UuiC3s12r4xCXQo5tkIfUR5h/2zjFnLWFKg73Gb2ewkwDRj/VSklI2YHvaTTWHILDlP+i
	sPVVHHpZpq/YXS2DdUimps/YQcY8BmN0=
X-Gm-Gg: AYBFou1TUyilKv0S04Ku/JTDwN0v9bcyERJIxphCCokGM26C84ifzLVBvcjvSVTMtoz
	/mHOAuwHIGIriUBVWhAzASa1E4j0cUl6euKFxZ503nIWj5SstWIWXbTjrg+lGuYyjnpZkIQYu43
	YmDvRp5w99XVM+CWOS1S94O3ZoWsHNrtZ0xnR+bFn1PCiJbGkDEyOwc1OgCll4lU5i7+DZWfmrq
	IR07Xg72olO32TFEkuqItnJYQIbjkViR+bCZvjRLCo9agiOHNpl9PQmeg5JGeXS/aFXa5I8hc6r
	Qb6eKn5frpUdSPmThfPDMNGZPhGf2IkPLTR7tvlKyoM4bMzayDPUJTv7cTRVmkp/baTru4SK3EB
	OLG4q+xKvD5i0wwFE9bjlO4OJoEis9y/qJmGEkdCvgJqbMZWQWs7h6K82e7eMnRZYJjLEBqO7mi
	gIDFsjvwRSTKf+n83rsbUB196YYVrYUsGgyM389vFbLC6RtAsUOYys
X-Received: by 2002:a05:7301:1523:b0:357:5c8d:55ab with SMTP id
 5a478bee46e88-3575c8d5ad7mr10718644eec.1.1791727118284; Sun, 11 Oct 2026
 06:58:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011132353.272824-2-blum@kernel.org>
In-Reply-To: <20261011132353.272824-2-blum@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:58:23 +0200
X-Gm-Features: AclHuK_0YdNEf9Mt1KyViOklEAgHvn9iYL1y3YQP7fOfshHxLhbMetQuvRACLcc
Message-ID: <CANiq72m9r1UToj1YV7ZwMGQEPfW10ZVSAgd29VQJg_mpmpXOug@mail.gmail.com>
Subject: Re: [PATCH] rust: of: use safe zero initialization for struct of_device_id
To: Thorsten Blum <blum@kernel.org>, Nils Lehnen <nils.lehnen@proton.me>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 3:24=E2=80=AFPM Thorsten Blum <blum@kernel.org> wro=
te:
>
> Since bindings::of_device_id implements Zeroable, use pin_init::zeroed()
> instead of core::mem::zeroed().
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>

This is:

  https://lore.kernel.org/rust-for-linux/20260828122444.475-1-nils.lehnen@p=
roton.me/

Cc'ing Nils.

Cheers,
Miguel
