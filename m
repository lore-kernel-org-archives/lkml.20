Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778627;
	b=B1uGUlWjS170u/0rpjQaXOp0Z1QK/jHzv1up9T42Xzo2+gaN/TglMGRIjvnu5XVMZjKN
	 PLEUOlgANdPYkiamNCKcFMXLP5xbeFyvPPpKo/INsh1EuSZdBu7Fvc3qe2GRKBDWpOH9j
	 lwTIIbxU5Ok43z+drJjJ4ZWfMtcuXrbg/7s+5bCB/H7TG3bYPjbo7ESV4uOKa1FaySqBY
	 hXNBTkUkdaUIknA2x28yvIRHLWFC1c9RC0vAxPjqnyw5f5hTVGbk9Au9opNnutivkJ6g8
	 SmcMCBGL7T7VkZDEVwLvgngx6SDMwcjlodoBr9di5WBucHkBsZlKcKelSc765TivjJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778627;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ehtqtF1mQlApcVvUtORZ0T73fEOYE9F7ECr38Eww7ic=;
	b=VAT8FHv2G8U/U0mVCifpolSOWe9vmTlhYY2TCNjQjQfPk6t3tTdAZjcuB03c9y0TcEXS
	 h+21CggnoyR7L2RrdqtBqzwvgP0LX4MmlmlXfYdfQxJ6tlngMCOVTv2gn4Yt+95o+npmZ
	 QFTDgWyz9lk/RiEVYLSOt4qI82V3GULJ4XpJorN9CsbMz6/vGVYDd8J9UqhgPxcwm1QKc
	 AXsq8k4ikRmJb/XvHF239aBy2vKwLvLWM0cZaVtHMUuwesBmJLu0tTmvMx462Fl1nIy/P
	 VGpx7GNG/NgYMDcpMzbthrpmcjkWarr3W+4BHWbzgrrJtcBPhmSdj43DqirCtpV1YSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835A5606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835A5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so163222a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778627; x=1794383427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ehtqtF1mQlApcVvUtORZ0T73fEOYE9F7ECr38Eww7ic=;
        b=ZhKvUgErssyYpnlwY/0kppOQqD8e5ayfer7Rxe1nM4PA58qKBpenXsCQjPGZI2x9Kw
         ltI+rZ/PuHoV7fjGPFAX7dBuZi5vtmfq1s7TSRHdsHUTYMf9pIBbzE9xWQqtu5ROng91
         ykYVSejg6WjvfJdabAH+g9TNsLQpTXbI5Y4QqO12n+vYKRsNSA8GA+KwzGBL/5U+hp8a
         ayAmDBucskExMbglDS6OaaISf8G9ZDOFkjpJa9HVe9kHXgJ/oJG3u6IO6pl/avnxFAGG
         FidH+h7s/E9ddSg1RSq5jhkwN+sH7mKS53lis0QbH4QvhP3dhe/Mx0z9GkQFgHRhfBYQ
         MgPw==
X-Forwarded-Encrypted: i=1; AKwUvByA+HYi3kPWuYq2MH8Uq1VTBdsaBefjFbmfKcZAc55PLrdZaozUfltMfEYcnVLL7gEbezWGAvjEokUd6xE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+76P/rFnYpgy05R3nU4Nb/wtc7JSH2lxg0tEv25C7MfiaV80Kd
	Dx9hDAiviEoAmWtr8oI/G0+iS7MhDrIU8O+T/OhL3LVWNFp7lYRiAgIEB0Fu/w==
