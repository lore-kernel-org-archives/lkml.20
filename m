Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84854D954D;
	Mon, 28 Sep 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612879; cv=none; b=FWlH2kFxCcQIdoglovVxDc4Fv4qp2SNFgsuP0vkt7b7siWy3nfxCDWwRkTSdjIp3wkYDWJ58eMBLhjmSac2O/WyBCYK7sazJD4dSjx9YYNguaLmqA5hlrpUYOk5G1dGNK5AFCXH5iSpSqR+v56zoP/r72tAc/gfLEzZjltBMBCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612879; c=relaxed/simple;
	bh=NmgwfbY0qetX+JLhhEd+9oxY4QtbHhWKXmHPx8z1G6E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ksZAHMksn3ZQu2BmOP9zAdj57HkO8q6wh3tmpvh/MtaOPyAd1nfdaQGAH2g//aFcxcaEpq/bsTHWDyQkzw/pPWxtnyyIxeR4hZTK6TvUV/vnM3iH/YfnsMZkZApahbNf+U/EVcQcaPcgO8MUUfXBHLkRVz1LNsagVrywruomEMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QkXKTnZB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=MeP6+A3E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BGe8wKX4; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zDu2XL6C; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QkXKTnZB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MeP6+A3E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BGe8wKX4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zDu2XL6C"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9489921A5C;
	Mon, 28 Sep 2026 16:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790612871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Wmwk2oQmlpw2/mkDIwYPW2qVfB6G/EtxJ08EpejU18=;
	b=QkXKTnZBpVa6bVTjWpTfMbreMwBnZc8R3AAzcv5a1II+uGudcsnjDLMNeEXDlMQjrFIabZ
	0uVgRqQRqObH+ybX45goxCfbhVl/9WzGLnQTZPbU8HznhpoBinZq/rYIuFnElXUXsM6gwR
	++qrTtQdHwx76kEvaMgsC9Iskgnppjo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790612871;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Wmwk2oQmlpw2/mkDIwYPW2qVfB6G/EtxJ08EpejU18=;
	b=MeP6+A3EMgs4gG8H1i2+h/DCy4x8d4ukhFRcmt7pm0kLkQoU1X3Aiq74sD67J5LnKyNf/g
	CLBvu2mfZpmdSPBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BGe8wKX4;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zDu2XL6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790612867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Wmwk2oQmlpw2/mkDIwYPW2qVfB6G/EtxJ08EpejU18=;
	b=BGe8wKX4wXPEMBdrn4k1IUJAnb+L0xChtQKamm2hSW661X/4rjSkzSvae3Zj6hKC5dqaA8
	7SbroG3//Qijs+GEDbUq0tGvZUbCuFtGFOEkcb7AwJFkg/5aj0zBuDFn6jSXG1eh87UF/R
	XNloz3ZPHl9315WEbYt6JW7dVDXr+D8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790612867;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Wmwk2oQmlpw2/mkDIwYPW2qVfB6G/EtxJ08EpejU18=;
	b=zDu2XL6CrWN37yTuxJpCJ0s0MKhKDCWD8ikp7i54J5B9p4REhXVsoAbm/3Ei79WNjUApRX
	WdbTOhyfCoruzhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 44EBC133F1;
	Mon, 28 Sep 2026 16:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +LaTB4OVumreegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 16:27:47 +0000
Date: Mon, 28 Sep 2026 18:27:46 +0200
Message-ID: <874if949z1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ROJOX <rojoxoficial@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] ALSA: hda: clarify unsol_event locking across driver unbind
In-Reply-To: <CAP8ibufezke_P6vkOakgg6wXvOKxdGGiYZ0gD6_+pFuwefA6-Q@mail.gmail.com>
References: <CAP8ibudQFpGuCo+Z97ozKySft0dZ40DWAqf4tUMEe2vrbtu6jA@mail.gmail.com>
	<878q4l4baw.wl-tiwai@suse.de>
	<CAP8ibufezke_P6vkOakgg6wXvOKxdGGiYZ0gD6_+pFuwefA6-Q@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 9489921A5C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Mon, 28 Sep 2026 18:16:26 +0200,
ROJOX wrote:
> 
> Hi Takashi,
> 
> Thanks for taking a look.
> 
> Yes, I agree that the whole-controller teardown path appears safe in this
> respect: snd_hdac_bus_exit() does cancel_work_sync(&bus->unsol_work), so an
> already running unsolicited worker is drained before the bus itself is torn
> down.
> 
> The case I am concerned about is the individual codec unbind/reset path,
> where the HDA bus and its unsol_work remain alive.
> 
> For example, snd_hda_codec_reset() calls device_release_driver() for the
> codec device:
> 
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810
> 
> and the legacy HDA remove wrapper reaches the codec driver's ->remove()
> callback and subsequent unbind cleanup:
> 
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L152-L173
> 
> So I think there are two separate lifetime questions here.
> 
> Taking get_device() around the unsolicited dispatch would protect the
> hdac_device/struct device object itself, which addresses the possibility of
> the codec object disappearing while the worker is using it.
> 
> What I am not sure it protects is the bound driver's private state. The
> device can remain alive while device_release_driver() runs the codec
> driver's ->remove() callback and that callback tears down state subsequently
> used by ->unsol_event().
> 
> Conceptually, I am worried about this ordering:
> 
>     unsol worker                     codec unbind
>     ------------                     ------------
>     get_device(codec)
>     resolve current driver
>                                      ->remove()
>                                      free driver-private state
>     ->unsol_event()
>       use driver-private state
>     put_device(codec)
> 
> So my concern is not primarily the lifetime of struct hdac_device itself,
> but whether there is an existing guarantee that serializes the driver
> binding/private state against unsol_event() during individual codec unbind.
> 
> If there is such an invariant elsewhere in the HDA or driver-core lifecycle,
> I may simply be missing it.
> 
> Otherwise, would you expect the fix to protect only the device object with
> get_device(), or would the current binding also need to be serialized or
> revalidated against ->remove() before dispatch?

