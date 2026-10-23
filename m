Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747695;
	b=mDV3UC+V6UVOcof6wlE9742kYOAehhG3FpepC8cs4y/mL1J/QvOUwSETukzm2cm734K2
	 nM74JGAzKjV/K23TQ+UR11gTM9hHQNsYDFGrAaWAAWVPmAv8y7alj8KTngbtYIkzcev3s
	 b1GnfnX/SZR4OSoOHmRXOEFLY/qNXSGha9J2fB6X/lgHyCkGPlRyL7PppYfm5lKM3J70t
	 l5WOMPbrues/x9k51YzYE4lF7I6k5BmPRIqF6j+f9PnH/pPWdz3fwvpgH+6Mnda60QyW5
	 /kCmFZFqaIZeRP7QZhZewpzKftGvEZWUGPb6iSL9UB3Hk36tB/2wboaZYiCepR9ou5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747695;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=tlePnP3GE78vbgKi5tLSYix5xa2MNZBwLKVMInUWwZ8=;
	b=anXJknXfdJtwPGtMlyC6niu3SStXxIJT1QnApjkM+PUWoXyfvDvqgvmLwiq09lJ48Ib5
	 DCEJG6Hh8+of+pM0eV79WK8oonIRegqMYXyGCHWUSlHp5MWOdPCvkgjRFKllwbP+myBsR
	 Zoe7KzCaMACEgIjDSpEWTUKhv3ZDaK5xQsCaiq72G83EeJJaaujVHGs3zDtZexfhz4Cfh
	 X5eNoAHOqQd9YtU7MYAZaERrTNTUdxEJ+WIkGQJWalnvI/Lx5i5+uE+yhuYOg371W47TM
	 sQP+kDfhYGMp8P7zrSznohRsGtMDBI5z/q8l6El11YBpPuX25P3ntnroGOf34jm5bYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SAMiazq0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7E9606A31A;
	Fri, 23 Oct 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SAMiazq0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14DC1F01825;
	Fri, 23 Oct 2026 09:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792747694;
	bh=tlePnP3GE78vbgKi5tLSYix5xa2MNZBwLKVMInUWwZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SAMiazq0h/d4fr7VYelFNOoHhHhBYWz8XP8e8Tkhw420EvwAw9Umtlm16H1x+YAm1
	 yspCfKmJlVDvuuz+DX8MhDfHgXkciawgUp/iHUmny3Ge3LUZy0rWnXMJwC5RgA5TxB
	 QheRdXq+kNXoukztdjuAkaUr/0vjNROT5NeJXX1hZ50T1Jh6GuYmkIWXlufDKw1BFA
	 gto3ZRZcrjAX0O/8e0/1jIxI5jHnhFSvd2hH0Fx7JqNAUeOWUjzz8U5xO2ED16NYRk
	 YAYnDCRbwQ5FZhjYoV+D188RwVwcg9lao1puIsFDtOCYhw4tRTxaKYaHz4QL73xdHO
	 Oo/18fZpTQD2A==
Date: Fri, 23 Oct 2026 11:28:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Robert Chiras <robert.chiras@nxp.com>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/7] dt-bindings: lcdif: add compatible string for
 i.MX8QXP and i.MX8DXL
Message-ID: <20261023-uppish-invincible-chinchilla-cf8a47@quoll>
References: <20261020-dxl_lcdif-v3-0-adc944659e14@nxp.com>
 <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020-dxl_lcdif-v3-1-adc944659e14@nxp.com>

On Tue, Oct 20, 2026 at 04:12:51PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> i.MX8QXP and i.MX8DXL have lcdif, which back compatible with i.MX6SX. Add
> front compatible string "fsl,imx8dxl-lcdif" and "fsl,imx8qxp-lcdif", which
> fallback to "fsl,imx6sx-lcdif".
> 
> Required power-domains for both. Required 3 clocks and clock-names.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

