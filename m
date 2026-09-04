Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29083DDDCB;
	Fri,  4 Sep 2026 08:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510814; cv=none; b=CMokONjfuX6UbR+ltzYk42EzvAYHBDmkDM5PbvSPbNG/dszJPPWm+bLSa8a/9VGbjZp1Im1lLtAKd9kHdEcNZVCzum3gJ4c01+8GoKfpvRe+WhzE/A4U4KxJH3G2PYvIYGu4uaTRP8GfF7UsRguv9lNeuIWL7K3DDjLbRM7fg6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510814; c=relaxed/simple;
	bh=VuUvGuWR1QGja98z3pfA6NQmzQn6DaTvRV0sqZ6NFzg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=aLlO32OA9n5YgBIlizdUu5cAvKTJqxXFawzUVPilMCjem1Hd4hf7FCZ02WFsqqBbDiJ0siakYWqCHc8GlGgrKWWCuVDkfhGTFKYMBbcMeIfRkAERAyLsmB8GVeBZSMtrepaInwz71pAF76JYepyOmhuLbwK4z8nIXVllDIJ2JXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ct1XKUY0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ct1XKUY0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC4D1F00A3D;
	Fri,  4 Sep 2026 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510809;
	bh=j4UqJL4I9Plor9CtIHU2V1yjT48iQ2MyrKeeW7z58WM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ct1XKUY0fnuFX5eiw09xoWPGKZlBikbdz3lQhjp1a77+eGvhCFYjurrfgI21cJexD
	 lpk9YpDb+U1yeFs5hwKRgXmPAEaS+d6bMtabxJEl12LTVbNH0K54I1H9z/h1iR3IZj
	 ZAolGmtwAsLT0wfqHOQoy23izYnhQDgMnxbox1S1cnTUWz0EL37f5XAqkcSlLZISoI
	 ex5US7EXLj0STQ1sGzJCNnG1Z75Hanw2pkeNDaWsAkNK3i0qBn/fHqHS1XicgFl4Fx
	 Wul7A20YfeWNMtpcZfKWvl/Q7rL0uU+khJoRDudZ2d8Nq7Ptop/UvW46jjpM00zCNR
	 CFhGUl+VDq+Yw==
Message-ID: <0d4f2e0275dbb7fd4db16f9e4393dad2@kernel.org>
Date: Fri, 04 Sep 2026 08:33:25 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 10/13] drm/imx: dc-ed: Drop initial source selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-10-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:55:00 +0800, Liu Ying wrote:
> It's unnecessary to set initial ExtDst source selection because KMS
> driver would do that when doing atomic commits.  Drop the selection.
> This is needed as a preparation for reading ExtDst source selection
> when trying to disable CRTC at boot in an upcoming commit.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
