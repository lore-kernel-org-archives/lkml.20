Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC10383305;
	Mon, 19 Oct 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394284; cv=none; b=Ae9o2l8l91G7Vg4KP7HoQWefg3WQeIBf/hw+5y4p+BkMLKC03ZOt7JehQnUERW9PbK0aAhbousfVgCB7Npupez62dLhdf+1+OCyBnOAfMpyLsq7nEGn5mXIuaWUx10ivhqyv7luu0xMJoCt9OD14MjVxoMeAFmwZgVtBfYObqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394284; c=relaxed/simple;
	bh=RM0wYNPhaPyvhsBQF+hx0+Z4KgqMLjUu+6FbJmYW+eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdNcK3sSCptXQCM0psezb+LAhCzO2CYy0N81S+3ynNRxaHQFE+5Ku7T0WezYGoEUES/auoz3o4FXUoIdSevbGnPUuaFKOgWgpBecQABVXTNGdtIPRgMxtUmRDJlwl6IOmpBrTpcgPJKsDp32veAjc2I4hMMO2pAj0uMDgr43gYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEyJrVcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEyJrVcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6E11F000C4;
	Mon, 19 Oct 2026 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394282;
	bh=NxFKX9qR62f7+24KU1GagtYceb+WTVmOUQ7AhgvqXq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WEyJrVcrvrJL6aj4TLhxqS4V5cbcodSLdIsARdvnb71QFy1n1yYkmmphqVib/xrbJ
	 6N4NItERWufbphQlyw/kPc3AJjfrRGsbZ7bqHYybIdphMpsskjvhKnMv38LiMqNzZu
	 HI6if3Ts6QuD5VSebrBx1Zml+sMQCn+idRvgY+b6mkuIIST/DC3b3jg+KGv65jtZ9f
	 BHc2i2ZO4JD6q/XrFNMVyqcZksaEwsVFOSEEXQqL8H28D2L5dNv3ACiXrS23oI4VkK
	 4ZG9+4w2UhaXKcLFO8k3EaqnSzW3JCBlKAFkjpM2bkA/7RWM54e2+CzPx93nwsTSeR
	 6Lpe6Jyx4iRYw==
Date: Mon, 19 Oct 2026 09:18:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: phy: qcom: Add qcs8300 to the CSI2 PHY
 schema
Message-ID: <20261019-majestic-gorgeous-sheep-a9eae0@quoll>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016235502.2274268-4-anusha.nandi@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 04:54:58PM -0700, Anusha Arun Nandi wrote:
> QCS8300 uses the same MIPI CSI2 CSIPHY as SA8775P --
> identical D-PHY register layout, common-control offset and clock set.
> Add "qcom,qcs8300-csi2-phy" as a second enum value in the existing
> schema rather than duplicating it, and generalise the title/description
> to cover both SoCs.

Just squash the patch.

> 
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml   | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> index b66ec2f14189..8e60ef0714bc 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-csi2-phy.yaml
> @@ -5,18 +5,21 @@
>  $id: http://devicetree.org/schemas/phy/qcom,sa8775p-csi2-phy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm SA8775P CSI2 PHY
> +title: Qualcomm SA8775P / QCS8300 CSI2 PHY
>  
>  maintainers:
>    - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
>  
>  description:
>    Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
> -  CSI Decoder on the SA8775P (lemans) SoC.

You just added this line. Changing something you added means previous
patch is not correct.

Best regards,
Krzysztof

