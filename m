Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769159;
	b=TIDKjJcStuhDriL0nyFCpUbZmyiWrvCWWS19XSknlIO31XOFdV8l6Zdjo2admLjKlZ7N
	 x+zsWzUQJTsi4nNMgsWxVERn5BDWz1raR3GMFwvNGf89yhdh7/qrrkuhCvQ34sMtAS32h
	 Awe4focGCD1AZcJixGh9EfOkR8zQaWe6LqYt18yDCtuKK942ndcOe5SZzffpe9mQoJ1/I
	 scXkDCCdp+0D2q2GGgP+rPzDlzB+2YlnWxUNfDdjMHEk8+fuqo2skEwKW4y2iSHkZmvqg
	 HrOJd8v0j/zain1/NkxhdxXLJW9oi36n2mhRU5+nOb0dLq/AT8Tlrz+jhoZKmlIus5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769159;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=ykE7D6WtiThp3GLJUoPg9fvayjrS+VOMD2ZgX4Sxk/0=;
	b=udj4n1pP5p91Igdri6FwTvNYAHohMQid7YuYSdDBhaVRmxmpvj/TYnYEY6w78ORhF827
	 tWjWCXuQ3RgUEGw+khjSsjlXLZaXAAmpv7Rvi6FRnyeyFuVkBxXZIu0v+0+tUL5k1HwsL
	 9EgOzc2Z4CkkDM6Pmp3Hvvstd03xc/KFeaibRaFOZBNbWoU/ONrXAnO11qbisrAqHjXB2
	 rSffH+Sfy5TFeuqcgCXGOVm5fS+8+901qAewmReqQloemYzxiy9QXg6wtIptVMjBfW1fe
	 aJ7InMW9z+F7Aoj2EQCkuTbDOLyd0NMCGd9j7nwmaBbM0mVb15OAVBd1uolY/Fdz1Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Egc+JtXD;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E900606A31D;
	Sun, 15 Nov 2026 18:59:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E900606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=Egc+JtXD
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B225A1654;
	Sun, 15 Nov 2026 19:59:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794769156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ykE7D6WtiThp3GLJUoPg9fvayjrS+VOMD2ZgX4Sxk/0=;
	b=Egc+JtXDoxiPXp69r0Sla0rHxBu/kRo4aDwcU0qOX5Tn1Rqm2rJ4eMGgeuMcpDKX3Kv0tO
	uIxnYX6YM1JNhSF2UvGQ7ROI5xsprwDQXoV2YSKahp7BpJVbJdKduGEWXWlN9qZOSKIe9v
	3iLh/XLBkw5Rwf4UktCDxswWS36JvOu44KMM22tjjSuKR0+Su2FsH0l+RFXPMnn1cDLFvI
	06yWqKJplxR4aV1emSXym1hhi05tM6kkjl7/DZhaIRStWv4Lgvu1iCx2vPu2PNotSFUyGI
	ko2qdDEptRMYSaorbmRNnDbhcM1NatDB8MMXQDOF+In6dH3yUEy2o3Djn+zT1Q==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 19:59:15 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Justin
 Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
In-Reply-To: <20261113211554.2058181-4-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-4-florian.fainelli@broadcom.com>
Message-ID: <7cb0d621e794378956b737530ebade24@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Florian

On 13.11.2026 22:15, Florian Fainelli wrote:
> Add Clause 45 read/write support to the UniMAC MDIO bus controller 
> driver
> by implementing the read_c45/write_c45 bus callbacks. Each access 
> performs
> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
> under
> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
> MDIO_CFG is only written when the mode actually changes.
> 
> Also skip the BMSR workaround read in unimac_mdio_reset() for children
> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
> expected to respond to C22 accesses.
> 
> Note that providing read_c45/write_c45 also makes the MDIO core scan 
> for
> C45 PHYs at registration time, on addresses that are not masked and do 
> not
> already have a C22 device.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> ---
>  drivers/net/mdio/mdio-bcm-unimac.c | 105 +++++++++++++++++++++++++++--
>  1 file changed, 98 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c 
> b/drivers/net/mdio/mdio-bcm-unimac.c

> [...]

> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct platform_device 
> *pdev)
>  	bus->parent = &pdev->dev;
>  	bus->read = unimac_mdio_read;
>  	bus->write = unimac_mdio_write;
> +	bus->read_c45 = unimac_mdio_read_c45;
> +	bus->write_c45 = unimac_mdio_write_c45;

AFAIU this breaks GENET without DT (e.g. Pi 4 with ACPI). Arguably an 
edge case,
but last time I tried it worked at least. With your changes all 
addresses get
a C45 scan there for which the empty ones return -EIO. get_phy_c45_ids() 
passes
that up instead of mapping it to -ENODEV like the C22 path.

A cheap fix would be to do the same mapping in get_phy_c45_ids() as we 
have for C22.

Thanks,
Nicolai
