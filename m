Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686326;
	b=PcigymEUlKxYZB20buTbBuJWDIPGCXVmA3tw5I6rzubLlIG/QdS3Wy0o/uWERaKw4DqL
	 rvRDJPMXCn+hFLzkd1tU/Aq2wkHYwE/GzP8/3q6FyvYlVC9cSaC6qEZUMI/Ra3jI8glzb
	 9YVHSaZr7rkbw8MIVh05BnFJ1i2PMLFfnfZ/DIpSj3UbAN+gu8QfzvwNFlY8PIYL8JaIk
	 Q79/B/REpF1AINZNAVOoxjsoFO7HWcKsE363UECvPrM4qz3VoeKv7tloG1z/sYBb3UBsL
	 e9qgMXA5M11hnAp1aPHVTk+zJYxxdszw2uCCdzEHAFdmlhqwh+zVpavr6DnVQ29oySg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kbCkmRLiacqgEr0yA1tZg4DGh3TnytEQLj8xoSVFM2w=;
	b=inEPk9KPWxcfXQwOZq9tT8jBTHNvJW4tvaZ89PDuBedVLxjJOc0GWIw0vSaJc2MOMB3Y
	 QmloBzavcb21v6EBL+ltLRJYCl2sih0fx+4P5EulrVvSTQ9t7gFkw+655mT4dKm/byb23
	 bGXwVkbDlxHeGmQOXdxWZtg9CEN7fxPx/JYpd10G8hUTPmbk74k+m0hPDk0r2E1a336VT
	 kCxtFXTZcrqMmnUImwW7cPdA742wPOEv3j3FH/eBoiCFbhHQ561YnlV867ZHGr6USY9qL
	 KvWnf7VyGiNlf+enUFDyR3aj5mR6LFGSAJlEfVlzQfld78Kr7CeckGhtI+3twSLbquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hF0OI93F;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67B9606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B67B9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hF0OI93F
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so29362545ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686325; x=1794291125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kbCkmRLiacqgEr0yA1tZg4DGh3TnytEQLj8xoSVFM2w=;
        b=hF0OI93FiqBYtkocRs2fbIqooTWb6yxS957o/05+Lc5RPe1DPTDXUbEBcYTD6WZgWG
         6XU69K5ngM5w7gMeTLaAhHYLnXlYfIH47JT1CK4ncXteHj+khNbSGytL9jgJaGmcMyRs
         yia5d8Gb5vurBZERoPR8xlio1THtuGt1ZYRAgahAK+hqhBetUFydMPi0QDFZDQxC8Rnr
         jVaI/hytvXutk6z6P4z151g2bgE61eymsPsGij2oovpg6h9tkfQ6B0bBAoGE6qoM1Y5+
         PoEE8Gxjf+/7wpsVLa6g55MNxsvpXx/wU1nqn3eExd5tVYB+XQJ/d69JYfL6YpFnsPeZ
         Ot8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686325; x=1794291125;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kbCkmRLiacqgEr0yA1tZg4DGh3TnytEQLj8xoSVFM2w=;
        b=Hfv8QzQaCYJQP7mBeZEEJ+/KdQOZIcciLvOHnl/teVPk4rdDKElP3Lw5gNvydOaDNt
         Rth1r1JnlticxV9shB+whV4/GhOFC09GMbcMzoWd9f96f6HulclfdnQ/MNA2A6WXW9Z0
         yEhIwcOUgWrH3F8iN3MapE+Y9+KhOFM1/ARpAY8fSc4drWk3HcNT3+zDSAqqP2qb9BED
         l4IbRCpsFOnZbKVYcdGT9aHa5ibJrKEwi3g8SC20Y/hrL187CjbSWV+3hm8dpXr+NccZ
         +aIcs0yCbcR3bT3wri/1MFcWgTnsrvDFjc/G6atKpmiiyCSLPH6ly9lsvFb39mvDO6r/
         SDMg==
X-Forwarded-Encrypted: i=1; AKwUvBw+ggopBWKuDyFokpGyPA0DjS6bLOFwF/2kDMni0R8ZBR9ZxnM6e15zm7rXB8t45nG6kJQ7i9JaDXHU6oQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bdFlsVzwyfcY426WA0jywGEpv7084zl69CBrWRZ5icD+tp4o/
	KWMIQP8mYrmL7fF6Dq8xJfN9KvyGTgbexTubFMkuY1dqUr/kGTV5TyQL
