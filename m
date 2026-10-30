Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793384552;
	b=bQUsh9+wr5tenJJkqjNpvgnemEYYq4EoIlk2Gc548vT6a80cfw6kmC2v/nJSSpux/SyS
	 SIwaqcgqUEecMBTYdsJB8qUoIz6ANefPk9trPO1CBUvwuUcUhAaYSt8rz2a0vnMHPvMuR
	 NwpQ1Gf/R8NE4IzHQEpMmX6YyPq+esMoX71An6uAdWq3RKPV7lO+2tNa5rniYfVC0NZJ9
	 Uow8yXZesvL8vRE+/hSwRJkA/5W8IMiaomzNH3x9I+l3tKvoGtrk6Y+b/H1DoSGg5QlC7
	 0xWbrb6XZ+knL8EbqlviGcOobrQQEb2r3ofw3RQGzvJDGzaKXwTg8izVugOl1h5r00g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384552;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IhyvZUUu/9Pqj0G5T+OOMZeqorFoP0fF5JBfpfONpxQ=;
	b=Z25oS28Q2gnh6Ctw5B3TlxE3wmkdKuo6vpG8MEkLZ5EPPqUUjIHuDO7OBgSsk1hwjaL1
	 P9gJTBU6+LLPUqg6ZbjwoFmonPmrQvJtzCTaTypMnr7t0c6mJJYl6cbPT0g0a8fH5609i
	 9TOQQW6GmrZKVpIqxHDsRp3ytcjdoIVCyWv9W8ph/tfw5y26A51lo+yUgn5u9bYBUpt2o
	 rdRQW9HiNITMQGFiBwyuQguM3YoMpIOs6Er0kOvFBtG/eKKYEvpt3w67RcFckUPxPkT2a
	 7eUMs3bGZWsyzS4IhAyAaA/RFh3dA0mETlZEF9bWEQw8HQFmG6T2KQdECXYAIi0AyoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RN5Sm/kc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E8F606A31C;
	Fri, 30 Oct 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RN5Sm/kc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFE21F000C1;
	Fri, 30 Oct 2026 18:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384551;
	bh=IhyvZUUu/9Pqj0G5T+OOMZeqorFoP0fF5JBfpfONpxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RN5Sm/kckP5b5QiYILmF/NuxP5huXk/5np5PefaFjluRtOKBZy7ToFgK6NnazBe6z
	 kT+qDljrYb9ubutfP724x0fmPTeAkznBIhtNYeZVwHe+WGjGDkwawPQvO72BsPDbeM
	 28Ui6Juc196u/T0DzIGq78nj58bHIsWS8BAZqUk8oxZ0QSCMMPlM2R8bbE+8G+XfB6
	 w9pAICRPA07/M5048JrxtQdjbYL79wAcYQNk1x8PlNf7XWWWBGuPIs8oyLHEUJvkMI
	 HY+rLPmLlI4Ilsrl7ApBFgBmAgLmirQWkzk+/iH3+uAl4xJxwvz8RTDnW6ocPa8hKz
	 2SwgMNeXKUjIw==
Date: Fri, 30 Oct 2026 13:22:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-phy@lists.infradead.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>, linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 6/9] dt-bindings: usb: generic-ehci: Add the NSP
 compatible
Message-ID: <179338454691.1217805.11713868240616162011.robh@kernel.org>
References: <20261021172819.668120-1-florian.fainelli@broadcom.com>
 <20261021172819.668120-7-florian.fainelli@broadcom.com>
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
In-Reply-To: <20261021172819.668120-7-florian.fainelli@broadcom.com>


On Wed, 21 Oct 2026 10:28:15 -0700, Florian Fainelli wrote:
> Describe the EHCI controller in Broadcom Northstar Plus SoCs with a
> SoC-specific compatible. It needs the same FIFO threshold programming
> as other iProc EHCI controllers, which generic-ehci alone cannot select.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

