Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829057;
	b=HE9gorVw5Q4B0cmSh1t4zdgih3y9ewJsSmgI34bnNiesFT5kvcDzLP7D9VhHKDrwkBPA
	 ahmShH39ZB4jnXKqJwatXEBO5NhmMh9OirKXRMAtXpsju4pcieWEHMEB71tOafZ7AypRd
	 0Sd1+g0tdXoMStTywp5PKZ7D7LJcz7si5Php9p/dPlxP0JhmT8MeCxC3DnF1OhTWzgOn8
	 pIW+LZDPUNw+UXpkv9E7q19kTvOELmZHfNH3nE3XvPXOmQLD7uXgRF9X/uDz2Kr92fEdE
	 R0ELJ/g2czNt7WRRkMwrQSsFeKyt4Lf+PtQ0UFTGeTR3FM30VwKlOUBE9nYSb0olAgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829057;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C/xrMaZEdozCXeS1OyWKkLrn5z+kvKgCOECHu40oOnE=;
	b=FQ9tZoeHLfJWAB0efzp6Y7K+IAL8WVaNGoftjNd7YC35/ryLnFY7ndm/uaj1fzj2NHbG
	 cu8sOP5SPbGlcm0sBr6JCnQTzPeRbwQ8ctHyENoraHxhIZsRHj3Hw1pemcqByp9EPNqpb
	 xjyaWBTZ8TvbswJZu1haxZEVmCMMj+KkvaarjFipbZSOtPRBG1W95lfkG/5Lgz8YLpaxW
	 QNEaNNll5Ucz33RwPIQL+o1/33lsnHPGZNONaBml9gdNIDebkAscO0mtdL5Rmeu+WzXTD
	 TJ+q41x1l0LOHWCWcOQVqdIDIvKan722MHRz3QKGwhCG4ES8BkkH+2JuJFR7H3TBcww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=G0wrkUiB;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5AD606A330;
	Mon, 16 Nov 2026 11:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF5AD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=G0wrkUiB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794829055;
	bh=BgYjXRjzcjLxGrbQy7oJJ5oNxCwDfd3tLx3OFtVZViE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=G0wrkUiBykcwdZQuzByBqWZDuTGExve5JfOThtNqTKW9/lr0qb22xuTijqZLqx4HO
	 wtQ2kTe3hU23MqhoIORYUNqU8xVHuBsxuEWOrrVF1uYk41u+uQKmDvLJo5/YwwOZbH
	 7j8sipWJANA7TQq0koB72YCvKzD5u2eoLBvKkDI1dTi/4mXGAJ04TigwEfV7ooblwQ
	 VepBU+yxPde7K4yU2AwVxO+JnYuIlEwAzFrm0d/S/u0wPNelHNb49pUSAufZBiZG4K
	 4LUXzcRruxxrJXDVAsNjqH5OuxQwUZvo04zChFWfJ2CYsGhCy05MyEw6q2mcc+4TdD
	 ME+Fjf1eM0J+g==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id C4FA38148E; Mon, 16 Nov 2026 11:37:35 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: g.nespolino@gmail.com
Cc: Yao Zi <me@ziyao.cc>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook and Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 08:36:56 -0300
Message-ID: <20261116113656.2203674-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Giuseppe,

On 11/16/26 12:23, Giuseppe Nespolino wrote:
> Tried it on the Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07).

[...]

>   patched   wol g, BIOS WoL enabled    wake, 1 of 1

Thanks for testing!

A side note: it was mentioned in a different thread that this card
only shipped in older NUCs. Your Slimbook has a 2024 Ryzen in it, so
the YT6801 is a current NIC that vendors still put in new machines.
Good to have that on the list, so again, thank you :)

Magnus
