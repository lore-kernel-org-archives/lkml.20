Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793171448;
	b=yDibBFy/5WdwhbjjBsgJtSGZupkp42riNZnEeFyXmS/3TJP+rd8HR659gvzn2nhAjfnb
	 6ikTv3bQY/L0ekzFskbcTq8mpwjJb2fH4b8YyBjygV9FLH5XmBosZ4g58J/LeHDn+ZFqZ
	 5MBICkj9gQAKtSW7qbPxHHVG5bVwHGFexdQw9Ty+ABHVF8Q7VzJxjN1nh8u65IOhTybD1
	 sF+W4sIdnJqeM3ZAGy5vB1dVALm7iKGnpbU+yGvMTiOfxy4stjD1x6w+4cZfk6hQheLhW
	 qeQhxgJKmiQ1BBb4e6/sxSOokEzYMkhVm1PWd7nttOyu3sJvGOenBu1UlvsfOOEcDuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793171448;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=mVXDNhTKpePvAbfVkDflQLmXiubREs0zcPgQC9SEqXU=;
	b=MFpE/kGtbvAPkLlh755Ql6FCfdNsH3iEtKh2BHCFCObUv+4PcH56aNEMmBipnMjOWR9t
	 wzKu3zxZiUmqjkN0nsiROU4h/rlL5mXIc3A4DA5ZSpLvfWwgFrpKeplR4vmJvRCn4BN0o
	 Jeg0JVU3N42j6SvE2adJn2rHTQFQTwQGBOzfSy/NMYx2uGkxEHQNC10Mh4zBtR7Id4bL2
	 7dBvDkb7ds7mkEEVp/+bK3o56AtEAb7FbqU9j/ijdO51rMY29sN/P4vK/hAi0Qd0HjfIf
	 O8A+Ozk67szoLIWsuDW07UQzUpsbl/8WZRu3oOJylxUqOig7EPcufcYdFB6ogQ89xkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sLEF9R0R;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F91606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:10:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F91606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=sLEF9R0R
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 64180C4FECA;
	Wed, 28 Oct 2026 07:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6576E60769;
	Wed, 28 Oct 2026 07:10:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E157C1032906B;
	Wed, 28 Oct 2026 08:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793171437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=mVXDNhTKpePvAbfVkDflQLmXiubREs0zcPgQC9SEqXU=;
	b=sLEF9R0RDNzj94mlaiGX3kLFC8vDBqXa9MkaM91CyiLp9QKvQ0zj3vVjHB+qIxWs499vEc
	u2aIG0WlfK49GieNuz5L8PeZBMVAd1RgfH4QVotVgOwjtjf6c9oTxdSqix5T5KETjDFcBN
	uJssD8pgYpUlV7z0Udf2Ubvn06la8mshtrfduWw5nS0PtFvyS0LqotvdCLliOO264DAouP
	eGSXlqBgIyB+vrfa0cvujftw+FYOeRZXVur8WpZEzwgZ8hTVdFm0ij4wRCB1YNMP3RVPuI
	HRHHw2d+7GfkngSuJ72jakqfGEak/5t6tVEAyjtI0qZ01iMp+b4y+xkYctuIRw==
Message-ID: <51f5f79a-ed6a-4c7a-809a-f0507ae7a561@bootlin.com>
Date: Wed, 28 Oct 2026 08:10:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: phy: only remove owned topology entries
To: Jiale Yao <yaojiale02@163.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christophe Leroy <chleroy@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261028050312.126508-1-yaojiale02@163.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261028050312.126508-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 10/28/26 06:03, Jiale Yao wrote:
> phy_link_topo_add_phy() can fail to insert a PHY when its saved index is
> already occupied.

It's unclear to me how this can happen in real life...

>  Its caller may subsequently run the normal detach
> path.  phy_link_topo_del_phy() then unconditionally removes the entry at
> that index, including its ports, even though the entry belongs to a
> different PHY.
> 
> Look up the topology entry first and only remove the PHY and its ports
> when the entry belongs to the PHY being detached.

Maxime

