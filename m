Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C34A5C59;
	Thu,  1 Oct 2026 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867183; cv=none; b=in3w7PK4vkdG5W//kkMjaapM8VUdElIhexRGXfLTtXU0ToniC1HDQebcrn1AtPVijiO2ByAJNl1eqfrfATjn66a62Z5FfDbjqhaOrw8e/ZgFkEFT+z2cX2YZUYXDwGCAJ3fEhPBjISJedSq0Z6Urom3xz82rJv5eJiP1CTftB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867183; c=relaxed/simple;
	bh=rcBSxfFI3Xa9wehey/O91tmbMkt2W9SKHF/85tu/loA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONtnrgKghjCnKWY3AeJDa7rKEf+i1DcIdi6Jn/6EtzH8LljY4/FOXhXSCJJ7mEIr4N8M3Mcbpzv040dqDImIWKgFSrAQJNj6H47u3yttc9gAV9msug5v+YZ7ggvKZ9R9DWafVJz5ZorpN5Gnfs4WrSbaiqm+LflYxUNh3zer9xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OOW0Vx7W; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=TUxJZY5d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=H2qxIrXO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=OvxZNPaJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OOW0Vx7W";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TUxJZY5d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="H2qxIrXO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OvxZNPaJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 869641FCE9;
	Thu,  1 Oct 2026 15:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+bK/GhbzESXh70gVq/JCMPpBsYVqXEwwA0wUoWmRc=;
	b=OOW0Vx7W/H/RXU3jb0ZvK81xipFPtnwfXMxtI6lFbGkwD8knUeX6QOdvnfhoekcFtvEPN7
	6+6p5KVeGh+LVMs+KBRru/ALhYOVeFx+X0KvNnKJdFn6ctVmrGH4sXUBuCfv2IOSG/M4Vk
	PJhg7NUCNHpkKNSVuNlsEw4HKl1sxrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+bK/GhbzESXh70gVq/JCMPpBsYVqXEwwA0wUoWmRc=;
	b=TUxJZY5d0pQ2E1uar5mUg3EQ+/8WusZnFG7W9HZDuk/xVe12RbWasdyeP1ZEAb+v8QidHn
	EL+PSEYv9HJceJBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790867170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+bK/GhbzESXh70gVq/JCMPpBsYVqXEwwA0wUoWmRc=;
	b=H2qxIrXO5sEYozEsNgZFGexc8vvAY223bV20C0PgfFINMidaAeR5+/O+TC470u0oBXf2Gy
	CueC9MFiCZlarmd9o5Btx5GmisHVxz251Lz1qm0hboRLNEnYl46H14f2ubZ77LHA9D82c5
	yAwbkUTsw2FqJTNNdYDjPnMGR5RDenQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790867170;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jw+bK/GhbzESXh70gVq/JCMPpBsYVqXEwwA0wUoWmRc=;
	b=OvxZNPaJm/y2s0Hyc+Gfa+9ebFp/uNPztmIXs/naVhJOU7jDe44R+zDjo7E7ZSbLCe5+Dy
	wDJfoBadn7r3fgCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4A3CC13B83;
	Thu,  1 Oct 2026 15:06:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jpWACOJ2vmrFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Oct 2026 15:06:10 +0000
Date: Thu, 01 Oct 2026 17:06:09 +0200
Message-ID: <87y0ch1mvy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: core: Make sure to call snd_card_disconnect() at freeing
In-Reply-To: <20261001131810.527650-1-tiwai@suse.de>
References: <20261001131810.527650-1-tiwai@suse.de>
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
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 01 Oct 2026 15:18:09 +0200,
Takashi Iwai wrote:
> 
> When a card object gets freed via devres, it might be freed without
> calling snd_card_disconnect(), and it might forget to release some
> resources such as the procfs that gets deleted at the disconnect call.
> 
> Add an explicit call of snd_card_disconnect() at snd_card_do_free()
> for assuring the preparation for cleanup.
> 
> Fixes: e8ad415b7a55 ("ALSA: core: Add managed card creation")
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> 
> This patch is required as a prerequisite for the recent cleanup series
> to use auto-cleanup:
>   http://lore.kernel.org/20261001110447.486782-1-tiwai@suse.de

Scratch this (and the series above).

It turned out that this can be problematic in another subtle way.
Namely, when snd_card_disconnect() is called from the card_dev's
destructor, it can double-free the card_dev via device_del().
Skipping this call doesn't suffice as dpm_list may be still unbalanced
without the explicit call of device_del() beforehand...

A new fix and another series of cleanups will come up later.


Takashi
