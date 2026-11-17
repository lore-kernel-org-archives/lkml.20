Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880999;
	b=tWd16HXKKBM+08rYqpi3durNbtAfMbIAsHr59dlhdig9E53CkWSTZfbi2ud/DNrfHo6u
	 lIYZF6BdTAjXRhbEz/JCy4PgMOdfxVW7w6yUJ+3hER7vNUTy+wiZQcgiaxXm+hB2igqYx
	 zb4KcXADT+M656gEZb7S3HDWYtPVG68W7rX1z/E01t53FnKBHJRVUzhbPnhPO5BaqsIHY
	 8QSSIny5TvnnFS8PQxy29nNiiNUWGJWoPClfhqlzVsEyQfiyr8yHWAxq1ZSxk4HhzTE4G
	 foLNLumwRfQtdZukuq6iPLPU1DB1RsCOH/prNcEBSpZUoPsKeJkmo614F7c0+iwEI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880999;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=cOL8N2teNxogAj2QZ3s9w+sDWkha0NfM6W36/zyXk8k=;
	b=AWyGNcjRWDH/+mP+XRLTXgcpsL7UK++cn99X8Z08QT7uY4GW7OsF88my9m+ZPi8PbowG
	 8bEmhf1P46vi3DFVbQRXj5P3/HpfcgEYeAubefsCR2ka2Izqp8Si/8WKlem6yB4BGyjXU
	 XpVXetWRJHHWVpuQxzNgFHFg8LG9+NGjmVPyH8rOu8QYHFST8FqDMZ83dsTNdTVn7qLt7
	 600Nhh37i/VNsL5CqB8mV49liwG9P9VQfmCwGIXRvpQ75KIfs2R2KBjkPa9Egw185JPHT
	 dFaQN2ociVia/5NhVQVg+6IHt/591MAaNSnws4aUZKZl5f9Wdh8DvSU8vnKw/enyBhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kqdqUChk;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766E7606A323;
	Tue, 17 Nov 2026 02:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 766E7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=kqdqUChk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cOL8N2teNxogAj2QZ3s9w+sDWkha0NfM6W36/zyXk8k=; b=kqdqUChkOKuA4n8Jn8fkv5ngVF
	mlN4pD/nCoYKAPxp2c3eBr+74fqWyH6/acvEhkkVxork8/V6E3V/VU5nN3BRWG2Z1Lu9M+/Qd09pb
	SriGbrgOAJOJTYTTklVo1LeOcEUplqkpk5EDYSt+XRO+817rx7jJwDhCYID+rZch4hEU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8XR-00H39E-Qa; Tue, 17 Nov 2026 03:03:13 +0100
Date: Tue, 17 Nov 2026 03:03:13 +0100
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
Subject: Re: [PATCH net-next v2 2/4] net: phy: marvell: de-duplicate mode
 initialization code
Message-ID: <5e93bbae-2ffd-4f0d-b22e-3cc93570c4d6@lunn.ch>
References: <20261116-marvell-phy-rgmii-v2-0-e04dca67e89a@bootlin.com>
 <20261116-marvell-phy-rgmii-v2-2-e04dca67e89a@bootlin.com>
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
In-Reply-To: <20261116-marvell-phy-rgmii-v2-2-e04dca67e89a@bootlin.com>

On Mon, Nov 16, 2026 at 04:27:02PM +0100, Paul Louvel wrote:
> The code that initializes the m88e151x PHYs to use the SGMII-to-Copper
> interface is duplicated, and does not restore the old page in case of an
> error.
> 
> Instead, use m88e1510_config_mode().
> 
> Signed-off-by: Paul Louvel (Schneider Electric) <paul.louvel@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
