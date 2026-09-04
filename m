Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741313FA5FC;
	Fri,  4 Sep 2026 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510982; cv=none; b=jY9kTalO7aGMtzlQLCDj489+LT+VFnEIu913mFalv1jW9EBl2loNReJf7/pFc31rkPv7NVBmkaP31Xffgk9oRujBz13BKXWRM0N15csimVevfciP5Y0r4mj/ACDjfom595TVyegfE9KJ9eZvTRYkemTp3lYe1mmR/ZKFsvTUdno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510982; c=relaxed/simple;
	bh=sJeCQmCfiCA/gI7xvdL6IoP4snfxd+zGOdMBpGPRNXc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=sVuMNH4dM0a+BrefWnf0Y73Km9BdXPrnAoTH7ZVDBrBuhwKXflVCNTPsTQFHxtLlq+y4I93p48V5bL6ZQbGyO/4TTXvGERrUapE9viC3SblcCM5J1hSt9dGLAab0qqYNu+TwtImg83uCmf4SMk3K9wRfbpvrGZHyqo/fngZBdKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8qDtKLs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8qDtKLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C3F91F00A3D;
	Fri,  4 Sep 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510980;
	bh=EARuoU2+4Ppoh54rAYFHVilx3BHYziNxsbRS7f9DEMY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=G8qDtKLsfO5uMyax8B940NgODoxvvXXWhkN5OLQuKDcYFhH0CmeyRV2haSxb4LG7r
	 MWSZsjXuzaG8vD/O/3jJvdMTlxYrsDfDWKGL2W9Q+AcdMqvt77uFbeWDDaasQyJnqU
	 /ynXB1GjWw6KKQ8SSbsZQ/q43Eah1Qqzl92vO4wz6IlwenlJAPTNU/JYMFJ/Yf0XFC
	 XAYUXkuVqpq6U/9dsPVEsY7h6ZPQ5DtCOMCIHMBsY5jIhW19m5HplwlhJ+ZAScasti
	 U+RWvxHTlSJ0G15qbEZn4lU2AAEP+BbdZPg9md32G3USyPeb4oQEC4l6t4RlycdAXI
	 Zm7UAgNa4yiiQ==
Message-ID: <66a60c26351f41e6c9660f1f18cea9f5@kernel.org>
Date: Fri, 04 Sep 2026 08:36:17 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 12/13] drm/imx: dc-fu: Get DPR channel
In-Reply-To: <20260904-imx8-dc-prefetch-v6-12-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-12-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:55:02 +0800, Liu Ying wrote:
> Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
> And, call it from dc_{fl,fw)_bind() to get DPR channels for
> FetchLayer and FetchWarp.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
