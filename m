Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C1396560
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399617; cv=none; b=i1lOgyarBDmuJcPYYxvC7KoMg7yLYvqC3QWjWzyEfCvU8aqmDxzPuRcurMtppOeB21gMtkgkf4a+QadPkfB+KcI4NJQy5zALKAeXf4z6TofmSRbzQgwT2vZDLAhOTA2HTY/GnOcGZLmxM5Ce6Wg4fZLRj9Zsd/yNIhUlPwJ7ftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399617; c=relaxed/simple;
	bh=lwLNLMy/oD6BP8G8IDvF/XMkeC6CCxXdd/dUgIg2KUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qJ5r/8wXQ0WcwK4zw+gS65wU8iAicA5Gizz52DlsiaKG+BtUIeA+AosKoRpYDrtCKPTwswnGBwH4v3JgruJBw7L/Ey3X5Yvn9m6py6nABgm/rK8fm4pX/76jcCkKp0AgoM9a6tVygRhXTwO7KxGWMidixq1QX4e58JcyKqe50B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVxax5kT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVxax5kT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7451F000FF;
	Sat, 26 Sep 2026 05:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399615;
	bh=hTWY+ooeNyiWZIlbNSBvzkPlMs8bY8Uu85Mi2iBSvHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LVxax5kT/EzQtUTGTVG5vpA/i4KOytJk1FF2VhUXhkAW/nkpogLL2pYjoFlQ4/Ypz
	 zPE2jU2PiFP01y50eO71hA8feriHgFOdzjo1jjKKL7F90u87/Q8AhCwS2jvtfKZ6ux
	 WFewFyTOWEcuuT3WqAsESO8ZGp/XLeWqXKBnp9ZwnSgxon26p9oHGc82DbozyW5JXq
	 L9AlHoAKBinszf00wj0114MH+/OZEJSUAJyRO7qTg+FMIb+byx3Mu8GhgEhaG/5tAk
	 L0EJo6CCGrWFMYkQmp+JLQXjZIP0kYdf1C5p4sRwKi0DEVL882qMnJdNrqY9YK5VZD
	 PfVrIgl09/VrA==
Date: Sat, 26 Sep 2026 07:13:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 06/11] phy: rockchip: usbdp: Use guard functions for
 mutex
Message-ID: <36mqzbbbmgtvj42n7aebleyk5cl5ydnciuxdoxbmyku2f7mkxz@7q3djm6bkrzy>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-6-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-6-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:09PM +0200, Sebastian Reichel wrote:
> Convert the driver to use guard functions for mutex handling as
> a small cleanup. There is a small functional change in the DP PHY
> power up function, which no longer sleeps if the internal powerup
> code returns an error. This is not a problem as the sleep is only
> relevant for successful power-up.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
