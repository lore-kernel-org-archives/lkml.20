Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684112;
	b=L61IfRT9HixrsgDTUoMPVeT5S0xzVORcRm1DCqNT70jaqzGtAM4bxmjnHe8yYilRCVkO
	 wpQvbyAKF5To2IZjf5UKMszEjJtev/bV78KLZ5GTEmkyWLL0xWT9Lsve5YkLp/1UrOM7J
	 S2CDJXky7nljHZRuQ1UrXu4oLDZ14TsMj8U1Keqmfccw8UQcBLPz4l0ioH2xKCRHe4uAH
	 m2x7P6+kBLDYHBKgqlyBzViXZI5n85WjxDPE1w9mS1GlP6lN1kNLbh4Kx8qHnh4EH2/CR
	 J4T4x7MleEXOYSTWezHSqcj82WhOW1o8Hi5vqxm6NERkZ/tu7namDYXs9oS3P6zOfOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
	b=qNzg48LBzWxPWMoruMDH47pQj4095Dg8l3s/2UcINlf4m2lDFPz7wMpgLoRoocWrQ0Ws
	 AX+qqQObllM7kwHHNF4BRrSm9DjhvfM/wgS4nt/Hxcc4E0XuPjPvw68MFVsMhj1/N1Ecp
	 hiYJ3DGxy0nimjJp6Shq6hIHdH2lpMquucJ4IYNTLbQEcDIeySrCp6p0jGaW5+Ublx+Kv
	 qbUKd6Fumzdd4zLa/rr6Fjdi67ExLSHkRD/csRvKS64EDtFOIeZzW8ibY1lIZnB+FZHPO
	 B+c48scEETjnPqVB1SMQ6nsuvFmK4wwVg1DhYFuDIpRYzpaLtWImRKxRFIfhVJOObyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNewx6r4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D492C606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D492C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JNewx6r4
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35ca5244753so235252eec.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792684111; cv=none;
        d=google.com; s=arc-20260327;
        b=Eey728nnp07SnfCS1lrs0RfR5UYCjMVC5cGPbVxUQGER1TdZEHit91IEpUTUoGQdvg
         wn/mIw/icBi9p8cYdwsdoxjVU0W23CxX/rzg814stEZmPjpKXraw/PL3sl13lH4SArfG
         5EUjlF8j24oIS/YrUMUIU73ZNXYlq1wBQRw6yzla5Db+cZwv/WLOIAb2TPMfC2MIptpE
         o96dci3wU59c1NPuEywTWb0Z3TSyYhP6elRTfpYQJsvYSD9LxtwU5UeLoDuPidvSZY/4
         d67i0tuxpiEdqMgfYg/ZkxNtZtTOClK3eOKjr/YOje7BRcvhvUQ3T2zh15bClhDe5e6M
         OumQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        fh=1IQKuVOvOniaGfgkjqszTBwzUxtuQVgABsCwMdB6Ebg=;
        b=E7HnWoWnyz4TpU9GjTHckmiRPK/ZsevoFsWtxYg5BxlZaHA3FYIGa7n/wFpR4OUp5S
         bUkhlRf+tcnecxjaJfNb+JwKPe973NSwACSY9ewqVUCdm7Dw1yY9kyYUKfGEzqTVt2f3
         Ax+fI4WxaRVzMvVhopFOuwM02Sdb95//KafJUNJ1FQQU7S0jDHUK4+n4hnEIrTbg9kj5
         KQexPyx4xV2z3Gj1UWH9QEgcX6GsZU3+EsoIl/vadeGCsus+E4waGUuelLaXQsPXlInD
         Ax0Nv6YwzeDN+FxBF4lNEVdwwg9Jy9DtcnbT5hukRh+c4PWL6PK+0a1kg0EDvwlmzB2E
         Mddw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792684111; x=1793288911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        b=JNewx6r4EQHNAuLs6G852fJhVAhlQip9NRxYhUWunI5sHjt2T+nrFIiChDS1/vR/QP
         sZ6dXxtEdKSKtt8wRsyHiqFDFxNKGLvjHlohrcj4yyh1hQHCRXvwxl89siHQ719WiQfO
         Iz3pvh+2ECWk61Wb4btYWUAdugPPimMXs8Ntnpxdw6vFaGGr/2l+Ea0U+fh/HbVgqWGe
         4JtXHxgniYDmhkOrQcSxJjlvFi1hBR8Q29YxfprFQV4vjfa45nHhfxxJQvX54/xLdcQm
         DOywIVpU3LOVxfwDEEY7idCMmUBbfEuynXLEpxp7XgTJ9WmWuPJQUiOOTvg6lPvVRqtH
         8tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684111; x=1793288911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bJTRxbj/+xtKs5WrYdu78XioBjVWGyc6iaDHF9orK0=;
        b=IqaBXumfjsOO68o8JXyhVTKp902rDMKY7UTwoEH8nrcOOCEcvrMadyAkAkPnoBnsOP
         85BGm+fFZ4CFzAIJK2QWEinx2KFWV9HiPbfW9fgAQBCdVscNGW4JemYpYVs8Kh+hWnDd
         qkanIRFRpdH8Ya634HT9v3jZDD+i1DOru44qD/6pV7BiXmC6dNllssdBuB5qUbxLG8IY
         62kcyk+gxz6RglVCQPa7vBEsm2HPbTwnFgIIjKw62tz02CSvb7BzhhyhCjtDlwgUFD6N
         /hgKHuEit1qe6eKYGAT5s4+SbwljCpkD5ll6Si2DDgcNKC9PwgQ1xOUTp/iKAIzBiKf0
         4HBw==
