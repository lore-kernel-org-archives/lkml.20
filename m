Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924271;
	b=pJBEwOXfaANpSrV2y3lEDjox7EKYCrpyIsSB2o2a9fmCDu7sq5+t4CNpMbXPcbXlfvNc
	 Kf9UDJFcLjj6xjyW+UyFg1Gh7FDWcV/ixTIcjHOv7vu/KLoBfZwN6mEz/eyjE+1oaKdFL
	 uboOruc/lxPv8r4O0wTc9Aa70m1exlDJdzwb46C9Fj1sKnOHwvbta8wFKTe02M9G2T6k2
	 JyqwnB7yMyJ8D5G9MibwnCurzOJUESiUCS7MFJaUwVbNADdO8lyI6A+sjNWfSkW2TOlQ0
	 UGxuFGmiDVUXxIwjwP7zPOXddR/tKCWtKMCncKOG4GS7yNyQ0T3jEtIDHu40cT8dgEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924271;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=9ammhtwy9K590KTiGuFRN9TiLwSY3ErK147SvQ2LZpc=;
	b=I1fTclFmbtTjwFrTA87ezm86CyWlaJ+imqFOM2oLYn0NCWJMten5Buznc5qjeBZqmh9/
	 wBkko7OoZVXgtsIoJHqL9JqCwwu7b7PVjDRzR45IiSYD3/UMWqoaDk4m4X+gQDSpbcrnr
	 V8m7m6exbi5PtUAWt51gB4fKx18hQdmvpGvmJqzPOaBkQWMmqELFRO6cAOA1HUqxh3T/0
	 q65PyakCzK75I3WfPYEITRysvJhDN5iH8JP2hrZMbLf1VnU5If16n2OdIBUXWBh2ATYyV
	 apbaPjmzW4ZCxVqj35LuCjdnGYMtWy/PQr6NKaNTC9XRWNyoGa/tKhUidRYY27oReag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="VQp/2GAu";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329DF606A323;
	Tue, 17 Nov 2026 14:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 329DF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=VQp/2GAu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9ammhtwy9K590KTiGuFRN9TiLwSY3ErK147SvQ2LZpc=; b=VQp/2GAugCh6U8BjJBR2NURYTx
	4wBg5YZIZUjRVRmHsptsQ+NJ5DwvHgOmov8GesBSEqbjAzFsfCODuI0UrioOSMU5J3PY/B0t5+nbB
	JD1/lKnuopmhJN1FIGlGWWR5xShBob2ACFCt8TlzzJVpyQLQviO1rUVqOQJOD46I9yqs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJn5-00HAGJ-QD; Tue, 17 Nov 2026 15:04:07 +0100
Date: Tue, 17 Nov 2026 15:04:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Paolo Abeni <pabeni@redhat.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiko Stuebner <heiko@sntech.de>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Fabio Baltieri <fabio.baltieri@gmail.com>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/2] net: phy: move
 DECLARE_PHY_INTERFACE_MASK_ZERO to core
Message-ID: <e3c5f034-1b05-4fcf-bbe1-8b473a8d2a0f@lunn.ch>
References: <20261110160554.918652-1-coiaprant@gmail.com>
 <20261110160554.918652-2-coiaprant@gmail.com>
 <20261116183012.11a7ba72@kernel.org>
 <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>
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
In-Reply-To: <CALj3r0gTuJEDd==WzAQ+cK3Og-2zMqvmBrhrd2ARbKJctG5ZAQ@mail.gmail.com>

> I understand your concern that hiding the init inside the macro seems
> subjective. Since you mentioned an Andrew ack is needed, and he is the
> net PHY maintainer (who also looks after the WX driver),

I don't look after the WX driver. I comment on it, as i comment on
lots of drivers.

> If Andrew also feels this doesn't belong in the core, I will drop the
> macro entirely and switch to explicit manual initialization using
> phy_interface_zero() in both drivers.

Using phy_interface_zero() is what current code does. I would also say
using explicate = {0, } is O.K, but i would not hide it in the macro.

      Andrew
