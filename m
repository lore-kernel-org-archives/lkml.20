Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706B4FDA71
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686625; cv=none; b=F6pgjwjtVVv2wKFVkrAOjf24cGlb1RFNG0mkBonIo1VXwXAuIUEbOrVCJE4ebkSZtVdSS+UosfuyQlBZDKN2MtMgw1Hd+TLWqv1uZksKggp7Q7FgcES/A3iYeDE1GEMpz8KWmqKLaHl5rLo8aW7PRYnpP82FfsV7KFcFebd4bKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686625; c=relaxed/simple;
	bh=IT8gVRGXya2e+TKe/9MJqHZqpuYRMfUDKEqSHRLf71A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=nb0D5F47erbzq8cxssQlRKbvPyGMTrj4DSmqjiCiN2i7QpYMq2Zoki4ZYS2k4R/VuMmG+szSu/U7DBaKeqWyWzVHgwqJGQCYW74Dz28a3Fvpxdz7fShiaXChTCPRvRpv4OnNl12s9BZs9VfZTUckwehi9YXGhiwJE4rVEBVCsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3B51B72;
	Tue, 29 Sep 2026 14:56:54 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 14:56:53 +0200
Message-Id: <DLRTFDVTU3XS.2Z1O4PO8PBM1D@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com> <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org> <aqgRsP3cxzcLok5C@nsa> <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org> <aqpTO-5LTLtRXaY4@nsa> <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org> <arqBm7OpMHuVhzg0@nsa>
In-Reply-To: <arqBm7OpMHuVhzg0@nsa>

Hi,

