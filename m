Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787388;
	b=a9AICkkBmq/OUhp7nxiX/Q1mtV/NLm6rND2oCrLy0D8sxQ5RIi7edJ3dE/n4p0ssbXVn
	 ZsHaUfM2UHC2v5IVD6OWu25XYMu7sH0rsgqt73Sx9vlHhvbVy+Df5v3ZpvR/xs848x35X
	 xC782o44lzM7Shn6a/j87XAHxPO63JuL4fN6KPAW+bIa7osK2f9koBKAc5sV35JZSZ1Fl
	 2ZEiF3RuFUdV6Kjxv0tfJ3++hUu4CHGUSX7m8FMtHZdQNwF1F1dJ3aYMdbfSdgC3BYgxZ
	 fubYzg8yqZ4dEHXp49JzfS0VrKdiTwuaSaC2+i/WYuB3t0MoWGk9+H4vaXogGhZxYlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787388;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=a0MrLLzClOoKowkmFBv+8NUjLdhsm8HzUFCMBywp0oA=;
	b=tfCB1Fwlj2WZa9d6Rp/lCzlYgOGbGCMW7R2z+268UuJhEL8OgNOviKDDUkca1KH0NTYI
	 7SAeZE/kGnDE7YpGrD0A8S4NdxW1WjBrMHDL2jt0Jp6LERPzFY3OR3ZsXB3EAV5QHUjjR
	 q97/cHxy8nymsJyiGZCckyy2NxXWfiEIwpcR+KPmhg6QdGLo5J4JMl3voHKEWATSpRjmd
	 qke4xaOUxISit5isdXFp4bWBGltT6vVfypmKMad0rYorUyyawJoi5BpsJAY1u8K0pab+Z
	 KEU6oGHO2Nya/bfBxoRGMCw1PHOx2pLQV4mvVIATdclAK5s6UJBONpLs7dHv/w+nfIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2T3cugC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36618606A31B;
	Wed,  4 Nov 2026 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b2T3cugC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D424D1F000C1;
	Wed,  4 Nov 2026 10:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787387;
	bh=a0MrLLzClOoKowkmFBv+8NUjLdhsm8HzUFCMBywp0oA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b2T3cugCiBzxVY7kwb4HDdXHNyBglbJhBTSLB40DxmLKxX0jqsgMXaR2sbAkh7x3K
	 i0KpiYYIkhElBP7Qa1zV5g+MtbExSyrKPOF4KupWwjPeqgS1kcbwkntSOEmytQc1ks
	 t7HhQf6ybJJVeh9m4kr3nNDFxHwj4JxdM/fB7ocns20AZHFXX7mWDXxj+hNDnX7Ykf
	 vAwZV+0FDhA0Au3vuklL77RByHJQehhan/CGKagapX04nmkJf5SiERFD7NaEseZ/0c
	 T3pLxLb6OOUsBUnbMHwGzizZ3EtMB0jdXs4c2eyRhvIfWCWRPvxIqtNMx0a7KX/qCc
	 0b58DXrKHXl/g==
Date: Wed, 4 Nov 2026 11:16:24 +0100
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
Subject: Re: [PATCH v9 01/10] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <20261104-inventive-mantis-of-wholeness-ec5af2@quoll>
References: <cover.1792770965.git.tommaso.merciai.xr@bp.renesas.com>
 <0b55aa2974382cf6f3a278f4c5f64f0af403bb95.1792770965.git.tommaso.merciai.xr@bp.renesas.com>
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
In-Reply-To: <0b55aa2974382cf6f3a278f4c5f64f0af403bb95.1792770965.git.tommaso.merciai.xr@bp.renesas.com>

On Fri, Oct 23, 2026 at 06:47:34PM +0200, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add new SoC-specific compatible string 'renesas,r9a09g047-du'.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

