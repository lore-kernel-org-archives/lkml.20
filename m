Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B21F41685C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789542907; cv=none; b=Bu+PPCiK5vn38DIq3wmS0kYE1eMD0oP+Zhh3+7g/0e1JLnY2OKoE6hxasZrxuPYAG+MlmP4vFyQhWqwBB6Gg8bMOQDs1QRgTTxZU2A6usyLHa6q0RL/TtMG1h87ZbTOsCuEpfKDRRJ2phgpLxMEedhOSXhe6yHh0ni7fISZiIU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789542907; c=relaxed/simple;
	bh=1NavSE8gDIsWHrlbA21cVyaBjjZyQVAZQe315S7hgNA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=iNGe1+WantpiAC5Cx3W7MsAgOtUAPuTfY2QlfhO3aLfW7XwCDZe7T4/4WzWqGL1t2rioaZ5iSOSYQvIAPukN5GdL+wKKFFuHLMjEJ03r+I9In5aUh+hNS0IGFFfoS/ybGslSxftD5fwUQeoEWsqWTHZej7Eh+Ril8FqOJ/oazWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id B36EF160;
	Wed, 16 Sep 2026 09:14:52 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 09:14:52 +0200
Message-Id: <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
X-Mailer: aerc 0.20.0
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com> <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com> <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org> <aqgRsP3cxzcLok5C@nsa>
In-Reply-To: <aqgRsP3cxzcLok5C@nsa>

Hi,

On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno S=C3=A1 wrote:
> On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
>> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno S=C3=A1 wrote:
>> > (*): I should note that the command actually failed with -EIO but it
>> > actually unlocked the chip! And the reason is because the flash as the=
 same
>> > FSR register than the micron-st flash. So WEL is set to 1 but can only
>> > be cleared when clearing the FSR register.
>>=20
>> Why doesn't this affect only the locking operation? WEL polling is
>> used also during write and erase.

Sorry I meant WIP.

> Not sure if I fully understand. But AFAICT, the reason why erase and
> write is silent is because the default spi_nor_sr_ready() only looks at
> SR_WIP [1]:

So usually, the WEL is cleared automatically by whatever needs the
WEL in the first place, i.e. program or erase, write (status)
register. That should also be the case for this flash.

Now for this flash (as well as the st/micron ones), there is one
peculiarity. Whenever there is an error bit set in the FSR, the WEL
cannot be cleared by a write disable command. Which we shouldn't
need anyway because it should be cleared automatically if nothing
goes wrong.

Also the write status register won't set the error bits if i read
the datasheet correctly and it will always disable the WEL, see
Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
datasheet.

> OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> give no special handling to WEL so I imagine that we try to set it as 0
> but read it as 1 (given that it clears only with FSR) and hence I got
> the -EIO in [2].

We do a RMW, so my guess is that it's the other way around. We read
it as 1, but then after writing the SR, it's 0 (see above). That
actually assumes, that if the WEL and any error bit in the FSR is
set, a write status register will clear the WEL anyways. Could you
debug that so we are sure, this is what actually happens?

But the question is who is setting the error bit in the first place.
And I guess it's the testing sequence for the locking when you try
to write to a locked range. So you could also actually test the
locking/unlocking without writing any data to the flash just to see
if that is the case.

>> > AFAICT, we should do something similar as micron so the writing to an
>> > actual protected region fails rather than being silently discarded wit=
h
>> > that status bit set. The question would be how to do it? The code is
>> > pretty much identical to [1]. The masks, the opcoded... So should we
>> > somehow handle this in the core (by having some common helper) that
>> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
>> > both implementations separate for now?
>>=20
>> I'd like to keep that out of the core.c, but also like to avoid any
>> code duplication esp. because there is already handling for the
>> intel spi controller in there. So maybe move it it into a new
>> common.c.
>
> Also don't like the dup tbh. Could that be a follow up or should it be
> v3. From the top of my head I could think on a mfr_common.c kind of thing=
.
> Don't thing this FSR register is standard?

Not really.

But (at least) parts of the datasheets are actually copied verbatim
between micron and issi, I wonder if we shouldn't just put the ISSI
part in micron-st.c. (Yes vendor will be wrong, but I plan on
deprecating that sysfs property anyway).

-michael
