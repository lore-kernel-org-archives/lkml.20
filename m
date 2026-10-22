Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661795;
	b=LCAOs26eq+qrekru881DXtsbcxyp9Y4bVNEMnHIfXMgxDLsM1cFhYC5cpI5G/QEN2l09
	 tEqD0+VvfLZWPNLvivDiM49orc9YLiIOaxXaw7+ONa382W3pI5k2UXE7qeKMgLF+kH8Lr
	 MdCpHGZx+VrT16EoreDxl22AFBTKwqO/m62OWl9ua/nv1tzpneJNpxB2OPqdf7ILyuIx8
	 sEibzzd0+ti+LtpH2y76uYDU7jsWD7VIXuCnqJS1MliRqZxKgg0XlpLx1ZGFcnwHImM7s
	 XsVzlpov0YnT6MwlEQcX2hSUfDlwxBCiGNSbuaGUfnhj1s6yB/0cDgpj/Nczv0BdvqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661795;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=AYyQAzoWDAZoeZ6Vh96vFz24sKm5IDT9ESeLOFmfhpE=;
	b=Df165nHNlnALV8fhjCeDRLy71gMj4xgRMTmU52kwArUeOW+LFsJyBETdC+B+2sPwne+s
	 VMLYVUDnQi/GHPkuZsSsv5PInZ1ODZExrDnf5TNmLngfONdEr++a4YBK27Cw9GU/w3d6p
	 qB0Sqx0H2z4pqFornicnTf45BVHGbctrMcYSANZju7xNDHDP+5cSJQfqjiUrdDF9zX4jK
	 oZCKyT5veZwgemsNi4oRDdk/uGyjrm13z+i3YmnvNTN69v5qSw/mlKQvARP/8+2TJVsxS
	 y35+pAclO2umZWmVa89DXFD+L3BrR+fQvKHk9z3z5wl7Rdj5rikXtLVIxXSSR0pbiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r9wEzJP+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ciFF9h1T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r9wEzJP+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ciFF9h1T;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F0606A33B;
	Thu, 22 Oct 2026 09:36:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746F0606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r9wEzJP+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ciFF9h1T;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=r9wEzJP+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ciFF9h1T
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 887EE1FCCC;
	Thu, 22 Oct 2026 09:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792661792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYyQAzoWDAZoeZ6Vh96vFz24sKm5IDT9ESeLOFmfhpE=;
	b=r9wEzJP+fnsTDT+MY32pZkES2caZy+VcsqHUTioyksoqfnbqLmNzgNUxcgBNC5ehdoJqF1
	rQrrklgARhr05SMTnzng6CMNV3gSGdxqvJEjFHhn0ldnDGOCEG5cBdpS0euIPCORGtkXQ0
	D2L6L5w4KyeDL3GZpLj1tCrmE22bCgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792661792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYyQAzoWDAZoeZ6Vh96vFz24sKm5IDT9ESeLOFmfhpE=;
	b=ciFF9h1TEdax/qOnEaPTMTdK3pyyivEBG0pJA4yV3YUmg/j6hQcqHyKcqGt/3m2LFnIUeW
	coytz9Zbl8j0GfAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=r9wEzJP+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ciFF9h1T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792661792; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYyQAzoWDAZoeZ6Vh96vFz24sKm5IDT9ESeLOFmfhpE=;
	b=r9wEzJP+fnsTDT+MY32pZkES2caZy+VcsqHUTioyksoqfnbqLmNzgNUxcgBNC5ehdoJqF1
	rQrrklgARhr05SMTnzng6CMNV3gSGdxqvJEjFHhn0ldnDGOCEG5cBdpS0euIPCORGtkXQ0
	D2L6L5w4KyeDL3GZpLj1tCrmE22bCgo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792661792;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AYyQAzoWDAZoeZ6Vh96vFz24sKm5IDT9ESeLOFmfhpE=;
	b=ciFF9h1TEdax/qOnEaPTMTdK3pyyivEBG0pJA4yV3YUmg/j6hQcqHyKcqGt/3m2LFnIUeW
	coytz9Zbl8j0GfAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 396C7133F3;
	Thu, 22 Oct 2026 09:36:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2p2WBCDZ2WpwcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 22 Oct 2026 09:36:32 +0000
Date: Thu, 22 Oct 2026 11:36:31 +0200
Message-ID: <87pkx2cc0w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: songxiebing <songxiebing@kylinos.cn>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/generic: Use "Input Source" for the capture source selector
In-Reply-To: <20261022092921.2084573-1-songxiebing@kylinos.cn>
References: <20261022025743.520258-1-songxiebing@kylinos.cn>
	<20261022092921.2084573-1-songxiebing@kylinos.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 887EE1FCCC

On Thu, 22 Oct 2026 11:29:21 +0200,
songxiebing wrote:
> 
> >That can work, but I'd rather check further why PA doesn't work with
> >Capture Source.  If it's something like an element that doesn't match
> >with the actual input, it's a driver's problem and we may work around
> >it somehow.  But before figuring it out, it's not wise to blindly
> >work around something just because it looks as if working.
> >
> >
> >thanks,
> >
> >Takashi
> 
> Thanks for reply.
> 
> What I found so far on the userspace side:
> 
> - alsa-lib's simple-mixer layer special-cases the exact name "Capture
>   Source": it does *not* expose an enumerated element with that name, but
>   instead creates one exclusive capture switch per enum item, named after
>   the item (simple_none.c, simple_event_add()).
> - PulseAudio's ALSA backend resolves its "Capture Source" element strictly
>   by name (element_probe() -> snd_mixer_find_selem()), so it never finds
>   an element and the mux is never switched.  PA also has no handling for
>   snd_mixer_selem_has_capture_switch_exclusive(), so it can't consume the
>   per-item switches either.

If that's true, PA is broken for all other AC97-based PCI cards?
Let's verify the PA behavior more at first.


Takashi
