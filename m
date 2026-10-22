Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792689660;
	b=RGV0VisF+Nx9OmpuRxqlbg6lExa0zy2Vk2YG+nfvDyH7eK6j4z7f6qh69UXz5cY59qnj
	 jYYzMWOc06T/8ZmYIt/ztPA+/rOfGzQoeP/KxUtLj0NCjS6jruT12haQFp+3VpcavTZOa
	 /jHzZIL7+GGHZKc9cG/aaJJwBU+1kFpWy0mF1lUhIm+AOvrvpmvSi7GTVFXdh8EWWzyT+
	 PM27xnlbjH1MmHnJ6wMoO8DzZjPigSuw+p/B9+gxYUOR5+qx6EQCHiAHy1xzjKV7iJl+X
	 5Os7wT4RY/FwuY5MAf5sd3FOUjHUebXmmHbLQCdpwUOaX77AESucK4dKozPyKHAAmTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792689660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
	b=VEzPP+GhnXNaR+u66GcCr0w2ZZ5QZGWuDQVkpFFMiPdSJcZM21GdASBqJ0l9hw/chBPb
	 l4hiUpm2FmdLeDcGfGMEK6z6fJf+srGx51lJbSmyhFP+MqQGwh1H6NaTUyCZSgg3vQqWF
	 wZbVTi3ADIJJ54ZiDaONovZedMWhsNvPboKhDbpr/64vTv4DgQGCyVL2CkLzsYbovgIjn
	 r+5p/KqA5mglJ0Q3Z21J4BHDef9dGA/R8bQV7gdhuTCFeTVv9B6ih9cs760RwxUhpP2L6
	 MpuP5DIhu5ugyvzHhYhr//nDCfB4TEPideJ57p+SLuKMLWdTdPJRmyE+AZOLBc+40Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMg3vCev;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96151606A320
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96151606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=OMg3vCev
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ea138a3497so12737795ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792689659; x=1793294459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=OMg3vCev/2Ujxa9oEpgiu0xbE1LUsHSx8nyHW6T/WI6oPLeznW1CrSavu0LbaKsnMb
         uBnXAI+0yj14nVvqT/8yyv+IKogdNcJedJKOfCcpprK4OdRiWQ2YQ/WTkREHRICuY/PT
         P7hgzWoebssFygNwNUfU8BJ456S3GXdprnm6l2w98eQI5ECmqnUuLgXXUjDkosqPboxd
         8RPo9uMtHby6nc7xilDqLAm6VO1pe8ymjbfxTPQz48pQCpDyFcapZyo/9RFLYzHJQhhO
         Ess3kGcgCrp1SKM7CO7nGZwJpQxTf6ilOILjYnORGbW0p+5eIU7804ZgsKVAu34BF5+r
         QfeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792689659; x=1793294459;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSKC6LmTr8AlslSEV3eV/HjwmhQt0Co2xOFmLGtEaEI=;
        b=a7BOt8UtdIE+zXDFSu6YcTKgQneNoBr5c2BH8Oj4axsbFoZvY8iVbgWkrmY4HZN9qj
         Uz2iWG+TFxlXcKswj9JSQe92qiOaQphqmOZecmMx0AmmFeW+z+35+gAYRT3YxMwGyMgw
         OB9VAZ/7pZXwv2cgVfsthX6rlh2n064VroQKMW3CnsQyHcPWdc/OuqGi6wLHI8mSy4+S
         GhJSc1RXmd1Yx0VAmegw63q6r8FsKS4Gm5kczwQLV5mOVsTF7qfTx/xducpqhB07L6Y4
         CZXrbQtHOHXt5OAbvOQ0jJe5hGR1AIcl0mAsq/86Js8PCjcOx6Rm0jtux0LqltixVN1y
         99+w==
X-Forwarded-Encrypted: i=1; AKwUvBy982BxiDFXi0bj0jrZr5mzihW8M7Tet03n3hghCzbcTjTSM/9vhsfH157upa6W7SroOUav3YGQ3SY9XKc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4C2bwtflckau5hGY/HqdAKFz8VPgDagSQqGPmTqaxn7GXytwB
	ui8NkW/ZeNrKNviHqep/4i648NaBASMF2tVv9TkMuRrrQHvmFLT0KU3I+hi0U+eyPVM=
