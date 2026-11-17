Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881069;
	b=pKho6NkZM4ogUNSepzlZWSfWqXecWA3MBkTJJZILOpk+ewoF75IYqpM4/6LFvNYIrP9/
	 eC0z45ElUDcPYj1jcpSwAJ4PUzx/bC4B70bs7XCutxn4WyviilPjUvtaXh/XeYMF3xku0
	 Vc2Oiza7WnFfNBQiDt9O1XUHKM1oCptelZ1Lb0AIsCO9JU+SS6kmHGiNHyz8JFJyGEXSh
	 ssW4f0ztn9qxSr9T92EKq5jjisnB/2yFTaxuprfZBAmci2JKzqsPIkMR/tV4uFrBh0d5y
	 oH27i7vJP607LbwnJzA0IrVbHu5j8MHvpgJMhdEUNIrGphlEtPvljlqqublpBW/CyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881069;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yYS6INKBjNAqptOhWHzAGeyvA75hMOTGPLHZknZUCPI=;
	b=Mr6QLpz7UipZDxdRiV8NQtupBPTf8hJBQ2lKXenP1Xd6LNOy8lNuzSyykJnbuRMgsEVN
	 pcqh2rY5JEj7oze+E4N5ALR8lZ/Ikc/nnaCyhDdwwrU1lgk8HqLWFPYmj/dltIZOj6NSp
	 jqsxuO9yrvdKeAnPY6vMSJEz2UI86o/LuYc2xOeJFzrVA23VaG0l83X6ChhrHuTukuAAM
	 xBRXt7tjSy3Thkc+5NsF93nenp0ghH3Ft3JDCZPCfd9mMSSoYFDDxP0NRTnWe1JO98zIG
	 7HRAUJ741dd82CuYBfP5NrTrkSyZQkZdzyaTrXk14LN7j2F0+grA04d+S1MV7ZWgV/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SZWmavT7;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2453606A31C;
	Tue, 17 Nov 2026 02:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2453606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=SZWmavT7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yYS6INKBjNAqptOhWHzAGeyvA75hMOTGPLHZknZUCPI=; b=SZWmavT7ekj5NRY8lnc0jlTNag
	GbNvD0FEpGOGL26XTTSrwoMLRk7Fgx1S5cCbO+h/5+tNvbhFu6pSFnmUxTqE0QgsUrYF0gXGGygue
	MxS15SUEVJnKuNpTshuJSGu2Xmfwje2cIAM/FSWWR+cU6Rt8ckdCMJ/ywzCawKYTSt30=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8YZ-00H3BF-7H; Tue, 17 Nov 2026 03:04:23 +0100
Date: Tue, 17 Nov 2026 03:04:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH net-next v2 3/4] net: phy: marvell: factor out EEE errata
 initialization
Message-ID: <40aa39c5-8132-4616-98fc-163be816020a@lunn.ch>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
 <20261116-marvell-phy-rgmii-v2-3-e04dca67e89a@bootlin.com>
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
In-Reply-To: <20261116-marvell-phy-rgmii-v2-3-e04dca67e89a@bootlin.com>

On Mon, Nov 16, 2026 at 04:27:03PM +0100, Paul Louvel wrote:
> The 88E151x EEE errata sequence writes four register pairs on page 0xFF.
> Using phy_write() for each access takes and releases the MDIO bus lock
> every time, and returning early on error leaves the PHY on the errata
> page.
> 
> Move the sequence into m88e1510_eee_errata() and use phy_select_page()
> and phy_restore_page().
> This reduces the number of bus lock/unlock cycles and restores the
> previous page if one of the errata writes fails.
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
