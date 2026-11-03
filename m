Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793705644;
	b=Csv5ovps00EAXBL+aG4I0CnJYajD5ggBmgOmq0+my5oOwW7zRF/R+z2B6Tpkz4JS0RgS
	 UKKCbPtlzbOdcHAB9wsZFiFqrN7ZV7t8zOjLGfy/1uLjnwkReZlBFB7+6bzm3fBbxwu/c
	 BTyy7icmts83Hvq5mK4/8eeplGYfKQpvR5F7DfUEqRxQv0KA43WWZOeyiyANQvw9fqmCP
	 BskeojUPISAzpJGILXm2xusYIbjl9cvlnG9L+eUmZwI2oh1jCWsWS6mqS+EdBPsafeP1K
	 7s7VlOxrrSW86Nclzg5MV7QITeDUZiejODuH7yEu312mWRN1SnhT5yEUj6I/EtF9PfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
	b=G36/ggkg0hUVMnws2dN4oHlUzxo9T2VRX3pAqvFe9RGHLA5+uyhba/vSCJpeAnEvfxXU
	 qmGHpbzoiK/1CEQpbYwLmsF/SX7mg+K6F60fEruneKsfIAzEGGg1isCfGPaQDHmVge2r2
	 bO6VOXrE7psdjaRE8jL4+7raxl2QNcJiJYkBvs1x/ZBxhspiepqUNFGf19rmgEoh5L3w5
	 +k21mqVnA7Ja3OtuEheE5oy4KFFN/5P/Wnn6pAUG7oIZ3Hg2OZpii4Sc29+z0e6xJBQwt
	 c7SOdO30ty3iE7D7JyMbparustemv9AcH14D+AopFog7DRP4b8Msqz5F3sEfwz+WkEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc59Z5mq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A068C606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A068C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vc59Z5mq
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369fc2e984fso399324eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:34:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793705642; cv=none;
        d=google.com; s=arc-20260327;
        b=gs7GEfn7v1jyG4lSEbl1PLCA4eXx2qcM7bBPJ4dtypKtVDVEaJ9tqOscOi5p2Cu3VB
         LllbW0EcHDQQNoTdQBEG2MAXD0VQk+93oNKzQG3sKm8RRjHqg0e99x77njMkfxEyQU6w
         0vwt1IZcmNUKTsIuPw8cU3N13G/RLMdkFPyU2cKJ3bpFevoxJk/CifSPp0BhDzzK9mjm
         nmFixiO2uzOyfpw7/yc1y1hO7D0UZKw8P0XogFh5AOzXCEgNQala9zge4c9cZjR3L9ie
         s1HCZCkBjVewVxEmeg9qk22f/eDvJPOtVm3s2wzmnt/ipBVGm9fGuPipr3ph1eDof8vb
         536w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        fh=Sff47SPCQaVbjTQbEGeozQtM9TIAfi0meVmJXdz4pdI=;
        b=EkKNcTTL6dkcxE8yS3muMmwlB7QhSZ/zfFwlJ3EYqIj1WoaGdeTQownvk/qiqB51Da
         lRCldeBcQJK+8P2kuEN4awGUvPdwiCvlL3WuHQILuXBK56xyHvsbbBdBalDseci9d/q9
         Lf5oAqCIm0NmXoqBHRlMOiIxKrWrRM58xPWK3U0A5bNHZmNrXBqM5lCBnzHjA6NnOe3N
         VYCkwHNAW5WhpiMHrgY6V66aJei6rzArpD5sHJK8Qe1uL+dLISouX9ORHi8XrV+DjgzT
         CL1FJFNNgMPWb7VettEmsacsZwQdnFLT+fLZfwPF4Bg7IiknqRSYnofZVlhZcLexHHV3
         ZL0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793705642; x=1794310442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        b=vc59Z5mqgpqw+XuHGExMjcxe+s1YwaxnpmpGsKrQniN3Qus0WPN8zyiA73TCOGOIg0
         zZbVgzvgFgxJw2cqjCD/sUOitM5pxutoZU/fEN4t7seN4rggPMBXw+BCFtjGM6e/rGtS
         qmhHuUiRC+ic/4hXmX34btjze1VF/CRx1PV0h5ZLNrl8MtLuwSCV//BKRRXrzG/EbY1O
         ltbbFIJo7nNpgKBqmWqMhBWd8PvtqH2ovfpE2cUwoPkccCNOYXDlp1zqRZDdqxUR9OlP
         iaZpvZZ4cpcwuKBfEf++4bTv1igu+j4gvAxdFh9085kKkcKQk18V6/+ed1FQ4v4oGuqS
         YZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793705642; x=1794310442;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cfOvbnreRRmSZwsiQ6nUYAkQQRmf3bNRhquYM+8iOsA=;
        b=O7eIbkUlAKj65Yv0kWAmy1+MqYE1x05RrakoD7FL+ecQMCE7t/Eaf7u9yfYXtglMm1
         vjwP4uNqLnvFtDGMY3OvKOJnyhcEbclXXH05jk0aayOT+IRNpISvUpWDgEIJ/irHfHsP
         99RHcKSK802IkdfNa9CrweG2H55FUY8+D5VHepau+M/yhmCukDu176F04lP4x43k/u1r
         0NJ694+56W3hJ1jZSJZgoVfRoHtWi/4lV/19Z/XUeWH423U8DF6EM3jFX9QFkQtxZQ/C
         yicr7aqEKOVrjtqukG9fAl93NFoMqmV5L1YLup9UQc5dmY9Ud4lng4eb+1pf34BtmAuc
         X5GA==
