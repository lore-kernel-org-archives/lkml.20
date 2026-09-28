Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2784A4582F3;
	Mon, 28 Sep 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790593115; cv=none; b=abTeuQD86s0Xb1WxZ+Sl8q4Mux5izmIXnChABpPlycbBBh5B3aFxrbWY8HJw+/4d+U9vDi7tqDZ39ai1YXcBs+TQNui4FYpeqcnfl8rZt2AXIROBqoNbKHt6UdbDQYSGwvtX+5WQBW2nNoPt6YkIvT7+ZXTgnzECLfqthYTgiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790593115; c=relaxed/simple;
	bh=c3bOooEGMlvg9xPHTnVJky5x+llKM22NeXmtLbOOyO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdUR38Btf0gqUaN1nNICVmuCSohIRF3A+LTNzPIOhOxmUn69g9PWxFemrHXqg8IFoezzO0VYXN8PwZe2JCMB4zwStz8k0GOWvgxOBVHDCekowtd1f590QaNA0sKd84/WiIt0aUxMgJf2/2UyzqrHX4SISGBboeHB8tpXcIj60DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ns+HJAuX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ns+HJAuX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95101F0089C;
	Mon, 28 Sep 2026 10:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790593113;
	bh=X6BqH/yZqqamfLVukmDf/rY/Qu5OyQBwyrHbGMFypLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ns+HJAuX8MZW2S8YIT3Le/zJN+nCV8ge55j9YedS41I99A+PRZUK6XvaZlLSyjC+8
	 JU8YRnfm082rBhoRP7YHW6ngTNMi8IARYyvLtBDsj6O5HnKesAnfg+huj010/ndQDZ
	 ylgLp/WSGZCTmgwonyDVpaKaKL4PvgoEl8+0oIYkL5FiL6HOIfxXIHpi6Oqb+k6OAR
	 lH+jQdrjtPwNbHEJbGirAXXNZGPuYe1mIK+qKmZVCALDw0cO5kiOVxVifuUwQwEzMm
	 Nt5J1/ZnwytNKmrt7kUiCIgoB04VZ0q1VpzbhGOlfcW90j6ByErEShHlCxSJc2Lqlw
	 5Q8c2JE6hJGYA==
Date: Mon, 28 Sep 2026 12:58:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v10 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Message-ID: <20260928-efficient-secret-manatee-2fcca6@quoll>
References: <20260924-b4-s4-vdec-upstream-v10-0-1289303a58a4@amlogic.com>
 <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-b4-s4-vdec-upstream-v10-3-1289303a58a4@amlogic.com>

On Thu, Sep 24, 2026 at 03:55:10PM +0800, Zhentao Guo wrote:
> Add bindings for Amlogic hardware decoder accelerator.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> new file mode 100644
> index 000000000000..751043c3d9cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
> @@ -0,0 +1,114 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2025 Amlogic, Inc. All rights reserved
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/amlogic,s4-vdec.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Video Decode Accelerator
> +
> +maintainers:
> +  - Zhentao Guo <zhentao.guo@amlogic.com>
> +
> +description:
> +  The Video Decoder Accelerator present on Amlogic SOCs.
> +  It supports stateless h264 decoding.
> +
> +properties:
> +  compatible:
> +    const: amlogic,s4-vdec
> +
> +  reg:
> +    minItems: 2

What is happening here? Previous version was different.

Best regards,
Krzysztof

