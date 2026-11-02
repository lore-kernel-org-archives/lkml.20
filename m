Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647514;
	b=JZjL61wBPHd0WNIA0ZGCEZlpZiB641ZT6emfkRK8WAplW/mgR2lFs6YWyf1GZ8BAaVSk
	 LI1vsLgR2LRozpeNglxdjfmyCsLkwVTDEmoXCTMFmT6Uk4DNOIrYciF0hXUV9XblyBsG+
	 f52WRzLtwS74t3vugftOOHiWtCD6XRTdLDPqbA5rLstUVCrKyz2ZcqX43T9ZyDoXlN6ZH
	 gH22wL344RhsOJ6dchGmRtKCP8CtemVW+CeVF++us5/T1Gw6nFgJEtADszoBykv1sXRAq
	 DsWZbm4G4t7oTlr3Sdr5YAlIuOxPgs1CufidtFIlrPP3Rpce0rq0LTCxrtBQ6cVlS7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647514;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y+O4NbwhikUuqZvn6Lyg4a5m2iarERXwFw6YJzAshek=;
	b=cpCxwyV/espf3nEe/iiMVzV2eqkHCMlQzBmeGMLW/MdNVCHO52WSFewulDrZ0GFCxkb3
	 2kKzSuP9KAk6Prbt0gpWt2Wv/I+isymngT5wy8496sVEi2TnPwO4k4xoImPnbQrfBIlm5
	 /LidGnL9UudVOd2YnzhjhUMYZ4DjpfZBEhnK3n1xd6LXl6nm/VTV1F3QoxQC9bOIX6jfV
	 MOUJggcZkuMLxvp9cP+/JWivhhXz/lj41VbMtfqPsqloQdEbxx9QM/FXOTRV3jBKJbxCK
	 r4mzDPM32bQ5qpIOvvBuZE7krFuWqa2WSIqiCdhueeZOXH/IFfATzRZeQMyBirxCgGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrwRAdZF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDCFF606A324;
	Mon,  2 Nov 2026 19:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrwRAdZF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5835C1F00A16;
	Mon,  2 Nov 2026 19:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647513;
	bh=y+O4NbwhikUuqZvn6Lyg4a5m2iarERXwFw6YJzAshek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrwRAdZF9Tm9XFSUfEHZrpppmouwao6JJH4naRu0lqGrA9Qqat4nVvpOjaO4GQZrd
	 1Xsu9Ww8oQmIrRJ+gQozla3v3M6+hTUDCqrIaXFow0MVdfZMHW7nDxoN+MikfGiem8
	 G9unw1o1aEWxjHzJtW4YV/IvKT+fJ1uVWYBpNBRrDz93gnm3VzI9wRJkt1h62C/655
	 /tSp3yuf2L6N532mSW0PZN/SC9AZFFWdsF8fS+KA/a2+Lyl7B/hMXgZroxTfk4O7Vf
	 vr25R3CNeIxS0uJC+9KIV/ETlTpLkhcWzzF3u50GJONMxnE4YZDkO7GaMgVYGE2iuz
	 xqxOSSOgg9EFA==
Date: Mon, 2 Nov 2026 13:25:11 -0600
From: Rob Herring <robh@kernel.org>
To: adrian.ho.yin.ng@altera.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/2] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20261102192511.GA896091-robh@kernel.org>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <cover.1789114385.git.adrian.ho.yin.ng@altera.com>
 <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0fbda23eb4a22a56e455b5e89125813af60ab0cc.1789114385.git.adrian.ho.yin.ng@altera.com>

On Fri, Sep 11, 2026 at 05:04:52PM +0800, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
> USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
> PHYs, and optional IOMMU support.
> 
> Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
> suspend). Reset names use core/ecc. On this SoC ref and suspend are the
> same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

Applied for 7.4 as the .dts user is already applied and Greg seems a bit 
behind.

Rob
