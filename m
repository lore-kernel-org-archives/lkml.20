Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619065;
	b=hnnxiMEjvUZzRtVH6gCHBsZ5BY5VVdLOxlUkx2rCxASP8maFy3L9JgSZ7y5SetQ+ZAWv
	 +xI4aojajCwBET/EhY8hu2MLxZYjSFu8YZO4F8M+aMQZb5l4NKQIH8MqV53u7J1xkre7K
	 RwG/GJBodSokHLx2two3TKblGpacwviE3e46yP5zbUS2s+QduGZ+H6J3Cm53Pdq8aqSLd
	 aU29j0jz+Ek6xax6S/e8ApIHlciMeNMuZgAk1qjKooeO6Jun1nToE/Msj6KzWRjGXTDq9
	 rQ6o4dl7dQ6+15QkctkPFLsm7uD+np9UyRthQXytprOrjmbktijQH/yZBD8yfj702VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619065;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pHJ56RnFLnpgXfSoo5jo4wX0a6zG9uJGmXOIIH5bpRQ=;
	b=FOUkKoOvT+uMv4/4pYik7tBava1S2wA8ceh944DzV1JBoUScVDZaiBccMTWcv9XBWXBh
	 sfuPiuIxomx04/RD+Eppx+mrjjLNRY1x+6rL6q5CGt0FT+t1pn1j/HxzpfniV/6/037rr
	 hwJ/7+TS/3diOfpUNZeUhvA73gGxF/u8PtKjUQrVoSi0Yn2mNZQa5aykcjmthy4Me96x6
	 pHw9CgEtwhaq+lXEhqMM9GGcFPXr7aEFvziS5h6TcXwKogoWSN/gokFZM0fanBMtxeQN0
	 qCq/iHeR6XlTddshf8Fn4myoaxBpo1IMi12hiQOgF/IQswvb0kRJE0f/Aqg6S+a7h5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="J5X/dzGf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C13606A32C;
	Mon,  2 Nov 2026 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J5X/dzGf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 246A91F00A16;
	Mon,  2 Nov 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619064;
	bh=pHJ56RnFLnpgXfSoo5jo4wX0a6zG9uJGmXOIIH5bpRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J5X/dzGfuS2FKLfcnlW1xSHtV+QUyLYtJAHFPDv+cTlG6OQUMKIduiMmFScw1w10z
	 cvNOstcpgaNmkKurBd7StaGTl+YpSpxNy10yaAN+VPwHzFxqkvbojjIye2yXcq4Egk
	 Lil5lqwUx9q4QlMSsGSry6G70o8sWSCuRKPKWmegnIydjw8gn5rYRWmKg3Qx/LSyut
	 Z0tV6P/pJvcsd0C1lwXo4itlN8FG3k5ifhiIm9VWdxEw2FTuKb/P97Z9TRzrAwIWH3
	 oN8yZMF3ON9V5o+QgIqdwgQRMYQrmVpruClMPOnGu+ESbQHhvnCAOfnLuTR8P+6hYE
	 ohuAibsQOA/Pw==
Date: Mon, 2 Nov 2026 12:31:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Joseph Guo <qijian.guo@nxp.com>, 
	Josua Mayer <josua@solid-run.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, Maud Spierings <maudspierings@gocontroll.com>, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>, Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Stefano Radaelli <stefano.r@variscite.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: arm: fsl: support Engicam i.Core MX8M
 Plus FE C.TOUCH 2.0 board
Message-ID: <20261102-rational-sociable-lemur-4fbd19@quoll>
References: <20261030163547.2682583-1-dario.binacchi@amarulasolutions.com>
 <20261030163547.2682583-3-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20261030163547.2682583-3-dario.binacchi@amarulasolutions.com>

On Fri, Oct 30, 2026 at 05:35:41PM +0100, Dario Binacchi wrote:
> Add devicetree bindings for Engicam i.Core MX8M Plus Fast Ethernet
> C.TOUCH 2.0 board based on the Engicam i.Core MX8M Plus Fast Ethernet
> SoM (System-on-Module).
> 
> Unlike the i.Core MX8M Plus SoM, the Fast Ethernet variant embeds an
> RMII 10/100 Ethernet PHY, so a dedicated SoM compatible is added.
> 
> The use of an enum for a single element is justified by the future
> addition of other boards based on the same SoM.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

