Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECD4052AF;
	Tue, 15 Sep 2026 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499341; cv=none; b=Hc8b7/UtNhKSMhjMnu0RpW4o0NePj9G03WFL0VUNzhoyt6I8mzaaJLHROQyh2GYrBlSjWs5sB8W9LrzKiuyRSzwrN+Zjn0ZsBneq4UvVuMVffh8bNGVWAVGfNvWHqVlOODtliz0ZUZFcIUrElumNDYndqegqkuxmfPlyMokZOm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499341; c=relaxed/simple;
	bh=/4qvgJkuwntJoyGaVA73EExBoVg4DCDyblPdeqPr5Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o3gxl6gbpToxoOtcbMwt3lH2EBsCwoXXk3HKiWslthsSZTIeqvXBG7FVbt/vIgGic+YyvVzSrAhLhy1iAIiG7wh7ZYQ0EF47iyMoqTCSQtyfnwv4Kue7MX+sf9DgcePwAiFq01xA7IgqDmjR/XtVxF7Mn+LqVyhuU/ucOSRBkIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jcXIQ846; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jcXIQ846"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D991F000FF;
	Tue, 15 Sep 2026 19:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789499339;
	bh=VZZahkEZsCL+PKrtdWoz/s9J6Xm9ti56DGFksMB3RZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jcXIQ846u0hD7cbVyrKnMTnF0o+5Smg3LWqn7qScZs0K5FP3b7hrYW5iyPz6/hHy8
	 pIGA5/OO8CSjXbGF5KVCIJo/TqDy0Pb8Gv9n8dMn2nSOnpbJjUqi4kmO3VvuXhCniG
	 Ok6H9QNm/qdFKYX8jVMaZHL6sAk9Afa2AYVzXXjPce3Nf5jn6F/PfWA7IzDGu0IN2x
	 GXYpnHU5l/6R2wZ7Agfw3267vwFTiBvNXutn5JonSgsLEU39ICjePxlgKJSoPSWBur
	 khQzwDROQ+E6PmicA6lByW9Jmh0ehelZPIGPD4iZVhp4PAxe1aX2g4KPN9BOb3/9s6
	 42VYlluwxsC6w==
Date: Tue, 15 Sep 2026 14:08:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jitao shi <jitao.shi@mediatek.com>, Simona Vetter <simona@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the
 compatibles for mt7623-mt8167
Message-ID: <178949933645.3018579.8198387236458743112.robh@kernel.org>
References: <20260908184125.10916-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908184125.10916-1-l.scorcia@gmail.com>


On Tue, 08 Sep 2026 20:41:05 +0200, Luca Leonardo Scorcia wrote:
> The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
> mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
> mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
> them as separate entries. Correct the binding by adding the correct
> fallback.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
> mt7623n-bananapi-bpi-r2.dts:
> 
> i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
>   ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long
> 
>  .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Applied, thanks!

