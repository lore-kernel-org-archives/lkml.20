Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96B2236EB;
	Mon, 12 Oct 2026 13:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811874; cv=none; b=i0aAzidVxxECfwdYL1XPejreux73ZdSP9NqaYH6SbFc3gMYSWQFgwk5MTIzuXR+laqspI2M263lmaE81/lktkZCRJ3n3b+lAG0N3aI7PvxJpr4EXfmhlu6GjNJ2sEO+/eIN4A3/4olewIfcX15q9F9dBOpbWehUE4NWfUBE2TMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811874; c=relaxed/simple;
	bh=L2uLxyB3nbNDBuHEA/c3SqoL0AMTNNZp2OfW4DIyBTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrF2Xywnn+f6rS0th0RRmkXF4cAFh/v7j21jWr+Tyxhz4+7vosSODiKBwWi7+cAA6mLJklCdWYnTuCyAePcl1i4UBQvb6ImJfNellYIHV1GRTnK+ZbmtK3mzqKYjW6T1ZjFPxYrVi8OHYRlXbGpH0hp44Edn5JQ74Yr1/XFioJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfLaY0a7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfLaY0a7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D22C1F0089C;
	Mon, 12 Oct 2026 13:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791811873;
	bh=OEzznKh6oLdoefji5VBpYZZ7u0kzvlI25oWj2c5cmaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jfLaY0a715YYyBz4Y8FEUdgaEJIlN0Carx6fiA/1cAfkcN1PomZuh8+OIxQlyjkl4
	 FBb0wE8uX0zmWGx1/ZUt3GVJgTDjhk2h4OrU1gAYeU2rLDE20YmzOGhvi2ds1wT4Er
	 p28i4cqyKZwF+35+Syn+6NYZ8BjndTFMLAirDda9IHdiKoL0S3bP3iXqbmE0eTsTqU
	 LQqyn1wEZmvvMBkCqvF0PYHG0CxVERr1XWyPz7l5fNZ/KjqtuMvA9+L5AlnFgx2Egc
	 BhD3m+ZZ+ZzcfBC07l47VBz+pfN4DOfIRgyhTUQUv6t3ZHf58AehjcQuz/Gi8VbSB9
	 +fQ5QC35qMxDQ==
Date: Mon, 12 Oct 2026 19:01:03 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Modify interrupt handling for eUSB2 Phy targets
Message-ID: <aszg7Us_ACMMiM9N@debian>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 08:59:04PM +0530, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.
> 
> When a low-speed device is connected, the host repeater drives eD+ to
> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> (eUSB2 specification, Section 5.5.14).
> 
> When a full-speed or high-speed device is connected, the host repeater
> drives eD- to logic '1' upon detecting a K-state on the USB line during
> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> eD- line states, configure the wakeup interrupts accordingly
> 
> Add support for a new phy "type" attribute to be set by eusb2 phy drivers
> and be read by consumers (in this case usb controller) and act accordingly
> 
> Changes pushed on top of usb-testing branch. And v7 is only compile tested.
> 

I believe the merge strategy is to merge all the patches through PHY tree. If
anyone feel otherwise, please yell at me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
