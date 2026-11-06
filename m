Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793974663;
	b=GVWcTl2pHMf5J/Q+Xv/hr48HyAK+QSCinHJVLeKfQ7KFhd1zMQV+auR3f77zCq1hwyTi
	 D9diUKHAv2XRErH3YxY3Q6M1qSRF2Lx7EIqPCmFLXzR+YA35zEE2OxRxTMr4hTymNgAB7
	 ztEbtJlvHQdEJC6Jq7bR4aQ5EURgMDsbWDmWHvOdXyglFzHiiPOEyItEgaNuFiVVGPlOv
	 Sj9WTVbQ/2EcUY7txlIuXYhKu9Tgl2K3hbcEKfwK5D7Jej10uYrgV9K/waFkHowcZVZTT
	 QTAwEOFtRlhmDxQiAt00dxum1bwrsjUlND/QLLQrDdvZv14M1w9ksROD0AvL9Wee/JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974663;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=oNk/+92uXl8dOvwXKZ6wIPcMVooX8k2/Jwa1RsSFgkU=;
	b=3zGmS2Hw3Zkjjh1AfUW+oETELQUCiTnvTZYSf8LMxE8jweWN+axzyRjZlvr290uOF+5a
	 rKP0MEkVX9iLQxu09u85L2LQ6xdS4OvTRYOhbkw+W+Ad/CEntkZQiGrPqTxhunuWrYMBS
	 2eqitWCfEWqYqF7TK+K+g8sBQdTqTl/SwmlE7feNqRMoaBzOkJtaVFr+jssKq4vOve6Uc
	 fUI5MEp1+vB4YH3tYdf4c6XOocjlp1HlDxTUg8FppGkw1dIGEGzRXthNicg+WM64yNNNb
	 iGsqOqgmxHwWy3+pWu39mLWnQmVi4q1n7P+FoeYuew9I6GDm5+0npHvkEYVN+TG1Plw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bZCbjNp6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1BB606A326;
	Fri,  6 Nov 2026 14:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C1BB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=bZCbjNp6
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4CC3A2009D1;
	Fri, 06 Nov 2026 15:17:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793974656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNk/+92uXl8dOvwXKZ6wIPcMVooX8k2/Jwa1RsSFgkU=;
	b=bZCbjNp6/PLMCAoPaVW8xV5IW9O8bKWtOzj0tstm+s04lqRL5WtLhdw8YlfQmw5lbEIwz+
	hwEjciM0piGZvSLh2bocxE1m5FGRxCyU9j1yFVi5qNJp5CfW+PhEqI6Ewr4npJPk1YYT+J
	yspc24vYW+8ESFgfBHLhcV1zoJ9n888tjPNedeovvNwhZc/BP+ewHgGUODOc2+Lzf2bDDQ
	rZMb958v1Vb23wo95SjL54hv/MddDEYcqrd6RubjQuByjjqkTVax3kZMUE/YMoiJ/MXxPH
	T61yziozZSSaYyWruXzOgs4tnFwmFXGbirz8alkXICfnqY+1UR7eFjoiX6UcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793974656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNk/+92uXl8dOvwXKZ6wIPcMVooX8k2/Jwa1RsSFgkU=;
	b=OlhEOGbB/Yi6MX5uUPJiV4AF+UDvSUipu7TcOb9zfi2vcWuuPVjVG89qm1ZQNVNzrWYOKI
	LH0eBW5UrYm5lGY/psEF43RsUkWtRyVTSzD6ak9LV0iuiQKmOa5c2F91vbcMGkcfxHje1l
	ICoaqa43dBdSiX8p5JW2HOuIcIrQGCnKZLmmm+dqInSVihmtZbOBrt1Jolfm2mfYWt+6xm
	Ey46IDIfNRi01f/3H6AWfEC2kE8+WB0reZJ5p7dECOaKbqZaSrRQrKjcGVWzyLeQBtpaFk
	7YYymQ9hTvyykE6vETttz5t3E4XUAIUD7yAxc9jZI3BjUONZ54IUABCkotxZMA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793974656; a=rsa-sha256;
	cv=none;
	b=CD8avzH3zi50pEkkDukW6zcKOm2H2+/grSvEOpFShQRyRuExKfy3ZQm8PjVHMKp1Unyj08
	Y2NEqC+zQrBbxuZB/sd/119ItAtwlwk5ZUgk9GKfCFpjv3hNtmXOy5Apz/s/3+jz5qeVgm
	MFCDGyzN3XtgP9gsj89vj0TJ2wgGHxelM/B60UtfUAizILjgWaYsc9wU8YCK7E1USwSlum
	dRJqC17pZfE7yA6PI7cTsoa39/1qfPACAB10FH8iocejRE35ygizTyaH6PHh7RfvrEW48I
	TltFVWUv5by74o0CyLWhriYbTSoiHxJ+ubT2Phbp6NEGsrCDPbcmeJwEhRRcug==
Message-ID: <9d4fb818685faad04f498ebdec419929db1880c4.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: Remove orphan bt1-ccu.h
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Date: Fri, 06 Nov 2026 15:17:36 +0100
In-Reply-To: <20261105143542.2716484-1-robh@kernel.org>
References: <20261105143542.2716484-1-robh@kernel.org>
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

On Do, 2026-11-05 at 08:35 -0600, Rob Herring (Arm) wrote:
> The Baikal-T1 platform was removed, but the reset/bt1-ccu.h include was
> missed. Remove it now.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied to reset/next, thanks!

[1/1] dt-bindings: reset: Remove orphan bt1-ccu.h
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D45d18e4d608f

regards
Philipp
