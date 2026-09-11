Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F446A607;
	Fri, 11 Sep 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116457; cv=none; b=I6+u+Vw+HaAsivh5RjyRakYoYev8bnv32bte5mP4rj5fvU5wJsIFJ71IccIlxIuGpXzQ1mh1cvjUkdA38wI4+K3Z8nkJVTZus/hW3DlKwOr+UiS7IBP7liy2RRftvLB9ebNPbGTXmZho+MhDh2Ro4hiwDkX5fg/upuPK2zH9d7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116457; c=relaxed/simple;
	bh=7EOqdFKzmjfnZ8DvCNTmopy1srbi5UbMA5ntQwsE5Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZueQnroj2yH6IhlcNWQBDJdUuJ+nC4zId+cItxhGGIl2KvpKsYEyI1//O/Y0KttWA3oA9Gr4ViqtyaHjeXilVImbUkTvGUZ/04egSxBOD0B0doCPp1Vlaw6HXT5R9WmZNm3rW7Qa/Ehz0mLsPzTiPgaETkcNlAB08viR9R2bOa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+tw+7VM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+tw+7VM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B11461F00893;
	Fri, 11 Sep 2026 08:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789116455;
	bh=VYBG4Mo6VNUGeOVpP2EIFPgZriiFWbCLLDjsSAka0yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q+tw+7VMyjhr9XZKyqf54iyK+2UZHCuWsr7qOD3CFxioHsRwQJAPB0/ntqhCz4RoG
	 YwkBBwjIZHs7TN36ruuwggOAffNCw3k2+u6wjWYa3GtBFoUAqX1VSt3iZFJOEzHzf6
	 lKcRrTGKzReGEzpczxTCFEKHidH5bNJScRgFSJ2HXf6ihMEvL5q731YUBu6FCh2xqM
	 wXjz71ZSQZ8J+cPrSiBTVjYB3ejmhwtY8ZIKN+da+PJhlyGX66HHIacWfUFvPsVuJD
	 PpGpQSmRSeG64koWLA0zGzIYxSB+lAfOsR+y5aQGtYvhVd9D627FpUgDpMdk01Jtfm
	 t73+UVn6avr9g==
Date: Fri, 11 Sep 2026 10:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
Message-ID: <20260911-misty-gentle-macaque-6bebeb@quoll>
References: <20260910101616.139270-1-francesco@dolcini.it>
 <20260910101616.139270-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910101616.139270-2-francesco@dolcini.it>

On Thu, Sep 10, 2026 at 12:16:07PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add bindings for the Toradex Lino iMX91 and Lino iMX93 SoMs, based on
> the NXP i.MX91 and i.MX93 SoCs, respectively.
> 
> Lino SoMs use two board-to-board connectors to interface with a carrier
> board. They can also be mounted on the Lino-Verdin Adapter, which
> converts the Lino interface to the Toradex Verdin family pinout and
> allows the SoM to be used with Verdin-compatible carrier boards.
> 
> The Lino-Verdin Adapter also provides a Wi-Fi/Bluetooth module, an
> Ethernet PHY and a GPIO expander.
> 
> Add compatibles for systems consisting of a Lino SoM mounted on a
> Lino-Verdin Adapter and connected to either a Verdin Development Board
> or a Dahlia carrier board.
> 
> Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx91
> Link: https://www.toradex.com/computer-on-modules/lino-arm-family/nxp-imx93
> Link: https://www.toradex.com/accessories/lino-verdin-adapter
> Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

