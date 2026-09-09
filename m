Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FDC39A4DF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980002; cv=pass; b=JfISiQ267AVgJgkRl+gG5iIUBsT8YO8/c3x9pVSb+raPhvjy5LigwC27tgVxT2ZaVzGJ+DxmvtnqNERt422RPi/9wSyjaQ3D9uKGDDyN0Jgz9tFXFqQIYrKxekjZlOY3y+bcOjiRQIm2BSEAxBKJ8Og+wXO3daybLFG+SxH5JEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980002; c=relaxed/simple;
	bh=FNubIDG5wgFUsm/iu7cCt3VMMPE4VLZLAfc5C4LLUZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkTvMGVcQ0UEg4/sjzys9FKEhKrtmBF9AHv4tJM5jsRyTS5dnKoxGGhCVfKHRZeBH0XygLbAtulUoOpCqj+bpNrXpcX3p80PI+WOPEPrBtvOsvuNvbhmyvLRu8iUEP7f0Koc9qZIRIufgFwk+cSthKFUYgsH0nvJ6EorPCOFHw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzNZiiCU; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzNZiiCU"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1504170a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788980000; cv=none;
        d=google.com; s=arc-20260327;
        b=BtTanV11WYG6exX9riChNLdvt8Zy+sqjiTGDaS0e/A5xYfotJRcLhhhYCy6eQCbJ32
         JKA4ZZxiC01KKQx8VM57rhQcdDUNn49mbIkAxOvyPxqPoTf1x+oGV1b9oey42n6epPfN
         mLpaMg7LZk40lSK7h76x/WHmWuaR7wA8L3N0pUx0t4QqmcPNAMqFB/LfxVQcywNr1FFW
         +5Yl0JyeByEcR1BffvioYylb+jnp/ncSHnfXY464B+9kaf438AaH2W4e4Vii6V87dBxj
         exF1YehHfQkr0DE5dGst89NZoGxjTfV6kER4+k3ZaiwMq9QYMOKXz+Xk1RmqdaG/q/Pg
         IOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7bo8j7urNEoHfAQCdX/pGIDDKawq9OM4TCkZUvTILLI=;
        fh=SGOoNgmsNNZWRANQp724i15W1arYgCe0fOsK90O9Lrs=;
        b=r7jX1KPn+kWF9bHZs8G7LKCADbCs2mzNz6bbHybiHvxptvOzTJzY+S9Yvfis1YEs7k
         1lFyrXdXxmqutKzDSXDHPmUgBKga0GrlJvO4aQfj2nEkW3VkDlhx1v59aq9yXkKC0ug1
         uIcgIj3ZccgB/BSsVkx7wYnQqnmWIAvcFueMdfPqQevqQFuR+ClcwzP73kYYw7qzMh7P
         fMb4ZpUrmhCgwiqlPV/fD4EMf9wUUF9pqU3twziILLOaI5YYkJKL3M91Zf8p+ZbjHwBI
         0YXJA8jZR+M3QoyeQGjr9xHiGrmKeEKdoi47o4HehFVN7SWz3paVeRR+prYw3iEGRb3V
         Mttw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788980000; x=1789584800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7bo8j7urNEoHfAQCdX/pGIDDKawq9OM4TCkZUvTILLI=;
        b=qzNZiiCUGGLdZgzl+M1ZIsBs5RkUnlH4xqVwUcQNg67IFb4ASz3jdMfUW3oJ6irngs
         B8kQdLcNBCkpTire1nm/o1UiI0L4us30n8hsLtXFFnfOFVKLJrhZsMQ58XM3sgWEXe5Z
         NztFX6oDXys+pnfw/UBobwDioSMtNMEnYWMYeYME9qABZ/oA/AGXgu/ZfByDR4PrGQmH
         GUwXiA8QK56B3va61QX83665kNGpZHieb5lUDrCA/I8ghqDVHx4S6xiUV1yYs3lUt0ue
         uyL60awhY59jCA6SUUGcUhiec10FUJQ55cOF9XnG7eUWjC873szBVrRJ89gffGvvlW4N
         Lt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788980000; x=1789584800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7bo8j7urNEoHfAQCdX/pGIDDKawq9OM4TCkZUvTILLI=;
        b=dxjdk6A8+7u5/LX8YkfhlrKQewLVCDdd5/3Bj5Q9030eaMCzfG8ZoSfFRZ/M1P4iG4
         SKSJkpanMuRxjlwAHEV/6nEDPlmKS0ANa4d/BSw6cSMn2+FmAss2IvU06fp04jVUt+j3
         62hcvJJdBGfu3XHTQHtsXwcAeiv0+rwiBxqR3WeBQNhMiqEqgCIO7mnPC6sEjRgYATas
         TynWtBNWMOoeseNl0e9w0CSSj9ky30RaOeZdUbQOR311tvpo24M8P5rqjvaVJr5LWw01
         jVApVrzOe2LtTIsZYRvyv6cwBidvrtogLPUp1oaazvmN7RBfiALx0Ewn9KFwNNxUq0BC
         tP3w==
