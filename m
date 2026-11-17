Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880969;
	b=QS9t9chlQn98Q2ACLoo8Pd3G+9JPxmxbFI/wz1xx4MuBThPPiuGrM+PhLXfEWQehn5Fn
	 PnQSiMFIP1HTjC2SE0j1TvQXNk816d3JOrSFjv9UQTMGc6m2KvX+7RPQVuH4s5Hlv2mOq
	 P/xux1D+q+Xib+EwU/VQDFT9bgvpoQjsvR1KVeHcQ8TafEa5pMuN3x0LUo8sb1zm9n0cp
	 AAb41kyAxkCmX1LcO/R0XdVG/GuDd7k9fh04M7aZw5t5CPCrcyNSlBm356HY3StjtTgPY
	 60wbWgARnpj5mtsG3WuKKcIAu52KzsDdWQQpCEfb51hs3JRDFq8oPP2bqnuSY8r9MsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880969;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=MRF08aFBXgU2l6OUfm5zFtDX8nOfgsxHUcTeiMrhELw=;
	b=0kreYLyM3qeR8ieb8HfpptHmhJ1H5cTqKv2srEIfqIcT1GDA5TgnAQE4/wwLjkidXIf4
	 oz/yPBn1J+UJVEPVVu3fG4L8OwRFNNOlWFPeOD7W7V48aWes4RxNBr0ZxagvNzaMDcseQ
	 qxMasdM1whuaWzjcTiJ/X3Pcc3CGEi0oYcTG7OaSgljm/vlXMQF2iu0utStPYtRRS5Wgd
	 W7jKoKjgc9WazAR9ioST9YlnInEd6xgj6Xmx8BfssCppSkP1UVcOeFx9Oict5EHgCBw7/
	 a8Ri16JbV/WCqqW7BdhN49B4Vg8RgiUKE2IiQQ0JLtSVWoZwuojIiEVz7iFlvXuuG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tSBvRpeY;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E16F606A32C;
	Tue, 17 Nov 2026 02:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E16F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tSBvRpeY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MRF08aFBXgU2l6OUfm5zFtDX8nOfgsxHUcTeiMrhELw=; b=tSBvRpeYbUDTnZ4LhX9sd+RBx8
	el47JBIuaRitKXe4TMq7/MhqV5hGNBxUdhmMOR7fVTXGXM/0C4w9Vjnz2vjUb9uZmBcrUQ3hlaYo1
	9zRrxk4yD1GpKVBGqpMTv/NqCZDbUI8YLfJZOJ3PlNcUZdAdbwclvs7pWMEAVA3Dlqmo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8Wu-00H389-GB; Tue, 17 Nov 2026 03:02:40 +0100
Date: Tue, 17 Nov 2026 03:02:40 +0100
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
Subject: Re: [PATCH net-next v2 1/4] net: phy: marvell: move mode
 configuration into standalone function
Message-ID: <5701b9d3-f210-4fe7-9a3c-1508f5126bf6@lunn.ch>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
 <20261116-marvell-phy-rgmii-v2-1-e04dca67e89a@bootlin.com>
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
In-Reply-To: <20261116-marvell-phy-rgmii-v2-1-e04dca67e89a@bootlin.com>

On Mon, Nov 16, 2026 at 04:27:01PM +0100, Paul Louvel wrote:
> Move the configuration of the m88e151x out of the
> m88e1510_port_configure_serdes() function, so that other parts of the
> driver can use it.
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
