Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D6C3E0C57
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550181; cv=none; b=aeKfBFL8IWd4JQLRuJlyYlitybdwnoRBZwtBNfUy0c3f7MOQKnKF1sbwGPPUh04h3mwcdgWHJTu9GVtK2XyCB1GcWOV1tlFchsjAMEzt7CfsrQYZezbbE1SvGbjpPS3MwWZbEssXxnxMa/NVWChwtprrV3a+aXIiS+i6AnowEIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550181; c=relaxed/simple;
	bh=LGxMjzOtgDYJApSNFqhud5Zm1u9dxY/XIqI1bfCqgCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cSZ71nxOGiCajYLRQzhIzG38eDWojmq3wsZs0qTPsH/cAv8uqNTJpn72c4ayGDE00LuB11fBlDnzNZRAzT+Zc8tmEt4egJ6/cLMwzF0/QVAWGLvXxEpUIMyybge6aEVAgctgS9i5LJK+kZ8PMpxBtp7EIk9p2xBjYeGcrpUtFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghbYUzNj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghbYUzNj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD611F0089C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789550163;
	bh=G485UZORqYgG1BoyHfA+nhJ8NEYBx0Tkd0W2K9zwpWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ghbYUzNjqB8oLkt9SHrlQCW0q/RkMFJLbEf1vTpcjgSnS0ndMdcGV9X9cgrfe4989
	 N3Xn93l4XPQOajq0P7A/5M6HPn3yTHjWR8EvrAwA4OwkWY5xTXWm9mOBnDLihaOwjK
	 wd5TOr7siG2LX9wPxGlx5avaj8nXLAaXY5IRwdSzAazrm9pDV8M0lRXUyE3UHzE16/
	 FXm3CqEbbpuR2LBWqpXXKbJ56ao6QGEqci1e6xtJVvvKFXqfjcPqr3CUnba3RrYhsE
	 o1HemSuCUevVSkF1lsIDDHpRQjihat5hdwbo8YlheOtB9ZQoTRUA+P7biM39MVxsZI
	 /WB/6Bg0pUwnA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so704348e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmJsFJvWXOh0fd7THDtbLU0Z9MqTZL9L60CkHjnE6rHsYk2d6Uti0KWBdveFqMDdSwmmX2OA5xbQAHp4c=@vger.kernel.org
X-Gm-Message-State: AFuF++m3mIpeMoWe012MdIPRLHKwS3aUtkR1jEsnv9YoWoZQdwtXeUi6
	QLrxeZQizM2LEFTmhoYFc1nBbh9591zQgaEnLFT27m8YF9X3hJ9alOtDTubXlazCuM/374V3qbi
	p5fKTZriGILW9s855iZ0zm5TqRmz5/hM=
X-Received: by 2002:a05:6512:3986:b0:5ae:b7ce:9ca5 with SMTP id
 2adb3069b0e04-5b8b6645f8emr979198e87.18.1789550162175; Wed, 16 Sep 2026
 02:16:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915202038.3534453-1-arnd@kernel.org>
In-Reply-To: <20260915202038.3534453-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 11:15:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLkJzbJUeZrmHLp-+f__J3qnwho7nO03ARb98Div0UkeEg@mail.gmail.com>
X-Gm-Features: AcwNN1VfYqEivMN3NvN5Jm4WsMhdLGlhk-Vr3rdcaGUNmmI3wae5tXLztVkRGSw
Message-ID: <CAD++jLkJzbJUeZrmHLp-+f__J3qnwho7nO03ARb98Div0UkeEg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ux500: avoid -Wparentheses warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 10:20=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wr=
ote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc warns about a slightly confusing expression in two lines
> of this driver:
>
> In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
> sound/soc/ux500/ux500_msp_i2s.c: In function 'configure_protocol':
> sound/soc/ux500/ux500_msp_i2s.h:151:38: error: suggest parentheses around=
 arithmetic in operand of '^' [-Werror=3Dparentheses]
>   151 | #define MSP_TX_CLKPOL_BIT(n)     ((n & TCKPOL_MASK) << TCKPOL_SHI=
FT)
> sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro 'MSP_=
TX_CLKPOL_BIT'
>   204 |         temp_reg |=3D MSP_TX_CLKPOL_BIT(!protdesc->tx_clk_pol ^
>       |                     ^~~~~~~~~~~~~~~~~
>
> config->bclk_inverted is a boolean variable, while protdesc->tx_clk_pol
> is a 32-bit unsigned integer that can only be zero or one in order to
> be passed into MSP_RX_CLKPOL_BIT().
>
> Move the negation out of the inner expression to make this easier
> to understand by the compiler.
>
> Fixes: 9ccbacf5a012 ("ASoC: ux500: Validate MSP DAI configuration")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

OK fair eniugh,
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
