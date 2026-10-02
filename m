Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613934E020E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790960389; cv=pass; b=JHHY7gvGCAQ2jtF47XJgVnYs6b47fx1yklqJ3cYOm8YM/79uQhd2yaKFuw6CSnrCE2L/aL5BCpt9mQw9zM4+TNsq849A/wsQiyLJtiI2CF/IgX015WwLPcF7sYe6MvJUl5mcW/Pg44kQOVrteDjBamp9/T6Lgy1HCY3zSE+aX4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790960389; c=relaxed/simple;
	bh=EHkJtd8Eu6RlYIDachMsn7gB1X9/FWHuhTARdLq36AQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JwpHJjix/FB2uxlmVA+fNMOCC3eXikZL7SofrfXy63EgZcW0SeA3dzOKZhb5UPHjpgtC3xhcFBzd4R7S3yVHbBIKUx2m3LAF7bSd02AwuxlTV3ebVz16niMhR7UQy16w2HDZEGsD9zr54xs0UoT9uGzoV2347ib5w9JPIQR668I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mpIzZ8Fe; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mpIzZ8Fe"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340d23b6a9eso595048eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790960386; cv=none;
        d=google.com; s=arc-20260327;
        b=YkcsziPPeGFBRtiNpv8H9fi0uQOLuWzMYt3pTzw8bNu3B/n/Akm++mRfQ0X7IsqG1L
         e683hNfXWItMOEieVTfGDvyBBUDKu2rWNwI2VBVYkhHhQd868mGIqfs4/EdXhYhRulw7
         t1j+l9sAsRlD8jdqJhaRVDxsJAzM1xShRZsRfRcmeKjccuKAz3ErxD4bZrUVTKz+7NBS
         1anUPu1tVejPYzgF+5T7n+iT9kE7ozsSIudTDqvVbapnyY0JPdFv+nAeYbr18AeQl0r5
         ra3nYKKZeCWBpsqiOVZKfn8SK2DcHPA9LBzQ/iQmmlNzUYro5JtgM0rk+kOWxh1qCX/0
         PLXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        fh=kvxD9cwwj2K5btMpBVHT/YTIX5mL8TvzLl3Gw0K01hI=;
        b=d6pUoICd4YyjYko0VIrnzxCAb/xzkOp8AZEMQ1fthFXiEnBHpbalZdQWBz/BnPRbRH
         DnYhnrW8L7GZTWYXBczSz5OSYBgQ/p9Shv04AScuagtaJFoTmd+5qU/gS4i+8aHIVl2y
         aIKLIDv1QCj5FozLrIFxyN5YIH8rHdaJJpBacXCUyI0LA+fFyypVl+DKQEcDgqwHWEDd
         /CnGZ4Nk3lHEbsNxO8FPjCNGxCDSWlwqVNvAWC6Tmjsf0a58YxUaYmYPP+2/7HMKH8Eu
         +iXKt3J7sMDLeK7xhOWaw5cZiLb2op/W8pjp27Gt2jINnnasU1DIvsXjQlQMe+XBzfPq
         clSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790960386; x=1791565186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=mpIzZ8Fewhzw18Tfl3XgkOPOU1uONme0BMiA89Cy0Ed9IromRZD2/aKV6/49tOojkt
         GGflUKA/eaF3C19qoANFMP7tELK9jL2rH0AJG1lmNefizVTtwwjZwdzo8ZyMgz/I/M+B
         KnQ/pZE7RI88BZBdzoO3pDZEPAt8toVzDjEzTCJHl6+5nWlRYvTdPq/3v+UH4K4TJNVc
         AYHCmUjwexQBIbpRk+0ANUUfs7d4R5uQu8s8KBNwIsnjo77EyfVL6c+CJG2N2tLeDxHx
         KtfgRIa1f3IDIyeh/vAF3V9IepbtNT88mQs5iCzsTglwrmcG/OmyTfV8Ge4JIzj/nDlL
         dnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790960386; x=1791565186;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTUdZg9mDghQf1o9x+wxMpJYTch+gpQ19dcPDYZue7Y=;
        b=F+GUSik3h/BIkI7xkx9eGIB+buqCt2B097caq/Ln/p4PUAKWk6Sv6uZUIkJfUrKNtx
         MehtnL61TdWLRhih97IKRvqTeK4C2/gCHFMcDsPc1TsO7Qjp0FU2anI8ALsqJ40TUCaH
         0GODcnDeazTHrw10ctAgJK+DUlMnwhAJFBhbbqlLpp3YjFluZ0i6q28tZcdwFIuQfpky
         5wDMJRdrJISn1xysf7JFiZDpjUyJu5S5hN2J9NXp/xbVbNs0+ZT0QSabEZHWE85lZMlc
         Jn6AvxUndt+yMrfIf9qET2iM0nlEW6vZivUhGnfoZI7/22WQ0PQYJtTwwMXCkWXJtZMP
         LJhg==
