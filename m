Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251641A50B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188898; cv=none; b=bWMQ+P9xIft4zJK4LhiZiS1CxjyMp0mqqdbC0OmRJOGkhgwDU8sryeP7NCi/Ln5Y1K3B+sKbt6AsAsbSNWl04qx3Te1X+Y24GtRMbEPosLPmjQ6JJniczze1BVYibYs4f6crJLg0mVytUklxJwR21McwF1XkQIAnumAbzeSaPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188898; c=relaxed/simple;
	bh=rCpC9Dwj5ujiSpDavJucdkRcsyXErHFhB3VN3pLX8BM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iCBJdxkiibahC3IvOmgm46EGiT3H2984OmN1DSwTNAj2dR2kPNQvKgV8EPSI75talWZ995+63sE6QZYUVjWyyuAhYh6quRImybjEn5p2su05FqlkBO7eiJCCvugUbY3qAOebHpgI1MTJWYY5NIQjLTKGuZ1PC2odvm3ZCaNZUP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LFP762yg; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LFP762yg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3A32F1A190E;
	Mon, 31 Aug 2026 15:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0560360231;
	Mon, 31 Aug 2026 15:08:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 39F8B11C78A75;
	Mon, 31 Aug 2026 17:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788188885; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sqiOiFdMJrkbxYSuM3+7ydV7NdUJCu5eq/N9GzPyYT8=;
	b=LFP762yg7Bf3/oiL2TKSiwe3Tj2/qtPwTa/cB66Cun87afaUb5eqvmWMaVfnpsoiF+Tmo7
	zr8ZIHSnZLWy8Tcre/B+NR2KMiCY1RCyRcOvRsrL42l70wu7WhhQTAK7i7XpvfponEx9Iq
	NDNz9SPoci+JtMGSwpKBEKA/GaHtTxSekTyKvlvfN5WmJo7V7r47r9AuqYY2Q/tYRFSGoX
	3FVnB4UcfxYuS2+7Sr+sIk4rBbZRmSElImx1DNri1mbNbeqfZDIKRKTUcZ0UFj3QLNY0gg
	jZBG6u+xkEChkiOnBKcwHGwJ03KGobNM6WdDAlOYp5nkm/WjCng6Fz2Ah9dzBA==
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
In-Reply-To: <DL0H9KX4K3UI.145TKS5XKPFEI@kernel.org> (Michael Walle's message
	of "Fri, 28 Aug 2026 11:43:06 +0200")
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
	<20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
	<DKOKFU8AD2U6.151AX0VOBX67H@kernel.org> <87cxv3cy5j.fsf@bootlin.com>
	<DL0H9KX4K3UI.145TKS5XKPFEI@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 31 Aug 2026 17:07:59 +0200
Message-ID: <878q5m9vlc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 28/08/2026 at 11:43:06 +02, "Michael Walle" <mwalle@kernel.org> wrote:

> Hi,
>
> On Thu Aug 27, 2026 at 6:43 PM CEST, Miquel Raynal wrote:
>> I took me a lot of time to go through all your requests, in the end I
>> will not implement most of your feedback because either I do not
>> understand what is the gain, or because the result is not better at all
>> from my point of view. I try to explain that in my feedback
>> below. Nevertheless, I truly appreciate the deep review you made. I
>> think I mostly agree with the comments in the other messages.
>>
>> On 14/08/2026 at 11:40:21 +02, "Michael Walle" <mwalle@kernel.org> wrote:
>>
>>> On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
>>>> Manufacturer ID tables increase and fixup() hooks proliferate. Having
>>>> one possible structure per chip was fine until the fixups started being
>>>> more and more common and needed, to some extend due to ID reuses. Mixi=
ng
>>>> fixups and chips becomes hard and requires extra helpers to sort which
>>>> ones are needed for a given chip, which every time this happens requir=
es
>>>> a lot of rework.
>>>
>>> Thanks, this patch looks really promising!
>>>
>>>> Replace the two-level fixup association (a manufacturer wide hook and a
>>>> per flash_info hook) with a per-manufacturer list of fixups that can be
>>>> looked up by flash ID and/or match function.
>>>>
>>>> The match logic works as follows:
>>>> - If there is an ID, it must match
>>>> - If there is a match function, it must match (cumulative)
>>>> - If there is no identifier (no ID nor any match function), it's a
>>>>   catch-all entry typically used for flagging manufacturer fixups.
>
> I think this one is the crux. See more below.
>
>>> This mimics, how it's currently handled. But since the fixups are
>>> now treated as a separate list, i.e. it has it's own SNOR_ID, we
>>> shall move away from this manufacturer thingy too.
>>
>> Why shall we? See below, I don't get the point. I drafted something it
>> took me two full days to work on that, to eventually realize I did not
>> see *any* benefit.
>
> Then let me ask the other way around,=20

Mm :) Generally we are asked to justify the changes, not the
opposite. Nevertheless, I'll try to play this game ;)

> what is the benefit of having the manufacturer?

