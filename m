Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209C41167F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510985; cv=none; b=g5MI7cerZrGjE03BYvNKk4FmGFXuLPtPvyRnVpqgAkmKBCHKAbW+Hu/gT+FfEmys9IqAlmte3zewP4YjVVNnHZzQOV9lkSuyXjMhb7heV3XFwTzsEdCT/fctkTZEFlQ2nz0KOWZ4Xpn5i3g2EzdQagIEcwjYEfhdR6ZF4uPXOoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510985; c=relaxed/simple;
	bh=9JbO1y2iWbLODHWR0hN/vU9jJ+u7W0a/wK+7f9yq7lI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5w3QrWTdr028hs0jb2ZzfYSfGehyR3Hpdr9JBkoSfW1axYC/u0q++D4GYyu0AKv9rsPTLulDhz/2h4qYf9lr0GfJ2LBNL9RQlazas58Om3jqwnlmzlRNCSURNO1NPkhQcOefaas+pK3v6PfF3NacJko0C5xp4GoK+zYEiYanXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P0pxunQz; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P0pxunQz"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9JbO1y2iWbLODHWR0hN/vU9jJ+u7W0a/wK+7f9yq7lI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788510980; v=1; x=1789115780;
 b=P0pxunQzFaHrRfTY1iBAa3oHO+WchvssOE7+ZyvepB9kSCNGGKjDMb+KZBj3sxKPsmqOcKeD
 p8wI5zwyjTYjpcWOK1ekd4AYUrsdhE7KmOxuns6to2zWfLNj82vUwuyC/dwZToo0XE0bJ41JzN/
 4gT1o6nr9I7ha1rRP3Ql59uo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 409d7dda428307e8;
	Fri, 04 Sep 2026 08:36:20 +0000
X-Mizu-Trace-ID: 409d7dda428307e8
X-Migadu-Flow: FLOW_OUT
Message-ID: <70a91202-e801-4008-bec8-883b229f9f0f@linux.dev>
Date: Fri, 4 Sep 2026 10:23:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: tas2783-sdw: questions about the register tables
To: Andrey Golovko <andrey.golovko@gmail.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>, Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260824104500.7588-1-andrey.golovko@gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260824104500.7588-1-andrey.golovko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


> 1. The tables and DisCo describe different parts.
> 
>    The platform describes the Smart Amp Function in some detail: 27
>    Entities with their Controls.  The driver ignores that and uses its
>    own tables, so the two can be compared.
> 
>    Entities the driver knows that DisCo does not describe: CS24 (0x05),
>    OT24 (0x17), OT127 (0x1E), CS127 (0x20), MFPU21 (0x22), MFPU26
>    (0x23).  Entities DisCo describes that the driver does not know:
>    0x0B, 0x0D, 0x1D and 0x37 - 0x0B and 0x0D look like two more Power
>    Domain Entities, each with Controls 0x01 and 0x10 like PDE23.
> 
>    Is the driver's table a superset written against a different
>    configuration of the part, or is the platform description short?

In a perfect world, the DisCo tables would contain all the required
information and the drivers would just use it blindly.
In reality, it's very common for the platform firmware to contain
errors, and for drivers developers to start their own code with what
works for them...

> 2. Latency Controls.
> 
>    The driver's read-only list holds 21 Latency Controls.  DisCo
>    describes exactly one of them: FU21 0x10.  For eighteen the Entity is
>    described and the Latency is not; two more belong to Entities DisCo
>    does not have at all.
> 
>    And FU21 0x10 - the single one the platform describes - is one of the
>    two the driver cannot reach: it appears in no case of
>    tas2783_sdca_mbq_size(), so the callback returns 0, and both
>    tas2783_readable_register() and the cache refuse it.  The same holds
>    for UDMPU23 0x06.  The other nineteen are declared four bytes wide
>    and carry a 0x0 placeholder in tas2783_reg_default[].
> 
>    The DSDT settles what FU21 0x10 is: access mode 0x05, i.e. DC, with
>    mipi-sdca-control-dc-value 0x0.  A DisCo constant, as Charles Keepax
>    described - hard coded in ACPI, not implemented in the hardware, and
>    normally given a default-array entry with no readable/writeable case
>    so the constant can still be read.  Which is the one shape the driver
>    does not give it.
> 
>    But that only covers the one.  What are the other twenty Latencies,
>    which no DisCo entry describes and which the tables answer with a 0x0
>    placeholder?  Are they implemented in this part?

Huh, you can safely ignore Latency Controls. This is something that was
'inspired' by USB audio, where this was also ignored. No one knows what
to do with Latency controls...

