Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA055172C5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059833; cv=none; b=cFCM2oTcWZPuopsfIw0nUy7ozG9NAl5QkNBomwG9brIOjgmhKnBOEXq7j9sAaCClx0sL/Sa+atwDLix6LjO7uKM3463Vdx5L7Q6cdcJJOFgI8KFym6o1li+8s45d2WQyn3a+dlh0MPMTkFC7OPcKEqg0+Lsv/zG+1GM0Ph5PmUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059833; c=relaxed/simple;
	bh=oPmXs6PcNZzdaUBQIem0fqkF464Nvc5dRLKpKu7jUms=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BKNmKO9VicjUJICtV2H7iKrxAPHEAUvyxeczgoyJ2MUrI99qa8oJEPmmrT9KzTZiFYcOz/OLTtjLT+Pb0PaxgMxm1WwEhgbySqcOYyK9f0qw1rIVW9jk+My0xQFn+7Jdo0l1CE5M89JYMGHosjJH/hWoOmloz5Nshx+afrRZ2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ace8xCUu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ace8xCUu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7A23AC63455;
	Thu, 15 Oct 2026 10:24:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25C6460360;
	Thu, 15 Oct 2026 10:23:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D42F410328AF1;
	Thu, 15 Oct 2026 12:23:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792059822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=syd7pC4o5FJKMVRMWpCAKTHTRahn3mOftmNMccwmH/o=;
	b=Ace8xCUuDmy99gChU5whbEEs/vV1Zgx81j6uZ2vPRDsuS2uWtV3wHkbSBZpuubVwoDO0LD
	FFin5ZP5IE+TBXZY/0lr8BC4sk/M2N8bp7MGccKzQ3BysKg4kM/e4zu/iOgFygjFunmsYU
	E2TqqaLif1Ynj1paiWS+ZV7ndEhuAvbHQMVnxs+qaKYE71A/BEbNtsX0mmG/2lhAO46x+G
	JwmybegxkH9+cmVYix7T1DMcQh7Ssx4cFuV0yhYiO7Cf9YWrSP+brI4riERcG4HjF4zJf4
	CdGKzXP2QSw5n8x3SaO/Cv0orIyZORSkUClnrtSqn00QYK5dGHI2AntSnyaGsw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "michael@walle.cc" <michael@walle.cc>,
  Bough Chen <haibo.chen@nxp.com>,  "open list:NXP i.MX 7D/6SX/6UL/93 AND
 VF610 ADC DRIVER" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
In-Reply-To: <20261015031017.pdqnv2bp5627bhed@shlinux89> (Bough Chen's message
	of "Thu, 15 Oct 2026 11:10:17 +0800")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
	<87zex05uvn.fsf@bootlin.com>
	<AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
	<20261015031017.pdqnv2bp5627bhed@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 12:23:38 +0200
Message-ID: <87zewfuus5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 15/10/2026 at 11:10:17 +08, Bough Chen <haibo.chen@oss.nxp.com> wrote:

> On Tue, Sep 29, 2026 at 09:10:37AM +0000, Bough Chen (OSS) wrote:
>> > -----Original Message-----
>> > From: Miquel Raynal <miquel.raynal@bootlin.com>
>> > Sent: Tuesday, September 29, 2026 4:23 PM
>> > To: Bough Chen (OSS) <haibo.chen@oss.nxp.com>
>> > Cc: Pratyush Yadav <pratyush@kernel.org>; Michael Walle
>> > <mwalle@kernel.org>; Takahiro Kuwano <takahiro.kuwano@infineon.com>;
>> > Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
>> > <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-
>> > kernel@vger.kernel.org; michael@walle.cc; Bough Chen
>> > <haibo.chen@nxp.com>
>> > Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode wh=
en
>> > entering Octal DTR
>> >=20
>> > On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
>> >=20
>> > > From: Haibo Chen <haibo.chen@nxp.com>
>> > >
>> > > The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35).
>> > > In 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_typ=
e,
>> > > but the resulting command is not a valid SR2 read for these flashes,
>> > > which access their status/config registers through a vendor-specific
>> > > indirect register space. Since spi_nor_cache_sr_lock_bits() now reads
>> > > SR2 during init, i.e. after the switch to Octal DTR, the extended RD=
CR
>> > > gets no data back and the read times out (on i.MX FlexSPI: -ETIMEDOUT
>> > > and a controller
>> > > WARN() during probe with Micron MT35xU and Macronix octal parts).
>> > >
>> > > Clear read_sr2 when the switch to Octal DTR actually succeeds, so the
>> > > SR2 read is skipped (a cleared opcode already means "unsupported").
>> > > Doing it in spi_nor_set_octal_dtr() keys off the real runtime
>> > > protocol: a flash that advertises Octal DTR but runs in (x)STR becau=
se
>> > > the host lacks support keeps its usable RDCR.
>> > >
>> > > Assisted-by: LLM
>> > > Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
>> > > Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status
>> > > support")
>> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> > > ---
>> > > Changes in v2:
>> > > - Rework the fix following review: instead of guarding the read at r=
untime
>> > >   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once=
, at the
>> > >   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
>> >=20
>> > I don't get that choice. Why switching when Octal DTR succeeds only? S=
R2 is
>> > either supported or not supported, I don't think it is anyway differen=
t when
>> > entering octal DTR mode, is it? So I would expect SR2 to be cleared ea=
rlier than
>> > that, once we know the chip is octal DTR capable. And this must be ear=
ly
>> > enough so that manufacturer drivers can still set their own value.
>> >=20
>> > I am wondering whether we should simply drop sr2 opcode in the QER SFDP
>> > parsing entirely for octal DTR devices (Michael?).
>>=20
>> The reason I clear it at the point Octal DTR actually succeeds rather th=
an
>>  "once the chip is octal-DTR-capable" is that capability !=3D running mo=
de:=20
>> a chip can advertise Octal DTR while still running in (x)STR because the=
 host=20
