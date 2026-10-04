Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA923F39E2;
	Sun,  4 Oct 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791139806; cv=none; b=gBHUtoP3mzbIhMQutrPe6sQMYvJ++iQD+dOTkaOTh1TBtoA8gGQ6Rck7dExLNtAFTfvLx4yDEH78B0PobaEet+GWdUdMcJ0RFFV18JuIE0uT1PNK4jNd7WxvXaunhXVmlF3957ETzUAyLjg0TL0hZIwXGcHNz7TOjyXmBVfXV7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791139806; c=relaxed/simple;
	bh=O4aKhDBfknhVZhb4ii6YfAOZ8M7M5CSZB5P9em7YZS0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bb5fsMVbkl/pBX6eLGprMdMqEdHjYmvtFuv/sNvrm7MFHqhUi0sdw4visac6c6RKk9KfQ2zr8WtAB9x1Vb1Et+Vy5peO5ZXPYchMzOiZ/CxNoB9h2GKAuvFmA1HTgp2j5ijNMUSY//f5XIJV36Gc7oLHqkQXVtDuxewD7DAYexU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KYn2L462; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=LEcSbsRW; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=lxNKHYVd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jGYVH6Gl; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KYn2L462";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LEcSbsRW";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lxNKHYVd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jGYVH6Gl"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 927D01F38E;
	Sun,  4 Oct 2026 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791139798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0FMHvEZI6bIX+cEHjkIlTp9IChuHackaQd04yJ9HA/o=;
	b=KYn2L462BkAvaaktyj4dzxXkp2Vpr5WxQFR5V5RFdeKgFVE/kvgtQTjMs6f4iy/YeLMeAI
	7fjBmKLE9IJPLsAEjHlkzhcraKW2qLlJ/AeNew+dh3EBQ/28lctBwreuAXq9QUD0GXHUE2
	t+VA+uTDjd/VtrojNdFxS0ACR5cIm98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791139798;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0FMHvEZI6bIX+cEHjkIlTp9IChuHackaQd04yJ9HA/o=;
	b=LEcSbsRWoVruih9D2sSIP/F2GSx7yRspskWy4xPrJW8e6haXTeEVftCNzLPjdHFWimuelx
	h/qWsK3YtAiO3/Aw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lxNKHYVd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jGYVH6Gl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1791139794; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0FMHvEZI6bIX+cEHjkIlTp9IChuHackaQd04yJ9HA/o=;
	b=lxNKHYVdh8fpQBq6Mp0L18Y8I9MkKPFhTm1ycAM3GueRvaQyS9r1yCI0KTWwxYzu1k3A0+
	TQMbrXFM8hUhJbrWiauD5vVX+xsoqBLvKb+DC+sai803QGex9Og756Q+9HVjg8Cd0rlOAy
	putVENqQrToMONCad9g185eR9SVKrqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1791139794;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0FMHvEZI6bIX+cEHjkIlTp9IChuHackaQd04yJ9HA/o=;
	b=jGYVH6GlmBdTHrOzl3il7//GMhpdaXEzYd1OXsSMoq48XIkTDuILx6Uzl5EROETxjAeOe1
	5X+JlvENmmXVanCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 32DBB133CF;
	Sun,  4 Oct 2026 18:49:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 1ciCAtKfwmoiagAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 04 Oct 2026 18:49:54 +0000
Date: Sun, 04 Oct 2026 20:49:38 +0200
Message-ID: <87y0cdgv25.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Steven Kendall <skend@chromium.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
In-Reply-To: <CAB1bpFDsVLApsW6nYOyLQYx83o9NpDrpKwoK_4KdoCV=GeWv=g@mail.gmail.com>
References: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
	<87fqzan7jp.wl-tiwai@suse.de>
	<875x05lkfl.wl-tiwai@suse.de>
	<CAB1bpFDsVLApsW6nYOyLQYx83o9NpDrpKwoK_4KdoCV=GeWv=g@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 927D01F38E
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[sashiko.dev:url,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 

On Mon, 21 Sep 2026 23:00:28 +0200,
Steven Kendall wrote:
> 
> > > The code change looks acceptable, but the patch description gives too
> > > little information.
> > >
> > > And, should we apply it unconditionally all models with this code?
> 
> I've submitted a v4 that only applies the delay to this specific model
> I've observed the issue on.
> 
> > ... also please check sashiko's review
> >   https://sashiko.dev/#/patchset/20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61%40chromium.org
> >
> > They aren't always correct but often give good hints.
> 
> I looked over the AI feedback and I'm not sure what the best action to
> take is. It seemed like it was kind of a broad criticism of delayed
> work in general, which already exists in the same file. Now that the
> patch only applies to one machine and I've tested on that one machine
> I'm more confident in the fix but I'm open to doing additional
> testing. Or if there's some tooling I should be using to make the
> abstract "timing issues" more observable I would love to learn more
> about that too.

The review to v4 showed about only the usage of cancel_work_*(),
and the suggestion sounds reasonable.  Those new cancel_work_*()
should be put before disabling i2c.

BTW, at the remove patch, maybe better to use disable_work*() variant
than cancel_work*().  The existing code is old and they were before
disable_*() was introduced (so they should be replaced, too).


thanks,

Takashi
