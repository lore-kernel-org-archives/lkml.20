Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A83272E56;
	Sat, 26 Sep 2026 04:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395426; cv=none; b=TTUOIj9UuNVjs6qfIJCCFEHHCVn1wb5+AqymumWeqqJC+Kp4sIQ0wGZPUQ+xacJUiCzXy0xGdixCeoAzRQU+N8NNKtcbaPNWtU9k2swuxImQIDiXA3Jd8uQiMu5ZZ9I7KHIgcB31a9OuaOFHG/Yd4W3sP17jx/Oig2StmYJsKz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395426; c=relaxed/simple;
	bh=7Ct1YJonnLqq1btB67/JNbgOj4OTqxXqcm+es2sWijE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5kUsjU9ZB75XId+2VB7UGBwOwo8SV4o/aGH8TazUiy56seppiaNRCXmWtvZ56ijt3/PU9UI4dKq1sL4+Tmxb8B4YCgqIfL41fuPr0Ouk9rTuSqByZPDdZPIJeECQifdXVVoVRewM1x/95ddM53qaHgQOlfVCZijSdQj2qh1+tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJwntA0Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJwntA0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB071F000FF;
	Sat, 26 Sep 2026 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395425;
	bh=Ez96NEwvtT1k9tGbEFCVRqt3OZGVg5le4zsDZGm02ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJwntA0ZZjmKHhtCfYKPc1LdDWePisGyWu8LaXPwzLQ4Pfts2Xg//JV1tbCUu3BsV
	 qop38+KgeqO3AENA5+YDBY2UVXMb7iMwLCFaiyQlKE6EO2ZrR07dc4fkC1eZp+JH2v
	 pHaAZos4DE401O3IAgWfuidm7tqXPy8/aa+Bris7KcAYiuqn/saDuRnuqHs68iWnro
	 MfuSof7ZmnjBSVZww9WmbvKE2UWTSVwiWARhSVmPjQGDRwNU9pKFOTZzncjIG9oCo+
	 rQZWESHElx82csYwiw3KEFFE8IdJrEeERI4EJm2njWFBVjoN5HhZMT8yNraHiLaeH8
	 iXG1yAE6+ulRQ==
Date: Sat, 26 Sep 2026 06:03:25 +0200
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 11/16] phy: rockchip: usbdp: Support single-lane DP
Message-ID: <2z4yirs6dzf34ajrc7u4gv62v466iusxt6lqam6zjmxmbutd6d@fwdwmcvtiv74>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:49:58PM +0200, Sebastian Reichel wrote:
> From: Zhang Yubing <yubing.zhang@rock-chips.com>
> 
> Implement support for using just a single DisplayPort line.
> 
> Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
