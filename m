Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA4E4E3250
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686496; cv=none; b=REZkjcTVgaqKy6gsnM66FfzkHADE6R20hM2yTrnRypPkocwdXRBvqtVHFD7Ltfh/XVLGavNjI9R3UqIShSWuvVnq8OJpg2plGPHch37gptUBdZnc+Ilh4xJCOiBACwWiWuBuRtM2Ua5DheNFSWAIKkO/JD4kf8k78PdUScrBR6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686496; c=relaxed/simple;
	bh=xS1NkkYN9CulJRaLfTSH2iScF0/e2DNcLRbcAPxB9l8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCVCEvri3UDaLJgVvx4/k0XEyfon8v0auwjP2TYhX4ty7ALTmwKGkWaVLLnBr/OkaF3BQ5os/VKNqfVslSPsHu7nwHEVDqYP4vM/TZO9GHsfOZc/TfylsUas5bmEpRCwSs9e/BPcAnrSThNm/92XodMhF19TdKbaXUjMY4yDjEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jI/dbVEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jI/dbVEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B1C61F0089C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790686495;
	bh=Igy42JddWg1pvkuq6wti/LXMBzd9rwbkMAjmT2jtT+0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jI/dbVEpToIZjYPOtLcxlN0h3WJDkOrANgmtO2i8XE78vv7VqR/PeARfiiQonmD4Y
	 EfBPRo8EPGNjbLhfNaSxRWKg0T9DFBFNWmC85RWdDJoIOa0Ynz4W+76kgEl+irxVxw
	 kktRI/6tfdO5HM4dgxyQVCBp3XqZoGQu2mEsDYXSp3ysm8/D2CWAgl04HglIdkPYtr
	 l5YQANrrCKSdWfXtAvwYSEbqm/p/BOsLanOvE8UF90BZapp7hVj4WQxtfQu0hm8sbi
	 ph4lpmHta4oBf+e77DRO+G1s4achZKJl7Q68baOsp2LTfo4LA7PxFvkSv34Qu4Cj+E
	 hayQnICxL/rHA==
Received: by mail-oa2-f35.google.com with SMTP id 586e51a60fabf-492d8c4add0so2197821fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:54:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4gVrDHA/4l6ZfgL+En4fFW5qFKDeTkmzfbOWTXaLVuh5DxxgKs9dk1Cstsp4rMXb6VCjmmmC5EFMEXGk=@vger.kernel.org
X-Gm-Message-State: AFuF++nJuyyXTD9eUPceH+VqBgAqrvKFGsrPh0PWsvakfH9kyJudpsc2
	DVmBPvulT0UCJ96wvt/mMvBtEk50Dm5jIlx2fPLDWxe2nl8x9Encwspy1sw3jKiX4DstYJkgnSg
	xPQ4XEs2Riulukl9KPCq47OAez8mRgHE=
X-Received: by 2002:a05:6870:d1c2:b0:48f:e0e5:a1dd with SMTP id
 586e51a60fabf-491e7a6d6b0mr14229510fac.50.1790686494627; Tue, 29 Sep 2026
 05:54:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org> <20260727-spotted-winged-mantis-7aa1ce@quoll>
In-Reply-To: <20260727-spotted-winged-mantis-7aa1ce@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 29 Sep 2026 14:54:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
X-Gm-Features: AclHuK_CheQSKIMDhFg2gRDpav4ZMyb1OqvfpMBU-vTMPZz8dP06MGN3wLf1QRU
Message-ID: <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jun Nie <jun.nie@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 10:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> On Mon, Jul 27, 2026 at 04:08:44PM +0800, Jun Nie wrote:

> > +  reset-gpios:
> > +    maxItems: 2
> > +    description: 2 reset pins for 2 physical panels
>
> Won't work. gpio-consumer-common expects only one reset line. You need
> two separate properties.

Hm that is a big confusion for the head.

reset-gpios is by it's very nature plural, because we structured
all GPIOs like that, exactly in order to indicate that they can be
arrays. :/

I think it's appropriate to patch gpio-consumer-common to accept
> 1 gpios, in a separate patch, can even be sent outside
of this series.

Unless the DT maintainers have some good reason to slap my
hands for that suggestion...

Yours,
Linus Walleij
