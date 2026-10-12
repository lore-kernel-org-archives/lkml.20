Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BA4908D2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810004; cv=none; b=aoTkb2sH25qX+xyPRvyAy/us4dd2BRPKJu3t6kILJyxk2JAzB2ahssTMm2y6+wsvwbJrJe85luePlPPrNBXuKl6y3/WP5wEO/tk2wEmNwdXxMB1q9bwWJcRzqhtLZBcUnbXJfBfxe6FNVifweU37qd468WhloJ4I/ojf7Ua5VJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810004; c=relaxed/simple;
	bh=YjA7iO8eBQQgnCuoxL9/E6ja9yys3lQthD41Sz5l/mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjkVJmMg0ibcabyNghO4z+enI/aa0QeKZfEP6VwCJ5YG3E8RLxjacmd/8pabwNNCW7AaM7anjx27TPEi8+m1snUShXfVRaZ/b+CsEi2LV/QSi6V/7fWE/U/PhLjGzkWrSwnQEmrOWHJvThTy/7BHSPWB8vwkITXxsmxfYLVvlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=edjxurcr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="edjxurcr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F911F0089B;
	Mon, 12 Oct 2026 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791810000;
	bh=nU5zXdp4N0xFhenVIL2uwUzBmYngblLRRRvslYmnWyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=edjxurcrsnfw+NLahQNJV82rFIsgNG7Y4jvukMKej9ftAbenljtDpnSzcWQuKkZB6
	 srQ+u/FBCJozG0s57ySYxFCnyaVHoDVD1hhyZ26dRw9VvoWNSoNJ93mCXtIltn/ISN
	 N/TWEQhEabWi9r/tg0/yXulWOMg9nzWgH/fno7nX4m/NdagOQH0Hs9PaP/U+4A15be
	 cEt5aDSKMDFEaRl4RsYnxlfHtf9p/CVygP+E8euC8M9km0HBbHJsTOZiNwZ0S63OtM
	 5wfCGDpxVCvACuhyiaozBLnK3KrIMaUEAOV2o0HihzkdcOKBPzYVfKyqJ/TZWCCoL1
	 D4+xwi53q9U+w==
Date: Mon, 12 Oct 2026 18:29:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hongling Zeng <zenghongling@kylinos.cn>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, johan@kernel.org, 
	kishon@kernel.org, rogerq@ti.com, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zhongling0719@126.com
Subject: Re: [PATCH v8 3/4] phy: ti-pipe3: Fix EPROBE_DEFER handling for
 clock  resources
Message-ID: <aszY8qjMRVOjaPLp@debian>
References: <20260909122630.1313205-1-zenghongling@kylinos.cn>
 <20260909122630.1313205-4-zenghongling@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260909122630.1313205-4-zenghongling@kylinos.cn>

On Wed, Sep 09, 2026 at 08:26:29PM +0800, Hongling Zeng wrote:
> ti_pipe3_get_clk() has two issues with -EPROBE_DEFER error handling:
> 
> 1. When devm_clk_get() for sysclk fails, the function returns -EINVAL
>    instead of propagating the actual error code. This masks -EPROBE_DEFER
>    to -EINVAL, breaking the probe deferral mechanism and causing permanent
>    driver initialization failure on systems with non-deterministic probe
>    ordering.
> 
> 2. For SATA PHY refclk, the function ignores all errors to support older
>    DTBs missing the refclk property. However, this incorrectly ignores
>    -EPROBE_DEFER as well, causing the driver to proceed without waiting
>    for the clock provider to become available.
> 
> Fix both issues:
> - Return PTR_ERR(phy->sys_clk) instead of -EINVAL to propagate all
>   error codes including -EPROBE_DEFER
> - Use devm_clk_get_optional() for SATA refclk to handle optional
>   clocks while propagating -EPROBE_DEFER and other errors
> 
> Fixes: a70143bbef6b ("drivers: phy: usb3/pipe3: Adapt pipe3 driver to Generic PHY Framework")
> Fixes: 7f33912d2978 ("phy: ti-pipe3: Fix SATA across suspend/resume")
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
