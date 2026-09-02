Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FF649F10E;
	Wed,  2 Sep 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357571; cv=none; b=UEXlY51ntmCiO+ZEYNpao2HTV18FILNs/OXoFiTG9e2LsP1E6IqIqj6XDH8mU7UBoN6SzdDDSsINQHX+zMW9cfbSuE5QVx47A4RHWF0Hs6/hMpguyEDyXwDyLnUv2ghalV79MwoPzX1jUYXu2N6tjmFdX+/3x29keQ2tbR08Phs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357571; c=relaxed/simple;
	bh=pMyYDxzrPb59jFMMQfEL/Tdh+aR/P6cYuwOMBNX8HFw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XsglvSCqOaILSdDFugyEP1W/JmgawiuPNqjUn6QF0iC9DTGUAWV5jpJc6XkKlhXqk57nX2MNR1ac+7fLO2vY7GRwr9m3OZPPF4VkCYIBsrHCckkjXqBm0AMQKp7rEdxtc718tWWy+LVtGAYESWUjcgKxGlJnqdT6/T3LwWgDKlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oQz7LKUU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qxhOuuay; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=CwlHai41; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+mGLHEVb; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oQz7LKUU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qxhOuuay";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CwlHai41";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+mGLHEVb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9FE0C21A41;
	Wed,  2 Sep 2026 13:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788357563; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWe0gmJ4SjiPf3PpINDHKRxR5S0xlSvGe0zONCuRUhA=;
	b=oQz7LKUU0RRnH1oO2e37HaoytqmntzI/a90dVPUzMFZ06qnBqtXqRegAiSKZgAtc6W5oqm
	ikiXC+SoLkiyQbBOGD0tOHYFgJZyhGRbn49qp8pnMGC62m21UFoAnvFwtRIbT1vN/2AF+p
	TChkbpy5Q4g1rstRub6eXTtyYOIVKNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788357563;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWe0gmJ4SjiPf3PpINDHKRxR5S0xlSvGe0zONCuRUhA=;
	b=qxhOuuayiPpM0I9VCIuo+qc0B3Pn+w62nklX2oBDLxwlx5xOvOsZgExEQr2O8VD6GfSuC0
	404keusGE4bfn6Dg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=CwlHai41;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+mGLHEVb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788357559; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWe0gmJ4SjiPf3PpINDHKRxR5S0xlSvGe0zONCuRUhA=;
	b=CwlHai41ufpnugtQaFrLMoqKRC05/abbaFhvHRqd7ZOR/WD3MvwPWsWj8YF8G+K2g98ubT
	HkxyCryurxQeXrwncy3w+104upw0PCtgErjXUkQTSiLV7OBmdDsbJphlYfmBTGgyzEK8jA
	YAQM2FwbEpaPI0+xjibNU6rX15TFSns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788357559;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pWe0gmJ4SjiPf3PpINDHKRxR5S0xlSvGe0zONCuRUhA=;
	b=+mGLHEVbdRLIRApwFEfIG8JoD6Gi2frTO4BAJnm/fapb3KnrKS1i11BhJozuOYawK6QwFX
	RgPl1PbSDU90woBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 502FC13515;
	Wed,  2 Sep 2026 13:59:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dkdnErcrmGqOdgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 02 Sep 2026 13:59:19 +0000
Date: Wed, 02 Sep 2026 15:59:18 +0200
Message-ID: <87fqzrah55.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan <ruslan.panasiuk@gmail.com>
Subject: Re: [PATCH] ALSA: seq: midi: wait for output buffer space on non-atomic delivery
In-Reply-To: <20260901143803.422827-1-junjie.cao@intel.com>
References: <871pbddz5k.wl-tiwai@suse.de>
	<20260901143803.422827-1-junjie.cao@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: 9FE0C21A41
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,suse.com,perex.cz,inmusicbrands.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO

On Tue, 01 Sep 2026 16:38:03 +0200,
Junjie Cao wrote:
> 
> On Tue, 01 Sep 2026 12:49:43 +0200, Takashi Iwai wrote:
> > But, the problem is that you can't take long time in
> > dump_midi() which is called from the sequencer event handler, per
> > design; the atomic=false there doesn't mean that you are allowed to
> > block for a too long time like 30 seconds.
> 
> Right, dropping this one.
> 
> > For working around this problem, we need a basic design change in ALSA
> > sequencer core, I'm afraid.
> 
> Would you take an RFC along these lines, or do you have a different
> shape in mind?
> 
> - event_input gets a way to say "port full": the core parks the event
>   on a per-port FIFO instead of dropping it, copying direct/USRPTR
>   payloads into the sender's pool cells (snd_seq_event_dup(),
>   non-blocking).  While the FIFO is non-empty, further events for
>   that port queue behind it.
> - The kernel client signals readiness through a new snd_seq_kernel_*
>   call and a work item re-offers the parked cells.  seq_midi would
>   drive that from rawmidi's transmit ack, mirroring the input-side
>   runtime->event hook.
> - Backpressure stays at the sender's pool, the only place that sleeps
>   today: a blocking writer with parked cells waits for pool space
>   before its next direct dispatch, with ioctl_mutex dropped as
>   snd_seq_cell_alloc() does; poll() already reports pool room.
>   Nothing sleeps inside delivery.
> - Client exit purges its parked cells from every port, as
>   snd_seq_queue_client_leave() does for queues; port deletion frees
>   the FIFO.
> 
> Open points: a SysEx bigger than the rawmidi buffer is consumed
> partially, so the resume offset has to live in the parked entry or in
> the driver; one event larger than the sender's pool cannot be parked
> at all (the limit queued events already have); a broadcast is
> duplicated per blocked destination.  Drivers that never report "full"
> keep the current behaviour.

As mentioned, this is no new problem but a known issue (rather from
the beginning) over decades.  So it's no hurry about the fix time
frame :)

In ALSA sequencer core, the event packet delivery itself must not be
blocked too long -- so waiting at callback (that happens at the
delivery) won't work well.  Otherwise this will block the delivery of
other events.  Although in the case of seq-midi it might work because
it's handled in a work, the same problem happens for other clients,
hence we'd have to tackle in ALSA sequencer core side more properly.

My idea has no solid shape yet, but its basic form would be something
to push-back and re-deliver of event packets.  For a large data like
SysEx, it should support a partial (re-)delivery, too.

Instead of blocking the delivery, if the buffer is full, it's pushed
back, and rescheduled.  Obviously, this reschedule would work only for
the queued event delivery from the pool.  When it's transferred as a
direct delivery, it should just fail like the current version.
And, if the destination client gives some partial success, we'd have
to record the succeeded size, so that the re-delivery begins from the
right point, too.

So far, so good.  The problem surfaced, however, when there are
multiple destination targets from a client/port; then one (or a few)
of them might block while others can process fully.  Handling for this
situation has to be implemented somehow.  I can imagine to extend the
struct snd_seq_subscribers and struct snd_seq_port_subs_info to track
the pending events per connection, but not sure whether this can fly
well...


thanks,

Takashi
