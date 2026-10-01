Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C448D88E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837983; cv=none; b=KWpi2sBDC6/htLPyfW4gAzrA/hLc9b075zrgaGQ4rw4Hlfr89YV3PlxBeWSfyWBLkattIzIlwXHzQxZWs5N2OuCPrPlK6mOj5BcwXVqNROSsLCtBDFeBkGEYprTQzpneEad0hRtiVW7IV0BrSmnLD4Q8navIKpPrWwBCY3WCAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837983; c=relaxed/simple;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h5is2kdCyy2yQptqUuxmL+vMYJaTooSQTP5aSGJF4tyQ4CPebU18bsx0KxhyAfaD6UzrJr0+/8KzxGBM+ThP4WmHsSwCPBAoRBjZ58I6xYRSjNAPOBkJji6gGt6dRjEuNQLSBi47V7Rh1YgX9KpGo2xqc6Pzf3JRVg+2yjnGjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eb7QsxdV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eb7QsxdV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BF81F00A06
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837979;
	bh=QJwfbKCyn/gh6UMXa/B9wDnCdxqQxEqYbYvEbOHcRzo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Eb7QsxdVvwC6Q6ASOE6RHWopINjqmVsM+asCISC8KzX4TbbjLlLnsFGewjxLBiuAL
	 USpbOV25b9ZmxZxGODhRZ/pIOUEV4j/7ISqQiq/4Q3iBTdt2DVLljYevQD1l6XoyiL
	 /6myJolVu0oJo4EALqct9L6A2ND53yX9mOAI/X1jCNzZ1CH/ZbM+48f/OViR41yaiE
	 YSWVB+jXEhQSQQdD456ShpIZi68mzYXHl+aRD0Dw6RexksYrZgHbY19oPl/9V4B29b
	 xtsP823iFmnkNIANNLcxBYI21WhoxAkFuarvbrBPjvq3midaRtXgYMBNaY+ttNwSXN
	 HLUC7j9fQRUAA==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so52238971fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:59:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzwN9FSUlNO3tWdUQngRIjHKYw9wbfeKBFkZDDSz02HUHc0V/8MKXWhs2Q4tARKsMWjL3uO7Htw8pSqczQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYILXA0EmSxXE1sTOFYK8uX3p3KtUn6EYuFNrtlTPCPYsUQwQnuv
	kNfMUioROSd8spNRpJeQumJzdKzyMgDdglT/FFtp59eunPCpyY+TBrlBcnOoaK5A8NycWyPURb3
	wQbJ9lw0aC1NXzoic3o+XY4Y11/Lb8zg=
X-Received: by 2002:a2e:a99a:0:b0:3a7:812b:d0b with SMTP id
 38308e7fff4ca-3a7812b1f22mr7437971fa.11.1790837978465; Wed, 30 Sep 2026
 23:59:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-8-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:59:25 +0200
X-Gmail-Original-Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
X-Gm-Features: AclHuK_sHPl7UkC73IJwZdQ3ifWpNCzHWYkFbMbP-K9-g_pDmrUnJv1iVcxQNBo
Message-ID: <CAD++jL=G5ObsdvbhHFsEOeGYQFSd8Ggo7jaEupRTEdPmQD1e1A@mail.gmail.com>
Subject: Re: [PATCH v3 08/19] drm/todo: add entry for removing the
 panel_bridge API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:46=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now that a drm-bridge is embedded into every drm_panel during the panel
> creation, the panel_bridge does not really exist anymore. Its API has bee=
n
> deprecated and kept until drivers convert to the bridge API.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
