Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA2C46AECF;
	Wed, 30 Sep 2026 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763453; cv=none; b=TdangK+jJEl7MZxgVM7pzEhEr08QHwJdaPAmNeYxkDkGsH21jeshW+hvp8HXkEIfiAYhSQIfaZAPy4MspdlNkJjyWK9pphUZp6TOpdyQSFKP5GZ8DPw/74WoZksstwWOdyZAlwnAVvbd4l+wStzI0dbyzz4YAit6j8CODrc+ZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763453; c=relaxed/simple;
	bh=eCp7D/3pa/wr9Ijs/jZFJgx+MFbMMgtUHPbgancw04w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDDn95m8vH5xE4SLNWsg16jNxGRmfJcCAcLMO3mVk6zhwGhzvgGwwKW0/klDLNOzEHZgkJiRRkYaOEUGasF+/fwgSrTh0uG5bcrBZ06HVYW5FQhxTw7CwgC4uf513c+QAsd/7rP0rrHXTDDtQfDLK2mJaEcwhevQHQ+klHLodSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFk8MjPA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFk8MjPA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E711F000FF;
	Wed, 30 Sep 2026 10:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763443;
	bh=PTZm9U1cPD9vimLxQimadHgaUdAe55UKDx3bvY7y6mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gFk8MjPA9rDf3CgYl0N/4cCaosETF5OcNcOBcctT2/OKgZ7lFm7+yUbeItvvPeFYt
	 vyvu1kytXTxr+KmgnXaZZ6Z39TASLCzNR7/8PHtubwuZaR+GqyT30UKpCY8rl184Ix
	 gH7FBaGO+4Lw97IJuMAoALqV1Ms+lztrExeylee1zBJsx0mRQvrf9HDkQBpBtIwIFe
	 wKSTCrQdIt/wMYUAV5i1V98MVHVBQIVE1fjESdhHgyOsCUbxiqfO7Eu6nNbMnRFm2J
	 4Af8pv76K3KbjnSvRHbR4yzXvO7nlINWYIfy/p+yo3Vuwr8SdCHg4UzWWLNdhiCqWu
	 Xx/OHPB7zTomg==
Date: Wed, 30 Sep 2026 12:17:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 09/11] dt-bindings: interrupt-controller: add
 Allwinner B288 NMI
Message-ID: <20260930-sparkling-fair-peccary-06d0e3@quoll>
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-10-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927151016.186493-10-pmazzini@gmail.com>

On Sun, Sep 27, 2026 at 04:10:14PM +0100, Pablo Mazzini wrote:
> Same register layout as the sun9i-a80 NMI, like the V3s.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>  .../interrupt-controller/allwinner,sun7i-a20-sc-nmi.yaml         | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