>> controller does not support 8D (see reply below). In that (x)STR case RD=
CR is
>>  valid and needed, so keying off capability alone would wrongly drop a u=
sable
>>  SR2 read.
>>=20
>> That said, I agree the current spot is awkward and does not let manufact=
urer=20
>> drivers override the value. I'm happy to move it earlier. Two options:
>> 1, Clear it during SFDP QER parsing (as you suggest) for octal-DTR-capab=
le devices.
>>      This is the natural place next to the existing read_sr2 =3D 0 QER c=
ases, and it runs=20
>>       before the manufacturer late_init/fixups, so a driver can still in=
stall its own SR2
>>       opcode afterwards.=20
>>      My only concern is the capability-vs-running-mode point above =E2=
=80=94 we'd be=20
>>      clearing based on advertised 8D capability, not on whether 8D is ac=
tually entered.
>>=20
>> 2, Clear it in spi_nor_late_init_params() after the manufacturer hooks, =
gated on=20
>>      octal-DTR capability, so vendor values set in their late_init are p=
reserved.
>>=20
>> If the capability-based approach is acceptable (i.e. we accept that a ch=
ip advertising
>>  8D but forced to STR by the host loses its RDCR), I'll go with dropping=
 it in the QER SFDP
>>  parsing. Michael, do you have a preference?
>
> Hi Miquel,
>
> Any suggestion?
>
> Regards
> Haibo Chen
>
>> >=20
>> >=20
>> > > - Key the clear off the real runtime protocol so a flash that advert=
ises
>> > >   Octal DTR but runs in (x)STR (host without 8D support) keeps its
>> > >   RDCR.
>> >=20
>> > Are you sure this is a valid case?
>>=20
>> Yes. spi_nor_setup() computes shared_mask =3D hwcaps->mask & params->hwc=
aps.mask,=20
>> i.e. the intersection of flash and controller capabilities. If the host =
does not support 8D,=20
>> SNOR_HWCAPS_READ_8_8_8_DTR is not in shared_mask, spi_nor_select_read() =
picks a=20
>> non-8D read_proto/write_proto, and spi_nor_set_octal_dtr() bails out ear=
ly at:
>>=20
>> if (!(nor->read_proto =3D=3D SNOR_PROTO_8_8_8_DTR &&
>>       nor->write_proto =3D=3D SNOR_PROTO_8_8_8_DTR))
>> 	return 0;
>>=20
>> So the chip stays in (x)STR with reg_proto =3D=3D SNOR_PROTO_1_1_1, and =
RDCR is still a valid=20
>> single-byte SR2 read there. That is the case I wanted to avoid breaking =
by keying the clear
>>  off the negotiated runtime protocol rather than the advertised capabili=
ty. If we move the=20
>> clear to capability-based SFDP/late_init as discussed, this is exactly t=
he scenario we need to=20
>> be comfortable regressing (an 8D-capable part on a non-8D host would los=
e its RDCR read of SR2).

I am sorry but I failed to find devices acting like you describe. Your
commit log mentions Micron MT35X and Macronix devices. I checked the
datasheets:
- Micron octal devices do not seem to use SR2 at all, they have a flag
  register, but that's something else (like Winbond) and they have
  similar support for it both in ODTR and in SSDR mode.
- Macronix octal products feature several SR/CR. The sr1_and_sr2 opcode
  exist but I would like to stop using it since there is no more need
  for it and it just complexifies everything for no good reason. There
  is no difference between the SSDR and the ODTR instruction sets, they
  both support the same opcodes for reading and writing those registers
  (with the subtlety that the repeated opcode should be a bitwise
  complement).

Which device do you use exactly? Why is it not working? Are you sure it
is not a problem with your controller or the SFDP tables instead?

Thanks,
Miqu=C3=A8l
