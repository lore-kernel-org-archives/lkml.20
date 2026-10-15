Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B8C31716E
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792073333; cv=pass; b=ZdHxyn7IGMEsYhfRIBnq6mlGqhomc5OQt5wPgkTcz8s3DKHg82PxVT674Y//qHfLSj8EGdIYqDTCv0GvRD3AsfJpm+yZA4uuo3Wj6GoHjPDRcFidemLpLH1viwqbYK1IuVjZCb/636DkfvfrHhmPCwAgEoZnisr2Df/wZWjbjCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792073333; c=relaxed/simple;
	bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0tvZfIQVMngWDAOEst/u+HBY52CWDtnQot8uWVMlOxVOCeSY7RWvgZeIz2Led49o+ZynQRrbZHlfYn0mRNtZu2JW1nQR+pztGxRYvCDWVYB9uA8jD4QFSJccv/IEFeAIbTu9X3RUvjLju+NMiVq37rXNucM9l/iCZDna9btI9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pEKU9M2W; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pEKU9M2W"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35e8253292cso136893eec.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792073332; cv=none;
        d=google.com; s=arc-20260327;
        b=lv1ajCa+qQggMfhIAzl0/Q+tx5s/R7VOjklLI7OyE8t+iC2DHnnAfedonm2rPqnYxB
         m38h+Yqu6znC+cZlNx66VgGv33VZ+w4yNyg8NooBEeFBLJX5JHWVN/GoEz7yria2QkOO
         YtPE0FlQ5F7WYXgp1fjyFQsv7EVddc4xy+ZeCN12CENWcEBpsLz7m54SKf1RTckfRoVG
         RhhNKMsXqy7b9+DIuU28QmcVeq9w1YCHI1UDeP3pqcaFPer3XbscOMsSQa8wYrmz0tRh
         r41VYJR//15l+3bevDkJmK4QqviYxODcQF+ApuUDHo2eftcFiah49aqbxV7xlOM5pjAX
         JPbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        fh=5l7qWaIZU7p09CEPqJMnidGW3F6lcu0hjxkWtSUtIFE=;
        b=ruj81KYjv3twy5vBGWPww0xIYQ6KLX1z0y60PBdwHMOkU0u9FcrXVQx1Ki8Wobt4od
         I+hoGG18mUhYEECfd1R6/7mKozOJ7jNN0t9fUD6cQ2DYYosi3MkbmfMjqdqn/HjqQsL5
         PsliuJ3V8HkDOZOyHDbPuDkc5xpKt+zYrK8VHSCr1/ufBLJsSnSqCJnnv7xgpKfJit7R
         WIUypYBBfUGCmw1QA8A1nCaqKN6FlryVs2Ux+BEvkfBcmdjEYbCYGRj68ZMd3l5KpxLV
         c00dIJmFoPf/Q7y7TWS+KTzWaVtQnOAt7oBc9S0SwU9QXzhkTaqIL3BMZLRylPy8nqgg
         JbRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792073331; x=1792678131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        b=pEKU9M2WV0pc0Vuw4GJkgi/BgZ+C2N5ptSa864aHjFmIpWokgQ4T4i/7zPD1wqQ1w+
         KZ501+IKD4slSCehDChGRuUgdlm6qedg1yqCsIkN2S+VybYD3azPaxe+0+FhYpa30x1X
         v4yzDyYbunmUwLRI5Qo8XWoo846CegDr03ktJ0YzOudNsiTV+JdbWEf+AAzOyQAUUGdd
         OwmXPUmGbE7QsZQKrIs2B6YVoqLquC9iqh3GRnmN70JjXXwoa2EVpFBn9yhDJLiC+ghb
         3OcNrXqErS7FRwoTCRAB/4udVVOKoWQ0qyo8YO9qu9Zz8ZGRDodNESHR5b6crP0H230t
         uVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792073331; x=1792678131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbxoAbT3rNtvD7wTtzYhonXLa4aLnuYbiHskZUjD5mE=;
        b=xQb+8Lc6fmIpC/nW9jE4gtS9uKN07iwA8Rr+WGfmIyl/4jPr5YmIwcadsOxWihQBoZ
         o6UABqdDXc8T2F5Dmho6MeQxVAGUp7qCxMrLgzhIXNnGyh1i7WFBbqLrQv2v/RW517Aw
         BEuDKGDcuv02eQWVxwv1rlELQquyn+JnDPKtM5sEhY6P7OQYC4q61G3MaesFHZgVPtkt
         AAY0q0BOXamESY65SCYMkW0UQcDONoR66cNfsUdcbRMAFWm1kGr+HkB5U74RFrtdG9Ic
         mqOpKJjICSK3GEZEkG6fu2H60pTN3ZaT6pUGSdzKslSijAFfgjw+op3QiM44RBJpAjLs
         PDPg==
