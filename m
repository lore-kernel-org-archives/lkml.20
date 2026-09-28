Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09C4E3251;
	Mon, 28 Sep 2026 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611156; cv=none; b=KoAXywmsV8cHio5qaRhL3UUo7CW7pm/gNczxxv1MYGNv1W1jNm+4yIgUcCzFIKuf9BoS8mk9U9D12pcQzfX/+UitHKqqzHlcHsyCmbEBOE73ArdZqPhq76ptjCgoO8KdF/iO7QA0vqE+AAGpTr5xywyyPnv/gijy0RxyMFMFjNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611156; c=relaxed/simple;
	bh=P1+wSs09M4+Rmt4pIQXGQrymxZQipMIHSKSKNSTU/w8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyC3HNSCwrUQR2eVKUkcmJvCTpsyYwBv8XUiuIXUDlu76c25vkpa7DDvfLF8Lnfttt1xysxmgbSW4EEDX0gqJuuIOBGmqi0DK6/PkOQJE5+H/a8rMVWDRdRH+42VmgY05W7cCEsNubC0qOWU5pruQ1Zf6+UnTE5dM+knGDohjtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1zJbhrRC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SD7Gxcs3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gmy/4yge; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ichGRTBG; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1zJbhrRC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SD7Gxcs3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gmy/4yge";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ichGRTBG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 824C31FB44;
	Mon, 28 Sep 2026 15:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790611148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQzK3qibP9ZbHrE3wwgSsj44IpxQtwYXGrqH8cMiYSc=;
	b=1zJbhrRCZBnKjbyinEH0H8cWMfBX7G9lB75GSfa50OD8ieAOQgss10dSIaCt20q4UzAx02
	XmLEbaCURzXG/SgeUgCaX6OXP2qVuQcPxctsvE0GPY0zyj6+ajiPWgueXEUi3T1BfRemaW
	cbpr0sEaPNiPSKhS4utRgiueW9fYLrs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790611148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQzK3qibP9ZbHrE3wwgSsj44IpxQtwYXGrqH8cMiYSc=;
	b=SD7Gxcs3BgOYfySukbLWakOtDDPOiBudsuHK/ti0kKjFGtLytoglb9WfAksbcaE53Xaim+
	s0bsrY0uBfsq39Dg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Gmy/4yge";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ichGRTBG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790611144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQzK3qibP9ZbHrE3wwgSsj44IpxQtwYXGrqH8cMiYSc=;
	b=Gmy/4yge6WV6X1iRc0v5DOJZvQStbGTZyK6q5nVzruqgFSM4XsoA8bM7WLxN1R0yYFZvhf
	NQDyCWZ/bgPq9J9zkIOiBLX/g3jDku3NQDz7m7y21q+CZeXWBremZFREEExk8OvmVp14ML
	oejnOcWlHlmaUPFBopbJNUTUqhF7scg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790611144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jQzK3qibP9ZbHrE3wwgSsj44IpxQtwYXGrqH8cMiYSc=;
	b=ichGRTBG3xPvRWAHSHe9pkD9t0TNTpHJaniHrpKZWUABrAmUI8OgLu81LBWxMKw1BdRJ/L
	ufTyP4q/F1Xab1Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E4A9133F3;
	Mon, 28 Sep 2026 15:59:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Ssn7BciOumqmXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 15:59:04 +0000
Date: Mon, 28 Sep 2026 17:59:03 +0200
Message-ID: <878q4l4baw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: ROJOX <rojoxoficial@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] ALSA: hda: clarify unsol_event locking across driver unbind
In-Reply-To: <CAP8ibudQFpGuCo+Z97ozKySft0dZ40DWAqf4tUMEe2vrbtu6jA@mail.gmail.com>
References: <CAP8ibudQFpGuCo+Z97ozKySft0dZ40DWAqf4tUMEe2vrbtu6jA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 824C31FB44
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
	TO_DN_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO

