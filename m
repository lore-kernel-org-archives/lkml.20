Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EA23F164E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790762370; cv=none; b=SFKcqXSh0kBOoddWhYJ9+HSyKgRsFBa+ZRm0sSIazumorP+e2zo7R5ejQhICh02Tlro8gEajwh0vwotYP+2Jz08aCyPSIjGaszgyp9cfviatNM974dLH8c6Az6Isz6/mdH5j3fCABxCcL07Iigzx41sBLNxBmz9MTfDI0uIpW00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790762370; c=relaxed/simple;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIrnhmCzcvzU4iER36m3+au0Cc8poJAiJH377+CEuWRnea1DnEble7uTb1+Jn90YCkzJzOS2azfa8H8uJK9Gwuhc1wKdd226g178PH7GZV+DY7XsqDc8C5svwcsjhIGaHCZiK3BSFQ0sSGl2kCNieiVNjiut6REvOJwWHlne3oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O6tr1a0g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O6tr1a0g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDACE1F0089F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790762369;
	bh=oCb8pD0GTaCJdPRTDUHDOrP9QLPA+6gtpfNrrUBXRJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O6tr1a0gBYWZkpeMvgU5003ZZF2hvp01nK6gayO050AgawGtnlJGzmkb+56s/NCDO
	 A1bjob4XwhA9eznQjvunlM+/jZk2lde2N/4Uzk0m6ooQD4j7CL+4fG7QBili8lcK/I
	 g9dAp1oD6gO/JZgvytw4/P44yevzxJo2717wD/1GbpqLcavqFG3Fxd9sLwbRYvPcwd
	 E5HsytA1J/TQ5IPCt96V5op4r9CIDr4/+s8nC2w4XvK7Wssbu6AkiAaD+KclGM/H09
	 +DxOsRI6fxmENhCqiUH/jPrzfwdBKyR5YY5vis5bZgJdPgRjm/ZwF7wbGXbJv2nww9
	 KxlAUulZmJnJQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso1874056e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:59:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByP6wUaoCS6ZepAUuDmLsc/536mDNPxwuyh0+2Q3te6qxRuYM8Qbguj71Z06ibNSeSsnhYZCEH2L4h15yQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYImaTkvkEVnIst9QQtSxTmReiZU+MoW6M0ouYW6vaZuZmEd2wjL
	xci+iHNDU7sA1yzrP9x30ORGICvMnMwkpgkG+GElamXARwIb5NyxkXoF8VKCuS1A6BBQI840ZCU
	XPFbY/w0NRoB29tlImS8ErbUVJC4Rot0=
X-Received: by 2002:ac2:464d:0:b0:5b8:f573:35ea with SMTP id
 2adb3069b0e04-5ba4069be69mr221068e87.16.1790762367713; Wed, 30 Sep 2026
 02:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-2-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 11:59:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
X-Gm-Features: AclHuK-m3HmD7lYV6qupQKjYpsgXbfMsgcuHzWJL7-TIFY8_vvfiqbhmnPD4sQM
Message-ID: <CAD++jLkubGK4wetxXQz8PPDU4aHdSC7e0RgZtwOjrAWzHxX=RA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/10] dt-bindings: arm: Add Cortina Systems CS7542
 and Securifi Almond+
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add the top-level binding for boards built around the Cortina Systems
> CS7542 ("Goldengate G2") network processor, a dual Cortex-A9 SoC, and
> the first such board, the Securifi Almond+ touchscreen router.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
