Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCE6439346
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523312; cv=none; b=gX+RqLZGMtYAKUW7yEeVcpYwxs1Sb/awgqrQNKn1yx1k7CZt6KDu/75jtaacbZHcvKVnFWq23mD4P5MW/eN9xIGJDVRpuMP5iYQ1XLr+g0mfHVz5dL/HBHp6Juvx8vP//Pu5Ims/ub4TujYW1KBDGT0emLPU/3dOTl7mgM43pNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523312; c=relaxed/simple;
	bh=9SGfXq7LRGnDqXug/2kp3gBOiqw3ouk4R1o1WB26wGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCcIe3bqYZD0I5V96D+nriO7a8NzNgrc+mjJfcd18btQz2/AYJRR4GiQV+h+ow7JTcf+2SBY/GrfHDLCXnpcw+qnMzVa9LM51ifja38Q5599B0lIQa7PRSXrsE2psc6sbvm1y7Zw/BzH6fQVG8mUZZPZxq4i/iQX5HzIJFBVmN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIJq3l0l; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIJq3l0l"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b4af4be667so884170e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523308; x=1789128108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TNxsg4/48to2hNXfeTrgzMmHAuyHMdfqUHaJogKVVhg=;
        b=AIJq3l0lepR9qfx0GvCIB9CLbAp86Nve0MPWutbPx3RDViCZJjFeM2anrIUj1lO3KW
         NOFsaNHTEmXGp4rlbPZQm8rKWsSa6dsyxT1xcW+Xgq5ns4HNni8bP5MhAT8MtEMTL4Am
         wR2oraZry1v2wlo2xebcpPFMaoz0eJ4rDdKQATFfT1kimaOSdMDzFnnLYVZkloYTHSCi
         BvbMg22dWSroZc0gA9SSE1n5WsE5nNS56V5bS/+1Y84Lc8SzVEKiAbhEj0LeSR7bZf1i
         ZUQxUNtBW5G4EIpUExvzw88YgL4OqIFrHOmqKr2d7eF3OEzJekL0yG5OJPbtLycF7gae
         HxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523308; x=1789128108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNxsg4/48to2hNXfeTrgzMmHAuyHMdfqUHaJogKVVhg=;
        b=mIi3JeaCca/m2aEDbehzqasoe47ynS2IkiCVNOM3Nd2lVSj7xfixDtWDtTcluqOi4g
         D8rpdb8faAFhK/Y2HpeXK3IBltNV/5Oasg9pCSxrJml70HoBLK2S53OhYOZ2pU22PO60
         e5ngON2AZgMLLaW0ilQ72aYfDtkqjzouFwZebjHQxq5zw6DCuiqZT1vy/1rwhnxb3tBP
         r6sXGr7jwh/Csw3pa9Tzhb0A9LcEongULttEFidzK34JRLmLJQgRIPsyfGntmlnz0wov
         kV1z5iHFCBUPDXNendF2hsokfx6JZkeyE2R/CnN7O/E0nTDXv3CC4O3lV5/k8GHNzpPl
         bQqA==
X-Forwarded-Encrypted: i=1; AKwUvBxPWdFPPQ17BMcKJ/FrXxnY2+8H3XBNAWnbe3KcBO71UM9RaurgZWrQwKGJUKf5AT0/nwkAhNtBeZhjI/4=@vger.kernel.org
X-Gm-Message-State: AFuF++nRQac/QDlTupcXxn9aPUqREii4W+BUvd9Gn/JIN4o8J3pfXaTY
	G7tvCdM+82R0RILuqoY0f2UaUSJgGM+rrZLsp4HWn+NNYaLmf0/pOpNU
