Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837979;
	b=YmeC1ND8UwdA+cwBnGgv2IL6UPyVDdOkvNCowAQLTtMIapF2jC/2VqeKsluasR6twKXL
	 zRIaUPaJRq6Hiya42q4VasL3GAxOKBgWwDuLbdK3DmK7Ln3m4g7t/T906sJJB74Zc7yeo
	 /vZHy4xOPhtUlS0AD33hn5AfyDByCj681+mbhodafn0utU1Cya3YRai5Tfxi4uePqsXZ1
	 j7Aq76iTBaNg6YMsqavCYLTEIOj9WPGG5aRn/TldXyVsE3YxvcYJuNIMDYY6ogGlTsrbi
	 /wqhmnErH7r2Cn5eA5pB5Ws+cCXao1XlLUYqIPp7/CrEawDGvYTxUhtSjzMeSP1nBcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837979;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=uQ490Z9YD5Zb0B6sUGm01PlusvpF3yI7T/jSq/07g/M=;
	b=WWvMaJ+KGa1jqGkiFGdkAMClj3r6R6fM1GExIwbdX0rBEEYMVI+AnfkH160WHx8Uqwe9
	 A8jpReKHL2ttAkrtg56wlz/VqCEvg8j5IZQROwicw1XcV5b9Pd3v4azvyiqPG69rUA/Ld
	 tkP1orfBfUl3c97rjd0/GwVX+5h3ZVS7dhWj8H8O5ntVVBcwPmffnVaPjkX4c2nDCrqiQ
	 HC0GKXaGU/FiK+I0my7QW+b+x6LNBiFqUN/m2TS5qcaJfRv1+SJ5RhMews4+WCGvLjT0Y
	 W7wuUGZ4URh++d4oaxtVj2BslxfoTAvrXM7J/rk04XOMB/n4x+c4viKnzkRoQvNe+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1HFFJoh+;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D236606A323;
	Mon, 16 Nov 2026 14:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D236606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=1HFFJoh+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uQ490Z9YD5Zb0B6sUGm01PlusvpF3yI7T/jSq/07g/M=; b=1HFFJoh+0tpJ0TOZ3zWzqtcsUY
	E4OTYeSRkFn7qsyit+tbv+xlPpIpqHjU4JNK9Ltud7e0GyoeIc30NOfg5p6b3t/mc2XhPSIZYOoEq
	FkhXkTIEm1DDzaEx2P4ZyoMm1Z3ka8/fnnolMESRLsEXRwkc6RJWfPImhDQQaL5RLC80=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSxLW-00GvtA-27; Mon, 16 Nov 2026 15:06:10 +0100
Date: Mon, 16 Nov 2026 15:06:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: netdev-bot+sashiko@kernel.org, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com,
	olteanv@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH net-next v2 08/10] net: dsa: realtek: rtl8365mb: program
 the PCP of untagged frames
Message-ID: <e3e3ec6c-1242-4072-a251-8571add37013@lunn.ch>
References: <20261112-rtl8365mb-dcb-ingress-v2-8-f8e6fbdf8c99@pengutronix.de>
 <179478369746.3136.10805769576309531848@kernel.org>
 <avsJ-gmYVHqx48ON@pengutronix.de>
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
In-Reply-To: <avsJ-gmYVHqx48ON@pengutronix.de>

> Restoring the old PCP does not help here. A write can fail for two
> reasons. One is a register access the regmap configuration rejects;
> that is a driver bug and shows up on every call, not something to
> recover from at runtime. The other is an MDIO bus error, and then the
> restore goes over the same failing bus, and the state of the switch is
> unknown whatever the driver does. Reordering the writes does not help
> either: either order leaves one field new and one old on failure. So
> v3 keeps the code as it is.

The LLM often does comment about MDIO errors, but they pretty much
never happen, and there is no recovery. So i agree, this can be
ignored.

	Andrew
