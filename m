Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794663446;
	b=ipBw2rRn8UP6gWvalc/vv5hHTpVfDimMBDXEo5gVCGBcLOihwtzJgDQUEmBrCxsurCA/
	 T7lCIWFflZCTyTTM5s6r+AgoTnrpsmuOQ6pkCim/xK8Xk5RvQsYtmc1OIpLBAaRjQFGxd
	 /7g+w0IW1CIbTumeornNduAB4MuNIrGZJ5kEFIXILa0S/Yjs0Xs9OLkPW/RhwzBQcXq28
	 +ItsOxV1OvgWE/QK7Zjfe6dcjaBiKGIV5OWZpKRJOdb/DMp+t3GBoRKci1yFZ0Vsp1Agn
	 luxGt9PWBa0tr7lT8Lvp6ls1FeBjJqpI6fzPw/kp7641TMf51JNWZO9FT/UeBjWQDcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
	b=CrVJVGDPg4GHEi0GT1OoSEUPMsWO0Z1V7cxE541jpNyHKSsfAFYPTJWxeYvkPeXI4ROR
	 3zTVCRgYmQ4IDvJ6uMwSUp9HB9gPw7/Ui+jrjghr1h13d8y/5e1GQRVUoV8bpMJdzcwxH
	 fEs6Sje5YJh8aw564hPa7fN1bH+57pUoNckyqkExyu9UMMUMRXbss0s2lVrfkiFmhj5f7
	 WKqv4VCP8zR4sOsCLV4iKkdXzuQp3NHM8ypN0noavABxsws+vLHjTtcsMjvvUe4Vw61LN
	 YDW5PbkdMOXFwU9skPCQC2dqrUwBZtMOWZBz/4WtskU9lOJANX1WUXx7DVNcTPlUiwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4398606A332
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4398606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V0DVzrQ3
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5080ef9b31so375322566b.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 05:37:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663444; cv=none;
        d=google.com; s=arc-20260327;
        b=EZUDzeI/C9SU/PboGnqXQA0+KRbCgt42WlXYGmkDzuGbNdEvybhMZ3YwO3bISWtD8Y
         v6pznlaeXtRwnDeGzwKy9Ij3EqkvIzgq0iqGWPeaqcGwfd+rznkOgR5qPK2Ogv1oQPd6
         AW5gpP/Ut2sRLVRpymrnA8eK73iEyC4os+aCSX4jjNE8XtOdwQ3R3XZIgh+qbLzmakCY
         4TBnyjbWrlJwCgnQwHzlQTupsOW1YKRxfGyIazuBFqaebDw9oxn1Ap/GMMLlUYPPhcfZ
         K/9GiMgRVEzsqxQXVZltU6QXI4uNwvGkfLrwDgVn5wGdfI9cj2VJiGU7poFndL1wyu+D
         HmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        fh=/L56SiRyPSsSikCJVKHL4eFVmEI4fANSUoc7l7o9aLI=;
        b=sc+loXSHI8OfJ6wHSCzHmoWiEJ1DYu+NVr0yx7hIURcwMOmfKz07e0dQrVy0t98d12
         c7C2TT5cKdoHrpvfQFsrWK/DqIUbqi0qxaiC/uraqe9OD0Ic/dmUbHixecC0qsmv6WSu
         Onwgx27Vz2CMEeVGiHhdHoeVtFSZb1sLp6qOUjhjmfdaIj/iQfge0RuaUBJfw/3cWw9D
         J6fNGNsdQ3FTDqS/CbKr7jL0kDzxrTm0TGjL3nC7ddd9UhPk+UIN6CiV/53j0jihvosp
         rzh0Gr9jtLTkSF9pZx3PpQ6q7Cmd3Ee6fSC5Rb6gTqfXw000gEgJt7Y1TzIn0rJz5XEs
         +wcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794663444; x=1795268244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=V0DVzrQ3UtNS2CGItTaibnG4J77tS7qMIR3c3C2ZUlh81GURnIp8X/IHvzSGRyT9ls
         zjvCcMSGfVsCr6PaYL7s/vQfBw5Mif7+7tUD0srSf73nlG5orBcEr38slNFK3s40BEI2
         7P3tnLj21L2r9iq1fBalGmh9cWBfRaIGzosEYay/i4E+/pcIFFHj2aP00nst0S6qHd6J
         o/X6UWXAn5i2xjeOmvPTXT6Ku4VxLGqH9IukfZrHdwmQeffXKQ1EEEj4+Y8Ud/51mgzP
         hYSzzU0nDdx3vWOvn6HCLUOcY6VNwAbS3mh+1q0boLKaBCkOkU/W8ctopAqNAKKW/Jrn
         WAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663444; x=1795268244;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1dGGKhX00LCOKp0RTB4V4U0p/3/TPwG7x8i8TvKBao=;
        b=q0mZcQVupgS2yIj4kpDopl8X6FGmN0SgNFFT4On4fEwHZU0kdKHleJUiQhgqmwC+MK
         m9nwuIXmehpWYkDDbzfh1K0RWukbEhgo316/N3vbXEB8DnwdP1fLT9BcSPGkCEku4NJH
         coynQ3gW4cziMtWSYs/TYR7vnsEeB3delAlFR5fISRHMxJZdmNZjhY+CxdTO6YZuLHQK
         wY1svnoMfr2U1DQRnRE2DIZp45k1NLB+S7bpZNorcX1xENGJtsBtSzSGs86YY3fORSh7
         vqivQPb56y5PdOirT0YbCBxHUdwjApiFyfvRY2OlFXs3dJcsXXRiW2UeKw/sb9XVvMqr
         n4tQ==
