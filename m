Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480064;
	b=eT2H+4xh62gwI4c4ZzjeNLDAGEHBAOz31QQJeNQPiik3mUlxl39+m6IqMQBtsj2ixIwm
	 fVDyOU0nmPN3CfE/BePkjcXclGhME+ZIvrY9BXjBvJOJ+H0K/JUTo6mMBbA5ab+cFEvHD
	 KPpkrxAhKqn4enptuqttnyWK0jJlHlWySDzGwRb3DUE4Ry62YHEtyoJgw2rRbN6m1NZ4g
	 VxLXljkswgE7OHg+aH/BKe3dvd7pAGDVf5IiVnN8KGFgtZ+0y/gQuWdVHCwXebUehZ9YQ
	 IP6n486r3JQLiQRkyWByvA9zCJGCveiDX2yZ4WiczmUTSDAkfYJCvE6hJk/GYc/7FJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480064;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=beVVKqXDvt9rWFg1f2XfXUSimrRxV8SQAsJgMPdb5a8=;
	b=b8ODAR+lv2WJ1IjRIUAt5QmbiAgdFfVtnbRPDJRKkbHvFXvpWESwwkCZAx51Z7+SDism
	 032ToFBJSJs5toI0iTRL0tRGHT48mJDanwF0V12XJbYZlVLHF3aZENa16P1hB2rAVy0/p
	 54rrRXLB2c6kHxYW8nUSDF9BxGlhcMseuczBR90Or3MVNjtgOxjjBomziFiRZ1xcNCGxl
	 qMtdzs+2+3KKdsoGapqN3C/uxM9uhLpw9s9DCGN3/PIeKAIPlh7g07qordZ1DJu6qLHeN
	 DeEWe0SN0L8pbm+IOAC1CPLiAVk/WREwYuum4o5QUP1xweWm4WqWmSUwMK7eDodrPdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpZr7Xb2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DB606A321;
	Thu, 12 Nov 2026 10:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SpZr7Xb2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B501F00A08;
	Thu, 12 Nov 2026 10:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480064;
	bh=beVVKqXDvt9rWFg1f2XfXUSimrRxV8SQAsJgMPdb5a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SpZr7Xb2tehhmv+ltC8yM6qJnTFiElZ9jCp61z+4I4Ic/TZ69iyuTHpHRYjexgsul
	 cU6sYVfpaZE5SdyxZuwvNKuSkm6X7H9EmaY26ezrJbfJ3+N9+TkCgNXGdCq09xHaWS
	 cagU+IljbAMiwZtqfAJq/wKJdbW9Vx9eJAgI9k813kxw+39APTUmtAIubhY024I9h3
	 WNVBc61ImVlLTD6XegDtoWkEXE5Ci9FIPqpDH/vHODmc9MZY2FvqCdgwY6qABUFrhW
	 Xoq/Ic+hNQMs4d/aSXr/zMiNYzDkL4/eQ7X+Tgz3UiLp0mS3Cn1uZtf9ltpwESgU3c
	 7qjM7lIsqwXsQ==
Date: Thu, 12 Nov 2026 11:41:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Forsch <alexander.forsch@bytesatwork.ch>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add
 Youritech et050fw01-kt
Message-ID: <20261112-gorgeous-favorite-gaur-b92df8@quoll>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111133119.1063210-2-frank.obergfell@bytesatwork.ch>

On Wed, Nov 11, 2026 at 02:31:15PM +0100, Frank Obergfell wrote:
> Document the vendor prefix for Shenzhen Youritech Co., Ltd. and add the
> compatible string for the Youritech et050fw01-kt panel.
> 
> The Youritech et050fw01-kt is a 480x854 MIPI-DSI LCD panel with
> physical dimensions of 68 mm x 122 mm, driven by an Ilitek ILI9806E
> display controller.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
>  2 files changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

