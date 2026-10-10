Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C062264B0;
	Sat, 10 Oct 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619615; cv=none; b=ZDuQ07kl3yk+cWHOcqE4V9cavCdmZO/lhFVMhxHbRHsin3/XwmNevnNxuf7+KABYxy+N9QCsu52xL+zceUBNkYbEURkepes94wJJEj8mzAtORnQnO6bjFDaNmvBHzf+lg/uTdXOCCB5Ik79a07OjZ9Yn493Sh4hGyPcwDxaaWV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619615; c=relaxed/simple;
	bh=iibjHXPO+QLA4yLVWV6BmwEABqeG4Fff21pNtY4WMgU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWJJxY+5XjmggJmn6wTkvl2FgAalWABKWHXYNHjMs+7lCenTgGVtt/ryGpen5/83qFNiCTB8cafW801skAb7fGB+ceWmpVmWMd/LyU4VYQ6eV/Xdahvp/e9bVxmsQNFdk+9LWekgBkMb0LoOubEKLWV4gXyTNjxhmOTjRZC/b34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C2VIpPPZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2hp348lD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C2VIpPPZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2hp348lD; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C2VIpPPZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2hp348lD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C2VIpPPZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2hp348lD"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0795F1F388;
	Sat, 10 Oct 2026 08:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+S3XawEzZ7TtaapbLTzPBAs3qLufioy1iwkxr/Ly7GQ=;
	b=C2VIpPPZmAsbeGwPg0GySgBy0bdupRO94cVAm8ha4+iKFXl/j2pLC7ZgltINvavJ+IqikP
	KA750nIlST7D3r+iraILtZSEgKfI+gyP27leWjmwAimbjSWRA5q7+y3rPewrbgPFeuJmh5
	8EI+nVlKXlOv5iDuxH+V4Au86LsdV1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+S3XawEzZ7TtaapbLTzPBAs3qLufioy1iwkxr/Ly7GQ=;
	b=2hp348lD3EaDJ8WUA59hzusvpXRivzieT0iT/TMxdo/pDBMOhH7JXv2HVepRd/ItKYf5ly
	bijQg9dd4YYAkwAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=C2VIpPPZ;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2hp348lD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791619612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+S3XawEzZ7TtaapbLTzPBAs3qLufioy1iwkxr/Ly7GQ=;
	b=C2VIpPPZmAsbeGwPg0GySgBy0bdupRO94cVAm8ha4+iKFXl/j2pLC7ZgltINvavJ+IqikP
	KA750nIlST7D3r+iraILtZSEgKfI+gyP27leWjmwAimbjSWRA5q7+y3rPewrbgPFeuJmh5
	8EI+nVlKXlOv5iDuxH+V4Au86LsdV1E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791619612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+S3XawEzZ7TtaapbLTzPBAs3qLufioy1iwkxr/Ly7GQ=;
	b=2hp348lD3EaDJ8WUA59hzusvpXRivzieT0iT/TMxdo/pDBMOhH7JXv2HVepRd/ItKYf5ly
	bijQg9dd4YYAkwAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B12FE133F6;
	Sat, 10 Oct 2026 08:06:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aIOdIRvyyWqRUgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 10 Oct 2026 08:06:51 +0000
