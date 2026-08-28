Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A957282F13;
	Fri, 28 Aug 2026 07:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787902055; cv=none; b=OysHUxaz0cBk8d0I0UUMhKQgUXWvXOR6pFudJfNwnkwFcBllKyD0726WNpRmAjMcZKJlWESM/yN4iZf1oybfJhR5sRIewYK3c7CieuDt70dLjKCT0cKUchXGgmFVBxXIjG/FTnhGvCiDHResAmlzCP1Dlze7q2tt5VhF0/brDY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787902055; c=relaxed/simple;
	bh=+Blv6x1Dj7+uIINgojVzeN/m+MwN/nz/k6eKUjShcg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4FR46PJ0HaqQ61Jr+kKIvgJP4G4dKhEULe3tCxtZYz0CoHNfm5QIHsew4OVcyN82sB8Wa87vuPkgfPpFKx1URMJr72nbqmfU3li+vDC9cSzPHxxAnoXA3PEbC7YxHImOQtpsxZ3+ysLV0Tvws1xVa9RZ1L1Du5JaSmPN/lgMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQD0nOrD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQD0nOrD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DD51F000E9;
	Fri, 28 Aug 2026 07:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787902054;
	bh=6j6ZsKL94I8Ps6lT4mQY48Y0LAIoexS/cfshDQ2M7/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bQD0nOrDutoR4eEsIx/wysPLcZaMsviJu28zgjczLiGRCPmFw4qblAQD8J6fc5xZc
	 Ce5rkz2LG2m5nCNg/H2SamVlRagCJ85XjXxParO3oEWcNT3ya+4/tNNLsw9cctkgkE
	 zwiiEIyKZYuM1gY3YmNFrQlJM+W2lfwJh+rFNcybTmy3wSAXgWnEOunLTrgvSsgw66
	 a6Vl/41dYMcjDyzVubuTkurs6e0y+d9LcbHPyE7ox+/uPCIW6S8MWZeXccqF4cB8ud
	 Ifab9Uw2By6z6now30DbQaWHqx8yGhUuly1SXxQXlpM8XQ3mAeCk+NEcCDTDfCvxaK
	 ZG5x30qVLSQoQ==
Date: Fri, 28 Aug 2026 09:27:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: regulator: Convert TPS65023 to DT schema
Message-ID: <20260828-sturdy-unbreakable-ibis-aa68d7@quoll>
References: <20260815082913.2144978-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260815082913.2144978-1-egbostina@gmail.com>

On Sat, Aug 15, 2026 at 08:29:13AM +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TPS65023 family of PMICs bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../bindings/regulator/ti,tps65023.yaml       | 90 +++++++++++++++++++
>  .../bindings/regulator/tps65023.txt           | 60 -------------
>  2 files changed, 90 insertions(+), 60 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/ti,tps65023.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/tps65023.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

