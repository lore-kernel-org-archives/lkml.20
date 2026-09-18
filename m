Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D55513548;
	Fri, 18 Sep 2026 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789748573; cv=none; b=GhjS8olEhQQJcw2GiSFXJaOGHXpZrrFfabBCmeMGkM2JBcEuUzIFTMVOCDLIOBDSrIXF6cmW4qZOAFmEfomo2YMeVvf7J+gTLQIA7reDnlB4t74+cr/dUsVeXH+r8dcFE/0p3I2DUyYtRpENTtBQEyWBr9UT+uZoUf1OIMcRqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789748573; c=relaxed/simple;
	bh=JDQ+0Gqq6WM4dMOdPsbqnatpjmO1zhCNNnL8myXw6VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pEuchNr/2vk0UdiBS3jy84Pq/K5jZ/ukhzON46+cI2zSGz/cHfZ2DqcF25Hr4CpjvZjEOmKWWl+p0nzqgkFXaewU1C+NuA2MA+QSTffL4fXE8rNvyOl/2JbU/2Iw7NxMBqB8zOHSBGgWCJM5DXQ4drQqw+/+O+cehkulAoYQQpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLDStvTm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLDStvTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E731D1F000FF;
	Fri, 18 Sep 2026 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789748563;
	bh=XjS/yR5ZDGuvdSng7HzHCJ0ithorUF2UJTwkVe8gYNU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NLDStvTmeSHRp1VIgnLnn59EWb123XQd+LTx12RFl7fRrkCdd1QOye2u+9RJCfY7e
	 429G8ZM2IJ7V6fpPcZNCbLUsbrAz+obFuMJQ35Fl1JWTeDSxdB/mlrS8C2aLpvgasG
	 ZD9wV0lA4BhiuOCIjva2j/GsZVMaO4dC4lFiPaTTRs+lOPPYQKb28h0PcOB1r7iHPn
	 ExPDEWvek/mlgd8zz9SnS1TowU1l4oY3KO9pnJrUhM2Dg2m25x3dhjL6CaGVpYgAwb
	 HKVL6LtQWMkIWkbiep/jqerOY2Aiklsh36wZgpyegp76COFTl7M3L3k20nprV/Uhjz
	 0l9n5jF3ro5pg==
Message-ID: <02d94760-6e5e-40cf-9354-63b9bca5d682@kernel.org>
Date: Fri, 18 Sep 2026 11:22:41 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] arm64: dts: intel: agilex5: enable USB3.1 on SoCDK
Content-Language: en-US
To: adrian.ho.yin.ng@altera.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1789114403.git.adrian.ho.yin.ng@altera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/11/26 04:09, adrian.ho.yin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
> 
> Add the Agilex5 USB3.1 DWC3 controller node and enable it in host mode on
> the SoCDK board. Place the controller under a simple-bus with a 40-bit
> dma-ranges window so the DMA/IOMMU stack respects the interconnect address
> width when SMMU is enabled.
> 
> The SoCDK daughter card only exposes the USB3.1 interface, so the unused
> USB0 (DWC2) board enablement is removed in a follow-up patch.
> 
> This DTS series is posted separately from the USB bindings/driver series
> ("[PATCH v7 0/2] usb: dwc3: add Altera Agilex5 DWC3 support"). Depends on
> compatible "altr,agilex5-dwc3" from that series:
> https://lore.kernel.org/all/cover.1789114385.git.adrian.ho.yin.ng@altera.com/
> 
> ---
> changelog:
> v6->v7:
> * Split out of the USB series into a standalone DTS posting.
> 
> USB v7 series:
> https://lore.kernel.org/all/cover.1789114385.git.adrian.ho.yin.ng@altera.com/
> 
> Previous combined series (v6):
> https://lore.kernel.org/all/cover.1788886615.git.adrian.ho.yin.ng@altera.com/
> ---
> 
> Adrian Ng Ho Yin (2):
>    arm64: dts: intel: agilex5: add USB3.1 controller node
>    arm64: dts: intel: agilex5: remove usb0 in Agilex5 SoCDK
> 
Applied!

Thanks,
Dinh
