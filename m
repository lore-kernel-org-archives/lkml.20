Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB233672AF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399214; cv=none; b=U4NGYmDsumVQcz66uJM6FjoZiZBdcK0Tc7rOOSNo+kzkYN1uU1PtQYSLpmEdx1K2imyeuKMLuVaTKVRUnyFfsXvEJ7BOVIiZRjyMD52tlJlIajyASga93yeOVXcwRVgpEQ+OHjRUYXticwoGrzwuMzcAJLywSyJB7YdhXSjjyFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399214; c=relaxed/simple;
	bh=roxLzF+zCFrNw23o1EJlXikbzfzGwWkorTD1IF9KpWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLRITkgDURgzM6+5+HcRZCI2yS3RLFkvSs0jC7Gf9XVTxUd4rLo5h9Hy7Qs6/M1HhdemzJ1Dik08oeT8PHzN4XHlQloIsyxYEtv6J1XK/aXARSg8q+w+OQpQGcbgbISKOQA9vf+yhdpWqnPII0AAbpRGJ/Kw/SDtYfX6a7JDcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQxII6A8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQxII6A8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBF11F000FF;
	Sat, 26 Sep 2026 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399212;
	bh=qA9qIAMmCjARz40JpTVfVIYnp5V1ZghuG0xkDAvl1gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQxII6A84G7BX1W95dZr8YSk/GpL9r3wOZ0CJCl6ye1NEVUs+nFWEeU8pl4/WCzDI
	 g/HMSZOXWcJa6a8SgyVV143dtZEH/KRK76UYLioRIb+fWpLG5dD5wBj8ps/F1yaepO
	 uk5A0UjeL0hDGnT086DfmQzQJuhHk8FYMxzJsYOjFjKZnoYxFH4sqLpV4EJQIbmN88
	 yU9U/GZlnwyFWYL+mBfrSatlNKFH0DuxxsD8HoJyM0H5j0mvC4damy9VmNIlPAvufA
	 2Rb32EKwNFTvrK8Piv3gu/uR3LBgIwzhGsyP5XFR9EOtCR4ZmEe9opH5XG7s9IEO2T
	 rGBQoqJSRGL2A==
Date: Sat, 26 Sep 2026 07:06:33 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 01/11] phy: rockchip: usbdp: Drop DP HPD handling
Message-ID: <tvoejocogt3s5fle4lm2cmlattki7nuzbyl7wzrfnvyn7etqa7@ltfhc3qvjmgt>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-1-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-1-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:04PM +0200, Sebastian Reichel wrote:
> Drop the HPD handling logic from the USBDP PHY. The registers involved
> require the display controller power domain being enabled and thus the
> HPD signal should be handled by the displayport controller itself.
> Apart from that the HPD handling as it is done here is incorrect and
> misses hotplug events happening after the USB-C connector (e.g. when
> a USB-C to HDMI adapter is involved and the HDMI cable is replugged).
> 
> Proper USB-C DP HPD support requires some restructuring of the DP
> controller driver, which will happen independent of this patch. The
> mainline kernel does not yet support USB-C DP AltMode on RK3588 and
> RK3576, so it is fine to drop this code without adding the counterpart
> in the DRM in an atomic change.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
