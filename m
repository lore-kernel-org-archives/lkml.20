Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838103;
	b=lQcFpNYDMJUVTXTAeqrgmWQxB8+cMCaNKhZgodpEFRwOXJ0LHsfroXZrvxLYdhDUpG8d
	 AIZlSqsr0c0Qu6L3lgzEIi21bEVji2bs2andG1f5BkXPASVnzSZ2b55n6/keQb4uNz9sg
	 HUbcueMR/mfWWfnDD51h3h5522saXcZ1KiYnMNnGfALYTzQDPh7aeUOyGfKMumWV3tAZZ
	 tdVoGetiWAUGJrdCH8i65Ui1qu4Lvfpu1xmxNRYnWZZBX8tscyYgijfjatwpCa9dCmzkC
	 W+ubIF8IJyD8ACc0xKMFa3L5ZlwTmD46KkDUgbv+17Z8DkkMWw5NKUg4R6flz3dNirQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838103;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=;
	b=mfsGBIl1r9sEgJ7bbqbr2nWZK8s9EYkB/zdCxSYJhSHIIhRoaS8H8C+XMl+7cDqBYuG3
	 +/ojub2yAvZGNt6VEoa/6yJSDZi8BTRIrj8XhojjP9XHnS0RxrhUeOaHDE+x7kLun1wHT
	 sXpL28I1Crr5C08ghqisnrif1NJr97nWQTV7QduqFQSJ0jlJXPlBovZ3DD7EuMlgMq/sD
	 RpduxvuiWoW5WQhiBjAfRuvq5rpvcKxuMFbLukq8llTkNJ78jW3/jztx2SQGONZxg1OUE
	 /LOL38P8eQMccftkIYSlXFU+IsTLFykiFXl0zamPvEUQssgwZLOywc/dfVHxoU/a+ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b="Le/+a0St";
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AB606A331;
	Mon, 16 Nov 2026 14:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7AB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=Le/+a0St
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794838099;
	bh=6XgtXKrUb7kPgwKD/f012L0xoO7Sh8iYK023Xn9JSFI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Le/+a0St5+LbKQh4KvmBcsPiv9Z54ypsyqNjFb/uB43/ZAZK22Q4F9XYCwyRVGMey
	 mphndvunk8dNwplRzbWJKiYV62UWsfDsL9jyF2q/UbEZUZ5QMgh7O95kDICDmjo7eM
	 xqNYO6BwW+WzDPoVMIWG4iRZdYeBmxdW2Ny9bU3zu2HPrDHLeL19cN9csHX68+0kmw
	 akgq6KFBgY4/y0bz+Y5z1T/MN2p9wRuoSfu79lQ/RlasxwzzX6HSxqu9ZzudxYyWkz
	 ya96AtbI4ikjJG+DABEeCu1ywwWLrxZHV9rt9LVtT8fRhrTuVTOIODVvuYExijyBT+
	 6Efj2sLle885w==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BCEAD6005F;
	Mon, 16 Nov 2026 22:08:16 +0800 (AWST)
Message-ID: <63b0ab24f2ec4f83ac87add03f2aa9517f7f73dd.camel@codeconstruct.com.au>
Subject: Re: [PATCH net-next 0/2] net: mctp: Add MCTP transport for the
 Axiado AX3005 IRoT
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Akhila Kavi <akavi@axiado.com>, Sammai Chakravarthy	
 <schakravarthy@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet	 <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni	 <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tzu-Hao Wei	 <twei@axiado.com>, Karthikeyan Mitran
 <kmitran@axiado.com>, Matt Johnston	 <matt@codeconstruct.com.au>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, Adam Young <admiyo@amperemail.onmicrosoft.com>
Date: Mon, 16 Nov 2026 22:08:16 +0800
In-Reply-To: <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
References: 
	<20261101-mctp-transport-irot-ax3005-v1-0-36ceb822f01e@axiado.com>
	 <4102c20ece135c4d94e94af4441a01425ad159fc.camel@codeconstruct.com.au>
	 <f752d203-8239-4203-aa04-884b4d7e5d80@axiado.com>
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

Hi Akhila,

> Thanks for the review. To give some context first: this link is
> entirely internal to the AX3005, and not for host communication. The
> IRoT's MCTP endpoint is only reachable from the application subsystem
> on the same die, through the mailbox and the shared-memory carve-out.

Yep, understood.

> Both ends are fixed on the same die, and no third-party MCTP device
> can ever be on the other end of this link, so carrying it as MMBI
> would add nothing.

It would mean that the driver doesn't need to be entirely custom.

I'm mainly curious as to why you went with a brand-new interface rather
than implement MMBI.

> The IRoT can't bridge anything to this link. As above, nothing outside
> the chip has a hardware path to the IRoT's MCTP endpoint, so the
> application processor is its only MCTP peer.

OK, makes sense. Be aware that you may have the other direction too, in
which case the iRoT may need to fragment (and reassemble) packets that
are bridged through this host, to other peers via links with a smaller
MTU.

I assume that's not in your current designs, but will crop up if those
change.

> If you would prefer, v2 can default mtu to the 68-byte baseline and
> leave max_mtu at the negotiated limit, so the platform config raises
> it explicitly. I'm fine with either option.

Your call really. It's generally safer to start at the BTU and then
increase, but if your platform design means that the max MTU will always
be safe, then may as well set that.

> Please send the implementation comments when you're ready; I'll fold
> them into v2.

OK, shall do.

Cheers,


Jeremy
