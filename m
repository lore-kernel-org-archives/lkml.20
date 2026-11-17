Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907927;
	b=q8j2FEfHAx16/EZepY3jsD+eqeFTyOPHNWm9VaIKTAeBrSNehL/OSbLDYLJUBU1wD2Q8
	 z4IsKL2zcYXw7WqipFEbvj9vNYkZ8Pz4UdV2LWMaN+wq6y/BVy+ID3gSDpSr778Sm5Pid
	 TJ4ZgW4hmJU9kz7UTzTeAlAKUl6/HawrE1MMarj9PKyVHHYmXdkP/mXUXQ0IWJvlwUkra
	 0L2TL8zClY4o/gfXtYT9zOpWbLl6FTuEZ8ItlP49xmFM4cWHQPL9IE9cTbMvGdDosM3Ie
	 oYdbR8Ytm02ymKE9DrpK+I3bWm/sWWfYQdojjl8UR+l5M0U/zyUo0ax2r4g3eKHl9Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907927;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=05Dto7iUl2Kcv6Db4BnKcvoKyvCaav2FV7Yi0Sie90k=;
	b=fLGBGkxR0MNIclDH4JneT5lQOrYRfSB0URCbyJGCUe7blN7QEJGytXPUY06Qxwyu/+r/
	 ukdI8tTg48xSWVV3Cnp5C3c+f91AJ0q91nk1uXbZCVIy7OIvv12m7CG01FQPm0cZuPG4p
	 qgrHTnzMTJe+fS4d4bYLIAAk+us4Aq6qMH60XzmQKO9vz2j4W3X7aoOJcFqe+/SLIY2+I
	 58YinP5/ZvKlGfDVWVj7pZulz+EzPPFW2w+VH9JjInlXtIMAV/cFsinZMR5sbwUST/13C
	 F0o8QmKEWrcuEM/RVP6/AdcN6f06QP3xntJ0ADA69L337zbbmiTT2uyNbdpUiVUJEkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=f79WN7KI;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4786C606A329;
	Tue, 17 Nov 2026 09:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4786C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=f79WN7KI
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C351DA03E1;
	Tue, 17 Nov 2026 10:32:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794907924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=05Dto7iUl2Kcv6Db4BnKcvoKyvCaav2FV7Yi0Sie90k=;
	b=f79WN7KI6KzNX3KKVQTt2miTDYaOqjvWZB5rEsZdnu3Ykd1ApFURrM+lh2USYwj0QYPPcY
	GMEZJC+sbI9m7+g5VUBOMfvgNeE7k5AoSa5b3Y6gTWBJGe9r78oBfz4uFtjI+HkalJ05km
	ZkJBvRyc6KyI5Q17UHsg+Q8dHZK0BbE3FyNLBpRZU/aA/30OfY/Ws6xVi7Bj3naF0NnHfg
	zQmDpim9SMUgz+qDlj5EXFmB/g+KsYad4mhLYTAwaqryKfmjOw8CvqOcuVNhVwMMRjZrWe
	zdVlFfgY7LptorEWM/U3nU3F+bg5BmZyViKK/4t9A/CtOZOrA5wFjow56tlHtA==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:32:02 +0100
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
In-Reply-To: <3996fa8c-3346-40ff-8fa0-afa70262028b@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-4-florian.fainelli@broadcom.com>
 <7cb0d621e794378956b737530ebade24@tipi-net.de>
 <3996fa8c-3346-40ff-8fa0-afa70262028b@broadcom.com>
Message-ID: <1a2bd644b2430c88976baa29043d9c4f@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Florian

On 16.11.2026 19:54, Florian Fainelli wrote:

> [...]

>>> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct 
>>> platform_device *pdev)
>>>      bus->parent = &pdev->dev;
>>>      bus->read = unimac_mdio_read;
>>>      bus->write = unimac_mdio_write;
>>> +    bus->read_c45 = unimac_mdio_read_c45;
>>> +    bus->write_c45 = unimac_mdio_write_c45;
>> 
>> AFAIU this breaks GENET without DT (e.g. Pi 4 with ACPI). Arguably an 
>> edge case,
>> but last time I tried it worked at least. With your changes all 
>> addresses get
>> a C45 scan there for which the empty ones return -EIO. 
>> get_phy_c45_ids() passes
>> that up instead of mapping it to -ENODEV like the C22 path.
>> 
>> A cheap fix would be to do the same mapping in get_phy_c45_ids() as we 
>> have for C22.
> 
> OK, are we the only platform where that is happening? Alignment would 
> make sense, and I don't assume we will be breaking someone's use case 
> AFAICT.

The only other I could find ois orion_mdio_xsmi_read_c45 
(marvell/mvmdio.c)

Regards
Nicolai
