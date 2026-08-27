Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C848D89B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849002; cv=none; b=CsQCokNlQRtBXNphx8lKLdwL/fX9YByzromSCN/TWrLa5XyYiARHVZax1YK1pY4/diapuOv7hsMd61ru1hUynOcAnwbhxcxaTcMOISrv1InGK5AhirYKc4MxbiDwsVmRo5ntnGraxAYAafR0Oy+r8RJ8Z3hSCXuM3arfB8ZSgiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849002; c=relaxed/simple;
	bh=nRoHwlsF3WUuqUr3nk9ZUcEETd205tk2KfbH8mKe/+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=orvwPf77J22Iyma8olB5225BKmEkgkrf2e9JPP3icK+XXT9HOtBEGO/L78EpQQ5mc/WHtSKU5bo8UyrfjppmMhorEHHxjd27XvWOnN5icmwWgDXYlv3oX7pLBy0RfjAZ2naw+2yOKxlGyEY9AhhGve+qZo/7070wCJJ+qjO+6+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CtnZ5jlj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CtnZ5jlj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 98D204E413E1;
	Thu, 27 Aug 2026 16:43:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F6D3604ED;
	Thu, 27 Aug 2026 16:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7C11511C780CB;
	Thu, 27 Aug 2026 18:43:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787848990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XxwcF+GEHxUG8bL+ir1yRXCJzX7aC3C+dEO4fpdt0sE=;
	b=CtnZ5jljui7LdupirTQTWqUV0oYljGBVXGYVu4CKz7D7RrOdul50N1Vby2mU6FlWVMh7NP
	pKStH9KHhko65mtJp6B9E3QC7MJSP8AhJlQ6HfGvHSwKQc3izf4qS4FUznX6lb7ORcjKDf
	ADmbhhOI+hd2ATph44wfpEQu0d6amAUwbAW9VrA29F0/CnzYFkLcFfdeKBWIgCLBykfdC2
	I1RQ9YcOVpEN4VABV9DjsBdrautKJkfwi3iFAk6gh29qq+nz5nCbSs/0utCAWw5QQlYJbJ
	qKOx+G6BAh58Au/A9/qRftOK+XnMerXXvl6GkxrtsbkO2MrMa8tb4WjmgN0gdw==
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
Subject: Re: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup
 table with match function
