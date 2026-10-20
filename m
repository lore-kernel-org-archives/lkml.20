Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516593;
	b=GykJ+pjYLpH7ioGfwhs/FIerLfyMbtQja9CUPBBObmnQ8zYZytRc7hyzn4Ld5MSQD8uW
	 ceU1WJ0JvqaurKxLvSd5S9DDNgHbIsGsx+1QT+5O1yV7VNIw7gIDLpbun8Mu9w8ySKvcv
	 dAy2F+Gw+8cSuh5Vz2pKo0R+E+opZoNV2ZDpfOtIwxUnJuKd6tsG2XFXv+bmXH/oYruqt
	 0/k330pHUZd+2U75tJw/QSdcDbrxtEnvbg8PkwrH7n/XZuJiBFORiA2ZozavryqGNDIzw
	 xNjFuISeRTFUFrCbuBn+pRpwp6XqbReo3C7wwiKTQeg4/QqFfKH8MH/oeJnT/wN8+vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516593;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8JgZTskEhAe6xxV6x68aEhfu2INYkml8PjbzJi5N0lU=;
	b=LlaLYb5DWSaMXfrKdk9r5douySAXYr49yjuFcaRVX7ktgqlNnnObV1JAjnWKGXaSZb03
	 mCZTgpATjw+hct76+E9GShbRdCSHmwHjK7hwXogBoNMDiiSwbND2ayFfihKl3FPR1DZ+G
	 ZxaVRP44cnUlcDMA4ESBzu7OpLh2deAJHVD1awvPe6vyagbjpdR6VROgnAXj7tUQS8e9p
	 n0mh6hviIAzxBEAsW+jWZuvBAzNAjsSsEziLLc2RQ5aQYR0iA6RZyZB0d6DBfJ7DxTAZb
	 KS4i2rczGRw8zm3gcYoB/QWmoZ5WGfza0tUB7AvPUWXFh7p5ho3OB6RcjT4ZEDqkKXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aL7UiTM2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA4606AA1F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aL7UiTM2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D69B1F000CB
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792516592;
	bh=8JgZTskEhAe6xxV6x68aEhfu2INYkml8PjbzJi5N0lU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=aL7UiTM2tKcqM5BWgOhfdnA7pf8P0LWEtwjzH3m0Ie/P3IkjH0nxif+BA9Eq90w80
	 swBZMRba+MhzhPP49iLAoY4p8wOFHjv4SeiDDp/o6JrDl1AY78UE40MrHAVUeSFzos
	 k1vf1H44zgmuVfZ/rnrCn8BhxweDX0RmnkaV/fp0wDTYvdaJGT6UGIfcNG8Y8BPk5H
	 dsJQnFneVnFnl67HqsJEEb8ON6WHX/HtPreso5rTIpTiSC/ShvBndLT8Vd2zhUND4w
	 NP4JZ3sUoHAfUcwdjXTunwTPolwQsHrCOn3A4CZxnifntJGMMPEBBg4Mp0EPRhSpAn
	 lvFDgAwrmGnUw==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be469d4f9fso3096067e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:16:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByQDtMAY5Oy3OMhn9eOls5Isxk2aENAIh3LU+UvUVYZKdvt682xczIKj5N0XiXo36/c+fiKGgd4PA/4VZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5KYuOR9hKr0+Odypbcrk2urzMBIEa5o1zcR3R1SMJC12O8W0T
	FNP9XxQh1z+X34bUXAnUN7LktCUulk6W3gIYy0/7Ju1Fir4xu54ziI6s5Ing8hYMujeLLWJJGzN
	+NMV1sXA5GNfmPdIaHOVHDm5fbaFx3kE=
X-Received: by 2002:a05:6512:114c:b0:5be:4d37:3bc0 with SMTP id
 2adb3069b0e04-5be50a9dbd8mr4119073e87.62.1792516566187; Tue, 20 Oct 2026
 10:16:06 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020-iio-light-gp2ap002-v3-0-b7e0946c9e79@rudorff.com> <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
In-Reply-To: <20261020-iio-light-gp2ap002-v3-2-b7e0946c9e79@rudorff.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 20 Oct 2026 19:15:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
X-Gm-Features: AclHuK9jGkoAjznqQZwxFsnHN6Zr-n0TfSZfEnfEZkRBZOBxywfmSrVOcQu4ooA
Message-ID: <CAD++jLmCo8tnG5vp4Qv=6rDG3nob25LHELretdu7t3_SLxQASQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] iio: light: gp2ap002: add led power supply
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

On Tue, Oct 20, 2026 at 1:36=E2=80=AFPM Christoph Rudorff <chris@rudorff.co=
m> wrote:

> tested on samsung-j5
>
> v2: Use regulator bulk api.
> v3: pretty up, rename vled to leda
>
> Signed-off-by: Christoph Rudorff <chris@rudorff.com>

I think that commit message needs a bit of elaboration ;)

With that fixed:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
