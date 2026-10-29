Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289515;
	b=N4QbDiGeVzbKuvgwykDJSOBJ+y/XIZvVjSePuvEVmqhDsNR/GcRy9QjxDL/L8DfM7AXw
	 2mU4E1JDd8FmjReizHar9oBnXNykSoLMhTHFxsBpMbDuGqHEO6tsTDUVrAIOu8lELpk4O
	 zDNBsk1ZowBdsoWfdtEyFaWymlN1u73UK47al2CU0u8dP7JvXmhnWhBmg4S+W8kSfRO1P
	 GHdihgxIOjN6XIq9sVsIk1S5J77ISRYppwmTZAaoSMjWQMRwdY1McEmlu0ZLZACgrb0Il
	 sWK3kh4L1SREY+xnPitqpi5j/J7ITi3bRxjjwjqCZU7ktf8W9wxH0RjdxwJRYX3Azkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289515;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=V1AcEN3/F7WCrixuUIKybsNv5HdIIcQfV8dHDzHK5Dc=;
	b=VIdoBK823UCl07LLDpg2rSV0RJW7j0k10tHsBWaIm5jPV6Serk+VufM9VabjotZ9OVgH
	 vOlbazdBk6wEy4wjysrqO6y63QOrwtFa0O0nkZ9Om1dugc6nvkDOWtv60iQBGYZxznX1a
	 s0Iu0JGGmS8n+pzgo/6ZpcY/YQ7cp3Ll9/Ifx1srrWMzldfZEl0CR0lPVOA8c11uV4CJr
	 H7UsT7gqQy6jcb99EuMkhVODv0DjX18Uhf+KDwHwlFSAZSONRsBXmW8HaYV6Y//YYN2YM
	 hiaNEoy3AU0CkPeQIT7USZbVmXIRa914NBAEUvbu3DrlQmwFWWV5/M5PVx1y88bRROw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EtZNgrCN;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA9A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BA9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EtZNgrCN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BA740C49F4A;
	Thu, 29 Oct 2026 15:59:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 450C86076B;
	Thu, 29 Oct 2026 15:58:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09C2D1032910A;
	Thu, 29 Oct 2026 16:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793289504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1AcEN3/F7WCrixuUIKybsNv5HdIIcQfV8dHDzHK5Dc=;
	b=EtZNgrCNIU0luOGdzO+em8UiYQvCgbSDaFgUTCvPjSTPJwbkszVmGSg4IYnP0diUE8N229
	ans4HJ+68rYQLYLGW2trcnbOGGXuKYc2Qr9sGrZ8mU6e5pDy1PCBQFwthZWb+GAfEZqu3C
	aNpu0sxh3cdyrwX6EBGPIL03wo1db9eOcgAeiiqRdhJB5MaU7gaHrXnH85IVaeXwdhB5Cf
	cZmu1NSwv7bPc/lCcLRQsw9raSagx6XBVDyZnjdHnglOqlWPd+xTzaMXqA76Enm887oZZf
	+xxf7Roub1zJ0d2W9wGQ/IiXaVaVd2EIqUWQGhsJk/Pab5d5cqWQIBV6PwBMWA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Tudor Ambarus <tudor.ambarus@linaro.org>,  Martin
 Kurbanov <mmkurbanov@salutedevices.com>,  Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH RESEND v5 3/3] mtd: spinand: repeat reading in regular
 mode if continuous reading fails
In-Reply-To: <20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu> (Mikhail
	Kshevetskiy's message of "Thu, 18 Sep 2025 00:54:01 +0300")
References: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
	<20250917215401.19132-4-mikhail.kshevetskiy@iopsys.eu>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 29 Oct 2026 16:58:18 +0100
Message-ID: <87mrrwebxh.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Mikhail,

On 18/09/2025 at 00:54:01 +03, Mikhail Kshevetskiy <mikhail.kshevetskiy@iop=
sys.eu> wrote:

> Continuous reading may result in multiple flash pages reading in one
> operation. Unfortunately, not all spinand controllers support such
> large reading. They will read less data. Unfortunately, the operation
> can't be continued.
>
> In this case:
>  * disable continuous reading on this (not good enough) spi controller
>  * repeat reading in regular mode.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

This patch unfortunately breaks continuous reads on my boards without
dirmap support. The fact that they do not have dirmap support does not
mean they are not capable of keeping CS asserted, these are two
orthogonal hardware capabilities and it seems that we cannot easily
discover it at run time.

I recently had a similar issue with a "powerful" controller
(cadence-qspi) with dirmap support. The fact that controllers will or
will not spuriously assert their chip select is not discoverable
either. As a result I created a spi-mem capability to flag this
impossibility, which disables continuous reads. I will send a patch to
revert this commit (keeping the previous ones) and another one to flag
the Airoha controller as not having full control over its CS.

Thanks,
Miqu=C3=A8l
