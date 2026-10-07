Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205B128E0F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380077; cv=none; b=uT7Rtc0gVdlhNrIJJXO3HvsS7EMgOkUsCvHYpkM7sdJv8PLlMDv9LykOJcGv2QGpcDqsYe/I+GhKks5UjcP10+uqCOsRZUf0Q6iK1Of4m4KDQnRJCQKSTD3GgEAIsG46pcYkZm0tVECVpxkUi3FoMO+BqG7eTlWXlobmY33CNOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380077; c=relaxed/simple;
	bh=veC7dK0xPRrLFkaM681KuGvGBVLL+Vg781W7iTbhR2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6WHEHoJkmW1QMGTBMMzM8PSyDsTdNcwxHAS2L9JPJMRIbu5DMF2lfioIp9c3XJZUA6JyKiTNhrZgPbfP1rjHdHb+jSg5E5QIOqr/9QJO46N7Nk72y5Za3A0kmAUNuMtbpOKfWAQQARt+n6wjj2aLd5Cj4L9RQIiztMkQYSkWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uXVuXvG1; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uXVuXvG1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E78CC4E41112;
	Wed,  7 Oct 2026 13:34:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A77CD6074B;
	Wed,  7 Oct 2026 13:34:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63D6D11D50090;
	Wed,  7 Oct 2026 15:34:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791380056; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7JHn1c0jhTtw4x+nWKYYAbqqMhPie3zHHQoxJxD2lv0=;
	b=uXVuXvG16J656LdLBgB/YvdLRCtF7cNl7F7z8MRhCw7DfoMDCjoKh7CPEB+q8wYRKXkGF+
	gdbuM9x25zvRd+7wQkngET1D8OIxZIb7Bs2Z+PwMjqFtG/oVkzWxSOtR6tWIWr64vEN3fQ
	XOofftpU2esk91F41W9pDHHjXaX8ZskjCO5aRoJGO8rEWNlLTVKXuZMT4/l20OS3l7Q1O2
	ZZ2axwNfhTXrEYFzppLRJt278aYC/hqLkOhxHa58l5MnWSiBTDKtVfkfTrpiXpAL0dCB6B
	6+K3eBMumrG2ErINZe245wqqubl1ikDlNrWCPp0Q6hguo2dUL9nnZCr5PVlwtQ==
Message-ID: <4a283b8a-8019-4987-8c6c-23f9bebce858@bootlin.com>
Date: Wed, 7 Oct 2026 15:34:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 6/7] arm64: dts: amlogic: t7: add the ethernet
 controller
To: Andrew Lunn <andrew@lunn.ch>, Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261007082627.63807-1-tanure@linux.com>
 <20261007082627.63807-7-tanure@linux.com>
 <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <c1764303-9f18-4487-ba93-06173cd8a53f@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/7/26 15:12, Andrew Lunn wrote:

> 
> You should only need max-speed when the PHY is broken, says it can do
> more than it actually can do, or when a 1G PHY only has two of the
> four pairs connected to the outside world etc.

We even have a DT binding for that case :)

There's an example here :

https://elixir.bootlin.com/linux/v7.3-rc5/source/Documentation/devicetree/bindings/net/ethernet-phy.yaml#L348

and the binding is there :

https://elixir.bootlin.com/linux/v7.3-rc5/source/Documentation/devicetree/bindings/net/ethernet-connector.yaml

Maxime
