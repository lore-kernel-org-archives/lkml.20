Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159E492E2A;
	Mon, 28 Sep 2026 09:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588845; cv=none; b=XfnFhd4raXHGc5Hgaw/ZXjMk5QpbyjwyCY+NgUcMBJ8yJubEaar6sMrut2oYKR7I6ns4wcwDPr0zPtO5ptm+TQGkfGtjv+OZSbg1MCfR9d05zDxUxkZj53EwfTRNDNHvmADhLey6qRNSnC6frkh7J5/D1EbaHUwCIWibDa9L740=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588845; c=relaxed/simple;
	bh=x8IcyEdnz/NL6qJ0Go7WA7AoawfT58HR14KtzxeQ0l0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MqX8O+X7djo3R0Rrb9a6tpNBYGKRr9CSZE3HEE8CrbzpookWVuYX2pW38eIcD3N9+Wdhb0jcxAHKTARykmVGJ+9iS7jY+Y9cBX6kh7aGWj5eHUv57QFOh+50fHji7qxoSXrPVyIlH8UU1TcwXBNb56OQMdgS9qdBk44kr0xsxjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bwejCrD+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bwejCrD+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=POZLvRoevrQRe8ReGi7VrXpFypFOGxEFh47NX+G65io=; b=bwejCrD+YR18/FPRfIG4n2WXMz
	tosFyv/GgfKEf06yd/8M/Z0arpcC60MVmvgV427t6AHz07To/VfjXsoHkbt59uMus77NceF7XlNuR
	It8JCbqgp/uLnP8VdgiAqTrQa4qzASBVD+CDN4cq7d8WlMTa0cCwTUWv8SDWPbQIet/nGVYu0ZZ5L
	neqJgnbWrVAJxkW0hmwveXJPx//2NNzqnCcxoqr8Lct/I+Q/FDMmF0xJnP9Mjh/7y96CRfoc1McEy
	sRviPEE+MbR18aoKUTkbW6TVZEPS6gcf1OS8FlBkruydMnxlHGyb5EN4F5wrggPaqed8JmeO+KP8x
	mUhgbGGQ==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7x7-000KjR-1N;
	Mon, 28 Sep 2026 11:47:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7x7-00097e-0C;
	Mon, 28 Sep 2026 11:47:16 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?ISO-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 7/8] arm64: dts: imx95: rename bus@4c100000 to hsio-bus
Date: Mon, 28 Sep 2026 11:47:14 +0200
Message-ID: <3065655.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260925-cleanup_dtb_warning-v1-7-f999fafbca60@nxp.com>
References:
 <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-7-f999fafbca60@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)

Am Freitag, 25. September 2026, 18:37:56 CEST schrieb Frank.Li@oss.nxp.com:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> Rename bus@4c100000 to hsio-bus to warning (W=3D1).
>   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_=
address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ran=
ges property
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index d20c2498b9aa2..b8711f9f846ce 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1875,7 +1875,7 @@ hsio_blk_ctl: syscon@4c0100c0 {
>  			power-domains =3D <&scmi_devpd IMX95_PD_HSIO_TOP>;
>  		};
> =20
> -		bus@4c100000 {
> +		hsio-bus {
>  			compatible =3D "simple-bus";
>  			#address-cells =3D <2>;
>  			#size-cells =3D <2>;
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


