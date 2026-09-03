Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC003BB67F;
	Thu,  3 Sep 2026 11:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788435070; cv=none; b=sNl2928hnNLX2aJ+cO0prcP9eXd6p45gnZMrwOTIRi2rs5qTw2I1WieLWdMYnBBAtXBjhRlEymP2s9w67BAi+bj5vcgAZSpir7D9oSSdpyMpMmj0CghjZjVh198B3cbiZVu86o+Fyu0shUFDbyxGveIiH3n9xy/2NZO7m4NGH1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788435070; c=relaxed/simple;
	bh=r2iamtF1uiJHnB6Pmr4e64EORtdqZMF7E5NxCKv8RLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ledDxvzAsmwhIMoUVRhjzIJnx5uoyhNmkhamxni4j42eDJQVhxpjXWw/81wL/eJY0l0Uh+8+/SkLymVj607pXxC6/8KkfM+oSwSUmKrg1fm+bTy5nr2iJDpPLRBMnG9DwxDcLgMX2Qtke7tiLCTRL9vMEhcqd09gHV/2Xq4syEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGfFdXu8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGfFdXu8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49B71F00A3A;
	Thu,  3 Sep 2026 11:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788435068;
	bh=xokM3LWdIKDVlV4YiGti/VLg1PM6+eGOqFgW2ihersg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mGfFdXu8YEtbcxuW8qa1R6XUb6kHyVuQnNLuxDYWc6Rc8Xm+Lq6reVWT4Tu94YPcB
	 yH2r2eL25dEvFyc+lc1paK2cWEW6nV44v7opzBV6HFHWiRKTCwUgKom0D0L1LjfZKb
	 wqaR68cNxZPdOtRrvCyr19nHymN6YArjmr3f4VnQkaAEAtK3JA2NZBmPHiRJwF+7+7
	 5QdX7+D8/lGl+wn9wZ06drss58ur6XsJnMBj357638gDLr1HtThhdudM+IjDRvszaF
	 EFdKa9fKXku3wZiLzWiyCfOgGllMqGhH0YrKVy2YL93dSAteFdqqN7crQG+OBQnXD5
	 UEZhjM1fMC1LA==
Date: Thu, 3 Sep 2026 13:31:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: qcom,rpmh: Add supply names
 for PM6350
Message-ID: <20260903-puzzling-elite-whale-e10dee@quoll>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-1-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-1-68288ab70aee@fairphone.com>

On Tue, Sep 01, 2026 at 10:58:56AM +0200, Luca Weiss wrote:
> The supply names for the PM6350 regulators were skipped during initial
> bringup. Document them now.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/regulator/qcom,rpmh-regulator.yaml          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

