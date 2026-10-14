Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80FB4D0CD4
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978939; cv=pass; b=T1d36ycGzxZ+/9zrB4LRPFXSbvCoNxKbAC0QpnQUWcIGciy2Jm0TIVnUDTA6FVRSzUJ5ZYr5K5hks5e/3OpAFindcqrt48zR0ethrUjf54ZZtfjzW9ZMFgkqCfdhH1l6br/bM7d/4nHeCLOqw3oMnds+wQmL3d+p2y2fIL1Yfxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978939; c=relaxed/simple;
	bh=UOEweZS6trAcPbfFLnePxXLvJnCf37PYAyuYtBQlhiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9IBzqoBdw6qIhKIZZYyVzoK5SnDFKA75o/PD3LEgcqzjJo7qeR3zREX/IxeVi3k2kMdm9vVou50tihCNsarqh+PNmi0EaewRhxVNrazti7fcO4dK09rX3Vq4bxLhlK86YancMkhR7tGP0FqcLafdiOWkUs/eTYDBIzPoMaUajI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtvNPgrs; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtvNPgrs"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so2049875ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978936; cv=none;
        d=google.com; s=arc-20260327;
        b=s4C6bcqOOXFBVgqd/+XrGyl11FLpt99O7c1hMStTTXgHdZMIDXiwbGocaPPOAxCvQi
         IkvtLtoIJdxdF6TOKIPpj/1atCAPUVxCyV87/BkFTB2/JqE5UuFrlLAqzB0Kxd93yphC
         XTJuzPsuI1KwPAdT4Y+zrSLU02NiHtLU7R5QMEYAN2NHbuI/lTgiKSJrrhK15ydZW+ZP
         YhrqBm5INn+Nu8pa7RnFieO3bOfUJOa3CwzRt4YGuhz9UKihb1UIZ9Ir1TizyTvPYk35
         BcvhpGtXWEJLyjdetpSIYvYuYShMVYzXcLIuT05lDUhkDUq0YxDBQ5GKgWLK4NZDfJ0y
         8wnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        fh=3JaZ7p7e+bMHIl6o2DsrGiJ+i9+UOkj7AIG8MmnEf14=;
        b=NUUbWdj7MezmdLY5OAYC6bFl0w70ZRTYJ7Mxh6GoWY9MSIZn7CU3vyON9YXhYAGt0M
         RaT3ItgOEmPfCP0Nj3gqN7IHqnVaQ41wE64pziyMl+EPsVIYtjLvptppcC65IBoBCoFY
         bhSU8cs8krhe1gZ274lu5X7dp3y/cipSLkQoEywh12b8va4SEy4mnZy1fdzxbEhfITQn
         IfNw9k21AvSSKvbQmdSIMhoAJhpNoCNsMzeNc1kl9caLEqykrpJoxcvRxfOXlYWigcPM
         q8AIu/Fyj7/RAYPK+rmN1GHYEHBcLfJtpRHA3Yah1lN73ttjleGGLaw5cbPsztk48Nz+
         e1vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978936; x=1792583736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        b=DtvNPgrsLlaTZt94Wg1Lkua7UEEQwBtd1N9hZ5T1wsidqPQwwtl0JocKxVoBZlLcUT
         5jHRwg270YMn1//rYSeRxViKEaWe6BovFjFaJh1D9pThxCGPY9Ms7bCPvpazj2vGdZT+
         5rvH58atv5vBtE9ZCaPm32At3iy0Q1R50xa8TSZt8NemeLuSHILXVenLaDYN27bfa/bg
         4eyKLlDDlBQ/PwLsEgdUYiSwFAADh4fDwjB5ENI5lmgMy46CWtiiTCwr/pYn1JRSf+AZ
         zAHDuoZVrs354QFaU1tBNhuDdhHe/9gNAYN6fUpN45YsuXj1rbZiOx/RV+8I9q2urBFd
         QKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978936; x=1792583736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL1VcmCEoEc/E9Vz8+yrrGu9lFYnc+yK9DwPFQPT4FE=;
        b=aowgqXHoNQmrmqdiQB5lQzfYVb73pVvSk7Xq4oap+lZwCFguPrAFW/bwqQmmBc1c3b
         zW5lSYdCbMXpjALQzOzUrEaVxHGObBMkNYqLKa9eWvMVDTGTF4FtBV1xPjIipeeZ4nF/
         lHCpAbRMfg4jCDX1rUrqkXvQlk05cPmxoW1cCdPq7snXtieHxG2dqIzIF6lVpwJHTjld
         F0RujMXtuynEaNi+a/WyrKISvftcJzn5ZEFRvABmtId9UOe1LiwVGVXUvwb99U5TIumY
         ht9SXv+DW0ty3/ZADuexiqXGNbHi1vEKks/wwQBHEoeM+TEEg357mqoaubxHE9g7lDgF
         OhVg==
