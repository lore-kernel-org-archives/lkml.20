Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C113776B
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409444; cv=none; b=DkorLBZ2co8EYnioIepFLKvt6GKF2Vg3c3a69K5fVqU6M9R3grEEyM3dNKuuFeIu4eXpSGZihtAR0CbhFqxFHtjAwxM/lAZsSGMTUF0N3MXbsznxjFdNSro5mfvidpXyYs1ht5p6cHX7T3AMkWbb9EMgvc4MVEr+INkHyn2Hoi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409444; c=relaxed/simple;
	bh=t1figCNUdKaBTunZja3X5ZY9RM+ewUCqWgQozMH6VNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0AVVsN2UFNVm5srIaWbZmnkRYa6hHJQqi1qZqn1bP5o+GqGr68+vnX0+OjYIa276rguNMfHkaJrV41f+n1Apj1gCNihFNBnsqbYCJoGmN8l7kfZXFNzxzQVkmNzDrl90YXFuMY6nJJQgxAdio7jFAsTvmaGuegLk8QgwsLADIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/RiMpMB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/RiMpMB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87EC21F000FF;
	Sat, 26 Sep 2026 07:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790409442;
	bh=48zWiXtDbWWPdN5dNR6DkzojdZtrw8czYNDIITV+eRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P/RiMpMB1uJqiNWk6NfX+xLtn8IyNqDitDt0z7qXTOYFszs71G3Vt3uNHlO2aZ4Q6
	 OP5OHy+OPAibZqyoWFVhq8rqwmMndoMJ32P52Ukx8Wk49HLvaOCx35+IBDEnDSLYHe
	 XMdqCvZBCgInhXjEVrC9YU4gWX9IpU1Js/P5va6tGMMM4U+5mdLbI1hZr/Pwsv/RTz
	 QQGyX6lcM/GG+jKfDLBWA+nYxwBVX/OHBcSX8PyUdSMlH7gvEGOqB9O97WtGHhSLn/
	 +WC35Y6QpousRlaJVak5IP/bnodNx65T7t38PCN2ebOSegLy7yjhwLVpqljI6RjG3Q
	 R4w6sXE8CJUJw==
Date: Sat, 26 Sep 2026 09:57:04 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 3/6] phy: rockchip: usbdp: Rename mode to hw_mode
Message-ID: <tdedujt6ngogtmilpfyfo56bmj2y255ayx2tinhylnstjxbtlv@6r6g7qzasefg>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
 <20260915-b4-rockchip-usbdp-cleanup-part3-v15-3-9ad90a456953@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-3-9ad90a456953@collabora.com>

On Tue, Sep 15, 2026 at 05:32:50PM +0200, Sebastian Reichel wrote:
> Rename mode field to hw_mode to make clear that this is the modes
> currently supported by the hardware, but not necessarily requested
> by software. I.e. it is only set by either the USB-C state machine
> or device-tree if the PHY is used in a fixed routing setup.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