On Fri, 25 Sep 2026 04:57:13 +0200,
ROJOX wrote:
> 
> Hi,
> 
> Could you advise on the lifetime and locking contract for
> hdac_driver::unsol_event() relative to codec driver unbind?
> 
> In current torvalds/linux, snd_hdac_bus_process_unsol_events() looks up a
> codec in bus->caddr_tbl under bus->reg_lock, checks codec->registered, and
> then drops reg_lock. It subsequently reads codec->dev.driver and dispatches
> drv->unsol_event(codec, res), without taking a codec device reference or
> device_lock in that interval:
> 
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/core/bus.c#L173-L189
> 
> Separately, driver-core unbind acquires the device lock and calls the remove
> path while that lock is held. The HDA reset path can initiate this through
> device_release_driver():
> 
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/drivers/base/dd.c#L1315-L1374
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/codec.c#L1799-L1810
> 
> This appears to permit the following source-level ordering:
> 
> unsol worker                         unbind task
> ------------                         -----------
> lookup codec under reg_lock
> drop reg_lock
> read codec->dev.driver
> enter unsol_event()
>                                      acquire device_lock
>                                      invoke remove
>                                      tear down private state
> callback continues using private state

Usually the HD-audio controller driver calls snd_hdac_bus_exit() at
its remove callback (or via the destructor invoked from there), and it
does cancel_work_sync() for the unsol event worker.

I thought the removal of codec->dev.driver happened after the
driver_detach(), so at that point, isn't the device object itself
still alive?

Or maybe I haven't followed the flow completely yet.  If the issue is
real, just taking the codec's device reference around the call would
be the easiest solution, I guess.


thanks,

Takashi


> I do not see the worker taking the device lock or another explicit
> binding/private-state lifetime reference before dispatch. If the callback
> uses state destroyed by the remove path, the unlocked dispatch therefore
> appears able to overlap that teardown.
> 
> The codec/device object lifetime, driver binding lifetime, and
> driver-private state lifetime are distinct here: get_device() alone would
> pin the first, but would not by itself prevent unbind or preserve private
> state.
> 
> The legacy HDA wrapper additionally checks shutdown and system-PM state
> before calling the codec callback, but those checks do not appear to drain
> a callback that has already passed them:
> 
> https://github.com/torvalds/linux/blob/165768bb70265b5c38cf0b73fafd75be235f8b14/sound/hda/common/bind.c#L42-L52
> 
> I also found the older unsolicited queue-index synchronization fix,
> c637fa151259c0f74665fde7cba5b7eac1417ae5. That appears to address queue
> consistency rather than this binding/private-state lifetime interval.
> 
> I tested one scratch proof candidate, not a proposed patch. It synchronizes
> address-table lookup/removal, obtains a codec device reference while the
> entry is protected, drops reg_lock, takes device_lock, revalidates the
> current binding and codec registration state, and dispatches the callback
> while that lock is held.
> 
> That closes the ordinary callback-versus-remove schedule in a deterministic
> model, and the modified HDA objects build cleanly in a scratch Ubuntu
> 7.0.0-34.34 source tree. However, hdac_driver::unsol_event() currently does
> not document callback-under-device_lock or reentry restrictions, so I am
> not assuming that this is the correct fix.
> 
> Could you please clarify:
> 
> 1. Is HDA core expected to serialize unsol_event() against unbind by holding
>    the codec device_lock through dispatch, or is there another existing
>    lifetime guarantee intended here?
> 
> 2. If that lock context is acceptable, should the callback contract prohibit
>    recursively taking the same device lock and synchronous same-codec
>    unbind/reset/reprobe? I found no direct same-codec teardown call in the
>    audited in-tree callback bodies, but indirect and out-of-tree behavior is
>    not established.
> 
> 3. Would callback-under-device_lock conflict with expected HDA runtime-PM or
>    system-PM behavior? My source review did not establish a generic contract
>    for this.
> 
> 4. For an event queued before unbind/rebind, is it expected to be deliverable
>    to the newly bound driver, or should it be discarded across the
>    binding/reset boundary?
> 
> This came up while auditing HDA/CS8409 codec lifetime behavior; the question
> is about the generic HDA unsolicited-callback contract.
> 
> No runtime crash has been reproduced. This is based on source/lifetime
> analysis and deterministic concurrency modeling, not a runtime stress test.
> I may be missing an existing lifetime guarantee or invariant, and would
> appreciate correction.
> 
> The source snapshot checked is torvalds/linux master at
> 165768bb70265b5c38cf0b73fafd75be235f8b14. No patch is proposed or attached.
> 
> Thanks,
> Rojox
> iMac19,2 Linux audio project
