Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316F36AB54;
	Mon, 28 Sep 2026 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618555; cv=none; b=MBc97r2prABBx/0lPj6nIBE6QLFhP0zIuiRKibj4bOSOG0IKtMKyZ2rqdqJir7dXfb/Bkif+R3FLFLtdg35+Dy7S/wWHFa/OBYnaVfIqN+s9g2tZ+4kCtNC8WNvkwrmkFOX0ENlg5fha3vRCs4LMevZzTNScsRjTNiw8RMiNEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618555; c=relaxed/simple;
	bh=QQBmBCw2UXdNo2DPc0MWm5+AwsB1jO40K+tsyPop2uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMBWt1O5PYzufmeNhFUx5qnQyqc913mjYY+mzFiW8rmizByte5fsHF86qJToEwcaHig0XKNEIqnY2gCX0JzR3DNVcxpA0K9SmOHsesUXA6Pxb0M39xgzQmSU6/zekRIQCXRH/k7p+pOovqfqPBUo/HJcxazyzW9qR12ZIQG2DDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsqInaDG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsqInaDG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594301F000FF;
	Mon, 28 Sep 2026 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790618553;
	bh=7doqCw9sONY187zVfnBddDxjdMAo8jRbJl758NpeHj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VsqInaDGfyu3eBlOMauTl9QQj3ap1Uao8vdmqdM0sfnuxrAh4nBunFzLQjkZGkeVM
	 oElhYeF8PBSA9o5dF0Kswr0rKAIZni/kGUQmWFclltIsMC0igQ+OyB74MzPKmrrndI
	 W6vXvVSZgbrtc3LI73nHKDS+gzMs6fVvlaXjw3UI3rC4YqZ9So3aV0JWlH6Wb13JqT
	 CV1GoQdB4X2cWeLaW+Qvryyc0t+ByJbX2hqBJvSUTC1x7zmBkL6AN19MBp8UDKNvWp
	 NUEcH4qUgLITUBbTt1BUUOMOkKAAi5tlvoD6/0BxkHFHQuIse+vJoQnP3Kdw3Trk2p
	 GzDUNLRQVJUlw==
Date: Mon, 28 Sep 2026 13:02:32 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Bo Gan <ganboing@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Yixun Lan <dlan@kernel.org>, Guodong Xu <docular.xu@gmail.com>,
	Radu Rendec <radu@rendec.net>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thomas Gleixner <tglx@kernel.org>, spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <pjw@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: timer: sifive,clint: Remove
 spacemit,k3-clint
Message-ID: <179061855158.116521.9196507271431226216.robh@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-k3-aclint-v3-4-cf4fd4050e14@pigmoral.tech>


On Fri, 18 Sep 2026 00:29:36 +0800, Junhui Liu wrote:
> The SpacemiT K3 implements separate ACLINT MSWI, MTIMER and SSWI
> devices. The existing spacemit,k3-clint compatible incorrectly describes
> the SSWI register space as a legacy CLINT.
> 
> Remove this compatible, as it never matched the actual hardware and
> has no remaining users.
> 
> Fixes: 6cdeb30db4d8 ("dt-bindings: timer: add SpacemiT K3 CLINT")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

