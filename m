Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283538;
	b=tHaIYKCho5dOlJsgfltzCkexPVWA9dkDOXFdrMsseGYgrLRTZjxOMmo7cb1B7QCQfYoF
	 MnG7NX6Xpfe+hRlFFP9QI/AUkV1qme+7VAMfKOcsJcj11C0OR/r5P/6g/wCz58YCzGpTf
	 Hr54WkcCjtknkxYbKVse3iH+f7QtV315UGo8JJpQnzQedjNtG0ti7iRjrHacHpmKnCDfj
	 AU3f191cxtPPZdpv4Vf3Wacydt/RT0YwYBj5TTU4U5CAvihw3UyDrBW4auWiuuGxPDFOo
	 f4RcGU0sO0VQXLKa29qD5Enblrh0XoaRpG1IaXRGyGv7nKoUAt8XwWwG8byQ8XRmIIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283538;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=LA0Z7C4i6n4Zp39cfwPi7Pw307xQvQwzfqOo6mJbd6w=;
	b=vL8w0ou2wohjGpiEPl0p7nAYFSJBdnngAHXBXeKRj0jH5+J/S/QHMQpKhmAgLY+xgutW
	 adkZQuqmYgTSGwTEvKpsAmeGUI3q8kpWzRJ3XtTk6Wo07kgJuzL7QQOThQdjD+MFbkctA
	 aizpDs23eOZTJ2dsD2YinQRQd6dk7qUWS8Ox4lhyW8bAUacGATZicgVbmpukAgTHd9rPa
	 iKciW4JwywkJ5iKPV78ymqAxE8hKEgPKoq4XCXv71qVv/ghbGi3mtjfdeNnMSivbw1zum
	 QN9mzYm/q6c2AzPtIOQJrwkfV/3TGG8CBxo9g65BGLZ2AdPb48otWNAqSJZn8vL7VFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289E606C46E;
	Thu, 29 Oct 2026 14:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E289E606C46E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <304c061aa5fa7f271acfa74c640ab1f0a40e393c.camel@crapouillou.net>
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
From: Paul Cercueil <paul@crapouillou.net>
To: phasta@kernel.org, Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=	 <christian.koenig@amd.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Nuno =?ISO-8859-1?Q?S=E1?=	
 <nuno.sa@analog.com>, Sam Day <me@samcday.com>, Michael Bommarito	
 <michael.bommarito@gmail.com>, Gabriel Prostitis
 <prostitisgabriel@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org
Date: Thu, 29 Oct 2026 15:18:51 +0100
In-Reply-To: <e30a0a03cb7d393cbd88565bf81e156d2f38b293.camel@mailbox.org>
References: <20261029125143.1744481-2-phasta@kernel.org>
		 <7fd62daa875e4a3772e980127d368704a849caee.camel@crapouillou.net>
	 <e30a0a03cb7d393cbd88565bf81e156d2f38b293.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Le jeudi 29 octobre 2026 =C3=A0 14:49 +0100, Philipp Stanner a =C3=A9crit=
=C2=A0:
> Hi,
>=20
> On Thu, 2026-10-29 at 14:19 +0100, Paul Cercueil wrote:
> > Hi Philipp,
> >=20
> > For context, this .release() callback was added to avoid the implicit f=
ree
> > of
> > the base class, which IIRC was a request I got during the review proces=
s of
> > this
> > change set.
>=20
> Can't say anything about the request you got, but fences are reference-
> counted and the ability to free itself exists since at least
> 3c3b177a9369 (2014).

Yes, it already existed when I wrote the code and I was requested to make i=
t
explicit. Not trying to make a point here, just stating the reasons why it =
was
written that way.

> From dma_fence's perspective it's certainly the desired canonical
> pattern since the release() ops prevents fences from the important
> feature of decoupling fence producer and consumer.

ACK.

> > I'm personally fine with the change, but do we need a "keep this field =
at
> > the
> > top" comment for the base class in the ffs_dma_fence struct? Or what's =
the
> > policy here?
>=20
> When I got into the kernel I was told that it's common practice to
> always have the base class as the first element. That also allows for
> obtaining the parent class by a mere pointer-cast instead of
> container_of.
>=20
> But the reality is also that some users are not aware of this rule. I
> can document it in a v2 if you like.

Let's wait on feedback from more people. I don't have a strong opinion eith=
er
way.

Cheers,
-Paul
