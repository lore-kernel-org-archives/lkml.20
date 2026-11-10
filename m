Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312044;
	b=fo64E26BNTKj35tbXmb6+NDS2vFqRR+oONdY63nMSUWi7nmTK1vfD9/HhxKhTcleGk12
	 qaOyq/tWlff3KFStrDeQwYX3KB+LpTf6oGAIxpn8rvPPmELIOOcY+cOI/702UhNstvuL4
	 U2n9GS/R79liaaaPKxrOYgEKugfNr7YF5JzbKwIePoRxRpM+OwEp8jT1rz8KHbn2NZSpN
	 n4JCRl+XnSyjkAMbEvZdRC/pOvS7KWYOsnds4tgPErgeVEq9HZ3S7VSwE3UoNArgZUVWR
	 p5UxzIfLcNMiIdNiXLNLVAGix3J1AIPCyvkL9lw/YlZDTq5F5Y459/g7u64GJDkVg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312044;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zUUByBFtkt/Jci7QtZBEH6HXtzxT/EGP+IqF1P78chE=;
	b=flQtdII/nyY66cQeWiWfZrMOLwKuxkpPvopG67Vh6QI1ZiVgRtsfF7ftYbgrG+mcndcl
	 Gv1VWN3yu4LrIRv4ME8ohv4QSmY18N9wRqPlhfO0jFeEf/wcTcl0UkoqhGGUtoepXhbj9
	 I12Lt7gXH2neWZOVMwusGCzwDvqhYQh8k0RrHHOaT+btDV8VMdUvDEHdCd6P6CuZNGHsh
	 NxLAuM6yB/8hmQQZ1rC1dpsnssEHtjEmD0G8vbeFl2QfJMtztHwihicHd6gbEvvInFzSg
	 vS++6b6qs2S++aI/op7IlOl3ARam974DVuCjEPCTyMlGX2QDXTI1tZNddSw1N8x9G4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X16lf80J;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052F606A325;
	Tue, 10 Nov 2026 12:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X16lf80J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8291F0089F;
	Tue, 10 Nov 2026 12:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794312044;
	bh=zUUByBFtkt/Jci7QtZBEH6HXtzxT/EGP+IqF1P78chE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X16lf80J1m+1AsWIYir0Vl7RvVpSQ+oJ9AkM5SwanRE5YGB74h2/wXyTcc2m0NmKM
	 MHCuUmySy6FJ+PVUuW/ighENEGvCQdMsmEccv8w7rQdg32dULc6QIFz45WXEMCcqAS
	 /mWu817g0VKcvN+7IM9oOIcdKy8x1Ls+z2PHPZni1XN5X7UkZQmA5CQ5DctuqcpcNY
	 +Cm/AmiB/FEwoRA8Bl69mYRTCAwlEexYkMGb6fGT3MLtQo6l++9hQVSKAObQ5TMFh1
	 Km2SYdSM8KPsWzCDVOMjNUHcGTKV/mydxrOAO63HhiUGfFtZGsXYuiZHrWKxiATZ70
	 yNVJ2y322F+ZQ==
Date: Tue, 10 Nov 2026 13:00:39 +0100
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
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: ilitek,ili9488: make
 the port optional
Message-ID: <20261110-comical-adder-from-saturn-8c8fbb@quoll>
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
 <20261109160706.2272332-2-romain.tisserand@gmail.com>
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
In-Reply-To: <20261109160706.2272332-2-romain.tisserand@gmail.com>

On Mon, Nov 09, 2026 at 05:07:04PM +0100, Romain TISSERAND wrote:
> The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
> driver does not use a graph port. A port is only needed when the host
> links its panel through the graph; other DSI hosts, such as the Allwinner
> sun6i-a31-mipi-dsi one, link the child node and have no output port to
> point at. The PinePhone panel is described that way on the same host,
> without a port.
> 
> Keep the port allowed (panel-common) but no longer required, as for other
> DSI panels such as ilitek,ili9881c.

ilitek,ili7807s and a few others have the same and it is confusing. The
port should be required when this is connected over SPI or I2C, but not
for MIPI DSI. I think that for MIPI DSI port is meaningless so actually
incorrect.

Why was it added in the first place?

> 
> Reviewed-by: Igor Reznichenko <igor@reznichenko.net>
> Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9488.yaml        | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

