Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C692F3A3E95;
	Sun, 30 Aug 2026 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788079516; cv=none; b=dXnrVDhW99XGBez5qryY/N4hzogIOl/RzctFwKP3+zHTH1GGbbrBwU/TOHOnwKqZ9fwu0r+j5nN3LCc0B00RtQZAPgZjZKWwwTU1MN6PzqfxyUZHoznfRV2k7HRpxsLPOq+vSuezQlA0oa3pxXvKujfuCSIfm0XrEzt5VkU6wUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788079516; c=relaxed/simple;
	bh=oMbdaGssG4xLec/C7sP7gfeHj7IYkIHCOIuazq0DlK8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jwg2H2kmO1oekn1bJpkH9GCf7Pn5fXmoYxqwaQZb5prlExTZ64qp7mOZ02P3M0tTWRrQ0k4MvyvOZeHTedNED9vLy1G/RA433mkvENyOuoeek/OZBZQxxeQFad7rPUKSrfuLcHIXgX2vqIgKnMzIZG6U8cyd98No2vF8yl4bYiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Aj2KmsKO; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Aj2KmsKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788079504; x=1788338704;
	bh=VQuZrL9tYP1ll7s2GZjmBwAqU92kogAQ7645xNfoU2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Aj2KmsKO1JK/MKMeZMaR41s8HB3CZZCSEZiYvfo/Hy3pwo9+TY7Ms73wv+X//hhWR
	 Llm7sYSvvN2jIHWhNCP/jAS9HKt8UpEW6uGrNAhIXvGn6lmBW7U9ztPQgYE5ysqF0L
	 MZ7Phdrace8G/Xz6KtantkqxE/WCnta2skRLqB53aDMGLvDcpVTtt8nUNZH2RV6lMH
	 ip2mIjbu0BUfGqOkIQ6b2QSjHm3TzccyYqsg21YG0oqddNRQFub8LiAeonLrAu1hOX
	 6CspCkJuGKetAfPVkUdlBSys2i2pYuew7bMHLOlnaf3NP1DSpGsmPs32hj+zCqtknv
	 ns8jWiSCm+ENQ==
Date: Sun, 30 Aug 2026 08:44:58 +0000
To: Bard Liao <bard.liao@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: sdw_utils: skip endpoints of a peripheral that is not on the bus
Message-ID: <20260830084446.6092-1-lsa.uz@pm.me>
In-Reply-To: <SJ2PR11MB8424F459A22A44CAFA9C9EBBFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260804225853.31585-1-lsa.uz@pm.me> <20260804225853.31585-3-lsa.uz@pm.me> <SJ2PR11MB84240C52AC5C4DB36B92AACCFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com> <7be50891-3861-418d-8237-5340a80b9159@linux.dev> <SJ2PR11MB8424F459A22A44CAFA9C9EBBFFD32@SJ2PR11MB8424.namprd11.prod.outlook.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 5bccdf5e366e582773040a2ec79dfa7b9a2d26aa
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sorry for the long silence - I did not have access to the hardware until
now. Thank you both for the review; it changed the shape of the fix for
the better.

> > Why not just remove SWRA from the BIOS?
>
> Or add a quirk in drivers/soundwire/dmi-quirks.c to skip this SWRA
> device entirely, this has been the direction so far to ignore 'ghost'
> devices.
>
> It's much safer IMHO than trying to detect if a device is physically
> present or not.

Agreed, and it works. I have tested it on the machine and it is good
enough: one quirk replaces both 2/3 and 3/3, so v2 is two patches
instead of three, and nothing has to guess at runtime whether a device
is present.

With the ghost's _ADR remapped to zero, sdw_acpi_find_slaves() never
creates the peripheral:

  # ls /sys/bus/soundwire/devices/
  sdw-master-0-0
  sdw:0:0:025d:1320:01        <- only the real one now

and everything downstream falls out:

  - amplifier is named "rt1320-1", so the stock sof-soundwire UCM
    profile addresses the device that is actually there
  - no -EEXIST, no -61 link startup errors, card registers cleanly
  - 4 playback + 1 capture, speakers audible, internal mic captures
  - no local UCM, PipeWire or WirePlumber configuration

On the BIOS question: the firmware is Microsoft's, signed, and updated
through Windows Update. The defect is present in the current November
2025 bundle and on every unit shipped so far, so I have no way to have
SWRA removed at the source.

> Not sure if it is the case, but it is possible that the SKU has
> different rt1320 versions depending on when was the device
> manufactured. Hope they use different SKU values with different
> rt1320 versions.

Good point, and it is a real hazard: the remap keys on the full 64-bit
_ADR, whose version nibble is part of the match. A batch with a
different RT1320 version would not match - harmless - but if such a
batch ever reported class 0 as the real part, a name-keyed quirk would
remove the working device and leave the ghost.

v2 therefore matches on the product SKU rather than the product name,
following dell_sku_0A3E above it:

  DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
  DMI_EXACT_MATCH(DMI_PRODUCT_SKU,
                  "Surface_Pro_11th_Edition_With_Intel_For_Business_2103")

That keeps the remap to the hardware it was verified on. If other SKUs
turn out to need it, they can be added as they are reported, which is
also how we would find out whether the versions do differ.

On the other review point, for completeness:

> Not sure if it is true. AFAIK, Realtek has a few codecs with the same
> part ID and different class ID and they are different codecs.

Understood - and it no longer matters, because the patch that assumed
otherwise is dropped in v2. The quirk claims nothing general about class
ids; it says only that on this SKU this specific _ADR is a ghost, which
is the one thing I have actually verified.

One correction I owe you, because I told you the opposite in the v1
cover letter. About the DAI link name collision I had written a fourth
patch for and then dropped, I said:

  "With 2/3 applied the phantom's endpoints never reach the naming code,
   so that collision is no longer reachable on this machine and we
   cannot demonstrate it."

That was wrong. While testing v2 I had a boot where the quirk did not
take effect, and the machine failed exactly there:

  sysfs: cannot create duplicate filename
    '/devices/pci0000:00/0000:00:1f.3/sof_sdw/SDW0-Capture-SmartMic'
  kobject_add_internal failed for SDW0-Capture-SmartMic with -EEXIST,
    don't try to register things with the same name in the same directory
  sof_sdw sof_sdw: probe with driver sof_sdw failed with error -12

So the collision is reachable, reproducible and fatal whenever a ghost
declaring a duplicate function reaches create_sdw_dailink(). The quirk
does not fix that; it only removes this particular ghost before the
naming code sees it. create_sdw_dailink() still builds names from link
id and function type alone, so any board with two peripherals of the
same function type on one link would hit it.

I have not included a fix in v2 - with the quirk applied I cannot
reproduce it on purpose any more, and I would rather not send an
untestable patch. If you would like it addressed, I am happy to send it
separately and to describe the failure in more detail.

Testing note for v2: verified on 7.0.0-30 (Ubuntu 26.04), with the quirk
backported, because that is the kernel this machine runs. The posted
patch is against thesofproject/linux topic/sof-dev; the table entry is
identical and the mechanism it relies on is unchanged between the two
trees - slave.c drops a peripheral whose overridden _ADR is zero in
both. 1/2 is byte-identical to v1's 1/3 and unchanged since it was
tested on 7.1.0-rc7.

v2 follows this message.

Thanks again,
Sergey

