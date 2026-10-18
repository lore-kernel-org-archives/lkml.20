Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF03DA5AE
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792357555; cv=none; b=KSW1kBdhuCNEsoYoJ86fu3abVt8RauVhCmEngKJGy4Uit8hGvil+Vcex9pD1Ex8GbdWn97bNAsF+VG1FlFknBz8BWn3mmLH4l8lduOSOKAuLSAgNmLIi0/VFehcEolbI+0NHcjJqrnE7oTWdsycEL6Td+Bnsi3VukV1NveBxnlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792357555; c=relaxed/simple;
	bh=X9w/uTIz8mCO7IVavpsOU4YOnHgNhjn7Fq0V7BdmwrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFQaHw+4ZOTuGGCyzLUxc0QhzfvejM6Vve0whA52/Ke/KlAu89zgWelwqR3maRBO/HOSc8xStJdZh4SGQoNOI/PbOGR9ViUAa0yi3f81Ypcq0KAmzixq5ucH7wz0vEVwpGQoBF4qhIhngwcHZJYrb5o0ZUh0uXxqS+AGc+VpwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U998ryNY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U998ryNY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB44E1F000C9
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792357554;
	bh=X9w/uTIz8mCO7IVavpsOU4YOnHgNhjn7Fq0V7BdmwrI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U998ryNYmYAh7MpT4evOyZ/6j11qjlSpuMjpJtwbw8drcgj5uxWcWEX5cRriGfsHr
	 i1OwnxcDDDk1EWbhK1eW4LuZVxnVW9VzTvon8kqUZTIXcxx/5+2HGEi5qTdjkPim5Y
	 fatxlW098wPh63+I/VNITaOLkeIzQIgLKv9w9Mqvb6dSlyFmba8Kvb0kzjdYvgR3BR
	 Rj2qJpHfpHXn/V4S434MzFqVU2cdE/inBVYev8dlxaUDX+oZoJ/FLcYqVoX8cfyfZk
	 GOPucFw7reI/a0/oOBb+/dHdkZfGPBJXNs99XJTrhHMWNNzuOs4I+tuJKEf64mCPww
	 xb63G4dg8PL9w==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ab07d956f2so6558111fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxa7EzufQL17uVOK4hNxuj6QpaYKAARZcavNfwxqX1bjFw6115gVD685+m35ZU+SZaDz9dEegXh6OIdTco=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6tGkFc//l4E+9AMdFUvZ8cP+ll7U674T77+1d5JiJmxm1GPXf
	9lku4DpPLo5QhpBn66JnP230FDqyU0XGQV9mE+dZaP6S1ajZ36IuAXdkbZ3h+BOphfDe0r0Xf/+
	O7afH7uLJSZ4H8ij/m1xA1s1uc7ElE0Q=
X-Received: by 2002:a05:651c:324b:b0:3a7:6b27:260e with SMTP id
 38308e7fff4ca-3ab28f486d3mr14469821fa.2.1792357552633; Sun, 18 Oct 2026
 14:05:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-2-7c93312fa8d5@rudorff.com>
 <CAD++jLkSjbMRV_53rjpd1D+vxg=OVVWzVwiddUL0eqmSBoONHw@mail.gmail.com> <3ef190ac-eac2-4c0d-b3b2-6fb627f086ef@rudorff.com>
In-Reply-To: <3ef190ac-eac2-4c0d-b3b2-6fb627f086ef@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 18 Oct 2026 23:05:38 +0200
X-Gmail-Original-Message-ID: <CAD++jLmD3ARRtwPZBsCOmUS0icP6yGjaX8GL+vt0qqnmBj8Gdw@mail.gmail.com>
X-Gm-Features: AclHuK-JCU6Jc0xQi6Pc2hMskCDXFXdAnilG6QWxPy75OSiEz-MjrNHbVAvTZnA
Message-ID: <CAD++jLmD3ARRtwPZBsCOmUS0icP6yGjaX8GL+vt0qqnmBj8Gdw@mail.gmail.com>
Subject: Re: [PATCH 2/3] iio: light: Update DT bindings for GP2AP002
To: "chr[]" <chris@rudorff.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 11:18=E2=80=AFAM chr[] <chris@rudorff.com> wrote:

> > My datasheet for the GP2AP002S00F clearly has only
> > VIO and VCC, enjoy:
> > https://dflund.se/~triad/krad/GP2AP002S00F.pdf
>
> That's the paper I'm looking at. Pin LEDA wants power!
> See page 8 "Recommended external circuit"

Aha finally I got the design through my thick skull.

You're absolutely right.

But regulator supplies should be named after the input
on the package so this needs to be named

leda-supply

And in description write something like "LED Anode supply."

Technically this should be Required: and the right supply added
to all existing device trees.

Thanks for hashing out this stuff!

Yours,
Linus Walleij
