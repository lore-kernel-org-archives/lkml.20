Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E82C38A702
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119257; cv=none; b=pIpGHQ3IuCmVUR7iBrezMkIqnl7/lToOmLlC+kS5C+njYnOcXkN/aqVLGZKYcrGbtBJmyq39EIXcaYeb/HATIqP2w58gR91A0rZJteaYCDn0zRXUMgNbVxeocYWp9yYwItqIPQl5vn1WcamiWg5AmErV+rpfkIzwfExSZcEK1KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119257; c=relaxed/simple;
	bh=KxM79EBkSegaZdBPpWIVvzHo0a+8i433Q0IdgP/l97Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UcOwmB7DjcNri4pKOsrITQzQHakYbChNSNWVpTYWrVWlrNWytV27dIMCY4n/OLO/uifCn1dvSjlluGR4OCg/mpD7JcJq7FTHX9SdJ+3nlvDKJPtbakgsa01Vn/5HfUKHy6PoW7nNd/kQfNuj0fzjXVAlBH7qQsf3nyBkdV4jUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1YYLQtdq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1YYLQtdq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 67A701A01B0;
	Fri, 11 Sep 2026 09:34:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2BA31601DE;
	Fri, 11 Sep 2026 09:34:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98DDF11C7AF9B;
	Fri, 11 Sep 2026 11:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789119252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+MSaCxEM6gtqRPIrYStu8q24HQw4U2YfE0GfMr+ewmI=;
	b=1YYLQtdq0okmGVYwORjL52h0am5CKoc+uAFc5VDCrPz2TaU62SD/cfYxz3GeMN6HyLdVqt
	z42ZL1QWrKjgdp+DUPyeeX8y/sIjCZbQ19Bkpx/kH/4WjxqHYaAIoqR88XWgo+IGSH/Eqw
	vZKBPDfNcvQTvWNpk2njunedtYVK3Oq7TLem33yUENGTl6Iujixdj5E/ZeWXP6wgLUOFrc
	hYgAuVX/9/ICYyBZ8xszZ/jGTT6ra/Kbr1PRlTtzKcJS02i5j+TCi6m5EqVUURbS74mARP
	lRoMVjD/CitYQHhgerDkc46VS2MZBEyu6N4aGgLRVeUNJdQrBw5OKveMtBkPmw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  "Steam Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
In-Reply-To: <87o6e4qh5g.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 11
	Sep 2026 11:19:39 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:34:09 +0200
Message-ID: <87ik4cqgha.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 11/09/2026 at 11:19:39 +02, Miquel Raynal <miquel.raynal@bootlin.com> wr=
ote:

>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>> +	if (qe_mask[0])
>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>> +	else
>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>
>> Shouldn't that be the other way around?
>>
>> +	if (qe_mask[1])
>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>> +	else
>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>
>> I know qe_mask won't be spread across two SRs. Just to be
>> correct and make it easier to grok.
>
> Why is the second version easier to parse? First version is maybe more
> future proof since we are treating a specific case. Because either it is
> a specific chip (Mxic) or we end up in the more common case. There is
> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
> that in the future we will mostly see new chips only using a qe_mask[1]
> mask. So having this in the else doesn't sound so strange to me? I also
> don't think we will ever see masks spanning the two registers.

The problem still persists because there is the check which also fails
reading SR2.

Michael, we moved to swp.c that handling, introducing a "careful"
revision, was this actually relevant? Shouldn't we have the handling of
the lack of SR2 read back into the main core like before?

Possible steps forward:
1- Add extra logic in the "and_check" helper, kind of duplicating what
   is in the swp.c file (not my favourite)
2- Move the "careful" handling (which does not return errors when a
   register read is absent) back from swp.c into core.c.

What do you prefer?

Thanks,
Miqu=C3=A8l