> 3. XU22.
> 
>    The driver's read-only list has XU22 0x06 (Latency), 0x07 (XU_ID) and
>    0x08 (XU_Version).  DisCo describes none of the three, and XU22 0x07
>    answers COMMAND_IGNORED here, powered and unpowered, on both
>    amplifiers.  Not implemented?
> 
>    Conversely, XU22 0x09 and 0x0a are in tas2783_reg_default[] and in
>    the size callback - 0x09 as two bytes, 0x0a as four - and DisCo does
>    describe them, as constants rather than registers (see 4), even
>    though SDCA 1.0 section 6.3.10.3 defines no Control Selectors 0x09
>    and 0x0a for an Extension Unit.  What are they?
> 
>    XU22 0x12 (FDL_MessageOffset) is described by DisCo and still answers
>    COMMAND_IGNORED in both power states.  (Before the regmap val_bits
>    widening in 1/2 of [1] it returned -EINVAL without reaching the bus,
>    since it is declared four bytes wide.)

XU stands for eXtension Unit, it's where all the secret-sauce is
handled. In practice this is what's used for firmware download. As long
as the firmware download works I wouldn't spend time looking at this.

> 4. DisCo access modes disagree with the tables in both directions.
> 
>    Reading the access mode of every Control in the Function turned up
>    Controls the driver treats as ordinary writable registers that the
>    platform declares constant or read-only:
> 
>      XU22 0x09, XU22 0x0a   DC, dc-value 0x0
>      UDMPU23 0x10           DC, dc-value 0x1 - the driver's default is 0x0
>      SAPU29 0x10            RO (Protection Mode)
>      XU22 0x15              RO
>      IT21 and IT26 0x10 and 0x11, IT28 0x11, OT25 and OT28 0x11,
>      FU127 0x01, 0x04 and 0x05, MU26 0x01     all DC
> 
>    Nothing in the driver writes most of these today, so this is latent
>    like the rest, but tas2783_writeable_register() would let a write
>    through to a Control the part does not implement, and for UDMPU23
>    0x10 the cached value differs from the constant the platform states.

Yeah, in general the DC and RO access are a bit problematic, sources of
errors...

>    One more of that kind, outside the read-only question: FU21 Channel
>    Volume 0x02 has a DisCo default of 0xFA00 with a range of 0x9C00 to
>    0x0000 in steps of 0x19, while tas2783_reg_default[] gives it 0x9C00,
>    the bottom of that range.  Is the table value deliberate?

In theory the DisCo default is supposed to be a platform-specific
information. Setting the volume at the driver level is pretty bad in
that all platforms using that amp would use the same volume default.
That said, if the BIOS writers copy-paste the value without asking the
audio integration folks then that'd be equally bad.

>    More generally: the kernel can parse this description now.  Is moving
>    the driver onto the SDCA parser, rather than maintaining tables that
>    have drifted from it, something you are considering?
> 
> 5. Placeholders for state readings.
> 
>    PDE23 Actual Power State has a default of 0x3 while the peripheral
>    answers 0x0; SAPU29 Protection Status has 0x0 while the peripheral
>    answers 0x3.  Both are cached, so a read returns the opposite of the
>    device state in both cases.  Patch 2/2 of [1] addresses this by
>    marking them volatile - is there a reason the entries are there?

all volatile registers should be handled as such with no defaults...

> 6. FU23 Mute, channel 0.
> 
>    regcache_sync() aborts there, at 0x40400108, every time: the default
>    is 0x1, the cache holds 0x00 after bring-up, so the sync tries to
>    restore 0x1 and the peripheral answers COMMAND_IGNORED.  Being the
>    first mismatch in address order, nothing after it is restored either,
>    so a sync effectively does nothing on this part.  What is the reset
>    value of the FU23 Mutes, and should they be in the defaults at all?

that points to an unimplemented register...>
> 7. Calibration register width.
> 
>    tas2783_set_calib_params_to_device() wrote each of the five
>    calibration values with regmap_bulk_write(..., buf, sizeof(u32)),
>    relying on val_bits = 8 to spread one 32-bit value over four
>    consecutive single-byte registers, most significant byte first.  With
>    val_bits widened that call would mean something else, so 1/2 of [1]
>    writes the four registers explicitly in the same order; read back
>    over the bus, the five values of both amplifiers are byte for byte
>    what they were before.  Please confirm the layout is what the part
>    expects - the tables declare these registers one byte wide and
>    nothing else documents the order.
> 
> 8. simple_ch_prep_sm.
> 
>    The platform sets it for DP1, the only data port these amplifiers
>    have, so the core skips the DPn_PrepareStatus poll.  That is what
>    made the resume failure fixed by 119046319e77 silent: the port never
>    finished preparing and nothing in the kernel noticed.  Does the part
>    implement the full channel prepare state machine, i.e. is the
>    property right?

this has been addressed in multiple threads. the short story is that we
stick to this simple_ch_prep_sm mode.>
> 9. Power symmetry.
> 
>    With 119046319e77 the Function is powered up in the port PRE_PREP
>    callback while the power down stayed in tas_sdw_pcm_hw_free().  If
>    you would prefer the two symmetric, moving the power down to
>    POST_DEPREP is a small patch and I am happy to send it.
possibly. In general, ports and functions are not really at the same
level and there's no reason why the two are linked. I don't fully
remember the issue on this chip but this was not a generic problem. TDB
with TI if they need a symmetry for the power-down.