X-Gm-Gg: AYBFou3StuLPba3EcfNfWeDjBktJ1Ao+4KnofMBnC83aI+5sWLLSkE7t/snumv+PiQK
	SJDoQvzBzBC8QRvm/k0FU6LrrYQi6Dw7b/pGUQzPab0ykYp2VrTypSkZDepxq3gcnvW1oG+QTkM
	BcUIuCxS4ZshWZT+Ur5HvLLTtGfsL1ub9/cZCsCdX02AEQ7JQiNyfNtVsEGtbaGOEA0ZMJe4wI0
	GB7NMvNFE66d2jJOKwz9WP7sNZCA/oZnK17vkXRwwcBZjOVmhv1AY/AOqoRWEQPnb7sRjEzQU+c
	95qdgeYXhFxX0GIc/+SxBC4i4qQm+nlE/0ni8GytR1T9jx2TB/Ah/9Dpkw0whTg23Mt4MOWLigJ
	DwvOnyONcyn191jL+gV+8oZ+JsZPu8y8QShY6in7k8hHwZsiQnW/2d6LxDavuFcfRxd8+IelLm1
	iEUqEUIYy/fSdLCaR1OZBFXW+W4Zz4LUNp6LaXEk4QbtMwMKabUG5d/9MPQW4zKuY3Tx94O9L48
	ODhKxRzdOA/z9TVrYPaHYfigoU24wGRayUkr0CCI9hGEjT0dk41BuWbyh8ny/4TZa2wYXsShWNO
	hQd/XSw8aDStekYEJRUd/QAKKVKB+m+/EfspveyTNHYXRKlzJr7ScRNYDYQ6j5kHQGPNh5UKwh4
	BclD7BSYUTpY=
X-Received: by 2002:a17:90a:c241:b0:3b0:96b4:ceb7 with SMTP id 98e67ed59e1d1-3b096b4d4e3mr998271a91.8.1793778626842;
        Tue, 03 Nov 2026 23:50:26 -0800 (PST)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com. [74.125.82.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0951af0bdsm2859568a91.1.2026.11.03.23.50.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:50:26 -0800 (PST)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36cad25b8b0so559501eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:50:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw2EkiHhrRvq0FOZlHXxuS/vqNqkMI19klaCC+UKUU8Pq5v7e8M8jzZm5XKDe46Gci+YIPTS2ZzeKjP+Mc=@vger.kernel.org
X-Received: by 2002:a05:7300:5626:b0:36d:3c0f:cc85 with SMTP id
 5a478bee46e88-36d3c0fd4ddmr336931eec.5.1793778624811; Tue, 03 Nov 2026
 23:50:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-mxl-gsw1xx-reset-v1-0-53839bf5c88e@telaak.dev>
 <20261104-mxl-gsw1xx-reset-v1-2-53839bf5c88e@telaak.dev> <aurg9vX3_i_ewWur@makrotopia.org>
In-Reply-To: <aurg9vX3_i_ewWur@makrotopia.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 02:50:12 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ60av3BuwZLLd0hPrBwoG3pkn9F8UkC+_R955eR-hSgRg@mail.gmail.com>
X-Gm-Features: AclHuK8ba1AdAyiGMIqLrEIrq97_7kEVXJoVGnwsPAzijK50SZ_tiUWACXQK9rY
Message-ID: <CAPY4CJ60av3BuwZLLd0hPrBwoG3pkn9F8UkC+_R955eR-hSgRg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: Daniel Golle <daniel@makrotopia.org>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026 at 07:38:30AM +0000, Daniel Golle wrote:
> Any good reason to open-code this instead of using reset-gpio
> (CONFIG_RESET_GPIO)?

Thanks for pointing that out. v2 will use the reset controller API, so
reset-gpios is handled by reset-gpio.

On Wed, Nov 4, 2026 at 2:38=E2=80=AFAM Daniel Golle <daniel@makrotopia.org>=
 wrote:
>
> On Wed, Nov 04, 2026 at 02:15:48AM -0500, Joseph Telaak via B4 Relay wrot=
e:
> > From: Joseph Telaak <joseph@telaak.dev>
> >
> > The switch keeps the configuration the bootloader left in it, and the
> > driver never resets it. The MDIO core asserts and releases reset-gpios
> > only for PHY devices, so a reset line described on the switch node has
> > no effect either.
> >
> > On the GL.iNet GL-SFT1200 the bootloader leaves each internal PHY of
> > the GSW150 one MDIO address above its port. Port 0 then fails with
> > "failed to connect to PHY: -ENODEV", and the PHY that answers at a
> > port's address belongs to the neighbouring port. After a hardware reset
> > every PHY is back at its port's address and all ports work.
> >
> > Request the reset GPIO in the driver and pulse it before the first
> > register access. The timing follows the vendor driver: asserted for
> > 2 ms, then 100 ms before the switch is accessed.
>
> Any good reason to open-code this instead of using reset-gpio
> (CONFIG_RESET_GPIO)?
>
