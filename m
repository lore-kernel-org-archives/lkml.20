Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723369;
	b=xn+1rhWORKhW/DjiQlcKO2rCUzXan9sXfDO00YWnYj87z7uGQ42/eK61zLkrGoLzAZPV
	 bzjx8oyOAa12B1EOtP3tFMD1Re0rNNWMMpOnsHNKAPTLOFascg4f4OXbZDhaVEEy/x4BN
	 e2pxbMf6IPAidpI38xpoAD2zcxKcE7SRUoLkTckI4kuk3xb8JaGTFZC4Jd6gQ87iAqS1C
	 QeSNqNsIC8zzncXxa1OigJLih37qSwjAVuNZ14qpZ2pQRzwb5axGsG0gQUyuLBC9Wb70V
	 2x04O4gc3tAR49vACI1rF91rXSrWaABKseRH90L4amxZDPZO/bXHkTGkyf8sEd7gP1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723369;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
	b=JE0X4VYHFG3xpsHCsRpoYGZSPrPlvU1pSWZB82931jbyswV6S5nELFDVBuEcpUhKfbsk
	 WNWv7R1VVRquRO4d0qAZdazsBzbXJmcoOhr7WMSk1cSj4cPp1oocGdz88oJ7cxrjBdyvp
	 P0i08X3FPnKLx2K6s8AiguphvbdRldzoFIiI7BSbUolalvobeUpm+iXLPOgqV6jtFobLZ
	 uXlA9Xrl2ircYtO5V6skBYOoQ0IYsBJzZicEk6qGEBkFI6a+GH2BXhaGQuvdkZHOt4u6O
	 +ABxUBRk8xUkL8j8LEnDQL8wkB0zqZwAqHqn3RksvJ0lamsV9Cm0B1+f2WhK5oH9SUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30B8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:29:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30B8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0f59a5fdaso40409037b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:29:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723367; x=1794328167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNY6h4Csi0xCblDGgiFLCrE5yAWsa766ysMezcggLVQ=;
        b=ee6B5TNHBQX+xx3H4qajgfcscclz6b/X/vDRrSyTck48A5WvkXSIWuEyqNuIsKPeh2
         OZOvwuQ5sM+z0gr2/WUkpV9AOYh8Gqhj7GKNx/itAY8JLGLTNB5HUHZktXYSmqzISy7L
         lHLv5BCBOERQPe4XTJ8zUsR39zxHQFEJgHtlGXg12HKOPExFMMXIRsCcj1MhxpleB7wc
         HfO6mBC4dcXPb+Gw7mNLTp6VGTay+Wec7asdPsEmK2+vwKjx8wdesWPliRK2HASLjdDN
         iVr8Okofy16B0+jkjMw1ubHWRLbmtSB6ldhD0RHp9pvPtssON94cfyAt8XHcKOMUNHPQ
         cJTw==
X-Forwarded-Encrypted: i=1; AKwUvBwMV01sENfVYUfUifsjakcRItD75H0ry/vsWz515Dx7n7ZDRtv3+MgfEyrBtEJVcZdMPdz+NzT5u46m/9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QQE8jNYlH7ChwTIfSSwA9rRGvKjZtI+/7Mc8Pt45l4V4DLyQA
	cHpOzLlSw/w+IFi9BNhfodCNRM8xP6RZAEB3HF9giZOvmc4EllIYJUGncoAw6DSg7T8=
X-Gm-Gg: AYBFou1V6SHDT3TYAphS1z0wmS14RCJhw2wfFLOrtlL5gmD+C8TI/ObFZ0yXRrCgdWv
	W6W2hok0vFNayZjN6eX0g5y0qU9hDgu+dc+WfFCL18WaFX/CzUxpM/mXg04axiYJPSJ2JUmiZJK
	m0WDdsPWfU/bo9MG4EUtPzg79rk6fpijx7mBe2riSP4ItlW5HXXzRMpGV/hTz+qKI6KQxkpsl2S
	8R6KozAgFpo8k2/mxCpHHuhg/4VRTlMzb+83Cy/SJQxsV1xKdBRO2yD5fuX9I685tV7fSiPeup2
	sIVjD0bHFQXY+Zjfdmtllp6rAKKPCHIdvr5Frepzu5o0WNT1iyWBtIqzB6OBU6HiyW3vfhOGwV6
	jqlafIlIJtXB8Fd/D+qTiSgaIQkRLbIkj0gKjPqp65PE9F/tiGqIjzFaowrim0W8X9wO0Z4AAwt
	FaN0x4j/PphhztsKGw0I4sA9Hg8Ta2mnf2w7y/7/iuMaUobA7zpQnDq6prYXuQb54M39uPp/7eG
	mRl1Euf+4KoXqqBSIVhkCbll7BL+DAHYBAgdc/0E2uqKqu7m/0ANjA2/ykelM+CCTIItqaiJ5xP
	z871m3R3/loMxnFme1O+8MCuolRUaTJ7Meapm9qwoi7FzATCUUG1u+pzqqjBO6LufShyuAH34N4
	4M47mqdTMa/gkJ4oPLg==
X-Received: by 2002:a05:690c:f89:b0:8ac:db2b:ac45 with SMTP id 00721157ae682-8b2b6597c5fmr108780307b3.2.1793723367334;
        Tue, 03 Nov 2026 08:29:27 -0800 (PST)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com. [74.125.224.47])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b30992b101sm118937b3.18.2026.11.03.08.29.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 08:29:26 -0800 (PST)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67be7b9abc8so257045d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:29:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxK2FuX9c1QVFNheRSnUaB/8vhK/0FgeQZUQJKnMwcfg5X5q1WdXwKuo3JRAwcnrZ5Oa5k/+q0JliuHt2M=@vger.kernel.org
X-Received: by 2002:a05:690e:1c07:b0:676:8974:9795 with SMTP id
 956f58d0204a3-67ba50e5d1emr10529834d50.92.1793723366247; Tue, 03 Nov 2026
 08:29:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022200640.3101932-1-tanure@linux.com> <20261022200640.3101932-3-tanure@linux.com>
 <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
In-Reply-To: <f8da1842-bdc0-4bf7-8f15-46b57a9eedc9@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Tue, 3 Nov 2026 16:29:14 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
X-Gm-Features: AclHuK9_PvSlgVJNQpbckdVoDA5-AvRndijSeKC1Bujpf2P-dAJH6DOiVyEau-s
Message-ID: <CAJX_Q+3hxekJn1FiDJjYqDoCFyczxzvCuQJwWQ1DbH_WXjihOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 1:27=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.y=
aml.
> > +        # The RX delay line of this glue is fine tuning in 200ps steps=
,
> > +        # added on top of what phy-mode describes. The TX side has no =
fine
> > +        # tuning: its only step is a quarter of the clock period, the =
full
> > +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> > +        tx-internal-delay-ps: false
> > +
> > +        rx-internal-delay-ps:
> > +          enum: [200, 400, 600, 800, 1000, 1200, 1400, 1600, 1800, 200=
0,
> > +                 2200, 2400, 2600, 2800, 3000]
>
> This is good, thanks.
>
> > +
> > +        amlogic,tx-delay-ns: false
> > +        amlogic,rx-delay-ns: false
>
> Maybe add a comment that these are deprecated in new SoCs favour of
> the standard {rx|tx}-internal-delay-ps properties.
Done in v5.

>
>     Andrew
>
