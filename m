Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F41396560
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399536; cv=none; b=h8E01hKmKsxWnVk3ZZ34iO3IcRBnpZNUDtD1SuCzfWxrST6c5CjNnA9Ym67I1Di6/1jIVbJfgbMHhqRLd1kmd0jvfSd5lxHaCfM/Bhvge9r91VGstVCCUsQroLkMWfOAThTDdMZse2akF4xJezhzOdqJStm7YsP4kIo481QUzpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399536; c=relaxed/simple;
	bh=Qk6pV1iHkW/sBQcPTMr1Z0loYPrA4pALpkRWoUNbNOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAbYjJsxzRCGPikcNsilPb0iC8G7XxyzDBFOQPbFwvHxClQnFA27EhaiNAa4WE9GPZTBaXdbGxSwbvMU4w2r6T6QOW3Z2o6LslKSUzowXmKozCALDNxBRf3w9/lCOuEby5ygNWyjMxQ/7IDm0UqnczkRwrC20KsD84F5U8MuSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hw8ZU1D6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hw8ZU1D6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFE81F00893;
	Sat, 26 Sep 2026 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399534;
	bh=XLu4w3tZoE/U6Lmgmazw/7zuFC7EGlznuS3/yeMf4oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hw8ZU1D6Yml8tToKjBbk2tq8mT0UgHz/H945Zovmg6ktDWcfJBuV5X9yITN4Gh4tQ
	 HcxSEH1SoEwftLJZjyKTibqObyvPEdUmtXbuRLlvOr05XK8FNnVi1jU4et0yOYsX26
	 n2YnwFgQMu8aq46p4lbRDppXEUFsdAMGVhic2BqoTSXUWoQkKy34wuIukcvoKjBy58
	 7DkvVWIp3Hmp3eZwA7fyh9hWkGPniae2e3cFLLVB1z/yZd9aXMSnQZDtKTdt42h6Sj
	 Ot903xI8WqUwmXo4GHXm92Z456W+5P+WIWgZWYW2vIbW4dybqcJMnBLASxT0KTKjAS
	 VhgvNDFY5aDnw==
Date: Sat, 26 Sep 2026 07:11:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 05/11] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
Message-ID: <jly6x4dqrd4gr24oo5d37b3nx6xizuu35bd4thh7vjcprqomjv@lf7mc5dpmeyc>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-5-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-5-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:08PM +0200, Sebastian Reichel wrote:
> Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
> so that the muxing is properly updated when exiting DP AltMode.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
