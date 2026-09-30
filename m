Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41746D2C8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798347; cv=none; b=g0wOuT1c88jZRgOV2KqiRs6lXagLGQTMoZ1IzbkmipHpnpPZBmVzwWRLPU+Z2BOXUfsXuFHtK74sUeJMiRCO7cA+CXu5vKNC6aWfjpqMyvt9KMLlE1pkgx37VaiWMtJomxEPZuidBmfTVs2NMWMGg7CwrIXLEatlMinwKhuyhiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798347; c=relaxed/simple;
	bh=D/tJ8XO5I/d4e+Rte4uhp801DYYIQLeDeH32x1bw40c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fyf/TVRHIM7QaKYPHaaG/7X+EoVnO1Me2AA+bjN/M/sauahrCyte2xKyULAxvGqfi0jZNNSd1BSLiC2y0Xd1z65v2cpRMVGYSPvM2ln65gdejFgJiX6dIcSzUjxsoK1I4HvGVLvZHP2rIMwGCgvVCO1LTfdH0fXEbqa81ndWL3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n470vNXa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n470vNXa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DADE1F008A5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798345;
	bh=D/tJ8XO5I/d4e+Rte4uhp801DYYIQLeDeH32x1bw40c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n470vNXaLCPDVYGZ/r3nlV6tajokuBHd+PHbSK0cEQ+vv2GulqzwQiy66EZ4VBmjT
	 69NLtDKBO86cNARwGsnk+cRv+A5DyBlFf9vpdDurovVZsaw0DdczKUbMZuq6rewqkH
	 PiEyze6nTwpI/c223FfDLgyeJYdNjW28PcWxK0XTTsRlRNlSgsVyApfojdQD+QFsu/
	 87OHFEi8nbeiHUG0DXEd7/4Kqyv+7nxGOda9dvd7YSPTrbso+XKqepnLjJTLUjnBAY
	 jOzdTna7aVE0e3RJ33nvCEiST8pBalurkjU8EHpBy7/aGuCl6klNJJXd4wv6pV+n8/
	 oszjDqjdABKxg==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a612404718so54843161fa.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:59:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1eMwAuz8RiNnPTYbwwe9GnaXnwxmN12IwFP+4DkTDX+fIO5BX3jL+4bKtBGz5aTdN6d8A8qES56ceRbY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAyO2WgzftEoudXyHJm3V4A1wEMfQkeUw8C/V1EotE1erwfMar
	s7NhWPpq4CJh/k0fVRRNE/b9o2bXTvJq/kkGqOLKOE6SXKNpAAdpeE3BH1TEqGdyNtwQX1NH0P5
	jHMcIdUbIp34t/uNThTEFl22aqvYciC4=
X-Received: by 2002:a05:651c:2107:b0:3a6:70bf:622e with SMTP id
 38308e7fff4ca-3a7791d1688mr7596131fa.4.1790798344186; Wed, 30 Sep 2026
 12:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll> <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org> <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
In-Reply-To: <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 21:58:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=EZ5o=tAQZCTp9N7fKLJcxs7d0mg02dK04y_TNYtCZHQ@mail.gmail.com>
X-Gm-Features: AclHuK9gg0cHcaEM-2OSIkVk8KJVeFTXpszMdFCa2oeVci2UZbbhBGtCUcsPNPs
Message-ID: <CAD++jL=EZ5o=tAQZCTp9N7fKLJcxs7d0mg02dK04y_TNYtCZHQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 6:43=E2=80=AFPM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
> On 9/30/26 09:44, Linus Walleij wrote:
> > On Tue, Sep 29, 2026 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:

> > The current binding does not reflect the physical topology of the
> > actual device, and the bindings need improvements. I have a feeling
> > there is one display controller with two physical panels.
>
> No there's really 2 controller and 2 separate panels, but they are not
> classic panel, they are a pair of panels+lens which are in front of
> the eyes which forms a single "image" for the brain, so they are
> technically a single display and requires to be hard synchronized.

OK

> See it like a single physical panel with 2 controllers which
> shouldn't be used separately.

If you have one reset line to them each, and as proven
by the driver in this series also grab and assert both, they
are by definition *already* used separately.

DT needs to describe the hardware.

Defining two nodes below the main node for the two
controllers and adding a reset line to each describes the
hardware perfectly fine?

It's not like I don't understand that this will complicate things
on the drivers side, of course it does. But a binding is a binding
is a binding. It needs to describe the hardware.

Yours,
Linus Walleij
