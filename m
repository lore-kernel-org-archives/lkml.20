Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670035;
	b=nAzAc3U7EM9otnJlLWg3muaRX/w24PRONjJ367Iin+r6eNuxjQImp1tT4GD7N3nGG2Lm
	 emvPZzfk3hcvi7zH1YpmbRySomOwZtMulp2RfX1cELamAFHl6kpplYx1d5Dl823tCtEY9
	 gK8+/vatGvUkMrk0PxY5ij0eUzJsajvvpPaXFI6i5YsO/rRqiksqLsvuReysepiAUsiKI
	 nCJe4VzKvl79GPzQh0yUV/OYcg30xEHUPHXapXxe4FGVUpfE8lBxp8XEHXTMhw0Q2shSG
	 F2Zdd1n22VQnrTESG3xv+1T6Dsww4V/O+i15fia2kmogNDwkP+vR/cvgNrGdNI22Arg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670035;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DfR/q336KNQwe5WWHF5lus4bznwLlva2G84Nw8tNU1w=;
	b=poKdKGU2Rpb8SNMlV+0kapKGWOphepXmBtDMicrS9y/cZqqc3GrhTH0oJb6YHC53aq4k
	 bcQQnho1hCcgdk87uK9rwXyAoDqO6MJqhjKk95AvslNQul+KtjrtnK+enwRLf7clU236K
	 xoVMEv8J0pnkPHKLOrm7m8Xsksri7Z5Nvu5IOTr2EBsxrSYlNBi5n+hluDTlop9/vSZjl
	 szTfsetCip8ykiqutKmE/NJlDVAlP6ba6tFtEHShfcocjwjIvIJibqIDLVF1Nzy1d3AcQ
	 V5i9kfEhuuC6uJ+nNnS2qh5VW3/wJA355UrT2DwbZMosUblrXkYWkdH1z3M9nKgjXLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DhVp6XIC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D9606A329;
	Sat, 14 Nov 2026 15:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 555D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DhVp6XIC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DfR/q336KNQwe5WWHF5lus4bznwLlva2G84Nw8tNU1w=; b=DhVp6XICUHsqJIhXRu7Ark/rdc
	66tH3tG+gTXWHkoYFgfzrhhXz6meTOgDx3GDP3lsEQnyF9tue2NujkDkSg7YRgN7yPAVoAgVWsBNK
	cQ/dTiq0zkPJptype9Ki5jbTuUZACkwnKxRQIaRqSHxQBU3GCvKKPz56WNvLQnWqjlfo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSFec-00GVlp-8n; Sat, 14 Nov 2026 16:26:58 +0100
Date: Sat, 14 Nov 2026 16:26:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Daniel Golle <daniel@makrotopia.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
Message-ID: <cb65f839-2809-4d1b-918f-386644c5f792@lunn.ch>
References: <20261112-mxl-gsw1xx-reset-v3-0-863e82074893@telaak.dev>
 <a2f45802-b75b-4a19-9508-2d1b5ebe473a@lunn.ch>
 <avcoghKd4CU13QI_@makrotopia.org>
 <9804b024-236a-4791-aa55-d83a71b2598c@lunn.ch>
 <CAPY4CJ6jQTNE=ZtyBysaxuOxG1Pb9zFsYcyas8isfXte2=OiKw@mail.gmail.com>
 <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY4CJ4gB42mW6UW4Qk6r1+u2_AA=58WTFCvRrea2cedPuAcBA@mail.gmail.com>

> Since GL's own firmware resets the switch from Linux too, I still think
> a hardware reset at probe is the right fix. I'll send a v4 with the
> cover letter corrected, this explained, and Sashiko's points addressed
> (the silent skip with CONFIG_RESET_GPIO=n, and the repeated pulse on
> probe deferral).

And this reset to clear other settings was what i was thinking about,
and how it affects backwards compatibility.

In general, a reset is good. So you should add support for it. And i
don't think there is a DT blob ABI problem. To make use of the reset
you need to change the DT blob. If you are changing the blob, you can
also change the PHY mapping at the same time.

	Andrew