X-Gm-Gg: AYBFou06d+C2WXhv2lyHntkglauMTGSzYzUO+b0l5Bszekdg2o2NPhDLo11yGl+CDd7
	GLBjnaJQYPoyn1UxbSY2j8RYx2Z7NxCxKLAe3haIdx4D4nvw8XWAIuxAne6p7W8UrbkYytoVz7w
	vOm+mKaYdlVC8f41xbV/rgt+bjgnG+naJZCXOz7E46WdlqTMUKyFFTzt+EQNPzTIQLhm7JztLil
	3xl8HEVqbo4SZF10LDmklnM5MkcOUchwCrcjAHtQdwaCqyZNVenq28ViXzz5dtn0qXbXLr0O/1/
	jeTzZe4cyDvDgP0F+oqompw3SCnaTqMKsHCbL+YOzKFnHP8cnAyEJUMWSBIMeoeBRSCeyOy8oSV
	hOrzApqOwln05WzM5jXMndP4bJtcspNqjmRUziUavFoVSu8laT3I1IMHodoQFMDUpn6LruNMaLP
	dbAk1FzE5NdhwIXbDsdeR31x+Gy9IelW9LoF0/l9Xt71S6Qyo7V5ePxvUXZdB/RULOfAmul3j/t
	QF0wFC7/oOngXGaH2pFW7ICPdgPuFmw7w==
X-Received: by 2002:a05:6512:32c9:b0:5b6:183c:5c9f with SMTP id 2adb3069b0e04-5b6183c5eb7mr793025e87.61.1788523307434;
        Fri, 04 Sep 2026 05:01:47 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b61670a44csm466893e87.76.2026.09.04.05.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:01:47 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>
Cc: Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>,
 Ville Saarinen <wiza@saarinenkoti.fi>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: tas2783-sdw: questions about the register tables
Date: Fri, 4 Sep 2026 15:01:33 +0300
Message-ID: <20260904120133.7412-1-andrey.golovko@gmail.com>
In-Reply-To: <70a91202-e801-4008-bec8-883b229f9f0f@linux.dev>
References: <20260824104500.7588-1-andrey.golovko@gmail.com>
 <70a91202-e801-4008-bec8-883b229f9f0f@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, Sep 04, 2026 at 08:23:23AM +0000, Pierre-Louis Bossart wrote:

Thank you - that settles most of the list.  Below is what it changes on
my side, and one correction: your reading of the FU23 Mute sent me back
to the bus, and the sync failure turned out to have a different cause
than either of us described.  It is measured down to the mechanism.

> Huh, you can safely ignore Latency Controls. This is something that was
> 'inspired' by USB audio, where this was also ignored. No one knows what
> to do with Latency controls...

Good, that closes the odd part of the question too.  The one Latency the
platform describes here, FU21 0x10, is a DisCo constant that the driver
cannot reach, and the other twenty are placeholders in the defaults
table; if nobody wants a Latency, the answer is not to make them
readable but to stop describing them.  So in the next revision of

  [PATCH v2 2/2] ASoC: tas2783-sdw: do not cache read-only Controls
  Message-ID: <20260814094000.22118-3-andrey.golovko@gmail.com>

the twenty Latency entries leave tas2783_reg_default[] rather than
becoming volatile, and no case is added to tas2783_sdca_mbq_size() for
FU21 0x10.  The same for the XU22 id and version, per your answer on the
Extension Unit.

> all volatile registers should be handled as such with no defaults...

That is exactly the shape of the patch, and the placeholders are wrong
in both directions on this part.  Measured over the bus on an ASUS
ProArt PX13, both amplifiers, Function powered (PDE23 requested and
actual both PS0):

  PDE23 Actual Power State    table 0x3 (PS3)   device 0x0 (PS0)
  SAPU29 Protection Status    table 0x0         device 0x3

With the Controls cached, a regmap read answers the table in both cases,
i.e. the opposite of the device state.  With them marked volatile and
their entries dropped, the read reaches the peripheral and matches the
bus.  I have been running that patch here since mid-August: calibration
values read back byte for byte identical to a kernel without it, and
nothing else in the driver reads those Controls at all.

> that points to an unimplemented register...

