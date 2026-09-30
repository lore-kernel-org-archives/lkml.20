Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999E43BFE2A;
	Wed, 30 Sep 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790759864; cv=none; b=PONHkD56tzP9+8V4OaN7hIiKG7IoEr82QM18QCsx6DE9TKVwt8BhHBpQVnNp6v71rrc1EQSHtFAQOJ+2lDD0cDrUrIuviIEd6gbeG21z1zQtu0DpNsYI0mayDx0aTGQLgIuliDzUh5fTttqJs4rzZw1IK0OVCDriQkXgV5Flh6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790759864; c=relaxed/simple;
	bh=LypZ0rpous39/W2s6BbuOoEX9oM/CmhwwJRxJ2cM/Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJIN669wUqYOEbYI0LbX0o0TULFCF5SrAjYBLrt+QTzBtqlYLp9njvdPRIXdgtz2/W7g9XKOxb+/9EAWZW5sCyRowSl8jZTq62rJjIsdqjsyuexAhWpxyI7De5Xs2voiIlGepKwn8/KHEB6ptYmG9whMiJmDR3EVZSvUNnb/Kbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHVQTSXz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHVQTSXz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935AB1F000FF;
	Wed, 30 Sep 2026 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790759863;
	bh=NUVdIRXP0NOXY1Z8WgjO8JkBw+8YotZza239nN6U6sk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gHVQTSXz6RHHJ2rqZ1eiN30JNm0jhwVlS+M7Wj+m4kG6cN2GbmTloEwW2kdj9wYMv
	 jAnBOUK8yIJVt5zaRwegUPdXgLQ3Sb0Ra0/Pf7w7kkBmrvK5fT31B53EGNMdnyE/xz
	 u4S9ZYrC31XtsISC9annf5lPRKjqoNb5ovSrOjd1jLq80gEg5GrBV5r3qkhwEvtw+M
	 ZQFU6/NefiVRk7zCpvwrjxVareuqsVNQj/yBHK38ebw/eOOy78cxYdm8CJj45AEf6/
	 oxm8JIP1chcuwiUeIsYvS2IRfWgxVGcDJgcYH6doCOwyERSWyy9coztK/VHd1god+3
	 Ea0hYCKKdOKxw==
Date: Wed, 30 Sep 2026 11:17:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <20260930-striped-copper-cat-7c4fff@quoll>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>

On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> 
> One controller is connected to a High-Speed PHY, while the other is
> connected to both High-Speed and SuperSpeed PHYs.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

