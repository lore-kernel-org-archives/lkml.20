Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9D13A0E99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337635; cv=none; b=GAfgp3k5hmokhmB2lEYeWg230D2fHTEpBy21qK1BVAvk1Al+WcS6+nop8g6EPNk2mcqwvmG17p/2ewIu/2eu8vos+qI784zbKJWtXIKTZC6ALJsW7iDqhOmm6pxQjMLZq/Ey/kfL4yrp9BaseOOA3O0pMGnN6YFkqueX3gMRhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337635; c=relaxed/simple;
	bh=jrjPUUA2r1ETwKPQ0mRIyB/3xQ1zZFrY1o9Q/YlRdDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5lQuZM/iAoLUriWwS2S4XezOvrIetLGGYbe/Pl+H6rwdRw5siINH40Qk1aTYH2E4VQon1zI8sDngkX6jK0YUH/PMh5dFJ0WZF+5pzolU8qWh+JyLdwMvZNobc4zodzyE/D6UPJG7kbWj0tzdObgk0HeexJDaJ2Ks8CdoXwY4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUEuGWRc; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUEuGWRc"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so666346e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788337631; x=1788942431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6o9j08pJkXvA1vQh7MYf49iV5TBAcZ9F0JBBeDBq+cM=;
        b=fUEuGWRc+DPij52PZggjkvQscO2Swp38ao40sWAw0rK4tuxUpsm9ic6eWS9eGKw6b8
         4JD2GOeDzpNrcSXClZoG78gQBjlkw0kzgYYlHPk+TqeKd1ZV8Cs53OGocxp0g9LhiArG
         0ipy/3sUGNiFSy0h8+8kYMjABAq9Dkeq7/CA8ZGepAQnivs+6SImCphUbtLlChZYgJe0
         FUH4B5fJ1kvsOmSZfH83SHyvuXAbdRp9/ByE45EQrF/qesUHjsFj5GoFIqcFd/GEo+F3
         rILJff2YnMPZ9TuIJw+Q44IkIibgMPKtLyIQDXls+ezl0yBNEYKXvvhVeOPm8GHLQS9y
         41JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337631; x=1788942431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6o9j08pJkXvA1vQh7MYf49iV5TBAcZ9F0JBBeDBq+cM=;
        b=BlTUaqQzJsMadK/PPYBj/lOGWI7Tt5K06zvRL1W2KCliCbuD5kA47Sg+fPVINC2ysA
         z8JvhcKHMHeETZIQlH/lSqSQ87exjkvijMoSC5TeTEDknpDQRhnnADSu0Dk3HV3IKMW+
         8heTH/vsbLqkoLsolE8ffcboR1r8qmoeWK6xfQzTAG53U4sn2KSQry3XJp80FZYBkHP5
         v+9CP7meifBdq6AOo+SbCYZWfLl4YOUk6xFb+oCiT5Kn4XTGbe9iTnysse3fwkK18vAp
         q7juB/tcIkauHbDTvYzCCHyMKi5A+X7UnPzKlWOwmpHLQ4XG2vOp2SswS47slpHP6okD
         AkLA==
X-Forwarded-Encrypted: i=1; AKwUvBw4KZwNuHQochn71V9Cvu2BcB9eWe6Vnz5wVUV/A80gGWEI9CyMLmChyu8SAHAzFOpmCFmOjbUHPSmLiW4=@vger.kernel.org
X-Gm-Message-State: AFuF++lrlFJXBfOjCIlQGMEjHwEJpNKjdI+8jTedMo5IhYLVJdgHrShM
	XRtEMSoKzAGtBk/kNIfVRUNn5h7ri5ei7/0C+oenKJ0JC0fynB6oGWjX
X-Gm-Gg: AYBFou0lJHVps/qdyuE7vynNBx7j+X8crtCIcvrqlyta4wMwasM556MouSztY4AVgAC
	2QHn4pja9Ydg/czPp/4eQXZfFVt/LODvj0N1ptDmlUZgb+4uvZD5LfEa/bvek7AsFFmAnOS06CI
	QXf809XV/7vBGjhT7seK9KTX8hL2jc2EmtFNqe8OYxdnlJDRYs3fzuJS0bPEn5fOKjYxozbAUYU
	KDvYmwVQb7x5eBEsFU4RZkggiMtFrUsz0dt6lE0pjSJ0Tp8pdcmtE7AEm/mfD5RMM8Wv7PGSMUr
	/IjCEox7Ow7zolX6j4zAD+EYsI7ZxaYeRdeIHLCZaBgxe1eanimI8zh/WPovYTzakZe6u7sSrG+
	VcCSETqU3p94iEzlvXXXeptpc06YpZTppd0qxcQP7CtMOAjXjSjiVtaL0+lUrpyUxebK2aSS+1f
	LTA9sQoRQzkEdvDL6ymVKrWDzuW62tPxKTPDYHbGtdcMS9yNPOCRKlKRZ7fIzgWKJioOkhStuyF
	r+ur6OS9P+3A4yzo8FE26o=
