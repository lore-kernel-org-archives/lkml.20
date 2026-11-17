Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918984;
	b=nM2tk05PfY5pFHr9ipZD72sdHc1R4L7YXDrkMXmwlMV3W7DwBw8PVstqiGikn4Og8R1I
	 qnZEV8rGMezyPLhnFuIy4s7PaV/kLs5srU9g4iHakMrjgKiH+UF9ANburFbHhBmazS9v8
	 j1llRVPVLW0qhC9lkVpKm7xDom49nZwitIseAFsnn7vmsTSVUdT+6Xy9SVWE2qo2Iz0/+
	 cywb5TvKpMNCkwfOui7j5l1ORF+VvjdC2vxouiqXOZQ8UVvot0s3HtOijwYKSPPs+9BtZ
	 CseKoX8hjuCPYOVpYstxsBa43uf6WMNG2sO3MjhQEqgHwcwoWcLEo0ccMJAzX9yBTjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918984;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=bg9Vsl73OpwE99cWOctTdHXU7tbTS+OicLl+oSU+S6A=;
	b=mRPFUuyh+XvQbYciL5Hg/nChIEjcU8+LVsgr1IXzyOLgR9MCLrCeKA/cWqvod/RdyA+i
	 Ne0z1twe6qPnO+uyHFLNm2ZSkxEu4YdtkbvKYZY+I7kFhOOet+qVA3ujadi5stFWYwRDh
	 XU+FK1ZuG1xvgAYCfqA9+HFErgbA92yJj5xU5PvkRj6pkJ8EQF2cKyMSLmtNpBb9IQZQU
	 NL59J7yRNyoRE3sZHBUg7kXimxjGMBEicQ4IlkhZg3/e/RZ6JN+8kyaiex4iNCFgHuGpU
	 2ixpMHfmcOPwRYRn51SMqRlcVPuH46Pzxiw9xJ6biRjnxDRDTAzeMcOFuSnrvuVuesQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=KQpFtbKW;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59250606A31C;
	Tue, 17 Nov 2026 12:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59250606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=KQpFtbKW
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86713A02C3;
	Tue, 17 Nov 2026 13:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794918980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bg9Vsl73OpwE99cWOctTdHXU7tbTS+OicLl+oSU+S6A=;
	b=KQpFtbKW/aYn0yLg6uHZZhZ2ZNp88McIXbyBRDWwPi3VHg3MGmW9QwrRkO5sWn6/Dj78eF
	pkGZpVsfnIau6gtgKoXzKyjj1LJG7ixtDtPah440EmTki1vY1w85jbDqS4mKQderco0fkp
	3tqhw7zH3ctgSAzCduMY8kJnk7gTFO8yn1FgV+vAg8neYV0uQwvVekVn+b9r/6dw0sTR+c
	FF+Gr3C2TwL5gtT9gV9jmG87iSrzcFUK0ttz5Mcy+9G9pxYi8BLp8sZ527++X3oZaUXECa
	lILZPA0XVUiEV4598bWBkUTECkjs3f2TSTjM4u1EzzF0X37iYjB+9cdSIqXLMQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 13:36:18 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Doug Berger <opendmb@gmail.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew
 Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next v2 0/4] net: mdio: Clause 45 support for
 mdio-bcm-unimac
In-Reply-To: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
References: <20261116213449.1682731-1-florian.fainelli@broadcom.com>
Message-ID: <7227e7df4fc7023d05d1dd16cd32f48b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 16.11.2026 22:34, Florian Fainelli wrote:
> This patch series adds support for Clause 45 MDIO operations within the
> mdio-bcm-unimac driver. The series breaks things up in this way:
> 
> - make the C45 bus scan done by the MDIO core carry on when nothing
>   answers at an address, as the C22 scan already does
> - scope the existing defines to make it clear what is C22 vs. C45
>   specific
> - rework the polling completion loop to be a tighter loop
> - add support for clause 45 operations
> 
> Changes in v2:
> 
> - add patch 1, since providing read_c45/write_c45 makes the MDIO core 
> scan
>   for C45 PHYs on all addresses that are not masked. On a bus 
> registered
>   without a device tree node (e.g.: GENET with ACPI) a read from an 
> empty
>   address fails with -EIO, which get_phy_c45_ids() passed up instead of
>   mapping it to -ENODEV, and made the whole bus registration fail. 
> Reported
>   by Nicolai Buchwitz.
> - patches 2 and 3: collect Reviewed-by tags from Andrew Lunn and 
> Nicolai
>   Buchwitz, no code changes
> - patch 4: no code changes
> 
> Florian Fainelli (4):
>   net: phy: Map C45 probe read errors to -ENODEV during bus scan
>   net: mdio: mdio-bcm-unimac: Define MDIO_OP_SHIFT
>   net: mdio: mdio-bcm-unimac: Poll for completion at 1us granularity
>   net: mdio: mdio-bcm-unimac: Add Clause 45 support
> 
>  drivers/net/mdio/mdio-bcm-unimac.c | 130 +++++++++++++++++++++++++----
>  drivers/net/phy/phy_device.c       |  24 ++++--
>  2 files changed, 134 insertions(+), 20 deletions(-)

For the series:

Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # Raspberry Pi CM4 
(BCM2711)