X-Forwarded-Encrypted: i=1; AKwUvBxWYs1b2gg49nKy9+HOBy80g5CdEprYciimvwwjnOZku4OBTyzWCA7qY2MEY+Lsai6ang2rK2wEwYVwQtY=@vger.kernel.org
X-Gm-Message-State: AFuF++kgshHrb6kjpsHaiU9yozLLu97xV9x2ShEJOpyjveVlycdmnxU2
	U6eoc1f9BBeun9sFK4tB81k6KqwQxvXYLV32OOlGIQRXF7iJZqwldNmj6s0T16iUWGj4qx+LzAI
	dUwWYoUlE9KvX5S70UJ8SjC02fgtO8Nw=
X-Gm-Gg: AYBFou2n1PAvZu5/F1gdQqD3Z+kj+vejy36I1ux6iefwegsNs+NGyTD9YtBWJMcZzCO
	m5A0MhxrKlavooOFljn5TOjH95rGRGvB3kkZDAQgpOhki7dvxNqwxT7KC4RjIwuBrVHhfy/T8yT
	xqFcEyXX18g47T47NGFNwnLoL5Fg79ZbhFyxEV2f0spnff2Q4ORWeiIRx1NLdvJJT8YNXDLEPlV
	V6qlp92MILAff2QGmySnHD1xyCUgf/KfxlPNZA2Bnsm3IbppbBZCqiMYVWZkeH2KquTSJgfl1/S
	+oOa5pu1u63tDfZfmXnx5PvqKY/Zg1GbefdTk7PGWwfoUseet/he4Rg=
X-Received: by 2002:a17:90a:d60b:b0:390:8361:a532 with SMTP id
 98e67ed59e1d1-39bac197a01mr11334339a91.7.1788979995203; Wed, 09 Sep 2026
 11:53:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com> <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com> <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
 <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com>
In-Reply-To: <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com>
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Wed, 9 Sep 2026 21:53:02 +0300
X-Gm-Features: AcwNN1WyFY0fAsZyxA6XpDPpJiG7oVialU5cQVBbdZKEm-JcW7XTiHEKU2uS00U
Message-ID: <CAAAbPi42OGPN2ctOpa0VKZP6xKvG12tO6s4u44sDnz+gvJ+diw@mail.gmail.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Jack Yu <jack.yu@realtek.com>
Cc: Syed Saba Kareem <syed.sabakareem@amd.com>, "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, 
	"Flove(HsinFu)" <flove@realtek.com>, 
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>, 
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "broonie@kernel.org" <broonie@kernel.org>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Fish690103 <fish690103@realtek.com>, 
	=?UTF-8?B?TWlrZSBMaW4gKOael+abieiDvSk=?= <mikelin@realtek.com>
Content-Type: multipart/mixed; boundary="0000000000001ff374065b115d23"

--0000000000001ff374065b115d23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jack,

Done.

