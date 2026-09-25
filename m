Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E63033EB;
	Fri, 25 Sep 2026 02:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302023; cv=none; b=iRP4UEMhp+y+7cpVnuZ5jgmK8ZwUTITG6osBYpVGpjSE0/KWedxX0tEwFJYobGHjBI4gG9Z4JpEKfm//lJTSME8BbeIwiG/tm1jz7cjj14XCMx4ZDX1mSEWuHYPKghYopsfDVNYMkf+iEzYEYlS7W1rYE0f8ECt92TpgyOP4C/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302023; c=relaxed/simple;
	bh=HXKotcEOPQMORgnd6fP7wW9qDAJZccGaHtePf+PxpEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaONGaUs4D7kOX9rXfwSAX7bodSudHEm0gTILuRH67w12+8wEquyf3XnDb1M1kDg8MRklHAjN1yF5lgFXdS0vYXe4FGJzWBR+wm62cQPYlAByeS3ayYtAeRJOv8KaSRiYVPjlj0cTnPIYT0O8Z0a8Lglx8TUxV331MC648+jN5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGoprwx/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGoprwx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4F31F000FF;
	Fri, 25 Sep 2026 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302022;
	bh=itmgVer1pnntM4cqZXszMDwWecgomg7t2KeCE23xoug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CGoprwx/vtepSfIQrcnapGrbZz8FYS2/amIZnv3D+B8Gw3qsPl1MbaFGs9Or14yun
	 ijv3BIr+IhYUu3343vhWKYRBJOzOn7KPnud6tY0AiPIC8IvOVG4giAo8v2wfYCI81H
	 Cgv6gbAykkik/jY/5vG9XyHB6DXgcpFl/jUtql9I4BT0Kv9chFW01QzNmuWMAQrtbP
	 U5tYKT5d/gMFA/hLBLLu28nRtFt7rOxoyUj2+HLO/4LIbGV/dqb/xKH37NyZC8Lp8t
	 b0XlB5tsdUgNFqcUuaNelf/zaRq//3YlP7iE75CxOY6qy29EYlkZIYfWtZ6ImcU+TS
	 lyjLlOzbZUYBw==
Date: Thu, 24 Sep 2026 21:07:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Eugen Hristev <ehristev@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] dt-bindings: arm: mediatek: Fix MT6779 audsys compatible
Message-ID: <179030201789.2925774.7508536046130679968.robh@kernel.org>
References: <20260921232819.3137721-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232819.3137721-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:28:18 -0500, Rob Herring (Arm) wrote:
> The correct name for the MediaTek MT6779 audsys compatible is
> "mediatek,mt6779-audio", not "mediatek,mt6779-audsys". The original .txt
> binding was correct.
> 
> Fixes: e97c618234d9 ("dt-bindings: arm: mediatek: convert audsys and mt2701-afe-pcm to yaml")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,audsys.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

