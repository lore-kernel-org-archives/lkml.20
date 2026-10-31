Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445840;
	b=pxQWYWKG1jG335MV5xtKvKhAc6baPyUHom5TaP3vpDBkZmrxn5/lXsNrv/Y6eSxHBPUY
	 Gbf9nR3uUZy4kMSbvlnyXwGe1xMXfh4saxw682PHd8UvOGoLAcCpnnVPEyPDndmDiNn0i
	 9KzTkywkJJsmw1uneYWfCvXn3y7yekvlu5r6EI60r+Pm90XKWBOzI1o/s8zS3B1X5HoVF
	 OrCO42AOM7wL7u1bg54/WphYbMmMVqiZu6Z+Fj4R1wQs9GNovYDxRrFOzGoohXAQ55msU
	 +esTPw5fFH2Fz7IDMV9njIiqNuzonxA1+rzhGmflNWI6bvebuQAv0E7vE0KrfsQhL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445840;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XZHUr1oQEOeLBP+Qq36pZIDbK8j5Sb1VVuyeQgaaoms=;
	b=dTqamm4yqIgEwmaMjLyeIY3OSQ3EYrpe1OQGsuRavBGOy/q8Dbc0oaNfLFFxGf5qkAZT
	 /3ZcMXnlo+0AMIfH+h1AjZP7KdwPaXSTcsS1x3iTROaq7C0cBUxaKyYhXo2EvNdEfh6Ci
	 xrxZjyYkB5ZZpHrWsUV88gg79560hA1BcY51gsG/fi22BiTmX+F7Cgbg3jB076FerXkYR
	 rSQelWw0ROUMlx2GWB7tVr3/41Iy1F2dZ384kOhiPzFjLiMgFA/zRDXwQhFOK5LAK/cSz
	 7cOF2vzD0p7dtNGG7nw6Z+XYoYdaJT7ueRvTVe/jyjC97SbtpgRjjqee0dBEnvdSwZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU8hDDy1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C557606A31A;
	Sat, 31 Oct 2026 11:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MU8hDDy1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E898E1F000C1;
	Sat, 31 Oct 2026 11:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793445840;
	bh=XZHUr1oQEOeLBP+Qq36pZIDbK8j5Sb1VVuyeQgaaoms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=MU8hDDy1pTM6qPzGLbDdWAvDuoZBe/le9Z8ZIvvDUwWNtoTjRX1wQ2J8ZYcUtDdS5
	 1cCUyQkF+PhZQo1uPjDa35uHYuFcJESkeiCgCcZac11+MPlcv336JuEktU7qUBzc9C
	 Whjx1s7HKv5c9QSG912G1yBaRXFGiy28w9KwozPr2r8M/8NJ2IDgwBXcGuAqALwgWK
	 dLCoKKtFtih32+KFT0fxLTVfEtxNUVHtJhpIFLsyZ3pVe9XWZdwq8pSJQnucRZGnYF
	 8X4s7qZbi0BCaSxfqFcOfxotAA4S3gqjLEQ/hD+IsNjw0ayTUC0/I09lAbV5yTcjaK
	 8kwR3bsgkKbaw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS
 disabled until role is known
From: Manivannan Sadhasivam <mani@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261007190654.452376-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Sat, 31 Oct 2026 16:53:30 +0530
Message-Id: <179344581059.3206.8395416724192046501.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1843; i=mani@kernel.org;
 h=from:subject:message-id; bh=OBVf5IDGC4FyDWwrDXG4ci8tf+G7ymk2LQoN/g2ar/0=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5c/CRVkT28t1w3FlzGzVopt8Fuc8xm8t/K5RY
 EhPlGorbHuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauXPwgAKCRBVnxHm/pHO
 9Wh3B/94PqfA3+V/K1QqYPi5HU3IJ8VCgumeZnUj/7deLmMWM/52z9LJjbXXwg4XBh9KZaL7Uy7
 VWqbYDTh3wsf2IaJPLuVFi200YlVqYJ4zYZlVZ227MQDtM1dzYoABlIrZNeUi0JEt1VTry+9Iir
 hvQ6tSlLVl5Zt1IHvwxNKfklQ/lgPODtmrpMg0YerG/wZ+ou8C1DRamapNH7rsbLlugGArOJNL5
 UAf4GBbRCHEguEXfaol4KpV0y7lfbtQbUMn7v3VRA147uwDcv9QMJKqv5kPZv0v/ZR1fewD5eOx
 KYcwUQ12VgAii4fBzIcKBBj27mc9ZHKoMi5x+txMaUU+N93i
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-07 20:06 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On OTG channels of SoCs without ADP control, the VBUS regulator is
> acquired with devm_regulator_get_exclusive() and its output is switched
> by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
> the port role is known.
> 
> The helper acquiring the regulator has the following problems:
> 
> - The internal regulator is unconditionally enabled at probe, so VBUS
>   is driven before the port role is known. If the port is connected to
>   an external host this can back-power it.
> 
> - regulator_get_exclusive() hands the consumer an enable reference if
>   the regulator is already enabled, for example by the bootloader. The
>   unconditional regulator_enable() then takes a second reference while
>   only one is released on unbind, leaving the regulator enabled and
>   triggering the WARN_ON() in _regulator_put().
> 
> Fix this by making sure the driver always holds exactly one reference
> to the regulator: reuse the reference handed over by the exclusive get
> if the regulator is already enabled, and call regulator_enable()
> otherwise. Register the disable action in both cases, then turn off the
> physical VBUS output with regulator_hardware_enable() until the port
> role is established. Enabling a disabled regulator to take the
> reference may briefly drive VBUS during probe; this cannot be avoided
> with the regulator API.
> 
> Rename the regulator helper to reflect that it acquires the regulator
> without directly enabling its physical VBUS output.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Mising Fixes tag. With that added,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


