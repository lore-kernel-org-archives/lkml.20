Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609322;
	b=IJUGGDn1YcKo+kPLzZcvpNBEe4ZTD1zXYzj/kCDz/vQ6gG8mjeZp5WZjuoCUKs5Ve10j
	 FAbAQ/2e6rgFBMgI+EAswLxdeQMV2xih9RWBkaPqkGtiha96pEELAm8R+TogonwT//KBv
	 RHYl3uMIqeO0jxujh9vuRjrmM6ENM79trOWtnJsGl7lGXAeLP6w7Oo6MIqYOG88flAyTS
	 QBWOgcftUTg7L12j1ZR5zRJScFNscMmuO5fHQWS5RQQJQxxtIGSx6g3bbOELLgSwofbE2
	 jdM7gnZnWkWegwqW3b/J7JP37uwuK7M3KZ5+3UiR7vg4EJExskvgHPh9xuXrR14dQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609322;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LITKaWV7XMnQptJT0JVIP2eNuxfwTtrcVKQlo7sTeg0=;
	b=eQ8K5P+7hKwdOgU6yXQh3mmGcfG2FsTE6ZQniAtTrojwJ/hsC6YAbWGecDJgkVGCX8yb
	 9lksa/3kpemvatH0IKaoOdHlSHJsWnSb9jt03X8LPWdSecRv0TQTMCJt4faIHxCdIElPc
	 tKiTUcnb4vkvOy/GEW4y0X/bZ0zsGLC0EFUKrDsHD7ZhdX7QoJ8FaOSDvWQoq7gmLHw4g
	 D0KINL0qAiVWxRr3ShS4UNIkciJVhUd+r1yK5b4hoY4SNNN/qmVsLrKqcEUvZcUxd/7Kf
	 mXEVOPNSwf7cmfdBXkbY1agBjLTgFpzEJiwEZVnwg8AtSTHZWil7+QMvKxDH3FsSvRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA4A606A54D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA4A606A54D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso649046a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794609321; x=1795214121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LITKaWV7XMnQptJT0JVIP2eNuxfwTtrcVKQlo7sTeg0=;
        b=KVGxQIkNsy4/uYn79TEx4KmdTY4HXDNBGFDBIXtejw/TscsdmSYix/5ulJK5QXUTA0
         1oZSbIBK/CBgro+u2AmLNF2zrndOZAeF47qCsrkupa2kIt5hEOWYY+g8M1npDfre3RxQ
         H/+JzFyHV3Ng8/R9F7Cuz/ntE2Hrs9qYpeNi/K1ShIzbHkfLWJudiNLtQfyGdF6SH5BN
         LtpdBoL4ON+r7HmKcKieWbvvDTJwjfGZzs28uRLIQQJQnGS/P/YraRZA2okAJFL7bbYZ
         VypirzFLHSipJm3x3Qwl/bQBc83JLT/r5LqTSuKnO0JNfV22yo8f/EzkEMeiahCrDFMV
         yuDw==
X-Forwarded-Encrypted: i=1; AL+hErEW0qDd+Tx+o3CasRjmR56b0nmqDwSICUJNwG/KP27ROtrKDpaahculcc0rxQGb1yal66yuM/HEbYBX0p8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gZERJLLAzqedKnVDfhsVb/u1MS4fCF+zhRL7heFTeaQTrHimd
	A0QVKENAJrRabbJBaD+/1piK4xHu6XvgMPxt3y4NfIJA5sU4ZmVcQj8bvKmlBbnp
X-Gm-Gg: AYBFou0vaU7dC/HDHxdejFEeCdkNgU1fNzkZ++Xy/qlNDSS4VF1BVakSSXW79JYFc88
	JI0IEhvWp7YkwNGqScBhYHUAzjmZI+0Hoht1rgRmVcAKeXAYAEosef4XuJ8PS6hpFFdsr0IV+FY
	HEKIs84aG9XDKNS0oeSpj9PK4momfjbaH+1U1x9NvUV0YDQPeiVrS9OQbP2v8IoV0jyUmvYCp3j
	SRhGWDQdByHXlOgHgzXgygaYCRDPG6xbdu6dDLTqYwRpxIzqPLdIIJNJQRVL9eyCEuwysFxsBAa
	pGCoOwqzHENtPsV9UMKLp0y1UXY93UPGYk/HWks9VbI/Mpmq35kSI8ppWRF0gLbQ29hRXt57hUX
	nPrwKqa7pEarfWFytxHWJ6r/DrekGdDFOXrpiOwyfMWhRsN4GEqNETZwfnWeZt9B8tGCtZxx+hQ
	bPh4ytvl3MjQciINYBvtqbxOXRAqnXFY8i1/ImQXqdtZcXvRS1RQmp9LGePrYENKm02JvFKm4gg
	harbhvxft/OYzkQh+DgXMZ+A3/ZZWUe9LjlYEsXnT4+y1lbFlI2yRExzFzHCoRGW6BYnBnpWV0t
	qP6NG8L07z9IN2P9n2LLHOZCaCq7qmk4g4k3fhAvxjvo+Y3jtQHdPuL3vBGU3sSkHNc4gtFH+Rk
	8VU/f9K8zNuUc
X-Received: by 2002:a17:90b:2b45:b0:3a4:e735:b39d with SMTP id 98e67ed59e1d1-3b1b0cccea5mr3364263a91.64.1794609321181;
        Fri, 13 Nov 2026 14:35:21 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d04336sm11647942a91.7.2026.11.13.14.35.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 14:35:20 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3720addb068so2383774eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:35:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEzxz9u0Jw06+AjtieipyRCVF9DvYLYXiQpV0sp0poaSFciqfJLA4cBHJ4vVaAJ1E52XWUBg+eTTJPWiZk=@vger.kernel.org
X-Received: by 2002:a05:7300:85:b0:376:e950:873e with SMTP id
 5a478bee46e88-37965f9ad51mr2968029eec.12.1794609320230; Fri, 13 Nov 2026
 14:35:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev>
 <a2f45802-b75b-4a19-9508-2d1b5ebe473a@lunn.ch> <avcoghKd4CU13QI_@makrotopia.org>
 <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch> <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
In-Reply-To: <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Fri, 13 Nov 2026 17:35:08 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>
X-Gm-Features: AclHuK92955TDOieITeTuWAvZpOeGFZi5VRbt4O1JwbW-bk85arSJHpEKRZecOs
Message-ID: <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2026 at 05:16:51PM -0500, Joseph Telaak wrote:
> I'm testing the other way now, with the PHYs described at 1 to 3 and no
> reset from Linux. If that works on warm and cold boots, this series
> isn't needed and I'll drop it.

It doesn't work. With the PHYs described at 1 to 3 and no reset from
Linux, neither LAN port passes traffic, after the flash or after a cold
power-on. The same board with this series works.

So the addresses aren't the whole story: U-Boot leaves the switch in
some other state that the DT can't describe, and the reset clears it.
On your earlier question, the driver already writes PHY_ADDR from the
DT, in gswip_port_enable(), but only once the PHYs have been probed.

Since GL's own firmware resets the switch from Linux too, I still think
a hardware reset at probe is the right fix. I'll send a v4 with the
cover letter corrected, this explained, and Sashiko's points addressed
(the silent skip with CONFIG_RESET_GPIO=n, and the repeated pulse on
probe deferral).
