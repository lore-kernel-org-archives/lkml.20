Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001856;
	b=kS2BCoKs4qx43d276PLofOidLlauptZx3mSK2JasMbH2Qtc3LdTLPtkjvvlxQYzy7+qM
	 FXijdaYmu/xunsHOhcuCwTIOxOcTX5oGjBEeT2crpqf7MahY0/tmZeC68dxtOp+D5YebB
	 +3DfM6WTgOKvcIPQtfWG8Y/JqJSYOi/ZtVOqIjTYnVHPv7jcq2QQYtymfR8m0jeX4As4E
	 QMAnux2ZrJE86/GniXLW7GrTNyP5Gy2ZcRd/i0HLrg7Uf0c9Tx/S2adnyd6w7osAEXJ1c
	 lUtEUsCV0AQWicunsm3zyzXxVlLiu801y+3/QEjF0ECmMkZIA5i+7M3ebOV8/jFfXhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001856;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gEr8Jp+Ny4YtsUekpUShINHIGkwK2BkTrE3Zld9rNuw=;
	b=EhU8iUaAZEMa9w0qw+6Q9L0LpHLlHYIT9tVRSbP10SWr6mWoQMitXOQvrK6k8m/d54ji
	 Fl0SxJbivkFYvS/A18CJ0NpbVN7mTNe6gs5CaVmuiEldq4jNbT2Th1X0/AXC8BdAsnnlm
	 Bg5zphC0rDwKVPGMLdA4rfp1Zm9vkW7bjhP6e/Kcpi1hs+dgexPxfVcnJxR6xdQEgOJ12
	 XqxSM8YNa+th/jM74t2Vz4mijn9rlhcj9iI1jmVCm8b9sTiTHxFYvNtu7j/ojobHI5UuE
	 vVPGudxyCuzlAjKrepozfn4KjZLEL5POvIpZxt/8Ueh6n3xc9WR8EOpnRHWzVZjYi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxXqkW9E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D04606A31B;
	Mon, 26 Oct 2026 08:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DxXqkW9E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 425F31F01825;
	Mon, 26 Oct 2026 08:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793001856;
	bh=gEr8Jp+Ny4YtsUekpUShINHIGkwK2BkTrE3Zld9rNuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DxXqkW9E+JzaMAvDiRXG0Xzi6+JdRIL4xCzN2V6egLlB7qKOjaKgYOaVW+dpK/rn6
	 MpNO++pB342va2JOO4oKNtWCcBq4yq2eO4k3m4JLKjku9kzVmCY5qZ4aIxBWaucifk
	 vZVph1+iuIqlUE6xWzJKqO+P55aPZIJUg5YQFFy1FkKN72GILaqhlHiBlcxzt/zZhf
	 3Yd+rs68rnrk7wVTrO54XuE/V4rU8zzKh/cyyNVDSNZpj3OP0EA8CZbp4ibyg4ve6B
	 W+38Au+p4pgbu32P3djgPbdGBMP6pR1xTfBaZFg43Tl81trUPI2J5tO/rL5Igbeuu9
	 2GXZP5oWCACQA==
Date: Mon, 26 Oct 2026 09:04:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add Samsung AMS644VK04
Message-ID: <20261026-petite-ultramarine-barnacle-4ca4db@quoll>
References: <20261023-panel-ams644vk04-v1-0-56096aecd0ff@brar.si>
 <20261023-panel-ams644vk04-v1-1-56096aecd0ff@brar.si>
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
In-Reply-To: <20261023-panel-ams644vk04-v1-1-56096aecd0ff@brar.si>

On Fri, Oct 23, 2026 at 01:51:16PM +0530, Ishu Brar wrote:
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a08087fb6..1eec53b0e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8462,6 +8462,12 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/display/panel/raydium,rm69220.yaml
>  F:	drivers/gpu/drm/panel/panel-raydium-rm69220.c
>  
> +DRM DRIVER FOR SAMSUNG AMS644VK04 PANEL
> +M:	Ishu Brar <patches@brar.si>
> +S:	Maintained
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Drop, unless you are committer there. There is little point in
duplicating subsystem data in individual entries.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

