Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A42022083;
	Fri, 25 Sep 2026 02:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790302050; cv=none; b=fPw+hmCj0BqN/RkQdRpxgPSI4owCnvi+LcCVyHo4UbwtFqGfYPkhsdlA82lPJrE9rihfKqQ8QjD2yLDeshcd0kKXIIh5dBUPGAH0Na2KJMJ2q+7wcj3trJzA+y2s62FKTnkScuBv59ZNLi+nioLeV5+s+ARsFZeiHhDvM6XqrkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790302050; c=relaxed/simple;
	bh=JGRZhGByTbOJ2V5rmJlkdhLoAyRZhvP3/gDkkiuwhFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7Fi4q9ZXTvXkk1ODHPemv3+jaGAbyATu34wrkkB5+RkX+8/Q5bs9Lfj/ENV3P7bYtafJCYDGcJBnaxu/AzqffiVS7VTRwn8kmW9Hv1XEiJyENVu4EjvuPYXzVwHG0S/yBmbtjjirb+erLvB7JJS2I9pfQHPjT8n8ZeAw2eK+8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZG/P+1A3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZG/P+1A3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1121F000FF;
	Fri, 25 Sep 2026 02:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790302046;
	bh=SuC+Si5CoLwUqZAYShu0+3OnrzJPb7S4zX7HnpY4R4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZG/P+1A3VgL/YdkJt/Hw2oq9jvajyESPCXj9yNhoT5XCoCBNfwYWz+vUOtZTH9mRF
	 qn3kHLI5hDYDcTvDp3fvCL0BVJPok/Ie1vCauJTYoO1uFLWwdYiiuWqTNGZJZF1/X2
	 6iBiQiWnvCu2VrMYU3ImjYcR1L5XyGXjYNB/0V+5ISj6dPSd0wQRgrSE1UuMm2kOKY
	 5lscoSdbbqES02EAmqOVpL5HeFwAltG2nY8VW0+dAN39at2zJC850nvJlW6x7ZZfbH
	 Y7FiC7+FNanOZ0Meiil217FeVhXgN/Slc4QtmsdqZh5zTb3bbasgUa1TAPa7k67++h
	 B5KGQSbiA7oOQ==
Date: Thu, 24 Sep 2026 21:07:24 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	devicetree@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
	Patrick Venture <venture@google.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>, Nancy Yuen <yuenn@google.com>,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH] dt-bindings: soc: nuvoton: Fix NPCM845 GCR compatibles
Message-ID: <179030204429.2927607.14425350535266461647.robh@kernel.org>
References: <20260921232509.3126844-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232509.3126844-1-robh@kernel.org>


On Mon, 21 Sep 2026 18:25:08 -0500, Rob Herring (Arm) wrote:
> The Nuvoton NPCM845 GCR doesn't have any child nodes and therefore isn't
> a simple-mfd device, so drop the compatible for it. This matches the DTS
> files.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/soc/nuvoton/nuvoton,npcm-gcr.yaml | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 

Applied, thanks!

