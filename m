Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD335F8C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837852; cv=none; b=TLFR6VyjI/GA+ay96pzYkB7KNe4/T1y5gLc4ylTc90cxzUK+/ej8QDExsu31aNSfN9h/Q3PYr7XgAX9/JnoBftxON/aNFmWwWZk75QvCZIA1wxtfgUtkvzAZ5qXrju5DSjW0Ch1Kh7X8wtGzHziYeU88Yjqmj5IkDt5T7XL2ht4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837852; c=relaxed/simple;
	bh=+vEDDkcFwBHCvKCzpx6c5APxZ16rpEBRvEPSZ/ZRrQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=un9ivhDWSNOivxVWVkmiv70mylpxa3/9B2tamp1r/DcF1S0wV6VZ/qwl9gEBMxuNtVfzxvzvOvuy7hSCPwvMZ6nsFPTLtupX1Yo5V40o+NgQmKylckTlvDsq4EW5kFbbWoeHSKSEdNKj8xThwx0B/B5YsuJv+pxoyr0+Efq6B0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cAgppL2M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cAgppL2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64D781F0089A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837851;
	bh=+vEDDkcFwBHCvKCzpx6c5APxZ16rpEBRvEPSZ/ZRrQc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cAgppL2MTf0dT8UdP/8BSRxZkKtLz3ainVz+6sGytzZJybPbPpKqnMWYPAqNIttgh
	 R6XWoEkuOOLBcmhF/TFbfeQ+wCaZq8Cr6M7jATMCZxXOJ3egSUOQgnuNI+MeIRTWm9
	 B9XXohTvkaRCrHlKnVktpnIOz2I54mpq992J9308jdQZM/xSkWmlt43lbnLGY5X0rL
	 Iw5GZwZ6e10CPf0NIytcmld5Dsosgk114rQItDxVgnuCIHEMk81bRxfS1cR/GuasjJ
	 ZC13CpY/8shizbuSo9HFGAgn9jj3f8PTsVj+QHEnXkKb6J3h54U7eK1NPM9EBg26hk
	 bKTpVYYjUH3VA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba4415869aso371745e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:57:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzEuWAj2OmclDyPVTuDPEv+pGYkJfRnHQs+jt/wDX9RhmKOCt/sfVcjwVHu8k5pG3qi7Zl/x+JDPY64EUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjZvjP4Td+PIdz4OYqUJooOdVX+Yh0Lg3Fpd0h9nvyRbrQQwGF
	cm4Ce4+t4QU9K0yA8SOmgB776pnykNRyjeLz9at2qLrTFl/QQyS46BE5bG2wSAHsSSPdSQFN7YG
	AJoX+GjvhS30+BtFbD9RNpFvXpHetEcU=
X-Received: by 2002:a05:6512:669a:20b0:5bb:783a:72ac with SMTP id
 2adb3069b0e04-5bb783a73bdmr66950e87.16.1790837850121; Wed, 30 Sep 2026
 23:57:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789994813.git.osama.abdelkader@gmail.com> <66eccc200bb4f5e26a3464a46448b1a4c03b53a6.1789994813.git.osama.abdelkader@gmail.com>
In-Reply-To: <66eccc200bb4f5e26a3464a46448b1a4c03b53a6.1789994813.git.osama.abdelkader@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:57:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0sVWy4E5aksRXrVqpHA5ayK_EhD2MgSi1SZsZascpgA@mail.gmail.com>
X-Gm-Features: AclHuK8o8MoLB-ogaYd0O7Ruv7BqFzDty6wVukicfWiBSFsjsYqIvJXIMV7AZQY
Message-ID: <CAD++jLn0sVWy4E5aksRXrVqpHA5ayK_EhD2MgSi1SZsZascpgA@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/panel: Use managed helpers in Novatek and
 Raydium panels
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Robert Chiras <robert.chiras@nxp.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 3:19=E2=80=AFPM Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:

> Use the managed MIPI DSI attach and panel add helpers in Novatek and
> Raydium panel drivers and drop the corresponding manual detach and panel
> remove calls from remove paths.
>
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
