Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794077206;
	b=gH1AoFyry3ju+oAguuDi5+sZidzw+x8YgfgrJHes7TJaJmzbLvL8SMyH2RwPXY1lF1Ch
	 oD80CsrbpakFNyeH5QPybWiUMLiPSg4xhgQkppmpp51PeI+IoATPnPSwRqTuyph44y64p
	 zrk/z3yZddAVlZTPxcFZ22V5V+vUA9nQfxsznDeXP4xUWRCrnzQZkkP4LTRCnfDF0pvB+
	 O7jsnwo3eOrgjhZGKplWOLgLWZH0dGV1e5xiyCzbIHXyUqVCK9ICJNsq5q6+5q21ldfPK
	 b1wzmITWRMJNYIoU1VzyhVhLXAqbd+sgLZXe4XnQDhBWOXQTnrVGcLckZoPNQDhQFIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794077206;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=WKXSp5E4s/N1g/AjyLpdmHZ+ZbLwA33yzXCjwWw6QnM=;
	b=d2KrQKoLp+tf8aFS26BrayKbh8vnEc/SgaBSHp8psQ869Gr8sJYwhwS792Z3+czq1ipm
	 3VQKo0tTGXDU8st3z52LZovFMra5G51SYiDknh7AZhFoDYhwmdLJS97S/+xKhcCBFGo2S
	 bP4IS7gMmoBP9R78/XUTir9W9H024zRrpaiw870Wky1Q5okFZKdrgi7JH4K5yMi8sfhtq
	 n/tQo1YBzRTTg/mV55pcw+3JowhqT7B1c2AG8yfvsY5/kRGzGutIO72Kxi8oyh+jTzMzg
	 0e3/xLoKI6Eamzs5ZTu+CiY/Nk6sqp1gjEoiEGxPUNfqo/UPRdXwhsZ9Ob/41/gAAnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=aSRLOajT;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55515606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:46:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55515606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=aSRLOajT
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jMQ4d6FSzz8t17;
	Sat, 07 Nov 2026 19:46:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794077201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKXSp5E4s/N1g/AjyLpdmHZ+ZbLwA33yzXCjwWw6QnM=;
	b=aSRLOajTnwysnrnSlz7vzFkxh9vJ63ES6YEeLzkWJP3MO1DemEIuoyPbp9Da7H5oQzNpLG
	8Z6hFswXO2+347svLGKBr15RYI6KAshDbR/klFTRwl2bwfs502vXLj/9VnC66tYCKOkJuD
	39bcdHmnynC6UzcrEQG0L6ieinwDXhR5LoxapMNc3G+Ia6EeUrDsx4WYs/PIq8LqYYfQJM
	bjj98iJOgAZWb2NZH3naMZOWbPJGFVjc7+9ldfSIBKq0u9zgecPhz2qRC1JdQ1xP5Tqqmj
	pq/C0wZfflUbbmtsXpmhE2qQIxioRzICp6DvbpmGpvDnIPEHA5YqEu49JC4QNQ==
Message-ID: <2208f75de73582e4d86e9f276fb3dda8751a9c56.camel@mailbox.org>
Subject: Re: [PATCH v2 5/6] firmware: raspberrypi: Document memory barriers
 in property list path
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Sander Speetjens <sander.speetjens@gmail.com>, Florian Fainelli	
 <florian.fainelli@broadcom.com>, Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>, Stephen Boyd <sboyd@kernel.org>, Nicolas
 Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 07 Nov 2026 19:46:38 +0100
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
	 <20261107-fix-raspberrypi-firmware-v2-5-5bfe605a5cc5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: q6wps7e4n8fd3gycsuy4kgwh91oenkwg
X-MBO-RS-ID: ae976b0d27aad94cd80

Hi Sander,

On Sat, 2026-11-07 at 19:21 +0100, Sander Speetjens wrote:
> Add comments explaining the wmb() before the firmware transaction and
> the rmb() before reading the response, as required by coding style.
>=20
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>

For Patches 1-5/6:
Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks
 Manuel=20

> ---
> =C2=A0drivers/firmware/raspberrypi.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index d9a569a6dae7..57f21e4e65d6 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -110,10 +110,12 @@ int rpi_firmware_property_list(struct rpi_firmware =
*fw,
> =C2=A0=09buf[1] =3D RPI_FIRMWARE_STATUS_REQUEST;
> =C2=A0=09memcpy(&buf[2], data, tag_size);
> =C2=A0=09buf[size / 4 - 1] =3D RPI_FIRMWARE_PROPERTY_END;
> +=09/* Make sure the writes to the buffer are visible to the firmware. */
> =C2=A0=09wmb();
> =C2=A0
> =C2=A0=09ret =3D rpi_firmware_transaction(fw, MBOX_CHAN_PROPERTY, bus_add=
r);
> =C2=A0
> +=09/* Make sure we see the firmware's response before reading it. */
> =C2=A0=09rmb();
> =C2=A0=09memcpy(data, &buf[2], tag_size);
> =C2=A0=09if (ret =3D=3D 0 && buf[1] !=3D RPI_FIRMWARE_STATUS_SUCCESS) {
