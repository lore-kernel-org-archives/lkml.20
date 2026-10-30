Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793393080;
	b=M/gDitKv/sodgoBwTVPaBJExztGBz7r8IwyzPGv++YpFAOmlusrcZJT6i1tgvtOgCMqb
	 LX7bSA3I0A7pNMMbDN2luPlc4zmWpOvpEF7Qw9Ug1SqJ7webV27snDFjEmSYmjjXjuoCG
	 VbTU9TG3xeRON4uNSft3b491/z0NxJ4E/yBRXicewtC9eh8kcL4hU68mEIf6YY5og0urk
	 sINd2htmimZ0qN5vZu+IjcZagVLPTXERS4FGx1EU8dSO/J47GN2jHjaqVXppGP1rJ/8ol
	 qsl44zO4OWKUk7KVleifdemr1/ufrkJQn1HXDekNmmShjJhn0/Uwjfvo7n9uZrN9zkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793393080;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=B733tl/iJgtUaIicfu4vyW4w+2Xm7tgzANdFaqcSk34=;
	b=WPD/yIluLynrjmCUtn+15g+cUhRBrDSA9hg7RCrh9kBaQ/oHT7VSHOIV9QZyc5vMW8lV
	 5m+dkblhcbWPOCjDLGMq1543DVlwysdpnHe9Y/WnhEDy7ABjX+Ouz80YdQh/0+JIza6XC
	 n3ScpAqfh8nG2Ghgm7OJP2qArpokawwvfjSOieacEtYgFaZDBrAEVD/1rn/4+x4UuyCKK
	 CSjca+ootRMgO/ATQNdcgti2/zkldFsRM0uyUNjI4CzZhpMltjTvl3nDibY4LT8c16yr6
	 qB/9MbaTJ7h0W3PscGKAlhdM0SXDvNEg2QVvdjkaLnMApHS1CEPnySePWnQ6bOTs+mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="tb3t/Bu/";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BB6606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69BB6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=tb3t/Bu/
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 91599C49F68;
	Fri, 30 Oct 2026 20:45:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7D523603C2;
	Fri, 30 Oct 2026 20:44:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 47E7E10329108;
	Fri, 30 Oct 2026 21:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793393070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=B733tl/iJgtUaIicfu4vyW4w+2Xm7tgzANdFaqcSk34=;
	b=tb3t/Bu/M5Y3a2J2moGNqoLGux7zYhIpongIoJi4Q1715/qm4t4PqfjDaJddm8DbUeRBPR
	oWg3VQDDZUgwK7BKYPNv3ToM0PhsQGYpcfKWLRhRB/HCO2alCA6PcB9Fj4DuDDBPH84hkL
	YqhxrhXO/zEyaIQLBbCI/VKGRrw4nLOD5pUTNKQMH0H70z1CzQnHLW6MOgcIZhbL8yQtpH
	EHXopXMf69F3vS9QyXbLnY+o/oV5kQj5dwzux0y5A4+BPnY7WBYB4bjgmHAEHFiINvOYyt
	jvh4i8KC/89PneQNc1P65+5Hxla0W6r9wDqE/mM1J4j2gKoewRit10c5Oc7+xg==
Message-ID: <c5fc86f9-3c43-4aee-8d88-92e8f88c6d5d@bootlin.com>
Date: Fri, 30 Oct 2026 21:44:22 +0100
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
Subject: Re: [PATCH net] net: pcs: xpcs-rk: limit advertised interfaces
To: Coia Prant <coiaprant@gmail.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261029094916.3127193-2-coiaprant@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261029094916.3127193-2-coiaprant@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Coia,

On 10/29/26 10:49, Coia Prant wrote:
> The RK3568 XPCS supports 1000BASE-X, SGMII and QSGMII, but the RK3568
> GMAC only implements SGMII, so only SGMII is advertised in
> supported_interfaces.
> 
> The generic xpcs core fills the mask from the compat table, which
> includes 1000BASE-X, QSGMII and the higher-speed modes. Clearing it and
> setting only SGMII keeps phylink from validating interfaces that are
> not usable here.
> 
> 1000BASE-X and QSGMII can be enabled later when a board actually wires
> them up.

So the PCS supports them, but not the MAC ? The correct fix for that is
likely in the MAC then.

There's nothing board-specific when it comes to supporting 1000BaseX if you
already support SGMII, 2500BaseX may work (it's 1000BaseX but 2.5x faster).

Ii may just be that these modes aren't implemented in the MAC, so we should
keep them enabled at the PCS level.

Maxime

