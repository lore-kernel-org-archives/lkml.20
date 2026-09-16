Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FC639EF0C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563677; cv=none; b=cnOfzcIA+G+a5BMsxYFh/k6yN60erArPuztGoLWywcfM6BXp79IdiocZK9jBigM4TJEyGL6w7rmz4ugLNgrZcy4hMXbVMJVGmcIXN5B9RdqV4tWmzEYwotzxF33VXvP9J2qQ1VpOCSjcH9jSUgNUGUhnOw3pUFg0P6Oq+PdBXDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563677; c=relaxed/simple;
	bh=Lf7lgG3sBbT6pZQhmedmnbD+xaGPnUZIzb4dlNg63+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JFlM7L2/IHb3knHfZf1+DmGMvy4VDsvW+9yvuB/LozaYu4gl85+WFGAVEAR1SeCZiMtm3Z4Xxqs5p2B89AWEQDOFp8xEK/7x4L0cnelzzjJ9HuzcdQn5greQkK3NhXHRTwjj0yVdJX8sErGH1Sw+qJYxIavei1zlg+1dvLhp3QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdYZ0bpW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdYZ0bpW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A64E11F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563675;
	bh=KUlZikuQBkjASqlS0r34MSesaEU1v9kEjK8BGJ0I3Q4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fdYZ0bpW2p1hVYvKeayGkdkxciHhMiJfLULqihCfb+ZwktFd6bGix7u2YFbMKupIK
	 x9QI3/AXOWqPpDN9EkRS8dyZCuZ77P7NMx7p7xODZ1BMXU1t7q8mzI6QMCuIkus53F
	 S0Ct1uT0GV0e+U1aetYaC3q7XYCOMCBNCoAAIBDY2SHiRLWhYRgVGoS/Hx35dpV2K/
	 kngyOo52nB9KS+7k+s8lALEzz+fhIUcGNkVSgtxrscvs0l0dMf9e1fhMZ9XFOpRnmm
	 yLc64zxL/lY7yMdwtEo0BnqvngH4caS7GlM9+oEQbo7WH3Y6zQZDjJ9jTWiiivGcXo
	 1kjSiLO9biR5g==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so923237e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:01:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwIdGdQ9wWFC2sTu30p013NP4j9qHAxQtMbgxsXaIK2SRxegx3SgtP0tBnLOe+3vMRkkbaLehkQlEoQWWY=@vger.kernel.org
X-Gm-Message-State: AFuF++kD1HlQHtrcYhyS96u0bwxarCDyATZ+p1VdDVnoFWa9mzPTFzle
	aEB844i4e2/MxTAlm6uTZFotsFHuGKqtfFIzabXFRvCZvAR3+gmENsM9MQwk1E6iGYmBXZkYsOO
	bQZgfKrscvSS+Vqm7ht23R/Qy77/y7K8=
X-Received: by 2002:a05:6512:3d21:b0:5b6:1a42:7d52 with SMTP id
 2adb3069b0e04-5b8b66299b4mr1409484e87.13.1789563674354; Wed, 16 Sep 2026
 06:01:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915154644.104460-1-osama.abdelkader@gmail.com> <20260915154644.104460-3-osama.abdelkader@gmail.com>
In-Reply-To: <20260915154644.104460-3-osama.abdelkader@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:01:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLmaowjhdX5wuuGAm6LFVR9T77zDhBj4pVPKSm_N-4jr_g@mail.gmail.com>
X-Gm-Features: AcwNN1Vdr9AqVc01Vh27EmawQxNTv6BylWfNoRByVbacDfo9kn7WN143c8tZFNQ
Message-ID: <CAD++jLmaowjhdX5wuuGAm6LFVR9T77zDhBj4pVPKSm_N-4jr_g@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] drm/panel: Use managed helpers in Novatek and
 Raydium panels
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: luca.ceresoli@bootlin.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Robert Chiras <robert.chiras@nxp.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:47=E2=80=AFPM Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:

> Use the managed MIPI DSI attach and panel add helpers in Novatek and Rayd=
ium
> panel drivers and drop the corresponding manual detach and panel remove
> calls from remove paths.
>
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
(...)
> ---
> v5:
> - nt35510: keep mipi_dsi_attach()/mipi_dsi_detach() manual instead of
>   devm_mipi_dsi_attach(), since nt35510_remove() also powers off the
>   panel; deferring the detach to devm would run it after the power-off
>   instead of before it, changing the teardown order. (Luca)

Good catch.

>  11 files changed, 49 insertions(+), 179 deletions(-)

Nice diffstat!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
