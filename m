Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662887;
	b=l2SgZSVemdb1zCcGMn0dbIwa7BbT3tgTt49Bz9xs/56F1OBsseC+rIZQibEUszzZpt14
	 /dkzXEhdFXJE1kSPYUmG5u9MrWiW+bflL+3jvb92OTfcjiocoUMAaF8omfRXWQkAdUh+Q
	 0B0d+e8Hc1s10+onc7j3Icews0fTGxcgFtovdVtP7/zj5aZYwU+QDy9KK4cuf25thzIVi
	 jiCrWeg8MW4Yqdm2NkLjOYavJ24TVQhy1NNkGAHmXZ/E3u6cITAV4nNYwKyRxB5Ag7m84
	 7ZqHPT/aferCZmRfCBRPNI8AnSOO5g+p114RaTsBKxAzOrWwozzyOx3ucz+VOphRPzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662887;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=nHg2CtDYnhzmh3YtcQ7O4biqYpDTU6yA/OkG9YS9llE=;
	b=mV3yr6oi4Eidk9Za2fbPAM+9ifZxxOkbvP1wjZcWHprhIbXMpR4B8YN8th4RyY4NaKQL
	 cD0z7fE9fzp+/fpSjUhATANaPuRab/W/SVNboqh3rgedFROV9tICBfEJEPHcEpqG3f6Uq
	 aMVjQx9l3a9Aj+iMvOQk9NL4sjtYZtOnly9ezBAfKqIrhhLjiH6eeFfSjFN+0xFYPibVF
	 ShYrshYRlwNHO2g0Mu7+Fb0sbU/VTBdbn7eM7KVW8orbpXVTQON08xlH02JzHRihb+Vb+
	 9dy0SAs0X76Mp8z9q9n3irrwzmTLxkEuKUCu1rBgX2/yLWgufUhKGijX7iaTy7txOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xEw5QBae;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF3B606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:54:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EF3B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xEw5QBae
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 19F0B4E412AE;
	Thu, 22 Oct 2026 09:54:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D855760360;
	Thu, 22 Oct 2026 09:54:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A79B010328E3D;
	Thu, 22 Oct 2026 11:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792662884; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nHg2CtDYnhzmh3YtcQ7O4biqYpDTU6yA/OkG9YS9llE=;
	b=xEw5QBaec+7jpKtEp6uNZOPd61u96/vZs5eY50LES0ZzRIv3effCrRi7jpQ60y/9uDMI0T
	2O1m8m/x+X8ByJk9jlXciHOgEc9lZEnrNi8cvU89rFvadbT+uTIJnKJqpj8bsQjvljmeDy
	g4z0NwdPafdm2BsxFiy/LxwoHsZcFSapyrh98iOAYAl5wkFmY9qmpGRVLKGYXi2Jpf6Esf
	TvH3DMnF5vnmb9sLRu4hHBTiG7zj44Dnu02etx4zKd881fLXGvhMsRgfZAcO9NotF5dNPn
	RNcZIVhPrwk5FzQB5dUExC0PmrnsRWNIWyiTKOp0NKGvjXyfdcbO6HUUmd0AEg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: stefan@datenfreihafen.org,  alex.aring@gmail.com,
  linux-wpan@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: ieee802154: mcr20a/mrf24j40/at86rf230: unbind while the SPI
 completion chain is in flight operates on freed driver data
 (use-after-free, three same-shaped drivers)
In-Reply-To: <4d2e91a4.14801.1a162d3f5d6.Coremail.xuhx@hust.edu.cn>
 (=?utf-8?B?IuW+kOaZl+e/lA==?=
	"'s message of "Thu, 22 Oct 2026 16:57:00 +0800 (GMT+08:00)")
References: <4d2e91a4.14801.1a162d3f5d6.Coremail.xuhx@hust.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 22 Oct 2026 11:54:40 +0200
Message-ID: <87se1yqcv3.fsf@bootlin.com>
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

Hi,

On 22/10/2026 at 16:57:00 +08, =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.c=
n> wrote:

> Unbinding (or rmmod-ing, or hot-unplugging) any of the three in-tree
> ieee802154 SPI transceiver drivers while their IRQ-driven completion
> chain is in flight leaves the chain running on freed memory: the async
> SPI messages and their completion context are owned by the controller
> queue, but the callbacks only hold bare pointers to the driver private
> data and regmap, so after remove() frees the private data (and devres
> later frees the regmap), the still-queued chain steps read and write
> freed memory and even derive new spi_async() submissions from the freed
> spi_device -- a use-after-free family confirmed with KASAN on mainline
> 7.3 (42 reports in one unbind, three-stack closure probe/unbind/kworker;
> clean unbind when the chain happens to be idle).

This is indeed possible, even though not a huge deal since SPI devices
are by nature not hot-pluggable and the two other operations require
to be root.

You can send patches if you want to see these fixed.

Thanks,
Miqu=C3=A8l
