Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7DC4AAC76;
	Mon, 28 Sep 2026 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595430; cv=none; b=rT82YZKGMRryG4WsRHrnn6wcGrvXG/Q556Ec07IblLPrea1nYrOWdiITe9FvAqNiuSTgEuV65o8N+lRZJ/TMVLjygniqghGyN1GgF+9sLWv0O7vrOuhVJThcQISxnyJS83o9aLZX6HdKTc49PQGqN/tAle73eaTfG6gYFId/PsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595430; c=relaxed/simple;
	bh=DBXOe2w5R1yU1cFL2hrwXsgnLTMEXw1Ce0nNIBfa+dg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srwldbVc8EU9RMrpi0HTgCE8iKLUqfOD44ImST9uVsAsxTdWlYJUkiC7ihqC8zE8YlRdBrj8hQVlUeZjewBnOc+Y4+LymMW3HeK5XXQBq8jkWb549hljf794eXsVCWhz1muJazho52YAieq7xovtW9kr1f48v4lUqoD0O01Sy0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=09Yic5Lf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cGWovZt+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BgpoxU4T; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OYRKnH7v; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="09Yic5Lf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cGWovZt+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BgpoxU4T";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OYRKnH7v"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 811C321BE9;
	Mon, 28 Sep 2026 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595422; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0nFpVwW8Qb/XKdtGxEQ6doda0NPGIRUjGdQoWdYK2Y=;
	b=09Yic5Lf9xNV01mU9wW6gIeLRsLUI2to36YdUJpxnGra+1NqW7YojmT8IOJTABdcCY01xX
	s33/lxIiVUii2dxYTEkWjS/nbUDuKJKYBryEVHKZB09brki3sen74VX8gzfBmKSgSlQpnY
	TqvEGnbw/LYxF4AR4qz8hi9t5MA15Ro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595422;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0nFpVwW8Qb/XKdtGxEQ6doda0NPGIRUjGdQoWdYK2Y=;
	b=cGWovZt+c9MbWCdaVctbcbVuSw8IDOn8aV/RyQbK1n1OtFuQPVCxdIAmXfccxROyQWbhMT
	KQ8cs5qtZIpPmgCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BgpoxU4T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=OYRKnH7v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790595418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0nFpVwW8Qb/XKdtGxEQ6doda0NPGIRUjGdQoWdYK2Y=;
	b=BgpoxU4TkSdoKeS6GrTEK0eHqEFsNMEOwaPg6j9uoHJkFM+jj038eZ+SnPPvAJKjmtvMEs
	7RvvRrhSP8t6zT/CzKqb6oY3WSQMHK8N/hw9AmggoME5lU05CcwkPA3wpQXKoZ/U46AcDQ
	4jyxYR7rbianj7doZ7BQCj5RpC1RRWM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790595418;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q0nFpVwW8Qb/XKdtGxEQ6doda0NPGIRUjGdQoWdYK2Y=;
	b=OYRKnH7vg7N6VaNUFfxSMelDIEltqszHZ6uPXO4jj05tWHSyBYhu3C7VtVP9GWS80QCi9A
	spYIC7j5cQU8PQDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3B106133F3;
	Mon, 28 Sep 2026 11:36:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id itXtBFpRumoPRgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 28 Sep 2026 11:36:58 +0000
Date: Mon, 28 Sep 2026 13:36:57 +0200
Message-ID: <87v77p6206.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tarun Noonemunthala <ntarun2000@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP ENVY 13-aq1xxx
In-Reply-To: <20260923094014.58867-1-ntarun2000@gmail.com>
References: <20260923094014.58867-1-ntarun2000@gmail.com>
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
X-Rspamd-Queue-Id: 811C321BE9
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 23 Sep 2026 11:40:14 +0200,
Tarun Noonemunthala wrote:
> 
> The HP ENVY Laptop 13-aq1xxx (PCI SSID 103c:86ad) uses an ALC285 codec
> with two speaker pairs: front (pin 0x14) and bottom (pin 0x17).
> 
> The BIOS leaves pin 0x14 as [N/A] ("not connected"), so the generic
> parser never enables the front pair and only the bottom speakers are
> audible.  The vendor driver (RTKVHD64.sys) programs that pin with the
> value 0x90170150 and runs the HP amplifier initialization, which is
> already implemented in the driver as ALC285_FIXUP_HP_GPIO_AMP_INIT.
> 
> Add a board fixup that applies the pin configuration for 0x14 and chains
> to the existing amplifier init fixup.
> 
> The pin value was recovered from the vendor driver's own configuration
> data.  The patch and this changelog were prepared with an AI coding
> assistant (see the Assisted-by tag below); the change was reviewed and
> tested by the submitter on the affected machine.
> 
> Tested on an HP ENVY 13-aq1xxx by rebuilding snd-hda-codec-alc269 from
> the Fedora 7.1.10 source and loading it: the codec now reports
> "line_outs=2 (0x14/0x17)", pin 0x14 comes up as an output (Pin-ctls
> 0x40) with its amplifier unmuted, and both speaker pairs play.
> 
> Assisted-by: OpenCode:deepseek-v4.1-flash checkpatch
> Signed-off-by: Tarun Noonemunthala <ntarun2000@gmail.com>

Applied now.  Thanks.


Takashi
