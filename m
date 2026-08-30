Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462225B0AA;
	Sun, 30 Aug 2026 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788082880; cv=none; b=bzjCVOe/Yg4vZlPIks/YrINb0h2F1xMC76Q5e17neiv21TNsl5t+pAaia6PSnIeUBtMTSPD3x9as/e8kO5vhMdQD6Uzg16PRfO2Ty+rxj1Yvbb4tIufllPccm1fY57jItnWA20yBxBsPvpU5zF9PypXC7WkCB1RqCnHpLtFKl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788082880; c=relaxed/simple;
	bh=FIOSq77btE2jEexpcIy0sQV3ik8NzDiD46Hdfrpksg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nK6fr31JTAhh0HxxkPHmsAz5XU2R4+QCTK7v6TdkBbta5vq25Al63qYTjBgd/rZ83Pu2a4GZ9ITofavvYd8xYlmIgn0TY4nN9MRVdzsjUMMRSDs4tp3UIYq6nKMHLOWrXHgZz1rtEAXhVG35yD410wOIl5WEaKXnbmFiu9FZgFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESAbBCyY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESAbBCyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5951E1F000E9;
	Sun, 30 Aug 2026 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788082878;
	bh=yrc5OceLOqYuhC0Jhzc+o7Zvca1fcHD8ktpQZihCCtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ESAbBCyYgALcwK7zibx+GrVKsxlHvPM8SMaXok2ncxpKFSjL85J6vSBgH6uPB99cN
	 6D98nbGGcoWWTooFlOv9gjeCY9RD2W0oGv+2gc5cywkk+pXkeBSl8/TBQB1M4FJX7k
	 uW67kI2dC9fboPwzT+0ZZVvvpjC0JQ4oQ95sMd41V5cibQBxV1SZzj+Ov4WbDzdxeE
	 uj8OSRJUAphJt2LQFG3w+iC0MrxJjKQHU78h6catQFtQ107t0EY9A1g9ulaVq1efOH
	 OP2Kl6ebI3AlhelBlhUAbdsii2bAuUN7VUzjanLFuzBBEjdGeqJWMOCOhpSi2ZAhGt
	 vcsY9G5+4xy0A==
Date: Sun, 30 Aug 2026 11:41:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH 1/9] dt-bindings: usb: qcom,snps-dwc3: Add ability to
 select UTMI as reference clock
Message-ID: <20260830-primitive-faithful-mouse-cdd1e8@quoll>
References: <20260825-ipq-flatten-usb-v1-0-5c1f3170bbe9@outlook.com>
 <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-ipq-flatten-usb-v1-1-5c1f3170bbe9@outlook.com>

On Tue, Aug 25, 2026 at 02:42:26PM +0400, George Moussalem wrote:
> Add ability to select the UTMI clock as reference clock which is passed
> by the glue layer to the DWC3 core to calculate the reference clock
> period and frame length adjustment based on its clock rate.
> 
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
> 
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate different from 19.2 MHz from
> moving to the flattened model.
> 
> The Qualcomm takes care of clock and resets management itself and sets
> the ignore_clocks_and_resets flag in dwc3_probe_data to true, so the
> core doesn't acquire the reference clock from the devicetree.
> 
> The existing DT property 'snps,quirk-ref-clk-period-ns' has been
> deprecated.

There is no such property.


> 
> So, add a property to select the UTMI clock used by many (if not all)
> Qualcomm USB controllers as the reference clock.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> index ea60f7220afe..aa263dfd42a1 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> @@ -155,6 +155,15 @@ properties:
>        HS/FS/LS modes are supported.
>      type: boolean
>  
> +  qcom,select-utmi-as-ref-clk:
> +    description:
> +      If present, pass the UTMI clock as the reference clock to the DWC3 core to
> +      use its clock rate to calculate the reference clock period and frame
> +      length adjustment in GUCTL and GFLADJ registers. This is needed when these
> +      values based on the standard clock rate deviate from the hardware default
> +      values. If not set, the hardware default values are used.

Sashiko comment seems valid. You describe Linux behavior. In your commit
msg you mention that clock cannot be passed since commit 613a2e655d4d,
which is a driver commit. So trivial answer would be: if issue was
caused by driver commit, then fix is within driver, not bindings.

Maybe there is different issue which is not purely-driver specific, but
I did not get that from description.

For example, if given SoC has different rates, then the SoC-specific DWC
compatible defines which clock to use and you do not need such property.

Best regards,
Krzysztof

