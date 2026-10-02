Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FAA4189DE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947860; cv=pass; b=mp4rndPCom3FbRPwgo0CF+t53Ym8QEbWFfvSAmRr0/96RL9iNe552YLlVTM0Mjl9K2MOWHEmvjvFLFLWIaUn6YZVXfxrXvNeVwa3YBmIYEapCwKKA593PX9E1qUj22By5D6QQ9g97XYrEOHZdyQMGfBi9E2GO94dkTQm7idPhAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947860; c=relaxed/simple;
	bh=ia2re+9iOb/U/vaZMay9+iYR2/lW9ghV9YH/Si3nrTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sNPKW3TBh+vwkS7cftLFlVtguXIfGJscDyazaWrwQ+CNglhh40jX1MQ5ltwbMHJ6uBOpgCPJ3mPC+hh0IqgKxlpurKj+UdxLEi7y+1VmCqVH/AE0yAC/kIpqvgtWn2clV1VGieFGGUO/yTPqd6XmYfmyFssf4VxuIXO8SrHIlSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6FeqG85; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6FeqG85"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a78129ac98so1702361fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:30:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947857; cv=none;
        d=google.com; s=arc-20260327;
        b=pNVpdflUEB8WWR7Hy5DvxKd7+aFdEOSlWumbe+m1QHjy0buwNKj4RuSupNG6h0nABQ
         wiroHmhdVOt3YnNuekBeAa7ITojYHtz45MjRDq94e8msVuVAEwp8rJk7J5w6AbFp0nFh
         EeJAYDM2HnWn0oxdvra5AEYZA8/N/QWsgt+HmtEDvWKFhNr7D5RFu9hgMMgWhQTxd7iE
         qtVSPA3J7ov7NlhfIu4uHgEWoCYdShh16u1igqB19zZ5wD6Qx2Z3tWRMQFQfVYB5mdmf
         51LBfPxrfXOARKVHItSa7vmlr6rCLWDpX1FJBMUYf4wqoKg6RkPZk74pPTONQ/o06xVc
         bJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        fh=sFvwV8rUBrpum4GB3jiAMGCYJ6Pq0mOf9FJQrkEBmG0=;
        b=L64h2foPCACPcE2xtyfeWyMwGWp8t0uemGXOGiE/yYDJJLhQH303gCuArrpLQXusEZ
         kwn0gM5wd9TDqvZqy8AOoHFemg/QjGaeI1TVQcR5DTsUt7fNrT7dsisSJsGoHjh2YtuJ
         p42MQReXNgKPpUYBP8x9Himbrw6VxyOiuvGZGjnch7cg8DHux3A/X4Nf3D9ktgRVbFDI
         kSlrpNlR+LwEvRzF0gQQ1DDt4F4cp3/r5f7wk7bjdtesLzChjbiQ+v8lDAKn6h4K7aeG
         /G3K+qE8efFo7pDO0mez2Pvk/3fpSK5eLqj3MTS1onL3ou2tlsFxF0kr/LRqDANwvSX+
         JXkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947857; x=1791552657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        b=h6FeqG85xpaTXwyZIihvFmeIYXlkcUnLJv0SrP07oZVZvjfgjRPXX9kDfbvWBxOyQ3
         8fXTBDuW+IZP7kpu8Lkt8RDZ8M2otfrwPwqDGWpPPFsbHRZ5LptHmuYbn3E9Emlh/gZL
         WpvGNI1wR0IKZ+LxmaEdLWp9Ee9nXZpSP58X25JnxtwdK6mCAkt+81rwytSnotSWQSHL
         z+OejZkHwE5GwJPTLxJqC5w47IQ7rj38DksqAa5UIqPHzH4WO5xaUA3pm8J73e/i3CYv
         lRub1fsIcMdgi3Yo4T0sXiQIi55E0fkxuZRrDUnKRGKQDV5nl5+hCwH938Lr2EMGSpJG
         CWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947857; x=1791552657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1FpGj0yBhxUpVXrxwiHMICnDIkcdO8hLxgI/nPHHt0=;
        b=nHFfQ3CRtBkWI8C0HGfSxJd4t3T8a/9YhUwMW+4qZQ5FiyDZcstLy9RmuB4fmKcWXJ
         aj9RY5vGFWhT41w6COTrVTZOeBKD5LzMTIk2cg46WC1ORAV8vUdL9bUbjo2ZYry6OO6e
         gAqIp3gF8D+41nGUqVjsng2cqgr/XEI9jWf0MPqSIxA5lSQw6NoZuXmbUUDJktD+Jled
         Ycb2mp8PIbJ7LtU6qVv6D3eOKZ3OWeg88tmIn3o/Tjo5N9S5pvBCP+pfel/azQrLaXwi
         tpX5RwHruGJmXH0pPANxxjTX6ASST8+1koUkpgnh2NZ5Q5ajjNhAnNWIj7nyefbMzmtJ
         v5pw==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0gLIZUeV1nXzaYxkhg7thVy4mN9Fc6Nsuf6ip/9LdhQHRJ3lKnL6neNU8zuEGyX7KZtRuo/08zZWbSw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFxRLWFRDmBbWsCprTQBResShbG1FlFxZHY5O5YuEUCLzJjoc1
	n8ZOHFYqyRwujXwePA5nLgn8rqu/Z2raS3aE2LcWAWgbTOzidQRUNQWPFV8dJm4O1Zwiuqaa3GM
	Ffxe1g3o7bke9L2pdppXhrfJqQpIQTcc=