X-Forwarded-Encrypted: i=1; AKwUvBzLAmJdIekqGF38Uq3BaGhBT7VmZ3jKOpW5QNkAW1mhzvvpArzqjiW5O2P4jgFaPGMfdT3353X3tMoRhJo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRDyRfxPDQq+Aga3c4+39FvRHQyHRe9HI2tARHtc53GcV3fXX7
	d9Bi1IYs+l74GdnpRG8rrJDBsiE0ojH6AmHTVzBw1wjKKRMyhqwcGbV8ZKv6NrsgCjZbZd5/Ak1
	QQo5+HSl6sFkMB1SC9syhds2M/WEaOiU=
X-Gm-Gg: AYBFou0AzYhFSxQcL1oOuqOg6W8U8VFz2hnNhTleYfUgA8aTYdQ/CSt6ESoD53CnIXQ
	Jwqcj5NrBySywxaemX9evJbzZkyu79QmdW9dGiVoSeaK1z3L3OOhYM7V1kgaJESVtxrNU/C+XIH
	XzmX5HgFgeBpT+RFm3WaVVeCel5aKfPWDJgAVLfxaQMle9sSs0usESk4MnIcN7Ez6TEe5s5TBT5
	xU5QhK2XiRUtUBPqbnFjlOZXhoImzjIGvHcwlG9dGbz3l7bVvEqkCJ7LnM6AmQBBRMbkPmmpCGw
	uHO06enxig2DBpzYvGE12Im+xUfl88R8QtLu0UVHYDAi0ZVGIMwtuRWr8eaHdF9bdHalTBKhYiZ
	kwzJXwT+ajuiapMCckn5a0k5NiH6eroguK6AMh1isWMe+1LrVZxGySxWKwBgLjvKj7+ifhHKWeV
	O5wWkfnYaLbBWeMJPc6VIQx5lK9BWd48YV1CPXyDYlrPBOlclYg6r7i+95Djh2WQ==
X-Received: by 2002:a17:902:d506:b0:2e8:3cf2:49a0 with SMTP id
 d9443c01a7336-2e8427fb16dmr237846365ad.1.1791978936024; Wed, 14 Oct 2026
 04:55:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me> <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
In-Reply-To: <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Oct 2026 13:55:23 +0200
X-Gm-Features: AclHuK8jVYMTwJgR1e5g8laX5EjRU5EDlF0P9l1xC7Hi1ziIp0lW76BgKAVcJ_k
Message-ID: <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
To: Lorenzo Delgado <lnsdev@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Thorsten Blum <blum@kernel.org>, Francis Laniel <laniel_francis@npnm.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 10:30=E2=80=AFAM Lorenzo Delgado <lnsdev@proton.me>=
 wrote:
>
> +/// A container that can report whether it holds any element.
> +///
> +/// The result must not change while the container is only reachable thr=
ough a shared reference.
> +///
> +/// Unsafe code may only rely on the result for a container type whose i=
mplementation it trusts,
> +/// such as the ones in this module, since a safe implementation can ret=
urn anything.
> +pub trait IsEmpty {
> +    /// Returns `true` if the container holds no element.
> +    fn is_empty(&self) -> bool;
> +}

Do we need this to be a safe trait? If it is unsafe, then we can
simplify the invariant and more easily think about the type, like
other `Non*`s, no?

Thanks!

Cheers,
Miguel
