Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C1B32B10E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400223; cv=none; b=ow2Xo2wyA8T1aqbW9bXZyqk/Kp2hFvdEXGp/DCFXl7Oc12Y0f5kS/V2F64ivSD8KmGl5hh/ZUWoW0+dqh8WYCGUVLZ4jS6Fhv0J6/y0zeBZWs1x4KVR6ExDyeFgQ+QAB5vT4HDWrxiWB70N17DcEwUSf7DorEQCAyt0+oU+CHk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400223; c=relaxed/simple;
	bh=+0y5wuDSLGli9qLrJnU0rALlvpYLEGiXlkOQcWvM+y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3gxduWS2uZx4ppoSioJP/D4s7w71pYkNHzOFN/wOAOxtesGmXYQWcnQUFhV/5HXsJJI5NqCyKSZ+kFLjteTgjAnuvEl8tZ2QYn8+Lj7v5CjHtt97Id0iFoAwTN5jenvMCyw+dymEQ85Aad0u8ri8TEdQWJqKWJD8vMPXbUxXBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=da4X7oGH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="da4X7oGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D9DE1F000FF;
	Sat, 26 Sep 2026 05:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400222;
	bh=Fs86mSw57dq+/rdX8lcMX883ksi6aUdvw3n+ATyGask=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=da4X7oGHdG4/YsqtXt/fW30+txiAsXQFf0YpnCZL7uLkcnIeH7+hAtCFqFUzxXKaO
	 SYZ3SzNcKm6lK3HB2Z/VDr6hr8fIxVDwipRgCnqNMTRAX37n5v0127K/rc8B5glCw3
	 3gGGq1ad6pX1eb5mBMC9z9Jf7VA7xDoW4D1/D1t6+qtF6EFu1ORXGlZtK95nMdfbpv
	 eoXxn1CCL6X0bGUm56ZJI2tdEOJL7A1m/R5y8VNI+OloW4lVzFdn9GeIOoHoP5q7WU
	 ACuvM2GjssogUkez97vvuG8f1hGZs6dT3fNvbH7lI3lvssckYIDGjEo66fxxkW+D96
	 Snql6kfCyvH2Q==
Date: Sat, 26 Sep 2026 07:23:27 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 10/11] phy: rockchip: usbdp: Handle
 rk_udphy_reset_deassert errors
Message-ID: <zkeoutxzqdw63u26ja4fm3yychnp5hyiohsurtwdarcjtdiunq@5r6ll23dokgo>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-10-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-10-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:13PM +0200, Sebastian Reichel wrote:
> Handle rk_udphy_reset_deassert returning errors to avoid theoretical
> (Rockchip reset controller driver does not return errors) SError.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260626211151.2332F1F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
