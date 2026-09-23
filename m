Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5DB572679
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177448; cv=none; b=CGkfL+tMcgPvEEzvxZ6l/xII2P+cSanl0PvMFYV6RvPcDJrl0Uij/lwDTJwxYWBYBmnT2K8L7h+zQdnk8+2PnUbz4Fddt9L9JQ75ktZIgVRa/upeZPuOCB1+I191V2u6OCcS3jKTfgGINfC0Iu7nYHRaq/dJ9h6JA30haw42ZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177448; c=relaxed/simple;
	bh=1vmm0wkc2HkHONRH8pVcOgqdwW78+bTinZ2FzAKmk3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4DDr2FYNn+TfaCkfZq4mJxyHJ5rd2FHSNFT251AcWUzAEGWWxnDmcI9R0CokYSDCpb2xdcRLt/usZN+aDEAEUc4Dvpi93XBjND761F/6YJWZYHkc6xeeO7YFXw3dtnAAt96emS4ZD+kPWcQpDS+DofPxKTXcQGWxUrMkeClY7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U+rRjNcm; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U+rRjNcm"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so640756a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790177437; x=1790782237; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=U+rRjNcm7ugzc5Soz10jkunYElefyJ/mmDKlhLWKxx6z11zYyaHFhhSoYKfXPKWBFw
         27xgR+M2sA6H2ZWxkjODi5uha64syM1YHfvjc6sczDTfgx/+9+bAmL/LLTQGX2im1r24
         vnbBTToGn5eTvwUOy0ufX/Y9l8EbodyBTpgTAYpNBr8tNrl80i8S6OmUfpvYK9QXlPUZ
         K40XB5d98svdxNzLOY1cjwqKXKjYZaYzBsmQx00jERdfe9HVzCgLQ6c4ydWL4cFWEZT2
         3a3N22hOtj6qhEGw0unwpMeGCo2sSv68PYITFdMGaA174wdpTQhDtvyvnggx+37Z/bAW
         7AsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790177437; x=1790782237;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W4AqH3BG39Ccw9rat1s2LDjmKzSlLDWMcVufSeoX/Lk=;
        b=u0PzChrBRgJD7tOKwUw17DwTN/2qUfFY5dfJxea6iPfHGLo/ncOT4bY9t1SxyAHmCs
         FgIhnZ65S4h8jR2PoPAhq9qahr422SiZH7X/yK6/O7hoA3zD0KaVrdyVdj4f9j1Q3LIU
         HWb/EQWSXvx6gTshmc2W3zUsHoNDuvBSmpb3zsj5DRdYYby/r+9G6QnoMGhd5/6Et97q
         U1MKb9BiZTYbwFA9gtKnOfaYiX6WjwKet6Mw1halBHzVU9XuNZKgitdWdsjyyMsLw2RU
         jK7vBJ3OSW1LmSV0YN/ZG6Y+/JCgVtL+T1cSjfXebn8QRcPO8p/sGUW56MRT2be9S/dW
         LnfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5uv1YmvmEETMan8KT61N+lm21L3WFCqVt28wtPUF1M96BIhD+8pxIyNC8KEFJAaKiDRW7qHUCjZEw6Cw=@vger.kernel.org
X-Gm-Message-State: AFuF++ncA9zWddcSFM4471BlkB5MRYUQ9gqGRSEhdNfmshWkKVbY/QD1
	sbJxPN+j9ssyqecYEKW9QSUM8m4o5Fj2HAUU+dfPZVGe4bh2JxP7+zIqNILvU5keAjw=
X-Gm-Gg: AYBFou1SR/1AeWzm3pCmSAh+M+n/bwOoix0snH9GVKyxxX49zY1OZXnxT/VbevulfCw
	Bxe4VcnkrzY8UxA9pNd7YA/3yu9s5fwn5CqEtglt4OEqiprp3FZGEmJWUk91DY6O9DpB3HXQTvA
	tMQluHnZ105VeCpwGB7FGaQUJ90rLBfo77pwIrWgHqRwh9SBGyupXvq2xgbw/Mi2MVPrIg6T5dS
	q74mBSuo8waCoP0r/mSxKMPE5W172On7cbn2ogj//T55CvP+ZAQ0fjLFEUtn4xc7HjuVuyKX+2J
	S/FDvKaPeznMAenuOoGk4TrmFI3+YImLioNDph3AxVyIw/gKlb7XIYdj3MT5mS5EAmqqF94sJI8
	/orDojMWSngQw8g6Qioxf4d0eq9JsIXNg2vjxdojbvrgBTJqQZUtyQftzljmtFT2SVBnFGZAZUY
	Lvqd/EuxtrQbzTJ249k1rB6Xu3rbZCJl0xDy0qpYaGGs4hyFoJSqsA+pGbCLZ+FkJkz5QySDY=
X-Received: by 2002:a17:90b:4d0e:b0:39e:6a7e:ee19 with SMTP id 98e67ed59e1d1-3a07e6540e2mr2620920a91.37.1790177436748;
        Wed, 23 Sep 2026 08:30:36 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddf1cf3sm5652074a91.9.2026.09.23.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:30:35 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:30:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: remoteproc: Fix MT8188 SCP regs
Message-ID: <arPwmV6I6e2hCqo6@p14s>
References: <20260921232520.3127457-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232520.3127457-1-robh@kernel.org>

On Mon, Sep 21, 2026 at 06:25:19PM -0500, Rob Herring (Arm) wrote:
> Allow single-register MT8188 SCP dual nodes with only the cfg
> region. Keep two-register and three-register requirements for the
> other MediaTek SCP variants that need SRAM and L1TCM regions.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..2f0a28c7a24c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -28,11 +28,11 @@ properties:
>      description:
>        Should contain the address ranges for memory regions SRAM, CFG, and,
>        on some platforms, L1TCM.
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -171,6 +171,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
> @@ -185,6 +186,7 @@ allOf:
>      then:
>        properties:
>          reg:
> +          minItems: 3
>            maxItems: 3
>          reg-names:
>            items:
> @@ -195,17 +197,31 @@ allOf:
>        properties:
>          compatible:
>            enum:
> -            - mediatek,mt8188-scp-dual
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> +          minItems: 2
>            maxItems: 2
>          reg-names:
>            items:
>              - const: cfg
>              - const: l1tcm
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          minItems: 1
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.53.0
> 
