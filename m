Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71450416869;
	Mon, 12 Oct 2026 16:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821911; cv=none; b=AT7jM6H7UKNjRWAaxwp7t81D7ALf4pptTrI+aZKmhtnI/OcOIGBCZTJbghnovXComQp1r3TiYoJH90NYKQRA87GUog0lGpwQUEG7RVJcaLs1lmDdmyj8fGtEiw39TOFlvlX+FB50wJkTaFgT0gLAFyZ1MEYifwO9/Nnn4cjuxhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821911; c=relaxed/simple;
	bh=JKBbh8zkWjtxxa0OkdlJ0j6KAykWENh1ao1bZ8bglF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5x23XpTVXTITvX/OwpFGKuejmLXoP1resC+fvCoxd3it7S151Nx5OkptBh+8uYUdkiwWxeycQuCgInMwmVgyNcx9RnqhNkbf9RnwFnt6Ppb32xyaD8nrTw0esUVKcpq4uky2v158Y7GRSVSq3rhVw02dFeLFOcO9XLlzRCYv6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NAgIQMop; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NAgIQMop"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A97F1F0089B;
	Mon, 12 Oct 2026 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791821910;
	bh=ISIVqPCwxeSrPxUki4KKTfyePbLOWnvCPTwUePWGOKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NAgIQMopqESraseluVOFxeku6hSrikVu8dqUx8dXtLMpGuxd00W5RAiIoqcudlWFG
	 yZOre8vlS4r515/Peqs7nnCCIU+PATlgNiT1etwYTqNCP1fL8/edBfNCu4/bSgwBvL
	 8qf9MCZLHIgNr4RfFdrHlTmK9fPir8mfIUPcBUanywEG1TU92THZktYvd4eJ74jGJ3
	 HgYOYQBare+5heqzy5EgULGrQPH46yhclekT7Vxag43R1BBpH1f5OjNST9QaRfXYQr
	 sF2tnBs8w7CDBF26/v4Qt4mFtghdTcV/wCuUnsLOBPIts953gXMpdyIEr+IXBck/Mf
	 B3gV3PovHBqAA==
Date: Mon, 12 Oct 2026 21:48:21 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <as0IMvhSYlJo4IL6@debian>
References: <20260921232603.3129898-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260921232603.3129898-1-robh@kernel.org>

On Mon, Sep 21, 2026 at 06:26:02PM -0500, Rob Herring (Arm) wrote:
> For the QUSB2 PHY binding, keep the three regulator supplies required
> except for legacy IPQ6018 nodes that do not describe the board rails.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> index 001fd0ccc985..2516eab7f6d3 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -165,12 +165,23 @@ required:
>    - "#phy-cells"
>    - clocks
>    - clock-names
> -  - vdd-supply
> -  - vdda-pll-supply
> -  - vdda-phy-dpdm-supply
>    - resets
>  
>  allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              enum: 

ERROR: trailing whitespace
#35: FILE: Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml:176:
+              enum: $

- Mani

-- 
மணிவண்ணன் சதாசிவம்