X-Received: by 2002:a05:6512:1252:b0:5b2:958f:8cdc with SMTP id 2adb3069b0e04-5b608344615mr1161251e87.11.1788337630616;
        Wed, 02 Sep 2026 01:27:10 -0700 (PDT)
Received: from localhost (host-80-73-162-2.rev.as20985.net. [80.73.162.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34ad015dcsm3732261fa.19.2026.09.02.01.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:27:10 -0700 (PDT)
From: Andrey Golovko <andrey.golovko@gmail.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Sen Wang <sen@ti.com>,
 "Holalu Yogendra, Niranjan" <niranjan.hy@ti.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Antoine Monnet <antoine@montane.tech>,
 Robin Everaars <robineveraars@pm.me>, Pengpeng Hou <pengpeng.hou@ti.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tas2783-sdw: drop stale regcache on uninitialized
 re-attach
Date: Wed, 2 Sep 2026 11:30:00 +0300
Message-ID: <20260902083000.9314-1-andrey.golovko@gmail.com>
In-Reply-To: <f4586bf2c7114d35b3d28e49f05f2000@ti.com>
References: <3e2751d1fb027bed0f09c88e5e56da8f@gmail.com>
 <bb5064629ada99fa5163621f72fbd27f@gmail.com>
 <f4586bf2c7114d35b3d28e49f05f2000@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Aug 24, 2026 at 11:55:35AM +0000, Xu, Baojun wrote:

> Based on my test, this modification is also needed in
> tas2783_sdca_dev_resume().

(Restoring linux-sound and the rest of the Cc list, since the patch was
posted there.)

Thank you for looking at it.  I agree the same sync is a problem there,
and the ordering makes that unambiguous: sdw_handle_slave_status() calls
the driver's update_status() callback - where the cache is now dropped
and tas_io_init() re-downloads the firmware - and only afterwards does
complete_all(&slave->initialization_complete).  That completion is what
sdw_slave_wait_for_init() at the top of tas2783_sdca_dev_resume() is
waiting for, so by the time regcache_sync() runs the part has already
been soft-reset and re-initialized.  Syncing there writes the cache back
onto a device that has just been brought up from scratch.

What I would not do is drop unconditionally in dev_resume(), because
that function is also the RUNTIME_PM_OPS resume callback.  On a resume
where the peripheral kept its context, or came back through clock stop
without losing state, regcache_sync() is the only thing that restores
the user's settings, and dropping the cache there would silently reset
volume and mute on every runtime resume.

So the shape I have in mind is a flag rather than a second drop: set it
in tas_update_status() on the uninitialized-attach path where the cache
is dropped today, consume it in dev_resume(), and simply skip the sync
when it is set - after tas_io_init() the cache already mirrors the
hardware, so there is nothing worth syncing, only registers that can
fail.  Something like:

	if (test_and_clear_bit(TAS_REINIT, &tas_dev->flags))
		return 0;	/* re-initialized from scratch, cache is fresh */

	regcache_cache_only(tas_dev->regmap, false);
	ret = regcache_sync(tas_dev->regmap);

Would you prefer that, or do you have a different fix in progress on
your side?  I am happy to write and test it either way - I just do not
want us to post two versions of the same thing.

Before I write the changelog, though, I need to describe a failure I can
actually point at, and this is where I have to ask what you saw.  On the
board I have here - ASUS ProArt PX13, AMD ACP7.0, two TAS2783 plus RT721
on link 1 - I cannot reproduce a failure on that path:

- the codec never reaches runtime suspend at all (runtime_status stays
  active, the usage count never drops to zero), so the runtime resume
  path is not exercised;

- on the system resume path, across s2idle cycles where both amplifiers
  genuinely lose power, re-attach and re-download the firmware, the
  journal shows no resume error at all.  My reading is that
  regcache_sync() returns early: regcache_cache_only(true) does not by
  itself set cache_dirty, and if nothing writes through the cache while
  the device is suspended, sync takes the "if (!map->cache_dirty) goto
  out" exit and never touches the bus.  Which would mean the bug is
  latent here and armed only when something does dirty the cache during
  suspend.

That it is armed at all is easy to show: when I force the sync on this
part (through a small debug module, outside of any suspend), it aborts
at 0x40400108, FU23 Mute ch0, with -ENODATA - reg_defaults claims 0x1
while the init sequence writes 0x00, so sync tries to "restore" a value
the device refuses.  A dev_resume() that reaches the sync on this
hardware would therefore fail outright and return -ENODATA to the PM
core, not merely leave the amplifier stale.  That is one more instance
of the reg_defaults question in my other mail of 24 August [1].

So could you tell me a bit more about your test:

1. Which resume path - runtime resume, or system resume from s2idle/S3?
2. Which tree, and does it already contain b627da430357 in
   update_status()?
3. What did you observe - a sync error code in the log, or silent
   speakers with no error at all?
4. Does your board's controller power-gate the link across suspend, so
   the amplifiers re-attach uninitialized, or do they keep context?

With that I can write the patch against a failure that is described
rather than assumed, and test it here by forcing the cache dirty across
suspend.

[1] https://lore.kernel.org/linux-sound/20260824104500.7588-1-andrey.golovko@gmail.com/

Thanks,
Andrey
