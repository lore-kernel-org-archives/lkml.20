Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A295377A9B
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935991; cv=none; b=uPIpLv+4ICC0Cqvoe1XtXx0yjmiBrT537ngNBdSK+2X1JQ80q/FDKSmZuBDV7sygVxWli9y2WuTE3800FKOamN7Jwe0Bxrsv0mfn5P8e3ClKdk6BKEGYvmJuLgPqyJEj2h4b6ZQQKeTlP1WOfWm0H7nTo70GD+uXKg97ecvI8OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935991; c=relaxed/simple;
	bh=ti4sY6/LW3vITMS665H6lSzq1nkaftPqepndBNIZ8Oo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=HVQtD0GAbZTnmUJw0+xPzEcFB+NF0ESqtPLfoAt5XsbTpY2bA9P7K9AttnolanbgjqkvJcqVZ11aGaM32JMIlx9LmJxlNZ1/6UiXGZKxIl7j207Ej06ubQ8AVwxMwOeX6cvKDC83PV9wjKvm2fCfYRJTflgQDN/0RZ6S9kUni8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=R2p18bij; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="R2p18bij"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1787935984;
	bh=ti4sY6/LW3vITMS665H6lSzq1nkaftPqepndBNIZ8Oo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=R2p18bijyV54Z28JoMOkQrGz3yIXtI7kVwu9pCn9angTw6b3lakLInbo6j+txPCmK
	 CiVYgKWfbI51LZiA7FfGe9m0CwOoI5IDq0Lk2NEQcZW5y69ueRUl/FHdSiTB2HU12d
	 YDNn65vY7aQZnjZjA5gQRVbJSD3hybLL467EsYO0=
Date: Fri, 28 Aug 2026 18:52:42 +0200
From: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@thingy.jp>
Cc: w@1wt.eu, linux-kernel@vger.kernel.org
Message-ID: <4a62301b-038b-4ccc-861c-badc4fa4f5d1@weissschuh.net>
In-Reply-To: <20260828103205.384589-1-daniel@thingy.jp>
References: <20260828103205.384589-1-daniel@thingy.jp>
Subject: Re: [PATCH 0/2] nolibc: Add sendfile()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <4a62301b-038b-4ccc-861c-badc4fa4f5d1@weissschuh.net>

Aug 28, 2026 12:32:21 Daniel Palmer <daniel@thingy.jp>:

> This is another thing from my backlog[0] and seemed simple enough so
> sending now. Also, this feels right for nolibc as it lets you move lots
> of data around without needing to allocate memory or even transfer it
> into userspace. I've used it to implement cp and dd in my 64KB userspace
> for linux on the sega megadrive.
>
> There is some 32bit weirdness again, I think I caught that and added
> some static asserts to make sure it doesn't silently break.
>
> Maybe the test should actually test the offset?
>
> 0 - fallocate(), static pie, sockets,...
>
> Daniel Palmer (2):
> =C2=A0 tools/nolibc: Add sendfile()
> =C2=A0 selftests/nolibc: Add basic test for sendfile()

Looks good, thanks!
I have applied the=C2=A0 patches with some minor changes
and will push them out after -rc1.

> tools/include/nolibc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> tools/include/nolibc/nolibc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> tools/include/nolibc/sys/sendfile.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 41 ++++++++++++
> tools/testing/selftests/nolibc/nolibc-test.c | 70 ++++++++++++++++++++
> 4 files changed, 113 insertions(+)
> create mode 100644 tools/include/nolibc/sys/sendfile.h
>
> --
> 2.53.0