X-Forwarded-Encrypted: i=1; AKwUvBz+OoMrEiJhia2QfS7MaEx8GdDH7s5KDhevIV5v1UInh3qPxMyaNs1cX8iB6QrAMwVvOq3Ni7qE19PW6TA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIStzoFoYVM7Zc8yVRgJfKimdYcmpitQveZKQ7yjfMDlQ9BdIGr
	tDNry4/9XiD3MgULvlDn/kNqDXH2ewEaRaSYEFH0UufXg0ekex2yZGK1SP3bnFBSpHHSPqph4Sk
	Sf85jrQdPeOioLdw1fwZ8R0EKxFHWyDA=
X-Gm-Gg: AYBFou1oHNfm+ZxgM2d4fMgUIv00vliZWB8pnkv+BgnZbqlUvcX4EbhOHuIq8/tF6Zb
	SXQDJ+HKAnpp0pNr9tIPpod5HU4zhHGwm7l+aS5TagZYHDk/Hi3p48uLD4vXVWoxBxK6WAyh6q9
	CxuzYSWwDywopAQgIR3cNXq1uE7zpn+B8O/Tb/fbL/q9DMSvH16XWXxzOKTn8rYOHjdzO8PM3Px
	3xrHIf9cYeg1RsYGGqRWG0D4f0UNaTzSLVCdz2x6xvRby3uCGFVlM7vjF/YTBWfPODZDR/xDk/i
	9RLBptv7AFuvD+7tkTglA4y+rSYP7L46mx+FpYzQ5+WIO/+spyU9b1CcqTvqmEuLxelKmGqY9+g
	gDMvvcoFd4j6QkKL10EfKYYcNHTG15+RmC7FsT4qJ1DHnV79SRaa3lAcXfcUqBgGBNsuYFLOLc9
	G2majvjyQ0sk+AFEhRP5SYGByMahvEyqw6MB37q+Jou/s+JRcvWj0aFp7Vru6jWnNVSeC6pVPXX
	VUcrDsCNSe4oNpuN94P/TfBFkLkwfoXUxmn1CcLwLn8YBr+6YRCxrKUGQ==
X-Received: by 2002:a05:7300:e9d3:10b0:35e:d21c:f33e with SMTP id
 5a478bee46e88-3674ba26154mr13178380eec.1.1792684110767; Thu, 22 Oct 2026
 08:48:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018163459.80579-1-ojeda@kernel.org>
In-Reply-To: <20261018163459.80579-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Oct 2026 17:48:16 +0200
X-Gm-Features: AclHuK9JREIBEYuiD1RQ91TL9RmX3pQK5wN_Po_GP3ZAut4w-NocityfU9dUQvQ
Message-ID: <CANiq72mGByRrOG5338Z2ntgrA=e+5-BpAO6j4cOVt4Xd1vasGw@mail.gmail.com>
Subject: Re: [GIT PULL] Rust for v7.4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 6:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
>   - The DRM one in `rust/kernel/mem.rs` should clean `rustfmt` with:
>
>         use crate::prelude::*;
>
>         // TODO: `Alignment` should be moved here as well, Rust moved it =
upstream in 1.96.
>         pub use crate::ptr::Alignment;

This is needed after the driver-core pull (the commits were shared
with DRM) -- replying here in case it is easier for you (Linus) to
notice:

  https://lore.kernel.org/rust-for-linux/20261022153844.30689-1-ojeda@kerne=
l.org/

Cheers,
Miguel
