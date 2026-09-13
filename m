Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3424724501D;
	Sun, 13 Sep 2026 07:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789285808; cv=none; b=ZYhjCVbgP0pnKByc03oQM3xbiNWXe1l3Pn4CxlHNWRwyIpEw7lC3c2sSPqEq13a9wjsMKNcNXfGKluQ/pEs34mEWjcn9QWO86js+UEi3prdqQDbvOMrspoi1aViW6uoXT0D3qIuDa+3Zat/TEGTqnDKwT+UD9P8xNMIHR/yGagc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789285808; c=relaxed/simple;
	bh=hU1rqViu1EpVEvQCb/N/SYZKKgn81mdJCzicQsLe0F0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdTSu5idrN3ogdvtrwYxSKfTvyU39VxIRo7etLBv27XgL1PPHYAfwYuTgczw7JTAf9sZjswQCCxAVHozh2K2kkBdEH8VjUjZm6IXNchYsJO6wPUN3dTAOoC/IzbVXZHv5EmGwdRjjBvdSWYtohFFzNuXHED+0gzCPNeC7DvMtTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQyqepqa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQyqepqa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F129E1F000FF;
	Sun, 13 Sep 2026 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789285807;
	bh=/vfBaplv3ynsUjvQf48JdtOudWdNUPLDX6cz9N40dxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NQyqepqacY2wTnbV1Q1tXFbycIEo8cp7lLc2CC7si3ixm6N1Dv/EndBL8RCGwikkI
	 qpaGBStF/j16Ocsg4vJJdhhCeunXTxzYlz1aCiFiQrXMHNt96kcLeYTkYJQ+sJTypH
	 n9+808sCaHxi+gSZqpTThxINukKrandZ5LSGN7RyVAG8r469ZpF02XL5wD+wQ5ArWj
	 pa7WaTV8X5klYPMRaGZsY0VL1ijvBRLRchS/w/HnT+CG33hBjbJsWdwCr7Cb1zV7fF
	 RP+UM1NckVZ7HxiOgU10H5BU4bwilWr+LmQiE+hwf7oPM2aU9/G5iULaihLH2F3j6r
	 xADm43avrVrpw==
Date: Sun, 13 Sep 2026 09:50:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 03/17] dt-bindings: display/msm: Document Nord MDSS
Message-ID: <20260913-festive-shrimp-of-strength-10b9df@quoll>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-3-e25c073cf1b6@oss.qualcomm.com>

On Fri, Sep 11, 2026 at 09:06:34PM +0530, Nabige Aala wrote:
> +    display-subsystem@ae00000 {
> +        compatible = "qcom,nord-mdss";
> +        reg = <0x0ae00000 0x1000>;
> +        reg-names = "mdss";
> +        power-domains = <&dispcc_gdsc>;
> +        clocks = <&dispcc DISPCC_MDSS_AHB_CLK>,
> +                 <&gcc GCC_DISP_HF_AXI_CLK>,
> +                 <&dispcc DISPCC_MDSS_MDP_CLK>;
> +        clock-names = "iface", "bus", "core";
> +        resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
> +        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        iommus = <&apps_smmu 0x800 0x420>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;

Make the example complete here.

Best regards,
Krzysztof

