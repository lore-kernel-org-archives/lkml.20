Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793794797;
	b=1y1m3MdVZSZCj1YzWHZ3L1n1xdNBUbQ7CrSd0cLM52CjkAoiQFI6BxuL2JWls/1rfKGK
	 Bp9WbXDGDy3vf8A/cZRGsXygmcjRFMngib6LZns4L2QaUCMOt8xUOt5vduNkEYTdKutNs
	 Oouqy0GBRC6WNykYhTIbIr4b98nWrRy8KX0nk3WQ5lPAwuem7L5+yhUKmd/UggJzty1/D
	 lgmv8JXD9/HA5nHzd65r/90GipgppBMIeaW1vxTdpsgj0C/8NcwP5QKgvPHrmlxt1I4nj
	 HghHpgrs6SAWKgvtn3Rt3Wdky6mk9wNCcDo+HThSvZq/ngT153vIHRYbkq5GC7FCaAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793794797;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	b=jG+eijQ18XTcwvarM7gUo5g4GSSONK9GWNns03G6S9w2zQ7h7KWIY5sBnyKDq9HAzN/I
	 h0CpKH0sjhNXWXYgZMmpkEt0zmiWRxQ3nqATtVbChQt6zghOBu00Wv8cuwX/e/+UXC8gA
	 gxUMT++1k6ozWSx0BNmMao5iwCHzH0D4aqIFlwMuJCHWagmPkHFNnapGccWYt69fdfeGl
	 HUGJH6UBj4eWvQuU1z0ErpqVVk6Fa6vx5GbZzIY2uB5CR6PoZHn5FQum5A12OhBffhnrK
	 Cz5gTXHtqDmNlbZ+JMMhTfgpRIKQRFBj+885pcIKn/DYHrdPbaY90GRfJzmbcvTsl1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EF4606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bYBN35i8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7787D1F00A18
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794796;
	bh=pde4IRbJpAOQk7JvedG1bHbUGI9ubFv6COFmYv6a2fg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bYBN35i8rT5dyUuhJZ8BzmjlTk4ZuycAfAqFlWU0WkCYVmOaCqBtzm8g/W+99MB1/
	 75sEn6/l6QCC6cm9mgv7+2/mTAygCddkOUJHO+aSQ87vRvTjJUjW7o0zea5fOEKj+E
	 vUYzsmn2G/ZaqqzaK0U2n6pm12ZXxe6AaeQQfxHSKFTIh9cEJYOVNL9DHT6KLwBvFC
	 bbehIR7G3CAieHZv/3LCeSNp1CUOflXI7nZhFCXjxEUXe/lgBQD/WG5OFBZnzBaFQC
	 HNKZUEXuWn+/hM19KbSogcIUgtj+m+qfc4v6Ggym4gonZ6fbzK9XD9+zTv3FKs4Phs
	 1M/I0a5yEN2YQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso381898e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:19:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxbFh0ZDLLQN6w+ugqFo+t9qz9sQL8xGXLbK8ylbmReHtza8RuiRYlsV28Xb/UMOBwYSNlZPITNIMrRbx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qiafy/bCGF6a45xtKlDZKVBzdCgNx+UmtJsfJMWrmrgiRBb41
	bcsl8UYfewaJXek86TWWZjoTE1DU4YHpQL6XR6sSDuBwDz5n5Vx29nsrJ5rOL4Tv4vikz2yTtG1
	+cH5AN7zw14mkUnU/XbcIpVJE6mHqTs0=
X-Received: by 2002:a05:6512:114c:b0:5bf:a28e:4ef with SMTP id
 2adb3069b0e04-5bfd956e555mr5361214e87.38.1793794795200; Wed, 04 Nov 2026
 04:19:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
In-Reply-To: <20261015035118.9495-1-prasanth.padarthi10@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 13:19:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
X-Gm-Features: AclHuK-CfwS_0wnxINSAmHAEPIJvv97Wm-Obrw2TLjMQq_EQye6jjyYuZrMjHRE
Message-ID: <CAD++jLkx4oQ2ZuUSUQE1Qtrk-1XSMdnDjfLG0rrOm=gt9VD3VA@mail.gmail.com>
Subject: Re: [RFC PATCH] pinctrl: aspeed: Handle GPIOZ6 pass-through strap on
 GPIO requests
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: andrew@codeconstruct.com.au, linus.walleij@linaro.org, joel@jms.id.au, 
	brgl@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prasanth,

On Thu, Oct 15, 2026 at 5:51=E2=80=AFAM Prasanth Kumar Padarthi
<prasanth.padarthi10@gmail.com> wrote:

> On the ASRock Rack B650D4U, requesting GPIOP3 through gpiolib does
> not provide working host power control when the GPIOZ6 pass-through
> strap in SCU51C[9] is set.
>
> With the existing GPIO request path, SCU4BC reads zero, but a host
> power-on request through x86-power-control times out waiting for
> power-good:
>
>   SCU4BC =3D 0x00000000
>   SCU510 =3D 0x00000000
>   SCU51C =3D 0x00001e80
>
> The AST2600 A3 datasheet describes SCU51C[9] as an additional
> pass-through enable for GPIOP0/P1, GPIOP2/P3 and GPIOP4/P5 when
> SCU510[30] is clear.
>
> A diagnostic experiment that cleared only SCU51C[9], preserving all
> other bits, allowed the same GPIO-only power-control implementation
> to power on the host:
>
>   SCU51C: 0x00001e80 -> 0x00001c80
>
> SCU4BC and SCU510 remained zero. No per-operation THRU1 switching
> or additional userspace delay was required.
>
> Add an AST2600-specific GPIO request callback that performs the
> existing GPIO mux configuration and clears SCU51C[9] for GPIOP0-P5
> when SCU510[30] is clear. Check register access errors and verify
> that the strap bit cleared. Other GPIOs retain the existing path.
>
> This RFC handles only the GPIOZ6 strap source. It leaves SCU51C
> unchanged when SCU510[30] is set and returns -EOPNOTSUPP for
> GPIOP0-P5 requests when SCU510[28] is set.
>
> Hardware testing on B650D4U with this pinctrl candidate confirmed:
>
>   - Remote power-on: power-good asserted.
>   - Remote graceful power-off: power-good deasserted.
>   - Physical power-button power-on.
>   - Physical power-button shutdown.
>
> These tests used x86-power-control with software button forwarding.
> The earlier board-specific SoC driver, its DT node, custom sysfs
> interface and diagnostic boot parameter were not used.
>
> This replaces the approach explored in the withdrawn B650D4U
> power-passthrough RFC. The new proposal changes the existing pinctrl
> driver and introduces no DT binding or userspace interface.
>
> Feedback is requested on two unresolved issues:
>
>   1. SCU51C[9] is shared by all three GPIOP pass-through pairs.
>      Clearing it for one GPIO request may affect forwarding on
>      another pair. How should that shared control be represented
>      and coordinated with existing mux ownership?
>
>   2. The SCU510[28] enable path has not been validated. Returning
>      -EOPNOTSUPP is a limitation of this candidate, not a proposed
>      complete solution for every AST2600 configuration.
>
> Is the GPIO request callback the appropriate place to handle this
> strap interaction, or should it be modeled through the existing
> signal-expression mechanism?
>
>
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

I don't quite understand the status of this patch, if it is still up for
grabs, please rebase it on v7.4-rc1 and resend so we can restart
the review.

Yours,
Linus Walleij
