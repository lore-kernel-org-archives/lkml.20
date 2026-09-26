Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C2D1E7660;
	Sat, 26 Sep 2026 03:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392728; cv=none; b=cWgoGs3f88qw3IMv+wFf4c0IuK2QCkJiFjlxLSVHhh6B7fSmG4CMGjhlpqMoowm5RRfeu2B9YiCEz7O6ajnsvru6y6PEhaztPSsbhJZ8GVteTyjdHnrhVwVItC0N1WbMaCM8CfXFTSUd8kXtsDnNC4Bps4BVWQgzLayDd7jgK4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392728; c=relaxed/simple;
	bh=ocgPHKZqsQUJdw6O+zlDwCgGVH62gAcmDu9EME62YhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUKV5MKntr0kG3HKpf11g9xr/BS9yfnG+JC47dlu8oylhmRCDey15ee8BkoqksS8oooywoogTt9fWIUAwx0KMp1MNR8xVnqOxS/6WSfXWFHoM7f9DLUJaDZ/hz4FE7T3mZP9aEB3VELqxzQz7Xpo4LuhU5tvGx9rlwMFj+0oCdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G/ZLnxNm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G/ZLnxNm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD061F000FF;
	Sat, 26 Sep 2026 03:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790392727;
	bh=XqhtRYfHxTdA5AHEl7GWLWSSMjHoYIs2MLO3IJpi5zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G/ZLnxNmeGfBJ4493KlkmVG/cHmt47L9J+GZg+mUIHKpOsJR82n9FHniGutYgqhp/
	 ISs3jmqGb3MRo2fGMCZsXf2AThJkvEvu6E3vs8DUH0AlBvHelzyabWMn4fidvnJepX
	 TWbcsJ++Osv6pDo9m/Ii+BSZjV87/lRS1y4JccKKIrGa2RPYW/XkjzCT0d66eOPfQq
	 jBUUBqa1pJDW1AGsx3+ZuSmaAkOx1nMn+fKwk8lODDgVGxVHKI9YKCLlYpF3mz+Gfj
	 fmKLIPAJR89RQO7bLIO/anVxJEq+TAfBpqbVkhFQAcQ79mURimEPtJrjdThgpd+TND
	 1c7DTRz0FM4Tg==
Date: Sat, 26 Sep 2026 05:18:23 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v15 02/16] phy: rockchip: usbdp: Update mode_change after
 error handling
Message-ID: <lywinqwwm2k7yycctngj7krt4e27dhi2pzzfcb5n4otgcj55rm@mk52fdcfq6yc>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-2-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:49PM +0200, Sebastian Reichel wrote:
> If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
> tried again. Fix this by only updating the variable after all potential
> errors have been handled.
> 
> Note, that no errors have been seen on real hardware and failures would
> most likely be fatal and require at least a full reboot as the function
> already asserts the PHY reset lines. So this is more of a theoretical
> issue.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
