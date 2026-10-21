Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570329;
	b=s99zl2AGGGyPqpg19wQnHR/yUc9HKMmJIyMJyCBZ7H1rw1CEp5OoRU316sV8JNpImxCc
	 EfLJKF6+fAAffNUx5sq9Vfz6UYd7W2YhxVuwjVtixj41m9TnWPK+oHLLNwqx0G7lJIaQM
	 aiVteD2RYfwH4KHHLEtwRNLmpC2qVxR0fQkotkSexH1aU/tHr6w4DoZoqAuTs6pj4z4hW
	 ++dFg0W9oxwIA3SEv2ZdYUID0ZShbLIaUbNXgYuqDIWRdNjy+VQOtDAmp7Jldj5uMByOh
	 7VrJCipyp14KQ50msYfViqS4a3QDUJMvzxKuz2S5lnBs0uptOoBY0whwjeU+kZa1Dsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570329;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ZTaJlHpLSgJPsP7bOCOBjIksawOrYCDV0TfT1aRROpc=;
	b=DGybm4clLevEKGJR+OhX44pRkXK4ohCHJWOUduhWjKmdAywPOVAbQUZqWAIWciMYIHMO
	 yB0oLp7s6G8r5M7e1Cw8AYWIaHCG0VkcPbneM1Apu576kqM6mTs+BYaNIW64pxwD3MyIC
	 EfQI0TsLIkkdmMNAjh1B14PrJ9nOpuJZ/YtQFd/omfbg7HpKpPY+5h3DWfGRfsBakmdQh
	 7nU5hkTjcWL4g/KTEXNMMw7/KK/hTA1chdDZ6QZ6Tg+xAX+CUVwfgEb3XDVMGglE8i9lh
	 /4JVZRnqYLAdBACwtvJdhxm/WRKYDx2QZyYWuLNjYyAy3rgmlewtcVaZvl9XJtCl+0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UP8AuJCL;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C821606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C821606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UP8AuJCL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 29B8EC5CD71;
	Wed, 21 Oct 2026 08:13:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43FFB606E3;
	Wed, 21 Oct 2026 08:12:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 700F510328934;
	Wed, 21 Oct 2026 10:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792570325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZTaJlHpLSgJPsP7bOCOBjIksawOrYCDV0TfT1aRROpc=;
	b=UP8AuJCLcsP8mOIwkdKYmCr+tdOaTnu5ZrYPR2pOYT64VFEt6ecctUxi6wF5MSyiZi188f
	uDELQGFfSk7OmlNUnxVRGxs99rkNRlVkS7Rg0QDpCMsArxG1mH98ZMQSqcFzmGkLy6lFMf
	eFoQsBQ02vY0p6MSu+Ve/Mnt3TNtrAXUGOR0HUHRWkyElcx6daurs5F6XW1CoxUI5FI84e
	brS++sGYCp/hPpqh7ncwsMF53uUmq7K0bojc+7J34uKgddCGAkCfjPEch5zGxNufBLaoN3
	SMFGtnJaLv8hvAQe4z5/LbH2rAdgJOonjL4Z7i9xSr3suyPUO4xNnwlRrvvbRA==
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
In-Reply-To: <20261020104152.l2qsutq66fwdrw7t@shlinux89> (Bough Chen's message
	of "Tue, 20 Oct 2026 18:41:52 +0800")
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
	<87zex05uvn.fsf@bootlin.com>
	<AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
	<20261015031017.pdqnv2bp5627bhed@shlinux89>
	<87zewfuus5.fsf@bootlin.com>
	<20261020104152.l2qsutq66fwdrw7t@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 21 Oct 2026 10:12:00 +0200
Message-ID: <87fqxzsca7.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 20/10/2026 at 18:41:52 +08, Bough Chen <haibo.chen@oss.nxp.com> wrote:

> On Thu, Oct 15, 2026 at 12:23:38PM +0200, Miquel Raynal wrote:
>> On 15/10/2026 at 11:10:17 +08, Bough Chen <haibo.chen@oss.nxp.com> wrote:
>>=20
>> > On Tue, Sep 29, 2026 at 09:10:37AM +0000, Bough Chen (OSS) wrote:
>> >> > -----Original Message-----
>> >> > From: Miquel Raynal <miquel.raynal@bootlin.com>
>> >> > Sent: Tuesday, September 29, 2026 4:23 PM
>> >> > To: Bough Chen (OSS) <haibo.chen@oss.nxp.com>
>> >> > Cc: Pratyush Yadav <pratyush@kernel.org>; Michael Walle
>> >> > <mwalle@kernel.org>; Takahiro Kuwano <takahiro.kuwano@infineon.com>;
>> >> > Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
>> >> > <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-
>> >> > kernel@vger.kernel.org; michael@walle.cc; Bough Chen
>> >> > <haibo.chen@nxp.com>
>> >> > Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode=
 when
