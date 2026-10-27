Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082931;
	b=5K7XnGaYCwMXrFS+iGGaEy/Dy8hQviFkwYe8lfXSO0/papVQVviAZmC/yOd4wA/7Rjdz
	 1c1LT+lJVesaBbauWP/OlBj5R4V+vL1YKqbkT/p3lUM2+77sSNlaPkNSEH/eQj2cbPABS
	 b2oBplRS2WOHZXo2hlgq6+wmgazrrrk2woYiO6ctNN0JZSWPrIPmgKdXo1i404JG7XnjF
	 UCauHNebiGyOAs9oPJaMQu4jUiZ4gTk1AQtDPj3RVVLqN7TcsjbDWbtz0XgwyNqrF+8nT
	 eqXYRmo6+6673JyvTkP0UI/T86VajGIKdFLVaDhKCr76/q8L2bmS7oDAXAnLLpRP1Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082931;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=hyehD7uCh2eUq1hups/oDb8okBGwaknVApj70J1CV/M=;
	b=ptXsVTZBoo6HVxVUeNtchyviCbtfm3LIE/RfjR0eJTsmzVUe9S+jxe6vQJvGUuTyQLbD
	 cfejqp+Yn4VD8zsn+tirFTF02/EWHTb1SIT2F4DtDYX6kFAmYojSVwtAa2iLk9h1YpEiE
	 uc5a281cIeyrJ09or2Supz//y1W3b8FK6aRGT1UnGIYDnKxbJx8LC3lKjQ2XZnTSwQYwu
	 Ltw8j3K99eFCUygnNcBJzKjtngtIBRcKOCvqTYfjbLEcnwYYcpOXeK76G7WvZ+WcfOYiV
	 sluEmI3CRSk4YC6HP6W0kJL0bCBf1Re0GY+o4iwlmQgbHhMgxRFGtafApPSgv2W6Azw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMYjazAA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NlwV0eS+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMYjazAA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NlwV0eS+;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0BE606A31A;
	Tue, 27 Oct 2026 06:35:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D0BE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMYjazAA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NlwV0eS+;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=bMYjazAA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NlwV0eS+
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3E8B61F791;
	Tue, 27 Oct 2026 06:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793082929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyehD7uCh2eUq1hups/oDb8okBGwaknVApj70J1CV/M=;
	b=bMYjazAANfftjg0rD2bvgSgLkQKnzEfWXwgiO4/N0WvLAkDLEJId1Qrgna0YMnli418WkZ
	osO/6fuQNOqW9VorXuu+u+yb1QKRGTes2AbDml7xr/KaMsI8GQvL0YT1PwkZqaM4Wbgydm
	Khxjpdd0zoWCm2qtJnLN9vHoG+R6N6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793082929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyehD7uCh2eUq1hups/oDb8okBGwaknVApj70J1CV/M=;
	b=NlwV0eS+4trYp96ktem8rgf3OyWgroDM2tdqHQ7zkDwfkCnZ+NZgHjvG8IXo7Dqhq9aLHo
	5FYibMkhjilPRsCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793082929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyehD7uCh2eUq1hups/oDb8okBGwaknVApj70J1CV/M=;
	b=bMYjazAANfftjg0rD2bvgSgLkQKnzEfWXwgiO4/N0WvLAkDLEJId1Qrgna0YMnli418WkZ
	osO/6fuQNOqW9VorXuu+u+yb1QKRGTes2AbDml7xr/KaMsI8GQvL0YT1PwkZqaM4Wbgydm
	Khxjpdd0zoWCm2qtJnLN9vHoG+R6N6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793082929;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hyehD7uCh2eUq1hups/oDb8okBGwaknVApj70J1CV/M=;
	b=NlwV0eS+4trYp96ktem8rgf3OyWgroDM2tdqHQ7zkDwfkCnZ+NZgHjvG8IXo7Dqhq9aLHo
	5FYibMkhjilPRsCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC56B1321C;
	Tue, 27 Oct 2026 06:35:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wzNzLDBG4GqjHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Oct 2026 06:35:28 +0000
