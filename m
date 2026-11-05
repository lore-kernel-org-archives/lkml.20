Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870188;
	b=2luc8hYGU06VsTrUjyno410QalwdqPvHkYrbQuJcybGYPjq5DV7AFkMC3+kuf6RKWAjj
	 +tQk/jaBev2nlOp7Bl3U11Lt+8kHob8XwRJTC8hy5eKSUDy4rtcIexAUZza+FXh7uz7Ts
	 WpMRKnl0B8kDx0Ng0m4o4PfJBEzmXSD4aYBY/ocUou+Xdd3X/Adw9elXq4OFqdJTdbm9M
	 EH6/FfLXl+WxKSYjQXUZPaYixAUE/mOr92hwoT4Uiaz++J6mW3SFSRjfb2U8T9YMCZg8b
	 yYRPCPI5gYGsHlgkxyO9gYRqyP18pnJgvrLrI2IC4obHg1AIKvu8JlADkjWbQKWDKWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870188;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	b=qh5az+J1XnuoT5+lLAFthx6xsTYCt0sEBrBA8odI/VDue8ltkfKzqd8ASZi8pAjTq0Oi
	 ZIhPs2yjUSTGnZz/2NMyek8Km3Aj29QARgZ6L/WFHXabo4psSWsUMjXhbCVwdYy7Xd+b0
	 yCSgF/kQwzWa9QIGsWCJO5EfM3O4imjOk7ZdaHhH9ufh/da07xuP4kanbewwswzIqBDou
	 1DLCy8786+KCGHmyz8/PoetJ7lq0WKeweCJmQn++5Ep558XBN86L1ttGjsZO4/aiQ+8fY
	 djiveotItXMU94CmQOq9QqlSuxmeldA+TMD/6edWQdFAlvA0xwZIpNMAKwjevW+wpFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38F3606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VwLynrdc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B575E1F00A2B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870187;
	bh=AaYrzlsh63Kq39GhHHI2u9iALQEdfJBV6NB3OKFCfA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VwLynrdcYLs5RvmTneK7ASfYo7Q77QES8CdEFfRhbXxKuL9w/fQpBSt9HVRFDWqzm
	 qMrMTx00tQQGit+nNf/abi3xEEV3vDAOtnMIVA02L/EjRJYWhJmIfTlqTHbdbQrQuy
	 G5Gc1eyz6N+TsMSPrNuI/umq31igbmLYNkzR0GKeSikNKD3ewxz9Xhwt+2XVnbHLn9
	 RmgRuzF2KBuB5oO1+4DhdmbNNgU1NxU7eqdrKqv9s+PRIh/kSQOrAe+StC60lUmP9P
	 zGqeM6bR8qxjiOmKEONh0gLGwjy0paXgDi5ZjSWbW+enxibtPCwiGr2nUoIWOTVfsp
	 cMcPYiOfvPJUg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab35e31f6dso3703531fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:16:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwH+2BzHuoRy0egFjnSG2E40lW77xigZ6h9T/RS8ST0rq7vtihOxb8+UYoqyDvlYgDkFYtEaHVM6lQ1nSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9y01V852TpHU8q5nfj+hqbHdbMwBdPUAg26eYPgCWJzcXB4JEa
	EYRyoZJJ8T0ujdzCCwou3klMNUMY8naihlB0QklZj/P3fomdCDlqJzG/f5DAAq1aV8aavzQwdH1
	vrevt/KVtD4CqTICgd7PhU2zpNUUBpSE=
X-Received: by 2002:a05:6512:2306:b0:5bf:d938:b80b with SMTP id
 2adb3069b0e04-5bffa170f99mr528748e87.27.1793870186373; Thu, 05 Nov 2026
 01:16:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-1-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:16:13 +0100
X-Gmail-Original-Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
X-Gm-Features: AclHuK8Z_fG5b4bwr08ALhc1h2_lYGNTUPFKnPZS5m3aB2BlXOq_Z9AX8QOoOvo
Message-ID: <CAD++jLkj=nOGMk4vveKvm8d0JY4dxwarZ-mJifrTgsDzc6g_tg@mail.gmail.com>
Subject: Re: [PATCH 00/10] pinctrl: Fix out-of-bounds accesses,
 divide-by-zero, and error handling
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Aaron Kling <webgeek1234@gmail.com>, Ajay Kishore <akisho@codeaurora.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Andreas Kemnade <andreas@kemnade.info>, Andre Przywara <andre.przywara@arm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	James Tai <james.tai@realtek.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-realtek-soc@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, Paul Boddie <paul@boddie.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, Qingliang Li <qingliang.li@mediatek.com>, 
	Rob Herring <robh@kernel.org>, "Ryder.Lee" <ryder.lee@mediatek.com>, 
	Sam Shih <sam.shih@mediatek.com>, Samuel Holland <samuel@sholland.org>, 
	Sean Wang <sean.wang@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Tzuyi Chang <tychang@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, zhouyanjie@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

thanks for looking into this!!

I'll wait a week or so for maintainers to pick up individual patches,
then just apply the rest.

Poke me with something sharp if I forget it.

Yours,
Linus Walleij
