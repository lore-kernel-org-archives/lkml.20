Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183CE2576E;
	Mon,  7 Sep 2026 06:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762129; cv=none; b=omuG12EL0Cdzjw/oYBzMV/oAXXgwtZToIz9PWsZYgUE1wL8FICbGXwhq8qxgZgD2aDfZX+MCzt+oQAb8pTOwsqLsrMoocQPuawXRafc0RdX5p3yQ+LqfMJX6i0fVyLt9hh3IDa5XFfG9AVzGxV1viOVfZOOOy8Q8pLUHE2WqDeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762129; c=relaxed/simple;
	bh=wWahGpfz8cqoCrsIiVlK5sBg91JCdGv6kzl8Gbxwp74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGHtnaFsz3HF6DRo7PoPUepuCPwe4dmndbWAxHHiK/7s1NUw5Id449CVlk39mlW4myJCW/MxIeT9igDxt4c5Cec1CupDTsYxVcaB6KGvwgiSfms6nqD7ajGRFGvmeXbYx5UHvzMPRkVVOb0NhebDwq8UusOSboOAsulIO1vja98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiaZkOU+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiaZkOU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67C61F00A3A;
	Mon,  7 Sep 2026 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788762127;
	bh=hOR1wgZMWegMI44NaSdYvTT3p5cO7has09pGbSG16cg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZiaZkOU+zbPN2E/soShDbHJzmp/Hhf78XkCckfp1K/8WmHD/ovuOStMl/35niayi1
	 z57OY+IsTOKodK3OGs0PyS8GDfQYTR47x246Yrk+eUuW5ZKG9fMbP3cXCxRTBUY5Yt
	 vhHactmxQNrjkY8gQOdF9DpZgr3UmooYR+aWpcpdjYqx5HLKQm7gxeOS851eqru8ik
	 3Q0sgrUFK62NObpJTa593at+OK+1IuoVH4OWXMrfZOtSPumV86LTL2AilKLnSt8qc/
	 MAX4no5lAG/fOxufsphz5IZ/dzm2T2FnPnGp5woXjz0FOM5mWKcqzVXQOJg5mnrhyn
	 nt6R86PluVPMg==
Date: Mon, 7 Sep 2026 08:22:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: usb: qcom,snps-dwc3: Document the Nord DWC3
 controller
Message-ID: <20260907-athletic-thick-cockle-b21fda@quoll>
References: <20260901103300.60803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901103300.60803-1-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 06:33:00PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Add a compatible for the DWC3 USB controller found on the Qualcomm Nord
> SoC.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

