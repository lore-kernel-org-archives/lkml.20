Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342F9514751
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898012; cv=pass; b=SIA4JTqTk6m3O3nHcuaRrYveH2sSsArlkmT2MxmUoYg806TPqq2tN/arZUG1NheH6likx0itN7YpKyt0oFGNL0Q1O492dHKP4St/6BzeO9NlmfcbB7gIAGE0w9Aw6H2WdeAD6NJOs2h94nyNtQLatgAH3+uFe0BvVSTyvM2MjcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898012; c=relaxed/simple;
	bh=lExLfL8EGZo1KdexXBFgjyFCjMP6bRK4lgga8bV9zCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKgRw+LyD0fseQBUrAhVhCpHkySgcKFn61ksbqCGna45u1EtawEeRSBG0/E3XT3X5WE4pRxa/pA7niJSgF0reKtlEE3pzTJ+hy+5ZNLazJ58I855jG9kelMU1iQIrHYxQTlkan6BuSuk81lwOydF9J5H8BvVme00Fvm61RwzPNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT308IiG; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT308IiG"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35ca5244753so80944eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:26:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791898010; cv=none;
        d=google.com; s=arc-20260327;
        b=qMKrvJqKyJqnBvGSGjK2doSFjCSz31yf6iEHJkppxxfzFjHmQ+wJRNDHYpwtQ56EGm
         Z6FwdnU3kOkv7bt/HYwColz22h4aiETvAE+FKJJN1poA4aPm5edrsiLqXTXA2+BEaDsL
         DkU7qIqMuQnV5lZE9hgTaIM7uEGU/eJ7JYhdOP8xolUMQHIitFKAPbI+Flnnuq777xFx
         xndq+lAMbTVJHkDqx42JZC8PVOXR2hE6/wHyMUbZmgspWn3rnX2E7hdk7dCwzODkSD3P
         M4YpjCz7M+oCl7rgnuAajxg99BNrHwsMhJU4lDs3aGxPo3OijPIFNLlL+i54r8X5+9aC
         Iq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        fh=W4bNg2/oigQQIOSUEwKlrNwY90D4O5ov+bv0GZ0ArB8=;
        b=dRpfgTd6ZpsfR3RQyQFDfe5q38ukIo6SFMvgXEgUFYRplUNMXEX/kIjEzMBWLVwsMY
         B+qjt/xB+8O+uut05z3KA2sJXPuy+zuOaH/7OtwrZeiHr9oPSnFauZNJNt+KQd+I2M22
         aiJFxXqeBIkpLLTQRlNgGW4SO8Hq1FaVfOP9i5E+41BO7+0yhMA+oP5b/+4yaBsOgKjE
         aDEUGWtDr3bmg50jYVlSLiajjcOKRlsx1Lj5tQ5/O2F5CSLaqqW50ElHBjhoxDHzXf+J
         XVbG/+XuYW44HuU01gvrT1cQ2o1Nw3OIBmX0ZiA5WX6mxMxCiPQLJfCvWD4Fnn/Jf2RJ
         7ZWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898010; x=1792502810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        b=jT308IiGKDw6DdKS/nG4BxHPqW8EmqqXkJ6j6TRLG/+MnhEvOh1APy3h3IqZwDKmDx
         b9ikUZT2WSc3RtyO6skrACK6aJAWGy8Dg84BZgZzBXmSWVH+9LhHTrRMgLdNPHvdJLSL
         J1xePKRUhOZqefOOrSqW41ggEaip1AXozfVPqSMNilmozf/MK562a5DdMht1+SvhYrd2
         J43EXBzyu6OxuoGFLKCtY3iKpCpVxNdk2OgnbiFiQnJ4Fcelui0GPfXH1rdTMp5h78GZ
         1Q0asL/0Da0a2I2Q32NKC86tKse9vjcyssUbrp5Cc4yNFv8L8ah38DJVz9scEGFDb5hO
         a46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898010; x=1792502810;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGIxI7204PZMse0yE/ISC/r7QTFczS4XL47HKFAk11s=;
        b=r3K7O/0rOVJI8f9AK8pp05UEZf/0N3ZZKoM0Ij5d+7AQG/xxORqu+D7jtkk4naS7uU
         GcJRmibeU09pp6WdwhBfdlpnagR7TSkUeT4WQieYPYRgXWF5kttoKmugi6yZvkr20EOe
         ddXdPg58BDXCJFSAJ1LNQj1dQWsmvOwBz0J4GbmPeT6fxt3RnVp4fFWd2edYf4uWUN7E
         28FAAyJyGz/mDATkIj3i7p4hExTGPqSdBhLVQzX3QmVPHmC92DbxMf54aLkyJG/62/Vl
         8YsBqzA8gRv4bKLWV6VJ1I0JzeUx7xMZ6YVD/vTtktDJWlPiKGC7glZc7PAoUEztpfYs
         MB1A==
X-Forwarded-Encrypted: i=1; AKwUvBw2zzvMGCqDQTTcirmGcxyppQUGqzhmGMp1lIAJBifPiZ4eUUVQ1LpGB3JDY668t6XqbpJmYS+AbgrFBf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHNO9B2xfP9W/WPbRTQCBetuGNJEm/gJTJXIfFQfioUc22bPz0
	xtzWTlNCRwcfpj9dUA6VqP73fblKwE6lgJtnMSte9qdtiyZup8mkwuN/p7bwZfRNJWWcloiuh1v
	h1xYSJ5B5SaYaNeRDaOxI3p5EHO9LIQM=