It is implemented, and the sync failure turns out not to be about that
Control at all.  Measured on both amplifiers of an ASUS ProArt PX13,
7.2.0-rc6 plus for-next and the read-only Control series:

  - FU23 Mute of channel 0, 0x40400108, reads 0x0 and accepts writes both
    over the bus and through the regmap, with the Function in PS0 and in
    PS3.  The Mute of channel 1 reflects what tas_fu23_event() writes.
    2000 back-to-back writes of either: no error.

  - What misled me in the trace I posted in August [2] is that
    trace_regmap_reg_write() fires only when the write returned 0.  The
    last address in the trace is therefore the last *successful* write,
    not the failing one.  The write that fails is the next one the sync
    performs: the PDE23 Requested Power State, 0x40400608.

  - PDE23 on its own is fine: 12000 writes of PS0, back to back and
    spaced apart, no error.

  - What breaks it is the write immediately before it.  regcache_sync()
    writes, in address order, the registers whose cached value differs
    from the table default - 13 of them here - which ends the firmware
    block with 0x0080042b and then requests the power state.  Replaying
    that sequence with plain sdw_write_no_pm(): the PDE23 write is
    answered COMMAND_IGNORED 268 to 278 times out of 300.  The same
    sequence started at the FU23 Mute, i.e. without the firmware block:
    no errors at all.

  - Narrowed to one register and one delay, 300 iterations each,
    same result on both amplifiers:

      0x0080042b then PDE23, no delay       300/300 ignored
      0x0080042b then PDE23, 50 us          299/300, 300/300
      0x0080042b then PDE23, 200 us         221/300, 227/300
      0x0080042b then PDE23, 1 ms             0/300
      0x0080042b then FU23 Mute               0/300
      0x0080042b then PPU21 0x10              0/300
      0x00800418 then PDE23                   0/300

    So a write to book 0, page 8, register 0x2b - the last byte of the
    32-bit value at 0x28, which both tas2783_init_seq[] and the sync
    write - leaves the Power Domain Entity refusing a power state
    request for something under a millisecond.  Nothing else is refused,
    and no other register of that block has the effect.

  - It does not latch: after the sequence, 500 lone PDE23 writes all
    succeed.

That explains the failure rate too - regcache_sync() aborted in 10 of 20
attempts in one run and 4 of 20 in another, which is what a sub-
millisecond window looks like from the outside.  And it explains why
tas2783_init_seq[] never trips over it: the init writes the same four
registers and then the FU23 Mute, not the power state.

So my August description of this - "the sync dies at the FU23 Mute of
channel 0" - was wrong in both halves, and I would rather correct it
here than leave it in the archive.  The Mute is implemented, and the
sync dies at the power state request that follows the firmware block.

Two questions to TI, then.  What is book 0 page 8 register 0x28, and
does the part require a delay or a status poll after that value is
written?  And is a Power Domain Entity expected to answer
COMMAND_IGNORED to a Requested Power State write while it is busy?  If
it is, then every driver path that writes PDE23 should retry rather than
propagate -ENODATA - including tas_port_prep() as it stands after
119046319e77, which fails the port preparation on the first refusal.

Independently of the answer, the sync should not be writing those
firmware registers at all: they are device state written by the
downloaded firmware, they sit in tas2783_reg_default[] with table
values, and Ville reported earlier that a sync puts the table values
back over what the firmware wrote.  The FU23 Mute entries are a separate
question - what is their reset value, and should they be in the defaults
at all?

> XU stands for eXtension Unit, it's where all the secret-sauce is
> handled. In practice this is what's used for firmware download. As long
> as the firmware download works I wouldn't spend time looking at this.

Understood - firmware download works here, so I will leave XU22 alone.

> this has been addressed in multiple threads. the short story is that we
> stick to this simple_ch_prep_sm mode.

Fine by me; the driver-side fix in 119046319e77 does not depend on it.
It only means a port that fails to prepare stays silent, so I will keep
that in mind when reading future reports rather than proposing to change
the property.

> possibly. In general, ports and functions are not really at the same
> level and there's no reason why the two are linked. [...] TBD with TI if
> they need a symmetry for the power-down.

Then I will leave the power-down where it is and let TI say whether they
want it in POST_DEPREP; the patch is two lines whenever they do.

[2] Message-ID: <20260813213000.13990-1-andrey.golovko@gmail.com>

Thanks,
Andrey
