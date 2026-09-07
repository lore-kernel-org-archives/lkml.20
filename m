Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65C4F474B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788795042; cv=pass; b=aAMv2VI7hcIViiDnM1N552tkhRH5ijzrZNV+HYPI34nNyEYwPuJSwfnJCLvM+4BoQm2YU35Lmx94Nklu2hkIKEfr5fQH1LP9gcRMLgFTaxhXAGrjsy7OuIFyU7jKL7CJiGHMW1ndJkj8kh4lJfVkeoouDXGfO5JAHY6BrKBuxYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788795042; c=relaxed/simple;
	bh=lGFXfZ5XuVaxMLWoh6ArrdyCudpeux6klfmVJa5bp1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RT8sM0SgFmUZ10DCGAMWy4/RRXNg/m9mKr8WsBFFufGj8UuHoQjYzKMUYEj1WExydDAsFiSTcBl4YDYEHoKMnrwNOfKjPQgdq7VwerH5cqY12E0yEZpLXbXP9Z85ojE7jWYWSfAiGHuyKmZATlzPKZ4o21zeCX+Ipb8ZATweQsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LITXYh8/; arc=pass smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LITXYh8/"
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-c169ae1cb26so809116366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788795038; cv=none;
        d=google.com; s=arc-20260327;
        b=h1AUc34Rk2McNBJl/7xnHOzNVZAmzPdtcjCjC4qOXxVrrPfaSg8hXrHaSf0m9IZylN
         T3LK0/4QlxOMNYAap5CBl7/V+n3QAbOpXJ9TI3Vt34iqreEMt/p1IqkpiNeLhElvKCRN
         LTLYvJWw6btyQNiPQeijr5Ca3nRx15bDY/lpOsSBOLut5XCs0N+8ubqpB9zGCaRE8uXM
         5LlVybmNwq4FDfJNSRRkpc7YR9Q6XB5pyhj5Z7OBN9Q2H3RcKKXOem7HcwXzUAS1PnVz
         3qywp6xBvtBVacwKDjl6T+BgTNG722q7OYj5z1XZY/5SSfmE6/j2iXdubZsWutfyMUza
         HNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        fh=VJBDeVttzyZ62gYPsmZmR/UPJJKyJW4O90g2Fta27VA=;
        b=l0mYXSx/wHZcPSnVLkCX08SRsYcHUafW49DNBpDDtuJP8Cv/LBYy0JYaN62zR4gtcx
         UB+aaayYYFEVv9Ew/buFn1NlwIpE7L9P6ZyMx1CipH2mwq/dVe26HIhpEmQN/mInr57A
         tgk70ghko34qcgkQDaE8VImisXGuLWuS4f3Wl5zBCTeK73x96TJoMJOhj5sky64rBryS
         xnJA+jtyECxEsLYTrrt+d8/t/98197NseA3XqHeRXsjJYrE3NZzmRPmG4BhAf2uionat
         mc2D9CPAYBl1jgvTpXhX+U8RMX2KHZ66lFomefk7I71j8BEZhpU83McuF768Cd2x5J55
         hWGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788795038; x=1789399838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=LITXYh8/g5jBcACk8ww7y7kP8DUvXMLpAXWQoH+pL7Z9JsrTxmZFKSH5qXMLtfVQAS
         xdvBiptnO/LVjT8ugblS40pN5QMnkqGbixzUP03hWZ7fJTJNYuHpyNBrcBegG207Mc1w
         y4kT5xuusKl/KWJdXuL3FVSshc+iJiXpL/evtAVxtdIqRwRLfWBd54MP0tYr51b0GTdw
         Cb3PSKavDX5ylT4SEeB+lGjdkEqBrSIsSQUWttcGvxbIUlR0hUB8LQ7lY0dTKrqTtXcB
         BVfCNesZgJWGrWrNLE1uZCD6nvS6Ir3oqwMr0VmEBs86Y7yvRBh9V3ejAY0VnmKt8mkZ
         oJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788795038; x=1789399838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkzdnHLNDNYqM7UpPRV6i14OmTu1unpa7gOTpfiF2qg=;
        b=bPDeuqvJCVLJ7US2Am3qVGbKv4a+BkMdlB5hucohE+Dlce+N6NrD6DLFooaANtZ3Rf
         ScRFxTh/t/blwJp6U0NWnlmF21VqZRep1crzWBSzbOS2RmkvD9l3IR00wTnpCk1tM9l8
         3/A5MTY7i2A0xFQ+POCLylUQUSVU60qjj1VMQeygOLx7VP+CrvAQ09DCl13WxDD93e6a
         U4oNZiK0dgGimh+3euGZw+wipwE8buagmJDeSmj4RXcjJcPTdT7Gp61ktncRMe3tFcjr
         AAVUxPVcwHm0QM7zd/6K1ZVvcJA431haVfetZfGeUDM5/y6jdVCOMkkCmxn6trsdCJLZ
         frTg==