Date: Sat, 10 Oct 2026 10:06:51 +0200
Message-ID: <87jynqj7xg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: hda: Reset response counter when a verb times out
In-Reply-To: <20261010022932.407742-1-songxiebing@kylinos.cn>
References: <20261009034040.379171-1-songxiebing@kylinos.cn>
	<20261010022932.407742-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0795F1F388
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Sat, 10 Oct 2026 04:29:32 +0200,
songxiebing wrote:
> 
> From: Bob Song <songxiebing@kylinos.cn>
> 
> On some controllers the HDA link reports a verb timeout and the driver
> falls back to polling mode.  After that, every subsequent verb sent to
> that codec address keeps timing out (roughly one second per verb), while
> the hardware itself looks perfectly healthy: the RIRB write pointer keeps
> advancing, interrupts are still delivered, and verbs that carry no reply
> payload -- notably writes -- still take effect on the codec.
> 
> The reason is that bus->rirb.cmds[addr] is incremented for every verb and
> only decremented in snd_hdac_bus_update_rirb() when a matching RIRB
> response is read, without any rollback for a response that never arrives.
> A controller that cannot fall back to the single-command mode
> (chip->fallback_to_single_cmd == 0, e.g. the ACPI platform, Tegra and CIX
> controllers) returns an error right away and never performs the bus reset
> that would reinitialize CORB/RIRB and clear the counter, so a single lost
> response leaves bus->rirb.cmds[addr] non-zero forever.  Each following
> verb then still gets one response that only brings the count back to the
> stale baseline of 1, and snd_hdac_bus_get_response() keeps timing out even
> though the codec answers normally.
> 
> Handle it in the core helper snd_hdac_bus_exec_verb_unlocked(): whenever
> get_response() reports an error, reset the pending counter for the codec
> address, so a late response is simply treated as a spurious response and
> the following verbs recover.  Doing it here covers all HD-audio
> controllers instead of relying on each controller's fallback setting.
> 
> Add a small helper snd_hdac_bus_reset_response_counter() for this.
> 
> Signed-off-by: Bob Song <songxiebing@kylinos.cn>
> ---
> Changes in v2:
> - Move the fix from azx_rirb_get_response() in the HDA controller helper
>   into the HD-audio core (snd_hdac_bus_exec_verb_unlocked()), as suggested
>   by Takashi Iwai, so that it covers all HD-audio controllers and not only
>   the ones using the shared azx helper.
> - Add the snd_hdac_bus_reset_response_counter() helper instead of
>   open-coding the counter reset.
> 
>  include/sound/hdaudio.h     |  2 ++
>  sound/hda/core/bus.c        |  6 +++++-
>  sound/hda/core/controller.c | 20 ++++++++++++++++++++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
> index aa994d6e6d35..b0fbb61fa093 100644
> --- a/include/sound/hdaudio.h
> +++ b/include/sound/hdaudio.h
> @@ -398,6 +398,8 @@ void snd_hdac_codec_link_down(struct hdac_device *codec);
>  int snd_hdac_bus_send_cmd(struct hdac_bus *bus, unsigned int val);
>  int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
>  			      unsigned int *res);
> +void snd_hdac_bus_reset_response_counter(struct hdac_bus *bus,
> +					 unsigned int addr);
>  int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus);
>  
>  bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset);
> diff --git a/sound/hda/core/bus.c b/sound/hda/core/bus.c
> index 81498f1e413e..ecc4b7a780a4 100644
> --- a/sound/hda/core/bus.c
> +++ b/sound/hda/core/bus.c
> @@ -121,11 +121,15 @@ int snd_hdac_bus_exec_verb_unlocked(struct hdac_bus *bus, unsigned int addr,
>  			break;
>  		/* process pending verbs */
>  		err = bus->ops->get_response(bus, addr, &tmp);
> -		if (err)
> +		if (err) {
> +			snd_hdac_bus_reset_response_counter(bus, addr);
>  			break;
> +		}
>  	}
>  	if (!err && res) {
>  		err = bus->ops->get_response(bus, addr, res);
> +		if (err)
> +			snd_hdac_bus_reset_response_counter(bus, addr);
>  		trace_hda_get_response(bus, addr, *res);
>  	}
>  	return err;
> diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
> index 78855ac357c6..1babc5109049 100644
> --- a/sound/hda/core/controller.c
> +++ b/sound/hda/core/controller.c
> @@ -396,6 +396,26 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
>  }
>  EXPORT_SYMBOL_GPL(snd_hdac_bus_get_response);
>  
> +/**
> + * snd_hdac_bus_reset_response_counter - reset the pending response count
> + * @bus: HD-audio core bus
> + * @addr: codec address
> + *
> + * Drop the number of commands that are still waiting for a response from
> + * the given codec address.  This is called when a verb is known to be dead,
> + * e.g. after a response timeout, so that a lost response won't leave the
> + * counter non-zero forever and block all later verbs to the same codec.
> + */
> +void snd_hdac_bus_reset_response_counter(struct hdac_bus *bus, unsigned int addr)
> +{
> +	if (addr >= HDA_MAX_CODECS)
> +		return;
> +
> +	guard(spinlock_irq)(&bus->reg_lock);
> +	bus->rirb.cmds[addr] = 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_hdac_bus_reset_response_counter);

Do we need to expose a symbol?  It's used in hda-core, and both bus.c
and controller.c are compiled together into it.
Let's avoid unneeded exports until really needed.


thanks,

Takashi
