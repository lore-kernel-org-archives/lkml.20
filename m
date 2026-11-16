Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836678;
	b=N54E4URP3XeY3cCTRkX0p6YU1UkAvUL5tnW0GB/GAAGvpT7QbC6q7vPtqtTbaIh6CTJM
	 cHNJkuJ0bMGjC5UJdvlj+LGcXrAzW84smrwl3ETyhu7NhnQTrew/2dg3tMq+stgJTRGLq
	 rRjUcAyQ0nFI9jJj7JmUZm0mULZ2gVOWqgGODmPY8XFsVaswpaDfklI3NdyctwaVNLcrQ
	 O7eij0Vc8UGNvvwfXaQLIBmvabkybQ75jp1J/2oXjRWzBOGHXSrBX4p/X4xbNYfHNBoyJ
	 b29U4LMJMyK/PTX4XmS0sIxrLR6mzOd6WSMwBXtcHRTARGgbmK4LTqxIEWxpmRW4iNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836678;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=xyOPebxqczNB/gJfDkZwbXaMote1MbilyqqQ/50z+0A=;
	b=XvAY4fOC2mBdJtOCQZ88DCkSj3TC+v6seneCuZW0fFDBhq0PMjRXW7Ud4FZ/X581DEpN
	 jOLyXwJS1+92fCLFumTNEdp4N072KRSxqliXaKmNUOMudfqZGso1L3RFrS8OBQwA8HFs1
	 HCxKkfp7rTo0Ekd/e5FZjdnp77wLK8wYOqxjCAKMxvZKYkoEo0kGjSTP4EQRM2h9aVvYF
	 WTGseUVjRcF8Nqtx2Riy+OhQ3UPNDJCG5WV6IRT/6Dgxtorq58QfABA3gr1VUnqVPrb6G
	 au4xjcJj27JDIB/PR5lub0GiP49J6sJNQ00vbKXITp76BBix2tpISKELp9s7tmHwhZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=t0Gz1Geq;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FFA606A32F;
	Mon, 16 Nov 2026 13:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37FFA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=t0Gz1Geq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xyOPebxqczNB/gJfDkZwbXaMote1MbilyqqQ/50z+0A=; b=t0Gz1GeqYdligw2G0195Np4K7S
	J4qjzX/g7YT7Ah4vixjvHNMBSUKX4e8o10jS3yArLjMJ7D30wHuxXkxL8YO1F8GiL0WQp8QZ6CFGg
	NaV159lQ3Xn9YmAmpWNAVdeVBeOOCVAjlHSB8oz58yMWc/cElf/Kbu4LRHImYIWnegqs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSx0P-00GvLr-61; Mon, 16 Nov 2026 14:44:21 +0100
Date: Mon, 16 Nov 2026 14:44:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: 1579567540@qq.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	David Wu <david.wu@rock-chips.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next v3 1/2] dt-bindings: net: rockchip-dwmac: Add
 RK3572
Message-ID: <03378e2f-4667-4cfb-9662-f65629e04321@lunn.ch>
References: <20261116-add-board-ok3572-c-net-v3-0-a957fdcd9c7a@qq.com>
 <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>
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
In-Reply-To: <20261116-add-board-ok3572-c-net-v3-1-a957fdcd9c7a@qq.com>

On Mon, Nov 16, 2026 at 03:39:14PM +0800, Cunhao Lu via B4 Relay wrote:
> From: Cunhao Lu <1579567540@qq.com>
> 
> Add the rockchip,rk3572-gmac compatible with the snps,dwmac-4.20a
> fallback and require rockchip,php-grf.
> 
> Mark tx_delay and rx_delay as deprecated and disallow them for RK3572
> so new designs do not use the legacy delay properties.
> 
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