X-Forwarded-Encrypted: i=1; AKwUvBxFMVWBit0KfwmuycPzni6W86wpWMy8chpPbrGinWCekoL4+tyHE9KRXTjTMC4xmd3XwdqLdajEITGjsHg=@vger.kernel.org
X-Gm-Message-State: AFuF++mYfQr+6T0g5QSd0a1Dsn5P4mMwAnPmPqRPgOGRoWseq6jZjNKU
	Sn5yEQKFO4hxERZkzrc2b2k38UiEuuQEju/ldy1b898kGL4oPIdqxtlqsjEpBC3OrhuptXUQ7qh
	HqT152e/QWzu+7RB8u0CeWG30leDow5g=
X-Gm-Gg: AYBFou1dEbrPA4jasBUTSUaT+awekqE6mpsM327tqpJNJnZuIe1fyDfEL3XeT5M+jQq
	rqDiKI97yC+K+fO1tY5XqRdsPe1zTx1nPNM2O6vEWDbM98ZBqYDVFca1oZWZ6us29uX8dxtla+c
	pQV0cV9mtv69SGQW75urp/WCdJVglBXwIxuupSuK+dV9C7Zj7q9U79mA5PbTbnUMdHftTQXvb6b
	qYPezbi6yg/ZJIlhqrP7FsPxsc/42whPb3MkKL+CJ8ms3OCqtsT+i5NtbPu4mXdT/wnbQlODze/
	efucZq3HUMQKiarWYPbVGHEvRV0H3obpdyGVIjMwlwCilGHC1z7z2jgvHA==
X-Received: by 2002:a17:907:ea8c:b0:c25:4d9e:bb28 with SMTP id
 a640c23a62f3a-c25efb68285mr1154227766b.3.1788795038010; Mon, 07 Sep 2026
 08:30:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260905130002.554a167a@kernel.org>
In-Reply-To: <20260905130002.554a167a@kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 7 Sep 2026 23:30:26 +0800
X-Gm-Features: AcwNN1Vvl2lnQu7OUmDQrL2TMEu35axYNEauRYInB38b5Eog8jJzDQ2t3ClFiz0
Message-ID: <CALj3r0grty9-s5FoXN-SHOrLkVoWgW+Ot5nHs=1wYzxV3hbC-g@mail.gmail.com>
Subject: Re: [PATCH net-next v3 00/10] net: pcs: add basic support for RK3568 XPCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E6=97=A5 04:00=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue,  1 Sep 2026 23:01:00 +0800 Coia Prant wrote:
> > This series adds proper SGMII support for the Rockchip RK3568 SoC
> > using the integrated Synopsys DesignWare XPCS, along with necessary
> > fixes and refactoring in the stmmac core and XPCS driver.
>
> Not sure if this was already reported but FTR this series
> breaks allmodconfig build
> --
> pw-bot: cr

Yes, it will be resolved in today v4
