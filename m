Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAAF3C09ED;
	Fri,  9 Oct 2026 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530378; cv=none; b=McyjPYuoTuFMfbFAl7ZD6U+n9rxkVtQRBrywayWnAp0K64wc6h4a6NouhROwhZAAiFaCuAnVCgwBEhk/TjBpYiVqk+H8R9IiPLJ0dx65PMfJWTcerEEq5hZOfbySWnsXXLIQoiSrrQzsA8vtKhRO59bT8o53o3lVzxZQjvXHSFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530378; c=relaxed/simple;
	bh=WI37INvaBEZu19Y1qkoX78S346Q/Pw5Ut3F28r07uck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOA3PqJgTav1T0LZ/fEVMUGaMGXfmBA6CoWMLXl5qf1A/+eBiR3xCgUe+AF+upxHk3ifRHULtLB/9AjGFg+FJyBz5qSbXZPvtqum/eSWwKWMWPeEY+9Af7qyS/40Lfi0nV+LXsAJptkmlq//xjSwV3P7na1nmSUcDwIe9xYVfs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=dasyinXg; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="dasyinXg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=a/8J9ffRImKtNVgXRfCWQ7IuyliYAcjl+4vVSs1mp0o=; b=dasyinXg5c5YC9V8raqDWPImHP
	ZLaFAtOqeK/6eFGh99ixvboc5TRLL4LqbmI83EQEC7yFDUW7RbfmU8fWQ0h5F3wzWB/ocDRdNs7aU
	Mx25M1ZiXFRP1B6KsiQmYb88Yti+hdeSgb1L7I8v113gqBReOZBgVKmBp2EALwVl4oLP/4ALmSojt
	wdeRs8PbtPMCKyKtrLMTm8ifBggbc33keCoyCkodt+ugxhgxlLjIceV1drs09ZBSrlrY0X1rxJDQQ
	/MO/n3RG9Eqp8/LNKzwfQDYdUR21ZO8UCSiwjXYwbucVhOS5frUaE7RK4OTyXFa/GhNdiofR7KSzX
	9kiqAF+Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liang Chen <cl@rock-chips.com>,
 Jun Yan <jerrysteve1101@gmail.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2] arm64: dts: rockchip: Add dma-names to RK356x UART nodes
Date: Fri, 09 Oct 2026 09:19:25 +0200
Message-ID: <3055334.SvYEEZNnvj@phil>
In-Reply-To: <20261009020103.364498-1-jerrysteve1101@gmail.com>
References: <20261009020103.364498-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 9. Oktober 2026, 04:01:02 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Jun Yan:
> The RK356x UART nodes define a dmas property but omit the matching
> dma-names property, so the 8250 driver fails to request a DMA channel
> and falls back to PIO, logging:
>=20
>   of_dma_request_slave_channel: dma-names property of node
>   '/serial@fe650000' missing or empty
>=20
> Add the missing dma-names =3D "tx", "rx" to uart0 through uart9,
> matching other Rockchip SoCs such as the RK3588.
>=20
> Fixes: a3adc0b9071d ("arm64: dts: rockchip: add core dtsi for RK3568 SoC")
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Please don't do that. Uart dma can cause problems on uarts that don't
use flow-control, see [0]. So the solution of choice is to only enable
it for uarts connected to bluetooth on at least RK356x.


Heiko



[0] https://lore.kernel.org/linux-rockchip/CAMdYzYpXtMocCtCpZLU_xuWmOp2Ja_v=
0Aj0e6YFNRA-yV7u14g@mail.gmail.com/


