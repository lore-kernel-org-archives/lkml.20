Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2732E762C;
	Sat, 26 Sep 2026 04:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395603; cv=none; b=APmEiFHsQJc8SJgefYaPyEWW92cIoLaMQI4/rAxCLsU1yP+sgEf/L7SXxdj1wBRKCz6eQDCtd7DSL/La9EFlGzHeEoWg6Irf//faTdNAU8Oiy4yyUcu93yo/aTyo4zSUKVOc6bvBGr3QoZEZbMhzsoByOPdjbEJzcpgRpmqqIiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395603; c=relaxed/simple;
	bh=5InOkaH8MyIQ70oC26H0nvkawvfbYvUgIJDolqqj1hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDX/pPapZNq1xvN0M0DQEGaUASiATeHJi5bgTulptoSaK/589L72d+47571rdH20fzsGUgWbIcBsTZdV4XTFlEkIg+os0J4AkahoPtaqOlYuIag0RK36lws8y3SD29g0wCy78uc0yKLj4963PSLrinU2k+wc9YaoB29gnacCfpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJu+a058; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJu+a058"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745B61F000FF;
	Sat, 26 Sep 2026 04:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395602;
	bh=nxfWuHGoS4AD08RES316n80ZMluVFGGsrpPDIgi9EWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XJu+a058PFy9AuXoNx2lJIIXcpKT3fHF6QBAJj/v0wp5P+Nz0JRMJbldY9RWwFrIK
	 oKVn3VZuRorua0NW1T5FZqDwSDJuuq0MMlCjkqEgspsvOl0thUe8+adh+IAHHR0tWJ
	 Kghwxgyjyy7S/93Vu8sKh2FK8UPE2Hdk4LKg14j2SW7x1FbK/r6dk6RNJixi5JtHbN
	 PsZuu47kxAJ6vXgRz/76JZ3rVQH4/ZLpsynTmse6449dxcksS+1a4f1rSGcyCKnOjW
	 FFDfbdKFBEXdtqwa0ynHpSYxaiFzH/vy0T3wKx8PHJVTNOS0HaqY4tz7HT25ux3NjX
	 0KbaAplpZfkpQ==
Date: Sat, 26 Sep 2026 06:06:27 +0200
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
Subject: Re: [PATCH v15 13/16] phy: rockchip: usbdp: Rename DP lane functions
Message-ID: <btcylnhxrbd5ks7wt437ddisiiktlqmr3zuwt43otydzd2vse2@7ydv5pircguh>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-13-80e2c11d1ce8@collabora.com>

On Tue, Sep 15, 2026 at 03:50:00PM +0200, Sebastian Reichel wrote:
> The common prefix for DisplayPort related functions is rk_udphy_dp_
> (with a final _), so update the two DP lane functions to follow that
> scheme.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
