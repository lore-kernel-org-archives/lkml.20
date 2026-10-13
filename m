Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C877E38D014;
	Tue, 13 Oct 2026 09:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884551; cv=none; b=uG38X7fHa4UkatCEt6h8uxXRKbA0Uc6mwJIzrYrZT7JLCPksTgrEavGbSITErpwp46GJ+vz8zkTrLzLHSsVRz82kcljJxsJ4BaZYV+Sw2IyH1Rgl0pjsyTgZS5Mt+vU3oEAnv52l7XgedN/RCHJReEO4rb0VNAMpKrnwtFkc+zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884551; c=relaxed/simple;
	bh=HapQ65CO3r5N1OTVcFAc00tI+ztIOHNCB0D9HotG9j4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=shIqIVIjPSuZ07CWFEVB1Ss7Po/Dbp0jMsw/CyFz2kHtvqHcamF91KlcwRATgur+mf6UgDzvyc431Y9XTjrJ1fiM9PGm713Xcsd1e4d6y6sD9W47UrKZ55Z28YFP5SAal/Cuv4Vy8NHEGu8jjkdrPQHDdKtCYFuGvlRYZA/J9Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tCcpdv1K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DizP0Hl+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tCcpdv1K; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=DizP0Hl+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tCcpdv1K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DizP0Hl+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tCcpdv1K";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="DizP0Hl+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B723021FFB;
	Tue, 13 Oct 2026 09:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tG0Tv2yJsObbsHc1gKtk3aq4T0h8Vnqx6t25KJXm3SI=;
	b=tCcpdv1Kg7+WAZHPm/m7oyI58oofKmyvihzj4D2Hp54oHUsklCynGQl+1ao0/yblEDP0OQ
	BdpUqUkY2k7sW0vMC3vvaY89cghgcLaoTlkA6oGLOwW/WeAYpu0tXSekBKAYiQ9jkm13Md
	gRK10rtcrR9Y7riA64BT9zTG4H/iYUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tG0Tv2yJsObbsHc1gKtk3aq4T0h8Vnqx6t25KJXm3SI=;
	b=DizP0Hl+BgFd5omrlKwOvugcZh705f0pfAEbT/b0trD9tkVnpwPdtMIKHuPMfb6LQpPw/2
	LOzY5Pg59eH5qlCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tCcpdv1K;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=DizP0Hl+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791884547; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tG0Tv2yJsObbsHc1gKtk3aq4T0h8Vnqx6t25KJXm3SI=;
	b=tCcpdv1Kg7+WAZHPm/m7oyI58oofKmyvihzj4D2Hp54oHUsklCynGQl+1ao0/yblEDP0OQ
	BdpUqUkY2k7sW0vMC3vvaY89cghgcLaoTlkA6oGLOwW/WeAYpu0tXSekBKAYiQ9jkm13Md
	gRK10rtcrR9Y7riA64BT9zTG4H/iYUo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791884547;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tG0Tv2yJsObbsHc1gKtk3aq4T0h8Vnqx6t25KJXm3SI=;
	b=DizP0Hl+BgFd5omrlKwOvugcZh705f0pfAEbT/b0trD9tkVnpwPdtMIKHuPMfb6LQpPw/2
	LOzY5Pg59eH5qlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6502413432;
	Tue, 13 Oct 2026 09:42:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o0O6DwP9zWocdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 13 Oct 2026 09:42:27 +0000
Date: Tue, 13 Oct 2026 11:42:27 +0200
Message-ID: <87a4oigcn0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	phucduc.bui@gmail.com,
	len.bao@gmx.us,
	hariconscious@gmail.com,
	sammiee5311@gmail.com,
	kees@kernel.org,
	akhilarul324@gmail.com,
	cezary.rojewski@intel.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH] ALSA: rawmidi: Drain input work before freeing the runtime
In-Reply-To: <pm-pmb-98489078ab56528d8e4a-v2-9408ce8c8f3c70b5c10d@gmail.com>
References: <pm-pmb-98489078ab56528d8e4a-v2-9408ce8c8f3c70b5c10d@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B723021FFB
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,gmx.us,kernel.org,intel.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Tue, 13 Oct 2026 09:54:35 +0200,
Cen Zhang wrote:
> 
> The input runtime embeds event_work, so the work must be drained before
> close_substream() frees the runtime. The cancellation in
> snd_rawmidi_input_trigger() runs before close clears substream->opened,
> leaving a window for snd_rawmidi_receive() to enqueue more work.
> 
> With a sequencer subscription to a USB MIDI input port, an in-flight
> completion can overlap the last subscription's midisynth_unsubscribe():
> 
> 1. snd_usbmidi_input_data() observes input_triggered and is delayed
>    before calling snd_rawmidi_receive().
> 2. Unsubscribe enters close_substream(), clears input_triggered through
>    the provider trigger callback and returns from cancel_work_sync().
>    The substream is still opened.
> 3. The completion resumes. snd_rawmidi_receive() takes substream->lock,
>    sees opened set and queues runtime->event_work before dropping the
>    lock.
> 4. Close clears opened under that lock, closes the provider and frees
>    the runtime. Stopping USB URBs does not drain the raw-MIDI work.
> 5. The queued work runs and snd_rawmidi_input_event_work() reads event
>    or substream from the freed runtime, causing a use-after-free.
> 
> Cancel input event_work again after clearing opened, before closing the
> provider or releasing the runtime's private data. Receive holds
> substream->lock through its opened check and work enqueue, so once close
> has cleared opened under that lock, no further receive can queue work.
> The final cancellation therefore drains any late work before the
> runtime is freed. Keep it outside the spinlock so a running callback can
> finish.
> 
> Fixes: b3c705aa9e91 ("ALSA: rawmidi - Use workq for event handling")
> Assisted-by: LLM
> Signed-off-by: Cen Zhang <zzzccc427@gmail.com>

Applied to for-next branch now.  Thanks.


Takashi