X-Forwarded-Encrypted: i=1; AKwUvBzrql7bMOiQDpqAATeL/i2wpxZjPa/c/XElyxf+RF9jAs2pXJz3+Dz5nhpfT/Yni57E96cRonvLwxc60w4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WWuHhpZTqEtmofrim4EDovOWkHKuA3vQGi/TqGNIeN+4gQmxp
	hDA4qYeu20qamda/NDjtRC3vIwA6L6jdRyuBdgbyqLw5F6njGLN4dxh8C9OYyKfQlpVi2vLJuRi
	TBE2UyLi3dQ/hVdhZo4YiEIUW0EG3SiI=
X-Gm-Gg: AYBFou0z0tMuVefVNExpxkxWuw7KGv9U9PXmVnv13IeeSIIyhX0MNPTr9x/iWD2kE5Z
	9+lvBJ/sx1HZDnniIIVG2QijAcmJyNRvvDr7tceva464CuHW+0SSyoRO00y1UkYVE0HzBYxrf4f
	qAmLmoMUY2i5IMhDFCm6XOafzpybS9MEawwMuqBIkRLCDMQl9sJ/zzx+ubetDt+Q5b4bkYP1Wbe
	HBtBQzh8qg9jkqz7C4RzNXD2kxoCdNTyk6SMbvXp6bJcV5HtBwZN9HjVQvQ2gSCTyHsqbn70g9S
	TlMRN9INZoe34WIJiX4MkLJ1l3NgxkTs7OAllo/betyCksXIdTl8+ELSb/2JvBbagPG8Iz+ef7p
	p/2kzX6fyVX9avD6VVh179bUhGQE20/3gzI6MAdOO91GD+Pxd51L/r6qEtmjbMmIj7/o+uZEKM2
	bTG2p2z4orZO16U93eAvnFktFFNCJ4ELCk2Z9czI2VTb1dg90/vC5yBK73VguFn4d0qTd4XP0NR
	9FcYi8AoqYB0d9Y2eiXOhwMXpbL7XUK/M811w==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr26403282eec.2.1793705642096; Tue, 03 Nov 2026
 03:34:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
In-Reply-To: <CAKHwh-E-7CRRG-DH6-rDfGUCFAxG6JNgswk-suTaGKqMbig5Jg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Nov 2026 12:33:49 +0100
X-Gm-Features: AclHuK-iMhGiUjJv_8E5Imp48tsrm0NqaTaFIcoPNcGmyO5xXsgwEO2YqTM6jGc
Message-ID: <CANiq72kw9+VSV8A+GvsYQrV0Qw19=6hg10Zjw9pDPOD-1nR-7Q@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: test drop behavior of Vec::drain_all
To: Peder Bergan <peder.bergan@gmail.com>
Cc: dakr@kernel.org, aliceryhl@google.com, ljs@kernel.org, vbabka@kernel.org, 
	liam@infradead.org, urezki@gmail.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:32=E2=80=AFAM Peder Bergan <peder.bergan@gmail.co=
m> wrote:
>
> This adds KUnit coverage for the ownership and destruction behavior of
> Vec::drain_all. The existing example consumes integers to exhaustion,
> which cannot exercise destruction of unconsumed resource-owning values.
>
> The new tests cover partial, absent and complete consumption, plus an
> empty vector. In the partial case, the first yielded value stays alive
> after both the drain and the vector are dropped. Per-element counters
> check that each value is destroyed exactly once by its current owner.

[ A couple procedural nits, since the message joined my inbox while I
was there. ]

This seems to repeat part of the commit message -- is there a reason?

> Base: alloc-next at 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4.

The hash should go into `--base` in `git format-patch`, that way other
tooling can pick it up (it is good to mention the branch name here,
nevertheless).

> +        // The caller owns the yielded value, while the drain drops
> the remaining values.

I think your patch may be wrapped and so it cannot be easily applied
-- please use `git send-email` or `b4` to handle that.

I hope that helps!

Cheers,
Miguel
