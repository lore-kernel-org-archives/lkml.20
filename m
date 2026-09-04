Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68138333F;
	Fri,  4 Sep 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510577; cv=none; b=VTxYnWBI2dT2xp2OeoAjFBt3gu/Mxg6yIPm2S5UizXi881UmDY3Xz4b5exTZVZpEH+8hkC8kDFJSKRDlsI358+nK4NAa3hnkr7c6Xf8Hf97XGvkv63EWqzKHN/AaLW6o2N+Wvah/+vFj8Y4yaBxCErBGaHIk8Z1vQTzVgLVay7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510577; c=relaxed/simple;
	bh=ketV8lJC98MwT152y2+p29SZeDSTVYZ+8Fjsct4s0Cs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=KvY2u6PmTOHZpOPk6BQf/qehVr+Ahou9SRwdFPi4Mi+ehF8iZHKT5AIN9sj/WNweQzOEn1ohqM2FG0iB/4f56cKRQ0xd8yPDqxmA65ejFJwJN9DRRbm8yWpl/lqroOaVcOXyY4bZ4Uv57AiDK/Qn75d44BsCVTwlilNPlqB3Oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrU1OzPy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NrU1OzPy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC721F00A3D;
	Fri,  4 Sep 2026 08:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510575;
	bh=57+zfRWquEc7/m7zU9U9Jv+O6fWgkTCFuvFGHmL7CgQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=NrU1OzPyAtJcQd2IbkJ0bwhfg/Y0v5rztSmztUnqZ8UF5Z4W4NBVriwtz/uEqC5PP
	 EWT6q0yHiiFn66VKtWD5c8x3qQ/QprSwnyRYsMri69Tm1wy/af/KVpnHYgMFmEz5FS
	 GcS4bJIc9w9xviUxreWGGeSTFpIdIMniUfiQgqg+MaVCGewJF+8TvZd3Zaz4c8Zm/1
	 ks84AnlsD87w0tziRrIM9gSQcTLPD3cZGeeaNxVHLSxQFqH3X8uiTzSgdrn/9M1/yr
	 snTpDqIvkrA68+/rmz7TdwxO1Z4LtBmkT6gnz4Etb3HXyu5dK72K7i3T+/WMSqeozl
	 cCqRlh/xvwuHg==
Message-ID: <94cc04ba62b25e87918820db4c548be5@kernel.org>
Date: Fri, 04 Sep 2026 08:29:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 05/13] drm/imx: dc: Add PRG support
In-Reply-To: <20260904-imx8-dc-prefetch-v6-5-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-5-26643e3f6cb7@nxp.com>
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

On Fri, 4 Sep 2026 15:54:55 +0800, Liu Ying wrote:
> Display Prefetch Resolve Gasket(PRG) is a part of a FetchUnit's
> prefetch engine.  It sits between a Display Prefetch Resolve
> Channel(DPRC) and a FetchUnit.  Add a platform driver to support
> the PRG.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