I completely removed the "Update preset for all functions" patch and
rebuilt the RT721 module. The test kernel now contains only:

ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
a20afec40ea1012659861e58374c1bcde2e18a43

I attached the four requested register dumps:

* speaker-sdw.txt
* speaker-mbq.txt
* headphone-sdw.txt
* headphone-mbq.txt

For the speaker dumps, I used direct playback on:

hw:CARD=3Damdsoundwire,DEV=3D2

For the headphone dumps, headphones were connected and playback was running=
 on:

plughw:CARD=3Damdsoundwire,DEV=3D0

Playback was kept running continuously until both the normal SDW and
MBQ register dumps had completed.

The two dumps for each scenario were captured immediately one after
the other while playback was still active.

Please let me know if you would like any additional register dumps or tests=
.

Thanks,
Cristian

On Wed, Sep 9, 2026 at 11:21=E2=80=AFAM Jack Yu <jack.yu@realtek.com> wrote=
:
>
> Hi Cristian,
>
> Please don't use "Update preset for all functions" patch and still keep b=
elow patch
>
> ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
> a20afec40ea1012659861e58374c1bcde2e18a43
>
> after above steps, please dump the registers in below path during playbac=
k for both scenarios (speaker playback and headphone playback).
>
> /sys/kernel/debug/regmap/<sdw addr>/registers
> /sys/kernel/debug/regmap/<sdw MBQ-addr>/registers
>
> Our FAE will also try to borrow devices from ASUS for further debugging.
>
> Regards,
> Jack
>
> > -----Original Message-----
> > From: Cristian Timohi <cristiantimohi@gmail.com>
> > Sent: Wednesday, September 9, 2026 4:50 AM
> > To: Jack Yu <jack.yu@realtek.com>
> > Cc: Syed Saba Kareem <syed.sabakareem@amd.com>; Mukunda,Vijendar
> > <vijendar.mukunda@amd.com>; Flove(HsinFu) <flove@realtek.com>;
> > venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Oder Chiou
> > <oder_chiou@realtek.com>; vkoul@kernel.org;
> > yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
> > broonie@kernel.org; lgirdwood@gmail.com; linux-kernel@vger.kernel.org;
> > Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>; Fish690103
> > <fish690103@realtek.com>; Mike Lin (=E6=9E=97=E6=9B=89=E8=83=BD) <mikel=
in@realtek.com>
> > Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA
> > speakers silent and headphone jack buzzes on playback
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > Hi Jack, Vijendar, all,
> >
> > I tested both Realtek changes on the ASUS TUF Gaming A14 FA401EA (BIOS
> > FA401EA.304).
> >
> > For reference, audio works correctly under the factory-installed Window=
s 11 on
> > this exact hardware: both the internal speakers and the
> > 3.5 mm headphone output worked normally.
> >
> > Test kernel:
> >
> > current torvalds/linux master
> > HEAD before the test: 5acbae5f7
> > a20afec40ea1 cherry-picked
> > local kernel: 7.3.0-rc2-fa401ea-rt721+
> > Speaker fix: a20afec40ea1
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > I first tested only:
> >
> > ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
> > a20afec40ea1012659861e58374c1bcde2e18a43
> >
> > Unfortunately, the internal speakers remain completely silent.
> >
> > Direct ALSA playback on the SmartAmp PCM opens and runs normally:
> >
> > speaker-test
> > -D hw=3Damdsoundwire,DEV=3D2
> > -c 2 -r 48000 -F S16_LE -t wav
> >
> > There are no relevant RT721/SoundWire errors during playback, but there=
 is no
