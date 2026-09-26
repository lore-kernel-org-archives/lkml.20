Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B745562E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432293; cv=none; b=oWFZLAPcM3Ng/p5gbp/6SpH8ZoChgSRb5CKX+RSW0U87GYWgxxzP5uoN+w6q3YDyKcUOtfSpEmRIfpoRN9Hx8zB2JX4cFN426b6741GAS0WS8mfQF/bIp8ddTH9NVfV1XqnDqYGy+UYxRAUj3yapBJCxd/3kY9QIRmJv+D0S1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432293; c=relaxed/simple;
	bh=JYpQFat/zNRYB89Ygzih46lFe6BcWarI1xsMR5ShEWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG+JqmBxv7R/UxugM7H69kgleXoDTWh7V3/0M5F5nnkBkhrSorpmQLqUJCRlzFxSxhuTql7JTfrVihgcDGRK20HwubuXu9JRinrESclOSaxDXfB19K6LoVMpy7ztRBWmiuiShesMYGA8MO8w2uxyE2xfRKKDc7ZsbiVIxrsArbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRdxvFDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRdxvFDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B621F000FF;
	Sat, 26 Sep 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432287;
	bh=fvR+VMPQke7hzyVupL3yYsH+elLidJGF7niKtW4gOgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dRdxvFDYPbI/TnU5vmQeAUexEDPcqTR/hC6wjSXYqx1PuvZuUWJPfJnODjo6t0TVP
	 90gvkTjvvQNUWT8bebRiOx66HiF3ToTQHUx6717aG04AaMZfL21OKpdHKXoJjTpSGI
	 EhpUYe9+jMncDPfT0qokEJ3wfXGabE8SN85l43eAtiqQ3tZG+2QYVPB4h9M7ncNdFV
	 QI/lGpRRfh2CA+6SwhydA2a2KwachoMy3/bISdTA3p6fsWLOWE3/KW4ckpGiX8QzxT
	 wesBDAUYqw9vNlmD6yHiBVO2D4z2EZPsEXvCQWZ4CvpAs4weWBw1Fy1WyEzBeRK7T/
	 1fhZKt03NQq9Q==
Date: Sat, 26 Sep 2026 16:17:55 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Akash Sukhavasi <akash.sukhavasi@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: HiSilicon: Fix error handling in
 hi3670_pcie_allclk_ctrl()
Message-ID: <wergc4zb3ciedi2mqudbo5zi5mo4lricjswukplt5aytwnholl@6xmg667oqynm>
References: <20260708-b4-hi3670-v1-1-f9236f3e585c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708-b4-hi3670-v1-1-f9236f3e585c@gmail.com>

On Wed, Jul 08, 2026 at 04:31:00PM -0500, Akash Sukhavasi wrote:
> When hi3670_pcie_pll_ctrl() fails, hi3670_pcie_allclk_ctrl() returns
> -EINVAL directly, skipping the close_clocks cleanup path. This leaves
> the PLL with its power-down bit cleared.
> 
> Use goto close_clocks instead, which disables the PLL and propagates
> the original error code from hi3670_pcie_pll_ctrl().
> 
> Found while investigating a Smatch warning.
> 
> Fixes: 73075011ffff ("phy: HiSilicon: Add driver for Kirin 970 PCIe PHY")
> Signed-off-by: Akash Sukhavasi <akash.sukhavasi@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
