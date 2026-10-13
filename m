Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4151A14C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908574; cv=none; b=nHUE1HeEqAbw6ZGdLDRwfsjlwUY/oLqVy9hVFAA/Jn56ST9WLoMOdOJnNAEB6As36rQCQXdJ+C3d5vPaHN3ky8PZdJl9KFMRhe1jexCS/YCGLMBAHmJ8mJf0yTsWS+VaqDZHizTtKaZGhMpLM+7owG0j9n/FIXP5fV7JsimNhns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908574; c=relaxed/simple;
	bh=7dhWcIl1RDReM3NLDYGeD4R5EIYC2gNxPADhLVQ2FXg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G/qsVgog3Q+26fXhK/QNy7YkeweC6H41+JNM79g5QxyQoTxTeYRyQPJWKwvle7Zr/lmAbOK9vbDrlo8rEuk3ECip1BJFMpM105Of9uxdlXowH6ig2VrPd1S/usPtQrQfyoTN9tORoP4bxXb19nHMyAIfu1RJgFNTxWcKOXVrx3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fXtR/tLX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fXtR/tLX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DBF14E41210;
	Tue, 13 Oct 2026 16:22:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D589E60362;
	Tue, 13 Oct 2026 16:22:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CA4D11D717F6;
	Tue, 13 Oct 2026 18:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791908565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wZAJ5jFiSG5gx8vSPdPgyJ2D5rMYe8c+FASpWn5HpVE=;
	b=fXtR/tLXz5pFR0hdkSjPYaqmrllPKM5BowwNupxzr86xRFB/9zPtQ3o2AsM+b36Nrt2urf
	XZiV7DIn72jdDfDKuHN5LLXZY5vu/1RD4GO7d4eaUP9DQp64TSGFMshhgkI6xXVL1AMX1Y
	OwOFAuKhmcayfgwyFnn1clgDQO3vAUrfELmDSp28pWnLBhuRrFwBUuzW6DjafUjO20tKIg
	RzkmMes4MNK6ZIeKXi1Y9zDa0Hs1uLaF5yS5qvlzqRB57xenJ5788mdEVH9immUVnsdz9b
	/FJGnkBeYel8Y3FRdOQ8N4r+pGAa2bbO3AEkTlfCUHD0BtTFo4Nsobfop5VY3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>,  "Michael Walle"
 <mwalle@kernel.org>,  "Pratyush Yadav" <pratyush@kernel.org>,  "Richard
 Weinberger" <richard@nod.at>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  sashiko-reviews@lists.linux.dev,  "Steam
 Lin" <STLin2@winbond.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 10/17] mtd: spi-nor: winbond: Prepare the
 introduction of W35TxxNW parts
In-Reply-To: <20261004214530.837371F000FF@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sun, 04 Oct 2026 21:45:30
	+0000")
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
	<20261004-winbond-master-spi-nor-w35t-v2-10-592f3300a70f@bootlin.com>
	<20261004214530.837371F000FF@smtp.kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 18:22:40 +0200
Message-ID: <87qzhtvacv.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 04/10/2026 at 21:45:30 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] mtd: spi-nor: winbond: missing Flag Register polling ignores P/E=
 errors
> --
>
> commit eef1bdae97bf8ec6c5ee8f47f2358cc4351e258b
> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>
> mtd: spi-nor: winbond: Prepare the introduction of W35TxxNW parts
>
> This commit prepares for a new octal DTR family by adding callbacks for o=
ctal
> DTR modes and dummy cycles configuration. It also mentions these chips fe=
ature
> SECDEC and lack SR2, but they do have a flag register.
>
>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond=
.c
>> index 51f6bcd3f8e5b..058a2951c184e 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -11,6 +11,13 @@
>>  #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
>>  #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
>>  #define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
>> +#define WINBOND_NOR_OP_WR_VCR	0x81	/* Write VCR registers */
>> +#define   WINBOND_NOR_VCR_IO_MODE_CFG_REG 0x00 /* IO mode configuration=
 address (VCR) */
>> +#define     WINBOND_NOR_VCR_IO_MODE_SSDR 0xFF
>> +#define     WINBOND_NOR_VCR_IO_MODE_ODDR 0xE7
>> +#define   WINBOND_NOR_VCR_DUMMY_CFG_REG 0x01 /* Dummy cycle configurati=
on address (VCR) */
>> +#define WINBOND_NOR_OP_RD_FR	0x70	/* Read Flag registers */
>> +#define WINBOND_NOR_OP_CL_FR	0x50	/* Clear Flag registers */
>
> [Severity: High]
> Are these flag register opcodes omitted from the driver logic?

I'll drop these.

>> +static int winbond_w35txxnw_nor_late_init(struct spi_nor *nor)
>> +{
>> +	nor->params->set_octal_dtr =3D winbond_w35txxnw_nor_set_octal_dtr;
>> +	nor->params->set_dummy =3D winbond_w35txxnw_nor_set_dummy;
>> +	nor->params->opcodes.read_sr2 =3D 0;
>> +	nor->params->opcodes.write_sr1_and_sr2 =3D 0;
>
> [Severity: High]
> Should a custom ready callback be assigned here to poll the Flag Register?
>
> Since no custom callback is assigned, the driver falls back to the default
> spi_nor_sr_ready, which only checks the SR1 WIP bit and does not check th=
e=20
> Flag Register for errors.

The ready callback is not here for that. It shall just return once the
operation is done, regardless of its success.

What I have in mind is to maybe, if I continue the ECC route, to open
the way for new callbacks allowing to check the validity of the data
(SECDEC) after reads, erases and writes, report corrected bitflips when
possible, but also why not make full memory ranges checks and fully use
the Flag Register (or let that to be done by ubihealthd, I don't know
yet).

But for now let's focus on basic support.

Miqu=C3=A8l
