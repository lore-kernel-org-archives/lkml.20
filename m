Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792552265;
	b=KO9O3ebyCyxDWh/XedHkC5s6ps1F5Iqz1UOzBNiw3GkjJcDzRTUZWeFT38oDl+/O0xt4
	 XC0FPLK5geNjc/sfqew8B8FrRl2rq3AhX2qtCOcD9jHszRzkKb9m8ds/q8wdU8u0xXU5n
	 NVhIVWcYT7ABGnhtTBLx9gBNV2Whn0K7XC3bctcKS4P1aTwd76Wfe9DU/GWbIMQTvs7C7
	 CAMLFnOfZFC09Z6RwF8ZZDobe/a86RSS3aAUNkMFohJNg2Qet5QCvvqQVB3XS6piclE7i
	 v2eZzem0vlCLIinjvjFsbUlu6a+JL/lNhq5ckvVqJv/icMJcpZ5ZJTi1j1vxhDwG80Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792552265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=oDdOwoPRKgzJn8S8b+817xvgktjeviRaDZhc+NPSvXE=;
	b=ieY5Jle8WycBCLktiQ5eFSsOCzsCT88nuRRTGjS97mpoWGXZzp46FNs/cism8UGa21HB
	 9ut2/5JOVzV7/TXhh23Dv4ELR2DejetzNGaErp0EQGyvSgtWE4Iwilf7yt0f4QKI1qO4E
	 yMPE/NNoPAC24Do7QFXUqIBKo1PXCr1xJQh1Ri2/NRZGBpGwMlZCwbWsWFWlsXxzGevi8
	 9F0UHT0TfmT8GwXS276d9mkkjml7D14Owuqc4qROAhAhM3bxnkpo4yTIkee2ot8I6eXAL
	 WP9euDWb4qI3jcZMDL5mB8oCYCEaJOjS0mfc8igs9UG73xYJaIJpuZemR7arxogMkKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt6kHyl2;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E18606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:11:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60E18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Wt6kHyl2
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9995ce866so2160115ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792552265; x=1793157065; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oDdOwoPRKgzJn8S8b+817xvgktjeviRaDZhc+NPSvXE=;
        b=Wt6kHyl2RRla0sGAcD9y1THEYBYw4dDS3XucI3W8bwyIaNGEaYl+usZGOB6n2uYVks
         EEy0WR3nAby5k4KHJCCjgwdvgxWenXN1vts2YrE0btJVQSC4qQNEJIJHfMpb60tEOibJ
         cGJCJw6s1zpYNuB/i2pBk1iRiGhdeJrmfGR78gssE5J2mY9BkxYnTnJznnidT5ohxJtg
         WculERUSuEi5RloxAwHKp2TCaMsJr10ZPLWB3Xg3EN4yvUP8XroZinHQwzetzDkPHsfP
         c4BzaaMTY4C0ppHcQ7GjfIryS3OKPMWfMpSThg45D4/xMj8HgmPblbnMX5W28NS4lUC1
         vE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792552265; x=1793157065;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDdOwoPRKgzJn8S8b+817xvgktjeviRaDZhc+NPSvXE=;
        b=aXbsQFHiHVgWVyvkOIpVKvfUIYS4XpMzEPy6iPwdrXVoTplqEnZIuWop9WQYuFU4zY
         hkqzjbTQXmWfw0hUTjQuXPgGFxzCuR3y7m4qbIy9l2ihKUqHSymnwKdcnqzwbs+gglUf
         RLfA6goDjOLZGfz8iqYXv39IYSDes5LT9Y6zV87q8NK3RdxVkl5GvZIOssgkM3QJyI5P
         NGnmB4GS48cU/173SYRgyXPgTGeXAm+4fgTlHLETP2+vhTZl62xdXhTNqAhRpXi1jGlP
         rXfq6+hdp5oMr8VuD21O8TDR+/YrVV1c/oGU9spQ9DcjW31RU6gxj4oKvoPmgpIcP+87
         ZQxA==
X-Forwarded-Encrypted: i=1; AKwUvBzrTzCH/Me7gRIHu9sb/2Wyny2QVqRjm2ArxsTGYeEr5fxeixhILo1c7aZDlzG4CUHIG43EKG+TCHDikNI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9G/IHJf1pweYzfTnK8wgmKaFK+DNuwR3gpC8R9uizsC7n7LMP
	Bb9Jc4vgyZDmL6ctKP9fge0dFodNZBYM6Kg2evD4EcR5Xs27TSHJK1gF
