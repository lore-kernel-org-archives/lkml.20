Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0883AA4ED
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303615; cv=pass; b=qcN6dxbN0hX4U1XWzXQ0Bmsl2obH1aWTwlGaizVhQPbe7qzMsWqAxgdqfcKnPDbhM5D3gcgKEWvcRvyNzUpMRnTlRD9GDTfidujyjKQ4c6ITBrv2vJrp5/ITfu8nQo+P+hmnfU+V679L2RAlkDNvGjGj5JKDol332TdcxZJq324=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303615; c=relaxed/simple;
	bh=1EohgyTendztVlDk+2uhEI24wsVVaL8E9Q/KpC4uNBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak+QCwQip9CaQN78JuegBBS9VDUJokIbVSI/3mxPSo8we8cOAWH1WcQXCgfphHKbYRv8NylazjDCqPmWdD7OtL1p9cwZ7buHplhg7lIY/2qudzSKYn5a1y3wX4JnNB2NBZdTEA+ihGcEhabSXh+hh+3xSxb1wNm2eu32XqG8CWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BO5eB0g+; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BO5eB0g+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-384c94c9423so42580a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:00:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788303613; cv=none;
        d=google.com; s=arc-20260327;
        b=orlBEZ4eeBoUwNeyiGa4ECugs9P9myDWJMT6E1XZGRgbZJyt65crl58iCwC5nD9mZJ
         hfutSZRBZlGkFCDyWkxTRj7cHKEXweq+KNyCLjS9oK/XGzLVqhJMvhZQIjbvjR2LGHaY
         GJMskP3Hx3sygRZjuVEsqgeX5P+2KgaCpLlAW4Q/IpXiJLGIho3JKhCX6aUZMnDC0LMR
         2Qcmbem2KaBatOOfmw8vEL0cH/oYnIS2Aoqq5a25MeUBbdJa5B+4UZYuuf73r2xa6XG+
         lgOl0ySoT2YE3M4UuW/qpdYsLe+OZWkKTL6fGLWjY4RVYd4b4vZmz90hUW9cql46kGmC
         BrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        fh=j4+brEI1757k5yNNPHK60xk5mvcPLE6YmP3Ef3sIP6c=;
        b=D2TWYOq5h1zngESy8FiPjYumWN1IDnn6JPaf7YdhBQA3z56dU+1fjj54F3sRf32Pzp
         2jg2Ge+FkZb5c183EVHPnXsHI20IDcFAlVSlEKQ1DJ6PMg2/ZY9l22T7nVuwR541Q3qp
         JtQokEQe5oXgfGMqnPcNGXthkLBE1FUXOQ5T06dXS+6jVe361YAL9ruyzRc2lz0LCJw4
         QvkctUDBgKVYhoRCrQlr0JhmAGz2Ei2EW9czc3OahqIM5LiTcp5dD6RrxhiS/m5NNjmh
         qK2JAkkcAyLRrLecECqx5t3O9ck9GMgyAwdHCcpDkys8nn+fMYmYpEBBVwuYk7OISObm
         boZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303613; x=1788908413; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        b=BO5eB0g+tnxZVHVPRGmO8qWdaC0Pj61waUxjA74VN7qQTtW4H0ShrSqr8jIn1WdpIv
         jJxLGlSen3JumbU8sTuRChPCUDuUnOyk8vhCE63tuI4bzuddMDndIxk+CN28hpMIoxdy
         yc6R1r6xtClIliRKpjqh0T03lqk3UddKKH0aXA54u5WNHlBO64PVV88fTw52So/w5Fbw
         4OfdJQ54DOfy20X2wx85hpL5cQLQJ281hMGnaUJiczpSHnPSNCFjFxoVbeqJ2PZ+C/78
         O98mbs4OfQOPUv5/DWHAPCTAI+gGUhIFITi4fxzEvuKOt0CfvefWFfvVGMWk7dpbP65L
         aLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303613; x=1788908413;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HkZyz0DUc9IX+6OAto+PXMl+WtSd8or4pjnBzMTymto=;
        b=GEpnd7xUfRsBC4YHr3iUeTGcVe8xxheNiKa+YDf/tTEzuSvkTt/9JZxKSC+G/wGxW+
         GOzvQe7nE+on6jvPS1Dwe1b+YLv1TW+qslp92DbRwGnkNMltZG0Yf9ICfM9sSgkZ8hJO
         4XzqL+9lCDIyq8p/mm7KTAbQ0+jz57lYr+uIzISTTPSxx/7Zq+EAhYx7hraJ8E/UtJ8K
         5OUTnL5+LGe3JSuMOXEnQxX8x/MBQL8J+IghWXpWfC7vM/qKQ8QHQ8f/XjieJTi2n2Ff
         S2gL13hPy7jR8LunjXyvvg63QV6C30quXLWKCZuUXRCIS4XkJiQO/YklMn88bLhB3gr7
         remQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIt4vkji61zqa+hgGj/6zdUM1+W/BiGZlqLUDWT6iY+90q/LcmX1QC8VStwwMkqOPyEgvVQCzx1p01luw=@vger.kernel.org
