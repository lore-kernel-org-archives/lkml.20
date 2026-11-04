Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779368;
	b=kfBtjHMDTsHnepo7mIDoVrL7tPHxpuuKd6+5MY6a5/pobJge0kPsdTL4XjOWA0+PtQV9
	 M3v5Y0rQ5PU5aCZt+B8rlN9FFBoevY5M1QA/HI0lIICiu8tcRTKGLRSBTpSzEnDZDRSCJ
	 LMCYP5CxOwQS8fo1ZunAdHFZq40aoPO1tYSpIEF/ZSMTliOAufbOuksycp9hj/Q9n9yf0
	 zc9+ZOAUfJbbR4YpOX5IcJbfaQiSqXBfFgDAApPouw3/fqQXW19uejKMfxCrZjbmVnUMR
	 JYgcJEeuO9VagUfJyEqQn1QgVldJKnrpmMEBqdSzx7n2Tt9Mr9q8PGz2G0nQMJXLwtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779368;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
	b=K4b4hYYUtN43r2mokGalKNyevwsvF/l1iOfWp8Jb7FgbfIBWlfhNXWfhCtMNmS2NE4xp
	 WJe06FE5uLJDzp41fLz2jbCUPo2KQ7KQaVNNhRiXeCvEGXeOgvWKR/P0DORsMRjeU3Zyj
	 mS1WndstiX3ayLpJDKly1bOBl7B5B9vicOpaeBkvIIvOgjBH+hWdPAlEquyNn7PNlh2fl
	 vduycUZM204vaxf0tVHmLjOHQLf01IGiAUH0OfuEj1UQXirKHmErUlr3q6AOzUnK9/M9W
	 KrdjNalPHxdSbSVzjEO+/bm6yx3bDYYDFpRFmr3ei6pVOrIsX7XjJyJFk4/D0oaykMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E31606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e812e2b31bso2170625ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779367; x=1794384167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOB/DMG8E0H1LG/g/S6WJ7zKwN49Fb8gn4W1dEispPc=;
        b=xJIqeiVFbO8mcyKij+m1Vry+n4T5x1tSMR5mOlQlf95r/jYrsYA+Bs3ilUYvQ0Uz/F
         OQfKM93EhDd/WYR8bmcnjc2CSL3YcQF/cgJ7SmU8Tje77HgidIUThDt3ksJG0AftyDfv
         Tv6LwDEzfJ1m75WhCnlR0WBRPSJnKl4f7lUe28B1oGHBszRQVA0EwOynAzZqI5XO5fuS
         n0kNLmqrjzP69Od3QFghZEPplR1tw91qRxUyYJ+CNsjK+77IfwfL+XtkSS2BGJxicdpi
         fSYq9+dQrYGWIO9fsQ+/O11YhgmwofYo2t3g1sN8kXSOBd7TKtw1WkY5v+uU8J3drzN6
         3hmw==
X-Forwarded-Encrypted: i=1; AKwUvBwUX2mh4X7pJKltseK9X87f42P5Ns9P+x7UYEfbpHRw5wJd6S4R5mOhp7y5hvs1MOQbS89pA1zjfuMu9hQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EnaX8w53b38mTF3FhONYroo+gxFUIqB+x/b0zS98vYCJrD5KH
	1u+yaXKy4hsubMRm45wxf6PHl6iUf4rpjHFZ+6dqffH27n7nF4hgnotgSN3MotE8
X-Gm-Gg: AYBFou3pfQ3ouZwD7LQOF4hUg/y4/Dg9zsvTrmXlPN7Tg4lDQJgU7lvyzdEF6j0WdIM
	VhOkJk4leL3NsMyGJLCyT56zQDLXnTlCYNabq1WCB86zqkGER5mWPo/7JlwdaDVcAl9db+6fFJ0
	zU8oiw2BMuQjfC7+0Flh6L1kwhP1FLQj8Gei+yJaqpXqMTf4GQx8EfOQl9bjTpK6OnKa1/9Tnu5
	fGmK83zqjYA6LSc1EtcvETAS3PJCbKTo7WGqDvyttBlodl92cFz9LZWRrQrhqZp7zDYi4lPVz50
	8kl8TpL36D9Et5aEsLOQLvyV2KwacEQrnfkVirSiWlQZ//gTA7sLk0tI8uSkR42ghF3AMF2syhn
	eC/4mxQs8YYS4rPslHcm6+xh+q2koThComkCYqZkuyVAlcKs0dp3e1glv+Dg2l0/rbhN51tPZrh
	zR0+cGHlzMRN8Hb1woHFj9c/nzf8xGBfKnEng0rPOyOd7ibJ8meeDIXfPxAtNaYXG1aUGarpCm+
	l6EeA40OZ0vKI/yghG9glUpgWW4MC+VlFNTMPPmzMsPDy+HcZl4En2LLsmKmc/X+cFWc9Q/oy37
	ElewkLeCVuka/ZL8JGtboulZYliuU3OUSsx3JuvnuJaDqdP0OdD2kcVSVEU1LWdIgu8gfeyMp4H
	QAxkryJrN9mMc2V0DtehwTLJxP0D6dvulvZQ4dQEqI4E=
