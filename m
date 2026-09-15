Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009363BBFAA;
	Tue, 15 Sep 2026 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478393; cv=none; b=CckWyfsqfXyOFwtG9OPcAC6+Bn6S/boIukqBJNNaPGkYx/kVJ35eZKnB1VTIGBwsG+h5KqWobQUpiTBZ9zktYx5Q94r8uTTmO02+tcWWZCTK+mmA6rHa6qvBdF9deuOp4/2QE0rAhvhG8Z6/TtdUwcFF1fHpL/ayUYsPmulDOpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478393; c=relaxed/simple;
	bh=WW/wrAPHP7uru0Nwbz7IYxYrRIx+ZnxonD79Ji2RguI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftx4MEg5PSigeBnjIW70ORhLssl1VM/M2ZXZam3u8TeMbiwOckQM1AC4MhoiBLArcqgChc0gx9+Lj4RTD06il1aDR0Tvn9AkmC2P3D3y9709qUrYpqMb+e5ilguF6YdA86R71sedji5S20HOCu+SwpCi0fWRuv4ry01mCsyeZx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=UQDiI+iU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="UQDiI+iU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5LE8PVd8dR7i1IcMCPEAVygp1dnwrC7B/9bSRs5CJlw=; b=UQDiI+iUyTHng+weZ5XsG/lVQh
	11+RoU3RPKMH0dzjW5GJlcTR3pCjqSWUsRXfio7K14478DLp07tzVwwqRo9UoXDPB7xr72jvDHk/b
	fV+bSZYMzi1iLikD0NtMNhtEDmkNDWMItxvHyVT8rQCMdY3j33mJxnqLEofV4dVYNikU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x6T4b-005HVM-Ay; Tue, 15 Sep 2026 15:19:45 +0200
Date: Tue, 15 Sep 2026 15:19:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911091952.96233-4-francesco@dolcini.it>

> +	ethphy1: ethernet-phy@1 {
> +		reg = <1>;
> +		interrupt-parent = <&adapter_gpio_expander>;
> +		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;

Falling interrupts is probably wrong. They are normally level, active
low.

	Andrew
