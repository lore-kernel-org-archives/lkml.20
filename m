Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6067143A7FD
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432398; cv=none; b=QaAp61VYUGMLd8Ro4J4CflxYXCjjcAahRXsccudvQkYjRx11+R120xi7/diXZBYdt/XA13vLCBUOHF6otvjqeSf0yExutlb9EnPQf+PsLLbvVEXs1NwrXWD+WTdkTwUxgdMRXDpaZG6g5Z1tgW5jexLYriHzl23xQ5AidJ8K92g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432398; c=relaxed/simple;
	bh=2gKG4UJbGoSN3jWQB8hdBachc/sVmKDwWAU/P6uyNvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhU/UHGYhkPrw0zWroUhQzEQIXEq/lD+ndNLgoYqxDL2Qb+qwffs2mF8M/3jQgsmOnQ/l3YtmVjqL5UjOgyOzIMWUlhgj+C04smgvwz+ehKPHLbxeGcRwOdlTrZ4MSub9tX9mrwwzyi5ND/4zNpZ6MupYw4XWjX2kmtAK8+GmoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OHKLOpyM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OHKLOpyM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D557E1F000FF;
	Sat, 26 Sep 2026 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432396;
	bh=WstYARRHn9ZPq1+nz6jOBzDzED9g5UXV27FiviiVoWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OHKLOpyMkis7lDS9EKv8y0gEmDo5E+1x/UstPIQ8QNm4BKvZLBpJ3uda7a8qoo43o
	 tyfEDk3gfuMXXSzsSUuvmi9iepVQ65vIzFS1n5jpnAhTkLkJP9/oIeLtCyprH70miB
	 73Cu8hRZg209NCWqYvBR+9buJN99Yc7NpxaH7BpkWmBOJx1LqPsg9WOwWzu8rf5/tz
	 cQ7HMHHZ3EOPz0VCyuUoOInSP3BN4yhvudvycrMeHMTeDBSeaqWkq+yeuvdYF1giv4
	 i7fc4D9Aru4ki1xtMJma7T7lem6jc0fnWgf7GtDsmSpS++wWd1wwFgvdFBuFaKH+mi
	 tmjlYgp9A/Frw==
Date: Sat, 26 Sep 2026 16:19:39 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: nikolai.burov@jolla.com
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>
Subject: Re: [PATCH] phy: mediatek: xsphy: clear U2 DTM0 force bits during
 init
Message-ID: <6tee7zkjxpm2pzr6hjngicb2h67runsffjajtf72qtazmf2zge@xd6rndya4wpl>
References: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>

On Sat, Jul 11, 2026 at 01:34:46PM +0300, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> On mobile SoCs, the USB PHY is completely powered off during bootup.
> As a result, various bits in the DTM0 register are set that prevent
> the USB 2.0 PHY from functioning. Clear them as part of the
> initialization sequence.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