> > physical speaker output.
> >
> > So a20afec40ea1 alone does not fix the speaker issue on this FA401EA un=
it.
> >
> > "Update preset for all functions" patch
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > I then applied Jack's:
> >
> > 0001-ASoC-rt721-sdca-Update-preset-for-all-functions.patch
> >
> > The patch applies cleanly on top of the above kernel.
> >
> > With the patch unmodified, however, both playback paths fail to open wi=
th
> > -ENODATA.
> >
> > The RT721 remains attached:
> >
> > sdw:0:1:025d:0721:01: Attached
> >
> > but dmesg reports:
> >
> > rt721-sdca sdw:0:1:025d:0721:01: Defer on undeferrable control: 5810100
> > rt721-sdca sdw:0:1:025d:0721:01: Defer on undeferrable control: 5810100
> > rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
> > snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
> > SDW1-PIN1-PLAYBACK-SmartAmp: ASoC error (-61): at __soc_pcm_open() on
> > SDW1-PIN1-PLAYBACK-SmartAmp
> >
> > The same runtime PM error also occurs for the SimpleJack playback path.
> >
> > I traced this to the new write in rt721_sdca_jack_preset():
> >
> > regmap_write(rt721->mbq_regmap, 0x5810100, 0x8021);
> >
> > Experimental 0x5810100 -> 0x5810000 test
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > As a local experiment only, I changed that single write from:
> >
> > regmap_write(rt721->mbq_regmap, 0x5810100, 0x8021);
> >
> > to:
> >
> > regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);
> >
> > This restores normal PCM opening. The -61 / "Defer on undeferrable
> > control: 5810100" messages disappear completely.
> >
> > With this experimental change and the rest of the preset patch unchange=
d:
> >
> > Internal speakers:
> >
> > PCM opens and streams normally
> > still completely silent
> >
> > 3.5 mm headphones:
> >
> > PCM opens and streams normally
> > no intelligible audio is produced
> > importantly, the previous buzzing noise is now gone
> >
> > I also repeated the zero-PCM test:
> >
> > timeout 10s bash -c '
> > dd if=3D/dev/zero bs=3D192000 2>/dev/null |
> > aplay -D hw=3Damdsoundwire,DEV=3D0
> > -t raw -f S16_LE -r 48000 -c 2
> > '
> >
> > Previously this caused continuous buzzing while the playback path was a=
ctive.
> >
> > With the new preset patch plus the experimental 0x5810100 -> 0x5810000
> > change, the headphone output is completely silent during zero-PCM
> > playback: no buzz, but also no audio during normal playback.
> >
> > Summary
> >
> > a20afec40ea1 only:
> >
> > speakers: silent
> > headphone behavior unchanged
> >
> > a20afec40ea1 + preset patch as provided:
> >
> > RT721 stays Attached
> > playback cannot open
> > 0x5810100 causes -ENODATA / runtime PM failure
> >
> > a20afec40ea1 + preset patch + experimental 0x5810100 -> 0x5810000:
> >
> > PCM playback works again
> > speakers remain silent
> > headphones remain silent
> > previous headphone buzz is eliminated
> > no relevant RT721/SoundWire errors in dmesg
> >
> > It therefore looks like the new preset does affect the analog headphone=
 state
