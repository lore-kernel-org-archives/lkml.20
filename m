Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5D4BF928;
	Thu, 17 Sep 2026 10:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640098; cv=none; b=KxncPEa8pAhsTiCV09Cj4Hip/KfwRnHIzXpp6TtPhOVWmrp9ywst/WA7yMW6Oh6NyWwqvcs6R1xiFh86JC16cGYU8fnRN/XjKF+gPOI836lVNVBWSkDa+hmY+I0qi/YcvCw9G3kfsmOEGxV+I43Uhw5AGSJGIvi5IQGealbJ/Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640098; c=relaxed/simple;
	bh=1fm/d1aRnwpTbGxkYjOMLQ4BF8Pg5rVXwMoLdO0HfTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0ss0ZbAMBDHnCk8/eRh+sUGvjgYKfUm9EhTfc4ExTYN9z+Q/5b2bV44EdzpUpHV2bihfppGbTTsha/7YoE3qBrmDBBtXwSqWQjaU8STEGHkhYQfh7O+Obvdvxa9/NauV/Q47Pne3MwFrS631zJKgkPF6ceLlRsq03A+94CGbbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=L5YAVrBy; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="L5YAVrBy"
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 2ABB01FE13;
	Thu, 17 Sep 2026 12:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789640087;
	bh=nGPRaq4S9vBbBXygDE+rIZJwB2PXwdT9MJwWrz7C/kg=; h=From:To:Subject;
	b=L5YAVrBy9vjQK79Gcib6ggUlUrgChHV4fbdQYS/TYijiWzWWXK330qxETGm7RjHLw
	 EGOg9v+Xpp0BPGr39yYAw6UWI9fmaXt0wMhRau8GLwNAkfRzdfBLEay+V2+C/PUPa5
	 8/xaXTJJWwZXs46VI0syXJrFobp7khqPbwHmhJI8d0I4vXGe5MYqNtViwx8KkHmOCn
	 wYA4RN7BbO0OPcr8zV/czEGeHyu93zbia7Otyfo/cZHyS1S3VgPbeD4dpKeplbJgpI
	 hxlfkQT97EoN3Ebk7XpGWM36RdnYYtP0/dwEn9q6w73dOk52dSzhWWskZ0ckQQYnXr
	 +gL2ZacWde6Bg==
Date: Thu, 17 Sep 2026 12:14:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: Add Toradex OSM iMX95
Message-ID: <20260917101439.GA67500@francesco-nb>
References: <20260917094217.59508-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917094217.59508-1-francesco@dolcini.it>

On Thu, Sep 17, 2026 at 11:42:13AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> This patch series adds support for the Toradex OSM iMX95 SoM and its OSM
> Development Board.

please ignore, I'll send a v2 shortly :-/
