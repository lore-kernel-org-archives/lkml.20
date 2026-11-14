Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644886;
	b=ubfaL/XNAwpc4NQdBmuBIElK/4B2hgRdHHRUCPWE4uEcF3svwmqszA1cTpZZ+PDlb/2b
	 7lJ+N2VWfbYsXmQevMUw3a/tnU256+xe0um9/AsVaYRCRaRkjFpy1VVf2eBvLrN6e9HgL
	 TOTkUgkNKhanJ+/5PPjQg5B936qba+OYCeIxdDxDHwc/5P6Jj9gMmFDh43GfvLYrrM7Jq
	 kK+//OZWYZT4YvAoThktkbVUfLDGgUYDbeGnPGnCMIZXPdiE5B4oKPbrEoULwtwaWiAM/
	 F9R9JjMh2+TaKo9oDAasiE0n0ScWS1L2IXLDS+jdoKjgCQQe6mzAtcwtqK3YSgZaPlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644886;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Z8lG6RIILKdVtCLqTJnL4db2Nr11A+SPOEk6bNLst48=;
	b=x7JT544qzrL9ZcYqs9Ueo+N/FF75puzO3Uz0jeSFGptDDnk2D37GkbaQfKoeVDiH0yF9
	 A63vShVOuId+2NSBBn7d017bQnQKM328L7YtbuxRBwOz2TH0bW8l5s2Qd+fc4G2ABvo66
	 KL6wEsrIh++pMaWZVrobmIjbhdyg/yDuqRFjKWMrj24vKlx7l2kpLM9BFD6Z0kA3Uaykf
	 tfpxPosht/u7TK3P8KnepE8o+eNIrzSndzjKZmJOiuwMEaYqAF0KpXywWXdqcKR79ko2X
	 rwlHG1DHoIU/fe2xHzeHAbPxEBVsXmO5oRjPX3XQlP8RB7Xw9yi6yHbZcDe/pefrXIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aONj7GCZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC07606A32D;
	Sat, 14 Nov 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aONj7GCZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B121F000C4;
	Sat, 14 Nov 2026 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794644886;
	bh=Z8lG6RIILKdVtCLqTJnL4db2Nr11A+SPOEk6bNLst48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aONj7GCZBFFfnZ8Ubfmqq1wA/ptT6y4aS02AvlojcCkonlAxX2BcAToLyO51K9O6D
	 hYhVXTRLTiNcpr8p9Ud0Sz0nujRAbq1n9QL39vSKM24atcGMUZYWerjuQL3gzTCdko
	 3kZWR3j7wm8FgnHshN9zRb4aMXLCyM+cgLCDrfFUsmumAfUph5qUF4ZZL+6Yw0jAoX
	 YdihrZBWIiv8eWvIP0T2hF/EFCUZslaid3TO2SYhHGwniX9SdrblHXeUEklMG32gTB
	 PzGs2GCsULKUfwGptcLGuNk8G/2YWwFgGDnJCokFSrZ//UB00S2roMKwvnziZc/9OZ
	 Arhu/U28jG/Yg==
Date: Sat, 14 Nov 2026 08:28:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Sarah Emery <sarah.emery@canonical.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
Message-ID: <20261114082802-GKC100523@kernel.org>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
 <20261105-k3-tq-dts-based-on-com260-v1-2-aa0b7714aed0@linux.spacemit.com>
 <fcd2fc41-5af8-4256-8296-a5435fdf41db@canonical.com>
 <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DMTY56PU7CP2.JGIZ9XDXII9E@linux.spacemit.com>

Hi Troy,

On 08:39 Fri 13 Nov     , Troy Mitchell wrote:
> On Tue, Nov 10, 2026 at 01:46:28PM +0100, Sarah Emery wrote:
> > My understanding is that the nodes from CSB1-N10SPK3, the "K3 CoM260 TQ"
> > and the "K3 CoM260 IFX TQ" are all the same: a "K3 CoM260" module on a
> > "TQ" or "IFX TQ" carrier board.
> >
> > Is there two different carrier boards name "TQ" and "IFX TQ"? Or is it
> > just the same thing, called differently in this patch and in the EEPROM?
> 
> They are the same carrier board. The only difference is the power scheme
> of the CPU clusters. The bootloader programs those regulators at boot,

If they are physically same carrier board with same CoM260 module, but only
the power setup configuration is different? then no reason to introduce two
different compatible strings, if still need to differentiant, please find
other way out?

> and upstream Linux currently keeps the voltages it leaves. Support for
> the regulators is not upstream yet, so the two boards cannot be told
> apart in the device tree for now.
> 
> > I'm not sure how devices out there are referencing themselves. But if it
> > is in fact one device and the EEPROM calls it "k3-com260-tq", this patch
> > will not work for device-tree matching.
> >
> > What do you think? Can you clarify the situation?
> 
> You are right, thanks for pointing this out. I only had an IFX TQ board
> when I sent the series, so I did not notice that the TQ nodes identify
> themselves as k3_com260_tq in the EEPROM.
> 
> I will restructure the series as k3-com260-tq.dtsi holding the shared
> carrier description, with k3-com260-tq.dts and k3-com260-ifx-tq.dts on
> top of it that only set model and compatible. I will add
> k3-com260-tq-power.dtsi and k3-com260-ifx-tq-power.dtsi for the two
> power schemes later.
> 
> Yixun, what do you think?
> 
Please send out a version for review, I'd be generally fine within introducing
two dts files, but be careful about new model and compatible string..

-- 
Yixun Lan (dlan)
