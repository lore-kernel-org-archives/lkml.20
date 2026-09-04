Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC03D45F7;
	Fri,  4 Sep 2026 08:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510798; cv=none; b=aod6tyYYuprqiR8WnMjvyYy7HNMoPm1b9VSwjBMGJJPd69UKNrC7IC5cHHKukBorbX1kte/UIfwhmp5+4c/YxozuWxV2/rGRVV4+ZqJ+6DD3JhY4zvRplMcMHXdHhmlBKbJUkNnyg4cDEnOrGnzIGlsD7NokGGylAX/egxgit+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510798; c=relaxed/simple;
	bh=NOv7iwMxhCQ0YCsI55fslbqeBAu4YRdlluYMfYstykY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=usV7pGJ2UnnsX2Pjw7H4pU4FzQu0JoOXiUDyjlmXk9ikIzDVlYClIrtZGNLyEvWmx59vLhfDTndQbEy3H+EzH2UrssKzrsMU8fgzGcA/TcKKp3sWL8qn0oYHA2g6Djp9amGLDp5E4Uk4wh7iUlqL6Nu4ItEUzTDFceerXR95ueE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTGjJxP1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTGjJxP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5851F00A3D;
	Fri,  4 Sep 2026 08:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510796;
	bh=y/nk14eD2Y0cqgzJGSt+5FjulJ5arXb8251Zy5w04Iw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=jTGjJxP1aBNnB3vfu+LiWsWU/lVajEblCXSl6iHSZYPp6UGTE3BXo0Lhh/051QHsO
	 m/Zfk2EEsmpNzwD9Aqi1DUj6G3uRFNtsdw8PbyDBmpItS8Y3BWj0mBINDbfLeCQdmY
	 3J1I0N0AgAmwOAwdxYhNuc7UQbRMiHeFtxBSylUiCjTD0Nz9EZ94pU6GxRuRhoSs2C
	 Ukwy/s3zDvBp98es3I477+izGPFpiWvGSeEXnfwu2SnRiEI8ChwSM41P3ZmOw8gxrP
	 Vg/Z3Pj0ND9N3DtjqfssIcordwH/hBx8xjC/SBYeBvJUG5hSPwUcwyBe9eDKSv2gAB
	 mEBaOcdLb+gSw==
Message-ID: <d6323392130ed13cc5d1da8c2165115d@kernel.org>
Date: Fri, 04 Sep 2026 08:33:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 09/13] drm/imx: dc-lb: Support getting secondary
 input selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-9-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-9-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:54:59 +0800, Liu Ying wrote:
> Add a helper to get LayerBlend secondary input selection.  This is
> needed by disabling CRTC at boot in an upcoming commit which tries
> to get the selection.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