> > on this hardware, since it removes the buzzing, but the codec still doe=
s not
> > produce actual audio.
> >
> > Please let me know if you would like me to test different register valu=
es or
> > provide register/debug dumps from this state.
> >
> > Bugzilla:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D221958
> >
> > Thanks,
> > Cristian
> >
> > On Fri, Sep 4, 2026 at 9:01=E2=80=AFAM Jack Yu <jack.yu@realtek.com> wr=
ote:
> > >
> > > Loop more
> > >
> > > Hi Mukunda,
> > >
> > > Regarding to speakers silent issue, a patch has been merged as below
> > >
> > > [1/1] ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
> > >       https://git.kernel.org/broonie/sound/c/a20afec40ea1
> > >
> > > and for headphone buzzes issue on playback, could you merge the attac=
hed
> > patch and check if buzzes issue can be fixed?
> > >
> > > Regards,
> > > Jack
> > >
> > > > -----Original Message-----
> > > > From: Syed Saba Kareem <syed.sabakareem@amd.com>
> > > > Sent: Thursday, September 3, 2026 4:41 PM
> > > > To: Mukunda,Vijendar <vijendar.mukunda@amd.com>; Cristian Timohi
> > > > <cristiantimohi@gmail.com>; Jack Yu <jack.yu@realtek.com>;
> > > > Flove(HsinFu) <flove@realtek.com>
> > > > Cc: venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Ode=
r
> > > > Chiou <oder_chiou@realtek.com>; vkoul@kernel.org;
> > > > yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
> > > > broonie@kernel.org; lgirdwood@gmail.com;
> > > > linux-kernel@vger.kernel.org; Dommati, Sunil-kumar
> > > > <Sunil-kumar.Dommati@amd.com>
> > > > Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14
> > FA401EA
> > > > speakers silent and headphone jack buzzes on playback
> > > >
> > > >
> > > > External mail : This email originated from outside the organization=
.
> > > > Do not reply, click links, or open attachments unless you recognize
> > > > the sender and know the content is safe.
> > > >
> > > >
> > > >
> > > > On 9/3/26 11:11, Mukunda,Vijendar wrote:
> > > > >
> > > > >
> > > > > On 9/2/26 22:13, Cristian Timohi wrote:
> > > > >> [You don't often get email from cristiantimohi@gmail.com. Learn
> > > > >> why this is important at
> > > > >> https://aka.ms/LearnAboutSenderIdentification ]
> > > > >>
> > > > >> ****
> > > > >> Resending as plain text, as the previous message was rejected by
> > > > >> the vger.kernel.org mailing list due to an HTML MIME part.
> > > > >> Apologies to recipients who received the previous copy directly.
> > > > >> ***
> > > > >>
> > > > >> Hello,
> > > > >>
> > > > >> I'm reporting an audio issue on an ASUS TUF Gaming A14 FA401EA
> > > > >> (Ryzen AI MAX+ 392) using AMD ACP70 SoundWire and a Realtek RT72=
1
> > > > >> SDCA codec.
> > > > >>
> > > > >> I have reproduced the issue on a clean current vanilla 7.3-rc1
> > > > >> kernel, so this does not appear to be Fedora-, PipeWire-, or
> > > > >> desktop-specific.
> > > > >>
> > > > >> Current clean test environment
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Distribution:
> > > > >>      Fedora 45
> > > > >>
> > > > >> Kernel:
> > > > >>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
> > > > >>
> > > > >> snd_acp_sdw_legacy_mach quirk:
> > > > >>      -1
> > > > >>
> > > > >> There are no remaining custom snd_acp_sdw_legacy_mach/modprobe
> > > > >> overrides in the current reproduction environment.
> > > > >>
> > > > >> Hardware
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Laptop:
> > > > >>      ASUS TUF Gaming A14 FA401EA
> > > > >>
> > > > >> DMI product:
> > > > >>      TUF Gaming A14 FA401EA
> > > > >>
> > > > >> DMI board:
> > > > >>      FA401EA
> > > > >>
> > > > >> BIOS:
> > > > >>      FA401EA.304
> > > > >>
> > > > >> CPU/APU:
> > > > >>      AMD Ryzen AI MAX+ 392
> > > > >>
> > > > >> Audio:
> > > > >>      AMD ACP70 SoundWire
> > > > >>      Realtek RT721 SDCA
> > > > >>
> > > > >> The SoundWire bus exposes one peripheral:
> > > > >>
> > > > >>      sdw:0:1:025d:0721:01: Attached
> > > > >>
> > > > >> I do not see TAS2783 devices enumerated on this unit.
> > > > >>
> > > > >> Known-good cases
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> The laptop's built-in speakers worked correctly under the
> > > > >> factory-installed Windows 11.
> > > > >>
> > > > >> USB audio also works correctly under Linux. I tested Corsair
> > > > >> Virtuoso USB headphones and normal audio playback works.
> > > > >>
> > > > >> Therefore the issue appears specific to the internal AMD ACP70 -=
>
> > > > >> SoundWire -> RT721 audio path.
> > > > >>
> > > > >> Actual behavior
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Internal speakers:
> > > > >>      Completely silent.
> > > > >>
> > > > >> 3.5 mm headphone jack:
> > > > >>      No intelligible audio is produced.
> > > > >>      When the analog audio path becomes active, the headphones
> > > > produce
> > > > >>      a continuous buzzing noise. The buzz stops when the
> > playback/path
> > > > >>      is deactivated.
> > > > >>
> > > > >> Opening the desktop sound control panel can also trigger the
> > > > >> buzzing while the analog audio path is active.
> > > > >>
> > > > >> ALSA playback devices
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> The amd-soundwire card exposes:
> > > > >>
> > > > >>      device 0:
> > > > >>      SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
> > > > >>
> > > > >>      device 2:
> > > > >>      SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
> > > > >>
> > > > >> Direct ALSA reproduction
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > >>
> > > > >> Internal speakers:
> > > > >>
> > > > >>      speaker-test -D hw:CARD=3Damdsoundwire,DEV=3D2 \
> > > > >>          -c 2 -r 48000 -F S16_LE -t wav
> > > > >>
> > > > >> The PCM stream starts normally without an ALSA error, but there
> > > > >> is no physical speaker output.
> > > > >>
> > > > >> Analog headphones:
> > > > >>
> > > > >>      aplay -D plughw:CARD=3Damdsoundwire,DEV=3D0 \
> > > > >>          /usr/share/sounds/alsa/Front_Left.wav
> > > > >>
> > > > >> No speech is heard. The headphone output only buzzes while the
> > > > >> audio path is active.
> > > > >>
> > > > >> Zero-PCM test
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> I also sent only zero-valued PCM samples:
> > > > >>
> > > > >>      timeout 10s bash -c '
> > > > >>      dd if=3D/dev/zero bs=3D192000 2>/dev/null |
> > > > >>      aplay -D hw:CARD=3Damdsoundwire,DEV=3D0 \
> > > > >>            -t raw -f S16_LE -r 48000 -c 2
> > > > >>      '
> > > > >>
> > > > >> The headphone jack still buzzes while the zero-PCM stream is act=
ive.
> > > > >>
> > > > >> Therefore the buzz does not appear to represent corrupted
> > > > >> application audio; merely activating playback is sufficient to p=
roduce it.
> > > > >>
> > > > >> Mixer / UCM
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Speaker:
> > > > >>
> > > > >>      Speaker Switch =3D on
> > > > >>      rt721 FU06 Playback Volume =3D 87,87
> > > > >>
> > > > >> Headphones:
> > > > >>
> > > > >>      Headphone Switch =3D on
> > > > >>      rt721 FU05 Playback Volume =3D 87,87
> > > > >>
> > > > >> I also explicitly enabled the corresponding Speaker and
> > > > >> Headphones UCM devices. This did not change the result.
> > > > >>
> > > > >> ASoC DAPM during speaker playback
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> I inspected debugfs while speaker-test on the SmartAmp PCM was
> > > > >> actively running.
> > > > >>
> > > > >> All relevant widgets were ON:
> > > > >>
> > > > >>      Speaker: On
> > > > >>      rt721 DP3 Speaker Playback: On
> > > > >>          stream DP3 Speaker Playback active
> > > > >>      rt721 DP3RX: On
> > > > >>      rt721 FU 21: On
> > > > >>      rt721 FU 23: On
> > > > >>      rt721 PDE 41: On
> > > > >>      rt721 SPK: On
> > > > >>
> > > > >> The DAPM graph therefore appears to activate the entire expected
> > > > >> speaker path:
> > > > >>
> > > > >>      DP3 Speaker Playback
> > > > >>        -> DP3RX
> > > > >>        -> FU 21 / FU 23
> > > > >>        -> SPK
> > > > >>        -> Speaker
> > > > >>
> > > > >> but the physical speakers remain silent.
> > > > >>
> > > > >> Kernel messages
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> RT721 attaches successfully.
> > > > >>
> > > > >> I see:
> > > > >>
> > > > >>      rt721-sdca sdw:0:1:025d:0721:01:
> > > > >>      Driver needs fixing: Unsorted reg_defaults, sorting the cop=
y
> > > > >>
> > > > >> On an earlier 7.2.x boot I also observed:
> > > > >>
> > > > >>      soundwire sdw:0:1:025d:0721:01:
> > > > >>      PARITY error detected before INT mask is enabled
> > > > >>
> > > > >> I did not observe additional SoundWire/RT721 errors when startin=
g
> > > > >> or stopping playback.
> > > > >>
> > > > >> Kernels tested
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> The same issue was reproduced on:
> > > > >>
> > > > >>      Fedora 44:
> > > > >>      7.2.2-300.fc44.x86_64
> > > > >>
> > > > >>      Fedora 45:
> > > > >>      7.2.2-300.fc45.x86_64
> > > > >>
> > > > >>      Vanilla mainline:
> > > > >>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
> > > > >>
> > > > >>      CachyOS kernel:
> > > > >>      7.2.2-cachyos1.fc45.x86_64
> > > > >>
> > > > >> The current reproduction is on the clean vanilla 7.3-rc1 kernel.
> > > > >>
> > > > >> Previous experiments
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Before testing clean mainline, I also built a Fedora 7.2.2 kerne=
l
> > > > >> locally and experimentally changed the RT721 speaker endpoint in=
:
> > > > >>
> > > > >>      sound/soc/amd/acp/amd-acp70-acpi-match.c
> > > > >>
> > > > >> from:
> > > > >>
> > > > >>      .aggregated =3D 0
> > > > >>      .group_id =3D 0
> > > > >>
> > > > >> to:
> > > > >>
> > > > >>      .aggregated =3D 1
> > > > >>      .group_id =3D 1
> > > > >>
> > > > >> This did not change the behavior.
> > > > >>
> > > > >> I also tested that custom kernel with:
> > > > >>
> > > > >>      options snd_acp_sdw_legacy_mach quirk=3D32768
> > > > >>
> > > > >> The kernel reported:
> > > > >>
> > > > >>      amd_sdw amd_sdw: Overriding quirk 0x1 =3D> 0x8000
> > > > >>
> > > > >> but there was still no speaker output.
> > > > >>
> > > > >> Those experimental overrides have been removed. The current
> > > > >> vanilla
> > > > >> 7.3-rc1 reproduction uses quirk=3D-1 and no custom modprobe opti=
ons.
> > > > >>
> > > > >> Question
> > > > >> =3D=3D=3D=3D=3D=3D=3D=3D
> > > > >>
> > > > >> Could this FA401EA variant require a different RT721-only
> > > > >> topology,
> > > > >> ACP70 configuration, SoundWire setup, or codec initialization qu=
irk?
> > > > >>
> > > > >> The fact that all-zero PCM causes the analog headphone output to
> > > > >> buzz while the stream is active may be particularly relevant.
> > > > >>
> > > > >> I'm happy to test patches or provide register/debug output.
> > > > >>
> > > > >> I can also provide full alsa-info, kernel journal, lspci output,
> > > > >> SoundWire sysfs state, mixer state, and DAPM debugfs output.
> > > > >
> > > > > Could you please log a Bugzilla ticket adding ACPI dump, dmi
> > > > > information and along with alsa info output?
> > > > ++RTK Team
> > > >
> > > > Similar kind of issue reported in another mail thread, realtek is w=
orking on
> > it.
> > > >
> > > > @jack could you please comment on it.
> > > >
> > > > >>
> > > > >> Thank you.
> > > > >> Cristian
> > > > >

--0000000000001ff374065b115d23
Content-Type: application/zip; name="rt721-regdump.zip"
Content-Disposition: attachment; filename="rt721-regdump.zip"
Content-Transfer-Encoding: base64
Content-ID: <f_mtugh6ks0>
X-Attachment-Id: f_mtugh6ks0

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
--0000000000001ff374065b115d23--