>> >> > entering Octal DTR
>> >> >=20
>> >> > On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
>> >> >=20
>> >> > > From: Haibo Chen <haibo.chen@nxp.com>
>> >> > >
>> >> > > The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x3=
5).
>> >> > > In 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_=
type,
>> >> > > but the resulting command is not a valid SR2 read for these flash=
es,
>> >> > > which access their status/config registers through a vendor-speci=
fic
>> >> > > indirect register space. Since spi_nor_cache_sr_lock_bits() now r=
eads
>> >> > > SR2 during init, i.e. after the switch to Octal DTR, the extended=
 RDCR
>> >> > > gets no data back and the read times out (on i.MX FlexSPI: -ETIME=
DOUT
>> >> > > and a controller
>> >> > > WARN() during probe with Micron MT35xU and Macronix octal parts).
>> >> > >
>> >> > > Clear read_sr2 when the switch to Octal DTR actually succeeds, so=
 the
>> >> > > SR2 read is skipped (a cleared opcode already means "unsupported"=
).
>> >> > > Doing it in spi_nor_set_octal_dtr() keys off the real runtime
>> >> > > protocol: a flash that advertises Octal DTR but runs in (x)STR be=
cause
>> >> > > the host lacks support keeps its usable RDCR.
>> >> > >
>> >> > > Assisted-by: LLM
>> >> > > Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
>> >> > > Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write St=
atus
>> >> > > support")
>> >> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> >> > > ---
>> >> > > Changes in v2:
>> >> > > - Rework the fix following review: instead of guarding the read a=
t runtime
>> >> > >   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 o=
nce, at the
>> >> > >   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()=
).
>> >> >=20
>> >> > I don't get that choice. Why switching when Octal DTR succeeds only=
? SR2 is
>> >> > either supported or not supported, I don't think it is anyway diffe=
rent when
>> >> > entering octal DTR mode, is it? So I would expect SR2 to be cleared=
 earlier than
>> >> > that, once we know the chip is octal DTR capable. And this must be =
early
>> >> > enough so that manufacturer drivers can still set their own value.
>> >> >=20
>> >> > I am wondering whether we should simply drop sr2 opcode in the QER =
SFDP
>> >> > parsing entirely for octal DTR devices (Michael?).
>> >>=20
>> >> The reason I clear it at the point Octal DTR actually succeeds rather=
 than
>> >>  "once the chip is octal-DTR-capable" is that capability !=3D running=
 mode:=20
>> >> a chip can advertise Octal DTR while still running in (x)STR because =
the host=20
>> >> controller does not support 8D (see reply below). In that (x)STR case=
 RDCR is
>> >>  valid and needed, so keying off capability alone would wrongly drop =
a usable
>> >>  SR2 read.
>> >>=20
>> >> That said, I agree the current spot is awkward and does not let manuf=
acturer=20
>> >> drivers override the value. I'm happy to move it earlier. Two options:
>> >> 1, Clear it during SFDP QER parsing (as you suggest) for octal-DTR-ca=
pable devices.
>> >>      This is the natural place next to the existing read_sr2 =3D 0 QE=
R cases, and it runs=20
>> >>       before the manufacturer late_init/fixups, so a driver can still=
 install its own SR2
>> >>       opcode afterwards.=20
>> >>      My only concern is the capability-vs-running-mode point above =
=E2=80=94 we'd be=20
>> >>      clearing based on advertised 8D capability, not on whether 8D is=
 actually entered.
