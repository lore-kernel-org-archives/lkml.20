Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED46233939;
	Mon,  7 Sep 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772082; cv=none; b=Dvyq/8obFhc0+p9pkvBt/KJ9jlcTL+zM3616o5QqlIYNE8g5WK02FY1LC+NAynRqP1aHmMQ3khthBHfh+kMtGoq+btbntTrj6Ju0FJZ6SWeMlRACWzXkgLkj3GkxnHfZ2mwjIFb9WIyJCbouyfIzk4eAEcQrwU5wx2nW2rZ1pv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772082; c=relaxed/simple;
	bh=q7WlWi9D8PsT/nEG8iHg2r2iWLCy3k1XcINbOU08wUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XF9KY+G/IFV41z9fD3BEKudOb3TFpYOMOVqWy9/QUqZEyaS/6Z27D1m2rK9WFaAAkh/gjud9k38GnSrqqnlYUW0CSkktkg/LgOty2HFDTYcXNWkBuhdQlCfRRbPkDJPYV4AMGT5gHYMKAs8F6l+bNao3eHQCdVzTHGEZx/TL4g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nw+eWTa+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nw+eWTa+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0C71F00A3A;
	Mon,  7 Sep 2026 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788772081;
	bh=5TCkJ202Ryt7eTJtqCoP5izoMQqliMlfz9Sau6wmIyw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nw+eWTa+4t8PRHpGZuT4XTVwqsvkA/lmfDT/gEXX4lRNpLECchJcVANAbW9R0hWlt
	 EI+V9P3z8jNkEoEgDm4N9/qShPlbZNb/wlbvkNbZAouXuzdrAs7+3xyztpd1PoEIbF
	 hsUrVkhu9+5guGvvG9Vf3LgCFyoeGU2bF0wi4UZCEguymqqBmgciIh79i4U1P8uued
	 XVOCp7azNeX2d984xJRo5ctYTfJ9ziGHKmVICUT0SKMLNhyt7MuhlYKPmnSWolzWzS
	 EW42ijxQruSuu7BPI+kdX7w8C4HB6iwRwADd3Ieoa4dK7NXTsxBU2kPLOPAYnNNBnN
	 VLe6pZHrf7n9Q==
Date: Mon, 7 Sep 2026 14:37:51 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Golla Nagendra <nagendra.golla@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the dmaengine tree
Message-ID: <ap5-53OJe9XYBM7-@parshuram>
References: <apsJ089VAvtYHRpP@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apsJ089VAvtYHRpP@sirena.co.uk>

On 04-09-26, 19:11, Mark Brown wrote:
> Hi all,
> 
> After merging the dmaengine tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/dma/xilinx/zynqmp_dma.c:1171:1: error: unused label 'err_disable_pm' [-Werror,-Wunused-label]
>  1171 | err_disable_pm:
>       | ^~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>    3f30db282c28c (dmaengine: zynqmp_dma: Fix chan probe/remove error handling)

Yeah I have posted the fix on Friday. It should be in -next tomorrow

> I have used the version from next-20260903 instead.

Thanks
-- 
~Vinod
