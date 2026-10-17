Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0F2394470;
	Sat, 17 Oct 2026 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792256227; cv=none; b=YawlHAQFslmEIY4P9O6C0PsJxhTC52o7K+A3qD31oMpuSGo/3dTnMr0IHsXJ9mzMe0GBj3yLSiFeePrk4L+wIux7ZPt7xMUCKNQ2atuPXfyi7909RR6YEpb5pyzK9NHgVtNOCGCgvDkYqpyCFxa05sfBoM6JyOFeZFyRmDEOym4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792256227; c=relaxed/simple;
	bh=Nsy+VdAFkvBMuMtn7JIUIpTpVR/KUKY4Gvm7f6NuBLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omXEv7cdqB/DXoJLJLkYEWv7L8fys2mE/rSV0bHbqzGpjIDMZ+Lh+yzDsy7jnka4HoXhnSruvCaFU4583t8LmTwc5fNPLzwgPj0zvMlAD5apCqguSHdITFFWmDG6viJ1GFw1kS6I53d/rJPK4JbSWD8FOsgV40Yf/5GDHgFXBF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLGKDKw5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLGKDKw5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C776F1F000C5;
	Sat, 17 Oct 2026 16:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792256226;
	bh=oI/BT2bc96udXYcBbs3VjBp2cTvg1vEogFAl8pbggT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VLGKDKw5c1ZnLaNZGu3opH/GKI87nkNvd0j8wRJy9lrQ9ahMinFC55Tau9WvhK6c2
	 fIBEscoR4reMph/xsvGHh5ovqs6UgTm7f4z97yeZu4Nh+kw+kvBNdY8/gEAXTpINf7
	 RVrkz8lsVhrwt1uxZ2sRuMxFHghKJbDbmyphOHkWwtP09c9rmb6RDk2tJvkERey19l
	 lCoadJI/kLxOmCB9vFxLXpbQnC9qD1l8vhQ92Ux56TjiZw5ztFLPerCxwWifE3hmef
	 9+ykIdLQxyPInmVnLci33iRtjF5MusIxtePKCS3Z0gPqECW19YYPjRqObCp1BCJhmT
	 tDF1elLgJHXCQ==
Date: Sat, 17 Oct 2026 18:57:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: geocausa@gmail.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sergey Lebedev <lsa.uz@pm.me>, German Pablo Lindo <germanpapulindez@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: Add OmniVision OV13858
Message-ID: <20261017-successful-sturgeon-of-experiment-9d8caa@quoll>
References: <20261015-ov13858-x1e-v1-0-acdd918f4fb6@gmail.com>
 <Tb0AcYbDPldfaB1S1ypqTPp6iFwxJVF_1Dh_7FJdavARv0U5KErpuPTQn6FNDYBoK206hZlqZHDsasGYmQx4zg==@protonmail.internalid>
 <20261015-ov13858-x1e-v1-1-acdd918f4fb6@gmail.com>
 <4359bff8-edb2-486a-8d41-38bd315a4430@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4359bff8-edb2-486a-8d41-38bd315a4430@kernel.org>

On Fri, Oct 16, 2026 at 09:49:16PM +0100, Bryan O'Donoghue wrote:
> On 15/10/2026 22:48, George Neacsu via B4 Relay wrote:
> > +  - clocks
> > +  - avdd-supply
> > +  - dovdd-supply
> > +  - dvdd-supply
> 
> The clocks, supplies and resets should all be optional as nothing says Linux
> must control any of those on every system.
> 
> i.e. you might have a co-processor or CPLD which owns the reset, power-rails
> and the clock might not come from the SoC.

That would mean that every other binding/device would have them
optional. What Linux controls or does not, is not really important here
- these are required in the board design.

Best regards,
Krzysztof

