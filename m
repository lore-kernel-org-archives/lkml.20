Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BF1157487
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788587674; cv=none; b=Lh5ccXdKYZmMxGpJhObEwhp0TWim1xykrxsL4cNy/MNffm+CVJ9PbzSq7XKzACms4VbLFfyJGsA5TH3tHBKe3loOPprh4VUru7hdacZCaf40VD2yVq2DkFiiSVPI6g4rG48PNtG8jz4VjKHT8O/wR9a+3Fm2fyhVcPf1YxL8FwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788587674; c=relaxed/simple;
	bh=ZQ2vS+l57WsslsQOvAdalTXWtP6Z1U8h0cqLZXTqvVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ptrysxn7+Eb7f/yXSKZ7KTP4sXlQ7GXE3xpVu662+GX98a1S86hBTGHeu9jN5AsKgvvqMdkZ5gy4a3jbW7UDUnvxdMGbd/A6fl156gzy+MKO2Cjj4S4s95/kNRHm2xC77XBjncoAVuLsstEYKbQeBJke7ngYsducxkv9g2C5bHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgdKSC/l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgdKSC/l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C1A1F00ADE
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788587673;
	bh=jxqzcQeIGie1cb4FNpKSX3iCMnz8YLMB5HRJHa4aZCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JgdKSC/lR2PRdX3UXHO35FTQ6X9M2TgcSJgFRwEnqC/MV/QHmbgIfRvTXTYCdjBoP
	 +J5PtLTlHMfbQ3r3oqgU1Pj9XhSox6p8LoZg1jYBzwEohpE2xUpcFV7iuuRymRjCco
	 xXPxtJkxmB3H+MTtG5d35TSiMSc8OlA0FxeeCrM/jpAa2u/mIU92bqN0e377GFuiVM
	 lGOBvQ4DqklWMUINEifbFwrTzuIRopb2JPRU0Qjx9DOgOBpiXlLAmmOcA2St60ND2/
	 icXAvbBzC/NNFIwHd8AAy5tMukMm+d2g31RYMskCX4SoQlSvVWKU2vsKcGtunqSCue
	 Xd5hRGcSeBcMg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so2355644e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:54:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsA7iKOf9WZcs396JRUVc1AOabAvPC5astZnpWQgpXSv4ura/oar22Ri0ngWegVzaMMMuIy0Av8pkQGMY=@vger.kernel.org
X-Gm-Message-State: AFuF++lxtJbjJoJdty3yv0AmknPHXhWiP0wE3P7JkniuoR3UlmB6b4vz
	30wih2gry43sbAmzI3TOaXHNNOgY5XS7S9ywTMH4TXqvl4RlZ0e7vs4vLlIChfIbLa+slxgB67R
	Ja+cPf0eFfA3Q7+w4g+04N9r1w4m/9g4=
X-Received: by 2002:a05:6512:1285:b0:5b6:4b1:f8bd with SMTP id
 2adb3069b0e04-5b616f5b5cbmr1782508e87.30.1788587671407; Fri, 04 Sep 2026
 22:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <CAD++jL=A5QWEfNXnmpKFMju8X1BQ8CsxMuqhia7mfMFbUaFfHg@mail.gmail.com> <aprT7A2w0TWrfcdn@SoMainline.org>
In-Reply-To: <aprT7A2w0TWrfcdn@SoMainline.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 07:54:19 +0200
X-Gmail-Original-Message-ID: <CAD++jLmRi+f3BGGxXzkP1ubaP2J8Qfy-v0HAmQqzN1x=e6d3bw@mail.gmail.com>
X-Gm-Features: AcwNN1XAvRFezIXLk1kako-OF71HLCqFCnufftCArrQ1b1-qMTvV5mxqn8Q5HwI
Message-ID: <CAD++jLmRi+f3BGGxXzkP1ubaP2J8Qfy-v0HAmQqzN1x=e6d3bw@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] drm/panel: Add 5 DDIC panel drivers for 14 Sony phones
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
	David Airlie <airlied@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Casey Connolly <casey.connolly@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
	Martin Botka <martin.botka@somainline.org>, Jami Kettunen <jami.kettunen@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:34=E2=80=AFPM Marijn Suijten
<marijn.suijten@somainline.org> wrote:
> On 2026-09-03 00:22:41, Linus Walleij wrote:

> > > This is the second version of a largely reshaped series that brings 5
> > > new DDIC panel drivers (4 Samsung, 1 LGD) that are compatible with 14
> > > Sony phones:
> >
> > What's up with this series?
>
> This is repeatedly blocked on the request to factor out a generic Samsung=
 panel
> library.

OK so that's on me.

I don't want to hold back this important series over that, just go ahead
and rebase this on v7.3-rc1 and resend it and I will merge them.

Meanwhile, I shut up and code:
https://lore.kernel.org/dri-devel/20260903-drm-panels-sofef0-v1-0-9e841645b=
eba@kernel.org/

If you want to use these helpers, I can simply merge the patches because
there is an ACK. But it'd be great if you could take a look as well, sorry
for missing to add you on CC.

> And there have been many small comments left and right - including my own
> observations and self-review - that all need to get addressed.  Not a lot=
 of
> work, but they add up and it's easy enough to miss something which will m=
ake a
> reviewer "unhappy" ;)

Perfect is the enemy of good.

I often hold the stance that we should fix up minor nits in-tree rather
than at first merge.

Yours,
Linus Walleij
