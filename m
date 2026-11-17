Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904611;
	b=WmUjc37c+MDnCNGjYrp3lu1znjSpjkH9HzGZHN2oZSj4L3uKXKy0QaIbBV049h0BlZET
	 /DHjjFdqVszu80meap4QExUwz83n4El1uqwHP1bQsB9LwCK4dr5pXbktLIK2YD9sLuNsu
	 lZ65ZNnW8VQjDUGyBv96GHD4Z20zefjl3SG+CZcyOhmrodQNeLV0LgQgX0RphK9xRpOEq
	 lPiEJnonxd7/zJPA/9ziZmbJHHEIMAAJfhaCR6J0KJJxje8aowl847GnGTwCef7ox3DTT
	 t87sXLj3jdG7Tiy+YtJtwcFmN/PRAY6SSQ0/HvJ7QkRmKy34PQYSRuJynfobKLKUcxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904611;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=+rt8l0v/At6PFtno2muHKdqjj7JcDP6NxMEHwxMuVS8=;
	b=IqVVQ3oBMGZUgqxmv8Pgy8MILeExfdPenH3sHjFkiuEX7hu9xB1eu65DEqJie79WUHGd
	 rSP9sPGuPCSCY529DrVQORuH2Xm6l1rYFvNDYu6QcmMEyh0x0os5H2zUfpBpkRdfNcZie
	 ov+OoQ4XbOQnQDj6+jyvOExCkrtfVLqPXmpenZiwpxoRWy6bq3b8hUGL9i//DpCr4kJM1
	 fkscy1OsV7x6KOQHCVqfS74kHxRH6OweHLMIb/2Ml4rLQTl+huReoAJicfv7PVb3BXX5i
	 1fVMG2FufF0fAN/1b4BNlI8bcvbgjmRw2jb8AzeYCTcYDu+e5kvEU+2cY9U1vnLVwsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AsU506er;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76A7606A893
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76A7606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=AsU506er
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3757FC4EDBC;
	Tue, 17 Nov 2026 08:36:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C4E1B5FC81;
	Tue, 17 Nov 2026 08:36:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 184B511BC0882;
	Tue, 17 Nov 2026 09:36:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794904605; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+rt8l0v/At6PFtno2muHKdqjj7JcDP6NxMEHwxMuVS8=;
	b=AsU506erBJz6PaUNjlCbNZ6is140A1yJYcYh+Ej33Jgz5Y0NRubqdeDngpxA3sGmNqnLTn
	l/JmLBaoOkwMe5Fdoac8UOXtjovT0bLbdsNSwlIqJlhuhba0TgwR564du7cMGobW8Bv8LR
	IH8kE/Rw/1A0QvZDLHiCdP9VB96GbaQTVu24cQppJ9hPn4xiBio/fwVr0EUDSoB6DZ2KtU
	BQFqZUrM5Au2V3of0egoKYgZILCFP1KJh53MVuTWwqYuUOHKsSqRcLGPUbloWZjtwkClq9
	7y3xyQXUH3AKcLZymUPby8zjt2Rv3ljv2WFgj5n1jBBwuYglgtiTvOlntApu3Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vitaliy Sochnev <sochnev.v.74@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
In-Reply-To: <20261116192714.320454-1-sochnev.v.74@gmail.com> (Vitaliy
	Sochnev's message of "Mon, 16 Nov 2026 21:27:14 +0200")
References: <20261030203342.91172-1-sochnev.v.74@gmail.com>
	<87eccksvwn.fsf@bootlin.com>
	<20261116192714.320454-1-sochnev.v.74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 17 Nov 2026 09:36:42 +0100
Message-ID: <87tslfonvp.fsf@bootlin.com>
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

Hi Vitaly,

On 16/11/2026 at 21:27:14 +02, Vitaliy Sochnev <sochnev.v.74@gmail.com> wro=
te:

> Hi Miqu=C3=A8l,
>
> I instrumented the SkyHigh SPI-NAND path on a Nokia XG-040G-MD with
> ktime_get_ns() and bounded kernel log messages, without tracing. With
> INFO messages suppressed on the serial console, 512 page-load waits, 510
> program waits and 8 erase waits returned READY on both the polled result
> and the subsequent status read. The pairs were 0x00/0x00, except for
> nine 0x10/0x10 read pairs (1=E2=80=932 corrected bit-flips according to t=
he
> SkyHigh driver; STATUS_BUSY clear). I did not capture a READY-to-BUSY
> transition in these attempts.
>
> For 128 read waits, I also recorded the individual GET_FEATURE
> transactions: each had BUSY (0x01 or 0x11), then READY (0x00 or 0x10),
> followed by a READY confirmation. The poll transactions took 10.80=E2=80=
=9317.08
> us. The interval from completion of the READY poll to the start of
> confirmation was 6.84=E2=80=9311.52 us (median 7.22 us); confirmation took
> 11.12=E2=80=9315.24 us. One sequence of ktime_get_ns() start/end timestam=
ps in
> ns was BUSY 0x01 at 38810096120/38810107840, READY 0x00 at
> 38810158640/38810170520, and confirmation 0x00 at
> 38810178320/38810189840. Logging in the poll path adds latency, so these
> intervals do not represent uninstrumented timings or exclude a shorter
> transient.
>
> For SPINAND_RESET_INITIAL_DELAY_US, I measured three boots each at 5, 9
> and 20 us. The reset wait returned READY 19.68=E2=80=9319.80, 23.56=E2=80=
=9324.12 and
> 105.76=E2=80=93358.68 us after the reset command, respectively; an additi=
onal
> status read returned 0x00 each time. At boot, reset runs before the
> chip's quirk flag is assigned. spi_mem_poll_status() uses udelay() below
> 10 us and usleep_range() at 10 us and above, accounting for the larger
> and more variable 20 us result. Increasing the RESET delay changes this
> wait, but does not add a second status sample to the page-read, program
> or erase waits. Whether it addresses the reported events remains
> unverified.

Thanks a lot for these numbers. Based on those results, and based on the
fact that you never experienced a RDY -> BUSY -> RDY situation as
claimed in the original commit log, how do you explain the proposed
diff? I also did not fully understand if all the commands could
potentially report faulty statuses or only one?

Do you have several dies on this chips? Could it be a problem with the
status bit synchronization?

Miqu=C3=A8l