AFAIK, there is no lifecycle protection in the code in question.
So a serialization like get_device() would be likely a good to have,
indeed.  Feel free to cook and pitch your fix.


thanks,

Takashi

> 
> Thanks,
> Rojox
> iMac19,2 Linux audio project
> 
> On Mon, 28 Sep 2026 17:59:03 +0200, Takashi Iwai <tiwai@suse.de> wrote:
> > On Fri, 25 Sep 2026 04:57:13 +0200,
> > ROJOX wrote:
> > >
> > > Hi,
> > >
> > > Could you advise on the lifetime and locking contract for
> > > hdac_driver::unsol_event() relative to codec driver unbind?
> > >
> > > In current torvalds/linux, snd_hdac_bus_process_unsol_events() looks up a
> > > codec in bus->caddr_tbl under bus->reg_lock, checks codec->registered, and
> > > then drops reg_lock. It subsequently reads codec->dev.driver and dispatches
> > > drv->unsol_event(codec, res), without taking a codec device reference or
> > > device_lock in that interval:
> > >
> > > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/core/bus.c#L173-L189
> > >
> > > Separately, driver-core unbind acquires the device lock and calls the remove
> > > path while that lock is held. The HDA reset path can initiate this through
> > > device_release_driver():
> > >
> > > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/drivers/base/dd.c#L1315-L1374
> > > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810
> > >
> > > This appears to permit the following source-level ordering:
> > >
> > > unsol worker unbind task
> > > ------------ -----------
> > > lookup codec under reg_lock
> > > drop reg_lock
> > > read codec->dev.driver
> > > enter unsol_event()
> > > acquire device_lock
> > > invoke remove
> > > tear down private state
> > > callback continues using private state
> >
> > Usually the HD-audio controller driver calls snd_hdac_bus_exit() at
> > its remove callback (or via the destructor invoked from there), and it
> > does cancel_work_sync() for the unsol event worker.
> >
> > I thought the removal of codec->dev.driver happened after the
> > driver_detach(), so at that point, isn't the device object itself
> > still alive?
> >
> > Or maybe I haven't followed the flow completely yet. If the issue is
> > real, just taking the codec's device reference around the call would
> > be the easiest solution, I guess.
> >
> > thanks,
> >
> > Takashi
> >
> > > I do not see the worker taking the device lock or another explicit
> > > binding/private-state lifetime reference before dispatch. If the callback
> > > uses state destroyed by the remove path, the unlocked dispatch therefore
> > > appears able to overlap that teardown.
> > >
> > > The codec/device object lifetime, driver binding lifetime, and
> > > driver-private state lifetime are distinct here: get_device() alone would
> > > pin the first, but would not by itself prevent unbind or preserve private
> > > state.
> > >
> > > The legacy HDA wrapper additionally checks shutdown and system-PM state
> > > before calling the codec callback, but those checks do not appear to drain
> > > a callback that has already passed them:
> > >
> > > https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L42-L52
> > >
> > > I also found the older unsolicited queue-index synchronization fix,
> > > c637fa151259c0f74665fde7cba5b7eac1417ae5. That appears to address queue
> > > consistency rather than this binding/private-state lifetime interval.
> > >
> > > I tested one scratch proof candidate, not a proposed patch. It synchronizes
> > > address-table lookup/removal, obtains a codec device reference while the
> > > entry is protected, drops reg_lock, takes device_lock, revalidates the
> > > current binding and codec registration state, and dispatches the callback
> > > while that lock is held.
> > >
> > > That closes the ordinary callback-versus-remove schedule in a deterministic
> > > model, and the modified HDA objects build cleanly in a scratch Ubuntu
> > > 7.0.0-34.34 source tree. However, hdac_driver::unsol_event() currently does
> > > not document callback-under-device_lock or reentry restrictions, so I am
> > > not assuming that this is the correct fix.
> > >
> > > Could you please clarify:
> > >
> > > 1. Is HDA core expected to serialize unsol_event() against unbind by holding
> > > the codec device_lock through dispatch, or is there another existing
> > > lifetime guarantee intended here?
> > >
> > > 2. If that lock context is acceptable, should the callback contract prohibit
> > > recursively taking the same device lock and synchronous same-codec
> > > unbind/reset/reprobe? I found no direct same-codec teardown call in the
> > > audited in-tree callback bodies, but indirect and out-of-tree behavior is
> > > not established.
> > >
> > > 3. Would callback-under-device_lock conflict with expected HDA runtime-PM or
> > > system-PM behavior? My source review did not establish a generic contract
> > > for this.
> > >
> > > 4. For an event queued before unbind/rebind, is it expected to be deliverable
> > > to the newly bound driver, or should it be discarded across the
> > > binding/reset boundary?
> > >
> > > This came up while auditing HDA/CS8409 codec lifetime behavior; the question
> > > is about the generic HDA unsolicited-callback contract.
> > >
> > > No runtime crash has been reproduced. This is based on source/lifetime
> > > analysis and deterministic concurrency modeling, not a runtime stress test.
> > > I may be missing an existing lifetime guarantee or invariant, and would
> > > appreciate correction.
> > >
> > > The source snapshot checked is torvalds/linux master at
> > > 165768bb70265b5c38cf0b73fafd75be235f8b14. No patch is proposed or attached.
> > >
> > > Thanks,
> > > Rojox
> > > iMac19,2 Linux audio project
