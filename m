Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564972;
	b=12tTSrseVLrxNJQJBv6YrWOiZDjU+anARE7TlGEi3TVOMtGxL5vjTzZnll1kx9sqHp9r
	 yfziw5APwXtojeUqofbFHbKtPwtQhAhRA+WJKx4GBXLQXFzIdaK4P9Xo2H3MPH64kbWoe
	 Xnl98xqT95Uh1Dnfzl1n0Lb3VwmwRGHQxSmFsqOMOlQqXnB8CNpUM+HUh8J3Gffg6QQMQ
	 kkkZOkBUBHgDDUvb8Q15scB15hnXzVuJQHQPIqCd5dKTsYL3Mh+2me3D/EVxRZ64wEqoY
	 nmEQUtijIQEq5O6hOqiiguINXH7JJ+fP88ASvWmVwNamdh3i9oROLQJDbWfTQosTtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564972;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=;
	b=d0Sr4BQuWfef2cJHVAkndT07ml9gnwgiuFqJHdFB4jooSDLS7qOSICb/KoplcLv2/DH5
	 SO0giju5klKllko0jXAJiKqdbY1bHRseDS9Pd1HCj0aWli7yw+rqAsViq9NQNZYEVLzYj
	 pQk2p7jtQziDpEUTi/pSiGhmDd1U6H7a7Qrm2ay/EPgZf6A7Mpmwn8tXh47VAkYCO97we
	 6T7QW0ealy+mVD817dPfAfesM5Ft8lXLIHRnJiMX8utaokUefLVUJG9LJ9lca53INCs4t
	 VH6Iouq/Uigk2WlM38msY7bN+8NY3Dm6Iy81hHNhrGcTxdJhSORHWKcvSlTJYbD7xAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEGSWt5P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB879606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BEGSWt5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CE41F000C6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564972;
	bh=KZ74UW0TYHmPuEppZWYj1rqUKpEM+BQypI3pzsCGhK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BEGSWt5PyoYcoZmBiIeq0CohHcsrFxELU+qdTbmL74Ij9U6IK5oGbyQQ422CpXCqM
	 VIHgV8e0jJqEbibLIypOeJiNatRsdrd551N13qRMc8pJAft4U30ARBSYVdhFsaFYdk
	 S7Dsd2GfRO5tHPvcEkLnGRM+saM6utpot+xeBxXg010G2IOrVqPziCd51gdUBWf0jH
	 SbZAW8bJvsDj8SOKpn8h5YRCaXerVjMZStXQ7UBhVaKPw1yvJdkXzSlxj1SAJ2h9zw
	 fq5c4jzYVz0PTdMD+tpsvR6QFNQWk1wJnzCNB86VKNJaLqwoJTv0MUCcnSApJXRlRv
	 IAYUDTQaP6Twg==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a85c656c58so1046950fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:16:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFxCE4d4fEDjn985Op7A4b7DoWGI95tFFIzvORRH4VCFTsy/LP3cJpsnJVnBYcUwwUy0kB5bgtvRivuko8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eweHnu+eZxiynBTTstsAV/9M/XG0GMpS56ToSccm6XwCVORiC
	q5ki0NEJ8lSRZWVpcor+jSOaS3R7GcfpxKFSBvCDE19g+re7Qoiiyex35FPycm66joDzw2yEWO3
	KPlNZxzevpMAvH/d4C7YS86ZQNLyECoE=
X-Received: by 2002:a05:6871:824:b0:48f:e157:eb25 with SMTP id
 586e51a60fabf-4afdf7391e8mr2102560fac.44.1794564971946; Fri, 13 Nov 2026
 02:16:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104140820.65243-1-asv@kernel.org>
In-Reply-To: <20261104140820.65243-1-asv@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:15:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
X-Gm-Features: AclHuK_xp4juiDSf6WxJ1r0I6C2KBl-UfweFaPL-sasy9mlFdKqm6R0MIJqytLM
Message-ID: <CAD++jLn=T5YPDG--pPsdbV4tGxjNFH16ZaceN-Lw7B=TSJqhMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: pinctrl-single: Add Alexander Sverdlin
To: Alexander Sverdlin <asv@kernel.org>
Cc: linux-gpio@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>, 
	Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:08=E2=80=AFPM Alexander Sverdlin <asv@kernel.org> =
wrote:

> Add myself as a co-maintainer of pinctrl-single driver.
>
> Link: https://lore.kernel.org/all/CAD++jLn8yxh3LmUzbb2vZfJFJB=3D_mCZ+VeQh=
nZktfmuMiv5uEg@mail.gmail.com/
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Alexander Sverdlin <asv@kernel.org>

Patch applied!

Yours,
Linus Walleij
