Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA29B331EB5
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409369; cv=none; b=Qzd0SKGDAsntDHjIC/DzsjNv6nJkDBrFDxs/WtodxNEkXWOIpc70DFXpI1lJOtiQOwELD12bqip7ecPsC5iZhWiZpdjzPXnGqNmRdmg3ek0XytvaLOPNAyi0MUiwkOpAwLGg1Uu7ES3Li4HCZz0XdtU7gnifSHvblnQL0euyiUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409369; c=relaxed/simple;
	bh=UDWrbsWlX7P2kvkIZ3IlhQ9c70chLfuh+pWFDdhroqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOGCzAnMiSlAchoLkU+rV/h4qHTAoTPUjlsr/D0JYR3/NF68GRR768Sgg2GNqKwsvd+E45uLjA6baeehYorhkgDB9yY2zvGIHIBaS7fCX7Pj62WcRlMUE+Gk75+nWXsADZa/eDW7cvRtI6mVSxTX4wGBkXOaYmwnyiOtxxlitQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhiaLJ3n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhiaLJ3n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987901F000FF;
	Sat, 26 Sep 2026 07:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409368;
	bh=W5Ve5aCU1EyBV0r6rgDy9orC+fjCn3d6sZyhy9CDc68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EhiaLJ3nFsoq3nc2vNaeQvVblpK3bFt6jiLyUMEyrNrbuCG741Ku24JsSmxLU5QTa
	 iFz+lnTKL+GPxm7OJkO5ZgxPsca1k5YYRfZIrFLvXM3guAH+yGxkrv0hjONQmGsO2e
	 9qhE7R/0eL2W1wvmDc7nMN26vLShPTrRhqwbDx4Te9+PUfkmQqATQFnqfeDgziNv0v
	 j+dCmgpN+hpGwDAH9z9D3C+7tXjROEHlfv8wgGJLTsc8KuK9VbvE9Jw0NnwURoCnVR
	 u9nyBA+4fLG/f6kIujQavFbhsdR0BI3MxWaAA52TmnEqvFr1f4o7WIPQ6ZZ23g3fjb
	 ws87FBothKG0A==
Date: Sat, 26 Sep 2026 09:55:50 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 2/6] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
Message-ID: <5ajj34ec2wuvlxw3o5zpfbgzea5wzeq44xqhdxcu3aln2zdn2e@extxpxbzoqgz>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-2-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-2-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:49PM +0200, Sebastian Reichel wrote:
> The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
> longer needed. The driver now does a reset during its PHY init, which
> avoids the problem.
> 
> Since rk_udphy_status_check() is called after the probe, it should not
> return -EPROBE_DEFER.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