X-Forwarded-Encrypted: i=1; AL+hErGGnh6ocu8wS0jVT8HGyEO/UvNYf/CKMqvmxKdacnzLDbSqYApQGT7TsKVHjSYz5RgD/VsTxudME1CtOPE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VPi3AgZzXsrgyMFQM3PFA2qzhgcnL4cSycpciC/PNTfDuU9h6
	nr8wM1MueQWnTbLjF5l7bG07iQtgPQFBnP08HM2YSXquTq7jhpukee1Z4/znltryQ6ZKIm4Y02V
	u/dOm4cg1+mdG+8bAx8fkgCMxklqRoeE=
X-Gm-Gg: AYBFou3KkyyzYFbrbnpNqmX3yFgJYR+uLhVXyH33wQHj4l1NZDB5M47xnaBy1RME/Y5
	pZf5cVsNZKjWZEA36xMuOKSaSQS4GjTmgodu7JruQxZOXU09OpJoDkTMKMEvVmqzj1iT/wXOrJy
	BLFoqdbZehzvEcqkUYC5sqHEW51PAOmVu/u/xSt9O9N2CNmd/+qrB7ijALuHhEZ6ZC5jKSuDj6w
	BnHgLBqutmvO4T71d7w3xQDRZQhg8BTM6+6rd/uqzgkOPEwH3PvXN05trwZAqD2GVGYcexjKZ1Z
	n7ySQRvLoTW8IE3M7TdM3vo1L3d2BVpcTGOObDU1KEbHTyb6Le0s+ot0zRgo8RLIwTiANCIC5BE
	hBgCNkJr/2Iq3KjBwAXBX2YxBuJqoCZY4K280CA==
X-Received: by 2002:a17:907:3e1f:b0:c3e:f39b:2286 with SMTP id
 a640c23a62f3a-c5095db45d8mr475395466b.0.1794663443789; Sat, 14 Nov 2026
 05:37:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
 <20261113110546.173624-4-a.shimko.dev@gmail.com> <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
In-Reply-To: <8ef5b0a7-58f6-4c62-8153-6a9c8d3703f7@lunn.ch>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Sat, 14 Nov 2026 16:37:12 +0300
X-Gm-Features: AclHuK8XI7bnok_ObDtOfMHWf2vbfB49mnYymQ3JtOPklAmq8NLX7LejygF9N-8
Message-ID: <CAOPX745=Mx9Q+Wijt9+=Mmjtdk4fsenEeV2h0gPCvNpqc8kN=A@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] net: phy: dap8211r: add led hardware control support
To: Andrew Lunn <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, maxime.chevallier@bootlin.com, 
	pavel@ucw.cz, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Nov 13, 2026 at 11:32=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +#define DAP8211R_LED_ACT_BLINK               BIT(13)
> > +#define DAP8211R_LED_FULL_DUPLEX     BIT(12)
> > +#define DAP8211R_LED_HALF_DUPLEX     BIT(11)
> > +#define DAP8211R_LED_TX                      BIT(10)
> > +#define DAP8211R_LED_RX                      BIT(9)
> > +#define DAP8211R_LED_LINK_1000               BIT(6)
> > +#define DAP8211R_LED_LINK_100                BIT(5)
> > +#define DAP8211R_LED_LINK_10         BIT(4)
>
> Do any of these bits allow forced on/off?

These bits only control the indication of connection status, speed,
duplex mode, and activity.

The LED_COMCON register does include "force-on/force-off" bits,
but i have intentionally chosen not to use them here.
To be honest, i=E2=80=99m not yet convinced that they need to be added.

In any case, if you think they are needed, i'll add them.

> > +static int dap8211r_led_hw_is_supported(struct phy_device *phydev, u8 =
index, unsigned long rules)
> > +{
> > +     switch (index) {
> > +     case DAP8211R_LED_ID_0:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_1:
> > +             fallthrough;
> > +     case DAP8211R_LED_ID_2:
> > +             break;
>
> You can collapse case statements, without fallthrough, if there is no
> code.
>
> It is also possible to do:
>
> case DAP8211R_LED_ID_0..DAP8211R_LED_ID_2:

Agreed =3D)

Thank you for your review.

Best regards,
artem
