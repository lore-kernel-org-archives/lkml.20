Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F47A3DA5A7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843796; cv=none; b=k9vldGnJ1IJA7yEP7BZiqQUrktq03gDkj2fw38mqfOfOTpH8udsfrgODjHX8lIBb+3reh9FYiWnCFjciyxAza2c9ccxEaoxrqQdCEC0FeUAToEQiYbbrkLPTgKjc5nDg0h6DeESuMKOx4z+coiufAKs7mUjYYic1vvauJmS/UiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843796; c=relaxed/simple;
	bh=xIb+an1vjbuhlFxsNo5cH4KHq1BGxzWRB6J9q5forqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhdP7y3iPdx0svUw5yucuWB8TgKQnpYBOYlR6cbob+GMGP6e2WgL7pRoDMZPMeRGtBI7b61w0lrF1DFtMX19XEGJl6SJ5F3dN1hfQ4d966HLLmjmP8EYSeQKLIxMBNaJwHdnt7Yjt4sAm8vWkCJfYP1iUVio4410e8fmTkJEsLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSUnn4C5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSUnn4C5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F411F0089B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843795;
	bh=xIb+an1vjbuhlFxsNo5cH4KHq1BGxzWRB6J9q5forqk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WSUnn4C576WwjexJaHRwUxGh8Fp5D0r7vLLA8JX2e7oPvfdXcpc8L9MWTdKCFViYr
	 VPD1EbqogJd0yWKw1TekckoZlJya2LgA6b9mAMj7DqTY3qhyAY2HdZt+ZpRky11qtw
	 gMJS15NG6v9GulxFIga4nFs2sXP7GeSvnBzEOhJmvVDMFgF3jqa+nojr38+AoSZ1Us
	 /gGdsHOZmw8RY+20LoQ6N00hVFWJSVljG5UsbvTzEwOMAZmp7Gszz5lje9RJg+qbPw
	 JCSqwVIcia8sF3mYdRjN7Vz/BxBmCRc1iEq0Oq8SXC2ICoWFOGtq+q57Yzz3vukq7e
	 tdcEbl7tqpoPg==
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dcb61589bso942073fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwOlVrHwVoKAu3q0HtW/yW28h1rvtEf81fw9fucbmuzyd3kzUM2v4+RZzQxlIUtatKEcAlbxdidjAmuGHg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRBHgh0W9wDGFoMHltOVBCP2L48C9qV5qp7GNLc+oiAiSs4KJI
	UkZRCCd7PuXeFMwB3RgnYKHJNY1KxN6Ckf5cb0uBYiVL+JbQeONek3Z8jh9+dh0NDBjFkGPWTwp
	FXFyk2O0zmELfA/UsW6xnFll68BBN9+E=
X-Received: by 2002:a05:6871:cfca:20b0:49d:c40c:4994 with SMTP id
 586e51a60fabf-49df467f903mr1116516fac.9.1790843794327; Thu, 01 Oct 2026
 01:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <CAD++jLmts76o8wyR=eY=vdNsh8+916YqK9qwM3b=R624AYM1XA@mail.gmail.com> <20260930-frantic-enviable-55c1a78fe7d4@spud>
In-Reply-To: <20260930-frantic-enviable-55c1a78fe7d4@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:36:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
X-Gm-Features: AclHuK9u4NJU-Y9jPHB9lynNieX4ueu3y9pQqGkmbWAAjJAu4pGPhtuSSWpMAZk
Message-ID: <CAD++jL==9BjfyHuJMT3sg9rkLDEHKaryHLtxxVwySmLUNjaW3g@mail.gmail.com>
Subject: Re: [PATCH v8 00/22] Add basic pinctrl drivers for JHB100 SoC
To: Conor Dooley <conor@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 12:34=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:

> btw, are you going to be at LPC or OSS Linus? I'll have to make sure to
> say hi if so.

Sadly no, not much conferencing for me for the moment.

Yours,
Linus Walleij
