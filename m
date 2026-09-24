Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E083F824B;
	Thu, 24 Sep 2026 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230336; cv=pass; b=VT6oiUrEDbF7XaBMhlNu0j5cW2/sGjr48wgipQ9vfiJuHT3KIO1iApNsgScrsmh4d6PNTHU7MqbjWPqwlHmyXvmum1/WKCLdi4aiJC+3v9sLlLmdfQARx07VpAF7V4BYxLFxJhNzJ0RIar+/ZQ5GVLbZbloVISfht+7nniE4thY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230336; c=relaxed/simple;
	bh=5CwsaesIxtXVdVCGSsMdR69WVJPYY5s7p/b0N0gwgAY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Xw7uZYO1uqkc7itOiCRtytloVRcCQ3HsiBetssY09Wv8uAJ2a/587kEV4H9xpgj3PlmeQ5Es4WzLyJPhdnnz5dt06hCCX/B0Z2HfkIAUXRG1ys9vlfxlgjFneVn+kaPTh7klyY0S+lD+HGMtpWjaZuWdJagDu0np/gbHPCVJ3hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=Ydbcb+6s; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="Ydbcb+6s"
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 6A439201A7F;
	Thu, 24 Sep 2026 08:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790230329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l81QFmhlDQTGs7rZns5MKD7v+ak9WYwFE6Pr4OFVWY=;
	b=Ydbcb+6sZwXPH84/M5rxqCEf/zPnmFJ75skFqMqOqTcVpyKCaQ+FHVEy62Kos+iu9kXBGK
	3ixNqo0ttTsufXIUpiG2dJmmoSJGjw2npck7DgtyeTa8PvAALDXzNNDK/ARsCNTL5yx7Z3
	XOgD5YZzV4x9HYsVHsfe488EZ6PzDUqKfHXzfZupnbbK5Gi8/+nHLCcbCsAshF1MqiJTxr
	K2VgerRagfg7BX2/FryRx6lfaycR7FoFquo9WR4r7yTAsBD7Y4hF2YLsaWETw2Xv8x9cvN
	5zOjiU1QvHY+Xwcq4mn/AprJ5N6GGVlADGnXpMas1ioHCpvKavIVrs+e7mUp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790230329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/l81QFmhlDQTGs7rZns5MKD7v+ak9WYwFE6Pr4OFVWY=;
	b=BnFxlaQUvY88ICR9O4rOX++fT+dc+qPP0iqqYZmuuhxN094GozpdTi835ntXlg4e98X5eC
	9U9PiuRndBJxedfVQ8Z8VmcQmZkq+hOHZT5Td/NIiPFYiul6lEsP5YWUDJ8xTHcC9PY2mY
	qcjTDxW2mzvpHlLeB9ukiTARD5RMp4Uap1ldNKUj48CDLqTE8WWWgH7oXCF8pC/WwZCceS
	k9eGKSa/ry1h7tOwfS18gytsXfYhoBq8jjKNxnMkzMh2omYRc+QSMIjgnGk5VVmVaf3P9O
	B1+gjdMsbdJt1f/pyYgIcEwVdIYR1tmz6X56iQXjd8KqEbycspkXCs7vmvjM4Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790230329; a=rsa-sha256;
	cv=none;
	b=E+ZmNN8gTP4NeQBwFyjlaW9fzpDVVUU4Zn8kula430P0oKbCX3dW19t4pgdG6iaSGPanVF
	oYThXqZSez6yR2lITxucokDZsESdpIiN3g4UXhiFZDCnRKG7EDKoHRXvLiVcgBxgVgL8L+
	9e4snN/wRvfN9nCo/5ut4SBEZFTuPfZxBFl8iGt5Zi8Y5XV2q0xKCz1I07rr+iwoiVYR40
	0EGwjFoY3MRSaf+KrVAza1g8fl0yJ7Gu68Xg5QehQu9xMsvgWVJqKjwlq/neVG54gkCgHj
	fcVL6u6MrW1VV2nGdGznIsV4nRzji4/T6T1rORceQlcRvaYYbixkcQ1Iw/RgwA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <1a0c76db-7dd4-441a-9308-c70d29e2be99@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH 6/9] dt-bindings: media: snps,dw-hdmi-rx: make hpd-gpios
 optional
To: "Conor Dooley" <conor@kernel.org>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Dmitry Osipenko" <dmitry.osipenko@collabora.com>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Hans Verkuil" <hverkuil@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Gerald Loacker" <gerald.loacker@wolfvision.net>, "Lucas
 Sinn" <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, kernel@collabora.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260923-unwilling-bucktooth-8b28f745a5a0@spud>
References: <20260923-hdmirx-media-v1-0-ea3d77d4a5f3@pengutronix.de>
 <20260923-hdmirx-media-v1-6-ea3d77d4a5f3@pengutronix.de>
 <20260923-unwilling-bucktooth-8b28f745a5a0@spud>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 06:12:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On 2026-09-23 17:46, Conor Dooley wrote:
> On Wed, Sep 23, 2026 at 03:44:45PM +0200, Sascha Hauer wrote:
> > hpd-gpios is the +5V line of the HDMI connector, which the source drives
> > to announce itself. On a board whose HDMI connector belongs to a bridge
> > placed in front of this receiver, that line goes to the bridge and there
> > is nothing for the receiver to sense, so the property cannot be
> > provided.
> >=20
> > Drop it from the required list and describe what it actually carries.
> > The name is unfortunate: the hot plug detect line the receiver drives
> > back at the source is a controller register, not this GPIO.
> >=20
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml | 8 +++++=
+--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.ya=
ml b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > index 7e66dcbdfe2cb..9c6c377417c0b 100644
> > --- a/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > +++ b/Documentation/devicetree/bindings/media/snps,dw-hdmi-rx.yaml
> > @@ -63,7 +63,12 @@ properties:
> >      maxItems: 1
> > =20
> >    hpd-gpios:
> > -    description: GPIO specifier for HPD.
> > +    description:
> > +      The +5V line of the HDMI connector, which the source drives to a=
nnounce
> > +      itself. Despite the name this is an input to the receiver; the h=
ot plug
> > +      detect line the receiver drives back at the source is handled in=
side the
> > +      controller. Absent when the connector belongs to a bridge in fro=
nt of
> > +      this receiver rather than to the receiver itself.
> >      maxItems: 1
> > =20
> >    port:
> > @@ -96,7 +101,6 @@ required:
> >    - power-domains
> >    - resets
> >    - pinctrl-0
> > -  - hpd-gpios
>=20
> Would it be a good idea to require either this or ports, rather than
> remove it? Just to keep the coverage up since I assume the feature is
> required without the bridge. Perhaps that's not the case and this is
> genuinely not needed.

Yes, makes sense. One or the other should be required. Will change next
round.

Sascha

--
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

