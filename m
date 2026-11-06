Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942221;
	b=5n3eBsS6zRHNqLwZusJ048f1ODigzObbKD9JO3W31DrnGfoAHq7Utd/wttfvtyW+NvPQ
	 nZZSywD0Ix17aF8/LYwp4ZKUGPTItLrsQwvY2fINFQ6TMqORkKezk6uYlXCSBszQe54Za
	 V0xmI9i0vE5FKav34vM9pUYgQTYKaAvrRtlUSj0YRQYFlRqGt1eGsUiKflj4TFzgv9Zmv
	 Y9/FfTIcavTYoYXy+ptwWt3EgwmJsttDMkw/Wi9Ijue3PUC6n0R5Vcud2/Z6x2WIkcks9
	 D0RswZDe5lOpMn9Ye4jxwLDSyngTicZJUwVFKymmokoclqqys9SRFUxxh8XJBSNJ6lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942221;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=7nQnjeigU0D/Ve61Bm64NyUI5X1+1HOvlN3FLT7eQws=;
	b=LUdsP8rKd1xP8oEpqWqXiXqBqT9aJaOM5bixpNF6VcwS8EMBV7Bafb5TQiO9BNC/J5m6
	 ztzL2gVIm3wT+el5ZI6PxyzMcR+3caHKR/zgZwf++l1RkdM4R3Uli34Lrd/bhGZ4OkNie
	 0em6eL0iPwA7RFDuvz8laeavVP3Htbqu/ypU/2IVFCSfMOAFXDerqB3GqREXBvtxrDTOw
	 S6f89BBkL2xFmw5qgqVPWS6+iRRHmHODzD71/J7Hp++HepE1r8+U5ueYgPSKczr9hndPP
	 n9kHbwAbCYyAeyhPbnbWF8Dln80aTMh6z8W9ICttNlg0P450/E4uKYMjUgZV7a6DHWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G64l78gU;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29DF606A31B;
	Fri,  6 Nov 2026 05:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=G64l78gU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1793942218;
	bh=7nQnjeigU0D/Ve61Bm64NyUI5X1+1HOvlN3FLT7eQws=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=G64l78gUR0IAlLTqhtV55R1Lb0orlCMZJq0U09Smi0VvQzm6H0sg0MuO+0ZDbw0Bh
	 68LLXZ6W9vlek5PSzEXG4YuQERv7CSRERiZnqQmyn5dAVrRVQeaefh9e4zYqJDzMgW
	 Mopav8bnBAWo71A7hDm0/39v4Wmdp94SWcYIuCWpb78GyL2NXJ2lrSan0fl0D7GPBg
	 l5bbr/nRNFN2gRPR2s58wf0Y7R9u0gr7kara2GOhoGRN0pRAh66T2Eo4LBsXnG/w2p
	 7pLFDrkzQL5xbg4Z9urIbaGcaUwPSGFrQF12jZxjcCbOvOrUqsrXmxRCKZ53be2KMp
	 6Hh5+nWNR8GnQ==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 773437127A;
	Fri,  6 Nov 2026 13:16:57 +0800 (AWST)
Message-ID: <4d149414902c2e7d2d8cbfb2cf741f6e6b21add0.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: yosemite4: Remove Floating Falls
 board nodes
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: eric.yang.wiwynn@gmail.com, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>,  Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, patrick@stwcx.xyz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sean He
	 <sean.he.wiwynn@gmail.com>
Date: Fri, 06 Nov 2026 15:46:57 +1030
In-Reply-To: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com>
References: <20261105-yv4-remove-ff-nodes-v1-1-aa707a9577b7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, 2026-11-05 at 09:49 +0000, Eric Yang via B4 Relay wrote:
> From: Sean He <sean.he.wiwynn@gmail.com>
>=20
> The Floating Falls (FF) board carries a pca9537 GPIO expander at address
> 0x49 and a FRU EEPROM at address 0x50 on each slot I2C bus.=C2=A0
>=20

So the expander and EEPROM are on a pluggable board?

> FF was
> planned in the early Yosemite 4 design but has not been used since the
> DVT stage,
>=20

That indicates they were used at some point, and the design has
evolved. Which "stage" does the devicetree currently represent?

Have you seen this discussion:

https://lore.kernel.org/all/d7794f74b26bbc1ee0a70e39c5671acc018f80eb.camel@=
codeconstruct.com.au/

>  so these addresses never acknowledge. The pca953x driver
> fails to probe all eight pca9537 nodes on every boot, and the at24
> driver does not bind to the eight EEPROM nodes either. Remove the nodes
> for both devices.
>=20
> Signed-off-by: Sean He <sean.he.wiwynn@gmail.com>
> Signed-off-by: Eric Yang <eric.yang.wiwynn@gmail.com>
> ---
> The changelog was drafted with an AI assistant (Claude Code) and
> reviewed by the submitter.
>=20
> Tested on two Yosemite 4 BMCs, baseline vs patched image: the eight
> pca9537 nodes and the sixteen 0x49/0x50 slot-bus clients are gone, while
> the 0x51/0x54 clients, gpio chips and FRU objects are unchanged.
> CHECK_DTBS=3Dy W=3D1 shows no new warnings and the DTB diff is exactly th=
e
> sixteen removed nodes.

This kind of verification isn't terribly useful? Are we trying to prove
that dtc has correctly translated the dts? This reads like it's AI
fluff and is better left out.

Andrew
