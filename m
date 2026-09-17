Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774004848BF;
	Thu, 17 Sep 2026 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670860; cv=none; b=jsl26m71+XETKULP9mtTV+hBH8O84kQxK+WUhhNrJFwqGHi9NBqec8HlHFkQtytrRPXU7YF43Vl4wHLItVkGxoA3HmO871cvNAVPpGpplKJ1iprZwh1WPCObdVQwmhBsKley9bHkLAZVxG36X0yUYSq6KSfdBfSB+3KheTlRqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670860; c=relaxed/simple;
	bh=0Y9vlqxqHvA3tvzzZVhRf871is763nDrRCGu4AumvRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFy1ssNlKeE2R5rD5WZCuVG0eqYp0Lhs8ri9GboLf9aG995u6p+38mFlbHuCAkVq1KmU8mef3cSX+e1pgmujP7+UQCc/KctV8Be4gYMJkVe3/7gOXc9oz8JRBFfBppYFMUOmf+mfIdnV/Dp3Umucaj9giCl3AW6BdxwLX7fz2fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5yvLhR7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5yvLhR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AEE1F000FF;
	Thu, 17 Sep 2026 18:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670859;
	bh=RB+lkJpEGs/Tp7yJ8tDun2hxafZcPxZcGRyzDGf/Wmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U5yvLhR7kg3AUOGxWevVobUxFG5cDrRoDZl3Uf29aZVUbCqfsQeQccEGxNHVyjLlb
	 jByeQD+TBohUtSnVdtWFs3wmHc0yWebo6rAzygp7op11HA9K/nA0kfUTEc1LzYW6p5
	 Y5OPeTJo6eXJgWR+NNcJR0pOlZXy4JHAEwH++z4NzmRLqUMPOeImRb6UheiNcxxKOz
	 VGealALA/WvaAKvHrrXMxdJ2I/kEXd392Uu7EbUEplgLW926Mz+5VrG1Dj20vvA3rs
	 NiHhoUdiKVRDZYkT3rOl7OPKueo6PjGoEjO0P5g6bTv6iICpnEJUwxvat/xsW1XL5c
	 rrIildFOO0SiQ==
Date: Thu, 17 Sep 2026 13:47:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: snps,dwc3: Correctly restrict
 number of resets
Message-ID: <178967085576.3095640.4739017152985753392.robh@kernel.org>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 12 Aug 2026 15:44:56 +0200, Krzysztof Kozlowski wrote:
> Add missing upper bound of number of resets for DWC3 node, because
> "minItems" alone does not imply one and any number of resets would be
> allowed.  Ideally this would be restricted to "maxItems: 1" (as in a few
> other bindings referencing snps,dwc3.yaml) but
> arch/arm64/boot/dts/hisilicon/hi3660.dtsi defines node with four resets
> and a generic compatible, thus make this one an upper limit.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

