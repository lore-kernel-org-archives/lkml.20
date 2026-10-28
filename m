Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793172657;
	b=z2Dua4GtKxbMeZMESxUU/v0H2WzcWMiH8iNKzRoVJw4RbL0epQnE/ONXYy3tR0YaBA5u
	 bmT0ylf4O4NFgDGNJ0eR3eec4BHh82BKCI4Cljl5IKKsFBCbgnxkEHz7oN2X1tGtX3qMn
	 EeJmGqJalB77i4480pMIUHGGOtnY3z39agD+8v73/XRMTwPimjx98J6dWq/dpxD4Ts5Ob
	 sRji/1m/4VVLtNf0es2G1/iA7t4rM9AAnbHOiD4EQLRlaJREJS4fb0Zqdubet/56f6WcS
	 CSN5CpiYlXxFTVP5GxglKcLGQssCTkKgX651y8FCUUMAd//KYochGp24KQq0pqz+0dw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
	b=iv6JG6u03FzJJue8z1cKpWNQDFap7VsyDvTTGhMrusgYRHBUQ3M6DzWhcc8YuQQIVnNH
	 EGy+/bUU+rGOxPKC5kMdN460OlGODpXah6jvIS0haPQrrRw5cCIVoaCrLl1sP8y5XHVRo
	 v9e+gy4MnIJlJwL8UUdREs9BniNb+muIvg0DU1LpXvT3vwDONvp+hVB6rBhx6vms+YFzm
	 YEtlg0mc3K211DIc10rimevLYXrU93X0szqd+zBW9kB3uCMqLZHbFI/q5CD/M1XTljw31
	 e9O5HlpnHNuvTgT9VcK+/mXlYnU9HKbh8yjaCCDQeoHeo5+z0fvQ1gagSx1Mjy0TBYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158460A260B
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E158460A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bJneuDjS
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-313bab9cfe7so127082eec.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793172656; cv=none;
        d=google.com; s=arc-20260327;
        b=bPklvjJBDxg4uyyFZjN23iKcv1FgknOwrnFcVOB1XT6CXwZw7PbKWmigN/j9xoFlZt
         FS8/JQi5XstbuSQ06VhMYiTssH9/Z3JWvtRPfYrHsX2AS2zB6XmV7nsZmOHEf6rnWpvW
         yQAX98LojdSY7iB+el7vpgH0dVjVZkNTAVmdh3lNjqJMoII6PbZmkTb2ypMqPE7/DRAK
         htnx/KuEC7TS5A8uxp0tBC0HeLaPVIw8oToM0yYqueOrioC2Iiauf5ZDJkmLSugvvv3q
         qlvqHmldcJVNHGhB1T0YTvzFedk8dGtw8CS2y7jn9ZymVQm53qkDrO+HIX/efZxKPxbK
         747A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        fh=Jk/UkJRIUWNpd7BgnGv1QuViYFzLD2OfvkbfxMlG9uA=;
        b=DyO1lIgYSaSddXclzUL75gytDgyC497rDxYHO0xdCyOitfYOf4K7JGlh/O5uZZc4Oq
         fFNHH9dRCXlyiRLzoN2Ap4SzkN9DBsTHVVvT03dcwvk7xLt2qF80aGzKUi0PDHMPZS3I
         uW4ogtC9o678LIXFMoeGX0GRh8R1DraOb1Sj+kbQFANfqgdtSbNA9vC6EqHPHex/IJ1J
         Z7TjsIZCTjXEEKcrMOvkk5yByEOuOBLBJ+v5puvQl9jp/VXqjrVCl9B97Gl/LygO7wWH
         fKlfj1wKfSQYtm7BMKH2YEkG/V0qdWG3gvGskgQ7Q7CIzCsQssZwH84dBx/4pqTKGx5q
         ZW5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793172656; x=1793777456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=bJneuDjSTeRtWYs9gLUzq94HuHAoFwhslEwQvNPXvw2Kkf8nTMJss5fQjjqL7AIBYP
         +OLGCb5rb4t0f94npzyFIsA8YRFRRJS3NojxyKYSJTYGqAzzTiwFflm66sPuzX630Esq
         U3/+A+SZl/zdO6wdtAg06Qbmn6YgjeW2B6plLyI6ziP7QOs+2JwIjoD1srOxCaS71ena
         TKSUL9xnCv0poX1LRcRkjNt+bemTiXtpAY0bB9PdvqM4zrtzXJpw/6xakmmH+zxEYgF2
         WcH453cXL0XYU6lfAeJTOF3hdMG5zjiZiLe9LTDgWXEcq5DT8WaKE6FbUYWhu1/eoXtr
         FKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172656; x=1793777456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gvBxf1fqNFjM1GSlcwJUneHyiK6lU7SdqO+7rEXKHc=;
        b=DqPV0de6X2Y+1z0pfcDSbr+PTQrR4uBqPE0NwXypxjQAHgLYTB3Wyi9sKrpqUUMkqt
         02FS3w5q+MVvYCJmmZDVGfvA7aNvS0uKaO7GgPxOk9dto/V/Odyh6S4RFfzq5mOrDDmp
         1Qw841XPxVlI4JBKJdnfn4qjoyD3dB2i+DBuXdZwrUyCz86YX62cED1jBlBqnSqx6MqV
         2+tMRMCHRt4ClGpzD/jjb2VGq1WWF8JUVQeDqB/QLHdeKjyS68TL5cA0+UlXtMK7dqXP
         2TCYotFW78y/Zy4DejmQ3BumYxUdbOey6xoOyQX+4rkFCjFBZGmNx+gVY2bFDvDgtc2L
         wAdQ==