In-Reply-To: <DKOKFU8AD2U6.151AX0VOBX67H@kernel.org> (Michael Walle's message
	of "Fri, 14 Aug 2026 11:40:21 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
	<DKOKFU8AD2U6.151AX0VOBX67H@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 27 Aug 2026 18:43:04 +0200
Message-ID: <87cxv3cy5j.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Michael,

I took me a lot of time to go through all your requests, in the end I
will not implement most of your feedback because either I do not
understand what is the gain, or because the result is not better at all
from my point of view. I try to explain that in my feedback
below. Nevertheless, I truly appreciate the deep review you made. I
think I mostly agree with the comments in the other messages.

On 14/08/2026 at 11:40:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
>> Manufacturer ID tables increase and fixup() hooks proliferate. Having
>> one possible structure per chip was fine until the fixups started being
>> more and more common and needed, to some extend due to ID reuses. Mixing
>> fixups and chips becomes hard and requires extra helpers to sort which
>> ones are needed for a given chip, which every time this happens requires
>> a lot of rework.
>
> Thanks, this patch looks really promising!
>
>> Replace the two-level fixup association (a manufacturer wide hook and a
>> per flash_info hook) with a per-manufacturer list of fixups that can be
>> looked up by flash ID and/or match function.
>>
>> The match logic works as follows:
>> - If there is an ID, it must match
>> - If there is a match function, it must match (cumulative)
>> - If there is no identifier (no ID nor any match function), it's a
>>   catch-all entry typically used for flagging manufacturer fixups.
>
> This mimics, how it's currently handled. But since the fixups are
> now treated as a separate list, i.e. it has it's own SNOR_ID, we
> shall move away from this manufacturer thingy too.

Why shall we? See below, I don't get the point. I drafted something it
took me two full days to work on that, to eventually realize I did not
see *any* benefit.

> IMHO that really
> clutters the code.

Clearly an opinion I do not share. Maybe I am missing something.

> As a fun fact, spi_nor_match_id() will have the
> unexpected side effect of setting nor->manufacturer.

Not sure I get why this is unexpected?

> So here's how I'd do it:=20
> (1) remove spi_nor_manufacturer.
> (2) have a list of initcalls in the core to call into the individual
>     vendor modules (that could later be replaced by something more
>     sophiticated)
> (3) that initcall will then call spi_nor_register_parts(const struct
>     flash_info *parts, int nparts)
> (4) (optionally) calls spi_nor_register_fixups(const struct
>     spi_nor_fixup *fixups, int nfixups)

I've been trying hard to follow your approach, but really, I don't get
the point. Initcalls are not possible here, or it would prevent
CONIFG_MTD_SPI_NOR=3Dm so I went for an alternative approach with an init
registration which I believe matches your expectations. This is not
an actual problem.

But registering parts and fixups independently, maybe, but again, why?
What is the intended benefit? We now need to go through 96 (spi-nor
wide) fixups. But what do we get in exchange? From my point of view:
extra churn and boilerplate, nothing particularly better than before. I
must admit, I do not understand your aversion for the manufacturer
structure. So while I like the idea of a flash-info independent fixup
list (which I implemented in v3), I do not understand the need for this
extra step.

Since I do not get the point of this request, I prefer to not implement
it, because I will anyway do it the wrong way. If someone wants to make
a proposal, I will have a look, but at this point I need to back
off. There are already ~70 patches pending which I hope will be applied
ASAP after -rc1 gets tagged and we agree on the remaining points (there
are other comments from you and Takahiro which I need to address).

> Also both could be a macro, then we can get rid of the size
> argument.
>
> The current manufacturer fixups gets registered with a
> "SNOR_ID(vendor)".=20
>
> That leaves us with the manufacturer name, which should be set by
> that vendor catch all fixup.
>
> Btw, I'm fine with deprecating the name as well as the manufacturer
> sysfs entry, but it shouldn't be as in "it just goes away".

I have no strong wish to get rid of those, especially the manufacturer
name which is not particularly problematic today.

[...]

>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>> +		if (fixups[i].fixups->post_bfpt &&
>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>> +			if (ret)
>> +				return ret;
>> +		}
>
> This is repeated several times, can we have something like
>
> spi_nor_apply_fixups(struct spi_nor *nor, int (*fixup_fn), void *fixup_ar=
gs);
>
> int spi_nor_post_bfpt_fixup(struct spi_nor *nor, const struct spi_nor_fix=
up *fixup, void *_args)
> {
> 	struct post_bfpt_fixup_args *args =3D _args;
>
> 	if (!fixup->post_bfpt)
> 		return 0;
>
> 	return fixup->post_bfpt(nor, args->bfpt_header, args->bfpt);
> }
>
> which then will be called with
> spi_nor_apply_fixups(nor, spi_nor_post_bfpt_fixup, args);

I drafted it, but arguments are different, argument numbers are
different, return values are different, we need stubs for each
fixup... Nothing is identical, we just save a couple of simple checks
and a for loop. On the other hand, code just grows, complexity is
higher, readability is definitely lower. Sorry, but again, I do not see
the gain with this attempt, it just darkens what the core does. It would
definitely work with another -more advanced- language than C, though.

>> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
>> +		if (fixups[i].fixups->post_bfpt &&
>> +		    spi_nor_fixup_match(nor, &fixups[i])) {
>> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
>> +			if (ret)
>> +				return ret;
>>  	}
>>=20=20

[...]

>> --- a/drivers/mtd/spi-nor/gigadevice.c
>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>> @@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>>  		.name =3D "gd25q256",
>>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
>> -		.fixups =3D &gd25q256_fixups,
>>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>
> The fixup_flags should also go into the fixups list.

Yes, we can use a similar logic here. Actually if at some point we want
to get rid of those flags, we could transform the flags into proper
fixup functions, but I'm not going to do that now.

[...]

>> +/* PM25LV parts have no JEDEC ID and are likely matched by name */
>> +static bool issi_pm25lv_match(const struct spi_nor *nor)
>> +{
>> +	const char *name =3D nor->info ? nor->info->name : NULL;
>> +
>> +	return name && !strncmp(name, "pm25lv", 6);
>
> Won't just strcmp("pm25lv", name) do it? Both arguments are
> guaranteed to be NUL terminated. The above would also match
> "pm25lvextrabytes", no, and we get rid of that redundant size
> argument.

No it won't, because that would no longer be a match, you would compare
pm25lv against pm25lv010 or pm25lv512 -> no match if you don't limit to
the first 6 bytes. Since names are part of the sysfs ABI, we cannot just
modify the names for that. We also need two different entries (two
different sizes) since we do not even match with an ID.

[...]

>> @@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_no=
r *nor,
>>  	return 0;
>>  }
>>=20=20
>> +/*
>> + * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
>> + * In order to not mix the fixups, further filter out using the part na=
me.
>
> How would that work? The part name is also set by the duplicated ID,
> so the first one wins, no?

- First part (mt25qu01g) is checked
  -> ID match
- There is a match function where we compare the name with n25q00a
  -> no match, not applying the fixup

- Second part (n25q00a) is checked
  -> ID match
- There is a match function where we compare the name with n25q00a
  -> name match

The fixup is only applied for n25q00a.

For the other chip we can just give more ID bytes for the match.

So I believe there is no problem here?

Thanks!
Miqu=C3=A8l
