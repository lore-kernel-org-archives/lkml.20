Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD7B2F90C5;
	Sun, 13 Sep 2026 09:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789291102; cv=none; b=cX9N4d0YMf0KIQs3g1qaOezCdrPYDIw0LIpL4lQjLxTaMlKbt3d6YcNgYH1RsLJ3Ym4DAz73LumMnCmHPK0jYT/tvBX+zvAFkzQeRfNKKllE5Mz3ppFIhodRnFk6L9iJ1+Uz2M9/DpB3igUFai5SAvhkjj6dOXJBtJtxYXTl+Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789291102; c=relaxed/simple;
	bh=jZrKOl46CubU2dG7G+C2rkURGGePcfxTH1p4Udehssk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buBWcbsnWi97CDKt/6ennelYqrF+pS1V5t8gRT++JZScAYK1xHZUPgV3wMHOQrq2Kn/3GOmCeXQ16JEWdL/mwzTPZq04gyQZAPwkyVgtlLIVSGJQOvH1FDABMKeY42b8R/9oSpCdCoAN3bmx+0Iq3OQ0K18W2FFt8q/bdu31AIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOrKqTBA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOrKqTBA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8CC1F000FF;
	Sun, 13 Sep 2026 09:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789291100;
	bh=jZrKOl46CubU2dG7G+C2rkURGGePcfxTH1p4Udehssk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOrKqTBAFfkaubRzmHRxVGgIZQyhHwdxGL+8TAMDqk6y/2x/qGMm98jHUcFw3wxbm
	 cGiuEhDJJTR7GHTfdx534hfHsOyiCxL6Xh28jquPnghXWDKgGK4Dx0KZsZvDMC8ft3
	 mKm/1xPZNhbOcrsfBJyO1/W52Ht/7kLmVHFO9bHfcXRJ0L0SR+XL3TnnmPrPWheWxD
	 Sg2udOPNHQ4SwwvGkWMQz+SDDvgLBCyCEYA3Bvkwk3nQz6vObpvS817ol1TSxWTcqp
	 0vUgliK4XJzoT43yeTn5+EuTzT6kqG2hOS3Q15cnrxX2CNDOMNqmZYZVfztXodGe7U
	 uhxyBWcc6OIVw==
Date: Sun, 13 Sep 2026 11:18:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: altera: add Draeger M48 Module
Message-ID: <20260913-perky-resolute-badger-6c5e96@quoll>
References: <20260911150755.2803736-1-petko.manolov@konsulko.com>
 <20260911150755.2803736-3-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911150755.2803736-3-petko.manolov@konsulko.com>

On Fri, Sep 11, 2026 at 06:07:53PM +0300, Petko Manolov wrote:
> Add DT compatible string for Draeger's M48 CPU Module, an i.MX6
> based board.

Sashiko comment is valid.

Best regards,
Krzysztof

