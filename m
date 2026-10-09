Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6118740FDB9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 05:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791525504; cv=none; b=TnfpV0JUtj3pki9WT/CBbO2Bs9TQ9p+BOP1M4SbUPsQ6XvE0Zb5aHISeVRLvwjTjGVr3Aq3NzxcMH/HFE6GO1D4/X7Avi9DcEeV+sSTr4zzualMesOiwjS6YlngH5G+xBtjBZYd6uHdNjdwsDp90pnauHbaojRczAgHT/XvcHw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791525504; c=relaxed/simple;
	bh=vANEtx02YGciCZihBKUYNtj/eBy+BpTaZ8ueDZBr8AU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDnDDeo6V7/N2Ed5Iio7muaKFEqcFxIu2GkwEOu60xyiNsyUPCaY8gVuIbQcbePr+B8tuVLDNUZmjEHnuH7crOtw6TMNctxIxTng+Ggpf4QA7ZdpraG0Nmd/TNekRoutrPoa5wY6yQHXfwu4QtmQmqwa0tXqY+35MZ0C1keC3kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-93e762768f3so384025585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791525502; x=1792130302;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NHcCOJlfDk2kf/nYjNk1wm3um6Oe/oxI7EYgEHDQ21E=;
        b=KRalcXVakdRTJ/yooLarFj8rJP/286/QIzijp0xDx/tP0GrXCCy9tDmjJGrq7evkXI
         e+LAyayPB+SOVG1OP7obiibpkQtbVuavpohxjfHpybDiZOgUpfbwtLJGXDo5CHQfmxJF
         397kGBqfXMt4bZajJMwN1XwE48i7mKVbHCykcPWbKYV6U3Kt1OKcUM5BYMRo+yxAewwk
         obixW+R8vV0YhtuJ//dACaPXoBmIGnFPsKHGdqjkK/w3+uANAdOTrQLo6zv9jjecQ83Q
         NSvNxDJkum4i+qn1Agh0BFAwvQKlKJspt9dxihfi+dqqJ9dyJVeW9taa1W+sav6MBW4V
         qjnA==
X-Forwarded-Encrypted: i=1; AKwUvBw/9vZBzgOjLyAHKVmRJfQu5+pafFRW1iz2jV/qVoxaXIF3bREqO9uzy/JHhHzVR9L8tmu3OMGWch9fz4s=@vger.kernel.org
X-Gm-Message-State: AFuF++nUnG1Nmr3BlzWZe6Phh+zvsowTSCbCqAat5dSl1xrtcynlm0Uq
	MYeJqm/HOIS0N4931RjhNNulcC/bRRqfSnZpL6UyQgTBojx1adMnwvt/exBudmUkvH8=
X-Gm-Gg: AYBFou08eDXEoxkjEUMLNXH9mQB7Ux/S9kukJA3JLJ8yuQ0Fg0pwcP7GN4k6Cj8PwKI
	SUFAanmSGhTCdMhA3CR9958HzBkRomhonG5/OotDjscn12mr7DPQdkXxpv/m9v/SMRuFGPlgW5j
	9ogS5OD/63eO6FO+HpDGzr8UBD794lBZeMC4mHTfp8x4W0ClOO+U0sIAsegjYx+X1aBhsEAZN2N
	sY09S8qiVy2x6xocXPYlnM3yNT9IW2cni51b3rkGRd4mzC4sqyVffEAOdqtvaN0gNCwgrmBzf8p
	yJv9v3IX3ITJ9MGuJanh9j0vzkBWxClsBBsVNmQQD5MusewbYv4UB/eMTx2zfI3snJm17yNeaqw
	YBQMNAU3S7XtPcgc8QQDz+Nc7tqTPkJ8yHMLzamUI14/uGhOniQhaT0NJjgeJOqwriQ0+lRYrWp
	ndoW6t4efYrAp9iy9UPmI0lxSEU8SLeTj3pku+jgS/uAI4XKd4VYsIlc1rkMCnYFkI+e7WWk83V
	oOr2SyhzI3RguIrCBlNVsqHK+g8uTTMF/wKNU7daABoO5Q7vipivbLCJ+bMJsue8wt4ICczwPPr
	yg==
X-Received: by 2002:a05:620a:17a0:b0:93e:c12c:f13b with SMTP id af79cd13be357-93ec12d085amr23035685a.69.1791525502227;
        Thu, 08 Oct 2026 22:58:22 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm109500585a.32.2026.10.08.22.58.21
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 22:58:22 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-53506b44151so56305631cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 22:58:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByupDdIlNZpGrwjJ+N5XtnsmAsvFyqDw00xyPkuYQsYWNhBn1gEIkZ7hhEkPbrsr5+ROaJK3gETuTDzbNE=@vger.kernel.org
X-Received: by 2002:a05:690c:e:b0:88f:62ba:512b with SMTP id
 00721157ae682-8b07ee3297amr3678357b3.42.1791525154408; Thu, 08 Oct 2026
 22:52:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007082627.63807-1-tanure@linux.com> <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
Reply-To: tanure@linux.com
From: Lucas Tanure <tanure@linux.com>
Date: Fri, 9 Oct 2026 06:52:22 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
X-Gm-Features: AclHuK9uJycl8wPMvbL9js8yfzmf_wvwEi-NV4Dy7HnHzbbgfaJpxaRVEvgynGU
Message-ID: <CAJX_Q+1BZky6KUtqZKm7q8bDfWKV47xSZtK31qdYBWx_e3uwdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet controller
To: Andrew Lunn <andrew@lunn.ch>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 2:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Oct 07, 2026 at 09:26:26AM +0100, Lucas Tanure wrote:
> > The SoC has a Synopsys gigabit MAC, a block of glue registers that
> > selects the interface type and trims the clock timing, and a
> > multiplexer that points the management bus at the on-chip 100M PHY
>
>
> > +                                     internal_ephy: ethernet-phy@8 {
> > +                                             compatible =3D "ethernet-=
phy-id0180.3301",
> > +                                                          "ethernet-ph=
y-ieee802.3-c22";
> > +                                             interrupts =3D <GIC_SPI 3=
40 IRQ_TYPE_LEVEL_HIGH>;
> > +                                             reg =3D <8>;
> > +                                             max-speed =3D <100>;
>
> It is a 100M PHY. What supported speeds does it report in its
> registers?
I cannot read them. On the VIM4 the MDIO mux points at the external
PHY and the internal one never probes, and no board in tree uses it.

The line was copied from meson-g12-common.dtsi, which has the same
max-speed =3D <100> on the same PHY ID. Dropped in v3.
>
> You should only need max-speed when the PHY is broken, says it can do
> more than it actually can do, or when a 1G PHY only has two of the
> four pairs connected to the outside world etc.
>
>         Andrew
