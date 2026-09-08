Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3686538D8F;
	Tue,  8 Sep 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788877548; cv=none; b=CttNQqaMD+W0Wpkrjdm4H+k1lb/ErutVQw1Eezlj7F4KtvnEKhcHx6wuc9cbdcHRncMhEHAQOmZ4Pnj/o9lFvKAPA+Q9UpJAIfulJnwwdI6V6mJpMuLK9X8NEi+awEOC1iYxjbc5VhEE/z2yA3LPDRqbtXhFGied0ieRO0Uj1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788877548; c=relaxed/simple;
	bh=SBlrYUc5bktRNySDzMbsWFnudT8zvDRLFqwFtIeMcPA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cl9aHRkqLkbPBgQDjS7QM1M+HGJj92x9a1AF7bmEjsFskLYpRRv/O8/n0xJ+qelSWNU9jPuT15ZACTZyy7OU9KARwNyPagDmlKFNOFAm3EyteSuVa02t3vLZOnc9gCJXwJCtWLgBIioRfvNJl5H++PPJ/cjaJl4vfzN0y26UX5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hlo3wOf2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IRH/Go4r; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tQodyI59; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sPONlnVx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hlo3wOf2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IRH/Go4r";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tQodyI59";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sPONlnVx"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 96F391F84C;
	Tue,  8 Sep 2026 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788877507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCM8OSlnfGjEuWyXAzlyV0IrTBlxNeBmK3x23X8/D3Q=;
	b=hlo3wOf2CQh1Ou0LOuGoZiW0iNWftq/2gqdCELs/kR5JscgZNfkdtR2bZV8hrA5E8sgfWw
	pXGrXNhHCV+8SVA1359W8KzQbttbY7MhP4mXjcxHKlRrNtpxQZThrDHc5f1Z3CFCTBkDDX
	OoEPFC5GFU6eeHN1AKvqasNiQICaGls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788877507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCM8OSlnfGjEuWyXAzlyV0IrTBlxNeBmK3x23X8/D3Q=;
	b=IRH/Go4rWry0Cvxz1wvGtX/UFTTmAgRYa25qBzpA8T+5ElkNt3CMhM3F+hz6BLiZIXPii8
	CqENVAtnxBjkYgCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=tQodyI59;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sPONlnVx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788877503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCM8OSlnfGjEuWyXAzlyV0IrTBlxNeBmK3x23X8/D3Q=;
	b=tQodyI59gyFGpBoRIcrcxSUOqVuQT3bvFp2vUz7XIbE/f9NDWqXebYiwyuhIo/rc3LzV5Q
	2pH7Tc2xexi8LrPJdbPJy2vgh1kVeE5Do2HeINH/6l9o5SuzAn0DBGSqOseYiAXSF/ZYS0
	lmKp5QkfJV1cEC6+mr0ZCIqswQueYJ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788877503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCM8OSlnfGjEuWyXAzlyV0IrTBlxNeBmK3x23X8/D3Q=;
	b=sPONlnVxot92X9qpK1MGUlBEDcRuShH5pycFYVfDmEes8s3DGg7cynPyDAANR6nIXxPR6Q
	UBuZAyu0/j9jP1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61AB61364A;
	Tue,  8 Sep 2026 14:25:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cMYvF78aoGrNBwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 14:25:03 +0000
Date: Tue, 08 Sep 2026 16:25:03 +0200
Message-ID: <87h5jzq0qo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>,
	linux-sound@vger.kernel.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Report a change when only the channel status bytes move
In-Reply-To: <20260908134153.1614273-1-sammiee5311@gmail.com>
References: <20260908134153.1614273-1-sammiee5311@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: 96F391F84C
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,gmail.com,vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Tue, 08 Sep 2026 15:41:53 +0200,
HyeongJun An wrote:
> 
> The put() callback of "IEC958 Playback Default" returns whether the
> converted register value moved. The convert_from_spdif_status() helper
> reads part of the first two channel status bytes and none of the last
> two, while the get() callback returns all four. So a write that lands
> only in the bits it does not read changes what userspace reads back and
> reports no change. Of the 31 bits above the mode bit, 20 are such bits
> in consumer mode and 29 in professional mode. The core notifies only on
> a positive return.
> 
> Toggling status[2] bit 0 on an HDA HDMI codec moves the read-back from
> 04 00 00 00 to 04 00 01 00 with no event. Toggling the non-audio bit
> in status[0] gives one.
> 
> Compare the stored status as well, the way the ac97 code does. The
> write to the codec stays gated on the converted value.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5

Applied now.  Thanks.


Takashi
