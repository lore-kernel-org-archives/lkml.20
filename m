Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793356015;
	b=spHnysAejUTHGoJUJwRBmaZRZJj88M6bcmR9gzTW4V9ZSFT9Exjkj3XgJU53xLwmE0n8
	 bixje+srkkcLaRce0g8ZFUqS4Bo5c1HrW9cvWxZ+BsbUv1dbQ1fUnczgoMWv/TrOMLHWn
	 SRH/iOj+K9AEcKXBGfJAXUqi2iutnXnckpH70kPoHAapSrt9sB+GFbDkMBINsYZBlgkjG
	 CnJeml3EqwAMtQdUB0UrVT0HuD8G6wmyhFzx9+PS+Fg+klFQ3WRWf0R8bWLREtoob6g6X
	 MXTa1NlMlp+4LwUEXUD9WI2PhMeblLAk+4DAxPQ4EGdbXLTW7zxwmBtzuCLug02igQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793356015;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=RR1F54y5drcv+A4tIQHG4ZfpQR+6/k3IO0e9rn0QE3s=;
	b=G7QGjIYkrge/U0fdOxBp7MfSgZ4lnFM8iV9o7JntkV+NIT6mtxwcofgfJhNpCQXXfUOc
	 vY09j+SLwKokDcxcjHxjRSWH8285A2Txb3tt34eY1DAIrrlViL7K1ih32DlN3bilQ3PlI
	 8rqFdVfXavzG9fmBHTCam4U42QwHCZ5Cj7U7AeRfvbla9nQnhoP7DL13pVVPQALBHX6gk
	 f5w7Kjn032Sr4ZPxmYGP/cIJa70Hc692uZfm5wsMdM5NztYi2FCgWQWf+1zTL7fMNbE47
	 OE+AJSnkiqShKqtfG6J6/03OFu7DO+cE444aZmkH1AD/nxQtEmq6Z9feBBiX/piscxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vumznZ4o;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984BC606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 984BC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vumznZ4o
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D62C51A13BF;
	Fri, 30 Oct 2026 10:26:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A6731603C2;
	Fri, 30 Oct 2026 10:26:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 75DD9103287DA;
	Fri, 30 Oct 2026 11:26:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793356011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RR1F54y5drcv+A4tIQHG4ZfpQR+6/k3IO0e9rn0QE3s=;
	b=vumznZ4o/YhlDqvCPO6TgB6PpQPi7eFbzUumgVXbHN1PjGkAtHgef055JQtH86dxpVLhfV
	RCWeW4I/yhu2/s5jt/rkUjJfqtmDgUbvSWx9e29C8twC9wB+IjKbno0jHm1/5gtiHuMJko
	fmQYZW2y0sfgyTLpwEQt4zUcNAd7gsR59iOXSaLF9+tUs/PAloTCTYIWlQTpz/gv0BM6L0
	HeZQ8SyncywSA7zRbQLI/i8pHhngmF/JL6std7clx3aA35WWkikJnZeyO4SwavDaby8pEX
	jXKzceH6iEo5LXPNfqwuyfM64tMERtEbEb8NXhpfboohUqRyYg35c2NhIFLh8w==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] mfd: Constify mfd_cell arrays
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Andy Shevchenko <andy@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com
In-Reply-To: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261030071137.100954-3-krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:26:32 +0100
Message-Id: <179335599226.822489.13265784162305522111.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.

Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # cgbc-core

-- 
Best Regards,
Thomas Richard

