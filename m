Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED3E4B8284
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792361254; cv=none; b=hY1ViNNBB4ZFnCCgMFPPEKlFjz8xbNMkrccpGHXf/gXv5VWzCd6yqd/ubOu0iUA1OLN+EK54ED28n8e63CPzWhChGaPu4NxXG4R0SgHoDsMmJLHhqR8K/iX1wQLnAwOASS/ZYu9vZxD9Tv7fUuS4SmKbeKJhPUlh6weJ+rlFMwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792361254; c=relaxed/simple;
	bh=F9xbwsOGYhZLxeYQhkkpp+B03a+2047+e+nLiVBNWDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsRxHPc5wPGxIdkCogN6kU7zKutPebyU8E85fubUFczyVQOuwqFUR7U8oEetj1OvXgO9k+Zh9QCt95LDF0HXqtc8oJlk33/Hc0BbT2+Hl+DktgEISUKzsKVKMzz9N0MWnsTABt0PbgpmUw/tg1Q1SV1Kzd65dA5ykPQBxyCyrPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRpH5Lad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRpH5Lad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18A0B1F000C4
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 22:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792361252;
	bh=CWdO1KyORGSqm7uhLPCSusKj/IGXrx0602wzuxRWapI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aRpH5LadcvD9j+QI5en9zFrZ1rw5eyWXbD7KE93jHW6YBtemaVpgklxxQvhxlgolO
	 qS8hQ6V2BRnOrk46qwAjdqTJOjzKZVn7K7huCu8Z0xuKsXGKp1kSY27A/4vaXh+K/D
	 ooAOdkjoB1zKMJMrYiys2UAx/yMYSxmBtnMN+HWVK883Mjcp6qFxh7CVOAIsgEsf37
	 J8gGK54yuXAji9W9BuNereDgAJds8F+sLlwEiflqxQ0haHhQnZqipoxAOme/QXIoWQ
	 Y1x2My6UO3PmLhrwjdG464dznAYtzSdsOjvWhe+/9L2zdDHoqKOiF3Mm+I6yizLASp
	 RupLCaCaW8yRA==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so1880128e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxIEJWKwyjPdPukwqn6/joj0fgl6qlH5eTKtMex11lifVqcGrUGA9HUTbrrNJ1LsJ/R6RXP/hTJMD1ZOSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUsXYuaSH0W5VaexPsMKTFZvL7q1MSZJDAJLxYHMBLHxRYODgI
	q1eQsxS2I/OsNXhYtU0pDf0P3mH7rlGCh3PjTYT1qyQBWH4+yLVBv7HPgTFTJfdR8JE922+t4aH
	L5yUZ6RdqoRW3whnFVERwqLBZ1nBlf0E=
X-Received: by 2002:a05:6512:10c1:b0:5b8:f4d4:7ff4 with SMTP id
 2adb3069b0e04-5be50a74cc6mr1663573e87.53.1792361250883; Sun, 18 Oct 2026
 15:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017-iio-light-gp2ap002-v2-0-d6879767a446@rudorff.com> <20261017-iio-light-gp2ap002-v2-1-d6879767a446@rudorff.com>
In-Reply-To: <20261017-iio-light-gp2ap002-v2-1-d6879767a446@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 19 Oct 2026 00:07:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLn92F+pt3TjBpZYJGa_yJc_vO6SNN4UQ7cQicr5303Z8Q@mail.gmail.com>
X-Gm-Features: AclHuK-c09UZJfrcHpK9Gk0C-hPkHJfmtbKsGalJ_K_1dxEP5I0KdV6EMn4_rI4
Message-ID: <CAD++jLn92F+pt3TjBpZYJGa_yJc_vO6SNN4UQ7cQicr5303Z8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: iio: light: gp2ap002: add vled
To: Christoph Rudorff <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:28=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> According to datasheet page 8 "Recommended external circuit",
> it can have tree supplies: vio, vdd and vled. As vdd and vled wants the
> same voltage, they may be connected to a single supply.
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
> ---
>  Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.y=
aml b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> index 99bddf31cbed..f5b2c6a4d7e3 100644
> --- a/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> +++ b/Documentation/devicetree/bindings/iio/light/sharp,gp2ap002.yaml
> @@ -33,6 +33,10 @@ properties:
>    vio-supply:
>      description: VIO power supply a phandle to a regulator
>
> +  vled-supply:

So this should be named leda-supply like the pin on the component.

> +    description: LED power supply a phandle to a regulator
> +      Optional. It may already be connected to VDD.

Description should say "LED anode power supply" as that is what the
"A" means in leda.

I'm not sure it should be optional really as it technically *must*
be connected but the diplomatic solution is to not make it
required so we don't break a ton of device trees.

If we wanna be really detail oriented, add it optional, fix all
device trees, make it non-optional.

Yours,
Linus Walleij
