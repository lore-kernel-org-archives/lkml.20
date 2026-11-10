Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314036;
	b=YGhxue2O58ABpmYFa5MjQaUWBnArbBtr03tuRBmG64ayhXU6/056ivX3YRXe2mYuxuVo
	 8U06zFHI2OKLSLQ8J9xTFNhPqhmjk4jpKAhBq7PKflIJL/+IaskZ98nb+XJrpvgavYboy
	 hjS9tMy10sBsQGWx+orzf8XvKqnM8G++a/SPWjXjcA/kyyVQ6Oi7CaT/Cqw3ZZC5G04bm
	 WynQTf6pjiUyM/xSJ3lKUIiWYpERttCmBbZI2sWwg5TeGT19Xlp4eHW7E95zrf6sF0owj
	 c36wsi0QQd5pa6r6fz9wShZqI6o2eRdyHgfhjQAL3t54N+ti20CDI+mJE+H7G6wPwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GTzfLzc0u8rKgofNE0jg+z1Ua/5PCIE7H4gnXQiu5+I=;
	b=0NJkPMTZqxUIe7+1LhMojcE/vLSVXeQHtErtnpwQrx7rdzgWVc8LnW/oggrDkVY/YGKL
	 ukdQd4QT2veGzv0/9PPuCrkMzXvOIig23g4Q7YrXkAacQo44xPM9eZieRaY/SCve1NK/X
	 uYtfu+RvYLgopNnp+yp7/xxID8NHnWFMP3bVk6rxSXY58cz2wc3rCrMp914ZPWvh7g0MG
	 yVrcGH/4KSdhKt1TOAJ9T4+/oWDndO2WdDqFlFJyzXvEhJeqZ6DTSP/JBEXKNy4ab4eVk
	 C3S7Ef6+bH/aXURAhcMdyyUaVJ4mEyHQcrWMMmJKiOb40+fqvUST/hLrq0ILkMZGByg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVGyJHKp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69304606A339;
	Tue, 10 Nov 2026 12:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JVGyJHKp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484901F008A4;
	Tue, 10 Nov 2026 12:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314036;
	bh=GTzfLzc0u8rKgofNE0jg+z1Ua/5PCIE7H4gnXQiu5+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JVGyJHKpdb//PBHZ/hVCXQVOi6jwaPWnhSIvd1Nm1q0yf2FWErBGReupwad0516H9
	 iJoJpWUMoT/+yVBDZ6BtDpwq43Ei4FAdI66KXx1egujfHwknaIBFXaiqewszm0eu3I
	 1yhvlRbpDuK4gMQaiXX1ynAE9Hfp+V1Q9X298w19k6VtdwWFx1+1Mcxk2HSXKBBE8J
	 KoNXscXzucTOhwNIl92gagrQ+KnfHfmbwi7j0GgqN/A4F2thvipZeHJLOQk3yK8qIo
	 xmGWDNmwRN1oNOb8icU7mMSoBxm5RlL7w+cTHiFDEv42n2Kx1DHpiet3AYhQhUffK8
	 oD2jZROqT9l0Q==
Date: Tue, 10 Nov 2026 13:33:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Igor Reznichenko <igor@reznichenko.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: ilitek,ili9488: add
 the PocketGo S30 panel
Message-ID: <20261110-didactic-black-polecat-517d7d@quoll>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
 <20261109160706.2272332-3-romain.tisserand@gmail.com>
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
In-Reply-To: <20261109160706.2272332-3-romain.tisserand@gmail.com>

On Mon, Nov 09, 2026 at 05:07:05PM +0100, Romain TISSERAND wrote:
> The Miyoo PocketGo S30 handheld has a 320x480 1-lane MIPI-DSI panel
> built around an Ilitek ILI9488.
> 
> Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

