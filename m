Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD638333F;
	Fri,  4 Sep 2026 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510597; cv=none; b=m7f27CqVbM7mhccWTa4sKtZJPMHBNTiWFPUksVQjYUmuZncxG4bbdRskVlVCA2HSDVfFGRX35Vi/w8QbGMUobJa5ihDomRfgeD+2RrEZOmD1M65lBuNgUD+q4GlnYIiGNLEc5f9oXW1MOr8iIxI4nK+PuMso4MOG2TWa6Duyb3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510597; c=relaxed/simple;
	bh=a8lJRFW2pSHST7KntCzdDhr8+8DhyXVYyA8zQrcZp+4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=THtXILvqiRlCNB29bF1k++tSe/jYlzlHDjjiHubYHma5na3Hw4rhmqTln4Kfgpong11P1GjTxATPir+spqALXUfPEdkLHWW1XCi4Yy/gCghb2vcvx1j9PxIpvPAmgKHrSB3f2vdeBZHbOG36nH0ts4QwuLz4Tab+Tffh5/eNquE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOQEwmmg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOQEwmmg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5147F1F00A3D;
	Fri,  4 Sep 2026 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510595;
	bh=Hf2+Ic93e5NS9F8YWg601XTrq19GOkYx2bwFIAfD+Rk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=IOQEwmmgPFvVH8Lb5FfWv7nVkg9Q0tplPkuN+phV0vJrNgEN4v6VYVSDodxo96ZCD
	 lTgcQ0KFoK2oP13UYjYBSLrmYtFAoQ39pJFPOkrY4G+aNEaYUO7lPjRfOI0MQNjac6
	 OD7sXULWhSojKhnoTD88Ob5gMdfjI3Q9ssVzJ16OCvGbaz56qY9LuZaFLqgF0PH/St
	 RTZbgEOAt633G4lO+vuXvWjw7VAkBq+WstleW7Lxl5Cwl/gLeOJzcpcoUxSob7sfYS
	 v+7NiZnvjHePwFascVaelX+vjIDVzWMx1nuskzELBg4hnZdOM2oKp+IDkxRJ5r7gKt
	 QXiEF8E4veDOQ==
Message-ID: <e43d4e34d4a0f76f78877901d53d2f33@kernel.org>
Date: Fri, 04 Sep 2026 08:29:52 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 06/13] drm/imx: dc: Add DPR channel support
In-Reply-To: <20260904-imx8-dc-prefetch-v6-6-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-6-26643e3f6cb7@nxp.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marek.vasut@mailbox.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 4 Sep 2026 15:54:56 +0800, Liu Ying wrote:
> Display Prefetch Resolve Channel(DPRC) is a part of a prefetch engine.
> It fetches display data, transforms it to linear format and stores it
> to DPRC's RTRAM.  PRG, as the other part of a prefetch engine, acts as
> a gasket between the RTRAM controller and a FetchUnit.  Add a platform
> driver to support the DPRC.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
