Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564689;
	b=XXzNQ6Vp0I8AN2AvQJznTlKJStC0oXijJAtmVuRdOzGndcsn9NokPH3Mqb5i2isz9I4a
	 UltTUTk2qqK/rsJL8KjVISiTicQc825Pj9TIKcSG/IImJClJsME9veqxm3rwl73NnwFif
	 ljacQ4qx7jLShTNDDYPfw+MiwOXld4aOe9/w9j+4v3VzCcsb3KwDJpwOYi3ZIm/W6VvYO
	 sUg6jmX2uSdvWLU6x6rraZOd/f8FL01Mm6Tuckn3usBDeNrHeQB6g3hJmQSxOBNiNYO3p
	 296YZ7i5quGEEWuWk1rgNrhUnQnLMfjSkCmK9gWm0mhAdeDwWhl+wlN2Ftw7X71tgZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564689;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p0RK+IYs95gpjlIxIoHnheOHHg7wwsNB1dTa28TgEXc=;
	b=SvkvHP87PIaq7/DRsUQEkL5kkDLF1inGlhBNImWTqB4zVhcSrA0HLXFuuI7c48djYuol
	 9lg+8zwMTYDFGcovGR7nsJyCOZ9npgDvLUEDgmNo48hKbLSoD3zLmvkwUMzA2cQWY43eM
	 XD42NqyeJQqhGOsK4MJGOvS2wF6v1ANTWcxP7iEw2/mcH5wVYMBfcCa8U1Mp/X8q/gwPo
	 E68kyA5pw5TbKOTF+ZyOvLjrT5I7Ys3iTOei57OmH0sg9uiWry9FsGVS5PtdxPdrdHHeK
	 Pr8vGmkSJPtTTPSolJ/g0vkEMoHwpYOsrUzcXoKVoVw3BzWIANhWeV3Z3rT3wcMLB4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ecQBSyIc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623C0606A8A3;
	Fri, 13 Nov 2026 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ecQBSyIc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE511F000D1;
	Fri, 13 Nov 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564689;
	bh=p0RK+IYs95gpjlIxIoHnheOHHg7wwsNB1dTa28TgEXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ecQBSyIcUWIq1+AWi2yVWcEaum5gQsY4wqBCQJNmf2nSsfSfiUTSAji189zo/un0k
	 FRoZe9PFSTS4Gm1ODTUjdbDkEBL6mqmqzg2zy3fSxbHb1v0BqSsA97R8lo/MSzscjG
	 MWFfHVTz3RlD7mcysOgD35o3AQUaBn95grYCX4/IbSLsq/6VRLvlqatU67KUb0iBQf
	 3vPsX66g5jzFc33uti9t38WLAHw2qmUTAszc05g0rZ73YNuwabC77O7bHc347ZPh3D
	 QJeLnJueodozV+4+QFX7qGTRxN8MuhY82jfig6OZC8u7FscGbLdiAf9Ao4UD3GYaKm
	 4zcbAcGQik7Hw==
Date: Fri, 13 Nov 2026 11:11:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: Add an entry for Cloos
 CBASE board
Message-ID: <20261113-inscrutable-dancing-python-bfbcbd@quoll>
References: <20261112163703.3358164-1-lukma@nabladev.com>
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
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>

On Thu, Nov 12, 2026 at 05:37:01PM +0100, Lukasz Majewski wrote:
> Add an entry for the i.MX8MM Cloos CBASE board.
> 
> Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> ---
> Changes for v2:
> - Place cbase in the correct order
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

