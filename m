Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878845;
	b=A3eBIEbYhhb1ntqWYFpyV1filPrCmlnvTccXjQzIgVHkUfLO1nsyuA8r3FN+KLbZ07fq
	 GBWJSBYOHp9dqNq6H5CNyn4Uhb9U1SbTXCZD3V4vty4U+SHGwvkU5saFvaGj8MYsgBjG+
	 Nsl3WT2Zuynyr7eyVpnyw9yslIYxJpX6iynMG4CwlSNXJ89BV7amvCkMrMzXa8C5IDU1Q
	 mNrSIM/NZbN5QhoWyDE9896M2/pBvM7LcMtgjtB28sXKpw89zUEe1bSWa+4fmqaFKmm0Q
	 C9L2LYyMDKOWsBZuQulZRDpEBylnDOFPiVHMmX0B0O8WLIxveSGztPmkTgxjPQQtKwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878845;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=z1XCGeIJ+rg6XMddQPk3psrr5sIk9p5BAPCzdErJaPU=;
	b=ECbW1vVaglYp5UMWbSv6NfGWcaYWWmGzlLbIa7Y8qAAYAJmVgNxC3B28ysf6cLeqsyl+
	 moWxheHA5oDTwFFbOEUG1pHmq0nbwiyaLdtMIFodidmihU7Y32znyQwcwKJ/M9OhtPBIl
	 gCBUsckMdUb7Akdgtbs9+eRqQu6WxmnZx03nECcavCefS9cuzOYor0BI99Szs1RnE7G+Y
	 el+E8dkhw+D73KrpmGy1rcFbO2+GcWtzAj5gV8IJjyaPClYJnLLxmS9bgEQnMbfTTUokP
	 6EEOXk/BIURpeqhjld1YYf3o7kncG+tr6hDHjTHVNFzwRC5WZqcPtAJCqoSAsaYe8EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=L3q8fkEC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD50606A323;
	Tue, 17 Nov 2026 01:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DD50606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=L3q8fkEC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=z1XCGeIJ+rg6XMddQPk3psrr5sIk9p5BAPCzdErJaPU=; b=L3q8fkECVZ8iU0vjR/o2pLd+uW
	L82+T0AgJjYNQGoYVq0CPJ4JURECiU6GpxLsYM1qKIeuiIFz7pZikb6jUVe2ZukZ/lAzL2VaJ54vJ
	y7j0US06hJNir+s27C1/2yP7qwtka9IDkJns3AjTg0LXtxsbx40G/wNPAEjEuPtnK0Cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT7yV-00H2s6-UC; Tue, 17 Nov 2026 02:27:07 +0100
Date: Tue, 17 Nov 2026 02:27:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
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
In-Reply-To: <20261116164847.3432765-1-magnusleatti@kernelriot.com>

On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> Hi Yao,
> 
> On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > power-on?
> 
> Yes. I pulled the power cable, kept the driver from loading and dumped
> the registers before anything touched the chip: OOB WoL enabled, eFuse
> address in filter 0, PMT armed for magic packet, receiver on. The
> packet wake bit in WOL_CTRL is clear.

I've seen BIOS poke around in PHY registers before, especially if the
BIOS has an option for WoL.

     Andrew
