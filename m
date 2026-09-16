Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB774E66DA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563958; cv=none; b=e8RP2x6jrrIOU9PTi2YWrIeq/7kajipvpDK4ikLFf24KUUgpAxMDKnDObpdxRDMuJIkAKllTddIKOxmFGA/WqSajiiwzYTJtvZbJ59sUItfq46Xox5YAFJS07mD+uEuOTJNVuAIS06IF2P/oc6wrgmqf6PSglSbXgqugxMSvyeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563958; c=relaxed/simple;
	bh=hChrl4CK53bswETCADzXSQQfDk9g/3yul6e82joAVAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fpza28zp3aAOtFH433YDHeIXGSpGNZhFYQKc0Q+eMuPinKUv8jQ5uiGwSD6eBuFnamcxePzlV5uZqWrZl8zDUBF7gQpSmC+pF8EfDNPcTEEQwVYm1NrRPUsaTDI5f7EmrPc0hxt2wxuetA6ncXMmb3NCbz5PTaBLCygjjqADvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cw40UgIn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cw40UgIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1D71F0089C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789563956;
	bh=hChrl4CK53bswETCADzXSQQfDk9g/3yul6e82joAVAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Cw40UgInzcRZ4lXdbos4fZ6UVy/3sGB2KW17PBmWZ+MpBG4FaksCL+yGHdHBw4J7V
	 D2OthPG8Izbj+iBMyECsqBTVlJAiBf3HZ8lKXZMx0gUEWGuXUyMO3sIygJgqYKJeC1
	 P03b8bVfNiWZJAEA7d4jxM5mlSr85btRSpcfsPA96Nms2DMem/ap1t0zB4zrr75+Yd
	 l3G2OyfY6okEsqoqxBYsHX06fMqTHXX4zaTGYjgJPcaSlQK9HUhMEyN2hp9os2foDf
	 ojQP63UUXBdjPhAsecGGcl9a4YHlFVu0S1IwlyV6d8DtZBVnn3EEw7Fm1jGJtQPmbD
	 AovPeOpFhw3Qg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17452so844376e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:05:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByse6TbzPTUi9dNeOH0KnfjDj5ls9FFOtEnD6slZjz+Xk4uTa3XQWsX8IM/56LWtC5zFZ5qKP/nHh2pMLE=@vger.kernel.org
X-Gm-Message-State: AFuF++mojvpvBUx0dJIYef3E79SkShZPGlYbhFBcvQIBOkOPP88HIdCs
	l63JGG5YVYoGzRh0WxjDnRVw38NRjsoKO7LUOP/Yv62kkO5SWB9L2YaONTCbwBM+4cLx6sKIwXa
	mibxx1wB/iGi7o2xnegdov3vT61LwOkQ=
X-Received: by 2002:a05:6512:a8c:b0:5b6:4ae:8c02 with SMTP id
 2adb3069b0e04-5b8b6625b06mr853364e87.29.1789563955033; Wed, 16 Sep 2026
 06:05:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com> <20260903-drm-bridge-every-panel-v2-17-2ab8ee24538e@bootlin.com>
In-Reply-To: <20260903-drm-bridge-every-panel-v2-17-2ab8ee24538e@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:05:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLnCw1p88cZgDPQw89-62NKVRNqor+p36HOb9xnu=MRdaQ@mail.gmail.com>
X-Gm-Features: AcwNN1V4cKCQ7bA02n2CXGc5EhQzCVMKKQ2XQjUhhoN30pCeY779l2poTZvMli8
Message-ID: <CAD++jLnCw1p88cZgDPQw89-62NKVRNqor+p36HOb9xnu=MRdaQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 17/19] drm/tve200: remove unused includes
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Albert Esteve <aesteve@redhat.com>, Anusha Srivatsa <asrivats@redhat.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:13=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> The drm_panel API is completely unused in this file.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