Grouping all chips following similar patterns, using similar helpers,
etc. In general the scope of the manufacturer driver is pretty
convenient to store static functions only usable inside. Unlike chip
names, giving manufacturers a name is also handy and people like to see
it, despite its actual use. Sometimes it is also useful to distinguish
if you have version A of the HW with chip from manufacturer <foo> from
version B using chip from manufacturer <bar>.

> There is now one central place for the fixups. Good. But now there
> is that catch-all thing, which is the replacement for the former
> manufacturer fixup if I read your code correctly.

I think so, but what is the problem with that? I mean, maybe it wasn't
so nice to set up in the first place, and we may want to limit the
propagation of manufacturer wide fixups. I don't find that catch-all
entry useless though. But at this stage we anyway need an equivalent,
hence the manufacturer wide catch-all entry.

> BUT. We don't have a concept of a 'manufacturer'. We don't match the
> manufacturer id.

This is very easy to do, maybe I should have done that instead of having
a blind manufacturer-wide fixup. At this stage I do not see the
difference, but I can easily add the first ID byte to match.

> The manufacturer is just set as an additional
> information if there is already  matching entry for a specific
> flash, so we already know the exact part. Before the generic driver,
> this might have made sense. The intention was to have a common place
> for the default flags for all *known* flashes of a manufacturer
> (which probably also was the result of the core rewrite). But now,
> we might have flashes we do not know, that is, aren't in the
> database. At least I would assume, that the manufacturer fixups are
> still applied though. There were already a few different times I
> proposed to have fixups for SNOR_ID(vendor_id).
>
> I mean, even you fell into the trap that you'll have to have that
> catch-all/fallback entry in the flash db (can't find the mail
> anymore though, so please correct me if I'm wrong).

Yes, absolutely.

> Also, having the fixups separate from the flash db, we can use the
> generic flash driver and still have some fixups for given flashes.

Nothing we cannot do with the current approach, no? You will anyway need
some kind of identification in order to apply the fixups. I prefer
having them in vendor drivers rather than in the core.

> If - for example - one would be adding locking support later,
> nothing but the new flashdb entry has to be added as the fixups are
> still applied.

Yes, but that's also possible with the approach carried here (using the
Macronix and now Winbond catch all entries).

>>> IMHO that really
>>> clutters the code.
>>
>> Clearly an opinion I do not share. Maybe I am missing something.
>>
>>> As a fun fact, spi_nor_match_id() will have the
>>> unexpected side effect of setting nor->manufacturer.
>>
>> Not sure I get why this is unexpected?
>
> The signature of the function is:
> static const struct flash_info *spi_nor_match_id(struct spi_nor *nor,
> 						 const u8 *id)
>
> Clearly it will return a pointer to the flash_info entry for a given
> id. But as a side effect it also sets nor->manufacturer. What if I'd
> call that twice with different ids? Maybe it's just me, but it looks
> like a pure function but isn't. I probably got burnt by the generic
> nor driver which hit that in the first place.

Maybe the name can be improved, naming is never easy, but once there is
a match, associating a manufacturer name to the device doesn't sound so
silly to me :)

