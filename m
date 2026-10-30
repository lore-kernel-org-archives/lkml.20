Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368374;
	b=UJ7TZdKeAImnASx6qRPqRJXkk0EGEIq0iTxCa6B4c6xv0VvsuKJ+EuCfB2V6yMwyOhGz
	 J3t6c37rUYKQQiaYPoA9ENfdzWA8u+KO5mTvo45rHXheyWY2rrZSgzPZ7T/Q4Vgupg2O2
	 0DYnyTGZp3MTo9zU277dE8PXpgPrtP3/P3cjGR8V5LSXek7TiluApeRFXVP3BHHTlhorY
	 2yjjdfxHgkhNTpTN/z3bbqoKQVnVaXUQ9qkEeglGciyZyjQy7RodWcqNEzBBwg7GCPbGf
	 1Ubt1899rGoOhOnGZAMsJT4uehe+/sjl1jHASIgO3ciTl03gkLfQxMv/X40Nzn6yp+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZjCkrPgZkmpcI6klO5ZNTUrNouiYanWFs0XqwffC5jg=;
	b=HW10D4wRoFfyqtAbFP+gRDKtDvKW/LGjU/IUyUML9yTxuG0VsHOchYVilyY4/3ZYLvqM
	 rfWiQg4m7DTU38N04rNqmD4Rj2Nl+pVeCrt7PuaXCpGDoTSaHq2fo+80mqewHH02JuN1G
	 8sjNtTP+GvzKULVRLMeok+qu6vg+vEqRYfJdYYsRVXR5PbJAniIzcHYJyYWwPvtGF2Imf
	 X52VU/Ocw+9ZVDmjZyp4ZlCGVnuQ4A43ek/a9Y3FEDGS7UsGJmkQ9PFYnB70Zucbvy1xC
	 rm13YR2Mg2fOyoooZ062cO+5pAjDIqRoeracxNA/eJUdKnctDdp2vg1XC8MRMlSxrJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPsIqfqY;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B88B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vPsIqfqY
Received: by mail-pj2-f8.google.com with SMTP id d9443c01a7336-2e609985789so2551355ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368374; x=1793973174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZjCkrPgZkmpcI6klO5ZNTUrNouiYanWFs0XqwffC5jg=;
        b=vPsIqfqYMcWRJ4rbWkXml6kSp2q11qbyeDun1W7E6bhUpVVVssc9gIr9xqylNJ/yds
         FWrMGwOPW20Hnb2keBi9D4LHy1y8Ka8Hd/JAhescfVeSzRRioEzAz7VmN18KBsf/A5Du
         Y2xcki/wmNFKv5/lOd0J8L1JVUIaunqBtRq33IHQz9jRrNzXTRMw/8ctl9TVQMmb7mzI
         qvaSgwhIV4C8ZPbYRzlx32VqBhzOwiTVlpIaqSNcR0zPAcYs4jqTaeZcYde5ndYsmG6s
         syInukzz4SRS/yZUlrIo6TwgU/DyiEBgeM6sJFb4ZSHCx4eGUAmreqR8XGA0sHvYf8E8
         YT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368374; x=1793973174;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZjCkrPgZkmpcI6klO5ZNTUrNouiYanWFs0XqwffC5jg=;
        b=KuhXcrC01oC4RDxlbVdGzZZfp466ZykgYU89MsVPXU4r0CmWQw08veDx8rwQ7x3ozY
         deX3kmO8xatbtoyEmVoAAXu7C5ORZD1tJ3oLlzjM8mLPT5x94dR1aPwYVE3NSlndOJX4
         Pv2nXJY3ZTwu0uWisAWJZVLtJNyVBlZRPe2DH50uJwl/OLFWsyZiVuTG48ZZ7OAt7/y3
         JWHEQZgQ5PVJ9PZkrk6U+AyumF0qvE9luCN++8uOEAAZd7LZt8751LUCtnSuWXD5RX9e
         +GYLvgsTjmtRhFQ9LVflnFOyrty5TnTMEkbCaDvir4EXlafVHUwMdbAOFewASz1wiwjF
         VIbA==
X-Forwarded-Encrypted: i=1; AKwUvBz2s7AiInnHi6dNDCqi6J415OrcGPeKYaYDHw/GwY7Dctg9rMnkfyOSWnjRrscshILiKqIp4IIDdMYmnpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8LM5QUXfWQg9cQ6OvJpyhlEZeadHUbA2/7qD5rEMAMY/XPtSq
	gSLA4PNk3tlJ8ehqjw2raUMobs8GIrFmiXm/BL0zUtw87JeNiO/84eqx
