Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130A036828B;
	Tue,  1 Sep 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259795; cv=none; b=IsgOTYJpOvqaP7QY7KD6RPs36omh5BjTsruynwBbPnHUO87pNO3rwhHHrV1b6SUJi7OCae2HJK27AVn0E7JFtXvpyt/xOpNhTfNHKd6RUcIx3BYRzOVQ1GD02o4sVpD8fNWdS0BtzdpFqw/BTBNCQ9SpZMFNjc8WuNMdQcSh5DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259795; c=relaxed/simple;
	bh=YeVJsNaBp59YuSNagcYOf5UFq6xKwgUehwBueSKheS0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kvqQGUaGxcRJEI8YGi+qgX6beOxANrSZiuqk5Y1TwkZLDWJXEs6C8FSS2mle+DWYQkYoPPmnZHQFHR2M/iXNHrc7WQceFsTH4u908mkCKlZyOGqM/rkt+DCAn2ePJneqtELVTNwS7UL+B34gTzkkju2QRjQagYzO9Ha+VXw+wrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Qw1LGMyJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HO3npIxG; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=byfeYksQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=f6WWl/Ce; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qw1LGMyJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HO3npIxG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="byfeYksQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="f6WWl/Ce"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C807A220D0;
	Tue,  1 Sep 2026 10:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259788; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8KsX0IAcDXFit1zTk+JLbUG2Ft4eL+daDZS7kOView=;
	b=Qw1LGMyJEEWpXpn3VF2YRQb6Dg0ISwdJqlrIQ/IFb2nsiQn7HMAt5l5gLUhTRGQuKkHzgg
	JvXVTjyubYiTaFWr/dNI9bV7aRDZ6Yn/6z4B1Cfuttki3sW584w6dfwT2w+Dkm2yVMtvkg
	2aU2a3MfqlJQCy1r0btzlVqSgIxYpMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259788;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8KsX0IAcDXFit1zTk+JLbUG2Ft4eL+daDZS7kOView=;
	b=HO3npIxGjBJCTIihCbiVJCZ2t29737L9ifwi1scelu2ZPXg/uKCBqOFIcaOg4y4Yu0vCAT
	GdiWkp/0eYn7g0BQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788259783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8KsX0IAcDXFit1zTk+JLbUG2Ft4eL+daDZS7kOView=;
	b=byfeYksQKkId/amdIiwVqFnzdsE9TmNBVjH5Ff9DhVPMe062ENPBRyIMRYGceV9I3cWpa5
	jsfV6yEUeWw52ZfNhFz+frA2JMjw4fcgEWquICP0ECPkIK/vUh0wsFgmvU6IdY8gpw/pLh
	mpkVdcxLC+BrkP/XXk0b99Z/PkYcAJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788259783;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b8KsX0IAcDXFit1zTk+JLbUG2Ft4eL+daDZS7kOView=;
	b=f6WWl/CeyLynsJ5YpG2zLRrRZNHGL7+rxVOJqB+ZCHCaezyHimXuTbYaFg6tYkphhbZKqy
	GDiFho1uSAxXCwBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 93C7D13515;
	Tue,  1 Sep 2026 10:49:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IkhkI8etlmrcFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 10:49:43 +0000
Date: Tue, 01 Sep 2026 12:49:43 +0200
Message-ID: <871pbddz5k.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ruslan <ruslan.panasiuk@gmail.com>
Subject: Re: [PATCH] ALSA: seq: midi: wait for output buffer space on non-atomic delivery
In-Reply-To: <20260831143200.412572-1-junjie.cao@intel.com>
References: <20260831143200.412572-1-junjie.cao@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,inmusicbrands.com,vger.kernel.org,gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo,intel.com:email]
X-Spam-Flag: NO

On Mon, 31 Aug 2026 16:32:00 +0200,
Junjie Cao wrote:
> 
> dump_midi() drops a chunk with -ENOMEM as soon as it does not fit in the
> rawmidi output buffer, whatever context it runs in.  When a client
> write(2)s one large SysEx event, the event is dispatched directly with
> atomic == 0 and the payload is copied from user memory chunk by chunk
> (snd_seq_deliver_event() rejects USRPTR events with atomic set), so the
> caller can sleep, yet the transfer still dies as soon as it gets ahead
> of the device by output_buffer_size bytes:
> 
>   ALSA: seq_midi: MIDI output buffer overrun
> 
> The report is a sample upload to a Novation Circuit Tracks over Web
> MIDI, failing after about a second with the default 4096-byte buffer.
> Raising output_buffer_size only moves the limit.
> 
> When atomic is clear, wait for the device to drain instead, the way
> snd_rawmidi_write() does for a userspace writer: sleep on
> runtime->sleep with the same 30-second no-progress timeout and feed the
> buffer in pieces.  Atomic delivery keeps the fail-fast path.
> 
> A writer sleeping here still holds the source port's subscriber list
> read-side, so unsubscribing that connection waits for the transfer to
> finish or the timeout to fire.  midisynth_unuse() wakes a sleeping
> writer after clearing output_substream, so once teardown gets there it
> does not sit in snd_use_lock_sync() waiting out a stalled device.
> 
> Compile-tested only; no device with a large SysEx sink here.
> 
> Reported-by: Ruslan <ruslan.panasiuk@gmail.com>
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2517136
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>

A large SYSEX is a long-standing PITA, and I appreciate your attempt
to fix it.  But, the problem is that you can't take long time in
dump_midi() which is called from the sequencer event handler, per
design; the atomic=false there doesn't mean that you are allowed to
block for a too long time like 30 seconds.

For working around this problem, we need a basic design change in ALSA
sequencer core, I'm afraid.


thanks,

Takashi
