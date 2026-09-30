Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453EA4DA9D2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774524; cv=none; b=Z7H4sosvc1S6L2UtISMs5It8V4XeeGRz2rM9PR0r/rSgG/wg/idcTWR/0jNfDaHYdXgLGPhBTD0eWFr//HPTzo2yrU5k+kTsKPCqUVgAotc5Jlcg0hC8/UnLjw77q6bjYlPMl3yOlrEulB9QyAeJJWWB2Pho3oTdWSd6O6InTw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774524; c=relaxed/simple;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cqTHtiv4mezP2nbyhB1PQj9hwddUo/3VCO4n/wvdwKryJCAIX1CDGxc5tumPYsdWJ8geBQ6dZ+HQtqS71jYzTfUO+yv1tW8jMrgbYSWtf6hOFrTxxzIfq177WtBkpiapOzVBiTvPMOvQRYmaBgaMMvGZM2r07xkBuJk1PYZVpuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID78kKzR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID78kKzR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCB71F0089D
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774510;
	bh=wZJmLfEfCXYjoCzTqdd4D4IU51K1LeQ0vlEIkGanjNg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ID78kKzRdVuD0vOY0tb9F6hE5AypyIV35VXl/0TB81aW0KHwIN5+n6sU+GTCqQo22
	 zevVzKiTAGXxkdcZw20zUWzWjtqLRox6z2840aLqZUoaSzH8+vJJ2ysDYvvmCn6JBy
	 3+wpaJAa+8FTC6nuJsYtylLcqW2drm8hpoq4e/V3zbdfyQnfw4A6woBxpcUz9btCfZ
	 MbSn9Ny9SeR6GSEh4orWEwKXooBbUCTwbGuUr7O3nlu7y9Is1tfmeiKtkBfY/ldlNR
	 TqoyyV4EVgBe6EQPT8zP8LvUX2ArIjyPlchgk90p6WBk17c5Gs4NEb7L4rJcv9SVox
	 pxYV7GOmr67og==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso47103181fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/LyMm+DDy9bN8ChHw4i2DOOR7JUbGtAQebnyHwSDDdWRkDCNInTMjtrSw1BcgLP3zGoqRbkdMHiY8V7Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5AUys4Hc/95MwGXCf7k1J7fe+1hEV+O/VyZ5Jpv/0DadQtwjP
	zav6mBD0qMMA0TW3CB/ziH1UrPs9QfnAsAuFVtzfTkfmI+WNxZ3XUdW3JFHMr9pT44moQEOcPZM
	GeC8s2ME7JZSRRaa3dRk6EHRySvvSYg4=
X-Received: by 2002:a2e:a550:0:b0:3a5:b6af:2973 with SMTP id
 38308e7fff4ca-3a779170e26mr4566541fa.5.1790774509117; Wed, 30 Sep 2026
 06:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917211446.i.153-kees@kernel.org>
In-Reply-To: <20260917211446.i.153-kees@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:21:37 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
X-Gm-Features: AclHuK9we1Pkw_SnEX45VNI9ZkjWr3vMHJERGZiaBSgi6q9Y8UmCTh3tVaYbMI8
Message-ID: <CAD++jL=TbxyEiZUhPYtqiXBJTekvE7g8uSqwLbuALj7Y1iso4A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Remove const from group_names allocation type
To: Kees Cook <kees@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Kees Cook <kees+treewide@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 11:14=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees+treewide@kernel.org>
>
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
>
> The assigned type is "const char **", but the converted allocation type
> would be "const char * const *", as the size was taken from
> "*func->groups", whose type "const char * const" is const qualified. As
> there is no general way to remove const qualifiers, take the size from
> the assignment target instead. No change in allocation size results.
>
> Build tested ARCH=3Dx86_64 allmodconfig with GCC 16.2.0:
> drivers/pinctrl/freescale/pinctrl-imx.o
>
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Patch applied!

Yours,
Linus Walleij
