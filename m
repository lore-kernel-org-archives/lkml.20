Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CA47B438;
	Wed, 14 Oct 2026 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977508; cv=none; b=nR5qRUMs9VikJrcjMSjLPTia6JoSiIttz8u4gxYx/iXB2O3dRkYaQtCvIqTFOL2wlAOLS9DZQNs2bbE3RhsrZABNTphf5rsPm5QTtv+lK17f2dO77PThOA8ClIFiz8Z4/wv0OOZBQXiORYeDn8LQb5ID84Mw3Fm2uee4xCNec48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977508; c=relaxed/simple;
	bh=nTBmp+u3pbe++eU1eHOPJ4iNuXEkbtH5djz9SXvGHY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ltYxydO3wNq2JJME2w7lf3Y3bGrj0kgigNGnnbdtj0Ch+uLUU7YFOsj13VLJ1Ni6CfcD7eImxSuiDEpcz4NidFGc/PFPxCb63sui01Glr1VBYwEy0an2YHcWAsFk8fyQbcOEseY6hdkrlvHzzHwglONnQ6Po6ED9AlsQJDyvjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WMiLNbeK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WMiLNbeK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805D71F0089E;
	Wed, 14 Oct 2026 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977507;
	bh=vw+7jQrUaW6gQiLHDSoehx2M6m/ImpU4GodAzQiW9Vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WMiLNbeKnSwA/rEcgg2XRD74LUjkwxfflgDR+/8QGukGsQ0P3Pvk125N0cGv/cSVo
	 85UPNcZIg5iMZIh5g9EQOW8tEFcUW2UPJft46xiHDjAWc8+CFwO1BHbTPZtCanZSDq
	 bQVAQW4Zamz7zuiaLvUQGcb18jlqHXZHyP6RmhJgn5O3cBKfJV1xuf8Jg7P3iHyPpR
	 oSuA7Q/1RT5pyoSFIKXzjI2Iq4co+6pf3JWSjx+lQBHjIOL0MfBd+o5Xp6WOUWnCcp
	 uPc40qj2MGPeeJrKF42lESnwOqPuyc6S9CvFr+2AvV34wDANvGi08ZHxJIUJJ/L7xK
	 q70avl+tBMRGA==
Date: Wed, 14 Oct 2026 13:31:43 +0200
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
Subject: Re: [PATCH v3 1/3] dt-bindings: display: msm: Add INT2 GDSC to
 Kaanapali DPU
Message-ID: <20261014-elated-hasty-coot-ae3485@quoll>
References: <20261014-msm_gdsc2-v3-0-f1ed69014416@oss.qualcomm.com>
 <20261014-msm_gdsc2-v3-1-f1ed69014416@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-msm_gdsc2-v3-1-f1ed69014416@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 12:38:16PM +0800, Yongxing Mou wrote:
> Kaanapali (SM8850) has two display GDSCs. CORE_GDSC supplies shared
> MDSS hardware and most of the DPU, while INT2 GDSC supplies the
> VIG2/VIG3/DMA5 source pipes. Without INT2 GDSC, these source pipes
> remain inaccessible.
> 
> Describe CORE and INT2 as power domains of the DPU device, matching
> the hardware partitioning. INT2 only supplies DPU-local source pipes,
> while CORE also remains attached to the parent MDSS device because it
> supplies shared MDSS hardware. DPU performance-state votes on CORE are
> propagated through the genpd hierarchy to its parent MMCX domain.
> 
> Restrict the two-domain schema to the Kaanapali DPU compatible, so other
> platforms sharing qcom,sm8650-dpu.yaml retain the existing single
> power-domain constraint.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dpu-common.yaml | 19 +++++++++++++++++--
>  .../bindings/display/msm/qcom,kaanapali-mdss.yaml   |  4 +++-
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml       | 21 +++++++++++++++++++++
>  3 files changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> index 3f953aa5e694..19b791a857b5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
> @@ -25,8 +25,7 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> -  power-domains:
> -    maxItems: 1
> +  power-domains: true

No, widest constraints always stay here. Look at other bindings.

>  
>    operating-points-v2: true
>    opp-table:
> @@ -53,4 +52,20 @@ required:
>    - operating-points-v2
>    - ports
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,kaanapali-dpu

There is no such compatible. Open this file and point me to it. Why are
you adding this compatible to common schema? Is there any prior art
doing something like this?

Best regards,
Krzysztof

