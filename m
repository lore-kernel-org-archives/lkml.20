Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6129A375AA8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563095; cv=none; b=lw6BsCClllMEAJGIV0Lr4ze2KcA+KBXK+gmRSzYRybkVqpQwf/Wz+cZ//cJXhm32ZqYRfP34LTjnn385C9lUdtzqJqaQ97buYdloRTdiko0DHchuF9KmwquXZ+h3QPa+pGy3zqellpIpBlKlZm0aM0645K7gqdmNaxfpXXj4ECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563095; c=relaxed/simple;
	bh=pu6X9klI1k9sB+YbdsGiZd902YtqCsCKNONBNzlZKTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NRPA9iFvCnqrs2ItR++GuEmITET4bepOkQxh96dB6IlSWc9aP6FdiQ8rCyZjh840XuHzq+01l5/1q8bPNp0fdWEXmWng/urtkL7H4lhHlKu1ucJ3at6MkajqLovNyQs3522Hsi/MJu4eMeDN3zEXGim++1NBJrlCfglA1cIG+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSmY6qQH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSmY6qQH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE911F00898
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563091;
	bh=wF3oG5+si3MD5cI1NUF4lhUkkspODcUmglSJAEfVfdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cSmY6qQHLjsdL7iqxeKbkhK4Lj4ZbOc44kuO45QGP07fd4F4AfgqJ1Zc2iBPSwghD
	 5/LboLiwHUmWpx3ztjO/n8D8m+waCLf7r7niyey9JfyF4WILu5PREKaD8tuxuBenlu
	 lV58gWS1/0amdUAN52LGmxkRpNlpo9SMGiG9up4cneUHPzR2F2vSNbZWk1YtgBfkdl
	 /jMrzwc1JdPA5qPWYtBaJ9Ab1sBbiX0jL6TQwHU5a2Sno1KgrfehTnlTc1EnGywA+r
	 3lh61Y+bwWCuHb1e+y5woSbr1b0IqggD1G86B+Mh37ygK1MHzTOSj8WfykCR38RIgn
	 yzeQNRCdGeOQw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b899413537so1178533e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:51:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByk9mKFsLQ1KOTj/Y1lZwdkLN0LSSpznbsi+sPR1+zgpsb1iC6z7SK4QUD1b/lOKvjt4rtzo+7jKnYNiFE=@vger.kernel.org
X-Gm-Message-State: AFuF++krPQIuo4EgxZyaPEbuR855GE+1Kz+11CxO28FSIxF2xorRyv83
	HtxP4nv8bG1NOXVPjbe1S4CcFFUEHOLcv6XQanTkbAsZBnpvI5M715l/dQJc/Z0drMN84O+gYCp
	cU1wRireJGNCw9jEUIIrmsueqc7pKYZ4=
X-Received: by 2002:a05:6512:1151:b0:5b7:651b:1cc2 with SMTP id
 2adb3069b0e04-5b8b66120d1mr695592e87.6.1789563089824; Wed, 16 Sep 2026
 05:51:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913173132.1172003-1-sashal@kernel.org>
In-Reply-To: <20260913173132.1172003-1-sashal@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 14:51:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLmdWkGjhOpv=qQHnHx2Q=EhA=bEH_7Z3R0BQe5m7XFwQQ@mail.gmail.com>
X-Gm-Features: AcwNN1WAroJLkrx3qUVBuNGwMlcQNSu2Wv4gTPn3O7hmcVanEmCJ1KrfBZgTpdI
Message-ID: <CAD++jLmdWkGjhOpv=qQHnHx2Q=EhA=bEH_7Z3R0BQe5m7XFwQQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
To: Sasha Levin <sashal@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, kernel test robot <lkp@intel.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 7:31=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:

> arm allmodconfig fails to build with gcc:
>
>   In file included from sound/soc/ux500/ux500_msp_i2s.c:20:
>   sound/soc/ux500/ux500_msp_i2s.h:151:38: error: suggest parentheses
>   around arithmetic in operand of '^' [-Werror=3Dparentheses]
>   sound/soc/ux500/ux500_msp_i2s.c:204:21: note: in expansion of macro
>   'MSP_TX_CLKPOL_BIT'
>   cc1: all warnings being treated as errors
>
> The macros never parenthesized their argument:
>
>   #define MSP_TX_CLKPOL_BIT(n)  ((n & TCKPOL_MASK) << TCKPOL_SHIFT)
>
> That went unnoticed while every caller passed a plain variable, but
> configure_protocol() now passes an XOR expression, which binds as
> "a ^ (b & MASK)" rather than "(a ^ b) & MASK", and gcc rightly
> complains.
>
> No functional change: tx_clk_pol and rx_clk_pol only ever hold
> MSP_FALLING_EDGE (0) or MSP_RISING_EDGE (1), and bclk_inverted is a
> bool, so masking before or after the XOR gives the same 0/1 result.
> Parenthesize the argument anyway - it fixes the build and stops the
> macros from silently mis-evaluating a future composite argument.
>
> Fixes: 9ccbacf5a012 ("ASoC: ux500: Validate MSP DAI configuration")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609051547.G9SJp8UQ-lkp@i=
ntel.com/
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
