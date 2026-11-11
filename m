Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794402137;
	b=BERnwo9vCpJb2k+UDwyu02Ra0YbArb0aV2IJR2qSNE95OpNlKo8m2J3SaEDpk0QsBYJ+
	 ZPNlpx769eRwSrMAHc/9QGjBJVZ9yfq+AB0AJko3z0TD8bJmw1OwUeKQ7OCteceCA3LuK
	 TIqFDi0xx3mRYOOb1l6gHpTyqaD1GPIgIO7Ouj4s9yEZ0rw7SDz/mMUO63HZao/Q2+FFj
	 lQjVBvSaWLicyjDftIu9mRB+QtQHnLfTizs6wWyYnoLbRcB4QSNscaZRF8SSgWZIhZqad
	 nJxhN0BR1QbRNGLYmcu9pHLeupEk5Hw7DOqmd5Qm5GG1C1IB2nq6vtIgKx5kQzuQ6+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402137;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
	b=HCI/hx50TSSGsdM1ZtA1SCzhDdvrKEgQQlDz8lBI5QZNPEpKZyRMRDoZe5N1TQTos4C4
	 xB4d8VUiWeK0yvkIB41E0S2jd3gGHj6WqzVJZTBH31Y7ZyCZqvXiotNu5i2gzNUy+O4sl
	 8nQZY5Hh5mrpXGVuc6H/GlfzspL9lLBxDl968Fo17Cq0sReeZIBK0IsYtib2b0jZnj6OU
	 Myip+9kNhYHKzVRoOqDmRlmZ03jHNGlPsCteM/csDmtNJWMTf05XKPr2ryP1pHyQlkCL4
	 SumbkwIn/iS7kIbGX44nrgYmm7pTy+xMZFSSUtKDBwzqr6fqR4h8zMkUTnCxu4YqKLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XU2lr0rW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C2B606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:02:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C2B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XU2lr0rW
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-483a66818edso1632352fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:02:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794402136; cv=none;
        d=google.com; s=arc-20260327;
        b=kdFAhw6AnSoTXs8nLNmssBME5YXQI0LHQGhfJFNkpRMCbkhPO3gDrZM5WrsQuZ7Bjz
         v00DzCL9CQvb1zrFlhZKR4ydetW6wlzvRtZsc7pmtaneCm7KNJEzPJtiBg/7Uq6Ndgyv
         5DArYqIg3e97RoJjCtNMRK0c7uZPM7/H2uKryz1tIbNMzp1rXZAfdvSK/z4rxsrLwjXx
         /8LLHbu1v4jzXLS1rAB0iaCjcxwGwWAjnWLb6VnftYMQCIfuF9JpgpRsOcFMxNduCPVU
         z8vQ1M0y9XOJXsArPGJqIF+Rw0NlXY/TMenYBAu8wArC9ul284wzoZmLnWXrqINfWknk
         ywqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        fh=VckMhxlZ1Gj0vWl8z+GTfEOmCg8lCVVAuSGkZDihywQ=;
        b=WUVC/Bn0A1hVbT+ET8gPYyP9uzqNwTNGiuXmYof3hwz2KLFn7oYVMtRMys+Bs4g+8H
         WV5uXIDK3ebm+Koum0m/25YOOo4480UlT6w+E/sSFsHfYi7nb+mO5b0UmDAtauK2tMLe
         MQbDPKZhbcJ6+nnTze+LLirFzGIZJVbHqCOTV5tqkDchIR9+5KgO4OKojIXD87cq7/wr
         8SkpgkZf4L2a41OxHhRXm2HCZGrum9Pnn6LgIiS42Py88ifqWX0ckgIa0MqqXFDTdbID
         NI/gW+QMUQSNVyl3fqcYLrseWQ2ueFrDC7uCz0kiEAoU5KF1cVgZfLhF33grH1940Cj6
         14lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402136; x=1795006936; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        b=XU2lr0rWzFRjJIIJUzN04OUmRen1C1VcmIGzUXnaQVk6tg/62Lmfbbgx7t4GTgDNRE
         rb8rVDc5VFFcOor9LRkTxhNbJAVq6m18xv+Vfr1d1On6AY2mjaLNmQYu6CTwa1xYSt4L
         FdcQy6fo3o3MHaZjyAWtWH3UyQq5fQdTN1ZjSNCc+C7xds80ukr7KE4LZx1A6eb0H69x
         w0PJC9RgsAlctoChVykksVv6uZRisbfaKmLxMtJJDHEdBpwrHzKpBUkTtCH/Kye8LOOb
         FS/xLl4/LzHiiApjZTMiL9S7dJA0bEx9mAOmzipxWcVMd/cZcuXOvlupPj0I++EMCqHo
         cRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402136; x=1795006936;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nX7qc9rNmcYIZ7uf5CPDonzii/Z2ibr+PLktCg4La0o=;
        b=Moas6neFMsX9M49f344iAf8gqQqNDEJ9hIYyJCwVcUCMTvy5krndw5H0p5Cjzk62Dx
         i8lmXhk2A/MJzCpLa4H2B+mfvQNWf26YU6FgWtPBlfCDwjtmRVRgFBAyxsMt6j6fQyJJ
         Q3/4cq0Vk4Fgb90KYQoiRAYfBcJNozCu2jWSccxv4llfe6U2mAWLR09x0L7/UQ/sDk+T
         3WyIwqDuAX6LHn2l1oplI4T9kaMdXYs/lvs5eadvLz0244nXR4ikiwTVf0XQZScdbQh6
         hF6E3Qd2ZkDw0DsOWVkVjtn4GZ3l0yqkyzs38LxkzlIohufekjARnZZnMMtJaukjFmwQ
         rE6A==
