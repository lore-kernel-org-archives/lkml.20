Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751503;
	b=GSfOjCiPeI/t8XGH6dbmHhI5xJQvd5yE5zFnvTelaeiaWKkcGlEIAz9ZtbuzaPjdD9Jb
	 axYGlR9OIu6IRy74DjpXc/M1JycabP4VA+W8060tdiCLTzPrNA4aPIklBZkdL/443izBr
	 8mixbrATlcTG1pSqcBcol21vFdLegd3vIMFoj6M6iIQdJVzqI+yKqFSB/2oHHQXPKuz+/
	 e2Krh94xYEEYeUfUCe6W3jeGPL3OkYPhJWiwYRnGFqCmwvhQkWnNF1xfyUazyxU8jY4ap
	 SKTtjpxo/h7uHk8jWLZcNrdp0e1o9WK8d5vqGJ/FvHJtWtpy2jG+sG7Dx5J3DAhFS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751503;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	b=f7KCaF+K3QUOrS24AsIAAe0bja/O7KX2N8Cdgubm5vSHqLzgsrpKu4xre6z1qxxvghVT
	 p3GNabp2j84lS7BljhDLajnru3evYX7tYGz38IOa7SoLW9Xloys5nDQbAvXja5RiVBDA8
	 +ZyhVDiTM7WhmEBAa/uIkgvwU01/JUK9xwT1SjB517WS5AY4GfFUXgBPZomplRofkbc7k
	 3Kto9rxalq8Q39cPhiCTTawLPnExSXZSXG+CzIU0efAdzjgwTWdd0mWsbb6tNP4ms1mLe
	 rOaKf1YEmVdeXrGBlAIcnea/gxAUeosX2c/oDYmqZquvC9Z5PiwAg2lRFw1H29vcDUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llJiswIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C585606A327
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=llJiswIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45FC1F000C6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794751502;
	bh=XWgHxxw6EzmAFNHm6I5mTHp/KXf3zQq3hfRAvmIG95Q=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=llJiswIgpE2HPBpnEFhVVHSqXDlvWHm5O2IRqbzWMXcQA2Fnh5lSgMWkqNFyyELMQ
	 SrrY9bras3+WFysUsJncPWt1HLb39sHQM1mmZ4wcEgRWkhSPckE5gVK+ey5UP6LKTB
	 In3PU17RmxvrxeCeqH+ucpgEY6NPDxolLYW6QIPchzIu60dCCEk47PvU2Eadd55vgG
	 9/TZYHC7FfuGv5esiWSrg/M5020cqnr3flJp2Wr51ujXkxiHvRwwVZ6H/dG/8f94NH
	 hImJPI3KFT4KhimuthZCM3ZVFyfeXsmRnu7lueQqssRGGKDQ6Xo+AL6Tt/W+RVqNHQ
	 +F/gvg+dzxE5A==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ae2ab35d82so22255011fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEhdTsadBxWbn5w+MYlEd7JmFhXLvq9BDiYCG+ZaRDQjMezQwlLXdobx04q8d/K8m4RU6EeFapxqLB5M6o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8lzl4oR9miyoEHL3OSVpQufzjP/uoFetHo3vg0cclluLBJox4
	VWQoF81pOVgx2EXO1bdZoHdL4s6NTRAqwYqJw3xwDHAbtcLB0Rs7God//OZTb7u2qkcjvxoE+CU
	uSv/Z6MMwJndqCpTe89R2zMyumYO4y/c=
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr25507651fa.16.1794751501306; Sun, 15 Nov 2026
 06:05:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115061102.229680-1-jernej.skrabec@gmail.com> <20261115061102.229680-5-jernej.skrabec@gmail.com>
In-Reply-To: <20261115061102.229680-5-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 15 Nov 2026 22:04:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
X-Gm-Features: AclHuK8_QfEct_D3A6zPG8V_CU046sWNEFKONymgEnMQSD9bb71yZqe8AOLlRsI
Message-ID: <CAGb2v643JrFOwrLrhUOTenSVbRgOVz+hEDFqXDR+0eF9fNpOfw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/sun4i: vi_layer: Limit formats for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>, mripard@kernel.org, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, sboyd@kernel.org, 
	Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 2:11=E2=80=AFPM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> YUV formats need scaler support due to chroma upscaling, but that's not
> yet supported in the driver. Remove them from supported list until
> DE33 scaler is properly supported.

Somewhat related, but I think you also need a patch to block fractional
coordinates? IIRC that also uses the scaler.

This was flagged by my review agent, but I vaguely remember it being the
case from working on the DRM DMA helpers.


ChenYu
