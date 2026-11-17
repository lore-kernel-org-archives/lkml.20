Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908009;
	b=f5aBN+uMBBXaIFw9K4SpKlyMT9pSs0V0rf+M6s1yeRoaU0i06gHtJsO8c4mLfxnzagV9
	 KHzk66Ix4D0wrpd2m216uqThUZB6uJ5SyM33BRTn0mugZAvrIS5zc9DSdL9/IvcmUmbze
	 VeorYK80O0FXckv6Ho3REDgtmd/jdzc0mg2f9mVYFsfhagTf/KQ6oPLXpkM4X90HV8bsS
	 S2bxDjTt99Cgcs7BSZlDRranJ2ilu7jdbRZLWIGLuH8BBTTos9H+71hRPEl7LHZ6uZXgN
	 AilLhyCESh553uk3CdSGG8lK/LJK6kizDmMFNMntGymYo1Kxwp618HySVxgddazlQqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908009;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Hm9omDHKcVbk1vAST3xtAg1ZnIT3HjaHoa+8ATARj3g=;
	b=uelUecEvIyUIqxLoYRENw1snyLkLk5sTP9RVK61Ed9cgnvLFN18ARKVf3ROWZ2lpS/7d
	 eTKRc4woJz2IuAvXxTuHxiiiuHLwkqSJPHUh1bi5viFP7hDV55dSVaK0XDYjUxNZOg4pr
	 1AB9IOykGZ6hBaSbgY6vOR9WtZT8LBYrdRvdYntWcgOc1Q1UXBx1w32RXgh4JHZmmSGHj
	 VYD5HnFNkqzn2VHUoFnpaTOibec2pgcf3qfT3VkdfM1j5kKnlejAWrjvu+Psxpfva7k4s
	 aHRrCnxMdF4OCg3ksCpy8gih5Wwv6qSCX+aALWuy49rPj12XqBREiKpjXkHHPmdNbAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=MHe4y5R9;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6D8606A31C;
	Tue, 17 Nov 2026 09:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=MHe4y5R9
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D57EA02C3;
	Tue, 17 Nov 2026 10:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794908007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Hm9omDHKcVbk1vAST3xtAg1ZnIT3HjaHoa+8ATARj3g=;
	b=MHe4y5R9nYxn68Beo+dC84F/mJg5VuUMHm+gmj5mv2nCtNqhaFvg44UcOEYogf+5hWPdol
	7GWauLmyi7akLx8L7Qa0Oy/BaqmXZAXVGiQKYS2LKCQbjDczsVcYBFpdJWEAYeTz5FMqWq
	Nsyumx6/tjlKksuKGHr1+nMGlIO9XBzXqIYUznwBkJgbiTB29sfHahb78J/tQFwPAmrvsa
	yjWJA65sNpN2Mr4vJCFLJiI07BNWGlnMFhKhnLI/PCPv5OvDhIcrYbBkGTmIxXOJgiB3mP
	Zt9N3hFIAxXQ9XtWZ1fXbHzYYEB7/TTM/wYI4/NwFIt1D9sweOyPbXE6Vir9lg==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:33:26 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v2 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
In-Reply-To: <20261116213449.1682731-2-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
 <20261116213449.1682731-2-florian.fainelli@broadcom.com>
Message-ID: <5c4b81ac731b21dc598d9a693d05d468@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 16.11.2026 22:34, Florian Fainelli wrote:
> get_phy_c22_id() maps a bus read error of -EIO or -ENODEV to -ENODEV, 
> so
> that mdiobus_scan_bus_c22() carries on with the next address when 
> nothing
> answers. get_phy_c45_ids() only does so for phy_c45_probe_present(); a
> failed read of the devices in package registers is turned into -EIO, 
> which
> mdiobus_scan_bus_c45() treats as fatal and which makes the whole
> __mdiobus_register() fail.
> 
> MDIO controllers that report a read from an empty address as a bus 
> error
> (e.g. MDIO_READ_FAIL on the UniMAC MDIO block) and that provide 
> read_c45()
> with unmasked addresses therefore cannot be registered: the C45 scan 
> fails
> on the first empty address.
> 
> Let get_phy_c45_devs_in_pkg() return the bus error and apply the same
> mapping as get_phy_c22_id() to the two places that look for a device at 
> an
> address: the loop over the MMDs and the MMD 0 fallback. Errors from the
> reads of the per-MMD identifiers, which only happen once a device has
> answered, are still reported as -EIO.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