X-Gm-Gg: AYBFou3wXJAe9RmYlOyc+DcdRPurAtv3zk6uKmwWyVqOSiPbQAzCOT18ck7B5qt5SnL
	zeQES4lj/oxD7vptPkaN1JRdK4IdfChmWw4alEJ05IAy142OLVCvuM3pIUii1wGJqHMxg1z09xU
	E2o2hRa0dBM1cmJ6ZDzn/E7RudkKKWe0C/0puj4RDKbYh9wWOULu2dPVXttCD7WJ5TTa1x/ZapO
	WEURieuv2QuueaPPZ9B3ilFO2EALeECFABpxq6r826xLBHBFi8jIaI518QLPDlxy2EMxV/5lDkI
	ASNAykIcqsb7uC9w8vH8UCnAwULMJpSt0M+WwS36X8YyntsxOWN58B6tLU1wrzw+tsOnXJBYxoV
	vckF7ObnNCEkjSTl0JE9mqLj8O0wOXVFViNFQ8crgRRQDUzKykk7bugW+/sbCSr7cmapHZKnkA6
	k62NMEgS2toAC1fok4hx4/VbIauhn95VdkRfRlS7NfY5OCrfF5kozALu1xhcUebXTfwqSCTDUIh
	O0ETtVw3xNHN+x0UGAA474mCuixcNYK9zgqATo5IwaCEN8W4/6vSP+quv4KKoe0HnNk+PPu5jz+
	0EVOLRF73kEAHNeI2AI9qr+OOhCmsgZCytgc+18=
X-Received: by 2002:a17:90b:534b:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3ae898127f4mr10100410a91.24.1793686325004;
        Mon, 02 Nov 2026 22:12:05 -0800 (PST)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c627260sm2564063a91.8.2026.11.02.22.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 22:12:04 -0800 (PST)
Date: Tue, 03 Nov 2026 14:11:59 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Jakub Kicinski <kuba@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: pcs: xpcs-rk: limit advertised interfaces
User-Agent: K-9 Mail for Android
In-Reply-To: <48cb8a9d-622f-497c-a13e-bc679c764ce0@lunn.ch>
References: <20261029094916.3127193-2-coiaprant@gmail.com> <c5fc86f9-3c43-4aee-8d88-92e8f88c6d5d@bootlin.com> <1B8D463D-1295-4BF0-972D-859C342E49F5@gmail.com> <48cb8a9d-622f-497c-a13e-bc679c764ce0@lunn.ch>
Message-ID: <27E466B0-72FD-47BA-B952-68BF4A817A04@gmail.com>
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

On November 3, 2026 10:54:57 AM GMT+08:00, Andrew Lunn <andrew@lunn=2Ech> w=
rote:
>> Hi Maxime,
>>=20
>> You're right that for modes the PCS does implement, the limit belongs
>> on the MAC side=2E The complication is that the compat table describes
>> the whole Synopsys IP set, while a given XPCS instance only implements
>> a subset of it=2E That is a historical design issue in pcs-xpcs: the
>> table mixes C73, C37, 2500BASE-X and 10GBASE-X entries, but different
>> integrations implement different subsets=2E
>>=20
>> On RK3568 the XPCS instance is wired up for the C37 SGMII path only=2E
>> 1000BASE-X is part of the same C37 core, but I don't have a PHY to test
>> it against=2E QSGMII is not implemented in this core=2E 2500BASE-X and
>> 10GBASE-X are separate modes the shared table carries, and neither is
>> implemented on this SoC=2E C73 is not wired up either=2E
>>=20
>> Trimming the mask is not limiting the PCS, it is cutting the shared
>> table down to what this instance actually implements=2E A
>> platform-specific glue is the right place to do that=2E
>
>Are there any registers which describe how the PCS was configured at
>syntheses time?
>
>	Andrew

Hi Andrew,

Yes, looking at the `xpcs_identity` code, the core does probe different
MMDs to get the rough type: PMA/PMD MMD for C73 and VEND2 MMD for C37=2E

However, even if we determine it's a C37 or C73 block, that only gives
us the rough family, not the exact feature set=2E For example, a VEND2
(C37) block might not implement 2500BASE-X, and a PMA/PMD (C73) block
might not implement 10GBASE-R=2E The MMD ID itself doesn't tell us which
of these sub-modes were actually synthesized and wired out=2E

Since I only have the Rockchip RK3568 PCS documentation, I don't want
to blindly touch the global compat[] table in the core, as it could
easily break other platforms (Intel, NXP, etc=2E)=2E

That's why intersecting the platform mask with the core mask in the
Rockchip glue is the safest approach for now=2E

As a bit of context on where this is heading: currently, the PMA layers
for wx, fbnic, and nxp are separate source files but are compiled into
the generic core module, relying on a shared compat table=2E In a
follow-up net-next series, I plan to split them into actual independent
modules using an abstraction layer and their own xpcs_xxx_create()
functions=2E

This will allow other platforms (including Rockchip) to do the same
mask intersection and PMA-specific setup without bloating the generic
core with more and more platform quirks=2E Right now, dwmac-intel seems
to be the only platform that completely relies on the generic core
without a specific PMA module=2E So keeping the core generic and doing the
narrowing in the glue is a safe, self-contained step that aligns with
that future direction=2E

Coia
