Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381430EF89
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726835; cv=none; b=bth5qL9rSub1SzQGKvvXCWtUJD33mG98gVwa5haWkGgRToun+lQCy2FItsL8qVCIbbhcnWM5LAUDs+gGFZ+s1vGUIEnX7s/oryDI8yC/9fBAkhcrXcLzNJu/2mgFIejpRb828CFDh5Ac5omFHIoF+O0sbOkQOwErYg527e5xvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726835; c=relaxed/simple;
	bh=fpOkVMS93ORwbxPA0YJPVsAn0nh5andvhQ3faCP3lIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FG3eBYJ9+qWUCZdVKcBD7MtP35SkcYzzi/IDgf+o2myQIeOMpXOztuA1ylzeLtMLZXghCcf7/7jftUl5nGb0aq1EjZV1DqXY85M9V/XVfesC2GPE/S8nsG0u4Z6/wz3VHPRAlWYKiXcrdZkcZ7brxQ45EOHpW2Q2HlRaSGEw6J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yQZSF1rG; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yQZSF1rG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 980ABC58473;
	Fri, 18 Sep 2026 10:21:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF20060649;
	Fri, 18 Sep 2026 10:20:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7080510328E23;
	Fri, 18 Sep 2026 12:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789726825; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kiw4bCS/DNtngvJd66jWQP93qmw5mpVLvSTlaaIsy8A=;
	b=yQZSF1rG6LcE7VpbJdxCwtQbJiaKwsLUM5zU/maPYUE+wNqqAZWpBAbLTrUGCCpXOQihBf
	JI7jRlWIXq0u3XFFEzaJisos6I+9xzBQrJKfkE6GOFBg0v3nR7rZ/k10a7FQjWRHFp5lPi
	ilFD8yBh1WwgG05rdeCnQG2irjjIX7KV6oFFWyL2EQ+jFFNVSd3Ocmckf9raA9yFNeX47j
	sZ+2qA7qU00SNVRqnD1Wsws5sq2NMuUNWY4omqJnLDy6oh1Or12BIqQ+rQJZ0YeURSKfQ+
	CW7djiReD4lIisphXrX4O7rM4MC+HbmFb6brQqkl4oogOxO5rBhRkIEvfY6x5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 16/25] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxPW-Q/N parts
In-Reply-To: <DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org> (Michael Walle's message
	of "Fri, 18 Sep 2026 11:11:10 +0200")
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
	<20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-16-c1b20c39dd1f@bootlin.com>
	<DLIBQKG04DIF.1FKAYOEZH6ZU0@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 18 Sep 2026 12:20:20 +0200
Message-ID: <8733v6hndn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3


>> +static bool winbond_pw_with_ecc_match(const struct spi_nor *nor)
>> +{
>> +	const struct spi_nor_id *id =3D nor->info->id;
>> +
>> +	if (!winbond_pw_match(nor))
>> +		return false;
>> +
>> +	/* W25Q33PW chips (id[2] =3D=3D 0x16) do not have built-in ECC support=
 */
>
> The commit message mentions ECC is available for >=3D 32Mbit. Doesn't
> align with this comment. Also about the 8MBit and 16Mbit ones?

You're right, there are 8 and 16Mb chips which I haven't in hands and
therefore forgot about. The return line below is correct.

> "W25QxxPW chips smaller than 32MBit doesn't provide built-in ECC
> support"?

32Mb chips do not have ECC capability either, so maybe:

/* W25QxxPW densities <=3D 32 Mbit (id[2] <=3D 0x16) do not have built-in E=
CC support */

> If you like I could rewrite it as I'll apply it. The rest of this
> series looks good.

Yes, thank you!

>
>> +	return id->len =3D=3D 3 && id->bytes[2] >=3D 0x17;
>
> Then this makes more sense.
>
> -michael

Thanks,
Miqu=C3=A8l