Date: Tue, 27 Oct 2026 07:35:28 +0100
Message-ID: <87cxsv4pn3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Will Porter <mrwillporter@gmail.com>
Cc: Christian Ruppert <arc@gmx.li>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [PATCH 0/5] ALSA: usb-audio: Audient iD14 MkI vendor controls
In-Reply-To: <CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
	<at-dpPOGs2zD2fuL@khmer.arcnet>
	<CAMZ8TExJThTMZVvbDMVdtXSB-edGAsAnmKYtAtM1CCw0pDvNGw@mail.gmail.com>
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
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.li];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmx.li,suse.com,perex.cz,vger.kernel.org,androos.io];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Mon, 26 Oct 2026 22:44:50 +0100,
Will Porter wrote:
> 
> Hi Christian,
> 
> On Mon, Oct 26, 2026 at 07:36:24PM +0100, Christian Ruppert wrote:
> > I took a look at this question and it seems like we can share the majority
> > of code in the EVO driver by complementing it with the following features:
> > - variable width read/write
> > - caching of write-only values
> > - enum data type
> 
> Thanks for looking into this so closely, and for the fixes. I like
> the idea of one driver, and I'd like to find out whether the iD line fits.
> 
> Your TLV in patch 4/4 is the same one I use for the iD14 matrix: same
> unit 0x3C, s16 in 1/256 dB, -128 to +6 dB. That made me wonder whether
> the iD14 matrix could use your MIXER type almost as it is. Its channel
> number is input * 4 + output, so Main L/R and Cue L/R of each input
> are adjacent, like your stereo pairs. Could we expose it as 28
> controls with two values each, rather than my 56 single-value ones?
> An input's level and pan in a mix set its L and R values together,
> so a pair seems a natural fit. Does that look right to you?
> 
> > The only part which seems more problematic is probably FU12 which looks
> > like it requires some custom logic and would still need actual code.
> 
> Agreed. I'd keep FU 12 as its own code.
> 
> A few questions about the rest:
> 
> 1. Read before write. As I understand it, the put handlers in
>    mixer_evo.c read the value first to see if it changed. On the iD14,
>    GET stalls for mic boost, input polarity, optical mode and the iD
>    key function, so a put that reads first would fail there. Talkback
>    source always reads 0, so a read would hide real changes. Could
>    these write-only controls skip GET in both get and put, with get
>    returning the cached value? And could every put still send the
>    value, even when it matches the cache, so that "alsactl restore"
>    reaches a device that was reset?
> 
> 2. The cache. My driver writes a known value at probe (off or none,
>    and for optical mode its measured power-on mode, S/PDIF) and
>    updates the cache only after a full-length write. If the probe
>    write fails, an enum reads "Unknown" and a switch reads off. Would
>    that approach work for you?
> 
> 3. Control entries. The iD14 table uses 16 unit/selector pairs and
>    explicit control names, such as "Main Out L Source Playback Enum".
>    It also needs volumes in 1 dB steps (0..128, stored as s16
>    1/256 dB), a boost switch that writes 0x0a00 for on, and enums
>    that map items to device values, plus an "Other" item that only
>    get reports, for values outside the list. Would it make sense to
>    move the unit, selector and an optional full name into each control
>    entry, and add the new value formats (1 dB volumes, boost, enum)
>    as ctypes? Or would you structure it differently?
> 
> 4. Checks. My helper returns -EIO on a short read or write, before
>    it decodes a value or updates the cache. My matrix put also rejects
>    values outside -128..+6 dB, and get clamps what it reads back.
>    Could the shared code keep these checks?
> 
> I don't have a firm view yet on which way is better. If the iD14
> fits the table without many special cases, one driver seems clearly
> worth it. If it needs a lot of per-device branches, two smaller files
> might be easier to read and review. What do you think, now that you
> have seen what the iD14 needs?
> 
> If we do combine them, the order I imagined is: your four fixes first,
> then the rename to Audient, then the generic changes, then the iD14
> tables on top as v2 of my series.
> 
> In that case, would you prefer to do the rename and the generic part
> yourself? The rename would also touch MAINTAINERS; how would you like
> to handle review of the iD14 parts? I can write the iD14 parts and
> test them on my MkI. I don't have an EVO 4, so would you be able to
> test that side? And which base should I work against, sound for-next
> once your fixes are in? I'm also not sure how a combined change
> should reach Takashi: as one series, or as two with a stated
> dependency.

Well, it's all up to you guys :)
Just arrange between Christian and you, then resubmit, either v2 or
additional patches.  I'll be traveling from tomorrow and can't react
for a few days, in anyway.


thanks,

Takashi
