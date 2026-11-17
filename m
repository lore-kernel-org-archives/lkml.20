Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922763;
	b=Hu5R7fy65ECDN3jh9bT7DtGu9r3+C+yGmjv93fPyS5Y4scL/XmPVCdpIT9H9KzR4nfyt
	 EaeYmcDYK2qb5DURQGYiS5LPbX/nUd+AsIX1T3lBROFQJXPFee5R/umkEyL8l8DejBVfY
	 Cz9wHDKAEsGcg8IlUZ4ahB3mNyKgyEDD+FxpmJVzLneJa7DF92bYj75fuDLehrTPw/zAg
	 VmRLexEOK4gmyLHhnHQZpZSHKiMVpQL5ecIrIN18jvASs6Y1/YqE4SZaZjlaUdjGsNJ0b
	 uU/i5Y722uDq/ixVY23XXoVdYr2S1WObKuGWFGlTk5O0A77NBTRxXBynmLLNHTFoAEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922763;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=IdU7fuJp/dnH1scvf0X8x0Mvko0FNwn41ZqWFPzN3WA=;
	b=EodGr0qENCrQjx6bklbwzkZQ82Xo9K61Q8ySwfhAeUXO1UeFyo7K3Iw+OGtawB4Mq6qr
	 9LXtU/mXWn+5Ag5BscJZdfYrtH0aArUTbnLWyRG6qx393XaMHCI0/YkDEfF7M8YINuMc1
	 9N6DAlrsCCnfQ79UJcIBbxINCi+n+4hY5xae3F3UKzpzeUvNtmLWpdsQ2QdhSiXpE+vcJ
	 BRsC7E7KPyXjY9vdoWuyyaUBppqCNRyFpTNiNb0/jFuRgTwfnuElZr6ceBCJwrWskOEZ2
	 xZErhRBl5qOd7D8ZRweLl3pfftc91CEQE81GWGs1wsupVd1QF1BIxP5bL0ZZYBbSKJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IqrJ52Ec;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED371606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED371606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=IqrJ52Ec
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 3B278205A39;
	Tue, 17 Nov 2026 14:39:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794922761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdU7fuJp/dnH1scvf0X8x0Mvko0FNwn41ZqWFPzN3WA=;
	b=IqrJ52EcQB7KtKd4Q+4hL6i4QV1xPruULZAZRg/p5huJD8t+AJ9bfqYZQlJMZfmaBAQ4Rx
	xhhQekpg4YdOUqXTuDMyU2/2MilRIXXNNxeohkQJX/qnug+Z+cONpHAOq0EISxowRect+H
	AHjfan9k6csElalxS5BfrHwjtxdu/BE6sSpgFEvxoUTTN23EkbkKoL54g/KdoifOWg0erA
	pi1nX2wqk9y7TD7Vn86YHzTEgeIU2BPq5oBQ28K45Lv/OLBCkRj3HZ+IVa4RyUWRbRKKTY
	ElBFveTKjq/vncXHJ6MjC18hxJi+H6qMpDy50v+CUnzUCylvLPFW5tduV/DS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794922761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IdU7fuJp/dnH1scvf0X8x0Mvko0FNwn41ZqWFPzN3WA=;
	b=Kq5I1MuJfKh6Azmvb7Ey8yQAkfAnfOChz1CjjFuJFxG6irvcQD5QIsRBgUm0slx5QYLc/3
	JfRIclKbIixutIASX6WMDX7S+vVobcVC50GEY2BRQaL+o77FcZ9xCfAw8THCUH9Ka+Gz+7
	7IL8IwK1tOyEEqeJhAkslm6NOZxpUXFLaE2Mx9yYSjxjIak+qXTvxnAJEy3u5KnuqCz2zR
	DiO5ud3cPMLq7I5tDuGeluowHe02caRJjHHXwxCy0SbIprlKk5KCRbyCaO90Qq5R8AlzEp
	PdROgqsrcV3ibWRxlz7aIcwR+Pz4d2c00BccZ8yobLP3WZvwvwGD34tLoxqS1A==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794922761; a=rsa-sha256;
	cv=none;
	b=DLqcwKvPtrnnSk1aNsfKX7Lj4L1BOfpCPaaI7y2GfQnl3UBnGhtmKDtIRFCcnIWfvOWrX4
	gJ+ZYS+tYUKFFVjwu3uHB5u3oQq0NXMGlqoogP6zEOi8B+vnCzTsJMZFDrH39ZtRSAT6+6
	58RLi28+c1BHjFvaxiOqa9zYZcj64XzTKVxMuwXXpaFByYUf+MX4e0GMuAGkHWqC/82raI
	x1YLiQHGp6BKGCecTeq83hAbZUmWUDvWgBlUJ4YfkfSpKlLGmow9WKmp/zFSYw99nUwusm
	qH/pPDA2NLHZYUGUPgVxHBIH40+Vb+a/mibcuZi+/vJXReyMezroE1Sb0C+7sw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <9f67320a8b2629ce9010ed597a925c3919f3ad7e.camel@pengutronix.de>
Subject: Re: [PATCH v3] reset: core: honour optional resets when the GPIO
 fallback returns -ENOENT
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yang Siyuan <hsyysy@163.com>
Cc: linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 14:39:21 +0100
In-Reply-To: <20261117110812.20371-1-hsyysy@163.com>
References: <20261117095503.14115-1-hsyysy@163.com>
	 <20261117110812.20371-1-hsyysy@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-17 at 19:08 +0800, Yang Siyuan wrote:
> __fwnode_reset_control_get() honours RESET_CONTROL_FLAGS_BIT_OPTIONAL by
> returning NULL when the requested reset is not described in the device
> tree.  The reset-gpio fallback breaks this: when
> __reset_add_reset_gpio_device() fails with -ENOENT, the error is returned
> even for an optional reset.
>=20
> [...]

Applied to reset/fixes, thanks!

[1/1] reset: core: honour optional resets when the GPIO fallback returns -E=
NOENT
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D586a87701101

regards
Philipp
