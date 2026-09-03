Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEAC4A4848;
	Thu,  3 Sep 2026 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450752; cv=none; b=AgYerCnnVNxIvKnmcPmKCK17JG+isSUnXeeRhhjU1jHoqzEjOg9I1isLsxGRpLG6s7/5zbQGYBgjcu45zMbWEB1n2TM8DtzOBlaFtbHakL1cEjXxXORje65TMSpDyQBXZK2A2iJXXWka1enqJRopCJCEblkbncN/+l/g96NteMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450752; c=relaxed/simple;
	bh=0cITaemMGQFoDrxiXfr/H7yQqylaLGgPN9c6bLaQRz0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lm/wC+YWlZhT13Ac6K7+CAcFvSE7U16dvOcnNCcgSVsjL7QrER/IzQA1/XGyRrn8yvlxov4Lafo1oP4XcZSqLbEsLH3/rBvhuKMHhoSwLr2WcbZTlmgkJG2LZAw7GAvL0+44e/xDJFL/lAsym8LDZpZtdBLCy9oL991gizVl3pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=PlhGpwsB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=hbupkV4s; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BCRNQ9d1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qMaoNY1A; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="PlhGpwsB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hbupkV4s";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BCRNQ9d1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qMaoNY1A"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11D3321EF7;
	Thu,  3 Sep 2026 15:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788450745; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSFDup6reXmLOolzT858Kw/ekvMtQB7bjAh9vxNG4/U=;
	b=PlhGpwsBAUmKMRVrvsZlJg4d12+wdUyNSzKUWeaxsWL5kScQu0FMxqSRzhtoQ/cKIY2lPW
	4Lm3SWnhDpQOWO/xX2lRk0sWs1vNBR6bO7Pl0FiXKPD2u0mGhWnRDqViRj2itBJwyUXud3
	HUoy0bcsO/nOveqNXyrYDLIZQ8vrdQ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788450745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSFDup6reXmLOolzT858Kw/ekvMtQB7bjAh9vxNG4/U=;
	b=hbupkV4spDwhEnYpJkyeqCm0u3aVfGljT/5Dy6KzVBIj98dE9p2ogcYVHPIm/1ZbZtjUlE
	PWmxOhb/1HHsVbBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BCRNQ9d1;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qMaoNY1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788450741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSFDup6reXmLOolzT858Kw/ekvMtQB7bjAh9vxNG4/U=;
	b=BCRNQ9d19t7Df90CkhugfIzfPFGBwH/27cAf7WRxFWPyXV6dIEqvfOeIIN5XjJT3chwP57
	2CFidmDXd6Mg3+pEi3xA3OhzRPcmc3H9HU28ARWWwgnI5CbBzcVOCrBjtiHcuLqoRNi3XM
	qrzaL8Akkf4l1kXM8Z9jKLcgB2OO6jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788450741;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dSFDup6reXmLOolzT858Kw/ekvMtQB7bjAh9vxNG4/U=;
	b=qMaoNY1AFjzCYL1Qm17V9FJaCTQy/7MfKE0ua+Qjy4IuH9GbDWXjhWw6Vf3rnLFFfxWZZM
	mf+5H1nMvb6I4SDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA2B2136D9;
	Thu,  3 Sep 2026 15:52:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KogTMLSXmWpvaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 03 Sep 2026 15:52:20 +0000
Date: Thu, 03 Sep 2026 17:52:20 +0200
Message-ID: <87qzja72ob.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH 0/3] ALSA: usb: Avoid embedded URBs
In-Reply-To: <20260903145648.1914352-1-tiwai@suse.de>
References: <20260903145648.1914352-1-tiwai@suse.de>
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
X-Rspamd-Queue-Id: 11D3321EF7
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Thu, 03 Sep 2026 16:56:42 +0200,
Takashi Iwai wrote:
> 
> As the recent fix for caiaq driver showed, some other USB drivers need
> to be fixed for their use of embedded URBs, too.
> In this patch series, those are converted to the dynamically allocated
> ones via usb_alloc_urb().

It turned out that 6fire patch had a serious mistake about copying the
data.  Will be fixed in v2.

Also, I cleaned up the resource release code in hiface driver in v2,
too, for avoiding silly mistakes.


Takashi
