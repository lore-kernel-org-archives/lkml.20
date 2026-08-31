Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186947253C;
	Mon, 31 Aug 2026 18:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200565; cv=none; b=L6S0marxqUKwOCnJSkAFznR2Cen7rfIsbEtnvXNTR0ooUGfaZ9fh1aRxgxkxpAC+qXTrJk3hXhz+4B3EWWMmzGgoy2/N1xG1okRzy5pRGHIUWarKIUGsiJjSwgqv3DxF4KpSEIqJI7bb03tuOhKst3J2lMrmoKc0RLcw+C1xyXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200565; c=relaxed/simple;
	bh=yMO10kNoMANrdANzNq7MOt8gjCtO6HX28QbLDMSGJrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaVwp/+xLfNvHPH2t4P5vFG+G9F9joI4onA0PoNy512Nw3u6nAA83H0XdykcAKED/Ub3gNhMQ3kaPyNahGAyBR1ooomf29WI2YyU/nuxTBhM5Lcc9T6BR07yU9e4V3HBKwofDIYxt6HFkkmQ1iUbWHBMt8Hjth9ErehYUDLjWb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPTPB0vt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPTPB0vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079081F00ACF;
	Mon, 31 Aug 2026 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200564;
	bh=HaJF3oD+0clIlNcWRoIsYOSOvk9RIhKNGI1WsmVwAt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cPTPB0vtHgtGu/VwOiF6qqCXq4bG6mz+IQi8Ibo22xpI4CDsJ5h/faf1VhxaztNPZ
	 4W/b2BKzMlZ1EPXOMTCCncE0qxTSgDcCI88aIknp7UMINpzlaXiQtGHTk1kLhaCcMS
	 w+8Ue1tEkwadHZtyZ/rGJrWjKbo3G6XyXAY2mGwUT4nhhxgbPbTscMTNrkPzZ45nAa
	 92O4QaqKxCZAqJ966Kve0QQ/T4QsIoHmnSmi+AR9P0u5uzFdBdRDjFvZ04+orr6vai
	 cu5I7AhrpDDi+q8h2MZmiKC4HDtYTUIv6Ug7O5lTTtSSaBOIc8UGPuu1Q6/rF1qNrY
	 U0w6fwL1FPoNg==
Date: Mon, 31 Aug 2026 13:22:43 -0500
From: Rob Herring <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	=?iso-8859-1?Q?S=F8ren?= Andersen <san@skov.dk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Message-ID: <20260831182243.GA955466-robh@kernel.org>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>

On Mon, Aug 31, 2026 at 10:17:37AM +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.

The sashiko issue needs to be addressed.

Rob