X-Gm-Message-State: AFuF++m+C9ZbVsUwnVSjCfDUrFFaoBdudZrHotJTnfsnjjTmKjRSo5XJ
	jY4qm/8hI2EszcSBOd5T3XJYg86JnK4GFnCgmYSUZWS2X36n2CK/fKRIDfWWZTYvOtNSLf1kX05
	A7tQpP9UCTkJD6L+vyPVv1AkVKEUWjPE=
X-Gm-Gg: AYBFou2KM6N4AMeTe6kl8H7QN50+kqj6bvDA/bfwi/wOe3xRnuI3GlDFs+doQO0lUzk
	lzINxBGCylPayc3UKXR5yxHsnlFs01fo67gMmlWybsJTgYcDaMGS/DA/tAfiBTkgOJl5tBw0+rH
	dRKy9+jjR+sAclgHtNKEYgDGuKvpE8LEcIR+loleTFnYpWTkzWUcy1ABQ0JRQ8E7Den7JCUljj9
	cmp6VK9TDOltl+QImydgUt7Ojsk/RZbnnnaMTlztyGn3xHdxTTcmINO815chnATMnDfjQsa3nCE
	EY4b6o916rbuPhC3vR3oHZqO2cD6mC1/59TeN6Dc+jaRFlKOxee9YHSL0R4SgHvWUretpheKh0l
	YouWswfHqdAkCO4NJO9xjy4mOstN2MUk8I5TppKquulWfkXGGh/BJp184hPBv
X-Received: by 2002:a17:90b:590f:b0:398:bac7:72d0 with SMTP id
 98e67ed59e1d1-39aee222c37mr234130a91.5.1788303612233; Tue, 01 Sep 2026
 16:00:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rust-reverse-randstruct-dep-v4-1-3bfa19efe1fa@kernel.org>
In-Reply-To: <20260901-rust-reverse-randstruct-dep-v4-1-3bfa19efe1fa@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Sep 2026 00:59:59 +0200
X-Gm-Features: AcwNN1V6mJqATHgXTZuy_n_fFgcdcAsp6sZqZ6O99j8lAs7oSu_PsUpXZ9i9pWM
Message-ID: <CANiq72nOk-gbd+C9oG5y5RKrYhqNx+BLcwS-8u-uHxUjVTwEtA@mail.gmail.com>
Subject: Re: [PATCH v4] hardening: Default randstruct off with rust for better
 allmodconfig support
To: Mark Brown <broonie@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, linux-hardening@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 12:52=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Currently randstruct does not support rust so we have Kconfig dependencie=
s
> which prevent rust being enabled when randstruct is. Unfortunately this
> prevents rust being enabled in allmodconfig, our standard coverage build.
> randstruct gets turned on by default, then the dependency on !RANDSTRUCT
> causes rust to get disabled.
>
> Work around this by disabling randstruct by default if we have a usable
> rust toolchain and rust support for the architecture, circular
> dependencies prevent us directly depending on !RUST. This means we might
> end up with a configuration that disables both rust and randstruct but
> hopefully it's more likely go give the expected result.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

I thought this was already applied:

  https://git.kernel.org/kees/c/3844a38c9c4a

  https://lore.kernel.org/rust-for-linux/178733378275.2181196.3186172911325=
132761.b4-ty@kernel.org/

But it doesn't seem to be in -next -- that branch isn't merged there I thin=
k.

Cheers,
Miguel