>>> So here's how I'd do it:=20
>>> (1) remove spi_nor_manufacturer.
>>> (2) have a list of initcalls in the core to call into the individual
>>>     vendor modules (that could later be replaced by something more
>>>     sophiticated)
>>> (3) that initcall will then call spi_nor_register_parts(const struct
>>>     flash_info *parts, int nparts)
>>> (4) (optionally) calls spi_nor_register_fixups(const struct
>>>     spi_nor_fixup *fixups, int nfixups)
>>
>> I've been trying hard to follow your approach, but really, I don't get
>> the point. Initcalls are not possible here, or it would prevent
>> CONIFG_MTD_SPI_NOR=3Dm so I went for an alternative approach with an init
>> registration which I believe matches your expectations. This is not
>> an actual problem.
>>
>> But registering parts and fixups independently, maybe, but again, why?
>> What is the intended benefit? We now need to go through 96 (spi-nor
>> wide) fixups. But what do we get in exchange?
>
> I don't get that. You already have a (new) winbond_fixups[] for
> example. What is the difference between having that set in
> spi_nor_manufacturer vs having that in a
>
> winbond_init() {
> 	spi_nor_register_flash_devices(&winbond_nor_parts);
> 	spi_nor_register_fixups(&winbond_fixups);

The difference is that you end up with a big list of parts (like before)
and a big list of fixups as well, which are not related to the parts. So
when you have a match with a part, for each of the 6 fixup cases, you
will check every single fixup entry (96 at this stage) for a
match. Before this was limited to a dozen at most. OTOH I do not see any
benefit in registering the parts and fixups like that, compared to just
exposing the (exported) manufacturer structures.=20

> And probably setting the manufacturer name in winbond_nor_fixups().

Here again: yes that's possible, but for what benefit?

> I guess that all falls apart because of the empty match entry. That
> could be replaced with the SNOR_ID(winbond_id), though. Then we have
> *real* per manufacturer fixups.

Ah ok, I believe we agree here, so in the end, do you prefer having a
manufacturer wide fixup entry without SNOR_ID? Or do you prefer to
always have an ID to match with, and use the manufacturer ID for that? I
don't think there is a need for filling an SNOR_ID for this entry since
the fixup list is associated to the parts list though.

> That is basically what commit afe1ea1344bb ("mtd: spi-nor: add
> support for Macronix Octal flash") made.
>
>> From my point of view:
>> extra churn and boilerplate, nothing particularly better than before. I
>> must admit, I do not understand your aversion for the manufacturer
>> structure. So while I like the idea of a flash-info independent fixup
>> list (which I implemented in v3), I do not understand the need for this
>> extra step.
>
> See above.
>
>> Since I do not get the point of this request, I prefer to not implement
>> it, because I will anyway do it the wrong way. If someone wants to make
>> a proposal, I will have a look, but at this point I need to back
>> off.
>
> I can do that myself, but I'd like to avoid any code churn. So I
> don't know what you've already tried to come up with, but if there
> is something which somewhat goes in the right direction of moving the
> registration to a function inside of the vendor modules. That would
> really be appreciated.

Unfortunately after struggling hours with it, I dropped it entirely /o\
I experimented using initcalls, creating those parts/fixup registration
helpers, etc.

>> There are already ~70 patches pending which I hope will be applied
>> ASAP after -rc1 gets tagged and we agree on the remaining points (there
>> are other comments from you and Takahiro which I need to address).
>
> Looks like I need to apply the patches to the tree, too. Honestly,
> I've never done that, so I first need to actually see how it's done
> and if I even have access to the tree.

Thanks. I can help you with that. My setup has been overly simplified
since I switched to b4. I will share the the details privately.

[...]

>>>> --- a/drivers/mtd/spi-nor/gigadevice.c
>>>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>>>> @@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[=
] =3D {
>>>>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>>>>  		.name =3D "gd25q256",
>>>>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
>>>> -		.fixups =3D &gd25q256_fixups,
>>>>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>>>
>>> The fixup_flags should also go into the fixups list.
>>
>> Yes, we can use a similar logic here. Actually if at some point we want
>> to get rid of those flags, we could transform the flags into proper
>> fixup functions, but I'm not going to do that now.
>
> The flags actually serve the purpose of *not* having a huge amount
> of different fixup functions. So these should be kept for now. As an
> alternative, with the new list it might be possible to have multiple
> fixups for the same flash part. In any case, the fixup_flags have to
> be removed from the flash_info struct.

I've added a patch for that.

>> [...]
>>
>>>> +/* PM25LV parts have no JEDEC ID and are likely matched by name */
>>>> +static bool issi_pm25lv_match(const struct spi_nor *nor)
>>>> +{
>>>> +	const char *name =3D nor->info ? nor->info->name : NULL;
>>>> +
>>>> +	return name && !strncmp(name, "pm25lv", 6);
>>>
>>> Won't just strcmp("pm25lv", name) do it? Both arguments are
>>> guaranteed to be NUL terminated. The above would also match
>>> "pm25lvextrabytes", no, and we get rid of that redundant size
>>> argument.
>>
>> No it won't, because that would no longer be a match, you would compare
>> pm25lv against pm25lv010 or pm25lv512 -> no match if you don't limit to
>> the first 6 bytes. Since names are part of the sysfs ABI, we cannot just
>> modify the names for that. We also need two different entries (two
>> different sizes) since we do not even match with an ID.
>
> Ah I see, you actually *want* that extra bytes, in that case, please
> use strstarts().

Yeah, no pb.

>> [...]
>>
>>>> @@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_=
nor *nor,
>>>>  	return 0;
>>>>  }
>>>>=20=20
>>>> +/*
>>>> + * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
>>>> + * In order to not mix the fixups, further filter out using the part =
name.
>>>
>>> How would that work? The part name is also set by the duplicated ID,
>>> so the first one wins, no?
>>
>> - First part (mt25qu01g) is checked
>>   -> ID match
>> - There is a match function where we compare the name with n25q00a
>>   -> no match, not applying the fixup
>>
>> - Second part (n25q00a) is checked
>>   -> ID match
>> - There is a match function where we compare the name with n25q00a
>>   -> name match
>>
>> The fixup is only applied for n25q00a.
>
> Ah, I now get what you want to try to achieve. Only the first three
> bytes (I missed that in the function doc) are shared. So no actual ID
> collision.
>
>> For the other chip we can just give more ID bytes for the match.
>
> Giving there are more IDs for the n25q00a.
>
>> So I believe there is no problem here?
>
> Yes, no problem. But use strncmp() here, because this actually
> matches just one particular flash.

Ok.

> FWIW I don't think this is sustainable, though. It's basically a
> workaround for the different matching in spi_nor_match_id() (first
> entry wins) and the fixups ID matching (any matching entry is
> applied). Though, I can't think of a more generic solution for now.

Thanks,
Miqu=C3=A8l
