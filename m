Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793281799;
	b=5MQFpwRA5cgbCeds4TixfjSmvKiW0oj4LEf/2+dmSF4DzpS2a1JhdgZLH6GVL2e0c7vt
	 UIO85SoOhyNbeiA90gFsgB3XjEZMqH7HmSB9tnClKMeedRwGiC7BL5ZhLd6XsJ5/pqc/v
	 pRq/iR5umn1w4uIJ31wQ21RvH/41a++LHBRzBXnyxHjiuk8GYRnyty+i7PEZY/JMJNDjv
	 PMs1P3ziCK09h0N2kugcdXTVtcKVOVfysm9QX/DdDoMU5TNLY6uFDNwNH4XceSre3u7Hx
	 1sqa5SqzoIibUtRB0IjKEYhMpAsmmF5Mf7cIkegIJl2wpkG/7aQA7dO9RJfUfAxCdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793281799;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:
	 Reply-To:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version:X-MBO-RS-META:
	 X-MBO-RS-ID;
	bh=axwW0A/5PYCIOuQ7ZqJPwr1VhkoJypT5+8pks0+szpM=;
	b=Jt4v4XFEQORuHk8amKNZsJeGX049hI3unu4GlD7RxNHHHBnyaoCGJrnI/OPrJUE2B2Ig
	 Q/8xpTFmXaF+5arzz6BUOWjQI/yyPX09E6/IzFWJh2250SGu3vZ3MEzMaOVM+bpzhahZQ
	 8Mc56gwcljqxgDWhxhm6dJuX10dkTrFJDHw8NtVIZC4t8D95DDizngDj8lYShpf4Qqm82
	 iftBdKurcOZ4/1ZQJEAU+lfB7SFS1vyZJ2mLhX5IxtmrT7stjCnDVJQRvDGQWblx0jd58
	 VLE1iAzczG796FtruDfJXiLE4LwmnXFveq6bhN7b26/RiglzG51yS6Ia5OBZGJLXqSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=gmdlD1wN;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E4D606A323;
	Thu, 29 Oct 2026 13:49:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2E4D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=gmdlD1wN
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jFlwL0qV8zMlfS;
	Thu, 29 Oct 2026 14:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793281794; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=axwW0A/5PYCIOuQ7ZqJPwr1VhkoJypT5+8pks0+szpM=;
	b=gmdlD1wN7AGG6nQfxtq23dGCuMxmNrkZ+NrXKYNfVEL0xlliMv+IdjSR2N1Cm3L0ebA7Ex
	a49o2Ord2frm0n5vrPCmgzzrEY6tcsO7HruzWv8gsdxI/I2DLI5s0RRiI6dNaGMCLZNk3g
	v4BRv4gw0phbhr2SMiHJZbEfB85nvC0imGNuKGAQyU13rVb5Wys8EhLIXm4FMIrKfS9N1D
	l/HB6KFi4v910J0tjwXRRHiPDCkEjMb4AjI7G9gozZ6rdiTzShW82Notr6YNkkMZgIhFl+
	1bbQwKh9uDQLkWCu279NGWJikwm8R1A1ENlTml5UpT4wyPy/ekFyOgMKeyUkNw==
Message-ID: <e30a0a03cb7d393cbd88565bf81e156d2f38b293.camel@mailbox.org>
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Philipp Stanner
 <phasta@kernel.org>,  Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sumit Semwal	 <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Sam Day <me@samcday.com>, Michael Bommarito	
 <michael.bommarito@gmail.com>, Gabriel Prostitis
 <prostitisgabriel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Thu, 29 Oct 2026 14:49:49 +0100
In-Reply-To: <7fd62daa875e4a3772e980127d368704a849caee.camel@crapouillou.net>
References: <20261029125143.1744481-2-phasta@kernel.org>
	 <7fd62daa875e4a3772e980127d368704a849caee.camel@crapouillou.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: fsoima31pgmrfkhcj7aypxgy1bshnaqn
X-MBO-RS-ID: 80be9851aa58a305405

Hi,

On Thu, 2026-10-29 at 14:19 +0100, Paul Cercueil wrote:
> Hi Philipp,
>=20
> For context, this .release() callback was added to avoid the implicit fre=
e of
> the base class, which IIRC was a request I got during the review process =
of this
> change set.

Can't say anything about the request you got, but fences are reference-
counted and the ability to free itself exists since at least
3c3b177a9369 (2014).

From dma_fence's perspective it's certainly the desired canonical
pattern since the release() ops prevents fences from the important
feature of decoupling fence producer and consumer.

>=20
> I'm personally fine with the change, but do we need a "keep this field at=
 the
> top" comment for the base class in the ffs_dma_fence struct? Or what's th=
e
> policy here?

When I got into the kernel I was told that it's common practice to
always have the base class as the first element. That also allows for
obtaining the parent class by a mere pointer-cast instead of
container_of.

But the reality is also that some users are not aware of this rule. I
can document it in a v2 if you like.

Regards,
Philipp
