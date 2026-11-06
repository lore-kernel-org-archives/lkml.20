Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959355;
	b=SzmgWlesWnU7gdHwV8RzZOq7d2WaP+w/t3Cg8YTw+AZOu2n+aJObGowAuuSzqazTYYmJ
	 pJRsLbevdrU0XxUMmy9xjpJ6wVPpVdGOfgQ4IryHaTTPclivnX1t21OyxXQDQ7BdFGTrF
	 Ff51Gg9JmuQdjYaBwbIuU0Ez7Nts2uuEsFdJy6HFmvRTzMnT5ho13ZzSUtp9fHYEVtF5r
	 LQCHRI3+IKWu0f4ZB6PpeY8hhwSAa9maqKXgdVcoeqjK6RcOxxQRsQMqQur5y7p5AspKj
	 CxeZm2pXESpNMXZdUPpwP5K17yirbC6MNCcIpV1JX23YhwRrmQj6wP6DSmu0TPSCpsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959355;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=YYAFLfnmuClaWisHccCt9quMqBTksbzuaIA8Tf9zLis=;
	b=lrhhdc12ArVLVEn/6m/tgYQ9nRRG3LjIw+anHcH3RtX0jVho7EajjfWqykyu9D6iP5rS
	 p7GkL44IWyxl+GvYzTByzmA7WShV5xAdMi5KvodeJtsd0PezXqFxPKeEUrPbyh1+JCFxx
	 G37nRn6CWQJ9ygIEqMo8D/Wh65JRicU9rNGP7LZtFarg34AzLNt3KYhIZn1w2jBZihYil
	 30Md9LDrOc2I29W+n8U20Ka7+6QdTRy7zP2xi2W56MCwqprH7m5XCJeGLOou75pitzIXX
	 JLxYDklaxhaJQ7924z5wS5eUJfracnSNqPgbsOaE9a07pocGQAzP88+GQUJEcJxFdlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjieQEfA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 34E12606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XjieQEfA
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E91221F0089F;
	Fri,  6 Nov 2026 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793959354;
	bh=YYAFLfnmuClaWisHccCt9quMqBTksbzuaIA8Tf9zLis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XjieQEfADSPpDOh3BxUfDruK9GH2h9Xogmr4wr/MaFYtVcE7ePTBV2RJGRoMh5C5V
	 0bQbHWDATG/rN87vGep2AaT31xoXUKjcghQPdT05x4n5ChXi2Kc0HCq3F9fcq3N0Bb
	 CEoGhK7hScgcNLkUIS2tAz9jdAKaZolQIWtIDGg1SdpjlShRJSUBvXl6pnuzlGNdHd
	 DyXLBkZKPczbtbHfKBklLLLShiUPM+f/WZRGtsAN6zRoE6U1GYefR1zXhJ7POlkn35
	 96IvF+dcK88QNAYAxMKkmDobok37n52jshOUUpJCsqJs4QdNfet+newtSQ+hbQFwXv
	 S+bHIKNmVS3AQ==
Date: Fri, 6 Nov 2026 11:02:30 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] reset: gpio: Parent the reset-gpio device to the GPIO
 controller
Message-ID: <sb5jpqtpvrtghyo5ainfsr6flrcooaavg4whvp6qog2baovu3p@efgy6u57tcbw>
References: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 02:21:55PM +0200, Abel Vesa wrote:
> The reset-gpio auxiliary device is a child of the GPIO device providing
> the reset line. That GPIO device is unregistered when its controller is
> unbound, which removes the sysfs directory of the reset-gpio device with
> it, while the reset-gpio device itself stays registered. When the
> controller is bound again, probing the reset-gpio device fails:
> 
>   reset_gpio reset.gpio.0: really_probe: driver_sysfs_add failed
> 
> and so do the consumers of its reset line. This happens for example with
> the LPASS LPI pin controller, which goes away together with the ADSP.
> 
> Make the controller the parent instead, which stays registered while it
> is unbound and gets a new GPIO device when it is bound again. Keep using
> the GPIO device if it has no parent.
>

I believe the commit message is a bit imprecise and mixes up the naming
of actors.

We have the "GPIO parent" - the optional[1] device that's bound to a driver
and calls gpiochip_add_data() - and the "GPIO controller" device which is the
device we register (and optionally bind to the GPIO stub driver) which is the
one exposing the lines.

I'd reword it to:

"The reset-gpio auxiliary device is the child of the GPIO controller device
providing the reset line. That device is unregistered when its parent if
unbound, which removes (...). When the parent is bound again, probing
reset-gpio device fails: (...).

(...)

Make the parent of the GPIO controller, the parent of the reset-gpio
auxiliary device too (...)."

I still need to test it and Tyler's fix with my reset-gpio +
gpio-shared-proxy setup.

Thanks,
Bartosz

[1] Unlikely but there are still legacy platforms which register GPIO
controllers directly from platform code in board files. In case of
reset-gpio it will always be bound to a driver.
