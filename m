Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787592;
	b=f3EVyy4QNYr3+9iSmZ54mmVtDXN576bmTu5Cq/nRV9KqeDZTvj8yuL0zCe4TMboI6sme
	 Tau1/mFTKzp2tPQD221vL+u1M7jEWbIAiFQRP/jTYcOc6SB+6gOzc6VcQRfnsawKF8m+H
	 lYrXpX/ukpEupafJH2iZ3U2IG9bHr1tyZ0lfgEH/zMygVXNty39NH64yt7RmVkGxF9G1w
	 W/OSr72A8M/m6j6JFB8cX1ndqOatjICxdqxzqo/i9/sTdnJ6JONI7i5+E0PuTw3645AwJ
	 RdAztHI0ck989wRWpfirZvw8hIr/E49Sj/MZbonLjtshYQby+keXlkQeGJwmhdvivGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787592;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BMJAeeHG0qYGoI2GU3+poE+h3EQOoLT+qGKvd7z2UJo=;
	b=d4ZU0LyA7R3DFQNSZiwgTbpYpKrAn8zx08UjOrVgmaJCd9Xq22Sq1ctn7H4Bk1hUYBc7
	 /odUiC9kTzrW8Zd0ruOnfQVCbCM3A3HbNFzRkOzdx7TuxfH2pyQ7St95g6hDJHnERxoNG
	 /K5Hh/DrQeTXNGH5B0MjcWIglhP3jAKI2/RVDI5WWL4yhKrhsqDpE1km+ghBaUs3TNvnl
	 ec+3h/vV8w0kYsIPj018gMgrfI/D4n/gqf3k6GIpyWllLLtookIzfLC4ZN9jwf6DCxkHM
	 qv5GQ2FnQha1THT5iFx0rken9hgU6D05IFXmmFItlTRSG5UpLZbyfQtBV0WLUlAcZHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pvz2YZjf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4009606A32F;
	Wed,  4 Nov 2026 10:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pvz2YZjf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 866D61F00919;
	Wed,  4 Nov 2026 10:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787591;
	bh=BMJAeeHG0qYGoI2GU3+poE+h3EQOoLT+qGKvd7z2UJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pvz2YZjfwVSEC87caXNLTPxgsuZ1LrbWeiT3mvV0+MgYYN9KGE7E3KXcb6eSDiHsS
	 X7H+lCu3PiSjfyInOu8XFDFw72+CuN43tGcqjQLFPE6LHcN4xoKXy+lMRualnn7xjs
	 lpZfa3Tcr8FF++rOSiedk5OtKzCcsbD1PLrYem/3gbIwUKLQXy06fg6PeMiAEeQCLs
	 XAsWi/iBszSHAUlOv/kjtAXLNgzHL7P/tghGLtGcqNoMwCib7dTs45gIY0DrPQP3yL
	 HCNpwaOirw+lPwhlwmQzXCPvqycjcyzxzK2BGTOGMyussZm+f+rYMwwRlsSMb39CJF
	 jHUtmTyjmud5A==
Date: Wed, 4 Nov 2026 11:19:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 02/10] dt-bindings: display: Document Renesas RZ/G3E
 display subsystem
Message-ID: <20261104-lurking-griffin-of-tornado-ca7ac8@quoll>
References: <cover.1792770965.git.tommaso.merciai.xr@bp.renesas.com>
 <71044c23cbd6698d495db101527725bd7607197f.1792770965.git.tommaso.merciai.xr@bp.renesas.com>
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
In-Reply-To: <71044c23cbd6698d495db101527725bd7607197f.1792770965.git.tommaso.merciai.xr@bp.renesas.com>

On Fri, Oct 23, 2026 at 06:47:35PM +0200, Tommaso Merciai wrote:
> The Renesas RZ/G3E (R9A09G047) SoC has two LCD Controllers, LCDC0 and
> LCDC1, each containing a Display Unit (DU). The two DUs are separate
> instances of the same IP, with their own registers, interrupt, clocks,
> reset and VSP, and are therefore described by two device tree nodes.
> 
> The DSI encoder and channel 1 of the LVDS encoder can be fed by either
> DU, the source being selected at runtime. Driving those outputs from
> either DU requires handling both DUs as a single display subsystem.
> 
> Document the renesas,r9a09g047-display-subsystem node that groups the
> two Display Unit instances.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v8->v9:
>  - New patch.
> 
>  .../renesas,r9a09g047-display-subsystem.yaml  | 44 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,r9a09g047-display-subsystem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,r9a09g047-display-subsystem.yaml b/Documentation/devicetree/bindings/display/renesas,r9a09g047-display-subsystem.yaml
> new file mode 100644
> index 000000000000..e23cc53a1fea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,r9a09g047-display-subsystem.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,r9a09g047-display-subsystem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G3E Display Subsystem
> +
> +maintainers:
> +  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> +
> +description:
> +  The Renesas RZ/G3E display subsystem is a virtual device needed to list the

We do not take bindings for virtual devices, because you do not need
them. Instantiate your driver from existing bindings, instead of
creating fake device just for Linux drivers.

> +  Display Unit instances that comprise the graphics subsystem.
> +
> +properties:
> +  compatible:
> +    const: renesas,r9a09g047-display-subsystem
> +
> +  ports:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Properties have only one type and ports is already defined as object for
graph.

Why isn't this a graph?

Best regards,
Krzysztof

