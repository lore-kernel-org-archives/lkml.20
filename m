Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391783515E9;
	Mon, 31 Aug 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165443; cv=none; b=UnHhtvQBwxoKb7jwrB/8JhzKO06adNIFFtbYzbWBu+SXIInpT06m3Fm0fYTs2mbz6iHo8HD0ALX4oCsFvSLHQFeYwFTYhoMLwpJ/hkju5rOPjrFGCZkkYKqkHHMKxDP9nBLmXT11+Zrrq95jggrSH4nSpv2toNUzNyqREn+YKIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165443; c=relaxed/simple;
	bh=HGuWIJTTyDTdQQVSYcwB8PmlmTVJHdpSCDXXh0ObARo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxikGQTuHrqQM5H0FOFYLZ+2P3ZMpwYT8G9TFXoXGLZptKtMDOCZvxPjyfM5y+/vMmGq5zniMSEf6Hm0QuHZG0iZ5fr7lphUHYB8/kL0uB0dU682hrcRCFpIaZI2Q7oNf7Piv3KfzCIvXpiGzZ9xFd48QWvdxIk63aL2dYDLYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boOSdzbU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boOSdzbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BBD1F000E9;
	Mon, 31 Aug 2026 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788165439;
	bh=60SqbhB4ZqQ8pH+IsYTy7fAhM8RQeAFRu88CbYew78M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=boOSdzbUCi2QAe013hGwuxjNSv2cJqAzvSLLllZswjCw5mvwnH0k8BXyN/RoKX0II
	 SXhCBsFZ3S8ayPZh5IMSwY6elBLGeXrGbtdJ1hj7cr8VIOZzlSHx+Ptjoy11PsP6s7
	 HLtTT9laPtoNURLOYyEkFlg9QaSiI4zlnawBqWHhIic2kRImHzP346TYDqeEhvq6Wa
	 bTl3ZwFh+jM89zCYpq6sfYX0SEcbgNxs5uyfsgIgsMVfcUXow4Fj7yUsf5NXiS5vRY
	 sCkd6FWQXCSUv9e2+duwJRrJvdUVvoGc2PxT9w3Gr25sRvjOwfyBsjoLHG8I4/egtf
	 w/7gpMmzxMK7A==
Date: Mon, 31 Aug 2026 10:37:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
Message-ID: <20260831-messy-ebony-warthog-cfd727@quoll>
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>

On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
> Currently for Glymur non-multiport USB controllers, number of interrupts
> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
> present.
> 
> Mark glymur non-multiport controllers to support a maximum of 6 interrupts
> including the hs_phy_irq and ss_phy_irq.

Why?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Changes in v2:
> - Modified commit text indicating the issue in max interrupt-names for
>   Glymur non-mp controllers.
> 
> Link to v1:
> https://lore.kernel.org/all/20260803-glymur-usb-binding-fixes-v1-1-9ce334777387@oss.qualcomm.com/
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index ea60f7220afe..3bef18f9557e 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -524,7 +524,6 @@ allOf:
>          compatible:
>            contains:
>              enum:
> -              - qcom,glymur-dwc3
>                - qcom,milos-dwc3
>                - qcom,x1e80100-dwc3
>      then:
> @@ -547,6 +546,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,eliza-dwc3
> +              - qcom,glymur-dwc3
>                - qcom,ipq4019-dwc3
>                - qcom,ipq8064-dwc3
>                - qcom,kaanapali-dwc3

This changes the ABI without an explanation.

Best regards,
Krzysztof