X-Gm-Gg: AYBFou2WXV9QkwpezAslK7uDheB/U1n5S0etrQ/455vYO0KQLUExPsM0ydm9xoX59g1
	Zz63W3+CFy07HU5h3FJ12YZ562bkbkNYAF4YpOouWtG0lICZSLdah3Y6W0VB0Gy/b2UiXGx16Jc
	kcToeA/zAS7ZFvsEe1M7ZMmv+UKUUqTKmzqVkIcm4F8t6DW48U+be17LRql7f98BKkLjy6dbH68
	zOt/ObI1fw2/IKC5U+TOH2+7skZyEgPABfRsdTBB8M5sRHjWeW4s9MxL8Wqq3YKNACGUXO/+zG9
	pBVwLwc/GtWpuMBoEY/maL6mLn5S9sL3jeRdEpFTSPEQy4XQbcHlY+EOwB6+uWtjC2IF2auCxTx
	mJwlvOGDGt3sCk3uTmSOWnounHZ4rvN51kBRUtP/iQWJbUKM99/L7Z0eV1X/YTn7nZr40Etcqeo
	EZSFkiSpXMVZlXdJUg7BiICyME1+ShnCnY4N055DC4HMboUmAg1euy5eCJMW0r6v8iwBCDrp8QD
	6S0dxNjTIQacBP1Us1OmiNTbVkj1L2jNifRmkfqWYO+StJgCSsEg2ICnp7/roF6jFR7X0Re4/rg
	GioN
X-Received: by 2002:a17:903:2f89:b0:2e5:54c6:e5c9 with SMTP id d9443c01a7336-2ea437b4bf8mr47547695ad.2.1792689658924;
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9e85:9169:41c7:bc2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b366766sm1137285ad.31.2026.10.22.10.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:20:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:20:55 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Frank.Li@oss.nxp.com
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Francesco Valla <francesco@valla.it>
Subject: Re: [PATCH v7 2/3] remoteproc: imx_rpoc: use memory-region-names to
 avoid hidden ABI
Message-ID: <atpF91weFU11Fu4m@p14s>
References: <20261020-memory-region-name-v7-0-1413d5928340@nxp.com>
 <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-memory-region-name-v7-2-1413d5928340@nxp.com>

On Tue, Oct 20, 2026 at 12:50:22PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The driver currently derives the memory region type from the referenced
> memory node name, creating a hidden DT ABI. Since memory node names are
> not constrained by the binding, incorrect names can silently pass DT
> validation, as seen in examples using "vdevbuffer" instead of
> "vdev0buffer" ([1] and [2]).
> 
> Parse memory-region-names to identify the expected memory regions and avoid
> relying on memory node names as ABI.
> 
> Link: https://lore.kernel.org/imx/a3602ef8-2b77-4cc3-adef-2c4cba08a5d9@nabladev.com/ [1]
> Link: https://lore.kernel.org/imx/alexXTYQHUs76J7v@SMW015318/T/#mb9dc709ff3adc24d9db6d30c973f37b580f6f1f9 [2]
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Reviewed-by: Francesco Valla <francesco@valla.it>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 581bb07f5893f..1647726893d1a 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -635,6 +635,25 @@ static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static int imx_rproc_rmem_to_resource(struct device_node *np,
> +				      int index,
> +				      struct resource *res)
> +{
> +	int ret;
> +
> +	ret = of_reserved_mem_region_to_resource(np, index, res);
> +	if (ret)
> +		return ret;
> +
> +	/* "memory-region-names" is optional */
> +	ret = of_property_read_string_index(np, "memory-region-names",
> +					    index, &res->name);
> +	if (ret == -EINVAL)
> +		return 0;
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -648,7 +667,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		int err;
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, i++, &res);
> +		err = imx_rproc_rmem_to_resource(np, i++, &res);
>  		if (err)
>  			break;
>  
> @@ -823,11 +842,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
>  	if (nph <= 0)
>  		return 0;
>  
> +	if (!of_property_present(np, "memory-region-names")) {
> +		dev_warn(dev, "using node names for carveouts should be avoided\n");

Get rid of dev_warn().

> +	} else {
> +		if (nph != of_property_count_strings(np, "memory-region-names")) {
> +			dev_err(dev, "invalid reserved memory name count\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/* remap optional addresses */
>  	for (a = 0; a < nph; a++) {
>  		struct resource res;
>  
> -		err = of_reserved_mem_region_to_resource(np, a, &res);
> +		err = imx_rproc_rmem_to_resource(np, a, &res);
>  		if (err) {
>  			dev_err(dev, "unable to resolve memory region\n");
>  			return err;
> 
> -- 
> 2.43.0
> 
