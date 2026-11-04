Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805596;
	b=WgOOnd+A0TS7lQSL3qXGJ712h+BFDgEXhweizKIOuE2afT6ExNV1OfVtpZo+DHWZQbHl
	 9L9YCac2FCe+tzuw3sFD3stbOxSt6Am+2rLJZWT+xqU4SNaLN/tPp/p3k0QLyMj1TVlRH
	 HO0Q9P2/Pa4LqE7mg5e+Qi3XitXf34Z0j2NYnenMYJFAX3AEhgHcBPV/InJReVlTUxZYr
	 n+4vC4e/pZ5/M2Tmf+beKqLg3ZAaf0kygNCnaJxreUV6idhx69PfCZmRwFqSBXzLQSFID
	 TgBvUBJByMigHpfnsk5kixX1OJNbKq10XZrf2FujvGRBHdDxhR/7tDj35DzvuBmDpVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805596;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=97kydfufHSxCoXLox9EAbX3q72ktpNixvcwM5Y7gxgQ=;
	b=jTlHaArzRictAAGpsrBKUD4YN9WDlEfJsw4o9i3KAXDEmqfva7Zp+uAkWMINGV4YUUgh
	 m2cZtL+tK1S1Y66M+6wK1emy3l5NDZiAvgCcXVaHhJg3PUbightmCuDFtKIgrMJu1v/Y7
	 fwNrcRlW+gznqYhf2MJg/lsDcVRMO9a72jpbD1KGSiHD3qQ15RaOQmYaO0lXbs2do1PLo
	 s8G+mkP9nqHyHy0ksDpAzfd1GhM4VAIPg2cYi8MW9eaumLevsrhQdHZgKRwtpJjSTp77E
	 J/gofBsQHRVYfzenJGGf0Bo0P2vn0jpJyeDPp9JUc86A7whGT35+6MofECA/LmuHpGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kTqNiuT+;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A0606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B6A0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kTqNiuT+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 24AFBC8F470;
	Wed,  4 Nov 2026 15:20:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 08B6260770;
	Wed,  4 Nov 2026 15:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AFD3103291D1;
	Wed,  4 Nov 2026 16:19:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793805585; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=97kydfufHSxCoXLox9EAbX3q72ktpNixvcwM5Y7gxgQ=;
	b=kTqNiuT+0nkQRbgur3Bgx7QQfFCSKD+cJOG62zuO+zyPUrvnAoGhhfp8BbNHJBYjpckpB4
	v2GjwkcY5ZsKMdtM6IsbWV+IQYdj03/zQcuvfuf1wmZf+CwnQUqZhe8gqXRQR5vyeHv9lW
	+Q9T7qVP62ouduMq1BrPN/ICLxZRJJoASo242Y3vi8yTF6A3VlI6lY8+jXlKN1Rtn/aC8z
	JC/gB/Z4yGF8yp75GFlWIxROorb+ygjNRhDC42W/vDhSeK0qBAwW7ga/fApw2CBGVxOsfl
	CwXZUkLg+RlQT+nxBGqxQ00FdXYQRafUHwe+UBHk5m82kRzMtNKOAKYSBidHGg==
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
Subject: Re: [PATCH net v3 00/14] net: pse-pd: assorted lifetime and
 error-path fixes
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
In-Reply-To: <20261103220217.1131971-1-github@szelinsky.de>
References: <20261103220217.1131971-1-github@szelinsky.de>
Date: Wed, 04 Nov 2026 16:19:34 +0100
Message-Id: <179380557476.1333589.1226488492070925173.b4-review@b4>
X-Mailer: b4 0.16.1-dev-17221
X-Last-TLS-Session-Version: TLSv1.3

> Fixes for the PSE core and the pd692x0 driver, found while working on
> the PSE controller teardown. Most of them are about what happens when a
> controller unbinds or fails to register.
> 
>  1  The kfifo is too small: podl-pse-regulator and any controller with
>     0 or 1 lines cannot register.
>  2  Removes two checks that can never be true. Not a fix; it makes 3
>     smaller.
>  3  A module reference leaks when reading the port state fails.
>  4  A failed IRQ request stays in pcdev->irq, so unregister disables a
>     line another device may own.
>  5  The notification worker can read a PHY that was already freed.
>  6  Setting a power limit checks the PI state without the lock.
>  7  A power domain shared by two controllers is freed when the one that
>     created it unbinds, or when registration fails part way.
>  8  Unregister frees the PI array before it stops the IRQ handler and
>     the notification worker. The worker can also be queued again
>     during unregister.
>  9  Unregister frees the PI array while a lookup can still find the
>     controller.
>  10 The PI regulator ops can run after the PI array is freed.
>  11 A failed registration leaks the kfifo.
>  12 A shared power domain's supply handle goes stale when the controller
>     that created it unbinds.
>  13 pd692x0 leaks its manager power budget when probe fails.
>  14 pd692x0 crashes on a manager supply that is not resolved yet.
> 
> Some patches need earlier ones: 7 needs the locked check from 6, 10 to
> 12 build on 7 to 9, and 14 relies on 13 to give back a budget that was
> already reserved.
> 
> Testing: every patch builds on its own with W=1 and is checkpatch
> clean. 1, 5, 7, 10 and 12 were tested in QEMU (arm64, KASAN, lockdep,
> kmemleak) with test-only fake PSE controllers: without the patch, the
> failure in its commit message shows up; with the whole series, the
> tests are clean, except for the older lockdep report and the reserved
> budget, both listed below. For v3, the whole series and 7 on its own
> were tested again. The other patches were found by code inspection and
> are build-tested only.

It would be nice to test these fixes on real hardware, to validate that
it still works without issues.
I will try to do it when I find time but if someone does it beforehand I
would be thankful.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

