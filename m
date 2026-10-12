Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743BB496D3D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817455; cv=pass; b=NgJvbQbejWyTsouuENflPJgnQqaQjC0PrqXsqH7wYeWRMHXYUVM/1Nrqcyjnlj5EGEEOU5l+POMt7lZYDdRjyZSfadCcCOo5wO/OQcQpgLj9XQcYFg1tG77muakicIW7U6SsBh8gVf/bq7yD4JcLR7tRNzF2k2kmtVGqDdEfDKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817455; c=relaxed/simple;
	bh=ct2YHHtAR1NATrFfSOMu/0HJEb3d5oH3R82Bkhe1BMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrJO2JywRsBTv+wutKXF4IcS4PlkBfT1YiF5CDWe/nzESSb7voK4bo1W013mmd6Oj9JdAIAcWuMkAP7EYRomK6vdnbRnnbg5KOxqSS+bmPTBPywzxO3CP2GU8dhG0hLWdJqXPPwDj3bhWCq5RRK6yiahLZ3npHKA1d/jsfNlkW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKw0COGX; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HKw0COGX"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-141395927feso3522143c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:04:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817452; cv=none;
        d=google.com; s=arc-20260327;
        b=VaaaIqWwxkgTBUzTohzBYuN5vqtFjW4kZ1vqMPN/2PMNJrjigsQOZUsS4c7ZtjUMMp
         bgf1hFe8IB2Z0LVQd3ZGf0nDaeryYHXC516+kZFl8eXDLBSWTbO5pgKY/0i7sWrL9hiQ
         3i08Os8ZDMnIFrjFsp/p7Wys9m3rPfQdbKsgkx558VgtoMh9H83FmczEs8VviYX/nQmw
         EgLPHuTNbQQsrZAXOWkBI0CZwu235IjKGQ7m/bZp1oGq1tssiurCEEKmS/1/KCOOrrbr
         dzJgpJA9OGXxPp2GqBiq4S+F53DndqStWuzRHEVGhghD2ny315JwJxnNgzoBB1kWTyMH
         Qe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        fh=gukKv2ZBRtjQIwchGkb8RLBcG8R9C9bop3DNM+jngwc=;
        b=EZqn3bXiEYIrFF2fA2RhHDGspbbYw5sLcoRqXV9wauSTBhjhnrHM+dqJcCbA0kSWOL
         A94KJfZUGXVECj9TcgbjjnbJ0Wq0pbfXzsbRfoMAZCKbWigA3FnBBnQZwWAycMWeecvN
         yjuvhQD8ylC8cxsIdhRtZBuamukOySmUjfR83Qa+3bBh7DK31TonN/ScJFI619OEjb27
         28Bq+To0M/AtXxJcWA9k3W3R5Q47XAfMa/3i1wEYxYkaMlydwONJCPS4jk18Y8Jh0mZy
         Pnb/vo2CpQHL9YNAxbC5iQqaqVsIFZKKO3VaqgASaj6UB/ZJ4hOs0HNYqM8oPBtyHk2A
         2l/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791817452; x=1792422252; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=HKw0COGX9Ot2fd1g2rSqSxW9WorjwKzFbnZBPRmuYheEoiNNqEeriMmw16r4lieTfb
         Sal9x/w7lL7N+4n1RjZM4lfzI1mTypDafCvVTrmlz9u5fztU64oxznlBDZk9t9H6+NPa
         jjDWxMeqWrT9i3wksytlwMPNdzo25VCkqTHq2xFzBLeHthnCG4jY0M2+rtTvCiK9T/KQ
         17+OOu4pmHQZa4qCYCiEwlFCQH5Oz5mdAOCUdi5RuvuQTigFNKygGiDIh3QMpyULNw3N
         JeKmUAOjn6qiEL+8h6CXLKoRJXjzdp3mqCzhPYnsSF4BcacUqlOUuftE31fqu+/WUOKT
         N3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817452; x=1792422252;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4QUJm2y7YWLZYYR5r6CyKB7wSH0Mitj4c5bG4qa2oPc=;
        b=QfAbhrYVEnVfwU3kaTHIHFCLxblzRKH+I02lLRKLWn6t2dIeh7+YKTrjiloJKTNHhU
         5dUDbdY+KQoMztKdb0YgOIxY23qNPyiZjxUmBDxHRIlwD95+FkXWQbATcgoPMk5Ldfy7
         bfd/M4/4E7rbV1X0Ocbg7tFUjdQ5IUq4AZx/ChOdseIuKeiK6QdrDPTDpDE+ZfM2HtjX
         TSn1tRHnjiQyLOdGVSuZBHQThPMqnllditCBZuMKOOvNZn+qK7mIsicZsrZO0HbeSwWb
         w6HuJVY9bDQsu9uJ4iYiXT2WtuAUrKRqR1yMYC2E9b3+vEzjUs5JXbNSzgaLKyBJUdd0
         FQ4w==
X-Forwarded-Encrypted: i=1; AKwUvBykp8kX7HgAzHLtPj4jbSsg97RV9hjnDCpDW4x/oVuVBzVAGKJ5rWz2IavWRbKfPDQb3rT+0auoSBI3yVo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIcQ/8eukpubayAxZycYIJAVTx7U56kWKZ/su9W1E4bHE1PPhub
	yu46dwdcIGtsQomUByUajUHhwYI+f6+ZqXcz6UuDX2jI40hv3s6zXLcUew9UOn8mktACtyZf5ff
	+Dwd0G9BGgwoR0Akfj2K52Rf6h0Al28lkVlMJTnp5
X-Gm-Gg: AYBFou07GsKXEkLcq6z3Q6Q82asdYsbeErAWkPVJho4537B+D07khYLjJbnAwXfklZx
	S4NMLHelYypLe99ps6e/FlefTyu9A/80JUSEdYxveKh0taNc+1WoXWNBFHTpN7d1w9Quy9Qg6Yr
	J7rNlfNQH+mnZr0e5jyoAlCMxaZofBOfd3WJVJHBrl/LTVZIkeeXtMpFXQjQj4GNcyv2aSWwgkO
	Mzqh8CaqtdzmrKyj+T6Myyor75TL/WGs0hPDXHOocCnr6tIVTeJfrIy5Pl49oqlabrl+wDz6DyD
	CI1Ro2TORrUV5XPR2K/FLQYkGNrJrWsEE+Mc1ux26RvTy6fsEc/YX4RzlcqNLfEAp2X5hmnN/Jd
	Yu9bDNcvNqg==
X-Received: by 2002:a05:7022:3f0c:b0:168:3243:c91a with SMTP id
 a92af1059eb24-16a5dbfde08mr14809417c88.13.1791817451365; Mon, 12 Oct 2026
 08:04:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
In-Reply-To: <20261012134159.912183-2-elver@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 12 Oct 2026 17:03:34 +0200
X-Gm-Features: AclHuK88gg1MNQf0tKC3CQVs4jdrfXCck0NjLOHXH7T1xUhHlrbtWu0XiGM6pmY
Message-ID: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/Kconfig.test        |  11 +++
>  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs              |   2 +
>  5 files changed, 135 insertions(+)
>  create mode 100644 rust/kernel/kcsan_test.rs

FWIW `make rustfmtcheck` fails for me on kcsan_test.rs
