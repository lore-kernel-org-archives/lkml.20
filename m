Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E050C47C10B
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465423; cv=none; b=mquBVp2s71ePlblmzVdJcDSQ4gQnOKwzUF8Rm57YAszABMvwryETiRHYKyxPV4WHT+bh7Z+9y23Ujvo8kajiDYKv84sUA83xo8e4Wgu57EzzRbGdhCXhyV3LSf+Xur4JbHIx8obsK0bsOj+UMdsP0u4Y0xUnIiZ2m2qNWITHuwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465423; c=relaxed/simple;
	bh=J0ypidkHtTf6TBTslKZeVtOfTbu++r6qBExLqSBpJAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzvL3T9Gqi/pYAmUstwX8Ur21cog/4sGs9+ixs7d7KofYe4igGNMtsnQr5EinehYdkVsRgX5vK0XcsEJH1dz6JGj0y7yZhwH9bPsN1JtETywsiGYm7TKBCPUPAZQxUackyLrKCVFQsL/K9vKJ5FKEk7yvz7C9l+kAD7pf+mq7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gL+cRPO9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gL+cRPO9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272CC1F00893
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465420;
	bh=d/M/n1rpHgsVSx+i4GGkKwbJFs5dUB3kBThJit3oct8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gL+cRPO9FXODDmSmuSyonSLWNuO8OoESe3kK8AcL83IEEytVe18xAFXboQbZ66Dc1
	 wTKYL68u2w7R970pntHPRBXoHhRZVnB14rCRNDI+uTr596yfVhZXLGSoJ/fNO4SHHv
	 np+uxfqZZ9DeTfU+EDyxezMs0uuKma1k601Z37sI+kBLXMbQ7Je27L9WzLs3sr+FEt
	 OpH+vUZA8h8gT+l6GdPRjb5m5aCL4Ncqa3x2k4qFaFsHNJrHuJ9Mkg/2Y1oOhFeMCH
	 zIZEhogoZlf6TlE5IpWLUh7rKvt7X+TTwoBZUBy5f4exUP4H3iq8LQSHi1lCLnuYTa
	 CxpHRtY6/NJGQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso2517801e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4NfMHLWT4hhc0uvg0MpFuzj3xq8CtodX6vdhczn6DvvGMoI/ADQ1CVws3Vbj6opAVlPEeFeTNpQJ5uKY=@vger.kernel.org
X-Gm-Message-State: AFuF++magobjL7V1xDhYc00Uuk1cEcA143jgXPYb5vGiYiRyzeVibucP
	+41ya/YYAG5VlAv4I+EY58jhR4FVMDyo0gxUlnB6wY11+LNk1tr8Hsfj3J9aNXWOZL3pE7mbZjM
	hpy6tApz/Mqo1z2RNhlvO3N+qPJDxJ8A=
X-Received: by 2002:a05:6512:1296:b0:5b6:5db:b07c with SMTP id
 2adb3069b0e04-5b8ae664354mr1755642e87.17.1789465418860; Tue, 15 Sep 2026
 02:43:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915092046.931449-1-alban.bedel@lht.dlh.de> <20260915092046.931449-2-alban.bedel@lht.dlh.de>
In-Reply-To: <20260915092046.931449-2-alban.bedel@lht.dlh.de>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 15 Sep 2026 11:43:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLm0osL3KQVyk5-pVCv5eFbOY1V2BVRXdNf6rgwQJcLdgg@mail.gmail.com>
X-Gm-Features: AcwNN1VPDO14l6tD97xi3sMWPtwEuNp06pmV7gpRisIqX22Xf5CLWNGmeHFlLx8
Message-ID: <CAD++jLm0osL3KQVyk5-pVCv5eFbOY1V2BVRXdNf6rgwQJcLdgg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add CAT9532 GPIO
To: Alban Bedel <alban.bedel@lht.dlh.de>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alban,

thanks for your patch!

On Tue, Sep 15, 2026 at 11:21=E2=80=AFAM Alban Bedel <alban.bedel@lht.dlh.d=
e> wrote:

> Add devicetree binding document for CAT9532 LED dimmer as GPIO
> controller.
>
> Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
(...)
> +  ngpios:
> +    minimum: 1
> +    maximum: 16

ngpios is only used to lower the number of externally (on the package)
exposed GPIOs in SoC drivers, to avoid enumerating GPIOs not existing
on the physical package.

It has no place in a discrete circuit like this, don't even define this and
hardcode the GPIOs to 16 in the driver.

Yours,
Linus Walleij
