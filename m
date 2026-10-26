Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012904;
	b=n/Gb8QmP/X3XW1z+4a8VDtL1k5muLDhLckQdRHDbyKUBIQUVfCmDsNZjE1Q1sKacFFk5
	 Ji4vWIYHuV297ScN/nho5hmEw75q7s9Btz/qLgc+98ocNeSiK6tjYlxRfeRX/pk5fYKZi
	 s73+FNC1ACBrS9RE6eMPx41y8H/ETg6JptAyCHlKrtTqRW45eiyMR2v6OAZwWBSStWWu6
	 0tnUmJtZvqwqq8z4tI7CJjuNrKAmizoylMi6E8lQr2ru93E7V/AluS74gKHAXjfqLtJGL
	 bYLl77kzTb3AKNvKO5P0tcFNTeYn6pe9WlOjkYBMcBmOASNdCOk0UxjIXOdUC13m3SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012904;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qMyM4JOnCykSHsBqxKPIJF7IjZoArnE2wQJIyiB+Yy4=;
	b=ZQ6FSyrDOZKTlkGK1tOh8ibRSimqPcIDmx2m4OzYzWwhV7dfYfIYtq0aY9tjIQbckIj6
	 xwfC4grhYBl/LrWnrTr3brn/e/suLSdvcdKgvOlrWlJ7HIIVcYDYM7lXsjNkfKxriNam5
	 Fkkxo20F9QLn6bpRhFPgI+uWCguN5RJ+gyl4d7Qa8s0Tls4N8GBB6Eq3NlCAx5AFyWiu1
	 ghvX1mLPZMgCgrcEl2dcSJY7jz1Ie/CPElss9OQ6qzYiMkuDlMTw87yImFO/Bab9NBucY
	 4NBQ2Ga4qVyDCpPFS6vW+S/K/M+u9Qmukt/KcKC1f8ASku+ksh/M9MFtKZeJTNzRRYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qi5acZCK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D04F606A320;
	Mon, 26 Oct 2026 11:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qi5acZCK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C681F01829;
	Mon, 26 Oct 2026 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012903;
	bh=qMyM4JOnCykSHsBqxKPIJF7IjZoArnE2wQJIyiB+Yy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qi5acZCKLrFqpGFFzMN+g2rfUVpBqLT2csQk2wt0y475N+slwLCs2t7qpdxKjnxoU
	 aO0hc+XX/hjpSU9xtb/bDu6GCjQHD++Zw9u4rlyMOqPJ2MA1dyvLulg0gbd5VK2znB
	 qTcLBKeH/FW8n0KQSwsCxI8NWC+ArH+S4WzNlmv0nCDPTmt9POuc4YYuNiQAP/eLNm
	 CjcS3XTEk1dHTlwigEnEJk+xVo20u9TzENKLp5nT83eQQVEvdH7ZCQIWmFVMiGz4jT
	 qRrEK0hqAyL5b/PM/su3HsBeaXmka2d14grsINNzWV2lNesZa2T5R6WOrZmPmc/8z0
	 NRbe8mU46A21g==
Date: Mon, 26 Oct 2026 12:08:20 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Motorola Moto G10
Message-ID: <20261026-strategic-ape-of-expression-c3fd6a@quoll>
References: <cover.1792840208.git.me@michaelmcallister.org>
 <3fd5ee049e08ab8b98e2f9543a0c7edc237caaf8.1792840208.git.me@michaelmcallister.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3fd5ee049e08ab8b98e2f9543a0c7edc237caaf8.1792840208.git.me@michaelmcallister.org>

On Sat, Oct 24, 2026 at 12:10:08PM +0100, Michael McAllister wrote:
> Document the Motorola Moto G10 (capri), a smartphone based on the
> Qualcomm Snapdragon 460 (SM4250).
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

<form letter>
This is an automated instruction, just in case, because many review
tags are being ignored. If you know the process, just skip it entirely
(please do not feel offended by me posting it here - no bad intentions
intended, no patronizing, I just want to avoid wasted efforts). If you
do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here ('b4 trailers -u ...').
However, there's no need to repost patches *only* to add the tags. The
upstream maintainer will do that for tags received on the version they
apply.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/process/submitting-patches.rst#L591
</form letter>

Best regards,
Krzysztof

