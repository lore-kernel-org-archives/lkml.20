Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780349;
	b=E/m+SBS8lvFgQf34vDZiIIn3MGaSE9So8fjEC/2XmcIuaUXvPhuajXMpsUznb6O/+TjX
	 tjoARsO8anB3DpAQXiBjQGFc1YlBjsd9jnK9cVNILGC46JnUW5011OC6CMwIP0RUEqDOL
	 1lWA4hBogYEcBsIJMHoV7QRmr+Ulvq/3WtKbv4GLSSgcjluwMikYOHOWMnu/xI67Adk7f
	 Nm6U2WWslc04XNVrPSXrAcG1hEp3KxTT2yNdrQ74WjQcHXh2fshgIa9aelEoiDuUETFAg
	 WAYW45LO0M+TSRmwUxtvLYxDLOgM2xjVrpse3iYjg/Fn6EceKeSGKGmPBYvoZIsE4xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780349;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7JPjenQFeEsZp71b+iGe0lGbAcckPwZVykttqOk4x5Q=;
	b=eyNTOVQOPpFlSC3cC9yYen9hTSV4Op7cTwlV8URaH7Ssjs022Bm8hIhGUNGnNZ+qKOyB
	 IyBdaTSvnfn7rQ6QV7IgXI5pawn0an4F8LoJsEEjiqEAatUzrH72PFXwN5zZtN5Cytx2o
	 NY955s7/tcnrHL8ME4w/2m9840RO22XIn+oVt9JHSi+55J5yF05jliIyPPWA0UcnYydtj
	 yLN4MVWjzHgvVDC1ijU3wag8fUcVIEKcIYi7NWk0XGB/ly2Jvhf8ZZ/piCRxiuBB7+Qxj
	 /A8ygsCFsiYmifn8V9U56p5ANZrHMz7ZsGJPjmTYkqsvMSda78/bKDcEyeogN7/It7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGYEVKoG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B29606A326;
	Wed,  4 Nov 2026 08:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGYEVKoG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C59E1F000C1;
	Wed,  4 Nov 2026 08:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793780349;
	bh=7JPjenQFeEsZp71b+iGe0lGbAcckPwZVykttqOk4x5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VGYEVKoGNwFuMJbTOlO7VKVvGlToA5A1xtt1tUQu/WGB1i1j9NttWJM/9bq4oTWXW
	 YZVTVn1SAkFb9cnjEgZA4Ox5ZZDmKBJ8PO155G/DBT52C1wa6Ulq19x0nZprUah0Mb
	 ne1LR2560+AP7QCob8LSk7VejOfbXRsijZN1KCTZdFUNfq6hNch6sFesuGt/uVP6+e
	 9CK/EoculLm9BMAlQPK2Y7oNZ34vt7qKV4AnrKtNqoVber3PRzcgsUhEWrFZI0DgNh
	 IHPjWHTdjMgkO8vGJrvcFTFM9rujxlckBOq8SMHdvX2D8z8+i65qNanXxGjDKNXvQ+
	 JWcHHnkEVQ3qw==
Date: Wed, 4 Nov 2026 08:19:02 +0000
From: Lee Jones <lee@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>, Andrew Davis <afd@ti.com>
Subject: Re: [PATCH v5 00/15] drm/tidss: Add BeagleY-AI display support (and
 some more)
Message-ID: <20261104081902.GC792264@google.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>

[...]

> Changes in v2:
> - Add Rb and Tb tags
> - Drop "dt-bindings: mfd: syscon: Add ti,am625-dss-dpi0-clk-ctrl

Looks like I should have been dropped here.

Please can you remove me as a recipient of this large set.  Thanks.

>   compatible", which is now implemented with the below changes.
> - New patch "dt-bindings: display: ti,am65x-dss: Add ti,dpi-io-ctrl"
> - Modify "drm/tidss: Add external data and sync signal edge
>   configuration" to use the 'ti,dpi-io-ctrl' with offset.
> - New patch "arm64: dts: ti: k3-am62p-j722s-common-main: Make main_conf
>   a syscon".
> - Modify "arm64: dts: ti: k3-am62p-j722s-common-main: Add support for
>   DSS" to set 'ti,dpi-io-ctrl' properties
> - Drop generic desc in DT bindings for power-domains property
> - Fix pm_runtime_get_sync() return value check