X-Gm-Gg: AYBFou10isMWa4PhUGZj5nTgqi/1buYgugxwmPf6ZR8jNnk5XGz4c5hSJm+LXs1oYyJ
	eJATL+BwMc8UBb6LNpiLpauLUXKD5scFpKFZV3WcABtKa5NliwkHgXgjSHOt0h7Yfj6Q0ReSfHh
	+Dyq9ci/UXSvWoUkcfIZ3azxTpJ3PDROPQkV19g2gzxnlK1XUsC28LTeVb66R9q3lCxif/amTfe
	8FGcACj0adn8WD0WPRMGoh9h+nd+J6nYARB/VTM2DqPacL7+T4XZ75Jms0Qc8xoSZT8hX4G6XAt
	sVt50np52v+uFboSK+C9dCToFNvB5oE9KwpbaTyZSujj00/8Y72vaBL8o6n8UyYK9j7ayLVbcc0
	67CWoUXcNK+FBp/MA2DAAiKpEpr8Lia+gC6tDIufIbprysGIQgVdPP7NNWb7Y1wFOTVw2yYYQrz
	8+LNF87Rb55mFR0PBAEH0VFvsYdkzRL5OV4S8srTAaF47WXYP5eamkwPPOYVo2Fa32+oNdGalWa
	+Vf9gubeLa40iQF37UoFm4I0fylqXXliz2650ArbOo/CTvAWw5MOPJHNl8sAWmXWhouKjxgpoqq
	11EKMqEEMVPd6s1fCAoLk3bMcyMAFXZ2n3cZJJw=
X-Received: by 2002:a17:902:ffcf:b0:2e9:a782:bb82 with SMTP id d9443c01a7336-2eb364e93afmr22499015ad.54.1793368373608;
        Fri, 30 Oct 2026 06:52:53 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb38e9633fsm7600865ad.0.2026.10.30.06.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 06:52:53 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:52:48 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net_v2=5D_net=3A_pcs=3A_xpcs=3A_ma?=
 =?US-ASCII?Q?ke_supported=5Finterfaces_authoritative?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20fb8d2d-a20e-472b-8f32-3fe2fec9a425@lunn.ch>
References: <20261029102728.3189359-2-coiaprant@gmail.com> <20fb8d2d-a20e-472b-8f32-3fe2fec9a425@lunn.ch>
Message-ID: <A049E9C1-CE52-4B04-8BD4-44962D008F6D@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 29, 2026 9:20:56 PM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> wr=
ote:
>On Thu, Oct 29, 2026 at 06:27:29PM +0800, Coia Prant wrote:
>> pcs=2Esupported_interfaces is the mask of interfaces a given xpcs
>> instance actually supports=2E The compat table describes what the
>> Synopsys IP can do in general, but a specific integration may support
>> a different subset: the RK3568 XPCS supports 1000BASE-X, SGMII and
>> QSGMII in hardware, but does not implement the C73 10G or 2500BASE-X
>> modes that the Synopsys compat table advertises=2E
>>=20
>> The Rockchip glue currently advertises only SGMII, since that is what
>> the RK3568 MAC side supports today=2E 1000BASE-X and QSGMII can be adde=
d
>> later when the MAC side gains support=2E
>>=20
>> Without narrowing the mask, stmmac_phylink_setup() merges the PCS
>> supported_interfaces into the MAC mask with phy_interface_or(), so the
>> XPCS would contribute 1000BASE-X, 2500BASE-X, USXGMII and the 10G/25G
>> modes to the combined set=2E The MAC side forces the phy modes and
>> phylink start passes the mode explicitly, so this does not currently
>> make phylink switch to an unsupported mode, but the combined mask still
>> advertises interfaces the SoC cannot use=2E
>
>I don't know this code too well, but something does not feel right
>here=2E It might be due to the way stmmac does PCS with phylink, which
>is often considered broken=2E
>
>What i would expect to happen is that each piece of hardware indicates
>what it can do, and then phylink finds the common modes=2E
>
>So maybe stmmac_phylink_setup() is wrong when it ORs them together?
>
>Maybe look at other MAC drivers using pcs and phylink=2E
>
>      Andrew

Hi Andrew,

Thanks for the review=2E The comment is too terse, let me clarify the
scope of this patch=2E

The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII in hardware, but
the Rockchip glue advertises only SGMII for now because that is what
the RK3568 MAC side supports today=2E 1000BASE-X and QSGMII can be added
later when the MAC side gains support=2E

On the stmmac side: I agree the phy_interface_or() in
stmmac_phylink_setup() is not the usual intersect model, and it is one
of the reasons stmmac's PCS glue is often considered fragile=2E But the
DWMAC binding requires phy-mode globally (snps,dwmac=2Eyaml), so the
dwmac-rk glue gets a fixed mode from DT and phylink start passes that
mode explicitly=2E The OR-merged mask therefore does not currently make
phylink switch to a mode the SoC cannot use=2E

I've only been touching this area for the last few months, so I'm
guessing it may have been intentional=2E You might want to ask Russell
King, who designed the original logic, for the rationale=2E

This patch only touches the PCS side=2E It makes supported_interfaces
authoritative on the PCS instance, so xpcs_find_compat() does not
configure an interface the glue has marked as unsupported=2E Reworking
stmmac's OR-merge into a proper intersect model is a separate, larger
topic, and I'd rather not mix it into this fix=2E

Coia
