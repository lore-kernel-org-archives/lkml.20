Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805605;
	b=i8i+VtmdoMASHc+vqPqZ5o2Q1R+RywMnHxtGnEkVKTZS+lP9lB3/xPoMP5Wm4lA4g+9F
	 vh+9NFGyq9OsDZLSpNUuEjWbGK5J1EnfHXc5aOz30RpFI1naca4zBn/Vyiv/9Fqochknv
	 +lFGdTHSPXd+WHRRgO2ForekwtL5EH57S8GoOITAwdAXEUFgq7YED7IIS9T0ror6kD0yd
	 zg1FhN5eDUHrdqkShw8NYkMvvVZOC+2AzlAvkAFJKJtAbFI3owkfJfmB2v6uZY3YAJ7aK
	 vIo0rNyhskk9NLLUhKWKHSD7/piJ6YwVQZoUrqKarRH7+UEPsuLYXOmTUnE5kNFx+BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805605;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=tvVt81974dDm61IpAOs9Ba0sQDHPKYiHvBxV+dZs6KQ=;
	b=UlRljEmLAIoB8tl5YMTGE34APJeBQknNNJuOubE1np8jYs7QZ3ThagtlzVxfq0a4ts90
	 ViCBZTLGP9VIgBzzBfz3YZEyOegG0Prh7a9ieIcx/RcPg6LWyLAFi6XujIzLpSguikeLl
	 poZUKrJqdvbdUXuIYs3TgS1MIQxfz7f4Wbm1bxnENiB9TH5U+Cn9REqRAO/KynAotW6Md
	 +7S9Da7A+3GJWgle3sdfrfrt/zwtPdAw1duukzzNYOHd6a+Onv2Txq2d7Yisx4/s+p7j7
	 byAfnofL1+mQFeP58EiqzAM/LYNSsSdMxEyoliFiX6cBSyTZLUbkxukadFMPZtAzONw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GRvivkqT;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A72B6083626
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A72B6083626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GRvivkqT
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 44D464E41403;
	Wed,  4 Nov 2026 15:20:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12CD160770;
	Wed,  4 Nov 2026 15:20:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ACF0103291D1;
	Wed,  4 Nov 2026 16:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805601; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tvVt81974dDm61IpAOs9Ba0sQDHPKYiHvBxV+dZs6KQ=;
	b=GRvivkqTIqK4QgRIMpMVcKj7g9FAYSk5xLU8U+mFqx1RJ3kgHy7OYYG3Cj1nbL/detV/qe
	Ah4b9U5chZFnlCWkqPjHk8TadhZ/6KWin25D8hlewqxx75uxsm/Vm7kJPf/4w8WogulXqB
	yTCBS9wHogh7Olz096i4cCrl5eZq4zCP6SNvI4hnC9eJK5pNfXbU+ijTiqodZVkY0Ecznc
	6V6p0JLgFgGPwQBGo9UcFpbICPfwNNKWRWj1nf3R4mQjh9/6bJ62D5wjbOPtozXMwFU9iN
	cNW/CBp/TgJHiVtD02PZ0+Du8xcuNi5KU0Fm3dFG0VrqMCIzLRslD6WJqsFh5g==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v3 11/14] net: pse-pd: free the notification kfifo
 when registration fails
From: Kory Maincent <kory.maincent@bootlin.com>
To: Carlo Szelinsky <github@szelinsky.de>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Kory Maincent <kory.maincent@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Kyle Swenson <kyle.swenson@est.tech>, Ross Cawston <ross@r-sc.ca>, 
 netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261103220217.1131971-12-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
 <20261103220217.1131971-12-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557481.1333589.9794436031902414643.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 03 Nov 2026 23:02:14 +0100, Carlo Szelinsky <github@szelinsky.de> wrote:
> When pse_controller_register() fails after it allocated the
> notification kfifo, it returns without freeing it.
> 
> Free the kfifo on every error path.
> 
> Found by code inspection and AI review.
> 
> [...]

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

