Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB404B2025;
	Thu,  3 Sep 2026 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447391; cv=none; b=RB4TqKQL6loyw52NjgeIqDW9Zj+SZ1Ig3UJh7zB7SKc5irANwBc+zxy5bIig4lOMiiJn4UhMM9Orwltk3XU9YrBQzwfbR8fpWyPymip4b2nD5/5XRf5fKhhZJ7nO6xnJGnD2s2II05V5i3iDe5n/3UrMWvUEfNjuw37EsBfFBZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447391; c=relaxed/simple;
	bh=wzzd5jw33wkjZtC109avsburcPrqcYErj0QbOakwpHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZomJmLGFoYrvbNGOtbYCJTONNbMLOQNderYwn8iLwVUYqBzCrQvLc51k9Cj1t97Te088shfSeVbhFNccD3mMlFSwht3NYhCtjvJJ4kDIFDFlV9XvMzh9dbfbQfhvNXDidlA+kct8BrkWtvyKAUj+QwPeo3UG/kc08X3tJbo6RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViQUwL4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViQUwL4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492811F00A3A;
	Thu,  3 Sep 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447389;
	bh=OUrfZKleKlwNM52WhHDvMJ9I6+0BXXB1WoEyHW0Vqks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ViQUwL4FKTXbo+4jhCaek2i5/dA62YQmGMe+stAWoHoahit8PwHBubRHjsz581ByV
	 pRB5UBUfJft3CnFTHTqwdp7tr51PJC+PU1JnJUR9HUQowL3okXxuW6g5u4Bfq7PIkR
	 ucASn8tNmm3cKsJ8H34OX68KcEKD5gcodd+chqqMZT5XKouO/0A+2GZBomi+9kUhYj
	 eSQYs0cqQ282V46exrIJOjRGPK25ScCPHIK78IlQoDzNEd1HSZVIr0jIy8BNEUhzmy
	 CH6eL1lZ0x5sWx6UJVWl/ChoZqPK10/fdE8dapdt629FszbaRjTj6nap4cr8z9HFXK
	 bhZptfRr4ZGqw==
Date: Thu, 3 Sep 2026 09:56:26 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Message-ID: <apmKZl-KaCDg1qmg@baldur>
References: <20260901-lyra_upstreaming-v1-0-e3a76dc9e21c@oss.qualcomm.com>
 <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-lyra_upstreaming-v1-1-e3a76dc9e21c@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 07:14:01PM +0530, Avaneesh Kumar Dwivedi wrote:
> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
> board, which pairs the Talos Lyra EVK SoM with a common carrier board.
> 
> Signed-off-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
> Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Retain Nirmesh's authorship.

> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index ff8a35df7862..ff7775dcb954 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1056,6 +1056,13 @@ properties:
>            - const: qcom,qcs615
>            - const: qcom,sm6150
>  
> +      - items:
> +          - enum:
> +              - qcom,talos-lyra-evk
> +          - const: qcom,talos-lyra-evk-som

I don't think there's value in claiming compatibility with the som, just
add qcom,talos-lyra-evk to the node above.

Regards,
Bjorn

> +          - const: qcom,qcs615
> +          - const: qcom,sm6150
> +
>        - items:
>            - enum:
>                - sony,pdx213
> 
> -- 
> 2.34.1
> 