X-Gm-Gg: AYBFou1N5beggJ+aakKGnTRqSRnVy9XjUsyUI0XcghiUb+teWd9vJhFFiixAWcy/lts
	atAylYZB6NINe4ukdKLjziNmvqjrlT+iyhJ7BXCUxJhSP9BYRbn8li+jLDP/rJ81HoOpXYn9jFT
	EFdlTvH+pDx8znvcCUaU1yhL1KsLQ65AEt2WjPwUdhhUt+W3f9X6TXFRsNRjwiE5xxSKlVPenrI
	oxLMHioYrXSLfNjTn2hRFUSaBQqZq2N0jirqEmOs0qDZObnDzB35J2j01K+m8PDm6Gvd1Mnvj9R
	mMt3RFQIX8qzInILHMCAhgHKfGEtg2T+g3I1/Tt5eXcGo6ui3ZC9gdXGV8TTlEiADcL+0heGVn5
	TVemUhods3RjWFp8x9XJimXMzS4uGrmS9Qsff6722M7BoLOe29VYZhzy0Dbm0lbSxy7ek9hFSla
	fkaGjljCPsDq4JzimdpPKcnPLErqa9aBg6poSeDJEkEsP0x0+6PjE=
X-Received: by 2002:a2e:bcc7:0:b0:3a1:b658:fedf with SMTP id
 38308e7fff4ca-3a88767821cmr7384051fa.2.1790947856290; Fri, 02 Oct 2026
 06:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
In-Reply-To: <20260904-no-io-statics-v1-1-a2386eb0d255@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 15:30:41 +0200
X-Gm-Features: AclHuK9cc8hu5Dh_eJ_vtAf6ATjf5-6QgrrpNHSdmh2WEcAg84qW80l3cwIxWy8
Message-ID: <CANiq72mTR8rnEiLVspLXUBePMnvBVXw1qnCC3hVR0KP7n_ZWuA@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: add `no_io_statics` to `core-cfgs`
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 11:31=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> In upstream Rust, PR #155625 moved `std::io::Error` into `core` under
> the `core_io` feature gate. To support decoding and formatting raw OS
> errors (`RawOsError`) from within `core` without depending on OS
> facilities, `core` introduced a global atomic pointer:
>
>         static OS_FUNCTIONS: atomic::AtomicPtr<OsFunctions>
>
> At runtime, `std` registers its OS error vtable with this pointer via
> `set_functions()`, which uses `core::sync::atomic` to modify the value
> of this atomic variable.
>
> To ensure that `core` does not introduce usage of `core::sync::atomic`
> into the kernel image, set the `no_io_statics` cfg, which removes this
> logic from the build.
>
> Note that changing the `OS_FUNCTIONS` global is only possible via the
> unstable `from_raw_os_error_with_functions()` function from `core`,
> which is called by `std`. There is no way for us to invoke it from the
> kernel, as we do not use `std`.
>
> Link: https://github.com/rust-lang/rust/pull/155625
> Link: https://github.com/rust-lang/rust/issues/154046
> Link: https://github.com/rust-lang/libs-team/issues/755
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Applied to `rust-next` -- thanks everyone!

    [ Pass `-Aunused_variables` to `core` to avoid:

        error: unused variable: `f`
         --> .../library/core/src/io/error/os_functions.rs:9:36
          |
        9 | pub(super) unsafe fn set_functions(f: &'static OsFunctions) {
          |                                    ^ help: if this is
intentional, prefix it with an underscore: `_f`
          |
          =3D note: `-D unused-variables` implied by `-D warnings`
          =3D help: to override `-D warnings` add `#[allow(unused_variables=
)]`

      I sent a PR upstream [1] to clean it up and to add a test to check
      that `core` builds are warning-free with the `cfg` enabled, similar
      to what I added for other `cfg`s.

      Link: https://github.com/rust-lang/rust/pull/163633 [1]

        - Miguel ]

Cheers,
Miguel