X-Gm-Gg: AYBFou3yEYqoCrjtaWajMw6rFvplHzaH5cH3VSl6hj26h9qodb4Jg48C76kSx6lOCxK
	NdTQk9IrwyP/dCsncBWw2AIgx66qMsMxOg7dxmH+W6q2mc6jhRYS3bmpYdXI1X5UbGUNMrbFLaF
	hGnMUVMRfBuGzl5gRNXi7t5xQwLgIGCS6FRPQAX3nvkmumSoLdfZNeogLWDa0T2F9CA/c9tWAFf
	SWeWpkfVgNNxBQE5ON3qypG2DAakpCz0zJhh+GDMBy4TErT96a8LScI0hTYEWs7GgtHTQYlz8mN
	UJ1OZim46IsK+ZU4WkEsSYChBinuij2/MvFGNvY6uGWShvGtViCCsBBu0XQv748Jhj1tTg2L1j6
	L9k7fnpO/h64FToHw1MFFPyil9QmJpSG7Sm7d8jGJcB50dUsMq6QMQBEtgiTxxPLbRJ0arEovrb
	lL8KKGHgv7lF45frYGZ1QyTLhsVqI0dFn6G+wcITi7K78mE0G4CW1rU6uCd2PNiRZbBH0zu/4mI
	8Xenwm/6R/uvY8HQ9sNEwB/C3p5ZMIAItUA52QCJ10ALft50BTCfSTHAzf72Tuc/nG+//Wq7N8q
	I2qGq0J4XPgJ2usX7Q8VY4ceVGR+nZwrV/O+6HEeocVx0L4gl6VrtTWhqQ==
X-Received: by 2002:a17:903:22c6:b0:2e4:b37a:d583 with SMTP id d9443c01a7336-2ea44041d55mr5908745ad.61.1792552264671;
        Tue, 20 Oct 2026 20:11:04 -0700 (PDT)
Received: from localhost ([2601:644:8000:37f::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4af4dasm5066765ad.75.2026.10.20.20.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 20:11:04 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 20:11:02 -0700
Message-Id: <DMA6QT4SYA41.3VGVOVAWYQMS6@gmail.com>
To: "Andrew Lunn" <andrew@lunn.ch>, "Rosen Penev" <rosenp@gmail.com>
Cc: <netdev@vger.kernel.org>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Christian Lamparter" <chunkeey@googlemail.com>, "open list"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: emac: release DT PHY resources on teardown
From: "Rosen Penev" <rosenp@gmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261020223002.1749284-1-rosenp@gmail.com>
 <59c8f008-9ca0-4620-9a54-e73da131ab6c@lunn.ch>
In-Reply-To: <59c8f008-9ca0-4620-9a54-e73da131ab6c@lunn.ch>

On Tue Oct 20, 2026 at 6:05 PM PDT, Andrew Lunn wrote:
> On Tue, Oct 20, 2026 at 03:30:02PM -0700, Rosen Penev wrote:
>> Disconnect PHYLIB PHYs and deregister fixed PHYs during both probe
>> unwind and driver removal. Without this cleanup, unbinding a DT-based
>> EMAC can leave its PHY attached to the freed netdev, while fixed-link
>> instances retain their registered fixed PHY.
>
> This driver is quite convoluted with its PHY handling.
I agree. I got this LLM to convert the whole thing to phylink. It tested
a bunch of stuff over serial and ethernet, which works. That's net-next
material though. It'll probably get rejected.
>
> Please split this into two, phy_disconnect() and
> of_phy_deregister_fixed_link() and add better commit messages.
>
> 	if ((dev->phy_address =3D=3D 0xffffffff && dev->phy_map =3D=3D 0xfffffff=
f) ||
> 	    of_phy_is_fixed_link(np)) {
>
> 		/* PHY-less configuration. */
> 		dev->phy.address =3D -1;
> ...
> 		if (of_phy_is_fixed_link(np)) {
> 			int res =3D emac_dt_mdio_probe(dev);
>
> 			if (res)
> 				return res;
>
> 			res =3D of_phy_register_fixed_link(np);
>
> The logic here is more complex than
>
>> +	if (of_phy_is_fixed_link(np))
>> +		of_phy_deregister_fixed_link(np);
>
> So you need to explain in the commit message why it is correct.
>
>> +static void emac_cleanup_phy(struct emac_instance *dev)
>> +{
>> +	struct device_node *np =3D dev->ofdev->dev.of_node;
>> +
>> +	if (dev->ndev->phydev && dev->phy.address >=3D 0)
>> +		phy_disconnect(dev->ndev->phydev);
>
> It is also not clear this is correct, since a fixed-link should be
> connected to, yet a fixed link has dev->phy.address =3D=3D -1?
>
> 	Andrew