On Mon Sep 28, 2026 at 5:03 PM CEST, Nuno S=C3=A1 wrote:
> On Fri, Sep 18, 2026 at 11:25:54AM +0200, Michael Walle wrote:
>> On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno S=C3=A1 wrote:
>> > On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
>> >> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno S=C3=A1 wrote:
>> >> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
>> >> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno S=C3=A1 wrote:
>> >> >> > (*): I should note that the command actually failed with -EIO bu=
t it
>> >> >> > actually unlocked the chip! And the reason is because the flash =
as the same
>> >> >> > FSR register than the micron-st flash. So WEL is set to 1 but ca=
n only
>> >> >> > be cleared when clearing the FSR register.
>> >> >>=20
>> >> >> Why doesn't this affect only the locking operation? WEL polling is
>> >> >> used also during write and erase.
>> >>=20
>> >> Sorry I meant WIP.
>> >>=20
>> >> > Not sure if I fully understand. But AFAICT, the reason why erase an=
d
>> >> > write is silent is because the default spi_nor_sr_ready() only look=
s at
>> >> > SR_WIP [1]:
>> >>=20
>> >> So usually, the WEL is cleared automatically by whatever needs the
>> >> WEL in the first place, i.e. program or erase, write (status)
>> >> register. That should also be the case for this flash.
>> >>=20
>> >> Now for this flash (as well as the st/micron ones), there is one
>> >> peculiarity. Whenever there is an error bit set in the FSR, the WEL
>> >> cannot be cleared by a write disable command. Which we shouldn't
>> >> need anyway because it should be cleared automatically if nothing
>> >> goes wrong.
>> >>=20
>> >> Also the write status register won't set the error bits if i read
>> >> the datasheet correctly and it will always disable the WEL, see
>> >> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
>> >> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
>> >> datasheet.
>> >>=20
>> >> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check(=
) and
>> >> > give no special handling to WEL so I imagine that we try to set it =
as 0
>> >> > but read it as 1 (given that it clears only with FSR) and hence I g=
ot
>> >> > the -EIO in [2].
>> >>=20
>> >> We do a RMW, so my guess is that it's the other way around. We read
>> >> it as 1, but then after writing the SR, it's 0 (see above). That
>> >> actually assumes, that if the WEL and any error bit in the FSR is
>> >> set, a write status register will clear the WEL anyways. Could you
>> >> debug that so we are sure, this is what actually happens?
>> >
>> > Sure I'll do some debugging on the unlock path. The DS seems a bit
>> > unclear. It also states (for the WRITE DISABLE)
>> >
>> > "...In case of a protection error, WRITE DISABLE will not
>> > clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be i=
ssued to
>> > clear both flags.
>> > "
>>=20
>> Not sure, this contradicts each other. As I read it:
>>=20
>>  - Write (status) register will always clear a WEL, the only open
>>    question is, does it also clear it if the protection bit in the
>>    FSR is set
>>  - Write disable won't clear the WEL if the protection bit in the
>>    FSR is set.
>>=20
>> > But the truth is that the second unlock I did came without an error.
>>=20
>> Which might indicate that a write status will clear the WEL anyway.
>> But then it might also be interesting to see if the PROT bit in FSR
>> is still set. IOW, if a new write enable is sent, a write disable
>> might fail even if there was no actual error.
>>=20
>> >
>> >>=20
>> >> But the question is who is setting the error bit in the first place.
>> >> And I guess it's the testing sequence for the locking when you try
>> >> to write to a locked range. So you could also actually test the
>> >> locking/unlocking without writing any data to the flash just to see
>> >> if that is the case.
>> >
>> > Pretty sure the above is the case! If you look at other tests after
>> >
>> > "Once we trust the debugfs output we can use it to test various
>> > situations. Check top locking/unlocking (end of the device):"
>> >
>> > Everything worked nicely given we were just doing lock/unlock. The DS =
is
>> > also clear about this (table 8.11):
>> >
>> > "...When a command is applied to a protected sector, the command is no=
t executed,
>> > the write enable latch bit remains set to 1, and flag status register =
bits 1 and 4 are set.=20
>> > If the operation
>> > "
>>=20
>> Ok.
>>=20
>> > I also did tested with basically the same code as in micron-st and the=
n
>> > ERASE and PROGRAM commands just return -EIO.
>>=20
>> But the unlocking does not return EIO anymore when it's executed
>> successfully?
>>=20
>> >> >> > AFAICT, we should do something similar as micron so the writing =
to an
>> >> >> > actual protected region fails rather than being silently discard=
ed with
>> >> >> > that status bit set. The question would be how to do it? The cod=
e is
>> >> >> > pretty much identical to [1]. The masks, the opcoded... So shoul=
d we
>> >> >> > somehow handle this in the core (by having some common helper) t=
hat
>> >> >> > could be set in .late_init() under a common MFR_FSR flag? Or jus=
t keep
>> >> >> > both implementations separate for now?
>> >> >>=20
>> >> >> I'd like to keep that out of the core.c, but also like to avoid an=
y
>> >> >> code duplication esp. because there is already handling for the
>> >> >> intel spi controller in there. So maybe move it it into a new
>> >> >> common.c.
>> >> >
>> >> > Also don't like the dup tbh. Could that be a follow up or should it=
 be
>> >> > v3. From the top of my head I could think on a mfr_common.c kind of=
 thing.
>> >> > Don't thing this FSR register is standard?
>> >>=20
>> >> Not really.
>> >>=20
>> >> But (at least) parts of the datasheets are actually copied verbatim
>> >> between micron and issi, I wonder if we shouldn't just put the ISSI
>> >> part in micron-st.c. (Yes vendor will be wrong, but I plan on
>> >> deprecating that sysfs property anyway).
>> >
>> > Also works for me. Say the word and I can send v3 with this in
>> > micron-st.c.
>>=20
>> Yes. But also please verify the our guesses about the root cause of
>> this and what's the actual behavior of the write disable.
>
> Pinging this one :). I sent the debugging results in another message.

What is this one? I thought you'll send a v3 with the flash added to
the micron-st.c? I presume the code for clearing the FSR in there is
working for this flash, too.

-michael

