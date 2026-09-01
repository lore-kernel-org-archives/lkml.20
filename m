Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493822AD00;
	Tue,  1 Sep 2026 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788263272; cv=none; b=RBaPjwmbRUarD17U2GRgCkA54l1QSCLu+67w89TkYupuBMhy9RXmnJ5yvJyGvSB2j37E3Uw8wgvqDpijMKnC4scI26IfKj9xtP3yo00OW0lNr5XUTXm9EAW+2MFz9fPhq5WGeeZjU9Sz9evV1lMyIRrmk1NkWh63twpOYWJFZIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788263272; c=relaxed/simple;
	bh=qpPdredGSN+usz5/IV/IN0qyI7luWBI7nahUqGtRpTo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=roq61WV+gDBkK7ulVn0OZ+gUHdp5vx/aCrByiQ63oUmhtQVgh9g0+0R/hDF8F4oye08wftbfj6i9wmfFC3SNwwkvX5h6++gHTLMrtOXxwz07V/bekuRGIbwjURPSHrUnr8i/tuSX5T3YBX9J0Ozj0btD+fVSckf82+6rsoDSaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XRxEn3N/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=NoADf7c2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UEZuwob2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5lnFhsmz; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XRxEn3N/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="NoADf7c2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UEZuwob2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5lnFhsmz"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2EEF226B8;
	Tue,  1 Sep 2026 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788263264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HmdHbiHNwGlhjGDkdi/xDpuu9Mh+tM7TkBF0RfPwD9U=;
	b=XRxEn3N/os8K5vIoH3kXV3Fx1rnpXvN3XTdRU0tzJvyRYztoVta3p63OEhLLnFvYeB7IOE
	RBOJ5lgD8v4fMmEP1xdyxgRwU+WFe6sr4EvcswYHc28nzqZ6rpWnMBvIwZm+DgGWeociY/
	mM09Cd5yq+TuDYno9AoqQlF2tMZPjb0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788263264;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HmdHbiHNwGlhjGDkdi/xDpuu9Mh+tM7TkBF0RfPwD9U=;
	b=NoADf7c2d7LDoPAm1iAuwzJsNMOXPcGoPU1D+sQogGOzxXeof/sLXxRfIdekiFuDULJclM
	FNUMj8o/H/1OTvDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=UEZuwob2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=5lnFhsmz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788263260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HmdHbiHNwGlhjGDkdi/xDpuu9Mh+tM7TkBF0RfPwD9U=;
	b=UEZuwob2weXA5XBUnZHHhtpBeOjLGdQLKjN3girtVPFztFywWU9mCxT8QfhY+lLxM1NQoX
	+w15VE6avSNNkBFK8mG0rvGDbNP7XEJQa4H3nn+qFvozAN3BxYkJ34VzaSzGf8AIglLbLk
	1ylCwD+PEfpgyRnK69WRHVKYNdyPkpk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788263260;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HmdHbiHNwGlhjGDkdi/xDpuu9Mh+tM7TkBF0RfPwD9U=;
	b=5lnFhsmznXYoPS/OSCtWnJpOQfI8GsYtzsOrvqHhhIfqrBskty0bYFA4A14kmkGLEdsSj4
	uC0AKwDb3ljLi1Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7C3221369E;
	Tue,  1 Sep 2026 11:47:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GgVuHVy7lmqXTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 01 Sep 2026 11:47:40 +0000
Date: Tue, 01 Sep 2026 13:47:40 +0200
Message-ID: <87qzjdchwj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix cold-boot headset misdetection on Acer Aspire A515-57G
In-Reply-To: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
References: <20260830211038.19528-1-oleksandr.kovalov.work@gmail.com>
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
X-Rspamd-Queue-Id: B2EEF226B8
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Sun, 30 Aug 2026 23:10:38 +0200,
Oleksandr Kovalov wrote:
> 
> On the Acer Aspire A515-57G (PCI SSID 1025:1616), if headphones are
> already inserted into the combo jack before the codec powers up (a cold
> boot with the plug already seated), the impedance-based headset-type
> sensing races and misclassifies the jack. This drives the wrong output
> configuration and is audible as missing center-panned content (e.g.
> vocals) while panned content plays normally.
> 
> A genuine physical unplug/replug after boot reliably fixes this by
> forcing a fresh sense transient, which is a strong hint about the
> underlying cause: the sensing hardware appears to need a settled,
> freshly-triggered read rather than the one-shot classification done
> during the normal HDA_FIXUP_ACT_INIT pass.
> 
> Add a machine-specific fixup that, on cold boot only (not S3/S4 resume,
> which already gets its own re-check), waits briefly after the normal
> init-time decision and then forces a fresh headset-mode classification
> by resetting the cached mode and re-invoking the existing
> alc_fixup_headset_mode() path -- mirroring what a manual replug already
> does. The wait+recheck is skipped whenever the first pass already
> determined nothing is plugged in, to avoid adding boot latency on the
> common case.
> 
> Tested on kernel 7.1.9 by building the affected module standalone and
> confirming cold boot with headphones pre-inserted plays correctly from
> the very first sample, across multiple boots (including a full restart,
> and headphones inserted mid-POST rather than before power-on), with no
> crashes or warnings and no behavioral difference from a real
> post-replug recovery.
> 
> Signed-off-by: Oleksandr Kovalov <oleksandr.kovalov.work@gmail.com>

There is a recent fix-up for the same model to support the mic-mute
LED, and it conflicts with your fix.  Could you try to rebase to the
latest sound.git for-linus branch (or at least 7.3-rc1) and resubmit?


thanks,

Takashi