X-Forwarded-Encrypted: i=1; AL+hErHkshneG7w6Gjqjzau0Syp8YNtYjqDiYvJ6/RP/rPqBzB88su5gD6Hi/Exwd1WyxISaxSZYrmHiZj6L57c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TNf37GSJkuP7rwjo8wQBPmSUrVFQVjOdzhccHIk1BLplzDcaQ
	UlvYq/AiY1DjXWWT55zAFRTOZotND6gBDEM+fYlzJpw/8KTtVlgxfawQhvprl4LX3gqpk1Qp5jA
	nPxZwqJtkr9YCkHC1GHZQFZI0MCls+UQ=
X-Gm-Gg: AYBFou3B/xdWkZpG2J76YK7Uw/00b8eIs8uO5M5S6W73r8bi/WE2PYPyCkc6M+Xxdee
	Ubmv64mNHrdfpRHBxw6oQPzPjazaPuABq+o2Xdd+XZUeWv9uFAlcpiZW20b4mFRN0qdiK21BCel
	c4r2VAOMWe5V3giwtu6ybaRJSbdwrjOG2GwlzwqLdrT92qHrgitOT/gWUeTQQmJtnP7vnbq25xz
	AGIqeMPzvu0GWeEKd/CeQcj+peafA2Fmw4yNSpbDHwQDN0CK/Fxf6TIyZbkG4qLyjAQjQBTOzk8
	A3FoycZNcAoW1nJI4Jwcp17C/HBpfG1HG7Jbhoy+C/nKcmZN88PlkGwTdJu+e3Zot0Lw/BrcjXw
	OOYHO5kTsimuThDwS5x7H/0IXRwt9yZpiD8dQDg5bYtx3yOP5wUAuNQgoCSDCcnrgYlpS9kfhWi
	V4vK4tGe7woAxxVlnY6dO03D560MMsJpJsG7Szo9j6iud9oLiLzCGMoEFM
X-Received: by 2002:a05:6870:ac8d:b0:4ad:8667:442f with SMTP id
 586e51a60fabf-4ae46b1d1aamr2290030fac.25.1794402136269; Wed, 11 Nov 2026
 05:02:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com> <20261110-exp-phy-rs-maybelocked-v1-1-3023cc9055e9@gmail.com>
In-Reply-To: <20261110-exp-phy-rs-maybelocked-v1-1-3023cc9055e9@gmail.com>
From: =?UTF-8?B?7ZWY7Iq57KKF?= <engineer.jjhama@gmail.com>
Date: Wed, 11 Nov 2026 22:02:04 +0900
X-Gm-Features: AclHuK-SC0uSru3uT5u5C9HU1bsCE1Mn6-6Bwp33kN4egHoHVGBL0SbyXWSBoQA
Message-ID: <CAGAB664Z1avii3rw6pSu4wT9eCmwYJ4R08ix2Z_YNm9KeEs-EQ@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] rust: net: phy: make Device generic over a
 lock context
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko's review of this patch was sent off-list [1], so I am replying
here.

> Can calling genphy_soft_reset() on a Device<MaybeLocked> cause a data race
> on struct phy_device fields and bitfields when a Device<Locked> callback
> runs concurrently?

The race comes from the caller, not from this series. PHYLIB calls
soft_reset without `phydev->lock` on some paths, and on those paths
`genphy_soft_reset()` and `phy_init_hw()` itself touch these fields the same
way for every C driver. This series does not change what runs there; it
makes the Rust interface match that contract, so a soft_reset
implementation no longer gets a `&mut Device<Locked>` and cannot call the
methods that rely on the lock. Before it, the callback could do strictly
more on the same path.

> Should the methods in impl<Ctx: PhyContext> Device<Ctx>, Deref::deref(),
> AsRef::as_ref(), and the Register::read() and Register::write()
> implementations [...] have #[inline] annotations?

The moved methods did not have `#[inline]` before. This patch only moves them.
I can add it in v2 if that is preferred.

[1] https://sashiko.dev/#/patchset/20261110-exp-phy-rs-maybelocked-v1-0-3023cc9055e9@gmail.com?part=1
