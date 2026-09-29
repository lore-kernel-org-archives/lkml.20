Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D372459E1;
	Tue, 29 Sep 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688101; cv=none; b=M3hodZ31Y2fszCpPAi1fmS/mx25EaMp4GtUm8d61+PuMtvElN3N5FfuhPr5aAY/3eZ0pAD1s7iMDHrW6cb6aFP4dIeE59bM2VTjSFhQgP+THAjAj0zSk0fZ/+02YqZ3h3O8pA8F6u2yIjkHc0gGsd4hwSJQBycpRtT98D85kIqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688101; c=relaxed/simple;
	bh=4fUb+FBTDaJCnRT+TrqQyLEWUoHEBgK6iOcfDMSaFqc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mqlCOXQmrwYPhVoVubRoRCM/PlDsodAhhPSPeEyOvtLYAnKuDF4alvqRz4mZ5bNdnERLxPpJCmqr/rnxzwE65bDBr2dYegau7LH4/LliRa7dPs0edK+Hy1pO9rVKc6BhhsAHafNOepkmX5jRg1uv0+sqTplPnZ+Dt76xbPZB2zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gKHv9/5R; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KLyWKnLy; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VjjKdJ3j; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m1JhuCQ0; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gKHv9/5R";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLyWKnLy";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VjjKdJ3j";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m1JhuCQ0"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C197E1F7C9;
	Tue, 29 Sep 2026 13:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790688094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCenjerG6qhlAFfM4z9/qyiF93TZR3Dk/p581e8+4/Y=;
	b=gKHv9/5RXBhPM73c4Nl6glOPueNBPE1DD4VCSrY2NK80TPQQVT9II0ItD3jOKVSP3GGetw
	7gqBJfbgZZYUdOCYpl4+RLGP0oMyurrLij0Jfdb2DpEH5PEJirKfsjYHBXKo5/w3+gZwDV
	+TLUJPe+f/igU148jEQvnltjrLDREe4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790688094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCenjerG6qhlAFfM4z9/qyiF93TZR3Dk/p581e8+4/Y=;
	b=KLyWKnLy5M1oCniBphnsgIF4gwRrBmbIHGHeVtntIVlVSrl9GfCkmcJb8zPbnV5uDYIDrU
	AttSdi5esuHGcaBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VjjKdJ3j;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=m1JhuCQ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790688089; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCenjerG6qhlAFfM4z9/qyiF93TZR3Dk/p581e8+4/Y=;
	b=VjjKdJ3j3zAHW16roARHP64bacvN4i8eXxa+N/RM87+mDMxIMWXW7vyDNQMn1kKOvFvUHP
	pHAt8bwUsYMR70XyV27Ud7ICy04By+aGvtm/hVQ0fOulBwJdD3BjlGRS0ykTvLVpw8LSDy
	92CJlxOF+fFy2ZH/FMUUKXYuJOHTZQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790688089;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rCenjerG6qhlAFfM4z9/qyiF93TZR3Dk/p581e8+4/Y=;
	b=m1JhuCQ0VrUXJyiHo+wPknRk0za8RhOoNXtc4EBEdUW+1CSEA1wTzO8ZlA2n3ld8LFy4+x
	UmW5brwVw62NRkDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F431136E4;
	Tue, 29 Sep 2026 13:21:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U+17EFm7u2qBFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 13:21:29 +0000
Date: Tue, 29 Sep 2026 15:21:25 +0200
Message-ID: <87bj9g19d6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christian Ruppert <arc@gmx.li>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>,
	Neil Andrews <neil@androos.io>
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
References: <20260919151840.24371-1-arc@gmx.li>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C197E1F7C9
X-Rspamd-Action: no action
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
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmx.li];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.li];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,vger.kernel.org,gmail.com,androos.io];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 

On Sat, 19 Sep 2026 17:18:37 +0200,
Christian Ruppert wrote:
> 
> This patch set adds support for advanced mixer features of the Audient
> EVO4 audio interface. The code is structured so that support for the
> EVO8 (and potentially other Audient devices) should be trivial to add
> but I don't have access to the hardware and no way of testing them so
> they are not supported by this patch set.
> 
> The third patch in the series (Add Kconfig option for Audient EVO4 mixer
> quirks) is optional. Other mixer quirks are compiled in by default and
> don't provide Kconfig options but as this one adds a few hundred lines
> of code I decided to provide this last patch as an option and leave the
> choice if such an option should be added to the subsystem maintainers.
> 
> Christian Ruppert (3):
>   Fix Audient EVO4 master playback control name
>   Add Audient EVO4 mixer quirks
>   Add Kconfig option for Audient EVO4 mixer quirks

I merged the two, but dropped the Kconfig patch.

We have no Kconfig for other mixer stuff, and most likely the users
will enable simply all mixer supported devices.

It might make sense to introduce a Kconfig if we build each vendor
mixer stuff as an individual module, though.  Until then, let's try
to reduce Kconfig.

BTW, do you see an issue Faaris reported for the recent kernel?


thanks,

Takashi
