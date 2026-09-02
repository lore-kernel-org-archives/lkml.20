Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10AA42E43A;
	Wed,  2 Sep 2026 10:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343711; cv=none; b=ptKUbUr0kK2eENR826GgPUjZTh9Kn3dyT66lDX+v+tFnB6CvgK4jHHQ8+tkpe6tpA1w8RlOliKxhEj+39FXcz/w4riVblGeoPN3qlyUwrPYILKYNkJGotk3vzw9BkT4c53ZI1DO/PxD2O4iGug5Xb44bAHSHh2cWDqV8YBJYSZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343711; c=relaxed/simple;
	bh=Xe25IyFNV2QWahR6exSDlyZpDyE6vg2OkdVeXlL67QQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tAuvIfYBzZ/IfohgoG8FbBe33O6xq6pF1UM9d2gvv3J/QTE7dqwoL0hyJVD4J5U7mTQSEOhom4zs6CD0+XzsN81G5Z6yUnGBURUHFpEIoduYD375jErp1hGLffMVNlE5nAgosMuYrYjDMbEzXwOG+yxs/7SRczomQHtBqQIVFrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WqLK9HD/; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WqLK9HD/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 91AF81A195D;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 632E46053C;
	Wed,  2 Sep 2026 10:08:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F24D811C792F3;
	Wed,  2 Sep 2026 12:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788343701; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xVRdbR32fbMwCjy/t/IfCUB0e7pTnQGXBNkJ9mb3Mzk=;
	b=WqLK9HD/tgyVgNJO/gLA6/XJnsi1JsewfVdkRfA1VY8ScLST05n2zKL1CqkfWSdbztexbH
	uLSzalGh7SrZvP+G/PPqBGGeD30kE8PRc2/v6mVZC4XkuflwLNhIcoVuCvlq0AiKIxsPjY
	dmYCds75vhQRtTsk6dQaT0o7ek8UMXpi5JRow6FT3QswbJbMQ8mwUHGBFnrlzASuIIa1Y2
	DQLHWWIbHB3TsNSOEAkUwturdmZQ26/2UTvkOUNQ/YpYPLIDF5XFkjm/L1m3aUq4H2Gj9V
	PnWSWGYjBz6LuM5fO7xgrw9rmEq4QxG5wUBDZaJAFoxgYwucA8M/GIAdtimMYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Nicolas Ferre"
 <nicolas.ferre@microchip.com>,  "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  "Jonathan Corbet" <corbet@lwn.net>,  "Shuah
 Khan" <skhan@linuxfoundation.org>,  "Steam Lin" <STLin2@winbond.com>,
  "Hsin-Yi Wang" <hsinyi@chromium.org>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  <linux-mtd@lists.infradead.org>,
  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 03/23] mtd: spi-nor: Refactor Read Status/Write
 Status support
In-Reply-To: <DKONYM8W4BAW.25PBIPPWCILG1@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 14:25:56 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-3-b637cf120d5c@bootlin.com>
	<DKONYM8W4BAW.25PBIPPWCILG1@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 12:08:14 +0200
Message-ID: <874ig87ypd.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello Michael,

>> There will probably be breakages on older chips. These cannot be
>> guessed because they are not properly listed in manufacturer
>> fixups (yet). If we want a cleanup/simplification, we will have to cope
>> with this risk.
>>
>> I hope the diff stats will motivate people to have a look and report
>> their testing.
>>
>> I will also eagerly monitor Sashiko's output which will probably be
>> very useful to catch niche weird cases where these changes might break.
>
>
> Honestly, I'm still not sold at the sr1 and sr2 split. But since
> spi-nor is know for it's code churn. I could just rework that later
> :)

:'-)

> Still I had some questions in the old thread:
> I don't get why there should be any endianness problems?
> Just the low level read and write would have to figure out how to
> read and write the status registers.

Yes, that's the point, with an array there is no endianness problem,
even low level helpers do not need to know memory ordering. Endianness
is *always* a pain, it is most of the time wrongly understood, I hate
endianness topics :)

[...]

>> +int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
>> +{
>> +	struct spi_nor_flash_parameter *params =3D nor->params;
>> +	int ret;
>> +
>> +	if (params->opcodes.read_sr2) {
>> +		ret =3D spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
>> +		if (ret)
>> +			return ret;
>> +	} else if (spi_nor_get_protocol_width(nor->read_proto) =3D=3D 4 ||
>> +		   spi_nor_get_protocol_width(nor->write_proto) =3D=3D 4) {
>> +		/* Make sure the QE bit is persistently kept */
>> +		*sr2 =3D params->qe_mask[1];
>
> Mh. So before there was at least a check if a quad_enable cb is set.
> Is this now implicit? because qe_mask[1] is zero if there is no
> quad_enable? That should at *least* get some comment.

You are right, this is missing the st_micron case. I will re-add the
check.

> I tried to actually get the original use case, but all I've found
> is Tudors commit 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit
> on lock()/unlock()"). There wasn't much of a discussion on the ML,
> and I couldn't find where Boris was suggesting it.
>
> So before we cannot get rid of it anymore, we should just handle it
> in the one caller which actually uses it: spi_nor_sr_{un,}lock().
> I've checked the current spi_nor_write_sr_and_check() and the only
> actual user is the swp.c. atmel.c is doing global write protection
> on/off, which IIRC only uses SR1.

Yes.

> So let's move that weird handling there. Then chances are, we can
> get rid of it as we know what flashes do locking because that is not
> discoverable at runtime. It's just tedious work to check all the
> datasheets. But as soon as we now put that into a more generic path,
> we can't do anything about it anymore.

I understand the concern, which is right. I just added a
"read_sr2_careful" helper for the swp.c purpose.

>> +	} else {
>> +		*sr2 =3D 0;
>
> I'd expect an -EINVAL or -EIO here.

There is an actual case that is possible where we do not want to use
quad mode on a BFPT_DWORD15_QER_SR2_BIT1_NO_RD chip. I believe we should
keep =3D 0 here.

Thanks,
Miqu=C3=A8l
