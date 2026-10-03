Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF835E95C;
	Sat,  3 Oct 2026 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018696; cv=none; b=gknQrf+kKlW9wQ/GX78S8Bn81faUCi3yT1Xl//I0p7K0OM4LanNXD8bmPvgEWLBfD+fl+C29oe/I0BJK9LRnaj7/r091B5mT6Z86RaGQb3OMJ0RcsdryrwIS0fRjumLxeO3luPdVB+xSA/HwSg0XmM73ysAVXYA4BtIw08QqPR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018696; c=relaxed/simple;
	bh=xh4E+cKzKr0xM/iUH4paJ5O7j/ZSx49tcG5w6MK0Xvg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tfxw+G0lFHU5aZzYFKB0MqCigizoUn5Vzt6TfFftM8Us+oQWy6SAXR3ThSs1h1tTrWKRDnEY54M8EQ08OjSIW3sclw4Hx4QnxVJrbQHCbPkfoRhPyrGMv1YRfXJXwKNySMxkFswEh/4Gswjmxz7Wjh3AbT3qHdnCZvZEOAv1lAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QuytndAk; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XsKx4zBY; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FDP5Wdq+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IKrA7lyl; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QuytndAk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XsKx4zBY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FDP5Wdq+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IKrA7lyl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1C75621D58;
	Sat,  3 Oct 2026 09:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wsCCG8PCwMR0InBn+s05+wDALh9lm/8DQ83l2hkc4V4=;
	b=QuytndAk+mbskxqnFj+pTEIR9mFTw5OhKEkCc4LIUZH98bVkuvR1v1ICF1md72AmrYSVxu
	Od78dwF4rKlB9lAsEZldZkh1ZUUK3iP5b0Yv7xg6JHh5ugxTRehms8LYotvqgvir+YMbQV
	DSLgVd8jdZoTx4aUZHVy2DGDkxi4/7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018689;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wsCCG8PCwMR0InBn+s05+wDALh9lm/8DQ83l2hkc4V4=;
	b=XsKx4zBYeK+M/OV+3PjFa0BHjD/gPLZtpbaPCCuQtC1Nl744Fddoab4KE3JtGSc7qz0Ko2
	JbUjlSmTudrkizBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FDP5Wdq+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IKrA7lyl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791018685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wsCCG8PCwMR0InBn+s05+wDALh9lm/8DQ83l2hkc4V4=;
	b=FDP5Wdq++8DFI22IkEDshdhR+2+LnCMCaFN5kmYYJFc6LhXLqjWVNsSa6nsGf9v5mJBncA
	VQfSa+2XG5LNKrFSe8hAJNLJTdoCkBo3AwAbwGs3Nw2K8dDob1TyCvV8VI+BJasOuz42G6
	xeLm8oRd8c+iu7B8Ab6PM/ML8LMi5pE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791018685;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wsCCG8PCwMR0InBn+s05+wDALh9lm/8DQ83l2hkc4V4=;
	b=IKrA7lylzaj+4PBLKNwNh2a3+1frCqm4bPg+s8TNzGevEEJYO0fgPKhbPMhId9N/gG68c7
	8pXZ8Uo5HQ30Q3DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C6AF813712;
	Sat,  3 Oct 2026 09:11:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m1xJJ7zGwGonHwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:11:24 +0000
Date: Sat, 03 Oct 2026 11:11:24 +0200
Message-ID: <87o6dbxi6b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matus Gajdos <matuszpd@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: Add native DSD support for Cambridge Audio streamers
In-Reply-To: <20261002125237.82188-1-matuszpd@gmail.com>
References: <20261002125237.82188-1-matuszpd@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 1C75621D58
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Fri, 02 Oct 2026 14:52:37 +0200,
Matus Gajdos wrote:
> 
> The Cambridge Audio streamer advertises the UAC2 RAW_DATA format on
> altsetting 2 of its playback interface, but without the DSD_RAW quirk
> flag the driver exposes it only as a SPECIAL format that cannot be
> used.
> 
> Add QUIRK_FLAG_DSD_RAW for the device (USB ID 22e8:ca10), so the
> altsetting is exposed as DSD_U32_BE, enabling native DSD64/128/256
> playback.
> 
> Tested with: gst-launch-1.0 filesrc location=file.dsf ! \
>                             avdemux_dsf ! dsdconvert ! \
>                             alsasink device=hw:2,0
> 
> Signed-off-by: Matus Gajdos <matuszpd@gmail.com>

Applied now.  Thanks.


Takashi