X-Received: by 2002:a17:90b:2f0f:b0:3ae:8106:6074 with SMTP id 98e67ed59e1d1-3ae896f8183mr13359790a91.16.1793779367342;
        Wed, 04 Nov 2026 00:02:47 -0800 (PST)
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com. [74.125.82.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944bd88bsm2803633a91.12.2026.11.04.00.02.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:02:46 -0800 (PST)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-369f33df08eso693457eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:02:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy59COABMrZTb+yRrQ+BeeFls3PVjK+yfwniJ8Q6134Tf/Du3kWlnU81fwd+pHn4+dJKLhONgklTkzWZvg=@vger.kernel.org
X-Received: by 2002:a05:693c:42d3:b0:369:faa2:1fb2 with SMTP id
 5a478bee46e88-36a4236a650mr23219527eec.8.1793779365508; Wed, 04 Nov 2026
 00:02:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev> <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
In-Reply-To: <963ddb89-fada-4340-b767-285ce9362d1e@bootlin.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:02:34 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
X-Gm-Features: AclHuK8VH8JEq69kYaCOOBuUsCrdovmtS3uWzk_R-GaR7GJ1IVUq8iGvFERmNvs
Message-ID: <CAPY4CJ4Y3Zgq7OV00LedV=wty-pqR=4t70XgWYTbdfzCeaH-Cg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: Add the Siflower SF19A2890 glue
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chuanhong Guo <gch981213@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 11/4/26 08:53, Maxime Chevallier wrote:
>> The MAINTAINERS entry that covers these files comes with the MIPS series
>> "MIPS: Add support for the Siflower SF19A2890"; this series applies on
>> its own. That entry is also why checkpatch's question about updating
>> MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.

Makes sense, v2 will add a MAINTAINERS entry for the glue and its
binding.

>> - the MAC address from the factory partition, and ethtool reporting the
>>   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?

The OpenWrt driver this is based on set STMMAC_FLAG_HAS_INTEGRATED_PCS,
because the core reports a PCS whose link status doesn't work in RGMII
mode. stmmac now only uses the integrated PCS for SGMII and the flag is
gone, so the glue needs nothing for it. That line was only meant to say
the link is reported correctly without it; I'll word it better in v2.

On Wed, Nov 4, 2026 at 2:59=E2=80=AFAM Maxime Chevallier
<maxime.chevallier@bootlin.com> wrote:
>
> Hi Joseph,
>
> On 11/4/26 08:22, Joseph Telaak via B4 Relay wrote:
> > The Siflower SF19A2890, a MIPS SoC for home routers, has a DesignWare
> > GMAC 3.73a. Its interface type and RGMII clock delays are set in a
> > small configuration block next to its clock and reset manager. This
> > series adds a binding and the glue.
> >
> > The glue is based on Chuanhong Guo's driver, which read the RGMII delay=
s
> > from a factory flash cell in the delay line's own units and always
> > applied them. Here the delays come from rx-internal-delay-ps and
> > tx-internal-delay-ps and are applied only when those are present. The
> > interface type is set through set_phy_intf_sel.
> >
> > The delay line's step is not documented, so I measured it: sweeping
> > each delay register over 0-255 with the link at 1000 Mb/s, the working
> > windows repeat every 145 steps (TX) and 144.5 steps (RX), which is one
> > 8 ns period of the 125 MHz RGMII clock. So a step is about 55 ps. The
> > TX eye is about 3.1 ns wide and the RX eye about 1.75 ns; the delays th=
e
> > bootloader programs, 17 and 10 steps (935 and 550 ps), sit inside both.
> >
> > On the GL.iNet GL-SFT1200 the GMAC is the CPU port of a MaxLinear GSW15=
0
> > switch over RGMII with no delays on the board; the GMAC adds both.
> >
> > The MAINTAINERS entry that covers these files comes with the MIPS serie=
s
> > "MIPS: Add support for the Siflower SF19A2890"; this series applies on
> > its own. That entry is also why checkpatch's question about updating
> > MAINTAINERS for the new files is left unanswered here.
>
> hmm not sure this is the common practice, usually you update MAINTAINERS
> along with the driver introduction. This should be part of this series.
>
> >
> > Tested on a GL-SFT1200 with the GSW150 driver:
> > - each of WAN, LAN 1 and LAN 2 links at 1000 Mb/s full duplex and
> >   passes iperf3 both ways (160-205 Mb/s out, 262-273 Mb/s in, well
> >   under line rate; I have not looked into where the limit is);
> > - 10 GB each way through LAN 1, after which every CRC, alignment,
> >   error, drop, overflow and underflow counter on eth0 and lan1 is 0;
> > - 50 link down/up cycles, after which the link and traffic recover;
> > - the MAC address from the factory partition, and ethtool reporting the
> >   link with no PCS workaround.
>
> no PCS workaround ? what's that about ?
>
> Besides that, nice and simple glue, thanks ! :)
>
> Maxime
>
> >
> > ---
> > Joseph Telaak (2):
> >       dt-bindings: net: Add Siflower SF19A2890 GMAC
> >       net: stmmac: Add Siflower SF19A2890 glue
> >
> >  .../bindings/net/siflower,sf19a2890-gmac.yaml      | 110 +++++++++++++=
+
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig        |  11 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
> >  .../net/ethernet/stmicro/stmmac/dwmac-sf19a2890.c  | 158 +++++++++++++=
++++++++
> >  5 files changed, 281 insertions(+)
> > ---
> > base-commit: 7b6ab4dbc156e2f96419715130b3d5738a306c93
> > change-id: 20261102-sf19a2890-gmac-4fb4808f869c
> >
> > Best regards,
> > --
> > Joseph Telaak <joseph@telaak.dev>
>
>
