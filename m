Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AD53E2ADB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789123428; cv=none; b=fxWpDvy/3xWLtaa02SU6aWqTLbRtCqyvHWw4m2myTnhNP48B4emdQ5DnlNvLSp4jyFFdQcUMJGAuGtIG66LeJEDV+GO52sh9BlIRNTM2Hlql5w6GDMu3j6z6uOVhb4zTYQuh+C7LzB5h1qm7Wh7p9tgvUCOzMYE/27Zn/c9yJEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789123428; c=relaxed/simple;
	bh=0pdRR57Gm5FGB3dMJai6xetKqLutt84Wx52Zjq0nnG0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J7iwj8Vyc8n6F6BvOe6YTbtdHqk2b+DDC5UNbd/+9UurEqszKoVRL7DsrvELxGUdn3JpoGm/f/l1dE8OgJaHC0F5s3mviD5HokWD4+76yNMU1n1nMJ99wJvaj3QVKqmIfQK8JVYvaTcq4wCIAXVdb+S0leI7pVeTVZVn1iT7sQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xo/1BQbI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xo/1BQbI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 60ED11A01B2
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:43:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2963D601DE;
	Fri, 11 Sep 2026 10:43:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCFD511C7AF8E;
	Fri, 11 Sep 2026 12:43:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789123424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=boUfY/RM5+3Ru1aDcdiU0te7jtZsjz+i4xhWWiIY8F8=;
	b=xo/1BQbIyCrbhI5Juu969ZJ9jEcCF95ynlFlyD/RmC7bVFVnAMAmbI9S1FW1fWclidOwkB
	r+1Fk/lxSpCcuvOT5zqg/Lz1Y3rMML5lsOz8kKvVMiMHtvz5WWO3sHtYxBdy/5eJXPv7hM
	Mhabcu/ktw7t2gN9Fel7K0hiOTpWu1d9O0JNjwVqTwvqO41BZcq/AXtqM95ZiFuSa+HNFw
	Ar2BYxWGe6X8AF7Rq+iXvvsUBVi8tvw+rHJdkA56Wd6d1Hy+zYkMk6G+jE7xLfr8Wbgo8a
	bXrS6dK5RzGRJeVkRr3xcKq0HHXWB0ay1Kszplsk6OFilAPGLWAWuFHfvR7rlw==
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
In-Reply-To: <DLCEE908FEIF.380PG73T1SQXV@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 12:00:08 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> <87o6e4qh5g.fsf@bootlin.com>
	<87ik4cqgha.fsf@bootlin.com> <DLCEE908FEIF.380PG73T1SQXV@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 12:43:42 +0200
Message-ID: <87cxukqd9d.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 11/09/2026 at 12:00:08 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Fri Sep 11, 2026 at 11:34 AM CEST, Miquel Raynal wrote:
>> On 11/09/2026 at 11:19:39 +02, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
>>
>>>>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>>> +	if (qe_mask[0])
>>>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>>> +	else
>>>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>>
>>>> Shouldn't that be the other way around?
>>>>
>>>> +	if (qe_mask[1])
>>>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>>> +	else
>>>> +		ret =3D spi_nor_read_sr1(nor, sr);
>>>>
>>>> I know qe_mask won't be spread across two SRs. Just to be
>>>> correct and make it easier to grok.
>>>
>>> Why is the second version easier to parse? First version is maybe more
>>> future proof since we are treating a specific case. Because either it is
>>> a specific chip (Mxic) or we end up in the more common case. There is
>>> only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
>>> that in the future we will mostly see new chips only using a qe_mask[1]
>>> mask. So having this in the else doesn't sound so strange to me? I also
>>> don't think we will ever see masks spanning the two registers.
>>
>> The problem still persists because there is the check which also fails
>> reading SR2.
>
> I don't get it. Why would you read SR2 if bit6 is set in qe_mask[0]?
> Or do you mean in the spi_nor_write_sr1_and_sr2_and_check(). Yeah
> that should also probably only write SR1 if qe_mask[1] =3D=3D 0, no?

Yes, probably. My problem is that I initially thought the big
refactoring in a way that would make the users of those helpers no
longer aware of the subtleties. But since you insisted on moving some
parts to swp.c, it broke my assumptions and also the kernel doc comments
which are no longer relevant. And now we are back to the initial
situation, where awareness is needed from the callers and the API is no
longer balanced:
- spi_nor_read_sr1_and_sr2 is not safe
- spi_nor_write_sr1_and_sr2 is safe
- spi_nor_write_sr1_and_sr2_and_check is no longer safe
I dislike this kind of lack of uniformity. One of my initial
motivations was to get rid of them.

>> Possible steps forward:
>> 1- Add extra logic in the "and_check" helper, kind of duplicating what
>>    is in the swp.c file (not my favourite)
>> 2- Move the "careful" handling (which does not return errors when a
>>    register read is absent) back from swp.c into core.c.
>>
>> What do you prefer?
>
> 3- make the generic_quad_enable differentiate between "qe bit is in
> SR1" or "qe bit is in SR2". If it's in SR1, just use
> spi_nor_{read,write}_sr1. if it's in SR2, keep the current handling.
>
> Do I miss something?

Well, no, but this is backwards. We reintroduce complexity in a path
which does not need this complexity.

I drafted another proposal:

4- Make spi_nor_read_sr1_and_sr2() immune to the SR2 absence. swp.c
still uses its _careful() version. Guard the fact that we cannot have
write_sr2 but no read_sr2. This way the API is even on the SR2 handling,
the code in the core stays very simple, we do not leak the awful swp
handling in the generic path and the SR1-only case is perfectly handled
in the generic helper without more care (which was my initial intent).

Link: https://lore.kernel.org/linux-mtd/20260911-perso-fix-spi-nor-qe-mxic-=
v2-1-70c324e9f30e@bootlin.com/T/#u # v2

Thanks,
Miqu=C3=A8l
