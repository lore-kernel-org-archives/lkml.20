Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830587;
	b=yWggCdq31JmEZaxfm/1OgsEcMD/6ImJ2fn6y+HcFZhFbBkj6MtTDK46p1Mt2BcSrttTK
	 RlGDWDIqq1b59HKbZ94cUThhuwNUsNcr3+d7Lx/AaoKejKiYx62VUnObj/c6fXvy7Sfbj
	 Fh7fkFvW4KYkWudMPQQxhY+Zk2Nuqu36aZ8kpitIKZW/0FG1bJLuLN6hXqlRC1BmxfWM/
	 ymvd8h8ljVRArFepDlhezXskFPCrslju6vHh/Xy2q+iQm4aypcGGr+PSR0ntah28hLK95
	 1xxRXWIYUL6wSgkUvOHZF63IVRshvlr5Gkczz8Uq8NViOrCjeY/3mNiJGGFUDwUu4tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830587;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
	b=sEC/0zJNXghwUtEiZHfuz9zv6vx+7ywkPSsb+sGyl0nVXE7QxGwqSpemFzP7s3CW5vDF
	 it3cZD5zwNJWtHX9yUEMstDWV2PfIEjaRdjBRjrxhXwZwPtzXP3cP9x98iqgiuovV0//O
	 AauFhud9g/6kPtdohYUVAIK7ur3tXoW5GdZ3j0pbderC8AzoQnF2wi6CLbIwqcutKHIwT
	 jrdxBmO1qXIAgUeQJutUBP2fwIM5YB6gQX3xPMyANoNYD954Vi7YExb+j1HlGc15l+pTg
	 T2/gH/jyEH7Vm5qJ1lw+gEJvv6ljfENT8kq8bm8mV4GZjBi1WXEscAWB7MoSuHMZ44g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DF66072659
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15DF66072659
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so36457a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:16:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830586; x=1794435386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4dUj7qtlv87aoaokSVHZlryaRSMAw8BaqO13OeSv3d8=;
        b=fsUCO5rHhkKmpcDxQLUU+rFUj5ezLieKpcV7YVXWkvKW5lCsuoxEBzBf3rwzLjHLCY
         mFmD2uy0wzuqM/E2ZAkHZxIk5oKjBkZHiS2H5P976XXCS3UZHMufP1RZevd/pJqGBSPi
         DUO4v4yVDyJFt3TByVLYbjEjyi10br6+IdGGI8CK87cLcNTfgDwmL9zS/Ix1UjgevdIo
         CgENLqZCyKIVJEsj9OpSIZ9TGzJ9nj84RVdylyw1tTi0CFgAle7H6hf0JVbd5giBf44o
         74k0C+3OlxCPcLnSR0WpIOu36Hy7tzb2ItMpQeug4F0B2ro8axw9uqoFANSu0tBJ/Uy7
         vliQ==
X-Forwarded-Encrypted: i=1; AKwUvByvKj1PRQabxrVO/9HtaTVtDjTBrpgkmjcHx2r59ZvM/eJsanELp6TNC0Rp7TZMuTsF5ENkQKR3IckaT6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WwKlPTZTpLrZbzYi6t9fbNT5r1mstNJHUz1hHv3lu/plSBHMk
	Jacb+ciGRhFQqsuppiL1qijEPDC1bIm/+rt9jhct3p5jroEeT5GLiyN2WYCEcg==
X-Gm-Gg: AYBFou07UQSyboOV6XFSzL5UretkHghJuwNxO0KMJR5qGRHzUW9amJrYdoK19x2NaSl
	Np4U19RGdo5T6Ropw+UTMEYMoxJvHlGlYn7q00ofTM308YZ9GT6jEidiyi3Inu/pNUZvgtFlSnD
	BqcoovLYvF32vkEkunUOpxm6JHdDzFXuI0S80ri5rMZaNDuQg2f30uc6EZanTVJTrmts+1RSS+T
	lfS6mvUUO0867AZT+BLdhzOAFiy4lvdv8EH+m52ZcuImWiBT9/cCGE6bV1XWaO6+bPPBmI1ifpF
	Bf42GvEuniyvLHVlkhxoPGPLaszzYR/Nrgk4awWNuDWsGJdjIVE5wof1nuSTQ6w+xwldzmXXp6b
	8eG3HwIEuaJU37AFollSB2q3b3mTT/cedRNvBe6MbwA29ckux89qIlaIugvP6Gc4eNatD9V3SHo
	YKOwSM9GLicSvj4AKace8XUdvRz5eUwSsd1wwZ7LOYqOS7ePDinY6kBLSfHOnjekg20OwYuad1O
	T3yx08DfpbWtOvfc8qCo/Gg2d9aVhCkuBDhCbmL5WOXTQkPCXwTcOyaCq6GNb8fDpaKfzGiH6Ot
	0fIXGr5TYWioh0D6cMZNbKvrKLgOxNSwraUdIN5AJ9qc/9sfwljyjQEV2JEM+4cPP9/gclfazZ/
	2Xo5eihD9kuZMcyiqTxVR0DJn0B2Wv+am
X-Received: by 2002:a17:90b:54ce:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3b0afc5aa58mr376784a91.25.1793830586448;
        Wed, 04 Nov 2026 14:16:26 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d4bf1sm695176a91.16.2026.11.04.14.16.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:16:26 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36c9a93a1abso69410eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:16:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxjYrmGTBLAcSnsXOUiDAsAf13BA479DIgW9yMcUn5qWihzZo7A1PIJZYG/RTB1exHwBgbVerkVICJZ7Tg=@vger.kernel.org
X-Received: by 2002:a05:693c:80da:b0:368:2c6d:ddfe with SMTP id
 5a478bee46e88-36de5f6f030mr1017112eec.9.1793830585474; Wed, 04 Nov 2026
 14:16:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gmac-v1-0-a15965a49574@telaak.dev>
 <20261104-sf19a2890-gmac-v1-1-a15965a49574@telaak.dev> <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
In-Reply-To: <e134193f-ba1b-47c1-9a06-419b1b796ea0@lunn.ch>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 17:16:14 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
X-Gm-Features: AclHuK9-UnITn3qNlxFDVEt7-zpIej_-hzEuMRZnZQ7mZri5SrN5fWqpIt5XJGI
Message-ID: <CAPY4CJ74O1tFVCpcN9seoeWDF0VR9GNfKuE+rWODQamN2sjL3g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: Add Siflower SF19A2890 GMAC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Chuanhong Guo <gch981213@gmail.com>, Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Please add minimum, and multipleOf.
>
> I've not looked at the code yet, but default: 0 would also be good.

Will do: minimum 0, multipleOf 55 and default 0.

> These values are odd. The RGMII standard says 2ns is required. Where
> is the rest coming from.

They are the values the vendor bootloader programs, and I checked them
against the hardware. Sweeping each delay over its 256 steps at
1000 Mb/s, TX works from 0 to about 2.8 ns and RX from 0 to about
1.5 ns; 935 and 550 ps sit inside both windows, and a 2 ns RX delay in
the MAC fails.

The rest of the skew is not programmed anywhere: the switch's PCDU
register for this port reads back 0, and with the MAC's delays at 0 as
well the link still passes traffic. So it comes from the board routing
or the chips themselves, which I can't separate from software.

If you'd rather see this described another way in the DT, I'm happy to
change it for v2.

> Does this mean there is a switch on the other end? Maybe look at what
> the switch is doing for RGMII delays.

Yes, a MaxLinear GSW150 on its CPU port, with phy-mode "rgmii-id" and no
*-internal-delay-ps. As above, its delays read back as 0.