X-Gm-Gg: AYBFou38ZfXsIxRIv/73Y3anwZNRCfRybpVP9Jb2oMtnLM6jgfweBaKLwAwCLobaNYL
	nomhnvg3KsBUFB9WM23DEeXvxQENrRCLDbu6qklD+/36co6TK8oTvlj4beGtCR/lNJbWi8ND5EX
	s03sqa8nIUZ3g+A49tR70D4Gbw09xJ5fbMsFyxTuR9iKCnm+BCAwt0B/aKlE9QwqYnSVSZNjwpL
	VhdjQP7y3qTnUH4xkdR8dyHrL58iZ3+xYkqPuS82gyoRQmbAVu7+hf6eHgYeYsvLCzzfyzXwUEF
	rg7eorE0SdhsAShtxG6ABF0AlhEXlTVoadgOSDg8/Po7oZ+p9SULNWFh3VyQQtKTfG+RI9sXEN+
	eOokSrYtsPFwHpiyrlx/MowDCNu3kTu9QXbt9O8p9di2XI+jN9qKyEgIcYFi3Diw3lcfrinIGMX
	Unv4k4zsZmtCQ7PRmmbdn8Inke8248ClnzjE1y85swMU6rZSFbzfE=
X-Received: by 2002:a05:693c:8810:20b0:35b:cb5b:c71e with SMTP id
 5a478bee46e88-35bcb6b1c6cmr7485005eec.1.1791898010056; Tue, 13 Oct 2026
 06:26:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com>
In-Reply-To: <20260930-chid-v9-0-0d6cca376cff@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 15:26:36 +0200
X-Gm-Features: AclHuK8MId34SKofgkVHxoilN91tJK91SiQlB8ktXLqMDzqKOFOns7JAmHwAjko
Message-ID: <CANiq72kohkx1-9iendYSD4gML8wv5bF+HrY7RO2vagLhtXYSKQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] rust: Add support for reserving of ranges of IDs
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 4:44=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add support for reserving of ranges of IDs, with a usage in nova-core
> for channel IDs. This entails adding bindings for the C bitmap
> API for ranges of bits, then users of that in `IdPool`, and finally a
> user of `IdPool` in nova-core, `ChannelIdPool`.
>
> Channel ID tracking is needed for allotting ranges of channel IDs to
> vGPU guests, and later for regular host channel ID reservation.
> nova-core needs allocation of a contiguous sequence of IDs with a
> specific length and sometimes a specific alignment [1].
>
> About the tradeoffs between different data structures:
> - IDA/xarray do not support allocating a contiguous sequence of IDs
>   (ida_alloc_range() allocates a single ID within a range, not a contiguo=
us
>   sequence).
> - A maple tree works, but is not as good a fit. The ID space is small
>   (limited to 2048) and aligned allocation needs an alloc_range()+erase()=
 retry
>   loop (plus a Mutex around it, or new mas_empty_area() bindings) that
>   essentially reimplements bitmap_find_next_zero_area(). See the maple tr=
ee
>   version at [2]. For 2048 IDs a bitmap is also considerably faster and s=
maller
>   [3].
> - The bitmap API natively supports aligned contiguous area allocation
>   (bitmap_find_next_zero_area()).
>
> This is based on drm-rust-next and depends on the cv! series [4].
>
> [1]: https://lore.kernel.org/all/84bc8bd2-e292-4b84-9580-a1b5df4c5bdc@nvi=
dia.com/
> [2]: https://lore.kernel.org/all/20260710-chid-maple-v1-1-4ee869055268@nv=
idia.com/
> [3]: https://lore.kernel.org/all/20260717053241.916441-1-ynorov@nvidia.co=
m/
> [4]: https://lore.kernel.org/all/20260917-cv-v4-0-547ef5727451@nvidia.com=
/
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied (the following subset that Alexandre suggested in a sibling
reply) to `rust-next` -- thanks everyone!

>       rust: bitmap: use function-level cfg on kunit test
>       rust: bitmap: restrict bitmap length to at most i32::MAX
>       rust: sizes: add sub-1K size constants
>       rust: sizes: implement SizeConstants for Alignment
>       rust: bitmap: add contiguous area operations
>       rust: id_pool: add contiguous ID reservation

If someone does not want them to be applied for some reason, please shout.

For the second one:

    Cc: stable@vger.kernel.org
    [ Added a few intra-doc links. Added backticks to C types. Capitalize
      tagged comments. - Miguel ]

By the way, I didn't modify the patch for the following, but we should
migrate `id_pool.rs` to the vertical kernel style. Also, before I
forget, we can clean up a few consistency bits in `bitmap.rs` before
we keep extending it (like in one patch here) -- I can copy this to a
"good first issue" or I may just send it:

  - Fix the broken intra-doc link for `c_ulong`.
  - Add backticks around configs like `CONFIG_RUST_BITMAP_HARDENED`.
  - Capitalize tagged comments like `// INVARIANT: ...`.
  - Make periods consistent (adding them) at the end of bullet points.

Cheers,
Miguel
