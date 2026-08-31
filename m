Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26F03128B6;
	Mon, 31 Aug 2026 20:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207272; cv=pass; b=QdOfpKlFXeHHZC1xF53j5JJEQ6Jt9h6Ucd60dwG3h+lppcg0kedoImKo4y6ynCGWwZwD9hD1TmDTcgSX2YlCM1mkftVsz2OG6cOp8lpXAEQvCfbGbOXH4BDsDezn/uAw8vBeh2CRGbrsOD67xDFX3xRKwALZqYg8+Gewxre1oUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207272; c=relaxed/simple;
	bh=fkYdLucBxnpBb5gCIZBVvqm0RrrwjJcyxDFqsET+AEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sp4qRIa6rGzUmpD39gaSYN5dCx9KWLspYMCRC3Z5iopXNquDJ08r6DN2cvkArWzCR2/8OZW+bBkECiwe8X2BVHVYD9sTSWCn4KaR5Cmuhw+N1wQsf7yX9TgSgM5Nk84g8WXp2hFq+/UWKPeBPbqJCz6ygjyO5sFYYuT6Q2SF+lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=K8RurycD; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="K8RurycD"
ARC-Seal: i=1; a=rsa-sha256; t=1788207249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UxFmVSGWfWwX4095cU3RapSW6xFYKOcZ6Ff11y2iOlU91FXsHEbs6Dh27Ayn6qN72tl410dqcFMoNM7mc9RGSQoC1NV3+fSqkNBlaJu6mhN2bcTkssClXZUoZYBDDrXB/yg3oD4Xh2H/3JYliv2ppNaXPa+j9/MJLRqP7EFP0Sk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788207249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=eCM44TQaX5AtvJ6swXT0C0Y1eVxY0peXONRRcHF27UU=; 
	b=m9BgYf5oyXmQyWebryNAkwditKF1O4d8ttKWZMt+MniQYr4VwUPYSmVwzK6FozEuFr5wi5snSTzUMaqBiWn4JQ5+BIpLHoxe77PlyUIoXsPPHzW4uq5kTORCH7VFNBuVqOTHsvZII3gbS9ovrwPtEBu74hHRnYs7zQIKJxxbNt8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788207249;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=eCM44TQaX5AtvJ6swXT0C0Y1eVxY0peXONRRcHF27UU=;
	b=K8RurycD9hAysIDsFWTHo/4Pl2qLEzi9gOnw+XAZjyZ3QA5KumbOijHo7EV0zAr0
	r8wzfs26gWB+8vtq3txIkZAEItegtYHT977q3GBvNtIWR041bxejh9X6jIGUjjydG+G
	IlIDOhl6wKCiEAwlvznM0y7F8OGe/kK9sYQ/Kst0=
Received: by mx.zohomail.com with SMTPS id 1788207246171550.1263319158736;
	Mon, 31 Aug 2026 13:14:06 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Johan Jonker <jbx6244@gmail.com>, Alex Bee <knaerzche@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: rockchip: Rename rk356x HDMI audio card
Date: Mon, 31 Aug 2026 16:07:37 -0400
Message-ID: <1l5cQ5HdTvCBGiUCVh40og@collabora.com>
In-Reply-To: <DL3B1XH7K4WC.1ZXA6ANI8Q1A0@cknow-tech.com>
References:
 <20260831-fix-rockchip-hdmi-audio-names-v1-0-5b155ae05293@collabora.com>
 <20260831-fix-rockchip-hdmi-audio-names-v1-5-5b155ae05293@collabora.com>
 <DL3B1XH7K4WC.1ZXA6ANI8Q1A0@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

On Monday, 31 August 2026 13:29:00 EDT Diederik de Haas wrote:
> On Mon Aug 31, 2026 at 4:20 PM CEST, Detlev Casanova wrote:
> > Rename the card from "HDMI" to "RK356x HDMI" so it identifies the SoC
> > in user-visible ALSA fields and no longer collides with the identical
> > "HDMI" string used by other Rockchip SoCs.
> > 
> > Fixes: 697ee8546e241 ("arm64: dts: rockchip: Add HDMI audio nodes to
> > rk356x") Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> > 
> >  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi index
> > a5832895bd39..98785c812fc4 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
> > @@ -150,7 +150,7 @@ scmi_clk: protocol@14 {
> > 
> >  	hdmi_sound: hdmi-sound {
> >  	
> >  		compatible = "simple-audio-card";
> > 
> > -		simple-audio-card,name = "HDMI";
> > +		simple-audio-card,name = "RK356x HDMI";
> 
> Move the name property to rk3566.dtsi and rk3568.dtsi and use their actual
> SoC name, thus RK3566 and RK3568?

I hesitated on this one but I agree with you, it's better to have more 
granularity. Will update in v2.

Detlev.

> Cheers,
>   Diederik
> 
> >  		simple-audio-card,format = "i2s";
> >  		simple-audio-card,mclk-fs = <256>;
> >  		status = "disabled";




