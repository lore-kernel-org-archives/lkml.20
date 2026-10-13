Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27103E639D;
	Tue, 13 Oct 2026 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884213; cv=none; b=WQizlwZN4itkw9TFAyWPPRloNZOl9QjLx3QnD2Y5/gBjFTUl8oALImgWDxH56p772ShO3rLIFXb9w1qEV9mwpwLOgEjYy8WyxN3xAHOpKi3kkyHLM/+HTk6ZqcC4kFih0S30SttXTYsxclkAiFpoTMKQ6XP7sNYNKC2OpxD0UWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884213; c=relaxed/simple;
	bh=tNCwhbKQX3GoNtYVyhZBJh2dlGyNtTTcqphKYqvtCK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8MYffJ0TYlgGguoqj8w3jHsf8o4lqIaecSb2aKV0UZTiEve3nTlwHZwGqDqCHqxVPLakK5L+UXOlA9acvobSR7EVAA8qgIOIxbJtLjsCXGbKFVUeaFpvbLPYch8f7z9fofJgo4FNULk+VcxLJLIf+gzH6eWifpNWTqv/Nkl128=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihHQIh0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihHQIh0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D991F00898;
	Tue, 13 Oct 2026 09:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791884212;
	bh=I13S9NHzPBYqCmO9iZd06Lej7+82C/tFnkGCX+GzMsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ihHQIh0uvs/YMXqAqc47VvtzXg9IoEtUc0pLV0lEJUJCZZFj44IxUyqA2mDEH0+em
	 3ii/2NVVohA3q4McFk+Mu+K5rMhO9NEtNsR0BX8rZ+1RvCaYqXSAPklo68HNgQp/2d
	 e3xXJ/RCnjzOX0bqJ6bRPgUTRS4OztMfXGn1uvsFUmWNJFyt6O2S6PNVfEwJ5x/WxH
	 SMeKHeZP3vyLCpjvvREvQxpqSELMM5GK5aJ/2KgzohMDpXjZmAHfvL0p+Opkpg5mQR
	 SPV1UR3LPykn0YVtsSOg3vESrt8A9COHQvJknkIMcQhAWYD7KaI/bE7+KYEhZrVx1M
	 pB+7n8P+SUoZQ==
Date: Tue, 13 Oct 2026 11:36:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
Subject: Re: [PATCH 2/3] dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
Message-ID: <20261013-naughty-orange-cheetah-db85ba@quoll>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-2-7188e7ea7a15@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-book2go-v1-2-7188e7ea7a15@fairphone.com>

On Mon, Oct 12, 2026 at 08:11:04PM +0200, Luca Weiss wrote:
> From: Luca Weiss <luca@lucaweiss.eu>
> 
> The Samsung Galaxy Book2 Go is a laptop with a Snapdragon 7c+ Gen 3 SoC
> (SC7280).
> 
> It appears to exist in three variants:
> 
>   NP340XNAA-EXP:
>     4GB RAM + 128GB UFS, WiFi-only (NP340XNA-KA1UK)
> 
>   NP345XNAA-EXP:
>     4GB RAM + 128GB UFS, 5G (NP345XNA-KA1UK)
>     8GB RAM + 256GB UFS, 5G (NP345XNA-KA2UK)
> 
> The internal code name is Hermes2-14.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862..5048e878b7ca 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -887,6 +887,11 @@ properties:
>            - const: google,zombie-sku514
>            - const: qcom,sc7280

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

