Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FA34349A6;
	Mon, 12 Oct 2026 07:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789710; cv=none; b=KqW+ku0OZbDEiYWn59YBYvmTqoBHOrfdLVlOPqopv+W/sw2xpOmvHdcMXwOBb7pdtFBem3XRzKwFM5698OqEghsX1kRXYnWqpSXSnBUbWIJSYpcah1eRWBB8wUCkhulDn+jenw6lyvBou96sZOwp90zdV6XqYO+dhx9PmdC1cxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789710; c=relaxed/simple;
	bh=SnlIresySVCBjEnVtvI+t8vDTw4b1I5i2EHThb3Gk/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ve4xthxi6ct5Tx6crpsk5eDakokBGA3AHsEzpIBzhPbbj4L+hK9Qs9P8+ztc5Dmlp7cdN7KaItQ6smrgJxzEksaOtyAIsFz79c6VLItbjIzuA7/JYvO25F94h9flicxQ7rV9VnNyCSRNzjzTibb3Zx+MuzNIXWj5aazDeT3bAmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJvf61YS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJvf61YS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E2981F0089B;
	Mon, 12 Oct 2026 07:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791789709;
	bh=N7cukvBu/Q7ujfnzGvxw39PIswCArvkqP9Kdqk43xLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mJvf61YSDLl6uqu/0OSzbkiCJMhl5WoFPSmJmuqBXr1N/q52zbnlq0qINjoNDZFBs
	 f6+0Er7YbWxDDDHVM0LdmABnuZ9+VOY6kUpamT/VP9WiZAMemee6SJ+fGaCTjRfR0y
	 qlHMyXIB9+r1AaOWCnTAwF8touJgjXLQx6WnQXDzDZuhZlSEuN+pE/PJayZn5df2fO
	 bb21Azulnspoqf3cuwtMgMgXnIcw7s/v4sUlKjPdbnCCCtYfO6gWQrOCzTHjCVOon2
	 6bcmoaRjDsBAkKXa/7LTJb44brrchzAz+oJQBrE6G9JNePQOqgwWkN5ic2zN8AahiW
	 YHukGY5rXWRcQ==
Date: Mon, 12 Oct 2026 09:21:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: add 'qcom,ipq0518'
 compatible for TP-Link Archer AX55 v1
Message-ID: <20261012-mature-mastodon-of-genius-ebb74a@quoll>
References: <20261007-tplink-ax55-v1-ipq0518-v1-0-0ef058756596@gmail.com>
 <20261007-tplink-ax55-v1-ipq0518-v1-1-0ef058756596@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261007-tplink-ax55-v1-ipq0518-v1-1-0ef058756596@gmail.com>

On Wed, Oct 07, 2026 at 06:59:20PM +0200, Gabor Juhos wrote:
> The TP-Link Archer AX55 v1 board is based on the IPQ0518 SoC, so add a
> new 'qcom,ipq0518' compatible string for that.
> 
> Since the SoC is a trimmed down version of IPQ5018, keep the 'qcom,ipq5018'
> compatible string as a fallback.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I sent previous message stripping lists by mistake, so summarizing
everything here and reply:
1. IPQ0518 is already documented in include/dt-bindings/arm/qcom,ids.h
2. And indeed I found such variant of IPQ5018 in HW catalog, so that's a
real thing.

I still do not see why do you need to add this fallback. Neither commit
msgs nor cover letter explain WHY you need to change it.

Existing IPQ5018 compatible accurately describes the die for the kernel
and bootloader.

Best regards,
Krzysztof

