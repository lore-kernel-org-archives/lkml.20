Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBF537A831;
	Mon, 12 Oct 2026 06:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791786362; cv=none; b=RyfUNUY+A/K7ENRanbe/9eatqWCF/UYivWLDWh9AP450SVgM+Q2hWFsStQ0wPWtNnb/ZNkuiYGCQG0rt+M8NGLLT0kWtIH8wO26X7zHDFbX2aiHzDVRVg1Ps0yhF6vHhrYVX2wL7oBkDKpBLOhOT8h1TPsqWVgG6p9091XssSCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791786362; c=relaxed/simple;
	bh=vzJXMLTThYRji0skbVygomMV3ZGlbrhq+ovchqiueJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LPM65rZZ3tel15ASKtWobvnQDZLjFYqv6rz7GwwuUU3eSqBMWxI7AWDznxHz/PMfv8XZDsNoA2+pfuR1hLOhdHN6F0qoOmXVumzARlEU0lH3hhtiBVlOz368FULoHzulqe3l4Znarn5AG7kuHkR4UoIyVbHzPPdthO36shB38ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOabMNBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOabMNBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21321F0089C;
	Mon, 12 Oct 2026 06:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791786360;
	bh=JNsngLvT0sVL5BoR/HX1TkEukMDWlo7+i/ROtNjFOxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hOabMNBTQ+gb3DdNXm1QyJlzmpg1fXsjwV5zyTr6NTHgCgKfWje54312pkOj81+Wx
	 Gbzl115SGZjIt4EuNt/2FV9pRDlYzhT0p9YPj6nTIScWUFqI3MDwKBkkNeBleCMsMG
	 cZpagH5d8J7LS9ZDMm60dVMlqfY7B9sbFycDlIWIfXx+pMU8AER+25DNZWF1Xqa0mt
	 GOEZViKAOdE6UJ2Hz6PuIVjRyG88G+JRBEG1W2jfMKed210N+XOTVRutKUkgZE8HWn
	 nAUQP38rvxehbhV1rW2PUT+wEV1pE5qLOXRtYrxWZFmKAKtZB+RkmY9vvmiguarRKb
	 rWmoXXht+MWwg==
Date: Mon, 12 Oct 2026 08:25:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the
 PCM1681 supplies
Message-ID: <20261012-aloof-cordial-starling-4accc4@quoll>
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>

On Fri, Oct 09, 2026 at 06:42:50PM +0530, Mohammad Rafi Shaik wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
> digital supply on VDD. On boards where these rails are switchable, the
> codec has to know about them to be able to power the DAC up and down,
> which needs a way to describe the connections in Device Tree.
> 
> Document the VCC1, VCC2 and VDD supply properties.

Property names in the bindings are always lowercase. Please see DTS
coding style.

Best regards,
Krzysztof