>> >>=20
>> >> 2, Clear it in spi_nor_late_init_params() after the manufacturer hook=
s, gated on=20
>> >>      octal-DTR capability, so vendor values set in their late_init ar=
e preserved.
>> >>=20
>> >> If the capability-based approach is acceptable (i.e. we accept that a=
 chip advertising
>> >>  8D but forced to STR by the host loses its RDCR), I'll go with dropp=
ing it in the QER SFDP
>> >>  parsing. Michael, do you have a preference?
>> >
>> > Hi Miquel,
>> >
>> > Any suggestion?
>> >
>> > Regards
>> > Haibo Chen
>> >
>> >> >=20
>> >> >=20
>> >> > > - Key the clear off the real runtime protocol so a flash that adv=
ertises
>> >> > >   Octal DTR but runs in (x)STR (host without 8D support) keeps its
>> >> > >   RDCR.
>> >> >=20
>> >> > Are you sure this is a valid case?
>> >>=20
>> >> Yes. spi_nor_setup() computes shared_mask =3D hwcaps->mask & params->=
hwcaps.mask,=20
>> >> i.e. the intersection of flash and controller capabilities. If the ho=
st does not support 8D,=20
>> >> SNOR_HWCAPS_READ_8_8_8_DTR is not in shared_mask, spi_nor_select_read=
() picks a=20
>> >> non-8D read_proto/write_proto, and spi_nor_set_octal_dtr() bails out =
early at:
>> >>=20
>> >> if (!(nor->read_proto =3D=3D SNOR_PROTO_8_8_8_DTR &&
>> >>       nor->write_proto =3D=3D SNOR_PROTO_8_8_8_DTR))
>> >> 	return 0;
>> >>=20
>> >> So the chip stays in (x)STR with reg_proto =3D=3D SNOR_PROTO_1_1_1, a=
nd RDCR is still a valid=20
>> >> single-byte SR2 read there. That is the case I wanted to avoid breaki=
ng by keying the clear
>> >>  off the negotiated runtime protocol rather than the advertised capab=
ility. If we move the=20
>> >> clear to capability-based SFDP/late_init as discussed, this is exactl=
y the scenario we need to=20
>> >> be comfortable regressing (an 8D-capable part on a non-8D host would =
lose its RDCR read of SR2).
>>=20
>> I am sorry but I failed to find devices acting like you describe. Your
>> commit log mentions Micron MT35X and Macronix devices. I checked the
>> datasheets:
>> - Micron octal devices do not seem to use SR2 at all, they have a flag
>>   register, but that's something else (like Winbond) and they have
>>   similar support for it both in ODTR and in SSDR mode.
>> - Macronix octal products feature several SR/CR. The sr1_and_sr2 opcode
>>   exist but I would like to stop using it since there is no more need
>>   for it and it just complexifies everything for no good reason. There
>>   is no difference between the SSDR and the ODTR instruction sets, they
>>   both support the same opcodes for reading and writing those registers
>>   (with the subtlety that the repeated opcode should be a bitwise
>>   complement).
>>=20
>> Which device do you use exactly? Why is it not working? Are you sure it
>> is not a problem with your controller or the SFDP tables instead?
>
> Hi Miquel,
>
> The device is a Micron MT35XU01GBBA (JEDEC 2c 5b 1b) on an i.MX95 EVK, and
> a Macronix MX25UW51345G(JEDEC c2 84 3a) on an i.MX8ULP EVK.
>
> In 8D mode RDID (9f) and RDSR1 (05) are read back fine. Only RDSR2 (0x35,=
=20
> extended to 0x3535 or 0x35ca) times out. So the controller and the 8D sam=
pling
> are OK =E2=80=94 the flash simply does not answer a 0x35 in 8D mode.
>
> Root cause is in the core, not the SFDP/controller: spi_nor_init_default_=
params()
> sets opcodes.read_sr2 =3D RDCR (0x35) unconditionally, the Micron driver =
never touches
> it, and spi_nor_cache_sr_lock_bits() then reads SR2 during init, after th=
e switch
> to 8D. As you noted, Micron octal parts have no SR2 (they use the flag re=
gister),
> so 0x35 is simply not a valid command there. Same for Macronix, 0x35 is n=
ot valid
> in 8D mode.
>
> For spi-nor device which support 8D, it should contain the xSPI Profile 1=
.0 table,
> And Profile 1.0 does not describe any SR2/RDCR read. Per your suggestion,=
 I can
> clear opcodes.read_sr2 in spi_nor_parse_profile1(). It runs for octal-cap=
able
> parts and before the manufacturer late_init, so a driver can still instal=
l its
> own SR2 opcode afterwards. I test this method, it can works, but I have s=
ome concern:=20
> though flexspi(controller) and spi-nor device both support 8D mode, but u=
ser
> still can force the mode to 1s-1s-1s mode by setting the spi-t(or r)x-bus=
-width=3D1
> in dts. Like the Macronix on i.MX8ULP, in 1s-1s-1s mode, it dose issue 0x=
35, but
> it has no HAS_SR2_CMP_BIT6 flag, so cmp_mask is 0 and the SR2 value is di=
scarded
> anyway =E2=80=94 clearing read_sr2 causes no regression there.=20
> But if an 8D-capable part declared SPI_NOR_HAS_CMP in the kernel and were=
 restricted
> to (x)STR by the host, clearing read_sr2 by capability in Profile 1.0 par=
sing would
> drop its usable SR2-CMP read in STR mode. This is my concern. So I switch=
 to the
> runtime mode, clear the SR2 only when mode actually in 8D mode.
> I'm not sure whether such device really exist.
>
> Which method do you prefer? If you prefer clear SR2 in spi_nor_parse_prof=
ile1(), I
> can send V3 patch.

CMP is only supported on Winbond flashes today, and they did not put the
bit in the same register as usual in their 8D capable devices, so CMP is
already not available on these devices. Please just get rid of
opcode.read_sr2 as well as opcode.read_sr1_and_sr2 statically, nobody
should use those on such chips. This will greatly simplify our
maintainance job. If someone needs them, they will add them back in their
vendor driver, that's fine.

Thanks,
Miqu=C3=A8l
