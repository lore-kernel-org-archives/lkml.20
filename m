Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243250;
	b=tnjI9Uym8glp0Hi4zGkI67Q2uDY+Rz0IsWdXKOxf8pZW4C23xPfe+Q2vvRpyJbdAE/EJ
	 a25sVUlW+83xIgKiEp3sib//SSGkJUR9UZa1Eq/cFsfN9MrmhF4ETuviqHsTEuQlSQ8Zj
	 aqExDYD1UkImpz3kzN/+zRMCWR/9earRBWMUGzSzAt34RsA6EQ7Pjnt7nZ9bUMZh6HUlc
	 RClhwWJeeuP/7wjEDRkGio6s6N301YF5aOwFE583vjb/Mo1wi/7bCrdhbYAvW77uhigBT
	 +wqom4z7iN4auI46Uv16QrZcoI7Nbtl/sfCIj1AKpwj+rMCxCcL5KtBABy2zIF9KMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243250;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=;
	b=uSExDGq/M4F6XTR53SfkBscZUGljjY76+7N99nEDukHNgiHuIHq4kIwnnJ5jtxkj5wFp
	 2tRppS7qmp2bJbO54O8IIZkeRFw1t7ktVBcZhnKtfZ8Jbu4m4UKgXbPmkcylICp2pJus1
	 Lg5pMI5v1ZzWUJ9GLD3Cejjy4SuQ/523sO+YRyeTc65SNDcrpm9uDbMMzf3Uv6M2I70rK
	 6obBrpeGKSTxdGynBChDgTzKwG4ucANQHo/mAa6V9yKipLvSuRZbjz2QqZ7nOTm3AQ3Yk
	 194Yk/HP9zX+qHceC3LQnTKUardUoiiaN6LtLr8IwMlob68tIR0ChSecB8s5TimpL+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNTYIhWy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE757606A335
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNTYIhWy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4F01F0089F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794243249;
	bh=1HDtwLDGfSRrUZ/V7Ccnlt8XRob7ixLwnD6AArPjBEg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=lNTYIhWyh0pZzKnL2tR9hpeq6ddbd8RQRirnojvBgYsvmM1l1rIJVGWiQamXZNFiX
	 2yUV1ul3sJhA0O6Laskk3E2LTKXWvkAPJTRVtRzsBD8WAMOilp2Ocb3C/d6zaof0zw
	 oMrHZndlwXz5TDjJqcIJFjuBPqnaqdevqnbvlXXpIZ8lRe7dmUB8FigPn/B/dwPoeT
	 FA4X9yTQuDUujEt3e/aV4PeYZj99NJ9+tI/RQr1ducpwBYr76Yv106CRVQnA9PVH6h
	 U89Z9FMuU6zAPVmXNCIQ35ki2rCJ/YFR+G5Z5KS3B04GcGfJA7Ir4v6WcqMkCMaIV5
	 PEVC2/O7PoZrQ==
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-854b6e2e41fso552815a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErET0Eppx4pDhLKHZvYSSLyRVkVktCJldgv+wbb6+NT03T2JdPkd77fCb9+cQR/cB+nbj9cUwe/+OXk+1zE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nG50HXYXdpRoPQsVJxgCz70WhrI+HFIwrWYidDA2AvhbrZ+Xh
	mZ9R5oo1f2iotKHos405xjq4a5z09qwqUpQUMDCxlQU6hENWgoWiwE1fwq7ZZVqq3CdDh+qk2JZ
	I6zlpbcm4HLWsOES/omRYRrKI8vC4v6I=
X-Received: by 2002:a05:6808:124d:b0:4cb:f21b:6f8b with SMTP id
 5614622812f47-5683cd808femr133852b6e.30.1794243248824; Mon, 09 Nov 2026
 08:54:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104185659.884455-1-jernej.skrabec@gmail.com>
In-Reply-To: <20261104185659.884455-1-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:53:54 +0900
X-Gmail-Original-Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
X-Gm-Features: AclHuK_bYfJMnl5Ic49VL29CSJbv2z-P7IUwDE--H7P2QG7_ODWK-Rv_7ZMYaAc
Message-ID: <CAGb2v64xKf-w_Zuqqpg3Y=p9PZw+hdtW6hCdsXjR4Gxp_=gWpA@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: dw-hdmi: Deinit PHY in bind error path
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:57=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmail=
.com> wrote:
>
> sun8i_hdmi_phy_init() enables the PHY clocks and deasserts the PHY
> reset. When dw_hdmi_bind() fails afterwards, the error path doesn't
> undo that, so the clocks stay enabled and every further bind attempt
> enables them once more.
>
> Call sun8i_hdmi_phy_deinit() in the error path, like unbind does.
>
> Fixes: c64c8e04a12e ("drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
