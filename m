Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D2344C662;
	Fri, 11 Sep 2026 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111286; cv=none; b=PGASzMV4W5JKmf+VC6QnOQFX+Hgr+VPxtfKRwFKa5rUGgIaAUeu/UUndmUgXP/UtNs/t2DjP26yqF7M9icW28zq2DHRoNb/+8VVk7GYiVdNBAVyV9LA6bx3mJg3r1yay+mfLFPNVzzaIWj9R2C+73gwqGUVZ1gy4rjmcTViZM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111286; c=relaxed/simple;
	bh=rNlr3tnJ5jZxFQ6d8h88tXGyOADzGkZQF1pl/F1xmAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFPRyF3OYcjMeq0wUvwGMnCjAIBfLCY8iFWrddzbKLoPdgafmAIbV+RcSHmdyWlg7OIlcZUMQp6ji/g4jD9p6E7Md9KG7v2LyVaX+oFMyzrRY0VylHX5VUAPT8hsCZj0wOVnrZRMgFyO0x0cfFzBx5//gK1X9cA2l8378FGHni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZNUveuZu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZNUveuZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246591F000FF;
	Fri, 11 Sep 2026 07:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111278;
	bh=mhwepqDvkhQvBOfX7hfNjS0pa6bknwpbmJ6wXLxOzNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNUveuZug9anBBVMumZG8RcbFZ4JYSRFDofahuscD2MiGhPSKwjWPapUmaVDzTfft
	 NorvRixBeOL0B/P76Z+QDQji5WSxZ9c3giN0GCVWdiLI78Ji1JLuzckCcGFuQUDKqC
	 JJi4u915+qgHMfKK0YuOmufl4DTVVLUqC2Q41Gv8cmtzxtq8p+sA9ZWG4r3Dgi8TFy
	 VPz6f5MlrT7kZ84yHouK4gUS00pX4Hna8tI0X3xgPRb5stI+mOYfMmlYWOw8cUoD5h
	 XNV1HOl4RBv19EbttmGke7Py0WROra2ePMwL/XFUjrWv/pkiJP7afT/JlsXptXNu1B
	 UJrWWqDDHlRIQ==
Date: Fri, 11 Sep 2026 09:21:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: usb: add Altera Agilex5 DWC3
 controller
Message-ID: <20260911-nondescript-toucan-of-perspective-6bd8bd@quoll>
References: <cover.1788886615.git.adrian.ho.yin.ng@altera.com>
 <44ba8639fb41b7c576c0795cb1474a6797754600.1788886615.git.adrian.ho.yin.ng@altera.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <44ba8639fb41b7c576c0795cb1474a6797754600.1788886615.git.adrian.ho.yin.ng@altera.com>

On Wed, Sep 09, 2026 at 01:04:37AM +0800, Adrian Ng Ho Yin wrote:
> Add a binding for the Altera Agilex5 SoC integration of the Synopsys DWC3
> USB controller (compatible "altr,agilex5-dwc3"), covering clocks, resets,
> PHYs, and optional IOMMU support.
> 
> Clock names follow the snps,dwc3.yaml example order (bus_early, ref,
> suspend). Reset names use core/ecc. On this SoC ref and suspend are the
> same hardware source, so the example reuses AGILEX5_USB31_SUSPEND_CLK.
> 
> Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> ---
>  .../bindings/usb/altr,agilex5-dwc3.yaml       | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/altr,agilex5-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

