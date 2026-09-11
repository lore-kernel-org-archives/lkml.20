Received: from mail-24426.protonmail.ch (mail-24426.protonmail.ch [109.224.244.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44303CF678;
	Fri, 11 Sep 2026 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121455; cv=none; b=e98G82q+DgaT9qGj5+CrvSImOsK1QmqB8sKaPsZCgvtV+7KoZv92CtX9Uvp0NDHrLwP28r7q8jJb09MQ7+WRZfHNJmThQLMjdNb32kyCcOLQFXW00aPU2UGPq3KKD+D6vSwXrmyul6WlkGzXnRMRuJF7HAL6a5LNHG+AqYG7qZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121455; c=relaxed/simple;
	bh=MSWevP53C8Q6MrXfciBdxj/Cdx8QYxWtWbfw+VGEZ2M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UC0dc2e/lLIBADLsGQXadUo3qMY4Hwn9uWFXudq49RozrVpsL94AI0ej5v7NYzU9cTSDTK9anbcPNLCXct0f03t4sO6/XnC4N8F4s89KMIGOCO01t2GMqv2vz24xM9c+7H6KcFsqWbehlwq1SAOlNstFYnVRM/ff7NbN8gpcJsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Z5RSvMEK; arc=none smtp.client-ip=109.224.244.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Z5RSvMEK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789121442; x=1789380642;
	bh=TR16N+4ADKrFb2rQCDGPtxGouDfb08VqJfQdDPg1AHY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z5RSvMEKdVV48+7XYNH7tcrORPbnewIZTKfKlcC8ybImIlghjfTx6vAJeaaBCdEPh
	 RDotQMQQWKj2gLXqU05EyW+lqe6P7gWsA0WihbKJotPYk9D6XyvFD9U8UP4Oj58lVC
	 GknWEAVeXUUICmnAdU2DNwH/4soaNdTKigYLIgaZ3ZzFU9vDPxAhRNOVpzl7M2knZA
	 IhUySoVrKsiyiYETYgbywxlwzRz5REjbkTGrUvhm9SU/pCZxiXkjwEm0L6/ETlA6AS
	 mgcnWTr5Nb+bWEPJjwBPIEvRjFEl89w4eqxuCau7D9FoiCd6qPWmyJKy7eO8F7H4Gb
	 4YYsKu1TdHMQQ==
Date: Fri, 11 Sep 2026 10:10:37 +0000
To: Chukun Pan <amadeus@jmu.edu.cn>
From: =?utf-8?B?5a6J5a65?= <HystericalDragons@proton.me>
Cc: Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "diederik@cknow-tech.com" <diederik@cknow-tech.com>, Heiko Stuebner <heiko@sntech.de>, jensen <jensenhuang@friendlyarm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Message-ID: <8wGuvZ3pQ9BL5NIu1j8OzFUTjHePGJcrftcKEe0xkosyORLPJUmdHI7nOCC8o187x1s8ev84HLiBKdNjqQvu3U3upIeSp2A4AImHdD4DOuw=@proton.me>
In-Reply-To: <20260911065500.3145846-1-amadeus@jmu.edu.cn>
References: <20260909225002.976-1-razor1702@gmail.com> <20260911065500.3145846-1-amadeus@jmu.edu.cn>
Feedback-ID: 91982645:user:proton
X-Pm-Message-ID: ca164b9d304b3858ce2f8f1bdc7902d6623f2398
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Oh, sorry. You are right, and so was Jonas in his review of the identical H=
28K patch. I should think twice that thread before doing it. I was too hast=
y and failed to reflect the suggestion I had received. GPIO4_C2 resets the =
PHY, not the bus, and describing it under &mdio1 also breaks U-Boot, which =
reads `reset-gpios` from the PHY node ( `drivers/net/phy/phy.c` ) and lacks=
 support for bus-level resets.

I had only tested generic-rk3528 and didn't check whether a nanopi-zero2-rk=
3528 target existed. Checking my own setup afterward, the R28S I develop on=
 has indeed been booting a board-specific U-Boot target with the PHY-node r=
eset all along, exactly as you pointed out.

I have droped this patch. And the remaining four only add R28S support. Tha=
nk you for you sharp point of view.


On Friday, September 11, 2026 at 2:55 PM, Chukun Pan <amadeus@jmu.edu.cn> w=
rote:

> Hi,
>=20
> >  &mdio1 {
> > +=09reset-delay-us =3D <20000>;
> > +=09reset-gpios =3D <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> > +=09reset-post-delay-us =3D <100000>;
>=20
> This is an incorrect change, see also: [1]
> Since you are using mainline U-Boot 2026.07, you should have
> already noticed that nanopi-zero2-rk3528 is available.
> Therefore, the nanopi-zero2-rk3528 target should be used
> instead of generic-rk3528.
>=20
> [1] https://lore.kernel.org/lkml/1e8da54f-ef87-4d31-9a0a-17c0ff66bee0@kwi=
boo.se/
> 
