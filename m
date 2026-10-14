Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309994A3D25;
	Wed, 14 Oct 2026 11:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976365; cv=none; b=NJV7IsnDdfZOadAgHDDu8b3Krpdn5M0e3cdskWP7wt8n5HoGiS/XExeeVQz9zNK2kAFGobja7FI1dPKbuui3jiUytcKpZBvlk9M7jCTMo9aDTnXeFVw/RvlyCvGQl/NsA080Cg2g45BN8X9syLz3uAjv2w2mEwW6XWAuxAXDziw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976365; c=relaxed/simple;
	bh=mrbgHGmoTJ6Qjt4BBd+tSZJEzLxFk416rgq/+VCK0dM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lesdiYphG9seN2+q+z4lOtMsmlkS9Z3hwBX/1j2MiCeloeMFn0jcp1VZaTe3JZ1ufKEMZI9SUxMPpgGlro4yf/wPIdd7FuJo0vJP/X1VZwdKiZsVR3g467CyTlhwUqZWSW8eAOqmTPTAZv5fRgaDpRfy6pM+W37RJyDRYub4RWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtFTcpXS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtFTcpXS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CFA1F0089A;
	Wed, 14 Oct 2026 11:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976360;
	bh=j9yuGhjODcfK+Fr1SrXbKjEuCi06P90b/uCOBAwgIsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FtFTcpXSiHB4NhY0GrK8Lr8CTWmq2V2WmEGQm6eUORIVxJxWwmJ4oyf0BE4RDAVeR
	 qKsdQctipLDR7JXvUd6N3l6BLRfPRuRKoxyzg9ww3mYtXdCh6I8h8UhzLf/Ty4661S
	 Pw/KlLre7yC5JtYvfcrXJYGmC7pCuU4j91X05BT+gAuLyTUj68PZhagsgNV2vZ2BsS
	 /hfI8oo7KGQmoZjZfX+oTbZp4AAthU8UI20tWSlDMW6ekKSraRBBkXHeHpvZO+MS3A
	 ba4lVVAIFTvjE78XqDypweVZ3hjL683Wu2pGDk4l7Gmbz/sOX6t+gtv05+uRSi3K1R
	 RdQuNn6bXQqfw==
Date: Wed, 14 Oct 2026 13:12:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: snps,dwc3: document usb-psy-name
Message-ID: <20261014-brilliant-sympathetic-marmoset-ed5fce@quoll>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261013102927.1141696-2-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013102927.1141696-2-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Oct 13, 2026 at 06:29:25PM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> The dwc3 driver looks up "usb-psy-name" to find the power supply which
> accepts the input current limit requested by the gadget after USB

It does it for ACPI, no?

> configuration, and while the bus is suspended or resumed
> (dwc3_vbus_draw_work()), but the property is not described by any
> binding:
> 
>   $ git grep -n usb-psy-name -- Documentation/
>   (no match)
> 
> As a result, any DTS using it fails dtbs_check.  The property is read

No. Just run:

git grep usb-psy-name

There is no isngle usage of it.

> from the DWC3 device node, which for the single-node flavours (e.g.
> qcom,snps-dwc3.yaml) is the node that $refs this file, so document it
> here.
> 
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  .../devicetree/bindings/usb/snps,dwc3-common.yaml          | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b6538..6609a709c1 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -51,6 +51,13 @@ properties:
>        - items:
>            pattern: "^usb(2-([0-9]|1[0-4])|3-[0-3])$"
>  
> +  usb-psy-name:
> +    description:
> +      Name of the USB power supply accepting the input current limit
> +      requested by the gadget after USB configuration, and during bus
> +      suspend and resume.

Power supplies are not referenced by names, but phandles.

Best regards,
Krzysztof

