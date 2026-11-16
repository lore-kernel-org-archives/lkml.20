Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838656;
	b=4By92nSDhHOtZCva72hKkBvo2KQOBpdxASe9cQ322pvoEEkZOpVvhlma6Vu6kxrW2/5I
	 JALxvzmMLw7m/gqmBxdzMSl5AZZdBiESBnS/qbv1p19D4yHdD6bfA7xisLwTc/0ESeghU
	 hOMK+ULHYSvsUA0CZhCYRZyHS5UekNuddD1cdiJ/qE5YqiUJP965UpoZR2KVlpHbTnzV0
	 AEd5UMs9+/Lux2iay5/tY7Xl22wCkb/ScNFIpLnmOKlk34XV7sRAKcXyMdG/LcYpN5BPY
	 6u2FIMefSa1v+rcV83zZrRLkGxLPV5ya1x1868Q9Q77AR4wzOCeFCefpQnY8x+UKmoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838656;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=mJg1yhmHqjfF3BBk4j+KlWhE4NTAN/WGFBrIdWiGLU4=;
	b=e/+rJOVyd5PSpcB+6ukPrsrMYi7IMn6fLoxKptc7iKtGJYGs6xjAD8y1NTvutBsouGnM
	 k031XCiQ1xP1a7a2kk0epI9iYHknjWfk0Ms9RmsQJby9LL2bayl65it4PIuWPfqO+jqAM
	 9bnGCzCh0C3HnmjS30UOgkWLB8ZHPnT0HUVPAGKPhxsxxbdjKtUKsB9qDetKG5ba9MPB4
	 OSI3qzvK/oMKzuLRb9ayeFjffbYTSOqhE994fjleOXDDkvH4QSXU31cTJHuRrMSeD0yEG
	 I/dz1rmK0SMNaHyIfJwDmYjuMnewHqQFIqYJGPvqyA9IkO9uGRXWNnkRyYvVHpj1tGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yv5Q1jWL;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78634606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78634606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yv5Q1jWL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07B274E41600;
	Mon, 16 Nov 2026 14:17:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CABEB6023F;
	Mon, 16 Nov 2026 14:17:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B479611BC051A;
	Mon, 16 Nov 2026 15:17:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794838653; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mJg1yhmHqjfF3BBk4j+KlWhE4NTAN/WGFBrIdWiGLU4=;
	b=Yv5Q1jWLNspxRQgqbun6e3gShYytB5OapAelfSg3UgSL5W7YpjGOeoPd5zXCx0EIO/M7yB
	DjaItp0ctTMZitka+dES0bImAFtGqVMSevwcHAQRLCYTT6xdoPqfSPzk8HvP9eVyzvQUHB
	3RCIzWhe2OFIxSFeklwAvTlKafVvU0wkfGKTI9hQjnkeZzH+AMi7q/q8lWI0FE3ESsz8H5
	jEwnFyfIEE9rxKxopHx4uiCAjL/sCPDrhLtJtv5EcQwRMU06p5XMf1c1tKvSDWeqX7beLA
	fRT/+9sVD3e+UTOWn75ObO+l4KvDwVQ0kA8i5z881oXqIy1/WcVJu+C1J5INpw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
In-Reply-To: <20261030203342.91172-1-sochnev.v.74@gmail.com> (Vitaliy
	Sochnev's message of "Fri, 30 Oct 2026 22:33:42 +0200")
References: <20261030203342.91172-1-sochnev.v.74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 15:17:28 +0100
Message-ID: <87eccksvwn.fsf@bootlin.com>
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

Hi Vitaliy,

Thanks for the patch.

On 30/10/2026 at 22:33:42 +02, Vitaliy Sochnev <sochnev.v.74@gmail.com> wro=
te:

> On a Nokia XG-040G-MD with a SkyHigh 256 MiB SPI-NAND, UBI reports
> fixable bit-flips during rootfs mount without this workaround:
>
>   ubi0: fixable bit-flip detected at PEB 1979
>   ubi0: schedule PEB 1979 for scrubbing
>   ubi0: scrubbed PEB 1979 (LEB 5:53), data moved to PEB 645
>
> Other reboots also report fixable bit-flips. A tester reports that after
> applying the workaround, sysupgrade, multiple reboots and an active
> workload produced no such warnings. Long-term operation is unverified.
>
> spinand_wait() accepts a single non-busy status sample. On these chips,
> the ready bit can briefly clear before the device is actually ready,
> allowing a premature cache read or a new program/erase command. The
> fallback status read for controllers with poll_status offload does not
> provide a second ready confirmation in the usual case.
>
> Mark the affected SkyHigh parts with a quirk and require a second ready
> status sample after spinand_wait() for those parts. If the chip becomes
> busy again, repeat the wait while the outer timeout has not elapsed.
> Each inner wait has its own timeout, so the quirk can wait up to roughly
> twice as long. Leave other SPI-NAND parts unchanged.

Can you give actual numbers? Can you log (without tracing) on multiple
attempts the state the device is reporting, as well as the read
timestamps? Could increasing RESET_INITIAL_DELAY_US slightly do the
trick?

Thanks,
Miqu=C3=A8l
