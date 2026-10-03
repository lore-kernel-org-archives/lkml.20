Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC437B00E;
	Sat,  3 Oct 2026 09:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791021295; cv=none; b=izM7ASwcEqMLncpPw0WjAwW3gBfoypz8tCyfC02k6Lu6hl9texOuk9xPfyc6kuQFmDKfMBoSs6hgSFzKqEtAIANXBMzT+dnNyeTp+9a8ecLhRI7hxtQUgC6mLWcANe9F0JgECf5qGzY2J1lcvJCAgYie/FRVMk66ZPNP6+Qwk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791021295; c=relaxed/simple;
	bh=n1Roo1hS/xbYYeM9rPswI7ldqnH4ow/4w/RxEGmMLn4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjHPl4jT+kI+rS0ckMcJ6Eu6x/T/GtKccb6xMwb3O0eaxpbOkch4zgJi1i//FtLA1W3tBEmAEGcspaRBbE1k7Ema5K3X+BVFk7fCWopsPvrJM+fduBhbe8BApcUnL19s4N1NRcTe6/zHFxZTRP53KCxTdqS1EI31Z3THJo6F1X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=abOGKJQH; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xOhXuen7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=uzOj1EDp; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2lHA+78w; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="abOGKJQH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xOhXuen7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uzOj1EDp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2lHA+78w"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7F9241FECE;
	Sat,  3 Oct 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiR9WXB+aVGJ/YAqAMbw9jBO67B7we/1T5SgLkrHXis=;
	b=abOGKJQH8YqBZBhmhHYBLnTFmApZs1YSK8gvOYEKOdKJjclsC9ysy1kkd+XmPkezNqTSad
	FyFff9hZlT4bFobOsHfzrgLrf1iw7hseHqmcksW/bYaAaS9/UVq7Vae7Ooy1NhdCThGCTN
	gytu/xcPJTcimHrk1utt3FQQ4BzmODs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021287;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiR9WXB+aVGJ/YAqAMbw9jBO67B7we/1T5SgLkrHXis=;
	b=xOhXuen7FVhFvmJ0UUaUk9AgKlnn0wZG8iVYV7wPYgYN55RLzdzkE1It5yDEjsE1RepMo4
	dJSiwib8KWdGUFAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791021283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiR9WXB+aVGJ/YAqAMbw9jBO67B7we/1T5SgLkrHXis=;
	b=uzOj1EDplmXZXlBNMswFRxWkJ0bOTO7Ml6eA0iTZxzBZPaUXrc9A21/lerXxDvZ4x9drCX
	ZL8ix+cz495HlBOZUhn6pz6RxR7mHG1G7TYt1K3YL72eICDOgr4jD03ZXqyhn5Fi/n/bRA
	uLLlIK0d//WAQNFTsLK6dqD5OmlnjMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791021283;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiR9WXB+aVGJ/YAqAMbw9jBO67B7we/1T5SgLkrHXis=;
	b=2lHA+78wkiProkFpD5NY8C70QMe8AAs+9rZUDLo2tw4t7srEfw42CFiG0YJY98SoittxC1
	aGv78TegiFQJY/Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32A0213712;
	Sat,  3 Oct 2026 09:54:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WHVdA+PQwGoTSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 03 Oct 2026 09:54:43 +0000
Date: Sat, 03 Oct 2026 11:54:42 +0200
Message-ID: <875wzjxg65.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Denis Yakovlev <mfthesun@vivaldi.net>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Enable headset mic on HONOR MagicBook Pro 16 2024
In-Reply-To: <20261002221850.12443-1-mfthesun@vivaldi.net>
References: <20261002221850.12443-1-mfthesun@vivaldi.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Sat, 03 Oct 2026 00:18:50 +0200,
Denis Yakovlev wrote:
> 
> The HONOR MagicBook Pro 16 2024 (DRA-XX, board M1020, ALC256, SSID
> 1ee7:204e) has a combined 3.5 mm headphone/microphone jack. The BIOS
> leaves the headset mic pin 0x19 at 0x411111f0, so the codec parser
> builds no capture path for it, and it leaves the jack switch
> (coefficient 0x45) in the TRS state, which cuts the microphone contact
> off from the codec. A wired headset microphone therefore records
> nothing.
> 
> Configure 0x19 as a headset microphone (0x03a1113c, "headset mic
> without its own jack detect"), the same value already used for the
> sibling M1020 board (HONOR MRB-XXX) and by the VAIO quirks, and chain
> to the generic headset mode handler, which detects the CTIA/OMTP
> headset type on every jack event and programs the jack switch
> accordingly. Pin 0x1a is left untouched: there is no evidence that it
> is wired on this board.
> 
> Assisted-by: LLM
> Signed-off-by: Denis Yakovlev <mfthesun@vivaldi.net>
> ---
> Tested on a HONOR MagicBook Pro 16 2024 (DRA-XX), Ubuntu 7.0.0-34, using
> an out-of-tree build of this change, with wired Apple EarPods (CTIA): the
> microphone records after several cold boots with the headset inserted and
> after hot-plugging; without the change the analog capture is digital
> silence. The headset type is detected as CTIA (coef 0x45 ends up at
> 0xd489). The speakers (including the "Bass Speaker" control from the
> speaker fix) and wired headphone playback still work. OMTP headsets were
> not tested (no hardware).

This looks like a fix of the existing quirk.  Could you point to the
commit via Fixes tag and resubmit with it?


thanks,

Takashi
