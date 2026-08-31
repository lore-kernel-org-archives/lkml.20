Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C513C1974;
	Mon, 31 Aug 2026 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160112; cv=none; b=VQHfWRwgbNFbjqacUHfBiOlkTAF+Yaou2ObIHl828i2THookbdHhLhe4DRCxdV85y2ojI5PB0N+zCLLBkPavm+CduMNGAV6mF8J3MLcGDmOKlkcwJFKGy+OObl1vXXNsSsCxJ70hp5Csf6KOShC+0Z8288tShATs90UCTwvayp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160112; c=relaxed/simple;
	bh=5JIIi0Tg4m+cuicZQGj6zgKVJq3VGGLAEp6WZ3EyIYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUh29vCYxE4LnB+JVe62u7pGw1nON1/r24QyVT3jghux6D/gZX9zJkkaB7UDS1N0pCTWQS2OyFfWpMWCcyO9pQuwVGXPiV1vFFvktmr9DoDMhYT7YRYkTo5v727RdMZXIHLwGXUs/NVQ4hyQ/cAcmlSFviaSYnANo8qcGjR3vpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4Cux9Dk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4Cux9Dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E2CD1F000E9;
	Mon, 31 Aug 2026 07:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788160109;
	bh=n2iZoUZZVaoAdf0YG57XRxMIMRkkjub9h3HnUrjlaXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B4Cux9DkAr3/1la7VT47UiW13CpmgMKSChBGOcmWaeCHbElfVETzcZReBJ2Vhyr+y
	 rRgODm174DbtR3lT+Y/5Ru+95noQepBGxUKo0wBzxjCwiW4suZSvigLGHWIWYOB7hD
	 zTiBpMAmr86N3XzhT9EopbrzSz1AgUXaO3e/X3ZXJrIqeRLpodjIx+BRCRFQWT5+oL
	 Y24xBS4c0R9v8vFUjiDftPe6MrIElkiagqBWDrr/PNNd7ObHoqjw8re1Caq2G5RXJE
	 4ils5LXzre7ALbcCDN46XvcUPYo+e7oxOotYMg307JrBtIVVqspKTMelUIDtiMp1BN
	 9QLXRq5LdcYZg==
Date: Mon, 31 Aug 2026 09:08:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: airoha: Document support for
 AN7583 USB PHY
Message-ID: <20260831-romantic-goldfish-of-tranquility-1b6dbe@quoll>
References: <20260827131551.26725-1-ansuelsmth@gmail.com>
 <20260827131551.26725-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260827131551.26725-2-ansuelsmth@gmail.com>

On Thu, Aug 27, 2026 at 03:15:45PM +0200, Christian Marangi wrote:
> Add documentation for Airoha AN7583 USB PHY that describe the USB PHY
> for the USB controller.
> 
> Airoha AN7583 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
> 
> To correctly calibrate, the USB 2.0 port require correct value in
> "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> selecting one of the 4 monitor clock for calibration (internal clock not
> exposed to the system) but each port have only one of the 4 actually
> connected in HW hence the correct value needs to be specified in DT
> based on board and the physical port. Normally it's monitor clock 1 for
> USB1 and monitor clock 2 for USB2.
> 
> To correctly setup the Serdes mode attached to the USB 3.0 mode, a phys
> property is required with the phandle pointing to the correct Serdes port
> provided by the SCU node. Providing the phys property is optional if USB
> 3.0 is not used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko comments look valid, also same discussion as in PCI phy.

Best regards,
Krzysztof

