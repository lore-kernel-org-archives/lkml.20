Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31D42E7165;
	Mon, 12 Oct 2026 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787417; cv=none; b=tncwJx58U+C1QqAIjMFBXpCxfoDJVBoWc4C0QAeOk4e0GsU2C/+APQvz4ZjkYPeGP4VWCtU8LD74fSz/H0LXWrg/L7KGliDtRfIyyHkygLACsebHsgimi3Z3oL5284hjQtVxmR33QY9DBj0w8Wf8MW3jQ7O72OG0T+jKz+E2V1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787417; c=relaxed/simple;
	bh=RFTjjpfxJ8zE2BSqHhwCZ1f9XWj1jH2GdaWi8sGyP7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkU+jkwZ3+EbsICz2MaSPobzTG2koew37fOBUIVvRa/mMwbCafORUvzc2ZBAc4dXNEobkuLJZC/0eqenAtiBVIDBsM51fRyGJD7sk0NRFFSjgzrNrUpUPX+9Pa2cWsDHMVe3OVRR1NhpWc7b90tlDP4E4ejPaEajp2Ew2BhhF/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUegjVzc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUegjVzc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13A21F0089B;
	Mon, 12 Oct 2026 06:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791787416;
	bh=vPTVfQX0lP4O9dxbl1gVroQOSOKrj2GjFIjLYc/2qPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUegjVzcYrvWsI+bjoCIh8UMRt6HTYK0eHjhU9kMK8zCs95X0/uXu2ndLtEDGppvo
	 2C7Eum9cjZSbs46GKbeVyU0UY7WihNSs8NsmbzuCbdme3fSqXB+B7VloZbfcvSxpU9
	 Yi/k9I9dNF7hhmomDqYjNusxkhgNxantpn8LXY+19rzqdJKRiOz26IkV5Bfob48Q4Z
	 T1HJpGQB+JdFAfX/gDh3Vha1AVQuQ7kkBBR1vEiU1mnHhs//j4pdeQ9ahveP+xNTAY
	 SvI91HHSamxOAP8kP6Qnq3SLIf2sFmpzISbdFDk31sV/UksyusXcUuVF8iTIlILr2N
	 6h3xVcrX33tLQ==
Date: Mon, 12 Oct 2026 08:43:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: sunxi: Add Teclast P85T tablet
Message-ID: <20261012-inquisitive-python-of-competence-a2bbf1@quoll>
References: <20261001022415.913959-1-iuncuim@gmail.com>
 <20261001022415.913959-3-iuncuim@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001022415.913959-3-iuncuim@gmail.com>

On Thu, Oct 01, 2026 at 10:24:13AM +0800, Mikhail Kalashnikov wrote:
> Document the compatible for the Teclast P85T tablet, which is based on
> the Allwinner A523 SoC.
> 
> Assisted-by: OpenCode:DeepSeek-V4.1-Flash
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

