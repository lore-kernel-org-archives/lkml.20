Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793002182;
	b=mh1DgnzZ/8v082B3iY5a3Rg9d6xE+eqiF9iy8qwMlaS4DFWW7TYx0HwvsYWgJMo3hHaS
	 JdnVXUfdpba3OsIS9JtAFvUg/h4Fnh5hb0T6azIV8LHo0QcbwK+xzctMZe/dg2/I1QptG
	 FTKSeXku4cQVMl6ID/afTrLjz4KYRFO3CRYMjrqXI+tjxSOUcLlO8QHOTZhIoGCQK9W38
	 1RszuqMpwbAtdm0UXN2AqiLto7bRZ+XlfUZWelzZ1NvmNadAgUyBzvMsSgJuU4fppzGwC
	 bkftcgqwkI7dSv1bdSMSa2dRz9E0J6hhICY8VSpM0QsdvujyliMDgx2Mgxo7L+9iHxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793002182;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LWKFcfNh5xMzsuF/aVFEMGBXvFuOb/Q+uc2bfMsCUgk=;
	b=W1FDGURYoZmfCw6y2b8Us8X2b0b4a52jPU7ZBSrnXyt3BjeKCm9i89biGM1o1M5Uz4zt
	 0yStccUMUdz50taoqzfPFua9Bdyy+G4vgkRfh8hwekYlyf9UD+llPv0P1+M9hc/LtzBBU
	 LNPBlmC21x4+e8jmGmwgGX8ITQs0ad+4VRSr9RdorGapXjfaW6e7jKScahfAZUg3Je2MY
	 Y2G2pgovpp2K7h7kMVgvMS63z0pVX2WoxJDE/EOGy69Mgj+TAmWpAqs9+SA39WI4/JTSq
	 gegCyYRSvLzAOPrPDuD6n4dEqtWA5uYLj8+AWqFhKl4rf2x7ObH4q7Dfc6imnWXtuoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+uqXwXn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729EE606A31A;
	Mon, 26 Oct 2026 08:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+uqXwXn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529851F01825;
	Mon, 26 Oct 2026 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002182;
	bh=LWKFcfNh5xMzsuF/aVFEMGBXvFuOb/Q+uc2bfMsCUgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i+uqXwXnbRoUquwtIQMNSUBSnJmxepGwwSBtQ+lilH5GwJkvO4nR6vEaZvEVaim0I
	 loOqX760TUa83JRyPr1aEff6ty2mRLwCmPy9EkWeI4KKJW2XZ5YjHkkZ33ufZZ5N4M
	 blzQlnaS4N/B0ZTGSumAG2k2xfZcxeAFdqO7bPlmUU+XCOoF4pkKpuYsMI8NPM4Sls
	 qNdyn5VEZ+FVFfKAZMO+2pS9OUlICPJJkPNAN3T9Q8Eyj/WT8ZcRjy7KAmkpEvcb+x
	 Xr7qE9ah3lM/R3Rycbad+X/rKm7EQIGULZLt00l7MhzZ5nr2O6auzZ+RIpg5AH0Jpj
	 v8KlAE8ZuEk/w==
Date: Mon, 26 Oct 2026 09:09:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Abel Vesa <abelvesa@kernel.org>, Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <20261026-vagabond-macho-sawfly-9c02dc@quoll>
References: <20261023-msm_gdsc2-v4-0-40b6a71d4e3f@oss.qualcomm.com>
 <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>
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
In-Reply-To: <20261023-msm_gdsc2-v4-1-40b6a71d4e3f@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 04:13:11PM +0800, Yongxing Mou wrote:
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> index aa0cf0ec5b93..7f8e52d52078 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
> @@ -61,6 +61,32 @@ required:
>    - clocks
>    - clock-names
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:

here should be contains:

> +          const: qcom,kaanapali-dpu
> +      required:
> +        - compatible
> +    then:
> +      properties:
> +        power-domains:
> +          minItems: 2
> +
> +        power-domain-names:
> +          items:
> +            - const: core
> +            - const: int2

Drop power domain names or move it to the top. Here you only provide
constraints, not define new properties.

> +
> +      required:
> +        - power-domain-names
> +    else:
> +      properties:
> +        power-domains:
> +          maxItems: 1
> +
> +        power-domain-names: false
> +
>  unevaluatedProperties: false
>  
>  examples:
> 
> -- 
> 2.43.0
> 