X-Forwarded-Encrypted: i=1; AKwUvBwwlCK5qiCcOnyAQ1o4sJM9q2nPlmPJJj7HOntmeQKrgqP2+ljk7xhaAOHMQbFHhLxnMT114JyooElOxQs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeOtVx3ARZJAq280R3tiPLoaYNdn3bfGJ0V1yRMTFoDhgjme2k
	LfR9irL9FBFd4Dg0bJL6IXCVPHx6IMuSBbg8lfTgSZSjOsbF5yoLfx6ELP6xW0YXbPlb4/RQfQ6
	y7+FjxZ2aZoPYaP2gevHhsXu4Kpkja/g=
X-Gm-Gg: AYBFou0rZQw0gNtVTm+5BBBb/EsAAtvQ4BznqZJtQcgzJnv+jrpXI8g1YgjQqo67epY
	B9jQrinQt9T7jM49oGbiwjMVPs6aNfHeG5tNuYfdrEO7Fk69MflUHbD87y2Hk5Of+W/27gzlGcp
	01GiYAjXDvd8O6IXZGJ55tV6Q8aslrA1scKJnrF5fGjo6SCGbvAp417BH+cP1NR7z623uZaUkKV
	I+yPvrG9hwQ2auV4po0Fis4oECOqzjdZUGnDIQR5YG71wIfYzd4eY7w9YRYWebw02bE4H82kHnL
	YJihCEWt4GOaCCdo+XuaqVITBAFpZaOWYXZZ4yTOWUfFSLJtpZbt+N8GLdCiJMzVYWcBRZEV5IT
	udzVj6KNaCfNRDdBW4GWU5oz6aEYnA0K47yqrozIJ6r6ZOp6adAnNZArVUCwvqmW4x3AIMkQpww
	49tiozh46UQFj1F9oyonOEoMlMrGzdP5JD6M7lAc6Ed5amS+jJbrRSzykAcQRwSA==
X-Received: by 2002:a05:7301:468a:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34f1507015fmr4716231eec.2.1790960386330; Fri, 02 Oct 2026
 09:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-cv-v4-0-547ef5727451@nvidia.com> <20260917-cv-v4-1-547ef5727451@nvidia.com>
In-Reply-To: <20260917-cv-v4-1-547ef5727451@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 18:59:31 +0200
X-Gm-Features: AclHuK_QhqfJYiyMedO2piq5-wcrguEMff8QxYGEopB8UiRg5ASf89kljYpIsb8
Message-ID: <CANiq72m0PLhT=-ODzQtX7k3jn6=XXpESDUbnHcAmR-1gFqR7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.c=
om> wrote:
>
> from constants without a verbose turbofish syntax.
> For example, `const { NonZero::new(1).unwrap() }` can be written as

Word wrap or newline?

> +/// Creates a value from an integer constant expression, with validity c=
hecked at build time.

Maybe:

  ... a constant value ("cv") ...

since we explain that in the commit message, but not in the actual
documentation :)

I would also say "at compile time", and possibly mention it is usable
in const context (we use "build time" for things like `build_assert!`,
which can be much later, e.g. link time).

> +    };
> +    // Using `FromConst<V>::VALUE` means const generic expressions can't=
 be used, since it requires

Newline between these two lines?

> +/// Types that can be created from an integer constant expression valida=
ted at build time.

Ditto (please see above).

> +/// Implement this trait to make a type usable with [`cv!`]. Use the [`c=
v`] macro, not this trait

The second intra-doc link should also have a `!` for consistency.

> +    /// Fails the build if `V` is not a valid value for `Self`.

[`Self`]

> +                // CAST: the macro is only used for types up to 64 bits =
wide, so `MIN` and `MAX`

"CAST: The"

> +                // CAST: the assert above confirmed that `V` fits in `$t=
ype`.

Ditto.

> +                // SAFETY: the assert above confirmed that `value` can b=
e represented within `N`

Ditto.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

One thing before that, though: are these assertions expected to fail?

    const X: i64 =3D 1 << 31;
    const Y: i64 =3D cv!(1 << 31);
    assert_eq!(X, Y);

Or:

    const X: u64 =3D 2 << 31;
    const Y: u64 =3D cv!(2 << 31);
    assert_eq!(X, Y);

Because that is quite surprising, especially since we say "with the
target type inferred from the context" in the documentation.

I hope that helps & thanks Eliot for working on this!

Cheers,
Miguel
