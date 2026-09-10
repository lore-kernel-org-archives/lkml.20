Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D76C31355B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789034247; cv=none; b=BvoMNduwqIZufpXaYMljm01tKC3vG20A1ZjKALas9qn8Gc2V1qnAlJsW5st4mWsushn16c3gtNv7XIo+hH8VuAEXHRsTjhqqnhI5+mvgV/lzPK3ku7oYQlxFXeP9nsdRlbQesIAXeRe/nm0UEJBPPsQHO9ZhC6FewA1XS7jmyVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789034247; c=relaxed/simple;
	bh=xI8YmvWvbWNbNFO9Nt0QVTyadiUccqoL4CeHlw1Cq98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WSVBHWIqsrbwtvyPiYEICTwZmBWk7tkBuI/gluDklIYEqVt6wB1/r+wBW+7ZQjH83NFjNAn8KkDHz1kxezx75rPzndThS0INihBxTV0K3xqPdwIzpAY++5EUFYic5AfwhxPULYKOmPJ9z2uTeDBnGOuQoHgLTbYoS29P5wPNK1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kEXJagfu; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kEXJagfu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BCE1F4E415BD;
	Thu, 10 Sep 2026 09:57:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C681602B8;
	Thu, 10 Sep 2026 09:57:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65F8211C78279;
	Thu, 10 Sep 2026 11:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789034242; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/d9m43TxhAffh3ZgQ1jebeO+R7ZKEi4Q/arfkRVVd4A=;
	b=kEXJagfuHj+Ex1oMPbUBWxtgifSU41VUI9E0sXmqowTJRfarf3WpgK1OPAky2CIElKghe3
	E4jF0Qq49rtgGsORPOyzfsAIbMjppGCFifmdE5UTwa99E46oDwnjbZLqp1TU8FJgqzrrkB
	7UFZX/61PJq65f5sO5DOxhOQFFDP6wmKsZNy6F9nC9ZwoAGDufDEqne3LPHbbLGM0U2lVH
	QAfD6QXjB2fRBwQ5Ocxzu/Myk3lPErNOrg8ZEXUTo7dAkd00/uobt6LAARxdv3i+hhZDg9
	F3K+Tur2sJ8cV+RTr9K5uGWX7JTOCr6XqjiFxOKT42tpsKqWMvRWmcJEqPdTvA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,  Steam
 Lin <STLin2@winbond.com>,  Hsin-Yi Wang <hsinyi@chromium.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-doc@vger.kernel.org,  "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v5 03/25] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com> (Jon Hunter's
	message of "Thu, 10 Sep 2026 05:38:01 +0100")
References: <20260904-winbond-v7-1-spi-nor-rv-addition-v5-0-2909a45fe4fa@bootlin.com>
	<20260904-winbond-v7-1-spi-nor-rv-addition-v5-3-2909a45fe4fa@bootlin.com>
	<b78b8e6a-2fab-489f-aa1b-a2ab23051794@nvidia.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 10 Sep 2026 11:57:11 +0200
Message-ID: <87ecf1sa2w.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Jon,

On 10/09/2026 at 05:38:01 +01, Jon Hunter <jonathanh@nvidia.com> wrote:

> Hi Miguel,
>
> On 04/09/2026 19:12, Miquel Raynal wrote:
>
> ...
>
>> This is a really hard to review patch, it is big, full of changes
>> everywhere, but I cannot really split it further. The commit log is
>> really important, it tries to explain the steps I went through when
>> trying to refactor the whole QE/SR handling for which I received
>> feedback from Michael, Tudor and Sashiko.
>> Ideally we could expect test coverage of each case:
>> - BFPT_DWORD15_QER_NONE: Probably not needed
>> - BFPT_DWORD15_QER_SR2_BIT1_BUGGY: Expected from Hsin-Yi (flag is being
>>    renamed _NO_1B_WR)
>> - BFPT_DWORD15_QER_SR2_BIT1_NO_RD: Tested with a chip re-enabling RDCR
>>    in a fixup
>> - BFPT_DWORD15_QER_SR1_BIT6: TBD
>> - BFPT_DWORD15_QER_SR2_BIT7: TBD
>> - BFPT_DWORD15_QER_SR2_BIT1: TBD
>> - BFPT_DWORD15_QER_SR2_BIT1_1B: Done.
>> There will probably be breakages on older chips. These cannot be
>> guessed because they are not properly listed in manufacturer
>> fixups (yet). If we want a cleanup/simplification, we will have to cope
>> with this risk.
>> I hope the diff stats will motivate people to have a look and report
>> their testing.
>> I will also eagerly monitor Sashiko's output which will probably be
>> very useful to catch niche weird cases where these changes might break.
>
>
> Since this landed in -next I am seeing a flash/boot issue on one of our
> Jetson boards. This board, Tegra234 Jetson Orin Nano
> (tegra234-p3768-0000+p3767-0005.dts), uses a QSPI flash device and the
> kernel is used to flash this device. Following this commit, on boot I
> now see ...
>
> spi-nor spi0.0: probe with driver spi-nor failed with error -22

Thanks for catching this early! I'll get back to you with a proposal
very soon.

Miqu=C3=A8l
