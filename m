Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E233472F81
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145375; cv=none; b=Hmk5tTdt3BYyNxVKQpo0pctFsrAtZ2SH8YdgspYoeJszuA1cdwpxx/U/1qKvByjZ+MdKR8/GZd3csVaKYEgg8d8NkDnWF4Tr/YkRlr/MXIrG+P2AA4ZCNfhjtlA/b34ClZR9a2x3gIcXGrz0EQAOeTOdg9cIQteKVSRe1uJYMJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145375; c=relaxed/simple;
	bh=ztYL1LS2bhu36whhqBvW6em0XbL9fUZOVHbC7HjvK9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fkaq8BSJW+tNT09QG82dUqpSqn1QLEC+MDgACteo4IfvMBTBDfVp+P0A3AFlEwSQoSUFjUnMkhIKcJ1RjJyrMyTUk0O3XC/C0rb5AaSEa7aYbUE/jXUCVoVSwF+vEJOr5Ao8tLwys3h3zjJM2augSUze7+yEZL7CxePXI6O8rEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PKfY1Cth; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PKfY1Cth"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF151F0089B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791145374;
	bh=kafHJjiytSen4oG++rJSyyLmUK64zKjrIV7lk+5gzN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PKfY1CthtYS0jlEI2BO7t8HL1LTRXF3zNFmUwHHVOKfq5IMvmBmzImxGEyCwjtxj2
	 H/nycB4/n0cBCCzadXhNKeioHqcUowk6gzmdVevcTosf6LnLrTEKe2c4qvTseuEe3S
	 GQ6ZjgGu2dEVJ2iXIYDIdxq85iIiq6ymmnLsMifiBuz1OewQ2Ooz5Wcmlsk/9g3lz6
	 XHKsgFJTWckvbviwmWVhIS16paVhL9I28W5laqO0g/pgkJwxfKm3myXko71DL7ZAka
	 YpSzJOonp2qRxW//U37OpOi4dobEGGvRpJzFpysgO9dSn20qk/89YIz4I0cRtthNHy
	 Q/sqqHNVyBPEg==
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a894300b40so4103251fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 13:22:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw1HVMY49ShCXi1kM4TSswofLesBsUa58G+vTSf8t656tHqCUEP2IQamJttrtMNX03W9wEoO9LZ2qg2G/Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUsZ+eaBcicYV+VKyKYez/d3u70KoRGQYFG90XaJUab4TzGCAz
	vFsXdaE1UC3XvqCX1DxallJG9+KoaXyDZ3JH6sxc9tkTjkSFx182oy2GiRImxsObApoitqbXhQ3
	hORRSy3RGRgRFPNjiGAVfjg6fdbDycLg=
X-Received: by 2002:a05:651c:2123:b0:3a7:8372:61ae with SMTP id
 38308e7fff4ca-3a8875478d4mr19348371fa.4.1791145372879; Sun, 04 Oct 2026
 13:22:52 -0700 (PDT)
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
 <bc3e618f-2e7a-4439-9466-8cd9695242e5@linaro.org> <2lcpzwh7fxecpffnakpnp5lecrm3e6u64ztat7cd75nuxofxa2@clj27bzgjy3r>
 <4d053234-06d8-4268-b60a-2fccc78da654@linaro.org> <d3xs3kzc2wg5lkouaemdicrbtsoquff6bvmnlmuxwh4kspfs2d@b77l43axr6a4>
 <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
In-Reply-To: <8cf6ec52-fb36-44e7-831c-2bb24214f591@linaro.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 4 Oct 2026 22:22:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHk-2MK4vUAz3q4q6v6jHhBkt33eJL297axbRqLn6w3w@mail.gmail.com>
X-Gm-Features: AclHuK8ujdY6mGbLMOyGi9ex9pbymEK6SXgRbW0wNs9wcCn6KDJLJ0Dey6NKZlE
Message-ID: <CAD++jLkHk-2MK4vUAz3q4q6v6jHhBkt33eJL297axbRqLn6w3w@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics panel support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Neil,

On Sun, Oct 4, 2026 at 5:51=E2=80=AFPM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:

> Describing it in separate distincts nodes is wrong since it doesn't refle=
ct
> that it's an unified display, so either we define :
> - a "combined-display" bridge defined as:
>    - a separate top node in / like connectors with a graph from the DSI l=
inks to each panel
>    - a DSI subnode with 2 panels as subnode, port graph from both dsi to =
both sub-panels
> - a "R63455" panel bindings with 2 subpanels as Linus shared in https://l=
ore.kernel.org/all/CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=3DTTBknQMeFctw@ma=
il.gmail.com/
>
> I think it would be interesting to have the "combined-display", with a co=
nnector-like node,
> which will do all the split-dsi dual-panel logic for us and leave use imp=
lementing simple panel
> drivers.
>
> The outline would be:

Overall I really like the looks of this!

>         xr-display {
>                 compatible =3D "combined-display";
>
>                 ports {
>                         port@0 {
>                                 combined_dsi0: endpoint {
>                                         remote-endpoint =3D <&dsi0_out>;
>                                 };
>                         };
>                         port@1 {
>                                 combined_dsi1: endpoint {
>                                         remote-endpoint =3D <&dsi1_out>;
>                                 };
>                         };
>                         port@2 {
>                                 combined_panel0: endpoint {
>                                         remote-endpoint =3D <&r63455_righ=
t_in>;
>                                 };
>                         };
>                         port@3 {
>                                 combined_panel1: endpoint {
>                                         remote-endpoint =3D <&r63455_left=
_in>;
>                                 };
>                         };
>                 };
>         };

The core of the crux is to make the argument that this node represents
the hardware and isn't just something put in there to make it easier
to implement a driver.

If I break open the headset, will I find something like this, some wires
going around in there or so.

If yes, this is a go.

Yours,
Linus Walleij
