Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794691955;
	b=4ebAKBjyaZ9SgfP78YbhtbE3qBArwbQNnv2xcBh1Lu79i1uscx8u3RKNhrqvTrgNipna
	 bEMAZk6GAUj8y2/LhWctt8mNGhrpAWCEVgcLgDE/1lNPxmHk2AXvB1LIlEpwZBGlb+Yvz
	 K98lyvDRmf1uoVm/T2jlZStScv/97RB8ZEg7Yx6NyV3nkLNrfJXRlYcx15j3tmn1WnjK8
	 ZIqTV8TewAGg7OsctJ8PA3YI77iPcsleUerExolQ12IAa7N8igwfAfzlL0eBYqi3Pq5xS
	 IaeUAaAOCvcvakOYOhH9y5XiHtrhTla+57gJmidF5ppsm4bDGeOBb1/h1ZHtfCoiwuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794691955;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DEbZG1llRU2rKP4835mGQK+4Byf0ouXp6r0lXYvbzoQ=;
	b=retDfvuontQAnhjltrxufVtL0pImPuO1baGfcrNZkt7phLHckfqe22O+8V1Bdem0+hEa
	 /Oz/EDbRXMZd2gcGCOn2af+J+ya6TYhddktaJlnvxdZqPZDbUeZMtgoONVK4hDeGoFoij
	 cziLpWkHqaY4DJnbCRgo1CXrWBa7+U84Bdn+gvHUWTdt6/VAcgyI8XMb8owSJ8/Q0gCJu
	 08swZQXNlscmC41ih/a24FiLZWpszN4EdncRKkAOPr1tBnWr6ec5gaQDv+qvWUGo/ay3G
	 psrCveq57hXOhB1KKwEM3NLccasGw505QN1kgA+47Eq9TyrKwDktdOgtyC2Ov/SOV0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uYX6FFVJ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FB606A323;
	Sat, 14 Nov 2026 21:32:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 821FB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uYX6FFVJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DEbZG1llRU2rKP4835mGQK+4Byf0ouXp6r0lXYvbzoQ=; b=uYX6FFVJEw7Le8Uj1QSzGfpJBJ
	iAcbSAdllYeRN9n0tWM6MBCwHOd6dspEYhpZ/fPXJCdzgVKM6YBX3Ugs4tjdf6/wD8nIFEYjCQ7gI
	ViG36NwKQf/NFpb4hluBnhg+yu1m6gUJDB9eA/rypBtGuQ1imBpmVTS5uGfpKm9G6Dow=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSLMM-00GXSF-K8; Sat, 14 Nov 2026 22:32:30 +0100
Date: Sat, 14 Nov 2026 22:32:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: David Yang <mmyangfl@gmail.com>
Cc: netdev@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: motorcomm: Resync SMI slave after
 interrupted MDIO access
Message-ID: <825e7781-7331-4596-8efc-9253ca544d0d@lunn.ch>
References: <20261111163954.1132921-1-mmyangfl@gmail.com>
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
In-Reply-To: <20261111163954.1132921-1-mmyangfl@gmail.com>

> Realign the machine before the next access does its own work. Also, the
> initial value is unsynced, so any stale state is not inherited.

Seems like you should call the sync function in yt921x_chip_reset
before doing anything else.

       Andrew
