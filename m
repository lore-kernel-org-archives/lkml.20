Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684CE2E9730;
	Mon, 12 Oct 2026 09:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798295; cv=none; b=Lu8Z56V2y3+HF8xgOait19jHSTbae7ATc9CX/ujlbm5F5JXt0E5rKdt51eSdnfCqWvCXuR+d7F0hGRBUue9Kmtcxey8puPODIwQEYu/6rxOHfe5enP8kY7KBTT/nWeU8dMK6bpa3OnaE3c4iZB4WUaaHmhr6L+024+7YEyP4uDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798295; c=relaxed/simple;
	bh=yuLT1Aiglo+Ty6j3F8LY9eHFptxWtv6MITN3oVH/yZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rp6bmgZlKJcY3UJJDjfDgtYoj6sCTywoy4zuVvu3rxcxZQQHH827qVL3BT5eAMmGYvma6rgChL4AwQ6YaXdEFEmF9zDhq9UBjnfr40zr1lzGvW5k4Cw7/7Pfi2IAJgbhE5Rm+BFV//u0ADLcU0gvoZVcInKeNi9K46IXpC6FDLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVa/HCKL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVa/HCKL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BF81F0089B;
	Mon, 12 Oct 2026 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798294;
	bh=z9+4BbO9ibDxBWVau+TMbeg/ZMgTtPx2Di1N+vz6DeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BVa/HCKLeVdW5UdRtj2DJEeLg6z1EyDf5HeeP6TLrn2MrtVdmAungKcieZ44zcC9X
	 SSDVoxBpowXpwC28cT7Dm/O/S/xFSbUHk1hVsWMdQdiRcjC5OVTwyEwSaZ1EuJ0OmP
	 JDuV4j+JCgsYz/tXYbevN3zgQqr5ERXT4C1vPCu/g7zgQ4Rr798ZvaF2JEcN0+Jca/
	 nF5Ns+vDDtlcSw5t7NygtlpAK1HUvcFtUf765JFx7KH9tty2xVzNdD90/qIsq+DDpQ
	 esO8rIGHAxNT/p+iH08Zuto19FZBuXVt6mfOw8xTuXa3Qir+dA8PYOjW9VHdg6WeL2
	 9eYa4ruhAkIOg==
Date: Mon, 12 Oct 2026 11:44:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miotsuki Mizuno <founder@crepuse.com>
Cc: "heiko@sntech.de" <heiko@sntech.de>, 
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "jesszhan0024@gmail.com" <jesszhan0024@gmail.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"noralf@tronnes.org" <noralf@tronnes.org>, "robh@kernel.org" <robh@kernel.org>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel-mipi-dbi-spi: Add
 UNIHIKER M10 display
Message-ID: <20261012-wondrous-pronghorn-of-potency-aa0cf1@quoll>
References: <20261010232857.26950-1-founder@crepuse.com>
 <20261010232857.26950-2-founder@crepuse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010232857.26950-2-founder@crepuse.com>

On Sat, Oct 10, 2026 at 11:28:59PM +0000, Miotsuki Mizuno wrote:
> The DFRobot UNIHIKER M10 V1.2 has a 240x320 SPI display with an
> ILI9341-compatible command interface. Its initialization sequence can
> be supplied to the existing panel-mipi-dbi driver as firmware.
> 
> Add dfrobot,unihiker-m10-display as the panel-specific compatible,
> with panel-mipi-dbi-spi as the fallback.
> 
> Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>

Same issues as with all your patches.

Best regards,
Krzysztof

