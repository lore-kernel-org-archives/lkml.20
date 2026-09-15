Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725833D45F7;
	Tue, 15 Sep 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466901; cv=none; b=TlgkwwCT2tCaiNqkSCg2bYaBIKdceXp8O3sr/xsInSkR3qBI7Gcj/2N7igPsu3j9aiKKwlyvJwi3PqGA6Wi+LslwICsAq/erj/suOWBJ/bV1KetsiFVjd5ySlDjwy7a06unvCg0GN5mX51NoM4kj1LdKOEFYYKpHXPYQse5oczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466901; c=relaxed/simple;
	bh=SIMr06eVgBaNMtYKyi9EWErXDWh19IaduCzMj3NJUWk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ssFv2kTQr6jyPXmfTAqMDXVp0SzlwaiOMz89GLWe45JHw1RggMnIJHUvA8SdoSV/bqin15mRQHkm69NodsgDXpVND3GKcJjEr+a22ZrM2AOKNF1Gl/MQDIyNyc12OAQlOWfDmTzGgk/VZM7qfSkf2eqIzoa+8KqZl7ra0//UwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=IVJ7oBi6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5mY1hKol; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=bV9YXRJx; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PHEQHiXG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="IVJ7oBi6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5mY1hKol";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="bV9YXRJx";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PHEQHiXG"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0778C21E06;
	Tue, 15 Sep 2026 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789466894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OjQSpTbg0dv9a8De5IvCQZ0rSX0dTd1I5Rz5m/JEId0=;
	b=IVJ7oBi6kMFzNJMtXqO21MYvzp5S1mDAk11e/62lsitL6ouTDB1qIp27Qaz7mbmfWqYFtU
	gxM+Bpfl35kgXlR8tyx0+ZyeEF3grn+93VupiMO543YEOMuyX2IAqgkD1vxwIVP7THjKDg
	2m1jTVg75tF6sC8477XC4h+Sg1a0fUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789466894;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OjQSpTbg0dv9a8De5IvCQZ0rSX0dTd1I5Rz5m/JEId0=;
	b=5mY1hKollGiSy/R1IrIIp4/jAiDMDKukWrkmRxJ9wnNiZr9JSnYtqDOSwuGVp+8/TBKyAm
	nohfqmMRRtAGCBDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bV9YXRJx;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PHEQHiXG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789466890; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OjQSpTbg0dv9a8De5IvCQZ0rSX0dTd1I5Rz5m/JEId0=;
	b=bV9YXRJxHwzTG/OfXi0RG17tR3e3nRuejvCw2Z2VXduJUWgWym6At+1dI24vyQPoQEpAp5
	wvWHhUsWf4XCHJM4SuXfyVvLbovWDFS0fMw0gWmZBLKdag1S7t7NKD1NfqWshyw3LLLbC7
	8I1NYhUfXocXbwZYEH5NPEK0QNj6ctA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789466890;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OjQSpTbg0dv9a8De5IvCQZ0rSX0dTd1I5Rz5m/JEId0=;
	b=PHEQHiXGqhkit1XiHOfps59m4jDHA7Bfku2ELQqa7hyJlDNIt1ZMYyXO3/ZXUIWZEdkREZ
	WWNzYdSC4k6hkDDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A932813693;
	Tue, 15 Sep 2026 10:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O1QCIAkZqWoNFgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 15 Sep 2026 10:08:09 +0000
Date: Tue, 15 Sep 2026 12:08:09 +0200
Message-ID: <87h5jqn7xy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: Re: [PATCH v2 00/23] ALSA: fix typos in comments
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 0778C21E06
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Tue, 15 Sep 2026 10:44:01 +0200,
Hemanth Selam wrote:
> 
> v1 was a single patch touching 35 files, which was too coarse and would
> get in the way of backporting real fixes later on.
> 
> This v2 splits it per driver, so each patch stays confined to one driver
> and can be dropped or backported on its own.  Drivers made up of several
> files (hda, usb-audio, i2c, ac97, ...) are kept together in a single
> patch rather than going all the way down to one patch per file.
> 
> Comments only, no functional change.  The combined diff of this series
> is identical to v1 except for a trailing whitespace dropped from one
> cs46xx comment line that checkpatch complained about.
> 
> Built with allmodconfig on x86, sound/ compiles clean with no new
> warnings.  sound/mips/hal2.c and sound/ppc/tumbler.c are arch-gated so
> they were not compile-tested here; both are comment-only as well.
> 
> v1: https://lore.kernel.org/all/20260907063202.20577-1-hemanth.selam@gmail.com/
> 
> Hemanth Selam (23):
>   ALSA: core: seq: oss: fix typos in comments
>   ALSA: hda: fix typos in comments
>   ALSA: usb-audio: fix typos in comments
>   ALSA: i2c: fix typos in comments
>   ALSA: emu10k1: fix typos in comments
>   ALSA: emux: fix typos in comments
>   ALSA: firewire: bebob: fix typos in comments
>   ALSA: opti9xx: fix typos in comments
>   ALSA: hal2: fix typos in comments
>   ALSA: ppc: tumbler: fix typos in comments
>   ALSA: ac97: fix typos in comments
>   ALSA: au88x0: fix typos in comments
>   ALSA: aw2: fix typos in comments
>   ALSA: cs4281: fix typos in comments
>   ALSA: cs46xx: fix typos in comments
>   ALSA: echoaudio: fix typos in comments
>   ALSA: lx6464es: fix typos in comments
>   ALSA: pcxhr: fix typos in comments
>   ALSA: riptide: fix typos in comments
>   ALSA: rme32: fix typos in comments
>   ALSA: hdsp: fix typos in comments
>   ALSA: trident: fix typos in comments
>   ALSA: vx: fix typos in comments

Applied to for-next branch now.  Thanks.


Takashi
