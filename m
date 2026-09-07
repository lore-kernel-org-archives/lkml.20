Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8736A218EBA;
	Mon,  7 Sep 2026 06:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761496; cv=none; b=f5rBBOC0s9uCIPpZYre1/89C6DS0rC226CZd2mFjaByuedl3jLn6H6MyEOaGXQaLLhnG+gBjbTBYykqp66tMCzGMB2pQagaav/1Al6YwtD6jaH7fi6IgD1Dpn3k4YCWQgyIv+kdXsxmm1HOOPN1DmfJzWBSbe5BfScZ9GTXcXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761496; c=relaxed/simple;
	bh=61hB9cxxq3mtrL3ltd54ynmLiMeeE/6do4NOd49hSDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dcjnVnKKG5v06lFxD07wyB8atvXYGRHf9oOhy12GHftYfrc1Db54Op477pxuIUrWzjaU/jx1i7Kh3+SSMB+gGRkswE4eLi0SYP3+u5yo7zaeRWt0+OE4qQyyh/VuJvZV///t57iUKfihuLHbsnXG0vkT17FfQgO6/XuymNZ2eBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HmUpl+lN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HmUpl+lN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB0E1F00A3A;
	Mon,  7 Sep 2026 06:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788761494;
	bh=Wsa0JvYiMJouozjokH7geLU1KfAK+7PDaBgcVar9DPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HmUpl+lNjFYTm+p0EQ0CEekie38a2gVfgDe/BSEQF3Frn1Nu9NjheKIUfTrf5kb8n
	 ivCeG/KbcxDFiRIGBwKKGSDDIyotNUCgVuXKReLP/nzEoNtaZvmoYoq9AHOuJjosXg
	 EDXYxk3lkSbZpOjfYFGeub5X4K+Dk1EZMg5I3GFQ2Au+ZkC+yC7D6JX94E+UcnH5qU
	 t7GJJoJyLkAlyjmAllFlDITC8kv3Udt6M+txPWKH754MX+2kT2gE6Jr8U7Fi98e9/q
	 bA8FNDKeYQf2ONshunRlj0RrIcxHfq+iUiK8bHa+FxMu1RWFsqEGaBfH4oli3ocPNf
	 nbmEvqHFKiJKQ==
Date: Mon, 7 Sep 2026 08:11:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Abel Vesa <abelvesa@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-phy: Make resets
 optional
Message-ID: <20260907-busy-sensible-mink-c6b35e@quoll>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901095055.42229-2-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 01, 2026 at 05:50:52PM +0800, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Not every instance of this PHY has a block reset of its own. On Nord
> SoC there are three eUSB2 PHYs but only two QUSB2PHY block resets:
> the HS-only USB20 tile has no dedicated PHY reset and is instead reset as
> a whole through the controller's own USB20_PRIM_BCR. Requiring 'resets'
> makes that instance impossible to describe, since the controller and the
> PHY cannot both claim the single block reset exclusively.

Reset framework supports non-exclusive claims, so that is your fix.
Sorrry, but driver reasons are not proper for DT.

IOW, what you are saying here - device has a shared reset, but because I
wrote drivers like that, I don't care and expect other driver to handle
the reset.

Well, no.

Best regards,
Krzysztof