X-Forwarded-Encrypted: i=1; AKwUvByHBgI7I8H9NpNbvZv/vVgOV+G6/t3rGQYx3QQqz65duYyeleubCy0MSf7Vz0t5qTbXRwzkuvlCHxXkxR0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK5h/n8cl6OwKnHkRlJLc/fqcHv6n2huKVgV4PKDjey0HAsxyy
	FP2QI/Cz4azyHctMO4TzOsOK6BUmHMATNi6sZbkeVPvtDI1AOjIS8qX8Kxui7XcdABmZe+Kj+Dq
	y0EZVO2oKx40iZQzNUwBj5fYG1UmuaKI=
X-Gm-Gg: AYBFou2g22FUmWXHM1UHqG0lRqmK7StgLhG1MAhqFABa4xRgAQESiH27QPdZSMAJY7g
	BCGkOrO5eWE7TF0EgJ22uiSMxq8JWU8ryVtccb4nW2Q0dHpRhgRZZHQwJwoRxfA4mm8X0taZYb+
	jJ9RLJFSAkXsqsXamdvO/HI3Rt7rwjaeoTLhlPS5vfrXtzQfh7Ii8zzVo2I2c6W3XUl8zUhRNS1
	p66qYunIwoOciRKql/6mv/dg4HkCh/TrvbZPx5jOWuPzJ85VIVDM590tqHwy664fS/9ani9j18z
	PH59sqnRgHKBjfBPdW1gn30IXmbB3ntbwSjdnVYCgUTX954pUb9WK/T4N3Gco4498JJt9MI37mc
	H8N9tGoM/fXhcRYnWyePE3C/VmpCo6tE++xonTs3i8hYnSV17knQM2BNEEZQkh49nTkxVtWXnHG
	SCMS/Qq8vzQRf15ZoO+ir9O+75jxgEhj6a1TiDQ+2HMErlZ+QAIcAigwzJVyM9IL218PSTHFhet
	J3xksIGe/KGCDWj1YbFt5MvQTvsI1JHzwMm
X-Received: by 2002:a05:7300:f484:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-36a1fca875dmr3770812eec.0.1793172655949; Wed, 28 Oct 2026
 00:30:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
In-Reply-To: <20261027-rust-doctest-line-fix-v1-1-0c13185a58b6@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 08:30:43 +0100
X-Gm-Features: AclHuK_uiWS-PXbCJG5cbGuuSSYIZS7YP8Echn-C46nxtbCkTjeTMaSgo2vlD0w
Message-ID: <CANiq72ntn6ThPz9Q6+BxU6w-x2jUQ50xpiy1_gCRi6o0peHi8w@mail.gmail.com>
Subject: Re: [PATCH] rust: doctest: fix line numbers after crate-level attributes
To: git@younes.io
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 7:32=E2=80=AFAM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> Twelve in-tree doctests start like this, e.g. in `bits.rs`, `devres.rs`,
> `init.rs` and `std_vendor.rs`.

This looks OK, and I think it fixes all the cases we have currently,
but it doesn't cover every case one may write (like a multi-line
attribute), i.e. I was wondering whether the complexity of this is
worth it or not (especially if later on we try to support every case).
But it may be that never happens, or happens way less often than even
this case that we may not even care.

By the way, why `saturating_sub` in particular? I guess because of
underflow, but can that happen? And if it can (perhaps in a future
compiler version), wouldn't we want to notice?

Thanks!

Cheers,
Miguel
