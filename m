Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B83D385D7B;
	Fri, 28 Aug 2026 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787911609; cv=none; b=kyeXZS/QcEgm2ROk6uxFw0+4iv/Efs1rnZhDVSRPFbN0470wDHlXkuhJ+YkKz1X/q7an14PbhhzQcfP5ElSHf8xor/d+t+Jm0tXDcyuQRT1pliOIdwvWOyM2Dz64HQAFzlCUlPAg/BUsDOBQRDRasymt0iY6AqCXV7FnWmQcciw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787911609; c=relaxed/simple;
	bh=6Z4jmyDX652zhtkCQcYPxuUY+uIPoe/Q3jkpO5wZ4fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsPF8nW5xUIIXt+pHWserz83sYd66Tl9aos/Iil7T/KdnKuA6TQRoO+yzl5/LFUjuyhJVT0jQwfd0G+vHgbAaeWznkYdsmoF7t/+oJaqUwnui+F5KG+NpyA3/AGqCQVhvu5JoaQ6jHw7GkqryYQSixk9gXzHGoCE5wZcyC1OuJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFKgjQzx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFKgjQzx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1948A1F000E9;
	Fri, 28 Aug 2026 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787911607;
	bh=CDnR33z6Z/6fy0rMF6gxUhw28dw7V1XGaZiCf4n9aOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UFKgjQzx7jsQ5UX4fYF/vjg842oIkaz8kFlLO4qGRmhr9zDu6e7TT++r5lC2r8lRD
	 eqDNO6vAuZKUzcU4GfHv5mbY72faVKEBEei65eh2KS65H41wg7Xjkpfj6L708uFc2P
	 5OOHPB4tZ+oBbrbL6jWbwAcbmXCgKXYW3AaIP8Il+m/L7Fk6JFvnP/xMfD07c66vEu
	 xpy/KyNDsa9FQCsDSuF7iWhNbsao+1njP8TTDHIqTAXqWt4WTCrE8IkSTzZ6cvBQKG
	 awR7ubdnXwhuQCBFVgw5YXxjId/VfmCJgGky7NODHYm566zkyXS8kse2wYEBvJiXoW
	 OG44Z5X3hdf4w==
Date: Fri, 28 Aug 2026 12:06:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: dwc3: qcom: Allow the glue layer to pass
 ref_clk to the core
Message-ID: <20260828-grumpy-fresh-dragon-856e2e@quoll>
References: <20260825-ctrl-v1-0-609e2291814d@oss.qualcomm.com>
 <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825-ctrl-v1-2-609e2291814d@oss.qualcomm.com>

On Tue, Aug 25, 2026 at 10:38:33AM +0530, Varadarajan Narayanan wrote:
> The dwc3-qcom glue layer sets probe_data.ignore_clocks_and_resets before
> calling dwc3_core_probe(), so the DWC3 core does not acquire ref_clk on its
> own. This prevents dwc3_ref_clk_period() from programming GUCTL and GFLADJ
> from the reference clock rate.
> 
> The deprecated snps,ref-clock-period-ns property is not a suitable
> replacement on IPQ9650. Its 24 MHz reference clock has a period of about
> 41.66 ns, while using 41 ns makes the calculated FLADJ value become 0 and
> leaves the reference clock configuration incorrect.
> 
> Allow the Qualcomm glue driver to provide ref_clk to the DWC3 core for
> platforms that may need it.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ac68b4218b56..2d6de6469c1e 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -705,6 +705,13 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	probe_data.res = &res;
>  	probe_data.ignore_clocks_and_resets = true;
>  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
> +
> +	qcom->dwc.ref_clk = devm_clk_get_optional(dev, "ref_clk");
> +	if (IS_ERR_OR_NULL(qcom->dwc.ref_clk)) {
> +		qcom->dwc.ref_clk = NULL;
> +		dev_info(dev, "NOT setting dwc.ref_clk\n");

No need for a message. Why every device should receive it during probe?

Aren't existing other devices use name "ref"? Why are you coming with
completely different name? SNPS binding also asks for ref.

Best regards,
Krzysztof