X-Forwarded-Encrypted: i=1; AKwUvBx4KSLU/H/j4yNfHEGYUeMSluzABPxDYufNaX+Kkh4Oeki++ZaJ5OlfVRVEaQn3ZMTq2+uBpNVxzgrGif8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa0z2SaBTXlThKiBrCKhgAtqZYapTmADS2VdekpMdBdpXxWGer
	DakdM9iOjuVsowSS4P5mZBZqtZRU5e6QQ0LlTmGLRRqXsADXaPe9r/KY684M/s9H8xv1Tvwauey
	Eu1rEQ8JVSXQy3pBaRzVfD/xM8DbV2SQ=
X-Gm-Gg: AYBFou2u8EMZEg6GqEuYG0wnM9kySJfP+CTpr7WXD5hMd15o7qwuddrttQiQrE5Vx2k
	hCI5PB85WvSbuqX3Y72Pn3JvU7fzFiKCf9qcv6SSFMUcVMXl+K6lJ8WVoSd6U88I90lShvq4qJn
	/QsCs6brMXi/zI6ZAqE4Z+aYIWfpnQBmwNUqeqT7P3/VMZCRJK1YAXiQkSy+hHHcyMrYGXPt2wA
	G+gC/9oHbtKGB4AXcHNMWga2VU5l2PIYb6uIrQjArc0HuW81WanR8qB0+54G2JigcoGv695y1LT
	nHYHU7LoKIR+xfKQtuBKwdsF8qz01GmHEet+J8WVlWgKavUmPpxTSBIKuyfNNfqXM9AIs1vmUNb
	Sv1bADXqDPiLILWlcSLdtu21D+nvR6EfQyR7dl7mtLu1IYKUcq+vVnky+UgxsKoG6VU0U4xyzAi
	s/r/Z27b+pbTw4tqc6SsomIDx5lzqyR/yqDdzHBf/NrqmnDhmUTBjPFi/klAbY3w==
X-Received: by 2002:a05:693c:6215:b0:35b:cb8a:8ce7 with SMTP id
 5a478bee46e88-35bcb8a919dmr21911265eec.1.1792073331421; Thu, 15 Oct 2026
 07:08:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-nonempty-slice-v3-0-4463cc0338f8@proton.me>
 <20261013-nonempty-slice-v3-1-4463cc0338f8@proton.me> <CANiq72nok4xoA6j1SXVdWKLEKAqj3MfzCa-Sse7NNbkrn2MXiw@mail.gmail.com>
 <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
In-Reply-To: <DM4MPF17NSQL.2IOMXIQEVINKR@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 16:08:38 +0200
X-Gm-Features: AclHuK_XlicioiXGWwQvETod_9jtUxSCTVPxmzKPQqf2uV7O5F-LYF4JPjoHY_I
Message-ID: <CANiq72mn2Nu=j5xynujtRvRnCV+vrUxqYi3wYj34kBKySZX+TA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: non_empty: add NonEmpty
To: Gary Guo <gary@garyguo.net>
Cc: Lorenzo Delgado <lnsdev@proton.me>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
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

On Wed, Oct 14, 2026 at 4:25=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I think in this case the meaning of "empty" depends on the container itse=
lf.
> Unsafe code that relies on "is_empty" would be the `NonEmpty<Container>` =
itself,
> so it just needs to trust itself (as boundary of unsafe is module level).
>
> I think of almost all of the text above can be removed. The invariant of
> `NonEmpty` can just be "`IsEmpty::is_empty` has returned true" and how it=
 is
> interpreted is up to the container type.

That sounds good to me, i.e. my main concern was the invariant text.

(Though we still mark things as `unsafe` even if private and within a
module, so if we are actually trusting it, shouldn't we mark it?)

Cheers,
Miguel
