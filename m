Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC244B0E54
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579303; cv=none; b=Kq4Y69/K3YJwpkgTSodDwSn76rUBL/48PWybsciPC+llfeENzOachKnk6QPrJKrDn7wIlgkH6EOSHUFPRLDFh2q8J2H/2o0t7qAuIv1uNFNWBb4Ugwznl0RIawoNoEvA6O511QPKYJEsCbC5Etl6z2NfrK4aFgbVNhqKxjGFlwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579303; c=relaxed/simple;
	bh=+Wm8XztWe9cjSuQsXSOKuMkDzkD1yzW07KRTOyVgie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CI1aORot30R8p06V3T1ZPWNjMGdOdYIKEr5vzHTZCH9S1nldEO3yL/Ij4gycumTdS0X+MmJwHsasLUS4fLCxkfWF5Agg5/sH+sSlUjvJMVXpLSuebtPKTFuQWHVpxkSKLaUJUXzOWkINHwS3nnCybhQNfGTww2rZfA2CdiiOiyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EkXi8UIf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EkXi8UIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B481F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579301;
	bh=F1UErD4H6r6whOgpoMHeGy/yiV6kGc+XBk8QJER2Od8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EkXi8UIfYQfKatoSflTMKoZodk2MFzTeqn7IzFw5own8by4E4X16L2h/ix8kE8zBX
	 cqm8+yilh8//wJFwcRlPFj8XbvL9n/SJXykY/n384D5CJsiov0+h+AOVx/oTkKb2Y7
	 lEGo4xi6G2c5kMX9Jwy9u3c9xSohw6kM6ewpOuRspjSk/KbFgc9Q+Y20moK8Q9Cle0
	 LMySEXuzfhWhnWstDPZ1AEhJyJGSVe0oxzWxrfWMWBg9iYw1oqUHvmQEZa+ErvRGH8
	 GDp06kn44KOOYFlXwvtsa/1EM1GEQEDJjyD43SlMEcx9ogqVB7yIto//IFLrxyPI0O
	 nWAABdTdFAhAw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b76694fb7aso2069794e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:21:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzTtJ0IE6M9VxPs3/3xnI+QtkK88F5zT4C5WVfcEN/jyH0chgg6YC+MvChy4w4rS2Nrk9rslB81wJAoc0E=@vger.kernel.org
X-Gm-Message-State: AFuF++lb/675GN31ESZ+bPNC7JDISTsEKiLicy7E5KcayewQ7t3Ijmw1
	eAPpup0oNyL4Eaw+yLH3KwFPs0GDYrroQpUO4OUbqQbDdjdosWutB/sa/uctADBK0/+CZDPSZyd
	hs94WtBEh4CsRInmnULLCvVbQfRxR5W8=
X-Received: by 2002:a05:6512:6883:10b0:5b6:172b:7ba1 with SMTP id
 2adb3069b0e04-5b8ba5d1a82mr67749e87.9.1789579300578; Wed, 16 Sep 2026
 10:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123223.99893-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:21:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
X-Gm-Features: AcwNN1WeMHFPjUODWxifW5uhfKTviiZfd6OYXXOq_JHN6cgG4pckjp0gwgbXDp4
Message-ID: <CAD++jLm2hQ=fHmLGL4KnaK-q2L95tz3P6__qx=dFCUeiMUz9tA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Use consistent indentation in the example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Gary Yang <gary.yang@cixtech.com>, 
	Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, 
	Del Regno <angelogioacchino.delregno@somainline.org>, 
	Rahul Tanwar <rahul.tanwar@linux.intel.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krishna Potthuri <sai.krishna.potthuri@amd.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 13, 2026 at 2:32=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij
