Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790A93E314A;
	Fri,  4 Sep 2026 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510819; cv=none; b=bZdV2nTK7qNO5AUpSYRmTGfbvhaSXT0bScs1p0z2orDcc3mW0ZCOICvsde9m68mBKgK+z8fmMn+gowWeAFOLjGTv5XRwgTdNFjqKGyq8sY9ngpdN8RqtxT+NL3IncijZSWelFYeJ424oAM9qwuPhCKeqdRJfmKhkSqPzdIoaNSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510819; c=relaxed/simple;
	bh=dFw3z0/sIfx3vhr37vYFD7LfAkAR4l1NkuW0wjQkflk=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ZhJssfHoYnzTVldmELJm8NvnXRpC1Ea70ldPqSqAPQ95i+2h3IvH5sXwnhYY0zBHGStp86CgjC+MJvevHVOfg77dbscE+cJKONsT0RMn0EzMHgOM3nwPGFiZPn+d84jQwBs+o6Q9i7kObsVtXeghuqbnDnnaxehep7C70wPFXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qci4M7Wt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qci4M7Wt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E66B1F00A3D;
	Fri,  4 Sep 2026 08:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510817;
	bh=X4Z6MJ4FHDOo+ua31CwwOshxKOAHbjBEITZiAmaUcR0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Qci4M7WtL+ZYOzRiaD+cR8TXdQnIvYswgC44xstV14M+8HuSutOfQGiI4/AqQwD2Q
	 lUAWDo7GoqQd67vxF22kY3Q+N9xmm+vATvSKRPebIo+midNhysH5dh3kuPBmr7e7EU
	 wQBs/qq3dV1JPkdyuoT8W39Wz3zox4NVaubWy2i4LdTH48m8rQHoPd5ccKdl8mW5yp
	 hqtARVKRSRdPOS4IzswsxIfKnBMtm2jyOLI4aQ3dowHAU+RwFjH6z0gbaNGyXs+Nyi
	 VS7+lrCZ3wXeHwAOFevlsoRJpZ4Ku8g9VHYhm/u3n324H2fRKi89wQLarawE84zQSC
	 VxgQlIqYo8FbQ==
Message-ID: <d6578d542968162bd23e7b3ae729eedf@kernel.org>
Date: Fri, 04 Sep 2026 08:33:34 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 11/13] drm/imx: dc-lb: Drop initial primary and
 secondary input selections
In-Reply-To: <20260904-imx8-dc-prefetch-v6-11-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-11-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:55:01 +0800, Liu Ying wrote:
> It's unnecessary to set initial primary and secondary input selections
> because KMS driver would do that when doing atomic commits.  Drop the
> selections.  This is needed as a preparation for reading LayerBlend
> secondary input selection when trying to disable CRTC at boot in an
> upcoming commit.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
