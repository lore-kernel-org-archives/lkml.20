Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D05616B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933228; cv=none; b=Hmp9oik5b105n/WHDE+brIIqBNXzrMqLya7aY12hY98vwTrgELFjRokgAhQxeIdf0KD6aYKN09pB9tP9GQc+AbtwS8Gv5d9mbFLzRQ58FgbZmRN9fweXpe4b2LyYdL7xrwwViwttwwILTudAYKFWTZu2y/4NV8ENTDLAuRgxyGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933228; c=relaxed/simple;
	bh=8vYqCm7KC7EITyBWnZgA8g6ZC83e12z/29ej2dElvqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aCKDfiOKt3gmyKAk4HmV40NdWVcGmilmSPHNMnK4HPnnA5MJSM4kn/q4SI20SyH5ALg95V6PPikzD6HoSucdt0D5a3zlNlP9DTQ3fTDYGPHYcS8gpLvixmbJT+j8EsJlVvEYaw36bXbQ0dM2OHtCrxFTSPUi7zt/s+IwrxEP/YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YG/yibQv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YG/yibQv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EB41F00899
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933227;
	bh=8vYqCm7KC7EITyBWnZgA8g6ZC83e12z/29ej2dElvqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YG/yibQvJjxNbB5ctvKfgTq/R7zuHrA1Hh1+J0egqCWrVJ1X+Go48DuAqMiTpAH5/
	 Q3Q58Eyo3nbvoRanaUSVGtKuIzpm8GuADZ79jC8jBHwmVD35u6ayqN5fyq97UyBS3Y
	 VIzOzsFY5TS09NNobgTekEln3lGqP3JYlOyA8h1KvMEDi8OPRtnFNu0nKmRmawcrnD
	 Mgi7NbiqV4HVC1egGpC6bxSyBLIMBiKylhOqPdfL7S5aTdKQGOqJiIb61c/tVRxaFf
	 dA09dgVpCIOdYsx7rfuuacB3coAHOIWzARNabgEUGKudsEdfPxrhKdkeJhJOedxERh
	 Ur5Xm+CAbIc8A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so3295691fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:13:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwbgPY0+uJudePA3aCAOOPHhmEfaWYAzVU69v/Ub3nGs6lw4z2/+NjvVBd/672Nm+Xgd5FhRTeoRJgW6Rw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKE/R3hQbLrL4tJAjZzHuwW1Z6u6W4P8+6BsGuoqyMbTacTvbfN
	6yQ7NVv/xSPEFWtQjn8o2inRvlNFc5ftuZ/sLg+zsNVsGCrEpZHfrLdhiIL8pMY8ZcoMoB2Ol3i
	akrJhn+nsc+PtziZmeWvAleJPGM0oD+U=
X-Received: by 2002:a2e:a991:0:b0:3a9:76b7:c515 with SMTP id
 38308e7fff4ca-3a9c5253a1bmr30955151fa.8.1791933225889; Tue, 13 Oct 2026
 16:13:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
 <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
 <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com>
 <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com> <CABymUCNzxWhud1qtv3os=f2txZ=nrTdMrQ6BOYkbfK87D=AnHQ@mail.gmail.com>
In-Reply-To: <CABymUCNzxWhud1qtv3os=f2txZ=nrTdMrQ6BOYkbfK87D=AnHQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:13:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLmTexHgKOJV5DafVDsZoA1wqWgEgqJffYvkuZiyBt73HA@mail.gmail.com>
X-Gm-Features: AclHuK_LQ7qdt0SsmTQO1sCjo0vhFcFDmOgCJe5wkiAhYi6eBoW9zOsBp_zlskg
Message-ID: <CAD++jLmTexHgKOJV5DafVDsZoA1wqWgEgqJffYvkuZiyBt73HA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 4:41=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrote:

> Compensation for chromatic aberration can be done either on the GPU,
> or display controller, or by panel. As long as the R/G/B channel
> can be processed individually, that's enough for the aberration. I will
> work on the solution with processing inside the display controller. So th=
ere
> is no dependency on this specific panel.

Surely that usecase will still require full control of the display
pipeline, a bunch of magic register writes at the end of the
pipeline with a comment /* this is where the magic happens */
isn't going to give a sense that things are under control.

Yours,
Linus Walleij
